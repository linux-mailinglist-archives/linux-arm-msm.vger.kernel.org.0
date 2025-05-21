Return-Path: <linux-arm-msm+bounces-58917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC15FABF6F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 16:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20005177A53
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 14:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57FBA189F3F;
	Wed, 21 May 2025 14:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y3vvbkJZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9904516B3B7
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 14:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836123; cv=none; b=PH0w31nFrdLS+FAClLOIC5ykmQ61PEvm0+uHHlA1PKxQG8jpuHZKmPowX9RTQ43j25ZIPGqvazCPRsrAenZsuCm8iUBjxo4IF3QvPIyWo07ZFdws/Cu8OnIVzzGdeKpm8pLrKLqCB9nJZYqMCUItFdTZQCamjVGpjW6c/wkRKHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836123; c=relaxed/simple;
	bh=a6q/PZWmc+zPlm1zQM70skfxQwhxsKqszX4R4ML9J3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mCmLYRX1i4mvx1MrxN2IkMUwgzp+ZIWxCbg/Zw4NVfEPoHNEUyrK5hd04FqEimtmXBUPpj1RKZcHbSS4dwy69HPOuDlT2Bcdcq+NMSAcc+jQ5zCfEhxbuX8/B4LZtTx3VnvAICStVOfesc/xJIrsy93FbM8PlXN2GewzU+2gh6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y3vvbkJZ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2322bace4ceso33494515ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 07:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747836121; x=1748440921; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U8z5zCjsJqPPABNBLHUQv6MTVvI28kl/Vcyk8IPH4kI=;
        b=y3vvbkJZjf4nmva7ofHqi4lZBbtX4ewZ04Q7XgInZ5Y4P/oCTq/eQKbFMtmYUBzbiA
         78fexcNTXSPfOFur0mIY5PWjEDeE+pADiJekNPizI8pMcBRfZWibTsWMsgbKZfSLLgyK
         C274xMnv0UifPRx+ub8/6Q/814oaQtBJtyDQ9S/TjbeRQcwXw/P0SoTyBv1cKUZW4c63
         NeD/jwLMlfTNJsET9OAdtOiW4lHO8AZeeCCD6oLXdlrgJLgmo9fBjjWqOIkKfhOZ6XA9
         q00RhquRYSRMAqkKqxEkoW8k+UMXp0GZYBVDytu23YEYyYKAdPLjXSNF8qgX/RnENAub
         r9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747836121; x=1748440921;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U8z5zCjsJqPPABNBLHUQv6MTVvI28kl/Vcyk8IPH4kI=;
        b=To6f+Q2P3feVPALLmDlBsgD7sfTEO3pyRf9Eem/vFvXUu40BSeDtAXaSv84nitCP1s
         0CU7y9tJPjc+0sDbvoPhUfmC/lJ2rH7TBbYGvQuuMjivHzEbtLVwGkYF2Z6J/wmsanqY
         HIpR8Nc/lIr9jc4fT2svtF9B+qZ6VkFX1Is7sxr64U4RsnoYkPveiWQS9clGtR2hMJXe
         oAQK4+IFBmuCk9oqsBJAjH/YggTzZ9SUSDShB0A0u7oTUlNY34yM3/oVGi3bFRdJXSeF
         vv48Zce8lZaW2RsWa0AOkXO9U0Ioujus03Ur8gQxSU6hfOqjCMCBSAFk99VPN4GC5uj5
         qRPg==
X-Forwarded-Encrypted: i=1; AJvYcCXTD1DJoWX9XSKT8I5vky1VFv0gL/6ultceNELBmQtuvtz0wnwdJdzGmsn1im8NHxrY3excYM+dV7FS9MWX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9VucbJZoxZJID4C5UYvVq+rLgfp3Yj1hrDfzjcTQj8ROAvhpf
	tJHA3bWFXJEocMGlyE5nLggPMzJ1UGcORZQxEOlftyJ5SKA5asMS6HuVl5E2NmCD2g==
X-Gm-Gg: ASbGncuvmTp5wDskr7XpBweg/uvRDMRzmDda+1apbEifWnLa15aiAaEN07JZqiKb05a
	HAuqmpCwmTul/uRgflsBpitI/WMVMeL/5l0E9XxkB6mz9JbVffEDZ/9BDaZnqhr9gHtBhhGzo5Y
	p6H22xMeo7j9dVemL8aHDCKzFNIMEQTgbir1z0nf3Pbm49I7C+eyqLriQbRrkLqEtafiUgLfRTP
	wFvSzGiS+GEpFwctSvbiomvnQWwJMc2sfDxuiTlpExZsxlKID+sjYpJnOwOGkccyZcJTh79xswo
	w7m2FV5FGVeVP/1m6CvTqyoq7ekYP6wq+inigbPtVPs4YSpg92o9NMFA5EHmfNB6cXXurXQ=
X-Google-Smtp-Source: AGHT+IHIKKP2uksl9GvcLkBetglbjC+Wy6dDEa7BT/2+qE2OwFvCRiVTKh+kE7VBMoCdz8xwjqLNFA==
X-Received: by 2002:a17:902:e5d1:b0:224:b60:3cd3 with SMTP id d9443c01a7336-231d43ada94mr273520735ad.19.1747836120495;
        Wed, 21 May 2025 07:02:00 -0700 (PDT)
Received: from thinkpad ([120.60.52.42])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ed239bsm93587855ad.219.2025.05.21.07.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 07:01:59 -0700 (PDT)
Date: Wed, 21 May 2025 15:01:53 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, bvanassche@acm.org, 
	andersson@kernel.org, neil.armstrong@linaro.org, dmitry.baryshkov@oss.qualcomm.com, 
	konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com, quic_cang@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-scsi@vger.kernel.org
Subject: Re: [PATCH V5 10/11] scsi: ufs: qcom : Introduce phy_power_on/off
 wrapper function
Message-ID: <k37lk3poz6kzrgnby4sikwmz6rg4ysxsticn3opcil4j3njylp@cvmgwiw6nwy5>
References: <20250515162722.6933-1-quic_nitirawa@quicinc.com>
 <20250515162722.6933-11-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250515162722.6933-11-quic_nitirawa@quicinc.com>

On Thu, May 15, 2025 at 09:57:21PM +0530, Nitin Rawat wrote:

Subject should mention ufs_qcom_phy_power_{on/off} as phy_power_{on/off} are
generic APIs.

> There can be scenarios where phy_power_on is called when PHY is
> already on (phy_count=1). For instance, ufs_qcom_power_up_sequence
> can be called multiple times from ufshcd_link_startup as part of
> ufshcd_hba_enable call for each link startup retries(max retries =3),
> causing the PHY reference count to increase and leading to inconsistent
> phy behavior.
> 
> Similarly, there can be scenarios where phy_power_on or phy_power_off
> might be called directly from the UFS controller driver when the PHY
> is already powered on or off respectiely, causing similar issues.
> 
> To fix this, introduce ufs_qcom_phy_power_on and ufs_qcom_phy_power_off
> wrappers for phy_power_on and phy_power_off. These wrappers will use an
> is_phy_pwr_on flag to check if the PHY is already powered on or off,
> avoiding redundant calls. Protect the is_phy_pwr_on flag with a mutex
> to ensure safe usage and prevent race conditions.
> 

This smells like the phy_power_{on/off} calls are not balanced and you are
trying to workaround that in the UFS driver.

- Mani

> Co-developed-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 44 +++++++++++++++++++++++++++++++------
>  drivers/ufs/host/ufs-qcom.h |  4 ++++
>  2 files changed, 41 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 3ee4ab90dfba..583db910efd4 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -479,6 +479,38 @@ static u32 ufs_qcom_get_hs_gear(struct ufs_hba *hba)
>  	return UFS_HS_G3;
>  }
>  
> +static int ufs_qcom_phy_power_on(struct ufs_hba *hba)
> +{
> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> +	struct phy *phy = host->generic_phy;
> +	int ret = 0;
> +
> +	guard(mutex)(&host->phy_mutex);
> +	if (!host->is_phy_pwr_on) {
> +		ret = phy_power_on(phy);
> +		if (!ret)
> +			host->is_phy_pwr_on = true;
> +	}
> +
> +	return ret;
> +}
> +
> +static int ufs_qcom_phy_power_off(struct ufs_hba *hba)
> +{
> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> +	struct phy *phy = host->generic_phy;
> +	int ret = 0;
> +
> +	guard(mutex)(&host->phy_mutex);
> +	if (host->is_phy_pwr_on) {
> +		ret = phy_power_off(phy);
> +		if (!ret)
> +			host->is_phy_pwr_on = false;
> +	}
> +
> +	return ret;
> +}
> +
>  static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> @@ -507,7 +539,7 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
>  		return ret;
>  
>  	if (phy->power_count) {
> -		phy_power_off(phy);
> +		ufs_qcom_phy_power_off(hba);
>  		phy_exit(phy);
>  	}
>  
> @@ -524,7 +556,7 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
>  		goto out_disable_phy;
>  
>  	/* power on phy - start serdes and phy's power and clocks */
> -	ret = phy_power_on(phy);
> +	ret = ufs_qcom_phy_power_on(hba);
>  	if (ret) {
>  		dev_err(hba->dev, "%s: phy power on failed, ret = %d\n",
>  			__func__, ret);
> @@ -1121,7 +1153,6 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
>  				 enum ufs_notify_change_status status)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> -	struct phy *phy = host->generic_phy;
>  	int err;
>  
>  	/*
> @@ -1142,7 +1173,7 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
>  				ufs_qcom_dev_ref_clk_ctrl(host, false);
>  			}
>  
> -			err = phy_power_off(phy);
> +			err = ufs_qcom_phy_power_off(hba);
>  			if (err) {
>  				dev_err(hba->dev, "phy power off failed, ret=%d\n", err);
>  				return err;
> @@ -1151,7 +1182,7 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
>  		break;
>  	case POST_CHANGE:
>  		if (on) {
> -			err = phy_power_on(phy);
> +			err = ufs_qcom_phy_power_on(hba);
>  			if (err) {
>  				dev_err(hba->dev, "phy power on failed, ret = %d\n", err);
>  				return err;
> @@ -1339,10 +1370,9 @@ static int ufs_qcom_init(struct ufs_hba *hba)
>  static void ufs_qcom_exit(struct ufs_hba *hba)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> -	struct phy *phy = host->generic_phy;
>  
>  	ufs_qcom_disable_lane_clks(host);
> -	phy_power_off(phy);
> +	ufs_qcom_phy_power_off(hba);
>  	phy_exit(host->generic_phy);
>  }
>  
> diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
> index 0a5cfc2dd4f7..f51b774e17be 100644
> --- a/drivers/ufs/host/ufs-qcom.h
> +++ b/drivers/ufs/host/ufs-qcom.h
> @@ -281,6 +281,10 @@ struct ufs_qcom_host {
>  	u32 phy_gear;
>  
>  	bool esi_enabled;
> +	/* flag to check if phy is powered on */
> +	bool is_phy_pwr_on;
> +	/* Protect the usage of is_phy_pwr_on against racing */
> +	struct mutex phy_mutex;
>  };
>  
>  struct ufs_qcom_drvdata {
> -- 
> 2.48.1
> 

-- 
மணிவண்ணன் சதாசிவம்

