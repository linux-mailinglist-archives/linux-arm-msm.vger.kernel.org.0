Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02C3E24DA4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 13:11:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726448AbfEULLG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 07:11:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:54054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726042AbfEULLG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 07:11:06 -0400
Received: from localhost (unknown [223.186.130.65])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 19BDF2081C;
        Tue, 21 May 2019 11:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558437065;
        bh=ATO0mafowpmS9lD2uJVlmt4JcavGsNrwrYgrfOLt7bg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bD29SWe1toCHHRKmxc1/VKp/HxszwXcFJ8pAR41Jds9NGDnY/ixUY65YKHffhKlMc
         64B4hRD0lZL9Z+vtUaZ0fb5DZ7JcubCdye8vRDxnEBpaxDK6w2/cte69FA6+LYG1pQ
         Z/vnK0IFGJWk4aFuA0GP98Ofr4NSJ5W9vuXS7ENg=
Date:   Tue, 21 May 2019 16:40:58 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/4] soc: qcom: Add AOSS QMP driver
Message-ID: <20190521111058.GG15118@vkoul-mobl>
References: <20190501043734.26706-1-bjorn.andersson@linaro.org>
 <20190501043734.26706-3-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190501043734.26706-3-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30-04-19, 21:37, Bjorn Andersson wrote:

> +#include <linux/clk-provider.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/pm_domain.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <dt-bindings/power/qcom-aoss-qmp.h>

I would have preferred this as first one, but this is fine too :)

> +/* Linux-side offsets */
> +#define QMP_DESC_MCORE_LINK_STATE	0x24
> +#define QMP_DESC_MCORE_LINK_STATE_ACK	0x28
> +#define QMP_DESC_MCORE_CH_STATE		0x2c
> +#define QMP_DESC_MCORE_CH_STATE_ACK	0x30
> +#define QMP_DESC_MCORE_MBOX_SIZE	0x34
> +#define QMP_DESC_MCORE_MBOX_OFFSET	0x38
> +
> +#define QMP_STATE_UP	0x0000ffff

I prefer using GENMASK(15, 0)

> +#define QMP_STATE_DOWN	0xffff0000

GENMASK(31, 16)?

> +/**
> + * struct qmp - driver state for QMP implementation
> + * @msgram: iomem referencing the message RAM used for communication
> + * @dev: reference to QMP device
> + * @mbox_client: mailbox client used to ring the doorbell on transmit
> + * @mbox_chan: mailbox channel used to ring the doorbell on transmit
> + * @offset: offset within @msgram where messages should be written
> + * @size: maximum size of the messages to be transmitted
> + * @event: wait_queue for synchronization with the IRQ
> + * @tx_lock: provides syncrhonization between multiple callers of qmp_send()

/s/syncrhonization/synchronization

> +int qmp_send(struct qmp *qmp, const void *data, size_t len)
> +{
> +	int ret;
> +
> +	if (WARN_ON(len + sizeof(u32) > qmp->size))
> +		return -EINVAL;
> +
> +	if (WARN_ON(len % sizeof(u32)))
> +		return -EINVAL;
> +
> +	mutex_lock(&qmp->tx_lock);
> +
> +	/* The message RAM only implements 32-bit accesses */
> +	__iowrite32_copy(qmp->msgram + qmp->offset + sizeof(u32),
> +			 data, len / sizeof(u32));
> +	writel(len, qmp->msgram + qmp->offset);
> +	qmp_kick(qmp);
> +
> +	ret = wait_event_interruptible_timeout(qmp->event,
> +					       qmp_message_empty(qmp), HZ);
> +	if (!ret) {
> +		dev_err(qmp->dev, "ucore did not ack channel\n");
> +		ret = -ETIMEDOUT;
> +
> +		/* Clear message from buffer */
> +		writel(0, qmp->msgram + qmp->offset);
> +	} else {
> +		ret = 0;

Isn't this redundant?

> +	}
> +
> +	mutex_unlock(&qmp->tx_lock);
> +
> +	return ret;
> +}
-- 
~Vinod
