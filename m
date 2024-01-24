Return-Path: <linux-arm-msm+bounces-8102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F8183A40D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 09:23:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B5402871F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 08:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C994517753;
	Wed, 24 Jan 2024 08:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eb5fDZ/D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C891774C
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 08:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706084561; cv=none; b=WblXEzKjb1KmOH3U1a9vvKqrBp+YRgq2x9q2Zxi6FOck0Vpn74t3li2AkbUZ+7nNkcH4Cvc+Z22vkG/f5skfjju9/im0EXY4UF9lz5PAhIPzHUABoJEuPuZ/BUyCeMUcDiYH+qWQBsD0O4oiU3uWLqz+IFoT/C4qdKxW2MR7LV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706084561; c=relaxed/simple;
	bh=GwYYyIKHpPbisEwWC6WETTohGHFFDsZNlW29Ta37IRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kOiraZdV/ddrISK1qnRFIgXXv7CV/3xgj3VnyKnNBkigQyLZV3aURKGQQYw91GHDVqamZlsNCyaJj3toGyvmg+WqUcWH5nVatCR1RPO3LjNWkNv23OsaGNVquWlp6kpb0jjhdpzhwo38k58B7s9AiJxmkCdXFCgFG8e7EQtgaMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eb5fDZ/D; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5ce07cf1e5dso2856933a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 00:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706084559; x=1706689359; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xHnMGTip0k5WQr/ocF61LjVmzrROreb8ZXQsvgEPM10=;
        b=eb5fDZ/DgdxAvh1qiMCYwQGoY6EeTDznvXpToqOE4i37MCsStZSxiCXJQI/HS8RAnm
         Pc+dNHBYCkxk2DnCezCoN9zhqg383U67VurebYOiWc3t2cFsOI5OHOClRL2SUmIWet+L
         OmbglyBreoy0XfwKP++GRtkL5+Rkqy1hD92/VKYA7OnWEzxNxEAGQuv3cwskmqkRWtFB
         4PSzz4Vxom9bJnOWSeeuHplf4sS/mJSDMrbi/5UXgBveCZXA612iug/a/rZ0r1pPKtMs
         nua1kkaZV5uMtqEaBoYFhfjjPNo7epf2xSrEY8WavA1Ak/9squqi9KGooAHaIf/ewOSL
         afOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706084559; x=1706689359;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xHnMGTip0k5WQr/ocF61LjVmzrROreb8ZXQsvgEPM10=;
        b=kpTbkYl+QcxHx5lVKjrOMMT/HlWsyn4WVWzpOP8yS9Q7IrmgYwI3Y/BObmRpEZS7mS
         PPbAdoUmP3ahG0dmFkQjrrjoS+H0xAhKQLmvnwDcDzfGC84WjEnolG0tMMYPx47Tow25
         4bLcCBlrEVjdjYwj6cz3//1YiCgLZvxqvr6mqgNyKFFupbM1PR7Gj/T4cBAItc95i4QJ
         VBSxaqRETSLONkkgCr6YmABaa0/MPdd+HjiY4bW8jokosr+jvK9m9Hd+vqscprLa6s1r
         lGPugXfa6BNnEZn+ALJKKO6KdJ7ITSXaWzMQ44S6LpBLYp8hfLtlxomxaIswNf6r9x42
         wr6A==
X-Gm-Message-State: AOJu0YxIC+n/O8gSKOk/sGRzpqiyhYweYlxC18JqGM6EHErHmZsNYDiY
	5djhL2rkrYtI9Yh0aEq8jYDOQo4J/MnxupaSD3ifG+I3eCavI4zajqHJ1d2jDw==
X-Google-Smtp-Source: AGHT+IFYijfZfQJRYeJr90+4Q5xmMq6ccGYCRmITy1K5PGzM1guUVEdm+Q1tNA1zYNMr19HRhkaD0g==
X-Received: by 2002:a05:6a20:6115:b0:19c:32cf:8ff2 with SMTP id m21-20020a056a20611500b0019c32cf8ff2mr273690pzb.79.1706084559474;
        Wed, 24 Jan 2024 00:22:39 -0800 (PST)
Received: from thinkpad ([117.217.189.109])
        by smtp.gmail.com with ESMTPSA id z66-20020a626545000000b006dbe6eba197sm4768321pfb.217.2024.01.24.00.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 00:22:39 -0800 (PST)
Date: Wed, 24 Jan 2024 13:52:31 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	Can Guo <quic_cang@quicinc.com>,
	Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
Subject: Re: [PATCH V1 1/2] scsi: ufs: qcom : Refactor phy_power_on/off calls
Message-ID: <20240124082231.GA4906@thinkpad>
References: <20240112153348.2778-1-quic_nitirawa@quicinc.com>
 <20240112153348.2778-2-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240112153348.2778-2-quic_nitirawa@quicinc.com>

On Fri, Jan 12, 2024 at 09:03:47PM +0530, Nitin Rawat wrote:
> Commit 3f6d1767b1a0 ("phy: ufs-qcom: Refactor all init steps into
> phy_poweron") removes the phy_power_on/off from ufs_qcom_setup_clocks

s/removes/moved

> to suspend/resume func.
> 
> To have a better power saving, remove the phy_power_on/off calls from
> resume/suspend path and put them back to ufs_qcom_setup_clocks, so that
> PHY's regulators & clks can be turned on/off along with UFS's clocks.
> 
> Since phy phy_power_on is separated out from phy calibrate, make
> separate calls to phy_power_on and phy_calibrate calls from ufs qcom
> driver.
> 

Above change should be in a separate patch.

> Also add a mutex lock to protect the usage of is_phy_pwr_on against
> possible racing.
> 
> Co-developed-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> Co-developed-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
> Signed-off-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 104 +++++++++++++++++++++++-------------
>  drivers/ufs/host/ufs-qcom.h |   4 ++
>  2 files changed, 72 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 39eef470f8fa..2721a30f0db8 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -338,6 +338,46 @@ static u32 ufs_qcom_get_hs_gear(struct ufs_hba *hba)
>  	return UFS_HS_G3;
>  }
> 
> +static int ufs_qcom_phy_power_on(struct ufs_hba *hba)
> +{
> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> +	struct phy *phy = host->generic_phy;
> +	int ret = 0;
> +
> +	mutex_lock(&host->phy_mutex);

You do not need mutex to protect a variable. If you want to ensure that the
access to the flag is atomic, you can use test_and_{set/clear}_bit helpers.

> +	if (!host->is_phy_pwr_on) {
> +		ret = phy_power_on(phy);
> +		if (ret) {
> +			mutex_unlock(&host->phy_mutex);
> +			return ret;
> +		}
> +		host->is_phy_pwr_on = true;
> +	}
> +	mutex_unlock(&host->phy_mutex);
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
> +	mutex_lock(&host->phy_mutex);
> +	if (host->is_phy_pwr_on) {
> +		ret = phy_power_off(phy);
> +		if (ret) {
> +			mutex_unlock(&host->phy_mutex);
> +			return ret;
> +		}
> +		host->is_phy_pwr_on = false;
> +	}
> +	mutex_unlock(&host->phy_mutex);
> +
> +	return ret;
> +}
> +
>  static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> @@ -378,13 +418,18 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
>  		goto out_disable_phy;
> 
>  	/* power on phy - start serdes and phy's power and clocks */
> -	ret = phy_power_on(phy);
> +	ret = ufs_qcom_phy_power_on(hba);
>  	if (ret) {
>  		dev_err(hba->dev, "%s: phy power on failed, ret = %d\n",
>  			__func__, ret);
>  		goto out_disable_phy;
>  	}
> 
> +	ret = phy_calibrate(phy);
> +	if (ret) {
> +		dev_err(hba->dev, "%s: Failed to calibrate PHY %d\n",
> +				  __func__, ret);

Even though the driver already has a lot of "__func__" to print the function
names in error log, please do not add more. I will get rid of the existing ones
at some point.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

