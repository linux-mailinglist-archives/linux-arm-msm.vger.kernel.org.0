Return-Path: <linux-arm-msm+bounces-87885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9691ECFDC68
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 13:55:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 202363008EAE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 12:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 484A53168E2;
	Wed,  7 Jan 2026 12:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RN6iTrU3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HFGL+CeF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE4A3168F5
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 12:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767789982; cv=none; b=QhA7gT2fkB6uGcTzSxSdH35PVpjmAlcysoaVnymO3rjXrMAIrKiG+CO2OAdPnCLZqh5e8Dyc26Qyoag+2v5iv5wutku93ucoZ3Tpnjjl+dQkRKlzPoEtZ3yHCxxVVENVaT9LT+efQLFWg6DC3As2gluZ8OXDJZzHSAG+goR00Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767789982; c=relaxed/simple;
	bh=sh+cnHz7ShryfIWwwgaf/t4ACDaWPKuqAEqf4Acr7m8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hq7JzS0O/93wEWZgRc1daS5tz0RSGCju/UUd4MpH79WSWKaLFwtW92SGT+Ce2GQoU94GpHSFxDE2lZxOu23Z2UDg9MUPRPCLVhsl5tqCptGVh2Z+gW4p6cZi0RMLl8cJLueU3dvqK7d/AnOTmrfrgEFPPJeYcnQXjRWzEPU6Hxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RN6iTrU3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HFGL+CeF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6079ltYJ3889214
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 12:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3yqvCDKqiNpbPEHOy8tGkkpTnMSnoWF3DxtL8kCAuPg=; b=RN6iTrU3VB2qgl9d
	QtU1sc0cDRuwMNnKNfHdpyHoTDp7jYFdVQ5EXB2KINELruGUuP25wuyURuUaDmQx
	pBGyGwlLTk0h0ivGy+me8zBwbnLnp+IoaO5r0W/X0sCJ0tkgNKFFIE2UKWztTg5w
	B+p16NwgDTzfKrsxNGcLnrzp1sqmImb3mcT/Cszi+TFwdWtdp590wvyeymKzlF2Y
	gO8lDdecE69ep/OOKZHYwfrlnbo/UxBZjaJDj5fIkMqNbQrH/dnoShqaF/7pcNj7
	IGI1NvU/G8Fc/P1dliMpaTk79MTrFVlE1Z+oK1saG9unX17kjHTTpsDGaL5jdrdr
	kMCvYw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh6a0kas6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 12:46:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee07f794fcso6022591cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 04:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767789978; x=1768394778; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3yqvCDKqiNpbPEHOy8tGkkpTnMSnoWF3DxtL8kCAuPg=;
        b=HFGL+CeF1Le+UzIZfN1IwwxYnUS+mVDtDhy3K4Qzbbdy4PSV75npM5drQtbD+AGbPA
         xp31Wrd8XxtMa/Vmx8T1R5nH7PkVKBJRHcTfgn5zmXMhWJlRd49ydAHZ9uINRtaL222r
         BYs7+91G8PeEa66e95ECul0iH9MDhsI1us1c1WTUk9UmnD7+6Gu7O4/TJxcm4Zhc9GL9
         DN3y7O9SN+sQqxu8R60dg6vQ6bh8iwYyQxmHTMPd8bjC0sIYAfMMR/LFhfkznVM0U59+
         Rm58ZO8D+sGY2sQA4vI4KJNa7YUM6zLnF+aPexXXYWDXwpLLNLmxD7EnrqjPiefZpOcW
         o2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767789978; x=1768394778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3yqvCDKqiNpbPEHOy8tGkkpTnMSnoWF3DxtL8kCAuPg=;
        b=DKnSLYrjMzt6BSGtJCmBvT5B+g6M4LlrbFaRQxdNin4D37des5SieRm2yOkHTnMSyT
         OKOUcb+ItyleV4UGKx408REVsrm+db5Wfrh4h9LGp6luJ2VlsIoU3zCF1n29CY3jUjQz
         VQvOWV4xMWvhiOt9m9dbV/5FLv23AjvAPzhTn622768jmySW+2kAniQMxN5IdUPgq+wD
         AuOpliwfiQX3Mce7YGbHOjNgZyr1/KYntvEjeEq3k6x4+Ow9TDMjWiKSSejn16QznxTL
         VjgqeXCh4lkN4/3jORepyNc64CYjmbluSK9eGaDBy+DuNSp3OIA7PbbFtUtyhEkNB+j2
         Cvbw==
X-Forwarded-Encrypted: i=1; AJvYcCWIfzkJmrffFMnc9oNkKuQiEVArfB6+fvIc1RWXy+Mv2Wrxfx+PkFNI/du1CdbdHFrqMKXZSEPdNWzSgO0I@vger.kernel.org
X-Gm-Message-State: AOJu0YxkGBlEH47RIxtEh2PSRC8RyUOy9tAU8CUlVICuJPJMzbG8UuP7
	pe+eUMF+hmfnc6+oem7d9cXbnbJxba9lPmnuE6JTWffadFGanVJzl0foQDWa/vYX4ogYFzuFg9H
	iZ9uNAZ2/8CxlCRpi9NUEwX2t/31pjgMQjztDBEQdq1emtk6ujBs/oi6AgtaOTw2AWAdJ
X-Gm-Gg: AY/fxX4mCj5rtYlU4FDDKNZhyytZkHeT5oBphkN8LRKICfDQhS1FZZ5U5uUf/KOjXcs
	4Y4MXyqDRhHjMlmWHu8eIITPElloohowudL64SldcyJJCicwuKvMuehq9MhMIZ9p4Kg9X1J5IS/
	6c6dOAC4XB9i6lOuHE3QE+Mn4On/MFuIZlkBSArQ61HhYRHhlB3wAI/s+/Kv00YkbMH2mZvWYqI
	PCYlVj9fdUYKRNsgfxc+1etlyeaPnCLNDXpBQYHZeSUXel2oSsFz9VqUFUYkuN4OZfn0ghFd2zL
	SUgtgUcyvqeGYjbzsJQ4JNau9kw4h8uHn11qaEncZujWZmw8VNy2+9Bnf/8VdH/mGu+Kslo97+O
	HCOYTAF1IYFD/P/NX5YkZSuFvpiZATDfNShyzsmFlYLiQjDYZeI8QB+8CIgiOUBr9K+4=
X-Received: by 2002:a05:622a:110c:b0:4f4:b372:db38 with SMTP id d75a77b69052e-4ffb49228d5mr22508321cf.5.1767789977947;
        Wed, 07 Jan 2026 04:46:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHuq76ypjwiPaJO4Y8VhWJy6P9lceYSJblxYJEvU7RctuGjrhMp1z5PIJTROZtJnaK85GCmQA==
X-Received: by 2002:a05:622a:110c:b0:4f4:b372:db38 with SMTP id d75a77b69052e-4ffb49228d5mr22507821cf.5.1767789977325;
        Wed, 07 Jan 2026 04:46:17 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a2bc7ffsm512039066b.26.2026.01.07.04.46.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 04:46:16 -0800 (PST)
Message-ID: <6b874e4b-a906-4153-aba8-b0ab7a12d5c1@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 13:46:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: qcs8300: add Display Serial
 Interface device nodes
To: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com
References: <20260104134442.732876-1-quic_amakhija@quicinc.com>
 <20260104134442.732876-5-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260104134442.732876-5-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Eh9_v3nIaUIXacv5TUrVdsKqA0qfxVIt
X-Proofpoint-GUID: Eh9_v3nIaUIXacv5TUrVdsKqA0qfxVIt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5NyBTYWx0ZWRfX3GpTCLWG52+i
 kZ63hJ37muaan1Wu9cT8zeROMvuiYf3jO1WFEmDYlw9i/TCwVNKQbJPeCgl616BBY+SYemrgX/2
 /Gzysgf8HXBpwNYHRzSHHzHymiiXTOHHu0wwc7VSoqvWcZPjx4x1XH09HvEGLFnXDm0kHp4VS3V
 NV0lCt911KeVwoNTRAyG4ijdEe/mj77R3guRIEpvMT8wb/scuTq9uIT3ZIG9+Bg+IGRPKRi20CI
 g6VKxQDQLiFmodKQcN63V96KCp6YtILJYvrzXrccccRi9qF+/NB+2s0j/xcAIrrtNK+rIptW8NH
 QJtjQmDxaeYIonpurcMTcQYFKXHb19J+5J9f9dDZIxhy0fMqHt0lC1HNfWVJA+l5QS2BvWtF+I1
 9ZhqbAIGCRD9sVPqbz0oNY5IXGJZNDpse+k52yZMXqUzQH0GcF5+xi3T/4dCTvuQfk1xg3afUWI
 vamMaqFpp4al1e8keng==
X-Authority-Analysis: v=2.4 cv=MtdfKmae c=1 sm=1 tr=0 ts=695e559a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=iMXfbfRCx5d9ngtYL8YA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070097

On 1/4/26 2:44 PM, Ayushi Makhija wrote:
> Add device tree nodes for the DSI0 controller with their corresponding
> PHY found on Qualcomm QCS8300 SoC.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 102 ++++++++++++++++++++++++++-
>  1 file changed, 101 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> index e44fd5c33816..052ccfa6a147 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
> +#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
>  #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,sa8775p-camcc.h>
> @@ -4858,9 +4859,18 @@ port@0 {
>  						reg = <0>;
>  
>  						dpu_intf0_out: endpoint {
> +
>  							remote-endpoint = <&mdss_dp0_in>;
>  						};
>  					};
> +
> +					port@1 {
> +						reg = <1>;
> +						dpu_intf1_out: endpoint {

A newline preceding a subnode definition would be neat (and matching
the existing context visible above..)

[...]

> +					port@0 {
> +						reg = <0>;
> +						mdss_dsi0_in: endpoint {
> +
> +							remote-endpoint = <&dpu_intf1_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						mdss_dsi0_out: endpoint {
> +						};
> +					};

Also in these 2 cases

In case you're going to send a v6, please take that into
consideration.

Konrad

