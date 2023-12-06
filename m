Return-Path: <linux-arm-msm+bounces-3592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2136680782E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 19:54:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93C531F211D3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 18:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D3B4644B;
	Wed,  6 Dec 2023 18:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S4SP4/H1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C06ABD50
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Dec 2023 10:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701888839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2T2oM8n7ES3F56mk7P89karRriuSouYwO1C14uj3RQs=;
	b=S4SP4/H1Llnm4lm/C2NAzacmEAolrC/OnSVI0INtG4OL+iXFWzWC5ikO9BFh8SiZ2K07gf
	YvvhbVQj4OphTW5dcnArBTGth70fwJVEAlkyZbAEBW3p/HPOrAGMxn0j/1QtU4d3qqaw13
	hle5K+qHoL1RaSHftE6XhgK/NUXkwSI=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-tO0HJwPvNJCZ74M5Ca_KDg-1; Wed, 06 Dec 2023 13:52:42 -0500
X-MC-Unique: tO0HJwPvNJCZ74M5Ca_KDg-1
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-589f91a6c0cso192353eaf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Dec 2023 10:52:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701888758; x=1702493558;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2T2oM8n7ES3F56mk7P89karRriuSouYwO1C14uj3RQs=;
        b=WwzkVXZG8Z/142cxUqL/n6b8TgLqL8TPpGqe2Ff4TpnoJ5CFCDFbXPFCQJZOnDt5oB
         4U9R2WzIoEfrJ7P9ZUMWtUQ7XY4tVehHdG097PR41u2g9bP41pclPydV84MPYycRG57N
         hokbJSo9s3onZPV9gvGqi+Qsha/X0wCpp8rleI8p06sLK8sTQnfKRwjW2K94uEKTAfoV
         gNroMKoPhIwDyGlhVVX8TX9exgzF+GgjMfUqXG7FmWun45fwim9hHUsy846EmeWajkor
         5gvBQ69jFcBlV8fK/SyVrbuvyVK1DAZIoOuL37XjPzYgNQBhjU0uumnkP6gACYQHoF4/
         ECZw==
X-Gm-Message-State: AOJu0Yz/H5+C9NBCEERAOj8hVR5k0DjFnjQSNGBR3suE53u/7T+izgVf
	+vRO4D67v1XuN5Fr+pOOqKJwXC2QB1u1XWv/abk3hoANoGV3/Mnf5KpOXLpPlBwjyFAavmHPrvB
	tVsQIDTzZOy1YLlysao+a1QV0+Q==
X-Received: by 2002:a05:6358:9049:b0:170:982:5611 with SMTP id f9-20020a056358904900b0017009825611mr1734952rwf.32.1701888758720;
        Wed, 06 Dec 2023 10:52:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGWWO9/aICv0W0WM3P+DYCIxzbBCoWdkWyVRrfijwhjBdH3/PviMW3Ncuu5AZPyvNFq7pIKg==
X-Received: by 2002:a05:6358:9049:b0:170:982:5611 with SMTP id f9-20020a056358904900b0017009825611mr1734939rwf.32.1701888758442;
        Wed, 06 Dec 2023 10:52:38 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::47])
        by smtp.gmail.com with ESMTPSA id s6-20020ad45006000000b0067a3ad49979sm185483qvo.96.2023.12.06.10.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 10:52:38 -0800 (PST)
Date: Wed, 6 Dec 2023 12:52:36 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: martin.petersen@oracle.com, jejb@linux.ibm.com, andersson@kernel.org, 
	konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_cang@quicinc.com
Subject: Re: [PATCH 10/13] scsi: ufs: qcom: Use dev_err_probe() to simplify
 error handling of devm_gpiod_get_optional()
Message-ID: <swt7fadd6cpi3tfyphpuhv5omlr3jzc6uipc246f7flritnufs@4hjdjfjnydgr>
References: <20231201151417.65500-1-manivannan.sadhasivam@linaro.org>
 <20231201151417.65500-11-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201151417.65500-11-manivannan.sadhasivam@linaro.org>

On Fri, Dec 01, 2023 at 08:44:14PM +0530, Manivannan Sadhasivam wrote:
> As done in other places, let's use dev_err_probe() to simplify the error
> handling while acquiring the device reset gpio using
> devm_gpiod_get_optional().
> 
> While at it, let's reword the error message to make it clear that the
> failure is due to acquiring "device reset gpio".
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
>  drivers/ufs/host/ufs-qcom.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 218d22e1efce..a86f6620abc8 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -1146,9 +1146,8 @@ static int ufs_qcom_init(struct ufs_hba *hba)
>  	host->device_reset = devm_gpiod_get_optional(dev, "reset",
>  						     GPIOD_OUT_HIGH);
>  	if (IS_ERR(host->device_reset)) {
> -		err = PTR_ERR(host->device_reset);
> -		if (err != -EPROBE_DEFER)
> -			dev_err(dev, "failed to acquire reset gpio: %d\n", err);
> +		err = dev_err_probe(dev, PTR_ERR(host->device_reset),
> +				    "Failed to acquire device reset gpio\n");
>  		goto out_variant_clear;
>  	}
>  
> -- 
> 2.25.1
> 
> 


