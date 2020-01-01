Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80D7B12DEA5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jan 2020 12:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725862AbgAALP3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jan 2020 06:15:29 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.21]:19878 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbgAALP3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jan 2020 06:15:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1577877327;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=4xNAeNcliB0k+pheJgdvL+8/jd+qPFm+3BO08H7ttMU=;
        b=s1tCT89F86z9nmOxanGwbC163/JuFhBRGk4LyGXl/LMO1CpcD6seP6Za5tZUbkyo2n
        tEz8GCZk1DeEjeeq5GwyPd8JT+VHuarLAP2LdoB25NOhR6KBK20zuIOBoVgQzRQn0C2p
        MN9B6AAoB48Itv05QE9K+w4iMKgcEvNPD58B+CLJYKSEoTPvTnkVBPA3XdeMxZrfoKVo
        nky8qFwq/Z7/yMw9DNx8sazh8Rf0hdXfyfznc6uzADfcCvb/1MXQrGeJASkjjzjhgbjt
        UTpy5ZM5PcgXtHX6Avgb+Sp+/XvwsYsOkv8pdpsbLbp/O7bHLwak4efveMrg4MM3IJvm
        o0pA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u266EZF6ORJDdPLYs76f"
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.1.3 AUTH)
        with ESMTPSA id z012abw01BFQTGR
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 1 Jan 2020 12:15:26 +0100 (CET)
Date:   Wed, 1 Jan 2020 12:15:21 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Brian Masney <masneyb@onstation.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: qcom: scm: add 32 bit iommu page table support
Message-ID: <20200101111521.GA67534@gerhold.net>
References: <20200101033704.32264-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200101033704.32264-1-masneyb@onstation.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 31, 2019 at 10:37:04PM -0500, Brian Masney wrote:
> Add 32 bit implmentations of the functions
> __qcom_scm_iommu_secure_ptbl_size() and
> __qcom_scm_iommu_secure_ptbl_init() that are required by the qcom_iommu
> driver.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
>  drivers/firmware/qcom_scm-32.c | 32 ++++++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
> index 48e2ef794ea3..f149a85d36b0 100644
> --- a/drivers/firmware/qcom_scm-32.c
> +++ b/drivers/firmware/qcom_scm-32.c
> @@ -638,13 +638,41 @@ int __qcom_scm_restore_sec_cfg(struct device *dev, u32 device_id,
>  int __qcom_scm_iommu_secure_ptbl_size(struct device *dev, u32 spare,
>  				      size_t *size)
>  {
> -	return -ENODEV;
> +	int psize[2] = { 0, 0 };

I would use an explicit size (i.e. __le32) here.

> +	int ret;
> +
> +	ret = qcom_scm_call(dev, QCOM_SCM_SVC_MP,
> +			    QCOM_SCM_IOMMU_SECURE_PTBL_SIZE,
> +			    &spare, sizeof(spare), &psize, sizeof(psize));
> +	if (ret || psize[1])
> +		return ret ? ret : -EINVAL;
> +
> +	*size = psize[0];
> +
> +	return 0;
>  }
>  
>  int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr, u32 size,
>  				      u32 spare)
>  {
> -	return -ENODEV;
> +	struct msm_scm_ptbl_init {
> +		__le32 paddr;
> +		__le32 size;
> +		__le32 spare;
> +	} req;
> +	int ret, scm_ret = 0;
> +
> +	req.paddr = addr;
> +	req.size = size;
> +	req.spare = spare;

I'm not sure if there is actually anyone using qcom in BE mode (does
that even work?), but all the other methods in this file explicitly
convert using cpu_to_le32(), so this method should do the same :)

> +
> +	ret = qcom_scm_call(dev, QCOM_SCM_SVC_MP,
> +			    QCOM_SCM_IOMMU_SECURE_PTBL_INIT,
> +			    &req, sizeof(req), &scm_ret, sizeof(scm_ret));
> +	if (ret || scm_ret)
> +		return ret ? ret : -EINVAL;
> +
> +	return 0;
>  }
>  
>  int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr,
> -- 
> 2.21.0
> 
