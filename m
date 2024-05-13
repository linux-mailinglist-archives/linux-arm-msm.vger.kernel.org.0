Return-Path: <linux-arm-msm+bounces-19782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA54A8C3DBC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2024 11:08:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCD2D1C21456
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2024 09:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF1681487CD;
	Mon, 13 May 2024 09:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X0YCyVMI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9DB148311
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 May 2024 09:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715591308; cv=none; b=WDCghBCmHb2tNgvbdz0yNxAAP5zGyvvVyTFghbTQlnWG/Sht5AwjQq3ExTl4130gqMjm4qrZp+e87IrTWAZxxxHbl0ayVsOgbi5qL7/RZMN+9bt81gqoN9u7jwZXpQwFPtRud/mZrXLL7BPFd+3YhSSo1tNdRCvpFRP/gcRw34s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715591308; c=relaxed/simple;
	bh=wJlegJibZrOuODZy1Z5vIlKzz4S4bk5E4DsD++3f0rY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LiFM5np2aAlqiSSgtx1P6QjNZxCbCKibOjrPnk7lI84JP23qNxYWpLP4EvtZ5SdRBRzcceicZCenjXNiXpcNf6G1ghW8l6PMkyzOvgaHvMW5Dhrvs2/s+80NKWAdsB+T/BbmP33XgVMKD3+t8JwO2EJxpo5YW0d5k3VUV6airV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X0YCyVMI; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51f3761c96aso4798154e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 May 2024 02:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715591304; x=1716196104; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f66bP5yWcXO8VJ2Ei1ffys4nlL9S3YNrZ/7wcV5bIAg=;
        b=X0YCyVMI3q19Lwjd3Nh9bj49kYjrtHGSxpeYegNSc14wuAZNl6O8NxImLl0tL4fhNU
         TSwUFHKhqC1TpfPxxq7zOAsnxltVEEJQkAwmGgDrpn/mIdxY5wb02792trOaYlXoEs+A
         LMnHQqxmw+JwNkoXRFA/J6clyPxb/hACQzN5QXdUWsI02Ghjr+oUfczU0d5IAVcZVe4z
         fzfDGMScKlmHXTusjbNfT/yqWStDD04Cre/gR3MoDF4DtbfXDMQjd7wo7sHAYyaSpK0w
         LLQHoRA2XlJ0FpVmIbdJ94lcFFZHTHFz78j4omvfkf+AiFQAl46FATHpiNiaisvGzmVF
         0MwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715591304; x=1716196104;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f66bP5yWcXO8VJ2Ei1ffys4nlL9S3YNrZ/7wcV5bIAg=;
        b=UhFMDKnzjxp43/08rasvnW2WAyOilacl6OS5IIHQKULN33ldEiggKSOhLvr5MFRnl9
         PO+/zxrAGZESdSlh/BKyHIuzr49GPhjaCKxxrlTCMvOkzkdT7Yf6898vCC+PA6I1sUY7
         k/VXNvlfkrNhWlauM58cWH4HMTadXejwGG47UJMl7ZCppARMYcHiSW4Gu5poLhxKXPeQ
         XrnvDSJG1O0jlvQGjd5rh+1K5pmSpNqUf0280Lkm88U6d7U1xzZiY1/XpESlUcHIMMvF
         /owgvxfkfScAkMuTQ+SRuPVQ8+mx6RQi+RMYQDo40XnzRCi76I8TEliOtuH4+daCkI02
         nxnA==
X-Gm-Message-State: AOJu0YwH+SbS5Zmh2XmcrWyppRCbP8LHVscgdAJ224vPz6FOpmEjYTVj
	vP+KDusD0xtonWNij+rh7N+mmIS/AwHYGqzojQfTydLvMLRjo2qBgLz/7onPqzY=
X-Google-Smtp-Source: AGHT+IESRsUQWY2w2KyzETz92L/H7RBUgdjoJuYewKcQQ77zs1GNuGxD3D9XmpksszCY4Kb0edZZKg==
X-Received: by 2002:ac2:518d:0:b0:51c:d8f6:4e6f with SMTP id 2adb3069b0e04-5220fd7bd61mr7480130e87.40.1715591304170;
        Mon, 13 May 2024 02:08:24 -0700 (PDT)
Received: from [10.91.0.75] ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502bbc5654sm10666072f8f.115.2024.05.13.02.08.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 02:08:23 -0700 (PDT)
Message-ID: <cd355424-9bc0-4df7-95a5-5d82e630d230@linaro.org>
Date: Mon, 13 May 2024 11:08:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] dt-bindings: clk: qcom,dispcc-sm8x50: describe
 additional DP clocks
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
References: <20240512-typec-fix-sm8250-v4-0-ad153c747a97@linaro.org>
 <20240512-typec-fix-sm8250-v4-1-ad153c747a97@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240512-typec-fix-sm8250-v4-1-ad153c747a97@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/05/2024 00:04, Dmitry Baryshkov wrote:
> +    minItems: 7
>      items:
>        - const: bi_tcxo
>        - const: dsi0_phy_pll_out_byteclk
> @@ -45,6 +53,12 @@ properties:
>        - const: dsi1_phy_pll_out_dsiclk
>        - const: dp_phy_pll_link_clk
>        - const: dp_phy_pll_vco_div_clk
> +      - const: edp_phy_pll_link_clk
> +      - const: edp_phy_pll_vco_div_clk
> +      - const: dptx1_phy_pll_link_clk
> +      - const: dptx1_phy_pll_vco_div_clk
> +      - const: dptx2_phy_pll_link_clk
> +      - const: dptx2_phy_pll_vco_div_clk
>  
>    '#clock-cells':
>      const: 1
> @@ -68,6 +82,20 @@ properties:
>        A phandle to an OPP node describing required MMCX performance point.
>      maxItems: 1
>  
> +allOf:

This goes after required: block (like in example-schema). With this fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


