Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A52872301E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jun 2023 21:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235876AbjFETr6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Jun 2023 15:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235869AbjFETrv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Jun 2023 15:47:51 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FE18F4
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jun 2023 12:47:45 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-77499bf8e8bso202920739f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jun 2023 12:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685994464; x=1688586464;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CIqcWezF5DbL9kbCtnrWj6Qycb88Kq0qilAfYATVCUc=;
        b=rZxRdp0eW9jJRcVN1bDfdYocssgwuz6YOSdnGAihVAPu/t7Tl5eGNQjDco+RrO5wEi
         gBxOncmiWbzA36vGgZwT7xErqOKJb0sLysWpX2cM9YLd//XB3021Wlw8oAl0xTSdLmfS
         +Et4ztUCGb511SZeKN9cPwjR9pzttTZx8tM9K0K6Qb4Gm76xbdQptom17CR9y9umBits
         edMht9OY2Cty8YtD7NMIzLVOCVZgvw9f6gA2FKDjxvt4SzGOBGzejlpg6mwbF1DOCgvm
         06t6ycOV1JGzoNWQfuGy6pgb1/qm9Jf/iEzMId7qKk5RKdkBX9bcUHwwc3Kluj2DBfcw
         N0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685994464; x=1688586464;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CIqcWezF5DbL9kbCtnrWj6Qycb88Kq0qilAfYATVCUc=;
        b=iD01GLEKJIxSvUhKFRkjkjdKLP1R71/JU6zfMaNWHyk2f+jY+6DftjG3CgYDqY8HI+
         1Q6PzVMtdcMHeh23bWGkZkAOke+OnGF4VT4P+8YRPJ4elHl+8S2PUjDfDamVgJUnDbFb
         XzPX1gZcNoIxcQE40TEDRpbUSkvZcHpNiyZti8cS1qNocg2Y62aFf0Y5DPZQnWQhxuDh
         WomHwVOG6DI7blvuXK40rSrOrLoug0oA0DfNhym1eFwJ+yZ0mmvKcC+saQXrvD/kRNSg
         RMmKB2er9WfVvwgE6USuEoqxF5fgkk2QOdmPXCabbAWpLuYYXw7S3NA0yPIeRXg7d2Df
         wZ4Q==
X-Gm-Message-State: AC+VfDwGnjcMgaMV20BCuzUsx4ofGpjN5deRenR9Xw1QoaV8/UuDvj4U
        bKYKrDXvMrd7vOMFvNbrMUPAEw==
X-Google-Smtp-Source: ACHHUZ77Hyp6t49ZxSWHlOn3SLTL8HoNLc5nxoJGuVJpjGHNM1/sSwCdqoaFAeeRFdgBvlUBguIkKw==
X-Received: by 2002:a6b:7e48:0:b0:774:8210:3c6a with SMTP id k8-20020a6b7e48000000b0077482103c6amr159308ioq.11.1685994464529;
        Mon, 05 Jun 2023 12:47:44 -0700 (PDT)
Received: from [172.22.22.28] ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id l9-20020a02a889000000b00408b3bc8061sm2451565jam.43.2023.06.05.12.47.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 12:47:44 -0700 (PDT)
Message-ID: <cdaec6d1-4521-7119-4afd-d440aee8b9dd@linaro.org>
Date:   Mon, 5 Jun 2023 14:47:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From:   Alex Elder <elder@linaro.org>
Subject: Re: [PATCH v13 05/24] mailbox: Add Gunyah message queue mailbox
To:     Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc:     Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Will Deacon <will@kernel.org>, Andy Gross <agross@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230509204801.2824351-1-quic_eberman@quicinc.com>
 <20230509204801.2824351-6-quic_eberman@quicinc.com>
Content-Language: en-US
In-Reply-To: <20230509204801.2824351-6-quic_eberman@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/9/23 3:47 PM, Elliot Berman wrote:
> Gunyah message queues are a unidirectional inter-VM pipe for messages up
> to 1024 bytes. This driver supports pairing a receiver message queue and
> a transmitter message queue to expose a single mailbox channel.
> 
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>

This patch does not apply properly, because it updates
"message-queue.rst", which does not currently exist.
I'm going to ignore that for now, though.

I'm generally OK with giving you my "Reviewed-by" on this
but I'll wait until you send v14 with the full content
of "message-queue.rst".

Also, I suggest below that you update all your SPDX tags
to no longer use the deprecated "GPL-2.0" identifier.

					-Alex

> ---
>   Documentation/virt/gunyah/message-queue.rst |   8 +
>   drivers/mailbox/Makefile                    |   2 +
>   drivers/mailbox/gunyah-msgq.c               | 212 ++++++++++++++++++++
>   include/linux/gunyah.h                      |  57 ++++++
>   4 files changed, 279 insertions(+)
>   create mode 100644 drivers/mailbox/gunyah-msgq.c
> 
> diff --git a/Documentation/virt/gunyah/message-queue.rst b/Documentation/virt/gunyah/message-queue.rst
> index b352918ae54b..70d82a4ef32d 100644
> --- a/Documentation/virt/gunyah/message-queue.rst
> +++ b/Documentation/virt/gunyah/message-queue.rst
> @@ -61,3 +61,11 @@ vIRQ: two TX message queues will have two vIRQs (and two capability IDs).
>         |               |         |                 |         |               |
>         |               |         |                 |         |               |
>         +---------------+         +-----------------+         +---------------+
> +
> +Gunyah message queues are exposed as mailboxes. To create the mailbox, create
> +a mbox_client and call `gh_msgq_init()`. On receipt of the RX_READY interrupt,
> +all messages in the RX message queue are read and pushed via the `rx_callback`
> +of the registered mbox_client.
> +
> +.. kernel-doc:: drivers/mailbox/gunyah-msgq.c
> +   :identifiers: gh_msgq_init
> diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
> index fc9376117111..5f929bb55e9a 100644
> --- a/drivers/mailbox/Makefile
> +++ b/drivers/mailbox/Makefile
> @@ -55,6 +55,8 @@ obj-$(CONFIG_MTK_CMDQ_MBOX)	+= mtk-cmdq-mailbox.o
>   
>   obj-$(CONFIG_ZYNQMP_IPI_MBOX)	+= zynqmp-ipi-mailbox.o
>   
> +obj-$(CONFIG_GUNYAH)		+= gunyah-msgq.o
> +
>   obj-$(CONFIG_SUN6I_MSGBOX)	+= sun6i-msgbox.o
>   
>   obj-$(CONFIG_SPRD_MBOX)		+= sprd-mailbox.o
> diff --git a/drivers/mailbox/gunyah-msgq.c b/drivers/mailbox/gunyah-msgq.c
> new file mode 100644
> index 000000000000..b7a54f233680
> --- /dev/null
> +++ b/drivers/mailbox/gunyah-msgq.c
> @@ -0,0 +1,212 @@
> +// SPDX-License-Identifier: GPL-2.0-only

After seeing this tag I looked into it, and see that SPDX
has deprecated "GPL-2.0" in favor of "GPL-2.0-only".

Please update all SPDX licenses that use "GPL-2.0" to use
this new tag instead.

> +/*
> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/mailbox_controller.h>
> +#include <linux/module.h>
> +#include <linux/interrupt.h>
> +#include <linux/gunyah.h>
> +#include <linux/printk.h>
> +#include <linux/init.h>
> +#include <linux/slab.h>
> +#include <linux/wait.h>
> +
> +#define mbox_chan_to_msgq(chan) (container_of(chan->mbox, struct gh_msgq, mbox))

Parentheses are not needed around a container_of() call.

> +
> +static irqreturn_t gh_msgq_rx_irq_handler(int irq, void *data)
> +{
> +	struct gh_msgq *msgq = data;
> +	struct gh_msgq_rx_data rx_data;
> +	enum gh_error gh_error;
> +	bool ready = true;
> +
> +	while (ready) {
> +		gh_error = gh_hypercall_msgq_recv(msgq->rx_ghrsc->capid,
> +				&rx_data.data, sizeof(rx_data.data),
> +				&rx_data.length, &ready);
> +		if (gh_error != GH_ERROR_OK) {
> +			if (gh_error != GH_ERROR_MSGQUEUE_EMPTY)
> +				dev_warn(msgq->mbox.dev, "Failed to receive data: %d\n", gh_error);
> +			break;
> +		}
> +		if (likely(gh_msgq_chan(msgq)->cl))
> +			mbox_chan_received_data(gh_msgq_chan(msgq), &rx_data);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +/* Fired when message queue transitions from "full" to "space available" to send messages */
> +static irqreturn_t gh_msgq_tx_irq_handler(int irq, void *data)
> +{
> +	struct gh_msgq *msgq = data;
> +
> +	mbox_chan_txdone(gh_msgq_chan(msgq), 0);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +/* Fired after sending message and hypercall told us there was more space available. */
> +static void gh_msgq_txdone_tasklet(struct tasklet_struct *tasklet)
> +{
> +	struct gh_msgq *msgq = container_of(tasklet, struct gh_msgq, txdone_tasklet);
> +
> +	mbox_chan_txdone(gh_msgq_chan(msgq), msgq->last_ret);
> +}
> +
> +static int gh_msgq_send_data(struct mbox_chan *chan, void *data)
> +{
> +	struct gh_msgq *msgq = mbox_chan_to_msgq(chan);
> +	struct gh_msgq_tx_data *msgq_data = data;
> +	u64 tx_flags = 0;
> +	enum gh_error gh_error;
> +	bool ready;
> +
> +	if (!msgq->tx_ghrsc)
> +		return -EOPNOTSUPP;
> +
> +	if (msgq_data->push)
> +		tx_flags |= GH_HYPERCALL_MSGQ_TX_FLAGS_PUSH;
> +
> +	gh_error = gh_hypercall_msgq_send(msgq->tx_ghrsc->capid, msgq_data->length, msgq_data->data,
> +						tx_flags, &ready);
> +
> +	/**
> +	 * unlikely because Linux tracks state of msgq and should not try to
> +	 * send message when msgq is full.
> +	 */
> +	if (unlikely(gh_error == GH_ERROR_MSGQUEUE_FULL))
> +		return -EAGAIN;
> +
> +	/**
> +	 * Propagate all other errors to client. If we return error to mailbox
> +	 * framework, then no other messages can be sent and nobody will know
> +	 * to retry this message.
> +	 */
> +	msgq->last_ret = gh_error_remap(gh_error);
> +
> +	/**
> +	 * This message was successfully sent, but message queue isn't ready to
> +	 * accept more messages because it's now full. Mailbox framework
> +	 * requires that we only report that message was transmitted when
> +	 * we're ready to transmit another message. We'll get that in the form
> +	 * of tx IRQ once the other side starts to drain the msgq.
> +	 */
> +	if (gh_error == GH_ERROR_OK) {
> +		if (!ready)
> +			return 0;
> +	} else

Standard style would add curly braces to the else block.

	} else {

> +		dev_err(msgq->mbox.dev, "Failed to send data: %d (%d)\n", gh_error, msgq->last_ret);
> +
> +	/**
> +	 * We can send more messages. Mailbox framework requires that tx done
> +	 * happens asynchronously to sending the message. Gunyah message queues
> +	 * tell us right away on the hypercall return whether we can send more
> +	 * messages. To work around this, defer the txdone to a tasklet.
> +	 */
> +	tasklet_schedule(&msgq->txdone_tasklet);
> +
> +	return 0;
> +}

. . .

