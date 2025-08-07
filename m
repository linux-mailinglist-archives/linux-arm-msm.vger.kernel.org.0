Return-Path: <linux-arm-msm+bounces-68010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C66B1D812
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 14:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2A42A4E3B96
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 12:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5079C253951;
	Thu,  7 Aug 2025 12:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V+KcYBcm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE0025392C
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Aug 2025 12:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754570245; cv=none; b=I26hiYwMSpWaOd5G0O1v8rRzfQifd8ErLMSKyOuhOvvHtzyNjUhbbbNnnaV620QlzQQlxxjKgLoMstY8ClHNUvulXNlllI1jLjUILcVHxcAWAcBsPyiBrOoiYWdhW4obAQPpBLIKFhoJislMxJGoWJQ30uuVPEWSRgfLKuLieP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754570245; c=relaxed/simple;
	bh=0HJeJ81F/fe85KKd6Kapj27WSnTdBWo7pAlxPgJ+W+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j6c7jCDO/tJfuShCLNotL02TsqPWKT2i8AjiFLE9ZXcowld0FluWTLov2AGPdi+zCgWvPoahXTe74kmEbm/fAPz1NE6t62dLVLtmzdxh4CJG0bM7pq6EdfKoeVBDEsEv4q3N4WiMBGRJvriZLoCH4skhyIRc/WAUnzLB+444OzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V+KcYBcm; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b783ea502eso730398f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 05:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754570241; x=1755175041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SssdXwaRmyli//zxIcsg2m9oDnPDhQ01niz7e6EkH/Y=;
        b=V+KcYBcm6vor/TLEdzELJDMbBpcx4fn4qeRyde73qXR311YugSs+lgKZudvQlCSDyr
         ONP8fn0i6y7u2MJvdxoK4zn6ks+y74Yj4EfC2f9P1RHd5AuJZb8hbF9usmaH5lianoFg
         b5J5Qobjc9FtpHjS814twCjD3O9y/C/oFxRXpyGGTcoRJdmx5HgGlyLA88dLWzqkMohn
         A5Jod/JCd5jLuHvYelCbIJpNX7m53nlFv6ycjw+d0mo8ctxR4N+maP5Rg6K/htP0pYJk
         YGQof2W1e8Q+80zZH1irv7r7TxEiWWZv5djNIZq9Xje8m1/5dAKTwLnJa3ZW76bsgS1B
         YR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754570241; x=1755175041;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SssdXwaRmyli//zxIcsg2m9oDnPDhQ01niz7e6EkH/Y=;
        b=Zwq0LtPH8HuSV/9OFx5IJb2ACorY4tTclhdDmNknhiB3OdCa9g0GUCmOiDzZnatCNV
         qeCCjqpcqx7oGtgDaNYZAyppFGhhRr2mIiyX+Z6t1Txd52z9pCsdpPhlKrrchwyewC42
         qo7x5E111CdpqWCKEcuLj+lmuSAJI9yyefw4gG7TafTX1Foiv1EafgcVePu1eVSEm8ii
         WIQYU2TaUwwefi+irVEU3bI/wxSTE05W1DZTr/lE4PTi+UdUOyasG+vQ2IgwS3k+61p1
         B7+VjqO+OUlqWUc0//JEupznKrjDSx0U7QCrJ3anSh5c/vezr9B/NFhom8EmJeRLO8hV
         71jg==
X-Forwarded-Encrypted: i=1; AJvYcCXVE5N1MI1TpucKIuJeV0/ZBor3PDISBVQJ8kLBIOaJpl+TLCOA235Tsk0KBN/kjfdmeZ2BzhMnAGIoWBav@vger.kernel.org
X-Gm-Message-State: AOJu0YxGyokf4W3nvyNyB2CUE6Sr9cDkXtgi8su83kP/zdf2rHaPIm/q
	87/ItyUCvhUFq1mPbhZ88FZNjGMEvrYGn/iG9xP9N9uC7m4gsZoU35OSJk0N7NeeIAM=
X-Gm-Gg: ASbGnct3p+VJcmZT553evRS3Z+JVzmQ5SO+JEJmvr1iCTlgCs2mw9aGScoOwmv7MZzc
	wj7XLV9Z61YQnBG+/jdCHsjOeGdZDWAUeUosi0H93hRDIZjvPNrJEyNnG3AdvtLQ4OHZTHhNjjo
	rz27tQs3a6BB5WdR4R1WAZEliLx+NmFayV/fWrBCcgyAbg1xlFJ0j1noAp+vtw8xPU3gHWYeOqk
	ccoJBs+C0rqsY0fOS0jBClGPwvXDiONtqMCeMZS3wW2brJiOP97diJ58dt5lkNmrova+fvLFU75
	LNoD5mtHeCon1Jz4Cigxg6UewawE1gcIjO4DUcAmAjigmZPrDWHO0DzxG3PJOLd6j7ysqqnw7Na
	8NCuX47DJIomOJwTFY5G1ROPj28VkS34eV6QDGMHFu1Tc+AvqxYkutm+zcntAFho=
X-Google-Smtp-Source: AGHT+IFOEsRG8ebIvvAsL7B/AJ9oBvQYifwwUwKVZY3a9oI94ficILiwiXeFUjcUVB8C/IvgBehkEw==
X-Received: by 2002:a05:6000:310b:b0:3b8:de54:6e64 with SMTP id ffacd0b85a97d-3b8f97e6e52mr3149326f8f.26.1754570240565;
        Thu, 07 Aug 2025 05:37:20 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4532c4sm26483493f8f.36.2025.08.07.05.37.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 05:37:20 -0700 (PDT)
Message-ID: <dcc33f04-1b19-47d7-aca2-03d38173b6b6@linaro.org>
Date: Thu, 7 Aug 2025 13:37:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] [RFT] arm64: dts: qcom: sm8250: extend CAMSS with
 new CSIPHY subdevices
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
 <20250612011531.2923701-10-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250612011531.2923701-10-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/06/2025 02:15, Vladimir Zapolskiy wrote:
> Following the new device tree bindings for CAMSS IPs introduce csiphy2
> device tree node under SM8250 CAMSS, which allows to perform camera
> tests of the model on an RB5 board with an attached vision mezzanine.
> 
> Note that the optional 'phys' property is deliberately not added.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
> For testing only, do not merge.
> 
>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index f0d18fd37aaf..401a32679580 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -4613,6 +4613,10 @@ camss: camss@ac6a000 {
>   					     "cam_sf_0_mnoc",
>   					     "cam_sf_icp_mnoc";
>   
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
>   			ports {
>   				#address-cells = <1>;
>   				#size-cells = <0>;
> @@ -4641,6 +4645,16 @@ port@5 {
>   					reg = <5>;
>   				};
>   			};
> +
> +			csiphy2: phy@ac6e000 {
> +				compatible = "qcom,csiphy";
> +				reg = <0 0x0ac6e000 0 0x1000>;
> +				clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
> +					 <&camcc CAM_CC_CSI2PHYTIMER_CLK>;
> +				clock-names = "csiphy", "csiphy_timer";
> +				interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
> +				#phy-cells = <0>;
> +			};
>   		};
>   
I don't think we should make this change, for CAMSS in general and 
specifically for sm8250.

Instead I think we should go this way:

https://lore.kernel.org/linux-media/20250710-x1e-csi2-phy-v1-1-74acbb5b162b@linaro.org/

With separate standalone nodes, and reuse of the upstream PHY API.

I believe you have a series for the 8650, please rebase on

https://lore.kernel.org/linux-media/20250710-x1e-csi2-phy-v1-1-74acbb5b162b@linaro.org/

and

https://lore.kernel.org/linux-media/20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org

V2 of the CSIPHY above will incorporate feedback from Neil and yourself 
on adding endpoint@ to the PHY however I think we need to have a 
conversation about standards compliance at attaching two sensors to one 
CSIPHY without VCs or TDM.

---
bod

