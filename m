Return-Path: <linux-arm-msm+bounces-75230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 244A0BA21D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 02:56:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC02E74064B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 00:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEEE315278E;
	Fri, 26 Sep 2025 00:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i4fet/v3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DD513D503
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 00:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758848157; cv=none; b=Wqg95boYDtZIAIoXnRyV9dDPOcNWK8mYJceHX/3PzXdA/N4elykyq968S1fE3c9aPFrob/Blj/mlh0fZ3zVE6uKolHOXs9eQufyCzgAppvqYT66rCXv2CnjGMQKRp1fNg8ec55Cxtc60vJDGYbuKJkAtKT9FtoXWKaQuvWdexRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758848157; c=relaxed/simple;
	bh=Zz+6gqobKOIfFclgInpsZ9r34darF71LJ0ImvMuUGBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CkCyyKgJFKCqNXE26JZJuu3QhBKQjU0DAWFaC4GNqY7Czs6ut8P7gQEHNGaUVMKnRcH04SfQ0qMS/U8tw1RgO2ft2upFs4z2g6wfXQCeqI+OLZorRmmT+0thRl/jb04nYzRaI2SixkwUV9ICyn6F642iIHkBAaSvZlxqZWh/JZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i4fet/v3; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-46e2c3b6d4cso10079815e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 17:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758848154; x=1759452954; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9e9NdOcaym+Fuz3o7AoDLOamjILGzKfxxMvCkH865N8=;
        b=i4fet/v3QYRRu+09AQnMSyRmE4cW+3ubMZqH2NXirzR5H8XxpSR78mutGfosjqrEF+
         oayskS+nHISj28uFMCooQR9FVr8affXte1Fn1hpwn5DkWHFxiJE22GA84zqzS4/obGGG
         JdIzSB6jtPq2rufEUumwlKwrlehs2uwxCCq6SJXu7lebNzNiD4X1jRRTCi4uMI14D8Qz
         unxehQ4Rb9V7wuAVbn3ZMPXjxgHejbf2Ts1LCsVF9xeNT3EX8hS81QVi5SZM+JijZWV4
         6gMHCXifnfrVYaDNxhsGTDuAQ3TTzAPiTAgxD052P3T416mpv8tshjDww4K/+LHotbr3
         AcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758848154; x=1759452954;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9e9NdOcaym+Fuz3o7AoDLOamjILGzKfxxMvCkH865N8=;
        b=VcT5RQOJcodltoOJwB+22C18JaKVOQwj84hVP5IEb9E2H3fPuo60bMlfBwoUaqjW7l
         UVl1rLP3RJGpBzWQ4KykvwWjJ3wg7WR+gLRxC4g4tRflmUWYPMmXYvMJnrCXL271qjmV
         EAlXjPxNf0a5G0l53qNetYZ+ztSOHtJIfCYcP5hRjOaQd1RJjc1Uxfqzjd+/6hpEhvL6
         2SpyOSibiAscqV9MNeVuduHMqmgxNft6MH/RDTa7J5FrZpirEhhx5usdEPV5cEfMTD3t
         oVQR3w9e/KG+grNnyWjtiM6HZ2oniY3oheQy1f0sov6NEFo2mZ3cG79eegXxjMYWWr31
         667g==
X-Gm-Message-State: AOJu0Yx5nAp01h36BbDgfwpuqNdl+SWBQ21lM6Rj8+3MWFCLW/pzvk21
	GDXAopSwv/VE+eyUJaMwq40QSk79f4Cp8j7/+Yi6ZQzEYpEeZAzTvAQ6FqbjsrEiKSo=
X-Gm-Gg: ASbGnctN/Yio08EI0SuuhaRaR5WX0/p1bd1Up6hOnQjBlMN52IUZszAbIiLF2urpW4U
	0CTmgdHKXrpvAuQvxkmf/OVlwFLuhdktVegAn28qQXs1HLIjQ7AzC3CKgqqyhl81Yy8Q9AUe7qf
	yQ7RZbU8ahBdBTXJjgC4/epS5dridlZtxzKNXcREjVJxQ5vscG0DEfyJXXZU4gj9W1AmOroP9wp
	VzCCOLlxG3et3wDwcSKp//+qZWugFU1bfM0S8ffn6/dNeojVOCOmqmTpuBH6wsk/LZ+LR/vEksu
	NwyqP9qgp6hNobEujoakcZrVerKqWlYO6SP+75gDz5V43MCB5C0QerPixsRsH5CnugxPl9medpQ
	7k6lAJLJAdLzH2iXW2cWk7xaYbWkUZr/da6klqQZf+BHTzbmHJW8LLKBZzI6/CIve9uYy8LmGNa
	+1ayrQgJctSvlJr08jrA2A
X-Google-Smtp-Source: AGHT+IEi7fDGWCixHLoidioieRVuXJUMu0nnRncjPtslMOdDH/jitf97iTqziYXoLsGnOKsP4maIXg==
X-Received: by 2002:a05:600c:3551:b0:46d:a04:50c6 with SMTP id 5b1f17b1804b1-46e32a10ef4mr59198215e9.30.1758848154080;
        Thu, 25 Sep 2025 17:55:54 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2ab62233sm97057095e9.21.2025.09.25.17.55.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 17:55:53 -0700 (PDT)
Message-ID: <f705e9b3-864d-46bf-a6b3-f3be4756293b@linaro.org>
Date: Fri, 26 Sep 2025 01:55:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] clk: qcom: Add support for VideoCC driver for
 Kaanapali
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
 <20250924-knp-mmclk-v1-8-d7ea96b4784a@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250924-knp-mmclk-v1-8-d7ea96b4784a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/09/2025 00:56, Jingyi Wang wrote:
> +	/*
> +	 *	Maximize ctl data download delay and enable memory redundancy:
> +	 *	MVS0A CFG3
> +	 *	MVS0 CFG3
> +	 *	MVS0 VPP1 CFG3
> +	 *	MVS0 VPP0 CFG3
> +	 *	MVS0C CFG3
> +	 */
> +	regmap_set_bits(regmap, 0x8088, ACCU_CFG_MASK);
> +	regmap_set_bits(regmap, 0x80b4, ACCU_CFG_MASK);
> +	regmap_set_bits(regmap, 0x8100, ACCU_CFG_MASK);
> +	regmap_set_bits(regmap, 0x812c, ACCU_CFG_MASK);
> +	regmap_set_bits(regmap, 0x8158, ACCU_CFG_MASK);
> +}

How ?

You're doing the right thing commenting on what is being done but, 
you're not providing any context on what that thing is done.

Write a set of unnamed bits ?

+#define ACCU_CFG_MASK GENMASK(25, 21)

It's only five of them, please name in your comment at least a give a 
clue as to what they do.

---
bod

