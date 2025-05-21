Return-Path: <linux-arm-msm+bounces-58904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A09EABF60B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 15:26:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 767DC4E448F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 13:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 377F127CB3D;
	Wed, 21 May 2025 13:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N0Oyl3Wc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0A625DB0B
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 13:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747834008; cv=none; b=osaEuSyPgpYmcln90ebXUfg57GpJUdJP3D421sApmRYLjxpZcktkhreGKNFB1HYv3qRe1cNq1NmTnLJdhp4fq7gn9XPSeD9n3UWpCWyQQTgEDhXu6Txyk7EiKCukBvTowsYbwi+IAnc9JVEixfwZ1s6kHkBiZN+CERK90U8d9nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747834008; c=relaxed/simple;
	bh=O5lp2QoEpMPS2MwUPvQkU43TbDUAVV9V0PVY3zVpypM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jt4Xi8FUcfFaplhF7HOCcVqfeIb6SanwibyPkXDD7pM6Wo2HuursDa0cANPRW6uW3r4o4HOVo8TIi+krgmmyJAQ0uE0P8nra5rMzv1H+eIP1ot8x2LJrWCdQTtTXCeyrQQvhcP7MoTRtJhPzYuR2rqdHwxjSQeeIC3voAMPN/lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N0Oyl3Wc; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2320d2a7852so33988475ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 06:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747834005; x=1748438805; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vsAPeVY9F4Ep0Af1IsuKENhPXpnyEXq+ZRKN1+hGmWI=;
        b=N0Oyl3WctUeeMrQUOfHgkPgudP/EaGpufBqVz9NvVySvCCBe/4NAOVdiscdfhPlz+F
         X8YF+Wa1EoQGvbesgLOW5O42mSIXqshDB95vWEiJDwUZBsjw0OwY4iisW6ZKSk2Z53St
         fi/eFqA57Jc04bcgq5Pj/jayPVRoslPD4uPR3bocnMPJfOhDznwe1mL1k6hFZCHLvo4g
         yP1pzC9VMQQ1R04g8SVzh+5hOItwdcBxjIbfUxCU+r/KmvPwuRlRcIHc96NOeV/pPzV0
         9iLSpYO0/LPPK2rbb/VtcHlXTGD0F0tDvwUtpsYDJ889qudcVgP154GpunRoxGjnqwYF
         kpgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747834005; x=1748438805;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vsAPeVY9F4Ep0Af1IsuKENhPXpnyEXq+ZRKN1+hGmWI=;
        b=MUwdzRbfKKlAQSCfPSChgCtvxcy4HmDZbW9NWXwYwQczxeQX5SgiCKnM4LxlhxT+Lz
         9SphNmAcHOKjCUAkHQ7jZYIh93eE5QpBegvZ2MQi7M/AFLtJNE2k2Rwerg/Jf3s2VzVK
         nL0FuBz73PyQdZBb+oCGszIloz94Gi+k4p4LtpwJxCsFO/TQKqqMsakdd94AnvC32Gja
         fRX5jfq1izTqOLaFZJnu+IWKcPlVb8jBHUZRKD3dc49+nIApReI/pUVi5MK6PF/APXa3
         GmIfelKCU+pIlM+Fkh1xD63IxPLRfaqSLaYmCY4a3m1NPkLdGsaPSp5yli1ylRv7YVe0
         19bw==
X-Forwarded-Encrypted: i=1; AJvYcCUNwi2fodU6WagO3ft4xYBogpmrj3ZlJMBpZ8A/GO/gPdtQLvajidHBIeO8olvQBz2XbaRuS/2LNKd0xi7G@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ1lV605iIn75akhIk+KdtSaW2ki6/YLdDgOfkXwyeH7SApu2T
	5ynnwLtlQ8DQ/5QfO+2PlvF//4fFfWTd852hb5H/NGcPQmELyZT/Lh4/ufsUpOYOjw==
X-Gm-Gg: ASbGncvrBSs34UG0XOAkwW72fSQgl9Q0pj8abR/rYdZtRIDdE270JxaIJ7I+Gz/SpvD
	/l3JUpjHycEDPjOKegtMCHcpgMWBFgJz5FNo/s7ZJ6on1sn+VaBhaqxLiTeGou+KyjApbrsU9el
	rl5eeb1ara4rimEv8EhboPnN8SYODeQwRTFoA/oONenFin7ydJcx04lSH1F5Vv8hCwqgl4z4ViH
	/USJljWorxYu3oGmBrplE+OACa3SpCdzbm3SZK0HW4L+D7hbUaHsZFSskJERxQ0pci+x02X1Fqu
	TpLyFjyzTZsQ1PEJylNrdwq8YrkOBSuyIv2Shu+rACCoFS3edXvG6Q9+krsrhobueOfL+iU=
X-Google-Smtp-Source: AGHT+IFBDTatb/Wv2ODO3rVWJekx3BLDAeNfQgIP1zt45t6SjBWL/VcQDCAoRuUemYsln1KAeEC4/g==
X-Received: by 2002:a17:902:efc9:b0:231:fc6a:244a with SMTP id d9443c01a7336-231fc6a24a2mr179505555ad.2.1747834004862;
        Wed, 21 May 2025 06:26:44 -0700 (PDT)
Received: from thinkpad ([120.60.52.42])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2320418f249sm74691545ad.215.2025.05.21.06.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 06:26:44 -0700 (PDT)
Date: Wed, 21 May 2025 14:26:37 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, bvanassche@acm.org, 
	andersson@kernel.org, neil.armstrong@linaro.org, dmitry.baryshkov@oss.qualcomm.com, 
	konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com, quic_cang@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-scsi@vger.kernel.org
Subject: Re: [PATCH V5 04/11] phy: qcom-qmp-ufs: Refactor UFS PHY reset
Message-ID: <mwcqp3mxuheffc6x7w4w5mykqc57ovmvyrmh3ky5czjf54wnag@fxnxgsoi6y2u>
References: <20250515162722.6933-1-quic_nitirawa@quicinc.com>
 <20250515162722.6933-5-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250515162722.6933-5-quic_nitirawa@quicinc.com>

On Thu, May 15, 2025 at 09:57:15PM +0530, Nitin Rawat wrote:
> Refactor the UFS PHY reset handling to parse the reset logic only once
> during initialization, instead of every resume.
> 
> As part of this change, move the UFS PHY reset parsing logic from
> qmp_phy_power_on to the new qmp_ufs_phy_init function.
> 

More importantly, you are introducing the phy_ops::init callback, which
should've been mentioned.

> Co-developed-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 59 +++++++++++++------------
>  1 file changed, 31 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> index ade8e9c4b9ae..33d238cf49aa 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> @@ -1800,38 +1800,11 @@ static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
>  static int qmp_ufs_power_on(struct phy *phy)
>  {
>  	struct qmp_ufs *qmp = phy_get_drvdata(phy);
> -	const struct qmp_phy_cfg *cfg = qmp->cfg;
>  	int ret;
>  	dev_vdbg(qmp->dev, "Initializing QMP phy\n");
>  
> -	if (cfg->no_pcs_sw_reset) {
> -		/*
> -		 * Get UFS reset, which is delayed until now to avoid a
> -		 * circular dependency where UFS needs its PHY, but the PHY
> -		 * needs this UFS reset.
> -		 */
> -		if (!qmp->ufs_reset) {
> -			qmp->ufs_reset =
> -				devm_reset_control_get_exclusive(qmp->dev,
> -								 "ufsphy");
> -
> -			if (IS_ERR(qmp->ufs_reset)) {
> -				ret = PTR_ERR(qmp->ufs_reset);
> -				dev_err(qmp->dev,
> -					"failed to get UFS reset: %d\n",
> -					ret);
> -
> -				qmp->ufs_reset = NULL;
> -				return ret;
> -			}
> -		}
> -	}
> -
>  	ret = qmp_ufs_com_init(qmp);
> -	if (ret)
> -		return ret;
> -
> -	return 0;
> +	return ret;

This can't be:
	return qmp_ufs_com_init; ?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

