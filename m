Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67DB912E358
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2020 08:36:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbgABHgL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jan 2020 02:36:11 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:42249 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbgABHgL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jan 2020 02:36:11 -0500
Received: by mail-pf1-f195.google.com with SMTP id 4so21669832pfz.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jan 2020 23:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9BZFCWByeFBQFg4ZpwRS8Ep8P4RYSRYVRbf7sq8YUn4=;
        b=vgr7ojvK1IpBjMrcuFNiAurp1izGXu8v7/Imtdb6mtTYZBlrX+xEzK0+/prqYuJvZi
         WRAUeI84rPPjrl2b15KK4FTmNBRvGIoFq7s7exbiy9n+82PZXEBGveUnsFnRDm5zO6hA
         m/k+R6DyPs3kaYeOBTQp0ONWpFmX2csttv42PjhTMqEsvXG/068gcqRMgpkesN9j/pcF
         1jfxPU7M43Ki6z63KdCdIwfOayDLGG1u8tznmWzrm+RiMd3u4/HP8I00vU57HDdEcuVv
         n3cHAT5JS5/c9DhWeKkQZmwoMzwgUG3A+TlX4fNehBy5O6r+60t/sAL1xOJypCiVYc3Z
         AGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9BZFCWByeFBQFg4ZpwRS8Ep8P4RYSRYVRbf7sq8YUn4=;
        b=iI3kWK+I4MyUOXA5LYvpXFi2359CC1xsz2oZpMLtdnt7NvArxQjb57OoDYsOZem5Y6
         zeFb2VSHvn7ugkwQY4G0939bW2PcruojrR1u4JCJEaTHGP5SrS1FGE0jGvfZGaZauoet
         LpAoZXNLxO7lDuqsMrkO5Fd2qyQZAgv3fIpJ31PvaeFfDj6xrTXYxvhqIfHbxdTikI7f
         u6ynZkBynUSFTdNpO31/UiYUq+yiv9pxXTL8gQPcvBWg/Hwcsx4fuUyOLpcKTsPx+56r
         2yqKxR/isZ9TDRjKvtMCKypXm/+6PbvBLL9jCa+YS0UJ2Eb00usDmHHyV9xaOso2R35y
         zBvQ==
X-Gm-Message-State: APjAAAU1EajsFf2uyyHVidVuFgR76/tXpC1H/XUQnjG0RHzXtHRHjSIi
        W3ZaJufa2LRAi6Xr07Z/VhKY5g==
X-Google-Smtp-Source: APXvYqwST97ivxeEeCej8Jd+8HddEhoVJprknV1/YugYLwdhyqMzNoOEOQmeu+khAFhJ/ze/6cRsvg==
X-Received: by 2002:a62:a209:: with SMTP id m9mr77068574pff.16.1577950570999;
        Wed, 01 Jan 2020 23:36:10 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 207sm64170807pfu.88.2020.01.01.23.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jan 2020 23:36:10 -0800 (PST)
Date:   Wed, 1 Jan 2020 23:36:07 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: qcom: scm: add 32 bit iommu page table support
Message-ID: <20200102073607.GS549437@yoga>
References: <20200101033704.32264-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200101033704.32264-1-masneyb@onstation.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 31 Dec 19:37 PST 2019, Brian Masney wrote:

> Add 32 bit implmentations of the functions
> __qcom_scm_iommu_secure_ptbl_size() and
> __qcom_scm_iommu_secure_ptbl_init() that are required by the qcom_iommu
> driver.
> 

Hi Brian,

This looks good, but I was hoping to  hoping to reach a conclusion and
merge [1] - which in patch 16 squashes the argument filling boiler plate
code of the 32 and 64-bit version of scm and hence implements the same.

If you have time to take a peek at this series I would greatly
appreciate it (not a lot of people testing 32-bit these days...)

[1] https://patchwork.kernel.org/project/linux-arm-msm/list/?series=215943

Regards,
Bjorn

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
