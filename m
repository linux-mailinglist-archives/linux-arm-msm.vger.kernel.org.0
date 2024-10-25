Return-Path: <linux-arm-msm+bounces-35791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7837D9AF97E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 08:02:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF286B213D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 06:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C590D19B59F;
	Fri, 25 Oct 2024 06:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YPC4lvjG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9195E19309A
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 06:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729836144; cv=none; b=IpJxwwtYcn1gGyS7OUI2JCobsD9i4K573i8dkHHS6V9VZfmwUxEcm8DQxCeeW7xeMO5C5kTlCx/7Yc5mMxKc2fnOi85T+lTlhwOXprKVBvmXDQKXdojsDtVtZPrmJO2XmSwUY8wSc20Sh7umP15ywb7BkdGHR7IZmqA9UlqzZCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729836144; c=relaxed/simple;
	bh=PS5iJjvSFPbK5FEXLziypu7fTXMABNu84miiYhvpt8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hphKpl1EHz3jeueKi/cYUZrXN0G2ck4ICO8m21yXKdCYpQJI+7fWyeJrmyS46XnsyRVgOteY1OPoPvcuAgwXAibZwXWqtEOl1vRI16jpJdSJNQP97cy4qQrpK1eTxaEfLOYy+EgHJ31hctFgdTaI39Q10g9TS3k5loizVdkt3zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YPC4lvjG; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539f7606199so2096095e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 23:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729836141; x=1730440941; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7HDN7ytRNWgu54yGYE5OkdeWkkOZdTmdIR9oyQdGmkg=;
        b=YPC4lvjGrXV/e7XuVcUlAJMetKo3liaO4LixX3V/1GM7SrCn1kUfN0prk1uAChgnfU
         iG2cLDLFdhdRAtYvrdSFhy7sjZO5cjZN9H6vfPc52EAqwKKouJhoKVGk81XoUwyqX2aW
         jzGb0f49ZaU48MFu9kwj2WDF9m4EdCzvOTwiNxlqpT8oYRsu04zwV14Yly2kG4SWcnRm
         ladZyB7EBfDofBzO02LY6xCeHJ5VGFHAdt0kb/T6+1gdwyU+CVzQq92AxD0DCkvlXNyM
         jJBGkKoTz5aN8IDtXbfowk6vELZ+sEZrslYzavVqRVB+HkhzWy5WgWkFDrzubYckPPGO
         xXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729836141; x=1730440941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7HDN7ytRNWgu54yGYE5OkdeWkkOZdTmdIR9oyQdGmkg=;
        b=UTkCMGNlVFjrupeaN+7E10AId58M6W016BKJsblTnZzsX4H8boirWtKlbv5482dBp3
         9+hUhGvvUYKSC+lVBYT1le5g6w0UldFDfFLT9xMyEXPsjLogNpBR7o+sNo5VUfL93Xf7
         OhSX2sEVBnSVTs19WPacJIIdd4OZN0R1O8Jq2fivERI8bXsBeF7Kl6njuMsPfiNpI7oQ
         +A6wK3nMC4C7Pk+SFzxj7lrrV7+k7E8tc6GDf+niTg0BLpEA2CpH3eO78fpzcwokO20h
         OreXjMkDyf9WFujB5N3gdaKeJ1c+NA/ZDug+KUoHNXeE5iRIFrwOCL26jomaiHCiYO+t
         LVBg==
X-Forwarded-Encrypted: i=1; AJvYcCXsjPN/KaY3ujJ/pe5w+VT6Z6cClGXkHtp+i9cXipTVPpAAolCfPxu45yjxiM6qCA+jXqabRGrxY3WciMn/@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm+jVkwhIXQJl/nVs3C9lBVPD1BmhlP51VSmOVCWszzaRnlruo
	oroG9cjwZG4pVJcthlb3Q/6hu3gFUIL+WERt0/cDhr+DW2a9C+f2CaELv/AfjkY=
X-Google-Smtp-Source: AGHT+IHSF6yq0M1S4molwHLUXGCrEjlPNYfcVTYft5wUoKPFyLEjD1ZMI1kRxPr5tkpFvG1fma7bFQ==
X-Received: by 2002:a05:6512:3d17:b0:539:8c02:64d5 with SMTP id 2adb3069b0e04-53b1a32ed07mr5399220e87.27.1729836140645;
        Thu, 24 Oct 2024 23:02:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1af34asm62909e87.144.2024.10.24.23.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 23:02:19 -0700 (PDT)
Date: Fri, 25 Oct 2024 09:02:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Qingqing Zhou <quic_qqzhou@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, robimarko@gmail.com, will@kernel.org, 
	robin.murphy@arm.com, joro@8bytes.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: qcs615: add the SCM node
Message-ID: <flk7n534gfqyivlbl72qco4k5d3c6ravevumjfoh6464pe3qg4@r7ns6zr2i3bv>
References: <20241025030732.29743-1-quic_qqzhou@quicinc.com>
 <20241025030732.29743-4-quic_qqzhou@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025030732.29743-4-quic_qqzhou@quicinc.com>

On Fri, Oct 25, 2024 at 08:37:31AM +0530, Qingqing Zhou wrote:
> Add the SCM node for QCS615 platform. It is an interface to
> communicate to the secure firmware.
> 
> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index ac4c4c751da1..027c5125f36b 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -278,6 +278,13 @@
>  		reg = <0 0x80000000 0 0>;
>  	};
>  
> +	firmware {
> +		scm {
> +			compatible = "qcom,scm-qcs615", "qcom,scm";
> +			qcom,dload-mode = <&tcsr 0x13000>;

No CRYPTO clock?

> +		};
> +	};
> +
>  	camnoc_virt: interconnect-0 {
>  		compatible = "qcom,qcs615-camnoc-virt";
>  		#interconnect-cells = <2>;
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry

