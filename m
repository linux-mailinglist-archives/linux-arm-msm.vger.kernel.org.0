Return-Path: <linux-arm-msm+bounces-58916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FF3ABF6D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 15:58:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4586E9E4CB3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 13:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F7417A301;
	Wed, 21 May 2025 13:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t5JTTVBQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C08185955
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 13:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747835860; cv=none; b=pp9Bl3RFxf9IqlmjC20E91k4l6UOsi6DTM/3+55LpptnqgZ6ol5ahKWuC+wRnZrLjllNkgpaCwTi0W5B4JYQbcN1OjRFX011BB9kUStKIicQetqu4hpugsjFGilHI6YRByihvWbA9qgUxPFt1L+WVH5f48aKFGtMxQEXLk6MdAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747835860; c=relaxed/simple;
	bh=Gv0HXV2263oNPGZof5l9I3MBc9ogn1UNaQ90T56vuFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=howCfx6Kybsehe5mxTD5L+u6LFcFU9FnfMb+kj8YSuepRvA81D6MG2WA+joOZLRsTks9+aQUgQAZ+WS+WavKnPcvuV2oMsGD/9yjbc8hfwQ5IZSvD0700RrsuAEicmsMNIkN9djm8xSFxENUAZDw95THtGykMOqM91oo7G4oSf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t5JTTVBQ; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b26f01c638fso5072329a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 06:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747835857; x=1748440657; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4V2npzngN7XE+T5CnS00fIFW0qBnhbmPIQOpJiEFacY=;
        b=t5JTTVBQMT0VpqzR/U2iZhhV8L4TgzKFm+d8O69FsxqdW+YxNJBb/4RIeB24cE17lc
         Wm4WSqrw9ig1mYgAUOkEYFFm5mw6/cBKWWNswPiZk/9zw+Onle8c7vtIkqS+kOTPmdNd
         av/XR4lb9TSjutk5/63u7E7+wSVMC9koXKpEJYdW3+JbP+0OWxPfAyy4an9eAvPKMrxr
         ESukKAhSIZqEcetXZpV+NR6n/hUBn48k12vHN/JMlG3LCth6gQTzK2uXm9gh7g90O0nw
         UEkUv46c+Cz5ovCcvhgc7WWqEpPM0NqazvORMAK2zHqzFufQDssVJ8Am1lUtvtxmeeH4
         asMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747835857; x=1748440657;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4V2npzngN7XE+T5CnS00fIFW0qBnhbmPIQOpJiEFacY=;
        b=PecPmZWbu++3aVmToGGH/PIArbpJHRf99JFte28xhTyewYtCYAw4LmVH+Bt69abyWt
         /Z5Ma5qQZdxvjhACk+TUFUkqs3/UQH99989zkwFRFaw2SS1eVpc297ppDCmRkLJ0YBTN
         k1sRB1G33pP8XSvCsBuMKe9IKjCjVfF1VoF6/Pb1vnziKywybe9K6jhxjzLKP6ODnD0U
         BzusK+OfX3GClR7MQTlHMhChIuqr+pFXpFrLp9ZPTTbBjC4LyMbPSu0ebTIbY+oWC9Ii
         4aA8O+fOOBMYb6Etpnz6c/rGVOw7hcjKk3l5LCBNg/24sHrJ9L5oVfYL0qO5bzx4w4mq
         NeQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUng4TruD4L64MPOIYiSWEx/kKy2Uvwd/Dr70wbaSiI7qJt+MxMHJq/5iQCQ/+LQ6FGQhHdAy7K2mMqpiI4@vger.kernel.org
X-Gm-Message-State: AOJu0YxhDd5N1zrZN5xYRg2/6VVHTEhPNby+puyqTJWuewXo3b4HvcrY
	uFDssxbvw9rz7h14uRVt93M+qk+Vl4hdUtXvDLN6K7sORBVa14+D/a99FYQovfqk/w==
X-Gm-Gg: ASbGncv9ihghE6lXkf0PQGVILmDhsFoiTDD+mtfE++woR00hNiwXp0APknLeKJDKJRO
	xdLC9917uMdFH0ZOYVkXqrLRvAbWgL6ICzKuT7Mm7ImzOZryIvfECSTcAtsSEqgf53HPfj6BD/t
	69qUu9l3rRJ11exZB09ShSWynnxe6VgxaA9n4Hn5tx0PXpJs2vlU7VEM1oiNYamNfh0wlFc5wpe
	GG2HoJTzZAL+pSrK/yxcquO1RIvqy2OWK8eQSbbAue7++Nl9FDEYvfhl5K0LIoyR2ohdkvIatLU
	OPFGONH3Jt1UcPmD1tKWbsWlKg5LrWR4AWJh0KYeP32GNR6zN5dKqaS7FDWz
X-Google-Smtp-Source: AGHT+IHRB6a4p+x/fLfJd+xB4iokXTvEugUEwgXrmK670XBatNkGHNJpzX5R1He9NQDvMhn300VvPg==
X-Received: by 2002:a17:90b:56cc:b0:30e:3338:8c0e with SMTP id 98e67ed59e1d1-30e7d5a8b5amr30665302a91.27.1747835857527;
        Wed, 21 May 2025 06:57:37 -0700 (PDT)
Received: from thinkpad ([120.60.52.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365b22b5sm3663633a91.5.2025.05.21.06.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 06:57:37 -0700 (PDT)
Date: Wed, 21 May 2025 14:57:31 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, bvanassche@acm.org, 
	andersson@kernel.org, neil.armstrong@linaro.org, dmitry.baryshkov@oss.qualcomm.com, 
	konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com, quic_cang@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-scsi@vger.kernel.org
Subject: Re: [PATCH V5 09/11] scsi: ufs: qcom : Refactor phy_power_on/off
 calls
Message-ID: <knlhbl3mwo3b7xc4rjp4y7yka2nwythumjacmvn236v72ykddo@r3cp2w4uomol>
References: <20250515162722.6933-1-quic_nitirawa@quicinc.com>
 <20250515162722.6933-10-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250515162722.6933-10-quic_nitirawa@quicinc.com>

On Thu, May 15, 2025 at 09:57:20PM +0530, Nitin Rawat wrote:
> Commit 3f6d1767b1a0 ("phy: ufs-qcom: Refactor all init steps into
> phy_poweron") removes the phy_power_on/off from ufs_qcom_setup_clocks

s/removes/moved

> to suspend/resume func.
> 
> To have a better power saving, remove the phy_power_on/off calls from
> resume/suspend path and put them back to ufs_qcom_setup_clocks, so that
> PHY regulators & clks can be turned on/off along with UFS's clocks.
> 
> Since phy phy_power_on is separated out from phy calibrate, make
> separate calls to phy_power_on and phy_calibrate calls from ufs qcom
> driver.
> 

This patch is not calling phy_calibrate().

> Co-developed-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 61 ++++++++++++++++++-------------------
>  1 file changed, 29 insertions(+), 32 deletions(-)
> 

[...]

>  static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
>  				 enum ufs_notify_change_status status)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> +	struct phy *phy = host->generic_phy;
> +	int err;
>  
>  	/*
>  	 * In case ufs_qcom_init() is not yet done, simply ignore.
> @@ -1157,10 +1141,22 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
>  				/* disable device ref_clk */
>  				ufs_qcom_dev_ref_clk_ctrl(host, false);
>  			}
> +
> +			err = phy_power_off(phy);
> +			if (err) {
> +				dev_err(hba->dev, "phy power off failed, ret=%d\n", err);
> +				return err;
> +			}
>  		}
>  		break;
>  	case POST_CHANGE:
>  		if (on) {
> +			err = phy_power_on(phy);
> +			if (err) {
> +				dev_err(hba->dev, "phy power on failed, ret = %d\n", err);
> +				return err;
> +			}
> +
>  			/* enable the device ref clock for HS mode*/
>  			if (ufshcd_is_hs_mode(&hba->pwr_info))
>  				ufs_qcom_dev_ref_clk_ctrl(host, true);
> @@ -1343,9 +1339,10 @@ static int ufs_qcom_init(struct ufs_hba *hba)
>  static void ufs_qcom_exit(struct ufs_hba *hba)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> +	struct phy *phy = host->generic_phy;
>  
>  	ufs_qcom_disable_lane_clks(host);
> -	phy_power_off(host->generic_phy);
> +	phy_power_off(phy);

This change is not at all needed.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

