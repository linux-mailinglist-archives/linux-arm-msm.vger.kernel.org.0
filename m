Return-Path: <linux-arm-msm+bounces-20567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 806598CFC65
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 11:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BE712810BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 09:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFFAD763EC;
	Mon, 27 May 2024 09:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iJFFVgoJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDD71A2C35
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 09:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716800618; cv=none; b=kICLLKJwHn5rWvzpDXK0itNk0SoWFPcORW2w+IhPr7X68qOoa10VbXNLrG2GhX9BRkA2IgVXnjNuUYen6Synxaiu/HUfVbIjsaDVDb2W54Y2Ir/Iq8+B5I7zyALfhqq45C92FlIHyFSXub/hBtge3AwtPfxTi+lpRln191jJXzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716800618; c=relaxed/simple;
	bh=G5Bh2X2s8X3dIBYLrkIYsnBHdHVh3//9YRXeeJxI2sQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IxhbiiBncwJt9RILDzQh3Hpsq31aY5BeJqDfRqNLmRDzxDYTw3iFg800XnPxdYxham0uaL2/kKb39d8PyP80W6R14T3bzybW/psABL8u1o9MUI+AuEM6Wuewal4QpMuUMKOvw9cfaldHRlXzTSIpBETKrvp+8q8Fu6xx04mH+Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iJFFVgoJ; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52449b7aa2bso8338177e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 02:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716800614; x=1717405414; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pDbfSg8Bk1OlV44IsJpk4n7yxHQg+kBBcGX0Pm6RSHY=;
        b=iJFFVgoJ6Ex4O0PBiwRP671jlXp2VHvYUrmohAPCHAqP/fuYB33g0cBNPTnhMhTdkL
         eIiygNBp3N7sQj5gSvz4Ijd5YrdoUJsnqjV6NXqVnv2Pt6W+KyF8Wr9upFj5x2GVHWPZ
         zxMxnZJJj/91KxqmgLL2qz2sxjxnIMwxWeUi6S7cMbZTG/1weaM38O/XLrusPqXAdmaQ
         7sjdsyyRDpbRGH7p0Mf/6+vxFxl6NlKO1iGC5tJI0qcvglUj6uFNH2YW5zvLp62t2c3L
         imlig7IdorX7t9MAxpnUHU7xCMSTXN29q5sAogRPMXoVytSOO363MyP+qFT96XOUg7jV
         mh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716800614; x=1717405414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pDbfSg8Bk1OlV44IsJpk4n7yxHQg+kBBcGX0Pm6RSHY=;
        b=Nb18s3dccJAm2OK/Fx3vj9pGsjH+/Spe6Q3H+F6VUTZeMFyPHO1MKGMcjqteFvcKGG
         WNUTkDdCMVsqz8XRJf25KzaoWKkBl8ae1CRjf4id8g/nUIfNvrzyApQ54WK6OSIOiIlQ
         JpMpACFnjdshFEqehGOo4N7J49Ji2fK1WbqYjHfvmoXwJxpS6/mZOGWzWVk5Zvv7Ta5z
         y/PffN4OkV7m/re9Tqh0ecuQozEwE2gwmev6iA0wzecIzyuHO3EsisDyB5VbU47727l5
         O5Xix/SZvrlux4YnxIZ90IHUQVgeLnb0WKVLhUXTG7kkPezFJ9eLrgNo8ulaU0xVZvJc
         gqyg==
X-Forwarded-Encrypted: i=1; AJvYcCWr8rJZfXTZ7eBaKUS29JERyxmnotmzmq413Ue+v+x6wo8MyJmDue/N3pZR0BzFg54gsXvQMexlfGXbIfqRne+LwJhAbgp4fYSNGeYNqg==
X-Gm-Message-State: AOJu0YzqpiPk9UgrouZLl7hMbXzjkuqb3Fh9lMRl3SYel6sRKcqb+PxZ
	ROlCIi7lCxDz/7NdH+mSvMFu16ax2FD67JTP4qVJwqaSKkbxJPE942vEOQ0v24M=
X-Google-Smtp-Source: AGHT+IEmCeUDXcsw6FPQgssqSnh256ZdtCG0rOxDKXtIzEh9uHIxpd7toGyYzGtLMhIFgkbWc1Awmw==
X-Received: by 2002:a05:6512:1d0:b0:527:a952:44c with SMTP id 2adb3069b0e04-52966ca6455mr4519498e87.55.1716800613864;
        Mon, 27 May 2024 02:03:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5296ee4a9cfsm490355e87.75.2024.05.27.02.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 02:03:33 -0700 (PDT)
Date: Mon, 27 May 2024 12:03:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom-sm8550: allow 4 lanes for
 DisplayPort and enable QMP PHY mode-switch
Message-ID: <jwgt2aa662ig7max5k7f24uu4zpv4urvg5aplgl2pwo2ty4zp3@a644uqdn2avh>
References: <20240527-topic-sm8x50-upstream-phy-combo-typec-mux-v2-0-a03e68d7b8fc@linaro.org>
 <20240527-topic-sm8x50-upstream-phy-combo-typec-mux-v2-5-a03e68d7b8fc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527-topic-sm8x50-upstream-phy-combo-typec-mux-v2-5-a03e68d7b8fc@linaro.org>

On Mon, May 27, 2024 at 10:42:37AM +0200, Neil Armstrong wrote:
> Allow up to 4 lanes for the DisplayPort link from the PHY to the Controller
> and allow mode-switch events to the QMP Combo PHY.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 3 ++-
>  arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> index ccff744dcd14..a95949c01f25 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> @@ -941,7 +941,7 @@ &mdss_dp0 {
>  
>  &mdss_dp0_out {
>  	remote-endpoint = <&usb_dp_qmpphy_dp_in>;
> -	data-lanes = <0 1>;
> +	data-lanes = <0 1 2 3>;
>  };
>  
>  &pcie0 {
> @@ -1280,6 +1280,7 @@ &usb_dp_qmpphy {
>  	vdda-phy-supply = <&vreg_l3e_1p2>;
>  	vdda-pll-supply = <&vreg_l3f_0p88>;
>  
> +	mode-switch;
>  	orientation-switch;

Please rebase on top of https://lore.kernel.org/linux-arm-msm/20240429-usb-link-dtsi-v1-0-87c341b55cdf@linaro.org/

After that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


>  
>  	status = "okay";
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> index 39ba3e9969b7..fbac5270b4d7 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> @@ -795,7 +795,7 @@ &mdss_dp0 {
>  };
>  
>  &mdss_dp0_out {
> -	data-lanes = <0 1>;
> +	data-lanes = <0 1 2 3>;
>  	remote-endpoint = <&usb_dp_qmpphy_dp_in>;
>  };
>  
> @@ -1142,6 +1142,7 @@ &usb_dp_qmpphy {
>  	vdda-phy-supply = <&vreg_l3e_1p2>;
>  	vdda-pll-supply = <&vreg_l3f_0p88>;
>  
> +	mode-switch;
>  	orientation-switch;
>  
>  	status = "okay";
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

