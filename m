Return-Path: <linux-arm-msm+bounces-14347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B14D087E45D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 08:52:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1DC41C209AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 07:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED95123769;
	Mon, 18 Mar 2024 07:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J7ibRxRA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6947E2374C
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 07:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710748354; cv=none; b=Plj9kxqG8xK9T/BzFNsT5IrfaGkX6zOBOBjJO9BMUqhYOoLqyiv4U1X/1m9Am9P/7kEywgoKSXjmHTK1hrqS5BteygmZw5e1yI8j314eN9GkLfTQ6dA2eXaTxOtHeFXdSCA1glklg01SlmAqaqjIzLkVilOql8r2jBpfFYgpDqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710748354; c=relaxed/simple;
	bh=zazXv//651U0T29J9fq1XJCUh/RsIfvPuDOTFp3e0KM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rWYFaSyosvU0L8JIuIBl0uwaK5FangeKm5HSR3d4I6hX8FuXq9khMLUw5EOxyXaax6pwKAVak93jWPi2k/rK0I7axn+Zzhe439H40Myx+8a7hDBe1RBLKPl8vkRmRO8Ulx/BDsVdoCaPUEvZTMETIsmoudV9SVgEk1ebzUEscKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J7ibRxRA; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5a492093073so946049eaf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 00:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710748352; x=1711353152; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=83R8Uatj6wulmVq12wkZ3nV2dVHPq9qw5PjOyeqFuWE=;
        b=J7ibRxRAE8RuxFO4tVubat96bpx3j9NvZeTGiubeo1z1zUlw7kSa8AnCzPa2SLVIrW
         Wgw5wmn1nWLLPrTskoCmsKExTTfd0YcayaMJg0K+cGbV6QsCbEuzoCG7rTeMA+SDz625
         Y14bw8o5sTPmSqzkHZpt7ClN9x9mBP0GnHdYdBzMiamK0lr5QmfcVAYIp0JfF0Wk3/o1
         WWioruxBhay6526c1yuMVBO7V3TiyPjFokfTrC9XCN1gpNkkKTXP0TP0xbQvftCpRK2+
         BWFY7U3ixy/TiKH3dqTWDFB2m6VZyitECaps0QCRethJuN1SyiojN3ckPv1Azo1vXrz9
         iffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710748352; x=1711353152;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=83R8Uatj6wulmVq12wkZ3nV2dVHPq9qw5PjOyeqFuWE=;
        b=OA5mEWPCuPOM6TD+k9DTZUEfSdiewpHqVZDUAlZCoFo1qCjvFIeYxva4MJWBvVB2ja
         3D2DR2RPzmjTa8+4s2VRiWSp7ILcp+xZg2DrvHiLMMNXDzIcPYxT0p3TfFqwbAay7syW
         XEPwGqISkaMbuIKfoVxSqrMtTail5Z5L9LgLwa61FVo39WuM4YwY/jzfMAKIGeqsxyqq
         xfQu2GYgF/j3Xm1IxmALzhGpKj++qlGV9jMOyMg46UiCmaaL/RpApxlFsZWKcIF0aF94
         Pc97mgFlpgp9WS5nzM6UvrSkuAo/jki5G/18oy2pEvVPcx7V6ULl9TG/85Xlfh77aYGF
         Ye6A==
X-Gm-Message-State: AOJu0YyTBUvXGqfzsoUma9aAfpHATX0EYQ7rV+uP/nb3zyDa/bpzJOUg
	BP1qYunYlbeoH6Ir/b3eCwa7Aov2QBSQngqa5xz1EC7ovUcopWPSjFVU4rklIB8=
X-Google-Smtp-Source: AGHT+IEKZIbODLoRtVMADPoPw6Avy24Us2j1ETMhuvDnqTaZz1xeROrm1/nBBrjbMVOmsYoqiP2tHg==
X-Received: by 2002:a05:6820:626:b0:5a1:2b0e:39dc with SMTP id e38-20020a056820062600b005a12b0e39dcmr5754430oow.1.1710748352403;
        Mon, 18 Mar 2024 00:52:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id bm8-20020a056820188800b005a4b2172e48sm420608oob.41.2024.03.18.00.52.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 00:52:31 -0700 (PDT)
Message-ID: <97e4e9e6-76e3-4f26-8482-7641e5169549@linaro.org>
Date: Mon, 18 Mar 2024 08:52:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] clk: qcom: lpassaudiocc-sc7280: Fix the regmap
 conflict warning
Content-Language: en-US
To: Taniya Das <quic_tdas@quicinc.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240318053555.20405-1-quic_tdas@quicinc.com>
 <20240318053555.20405-4-quic_tdas@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240318053555.20405-4-quic_tdas@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/03/2024 06:35, Taniya Das wrote:
> Update the lpassaudio_cc_reset regmap name and max register details
> to handle the regmap conflict warning between lpassaudio_cc_reset
> and lpassaudio_cc.

What conflict? How does this bug affect users? Explain this in commit msg.

> 
> Fixes: a9dd26639d05 ("clk: qcom: lpass: Add support for LPASS clock controller for SC7280")
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/lpassaudiocc-sc7280.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/clk/qcom/lpassaudiocc-sc7280.c b/drivers/clk/qcom/lpassaudiocc-sc7280.c
> index d68139762a80..3f1e756a6e71 100644
> --- a/drivers/clk/qcom/lpassaudiocc-sc7280.c
> +++ b/drivers/clk/qcom/lpassaudiocc-sc7280.c
> @@ -755,6 +755,9 @@ static int lpass_audio_cc_sc7280_probe(struct platform_device *pdev)
>  	int ret;
> 
>  	if (of_device_is_compatible(pdev->dev.of_node, "qcom,qcm6490-lpassaudiocc")) {
> +		lpass_audio_cc_sc7280_regmap_config.name = "lpassaudio_cc_reset";
> +		lpass_audio_cc_sc7280_regmap_config.max_register = 0xc8;
> +
>  		ret = qcom_cc_probe_by_index(pdev, 1, &lpass_audio_cc_reset_sc7280_desc);
>  		if (ret)
>  			dev_err(&pdev->dev, "Failed to register LPASS AUDIO CC Resets\n");
> @@ -787,6 +790,9 @@ static int lpass_audio_cc_sc7280_probe(struct platform_device *pdev)
>  		goto exit;
>  	}
> 
> +	lpass_audio_cc_sc7280_regmap_config.name = "lpassaudio_cc_reset";
> +	lpass_audio_cc_sc7280_regmap_config.max_register = 0xc8;

Why do you have it in two places?


Best regards,
Krzysztof


