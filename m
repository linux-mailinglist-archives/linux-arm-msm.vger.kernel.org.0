Return-Path: <linux-arm-msm+bounces-86824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C45CE697F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 12:48:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 78B803008D7B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 11:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970412D3A77;
	Mon, 29 Dec 2025 11:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hc2XFkOX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PWgfZHug"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8D02D592D
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 11:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767008888; cv=none; b=tP1GM7gmZpFERL6nAIQWNyTgGT1uj9Yw0WBT+FqGYxuECCKapd45F8Iqw7af7Y5RLHQk+MQl+o+/NpBEW61z+o0yXAGlHtsEmrPlgVxcYlfDAoU7Vm2lckJVKQCR3SNEEfgd4YL0tMOkzDT2IqOO6BYY8MxqJpioSZ0vAEqNIus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767008888; c=relaxed/simple;
	bh=R2QMndu7kTZOcDhG5pspP1i1KqfuggelcaWTBufOp24=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sjjg7G9Ry4Xq9bKTxYbQQ1tapffatTlVbG/q2vYv1vORF89LExs9NSqjQSjDdb8lfUyswcjB9BVj8POj6fsEbydYPWKMHyFjfTd8YbyytzzUwXxxK4VbbHWcBmZpiAj9fVCSSYn+TrpEAILSI+SDvQsXlYSzsoQ2KtPlLZxn2vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hc2XFkOX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PWgfZHug; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTAsCwo3964629
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 11:48:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DPRG6iTyFGtdlDsofzUrgUl7lEVsoCW1hko1aRLMHNQ=; b=hc2XFkOXF5S5Sr0Y
	v2r/bZTaouAFXo/d9Q8EMT2u0ycKzDDVeQQZxHwfcJhjtPc23ixZzt8vPAtLAQi9
	Jh5E0yRnuT3/O6HSNlQF8bAX3V/cqZwmtVMUDJF/Cnv76rA503XatFMHyu2J+gky
	jry4VshqWkG10CfxybQKFWRASD9ek0jw9CK0+FhoSluePb4wbiqjmcfd4nmhJrcF
	PudgSWgaIbYI2LIx1d9OQfTP6CGiVUcCSHF+shpecKuWGFs4IzsszU1VP4pg/uNM
	x2m6TX7bfvX/3JQ92LM4L3oCb5FiEjdYO8CUEmOZBe3URX+hn9veQ4Ah5pK+J8zt
	1VYCqQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba6dr4b5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 11:48:06 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88882c9b4d0so30928856d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 03:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767008885; x=1767613685; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DPRG6iTyFGtdlDsofzUrgUl7lEVsoCW1hko1aRLMHNQ=;
        b=PWgfZHugz5qi3KHydfAchMEzklT64NHHZGF2hDMrdEI90mCT0pwDf9wbD8R2jZdAFE
         IqZPezmlf3yuIkrxeySBeNhvnIs7POiSoHema0cTibAqOQFE0vbvXfw6hN6x1Tv9EW5D
         pQ0lNTK714eVjtoBWcXDFclVFoE+JezWlXApzC1xYXzt1wG2iVuaFizwV+FgCLr/h/nQ
         QAp7HTQ1QquTL/aXxLExLYJv4jJJFU3zfi17NJ6CG7U6E7Yk2e50kLzLykeH1E/7jNPN
         G8W+cJn5XPQh9kjaYbwNkn1Ms+CqMUS1n6m991FUOxeTROpR8x5FYjKxbZkDpqSPc9+G
         azdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767008885; x=1767613685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DPRG6iTyFGtdlDsofzUrgUl7lEVsoCW1hko1aRLMHNQ=;
        b=pUzkXjRWHh0msVXuwWHNsADuhqMnx1AubHCHUEcPOQRqCvIBlakl0GUObM5c7Dldjq
         K9aJ+MK/qNFiItDeBGh62EjrKDXIdM8BBOamTqJJwFxT+xlG8AL2ElwWlYQmJooWX3N2
         V8YT1Ih8+aYidQYm7BBQIOAe4qLpTCjsWwUrSY3kN5sTC1YmZMVNku7XUMSmauZFp/6q
         TjrxaNHBFF99VQqdNy42Ze7Cg07WOscj9pzE2eBmFQnCbap9aVh6MbTJxeEY2GZtTQ9m
         uRIeWEQ8VffJS0bSOGy1LIecczCcTtOIgjerLe651ZUGLi4QHa1+M3krV9jgcCvLnuon
         hHNg==
X-Forwarded-Encrypted: i=1; AJvYcCWk98L/plbAvPAAbI5z/ATOAJXJdLY6koip2+SGuWFtIQTUe++wsU7umsYa1nVHY4rHoihfHRHZsEzKm/V7@vger.kernel.org
X-Gm-Message-State: AOJu0Yztaw6mXm9rtw7BjPVmV8wbzTi6oNC43pKEacMyytfuH36z6pFX
	N0kpz8lxBrQ0OtdWameUPzPYUYycObemvYP+mFWW6aom+EiPHz4Dbbrb3dTxotyBPO/KKNrpBI1
	Fe4RhL9KlaBlNvU8r/1ZIpR8Q3koXg4RteBRaTNo753mYWKOIFy7wjyBMDbAuzgzUugUC
X-Gm-Gg: AY/fxX7NoAeRRcc307pR6W/+YJB15PmiXMlOcYIrV/0xsqqWzBsq62NeZM/KJrRkckX
	X6TTmWRa7CZogM736Ha/Y0D7wX3kEnN7NN8Gqjk1sPtdk0PYxXr6yVV6jEyOFvGljdN7jiynIRJ
	iaWj/yT/f6whA1ibyWEdgkRLjKX4FBPOFI6xS9o4zQT9pTPpIRIc1gkHjjYjXq+lfvengRS9Ymv
	wSa+x6GYFmCG8x9Ai4dzZlCqjBGZJMclvXmRqsZZYHeK41raf2kvPjd1v6RdUESN26xI1QsOtyv
	b8jpaFocidUCnV9aWdlxwiQQ7L7+aC01r/dhWPghdWiF02BHEaP2nZc0x1+ACkCrEV7OggvVzns
	grqwRy+YosddG9iS4zXKb8maRiLyUd4lRNWm/HQ8BojvhSEveHeHqdkqdVPibTH8fCQ==
X-Received: by 2002:a05:622a:242:b0:4ed:6862:cdd0 with SMTP id d75a77b69052e-4f4abdfc9c1mr344048251cf.10.1767008885112;
        Mon, 29 Dec 2025 03:48:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjrSkKbc4mw0Z6WAOP5U4DArxVR9tDx9EDtrh5En8yfJHONgT3eVu+kmtLQPBglHGWnGTC5A==
X-Received: by 2002:a05:622a:242:b0:4ed:6862:cdd0 with SMTP id d75a77b69052e-4f4abdfc9c1mr344048101cf.10.1767008884665;
        Mon, 29 Dec 2025 03:48:04 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9159ac90sm31583029a12.29.2025.12.29.03.48.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 03:48:04 -0800 (PST)
Message-ID: <dfb4ab3e-3e4e-4c67-bf7d-90c589871644@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 12:48:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: rpmh: Fix double array initializer on
 Kaanapali
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20251224112257.83874-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20251224112257.83874-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251224112257.83874-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDEwOCBTYWx0ZWRfX18TBmqndjU4r
 HEvi/faTS02yIrfv/AO9o8roM1I1cWR5kw0WoKnFmGoIz4rJezMScO0yWSI5TUpuVKPYv8qaExc
 9P4Jm6gZIgfIQG1EdpXpWYPq+xHVUpsogSQ7z5h3V7ZfOFT+WZ7+/+jRBBQbnTrNrA9++IuSblA
 y82CbfxHV2pQsWgXTXV5UEszxeRKIlXhPpTf1aKLf8kyvEQQZuuWQTD+fIYSXf/L4Ppndx4KVTO
 6lRtX1Z8WWZ37QIeKeEwWwSjy/JujY+XwZSsGYtzmHtxEvQuM3pI8uoA26XPOqSy2PL3RTmEBrv
 LGvh4QqADKPacbeWCMqV/kngEbd5NWTJMbz848wiBK/f0Dk7DB6Ro0/JK5iQq3loE01s8a3zkQn
 1F5JsdDMp8mLDPtn47FQfjPRjgMliXqP02XfgjPv7Z/+3ifcoEJQgd2Sk5IGed3A1CMnDzlynhP
 ptTHS9d2PouMQlmBrug==
X-Authority-Analysis: v=2.4 cv=VdP6/Vp9 c=1 sm=1 tr=0 ts=69526a76 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=snvUICUIuoXJ_myJnVgA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: roNZaVU1Dy27Is78jiTVZHQmoFg1D5aa
X-Proofpoint-ORIG-GUID: roNZaVU1Dy27Is78jiTVZHQmoFg1D5aa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_03,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290108

On 12/24/25 12:22 PM, Krzysztof Kozlowski wrote:
> [RPMH_RF_CLK4] and [RPMH_RF_CLK5_A] elements in clk_hw array are already
> initialized, as reported by W=1 clang warning:
> 
>   clk-rpmh.c:932:20: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
>   clk-rpmh.c:934:21: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
> 
> Fixes: acabfd13859d ("clk: qcom: rpmh: Add support for Kaanapali rpmh clocks")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

