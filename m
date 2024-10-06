Return-Path: <linux-arm-msm+bounces-33282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A856992130
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 22:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17496281608
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 20:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD0DB18A6C3;
	Sun,  6 Oct 2024 20:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r4HrfYLr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5AC16E863
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 20:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728246899; cv=none; b=uLMnosIPLC0AKLrF3eqbphE64xO/zeTRrVfvtdEkzL69/RwwVlH49K1TQZxqGaj3Q8KK6MyQOVNvzkcVB0DlckI82pmkVhEeOCiNgB9bpM7VsVFj9YD1xTWZR3AA2Q/ZNSaYdt3sjjLJ4eqShsrsNrJ3IlF1VOyQWPk0LDFU/pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728246899; c=relaxed/simple;
	bh=BOB8z6S4m7Arz9F28cP4HWF7U8MzWTx6sOY/S8Q9Pc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fQPjhoANcNaTpubIN5Ir0IwjhSTdci7xSE72ky5xdsZeAOwtywFEYrLvHZePhBK9FPFB104Gc7cf9zIYi8GbmW1W+aOvEJng3LbfB7f7upSeHnIxl1sCra0LtnPiMJK+P20928VmfMppN36I76LNxsU2H1Pv+BbsdVFrhTpFaoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r4HrfYLr; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5389fbb28f3so3804441e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 13:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728246895; x=1728851695; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KsSwteNpIsR1xjaiiCzJ87ajABbsMquYMbxyKUsa7Z8=;
        b=r4HrfYLr5/n/cUPSDLZAr33lwWo/WPjuzqF9ZCXBb1ci7KC70ez3u+/WrQ8iArpX4n
         5UOLAh+koi4HzApZdeKlXArfVkVwGxZwiz0xmZSMgW12uQaFwszAdKZOHlaUZRRknsZ+
         94lNYRSyNaosOZitI2WSaJQ6gn0KKngxnqP14Cc8yvQ8JlHRGUKUyb/7EzKNrcuGlO4P
         Sfa4Ow/MH30E28tujsrshyv9ygKmGWt3ATN+RIZl6Z93n4Q6r8CutfEg5Shwo0aQcz9i
         MeDyGaxZjlZF9Kjw7eddv0isUUW0cmd5SoDqSe8DncpMVEXAEpwd8T2KfZMaK2i9VGbD
         Uw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728246895; x=1728851695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KsSwteNpIsR1xjaiiCzJ87ajABbsMquYMbxyKUsa7Z8=;
        b=SZUW9VEqpGbgz1XWP/54Ln0HoTBFtyE5MzUD6PC91xLnPotk8VdQJSclRcV2cCKcpo
         bdCLMLPh9UVW3mCk2xAclMQL1/s6BmS6WHsxjJEHqQ6Pu/atea4VUZsh25dpqKHdzEM0
         86Vlp6SCqOMfmIs7nRQWq8is2/HVb99FFgPkqtRtFse8fQ/F4/NJhSIxbo/DAcZMCan5
         pmZqdGSFFq/fW3wvZST5DMqef5PIh3fFjp0IkCF+KtEn5/LjaMWpmxcdNafFrnxzvLA7
         5VtE/w9bYQ7iJF1aUnt46AQaqvRYpntuYZIWqE8nDHg5Rc9zNvY58s+/RitAYh5SZ0Qs
         tizA==
X-Forwarded-Encrypted: i=1; AJvYcCUAhmFbL8WWcMHka4Att62O+MumdNJ4NC/Kb/O0C9Q85yelBGpGXW2CLcB9I1DsUxtAAJOdGaOTr5LvSx1J@vger.kernel.org
X-Gm-Message-State: AOJu0YxxLn/8IchF7S6F0Nx+NVvektBOkL4ax6V2y7Mup/GMar8j4ZMd
	URlUYbVzPiTMQFENeVNVcK2aR0UlI9OozWHpT1i5nYHKee5c3BhMt3+R/8Zvqww=
X-Google-Smtp-Source: AGHT+IEGpqKPZnYf+c49PCJtMCsHlNlfYiXoM0A4iU65uHRBMlYdcbTJgw/9IEtv/T0uzP6otOuyAg==
X-Received: by 2002:a05:6512:1056:b0:539:950b:139c with SMTP id 2adb3069b0e04-539a626196amr3816459e87.12.1728246895194;
        Sun, 06 Oct 2024 13:34:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539afec83b5sm612915e87.81.2024.10.06.13.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 13:34:54 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:34:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-sound@vger.kernel.org, srinivas.kandagatla@linaro.org, 
	bgoswami@quicinc.com, lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konrad.dybcio@linaro.org, perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org, 
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org, elder@linaro.org, 
	krzysztof.kozlowski@linaro.org, caleb.connolly@linaro.org, linux-kernel@vger.kernel.org, 
	a39.skl@gmail.com
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: sm4250: add LPASS LPI pin
 controller
Message-ID: <6siuxtimluikddn6seerbsyb2kkz6vncxfawleabotqcz4jy7e@ze53gesagjlb>
References: <20241002022015.867031-1-alexey.klimov@linaro.org>
 <20241002022015.867031-6-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002022015.867031-6-alexey.klimov@linaro.org>

On Wed, Oct 02, 2024 at 03:20:13AM GMT, Alexey Klimov wrote:
> Add the Low Power Audio SubSystem Low Power Island (LPASS LPI)
> pin controller device node required for audio subsystem on
> Qualcomm QRB4210 RB2.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm4250.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm4250.dtsi b/arch/arm64/boot/dts/qcom/sm4250.dtsi
> index c5add8f44fc0..37c0e963e739 100644
> --- a/arch/arm64/boot/dts/qcom/sm4250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm4250.dtsi
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2021, Iskren Chernev <iskren.chernev@gmail.com>
>   */
>  
> +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>  #include "sm6115.dtsi"
>  
>  &CPU0 {
> @@ -36,3 +37,18 @@ &CPU6 {
>  &CPU7 {
>  	compatible = "qcom,kryo240";
>  };
> +
> +&soc {
> +	lpass_tlmm: pinctrl@a7c0000 {

Please add the node to sm6115.dtsi and override the compat string here.

> +		compatible = "qcom,sm4250-lpass-lpi-pinctrl";
> +		reg = <0x0 0xa7c0000 0x0 0x20000>,
> +		      <0x0 0xa950000 0x0 0x10000>;

Please pad address to 8 hex digits: reg = <0x0 0x0a7c0000 0x0 0x20000>

> +
> +		clocks = <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +		clock-names = "audio";
> +
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		gpio-ranges = <&lpass_tlmm 0 0 26>;
> +	};
> +};
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry

