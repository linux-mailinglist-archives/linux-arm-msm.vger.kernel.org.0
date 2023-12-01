Return-Path: <linux-arm-msm+bounces-2935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E4780120B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 18:49:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37F8E2811CD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 17:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2524E62A;
	Fri,  1 Dec 2023 17:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sm4ZZFq9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97CCCAD
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 09:49:36 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40b4f6006d5so22994425e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 09:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701452975; x=1702057775; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c3XtzzjFOgOD7S4u56J6oC5ewGwOzGezjwSu4l5fq5g=;
        b=sm4ZZFq91CY8lte9F47e4X3zAOAXsm8t0eBH4BO5uNmn8snvKeCbHYnHIAp2JWAAtW
         MG1DDiYdDAIvxQp1y8Ld80lV3YYSKMR+bpPEsVMn9dXe0Q+9XYux5wRuMRhegWh5xNAa
         Ymii+///SgDCozKE9LYdr+r3o2yQYeU72SualleKfb84fsqpEK0U209KwA5StV97OF6W
         2I59evkBsqq3QaEOQE/U755uBLCo9YjoqiZFYbPK1sBGmD1yhSi5lkD+sGMN256xQctB
         l9thj3vJV+iz5nuJZZ1YmWWNpzdJSLQBC5gBoz+sGNvw9xUUSqxawKIhECfZ0C3XKYbL
         c9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701452975; x=1702057775;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3XtzzjFOgOD7S4u56J6oC5ewGwOzGezjwSu4l5fq5g=;
        b=fMQEZl8HblOzDXFOFEIkQ57jf2HbwUP5iaTySpqucmfbcpDhjbHh16hDzGuAfCDanR
         /CCJrylH4hqjBQqrccZWhx1QSUUdB719Pc9BYo9l0P2p7ipp0sV1oKoYU2+9RxNJTWml
         4+RLcfdj7RAthtS2OqWEhfThe43uU+qiz5sqYfIQOSWfEL1e0VAzwR53FRowIJxRRukN
         E1HZmxqSVYhohKm0gSzZ1DII5AXT2v1Cc1tB8gU5hdisHoEMf+Y2bfP+yKpfqB4i/zzO
         AW7axrIvzvK0OjO+3EFp4cocGsHFgA7C4RhM2or5z0enIYjly/tYCRXPANgoEZ+rXy8t
         IKCA==
X-Gm-Message-State: AOJu0YwTeAbDeRF86rIC/lR320QF9aaPlbgEtJbvEwXiKp0Y22nidYJa
	EAyCzk90k1k7rJrMNdHrZj01TovZTAMwAuFaB24=
X-Google-Smtp-Source: AGHT+IFHuFmbI9cOvT54OXa90QPoF6aFMDHPdlfYs5Ijr3TiN58L/m9EWHXlGpDb4KgfEboYZKC0EQ==
X-Received: by 2002:a05:600c:4f03:b0:40b:2a15:9b30 with SMTP id l3-20020a05600c4f0300b0040b2a159b30mr447078wmq.1.1701452975070;
        Fri, 01 Dec 2023 09:49:35 -0800 (PST)
Received: from linaro.org ([82.77.85.67])
        by smtp.gmail.com with ESMTPSA id dl17-20020a0560000b9100b003316debbde4sm4777931wrb.48.2023.12.01.09.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 09:49:34 -0800 (PST)
Date: Fri, 1 Dec 2023 19:49:32 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: martin.petersen@oracle.com, jejb@linux.ibm.com, andersson@kernel.org,
	konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_cang@quicinc.com
Subject: Re: [PATCH 02/13] scsi: ufs: qcom: Fix the return value of
 ufs_qcom_ice_program_key()
Message-ID: <ZWocrM0guCvGSRrQ@linaro.org>
References: <20231201151417.65500-1-manivannan.sadhasivam@linaro.org>
 <20231201151417.65500-3-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201151417.65500-3-manivannan.sadhasivam@linaro.org>

On 23-12-01 20:44:06, Manivannan Sadhasivam wrote:
> Currently, the function returns -EINVAL if algorithm other than AES-256-XTS
> is requested. But the correct error code is -EOPNOTSUPP. Fix it!
> 
> Cc: Abel Vesa <abel.vesa@linaro.org>
> Fixes: 56541c7c4468 ("scsi: ufs: ufs-qcom: Switch to the new ICE API")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

LGTM.

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/ufs/host/ufs-qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index cbb6a696cd97..852179e456f2 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -158,7 +158,7 @@ static int ufs_qcom_ice_program_key(struct ufs_hba *hba,
>  	cap = hba->crypto_cap_array[cfg->crypto_cap_idx];
>  	if (cap.algorithm_id != UFS_CRYPTO_ALG_AES_XTS ||
>  	    cap.key_size != UFS_CRYPTO_KEY_SIZE_256)
> -		return -EINVAL;
> +		return -EOPNOTSUPP;
>  
>  	if (config_enable)
>  		return qcom_ice_program_key(host->ice,
> -- 
> 2.25.1
> 

