Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB5F4B62C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2019 12:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727134AbfFSK1b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jun 2019 06:27:31 -0400
Received: from onstation.org ([52.200.56.107]:36936 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726826AbfFSK1a (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jun 2019 06:27:30 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id B2E0F3E93E;
        Wed, 19 Jun 2019 10:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1560940049;
        bh=MOk9vBejJD3LU6pvBKkl0HAgBqxiYYl+m7zxPntItDs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NHTEMx1GjbaN2+J57y71Lmw6cyCTUTc//Df/6nc1PdjAadKR4+knfGiGK8xtnYs30
         XDLg4JB15+XvEgUXz37mMkzC1zuBgI0BbRr1mVUZWdfg+iV3SafJuDg9hrxPnHTe+D
         imbxp7cXdi7boHKky3/3zJvkePfad63ao+kCLYe0=
Date:   Wed, 19 Jun 2019 06:27:28 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        david.brown@linaro.org, robdclark@gmail.com, sean@poorly.run,
        robh+dt@kernel.org
Cc:     airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com,
        jonathan@marek.ca, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/6] soc: qcom: add OCMEM driver
Message-ID: <20190619102728.GA894@onstation.org>
References: <20190619023209.10036-1-masneyb@onstation.org>
 <20190619023209.10036-6-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190619023209.10036-6-masneyb@onstation.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 18, 2019 at 10:32:08PM -0400, Brian Masney wrote:
> +++ b/include/soc/qcom/ocmem.h
> @@ -0,0 +1,62 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * The On Chip Memory (OCMEM) allocator allows various clients to allocate
> + * memory from OCMEM based on performance, latency and power requirements.
> + * This is typically used by the GPU, camera/video, and audio components on
> + * some Snapdragon SoCs.
> + *
> + * Copyright (C) 2019 Brian Masney <masneyb@onstation.org>
> + * Copyright (C) 2015 Red Hat. Author: Rob Clark <robdclark@gmail.com>
> + */
> +
> +#ifndef __OCMEM_H__
> +#define __OCMEM_H__
> +
> +enum ocmem_client {
> +	/* GMEM clients */
> +	OCMEM_GRAPHICS = 0x0,
> +	/*
> +	 * TODO add more once ocmem_allocate() is clever enough to
> +	 * deal with multiple clients.
> +	 */
> +	OCMEM_CLIENT_MAX,
> +};
> +
> +struct ocmem;
> +
> +struct ocmem_buf {
> +	unsigned long offset;
> +	unsigned long addr;
> +	unsigned long len;
> +};
> +
> +#if IS_ENABLED(CONFIG_QCOM_OCMEM)
> +
> +struct ocmem *of_get_ocmem(struct device *dev);
> +struct ocmem_buf *ocmem_allocate(struct ocmem *ocmem, enum ocmem_client client,
> +				 unsigned long size);
> +void ocmem_free(struct ocmem *ocmem, enum ocmem_client client,
> +		struct ocmem_buf *buf);
> +
> +#else /* IS_ENABLED(CONFIG_QCOM_OCMEM) */
> +
> +static inline struct ocmem *of_get_ocmem(struct device *dev)
> +{
> +	return NULL;

This, along with ocmem_allocate() below, need to return ERR_PTR(-ENOSYS).
adreno_gpu_ocmem_init() needs to check for this error code:

        ocmem = of_get_ocmem(dev);
        if (IS_ERR(ocmem)) {
                if (PTR_ERR(ocmem) == -ENXIO || PTR_ERR(ocmem) == -ENOSYS) {
                        /*
                         * Return success since either the ocmem property was
                         * not specified in device tree, or ocmem support is
                         * not compiled into the kernel.
                         */
                        return 0;
                }

                return PTR_ERR(ocmem);
        }

Brian



> +}
> +
> +static inline struct ocmem_buf *ocmem_allocate(struct ocmem *ocmem,
> +					       enum ocmem_client client,
> +					       unsigned long size)
> +{
> +	return NULL;
> +}
> +
> +static inline void ocmem_free(struct ocmem *ocmem, enum ocmem_client client,
> +			      struct ocmem_buf *buf)
> +{
> +}
> +
> +#endif /* IS_ENABLED(CONFIG_QCOM_OCMEM) */
> +
> +#endif /* __OCMEM_H__ */
> -- 
> 2.20.1
