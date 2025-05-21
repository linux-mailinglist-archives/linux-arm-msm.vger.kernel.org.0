Return-Path: <linux-arm-msm+bounces-58918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1F7ABF70F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 16:05:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A091188398A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 14:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C690F18BBB0;
	Wed, 21 May 2025 14:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xBCc0l8X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DE21514F6
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 14:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836309; cv=none; b=EnkMDOG3FLVNE/xNUPnmj/FIFhNA07mtQMpv1YvXco0mc6onMZ4UB3RMQvALuGWUk7J68KE77LzunJPURxPxvg8Q2y0z05OZqoUIcucQ4FuLugL31SICz2bwYuPDj8oUDdaQY3YjRewGhoJusL3ZmlCyw0YxqfNgg+LnPAKha1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836309; c=relaxed/simple;
	bh=puxAM9AwUJp9W1jBndlWS+mZl9YN0rRXHwqPJ5st7no=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQGdCCl8pt+9IbQtg3Wg8bg2h9CCTcxdFEwSuWGA3+UVt2yhMuHMRBY2K3BLQa6N22Z5EE6MYAM+TSTUvpW/0vUlhGv5yiJt+vqXmgQpntNDCL05yo/VFcTu6VQnQSxRG3yScOA+eJlLGtinOb7geJwzyspuX5SmwMFpSjCaXz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xBCc0l8X; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-30ea559c18aso5401518a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 07:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747836307; x=1748441107; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oUWooNZYiRwIGE0ZkFwzsulXCDj0quWAKViua2SU9iQ=;
        b=xBCc0l8XvPFUNTkCSRJ+rJRdSJ0cqfoJc2iZWYSzEAehFHX1nji/w65JA20L3hg7K8
         tzZh1xs9i+zQ+2D780F/E53CGHgFKP1QJaSk3Szmgl2/axF+kciOFyMRfw4n5bGTmU6D
         dtX2hk9wkyE5Z3lhfYQo39OiEHrB9WejX0VsDjem0cBM5CZf9oC9rrk/LrftjzyokB10
         CvE/3pfuJBXUQn8XX6a0ziTd6JtLrPV1TUtRegjgP+L3j8nyfw6Fxdl6+tNAGG7P+JRw
         Gct+sE7Y/+NC3zyfuWCYsWRhy9BtAhxXu5L+0hi/bJ1fpLsjvc945MnajnvvQlC21vJd
         mmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747836307; x=1748441107;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oUWooNZYiRwIGE0ZkFwzsulXCDj0quWAKViua2SU9iQ=;
        b=UMAOz+pRgtJ0OJ3VpcyLBJzQi0AOAORH34FQ/i9SI0qImIc6CRLL8g6oIENC6/mTaZ
         x+d8SeikhWf3AcGTHSsT/8REMOx4z9Vn8zr+cIglFVGI/bQZ2+TheDbMLz5xPAzc4SGe
         /ahG7tto2Hj3nmt9THywZ2cAIwr051p+8e3azCnkDINo5feGcYdTr0iDxYn4kJvXp2JV
         2O7fmqo4m+6+zAMq5ItFmEWcgGCVb22zSmDza2s3ilkQ6YHCCgg8QfV7syYB0fSFnGMx
         zZRJ5R25X85SduxNsQf6ZZ9i608OnURol2A3lcc5KSrWeXL9/ILBNaAxJlE8H+wt6EXT
         iZrw==
X-Forwarded-Encrypted: i=1; AJvYcCXOcSwBwj2asrWeIjAAWhap85WOY5W4m0v0oyW1nF1uKQA7sbnOe8ha+Grwn7qciSRBO59mSIJuw+n/pnaS@vger.kernel.org
X-Gm-Message-State: AOJu0YzWOgZniGXcHfGhizAFbUbFZ9agQ267FXWi/qum4ZswMwvQFtAP
	n1c+19lgZMYWpWy0zFrILONYUTudf3NX7TmPSBh11WkuVNiWdJd2pcGmvRacPZhlOQ==
X-Gm-Gg: ASbGncuJtIoUoSeZZICisuT0Kpq5t9+ggMI1ObkqGOAZ1GY+N1kaNpGNZKAN2xBfnYX
	FUByEezr+uvvDzPMljug5SZUyB/C+nCPzBYIBzSX3AcctUWoLOdNFyQsDAkIoU9p3XpcQ27zktO
	BroOmURUoZ0liJiUke2PiF82WEXn9S0xPs/h7k7KFSdfsFdTnm/ez1qchPBmcwVcVOrS4QwIzzD
	l+Qu1FfsPFEHEHVMbAXAsNhYhYMWpx9Dt/l9775CrXJ2Nd2OevOZ5/c6b7YFdNZVsm8h//4hd0Z
	ol1PYx8KV5GuDUOs107y+UMW28v9bpShx8C1Huh4YTOLHdb0+60jyoi9MEeR
X-Google-Smtp-Source: AGHT+IGF1UnNuTClUj3F4HuLJBTg4YIotq8v2Lv2C3f9MvdLIN/G13XG5gdSvc29YxyEeac8afv8yw==
X-Received: by 2002:a17:90b:4f4c:b0:2fa:137f:5c61 with SMTP id 98e67ed59e1d1-30e7d51faa1mr36743016a91.12.1747836307303;
        Wed, 21 May 2025 07:05:07 -0700 (PDT)
Received: from thinkpad ([120.60.52.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-310a67c5703sm1028239a91.2.2025.05.21.07.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 07:05:06 -0700 (PDT)
Date: Wed, 21 May 2025 15:05:00 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, bvanassche@acm.org, 
	andersson@kernel.org, neil.armstrong@linaro.org, dmitry.baryshkov@oss.qualcomm.com, 
	konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com, quic_cang@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-scsi@vger.kernel.org
Subject: Re: [PATCH V5 11/11] scsi: ufs: qcom: Prevent calling phy_exit
 before phy_init
Message-ID: <xxkv25y4m2lr6746fddzlxmgmgqazdqh2pjfzymuatkmrthsnw@6i52rpntjl34>
References: <20250515162722.6933-1-quic_nitirawa@quicinc.com>
 <20250515162722.6933-12-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250515162722.6933-12-quic_nitirawa@quicinc.com>

On Thu, May 15, 2025 at 09:57:22PM +0530, Nitin Rawat wrote:
> Prevent calling phy_exit before phy_init to avoid abnormal power
> count and the following warning during boot up.
> 
> [5.146763] phy phy-1d80000.phy.0: phy_power_on was called before phy_init
> 
> Fixes: 7bac65687510 ("scsi: ufs: qcom: Power off the PHY if it was already powered on in ufs_qcom_power_up_sequence()")
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>

You should move this fix to the start of the series so that it can be applied
separately if needed and also to be backported cleanly.

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 583db910efd4..bd7f65500db7 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -540,7 +540,6 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
>  
>  	if (phy->power_count) {
>  		ufs_qcom_phy_power_off(hba);
> -		phy_exit(phy);
>  	}

You don't need braces now.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

