Return-Path: <linux-arm-msm+bounces-11365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA80F857EB8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 15:08:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59D601F21023
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 14:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1201412BE9F;
	Fri, 16 Feb 2024 14:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JEJxSQkD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A2812C526
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 14:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708092507; cv=none; b=S9DvJrZSnB+yyqaqjvLzrc6AfXC7sRovN3N3WjI9CqlcCAra01oBi+3a8/48ils4F5OMrlu3ni5fmprvWQlokpLolt4JS/LMjHh8wno05MNyAYOqIql3w4RxuuvS0ZUtSDgDeHpDiQUFpSNFtqwcf6DSmH8htKDJhaoqF6FxlEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708092507; c=relaxed/simple;
	bh=VWBsKuNrGY4MHfVRFud0fpjtMJD9nw9ddeYFNhkmHOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BR4rs2hlwAS+eNhjzEpERe5b0jYCHl5NpKSaeoCUzCMIvT8rYawpssPcYF+SGIJCOx81L9nk1DAKryB6G6jNgEgOXfDqOQ18oLyElYD06ByV/UTST6H6c27+IO08eDqm0HEypn3cnoAUY7JxCb+8TpnkYPTfoTNPygYzMWxDbKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JEJxSQkD; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1dba177c596so7634145ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 06:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708092504; x=1708697304; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hDNGahqQJk0+PITO4aJ9GSNZ6MTNzgQKhJKA5SQZKi8=;
        b=JEJxSQkDlBSxDwr2A8IeMR85T+g8S+1tDUy1Cfi6B1n1uwMyXmUDPZVF363lc/8gFI
         OslOa/0P+EORrnKMizcJXnAhGbtxJXZnTKcM76Z8wEAlMW0VE7twP5CCp1n89bENMO4T
         d1LYqv0oWvSogkJ/HTe8SKyDChlQkMLzwOgAR3WVLGurUSFuM9wwY2SnNVhhsrkT8MLp
         +XiC7bxox//Im/muCdXrCO00Z+QLw1Nhg6IfVyEtZASLE3AL3jjAPuEBYK5QemohBx2L
         ChwP9L6AFosAh1jCm+U769bytLrJZ16v3YF6u8MWKB0K9CxsKsMPgvEBuhYhCkJAHWZ6
         TUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708092504; x=1708697304;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hDNGahqQJk0+PITO4aJ9GSNZ6MTNzgQKhJKA5SQZKi8=;
        b=dPJEtPgr3NcVkSSdAsMfjg8Fiexnk7PBVKaWoRRuxWmis+nL4CqIfzz5ONlVM4Di69
         4GJfsjfSsbSoZDznoyAb/A/t5B2dJaOlplkaxvIaquiqRZypqXJBXJgP6+HNseYSf+n2
         JhMLu7uR+3PBUuexJejRRZG6nb5ReYPrFOP3iF5WyN7RtEXVyb/kqfYiJbZt3Fep/t4w
         bYaJqsijBK34UUHCvkwnk43kP0VVkDDXoQx2aGC8DUHMiNqrEOadk3ikJYIzFise6VW4
         F+NveRWDpfeM9mEGAJhrpE2P1exTs5kmYDyAdmjfJL80lTxIlCT4Qdg0WPYb9M9Ih9li
         PChA==
X-Forwarded-Encrypted: i=1; AJvYcCUkTaC/lqTlWUIfl/zBlDlMnwVgslsCtBwmiwTPFkPyTP9GYLs0XmSfsIWDUfagbAHsCLczDEb6QmCtr9oSnuUeBx5KMNJRVTpPFzSsTw==
X-Gm-Message-State: AOJu0Yx9SL/3cDO1MQobcZiWN5zPJYpGgIH5RuzBPGjQORHIjw60Xe0n
	UTEFWxRNPsm2Fewa7JBAts483EqCUtNrJzq7NTDY6O1vdvsEvEKhtrJjsBqjdA==
X-Google-Smtp-Source: AGHT+IEJ67yKNp9ZCPVkUP0bhXP3swDJdkIjJCRgMu0wYsy757xU1RvqSe3sdhXohwWYryr7nTgkZQ==
X-Received: by 2002:a17:902:7c8c:b0:1db:47bb:671b with SMTP id y12-20020a1709027c8c00b001db47bb671bmr9327518pll.19.1708092504602;
        Fri, 16 Feb 2024 06:08:24 -0800 (PST)
Received: from thinkpad ([120.138.12.48])
        by smtp.gmail.com with ESMTPSA id jl21-20020a170903135500b001d8e41b3f95sm3036484plb.51.2024.02.16.06.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 06:08:24 -0800 (PST)
Date: Fri, 16 Feb 2024 19:38:18 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Nitin Rawat <quic_nitirawa@quicinc.com>,
	Can Guo <quic_cang@quicinc.com>,
	Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: msm8996: drop source clock
 entries from the UFS node
Message-ID: <20240216140818.GN2559@thinkpad>
References: <20240213-msm8996-fix-ufs-v2-0-650758c26458@linaro.org>
 <20240213-msm8996-fix-ufs-v2-6-650758c26458@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240213-msm8996-fix-ufs-v2-6-650758c26458@linaro.org>

On Tue, Feb 13, 2024 at 01:22:22PM +0200, Dmitry Baryshkov wrote:
> There is no need to mention and/or to touch in any way the intermediate
> (source) clocks. Drop them from MSM8996 UFSHCD schema, making it follow
> the example lead by all other platforms.
> 

Okay, here you are dropping the "core_clk_unipro_src" anyway. So my earlier
comment can be ignored.

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index ce94e2af6bc5..f18d80a97bbf 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -2047,24 +2047,20 @@ ufshc: ufshc@624000 {
>  			power-domains = <&gcc UFS_GDSC>;
>  
>  			clock-names =
> -				"core_clk_src",
>  				"core_clk",
>  				"bus_clk",
>  				"bus_aggr_clk",
>  				"iface_clk",
> -				"core_clk_unipro_src",
>  				"core_clk_unipro",
>  				"core_clk_ice",
>  				"ref_clk",
>  				"tx_lane0_sync_clk",
>  				"rx_lane0_sync_clk";
>  			clocks =
> -				<&gcc UFS_AXI_CLK_SRC>,
>  				<&gcc GCC_UFS_AXI_CLK>,
>  				<&gcc GCC_SYS_NOC_UFS_AXI_CLK>,
>  				<&gcc GCC_AGGRE2_UFS_AXI_CLK>,
>  				<&gcc GCC_UFS_AHB_CLK>,
> -				<&gcc UFS_ICE_CORE_CLK_SRC>,
>  				<&gcc GCC_UFS_UNIPRO_CORE_CLK>,
>  				<&gcc GCC_UFS_ICE_CORE_CLK>,
>  				<&rpmcc RPM_SMD_LN_BB_CLK>,
> @@ -2072,8 +2068,6 @@ ufshc: ufshc@624000 {
>  				<&gcc GCC_UFS_RX_SYMBOL_0_CLK>;
>  			freq-table-hz =
>  				<100000000 200000000>,
> -				<100000000 200000000>,
> -				<0 0>,
>  				<0 0>,
>  				<0 0>,
>  				<0 0>,
> 
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்

