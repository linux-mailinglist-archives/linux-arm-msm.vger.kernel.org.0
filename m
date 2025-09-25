Return-Path: <linux-arm-msm+bounces-75030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E077B9E369
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 11:10:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F21E1BC30F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 09:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1EB527B335;
	Thu, 25 Sep 2025 09:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZNEVQhCi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A082877EE
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758791423; cv=none; b=Skf9pQLxAqlN87/bwa62bt+c6reYoFTW9Iu8Fd/C9tqUQYVVI1/UHWnB1z4CDf+tnNIqg5WL5jONaJACJae8SOIFknulan2lOwLuYoxl+rMv7ocqBcnRzmj4n8Zfe/q+oVeh8MgRx0dk99CgY7IeMgBy4INfdqNTw/z8SN3Bf/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758791423; c=relaxed/simple;
	bh=L5XR6t5ZxwfG3rtP2YnGXIBz4GtqNch7l7akgqfMJNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j3NO/1I3FcJiRb+rD+1xdF0FMMj9NfXA7qyj9l+ujd/teOyhKMVrHRMv2lCx1eC/eXDTdYtq/fcKKX3Yr9KKVx1UcIC8if/E2A3kRwFNzgoFQ6WUyLSBoowVrSeWflK7xdiVTKA8wPVnWUQK+/mcUHE5QdUbuw3thzhIpSyxzbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZNEVQhCi; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3f2cf786abeso551785f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758791420; x=1759396220; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nMuA4DWC6qNeuux3AJTay/iyO89ifrzsRhDuGmNfotc=;
        b=ZNEVQhCiUaS4rNzMkUfSwGh75tyS/xDug9nFLpBRlRh600+XKL5d4QkFikSRs6y0fU
         nsd1nKRh1f+SBofkmrSphSxpGnVwOMti8pinY0Ahkk/nM4JyJYrb0FqUHZdBe26np63z
         TaLFo/XsNaCjyL8hl9dnsE+/BRYHO4jPvPifKWcwbqk7yHG27TkkwAhUjrRzImj94t/j
         g9izz81008mC0rtN6Ip7xjNgSN3RvxxCzwA0FhZSx2BISl3R/eO8BVbxytjl8vHLVlPY
         Fi+UB9mLUQlUugtLCa268g9hEC35EdWyuBYRDckiZPOmyu7gMYYNjwzZvRNvtcc0lSL6
         3WLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758791420; x=1759396220;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nMuA4DWC6qNeuux3AJTay/iyO89ifrzsRhDuGmNfotc=;
        b=dGw51AY9DRuExnMaUlU7U5KkgfWvt5034rAokTJQa3MTjg9KVm7DhRLo5MqPr278bQ
         xu811+GXL5ZuYKqWuXs53lLopTnaGenoyvELV6kiXcPOA/vy39jAW+PoJrLoSbzPxe19
         T4wou4IOH/nPaCNzFXtFzcOeayrNwQn9SgEA7XiO4UFLinmCWQyWtiS2k+ATfu141N/+
         Sj3C4N8MTpnZTY4oba8QwkdPN7M7ok9j+OUU1C+EgD65q485jwoMMVaLw8MwbyNMEP/O
         91pzz8UYw2gmkunZXknYFlM6FBVaLHWEB8nroLxM+mvkoMfx5Y5XBVJIt5AjVHKbTMyQ
         P0bw==
X-Gm-Message-State: AOJu0YwrI3S6rXfgLD/zcejafnSGLg5WU0WygfpozzklylvKyAF4Qf4e
	f+LkGRI33vibD7FdY50nkoaCKFkOKwX9Fw1r/zhsRBrNKrheWT8/71uJx+CLZ/ZkM4/xqCHRjFG
	oqX59TFI=
X-Gm-Gg: ASbGncvCTyNzBV6gNVeyj+NJ54YvxapItV3IgdXv46YD15YNaopBmyFCMDSrPPG95CG
	W6d5EFoSrpLulxf/p2dpXvqZURth4OkKaN+Q4dBWOFzeR2qgBGh363KSwxot0aejAKYbfsdkEKg
	Z3+9tuJiK0pz51cGmxix+/p8l70SMwo/lPm7blnQ2ltZiKwU8Lv/4OxsCayvikjoKR6/tCxuix9
	9j1B2xRVS9j/QKprXwoMaQH7JP6I4K2pEKdobcfnQb+tdkxrbYjnPP211yEUHP35aVBYjseWfTk
	8WiX3g+jSoghlOjJCTR474lhbSy/lRdSW0f5kym1LH+LqG9wMsb4JgetpFGh66qAi7PJspVRPwr
	MXxWr2Q/NxukbL8t9sVBPWV5bYlN5XOHYw43Mr2ytMhTq2FgRBT7WvlWnPr3mx1eoADQtEZxSIk
	a5du1doi5OhIWWRy2JdJkE
X-Google-Smtp-Source: AGHT+IFDpMpHsFRgd6YSWfaUgP4h+TK2gackvhjt2ED62B1HXzzX5IdszOWCjQD2qcaPDSO7lAZ6/Q==
X-Received: by 2002:a05:6000:2484:b0:3f1:2671:6d9e with SMTP id ffacd0b85a97d-40e497c346fmr2389638f8f.1.1758791420460;
        Thu, 25 Sep 2025 02:10:20 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e33b9e3bdsm27566255e9.2.2025.09.25.02.10.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 02:10:19 -0700 (PDT)
Message-ID: <d18c5196-dd8e-47d6-87bd-de0ac94fbf3b@linaro.org>
Date: Thu, 25 Sep 2025 10:10:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] clk: qcom: camcc: Add support for camera clock
 controller for Kaanapali
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-7-d7ea96b4784a@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250924-knp-mmclk-v1-7-d7ea96b4784a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/09/2025 00:56, Jingyi Wang wrote:
> +static u32 cam_cc_kaanapali_critical_cbcrs[] = {
> +	0x21398, /* CAM_CC_DRV_AHB_CLK */
> +	0x21390, /* CAM_CC_DRV_XO_CLK */
> +	0x21364, /* CAM_CC_GDSC_CLK */
> +	0x21368, /* CAM_CC_SLEEP_CLK */
> +};

How is this critical list decided ?

For example why is the AHB clock critical but the CAMNOC and AXI clocks 
not critical ?

---
bod

