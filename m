Return-Path: <linux-arm-msm+bounces-66930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C2AB14202
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 20:30:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D29D3BC35D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 18:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4EDA277C96;
	Mon, 28 Jul 2025 18:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RxRRx4bW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FC627603B
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 18:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753727399; cv=none; b=do0HAsole9tiDqf4Khobcjh6VnPS51ypKsGDsb/YEOAiQguyBH0uoct5N7nueohZfCB0EqOMANwvzs++uv1GBNH3dr/xvrAJoY1ZauhXi3cIjtqgxSC1iBlJnjmsCyxQ7Fer2GgJXh8KFXZO4Jzo6UqisnRN9ie9LSyI0bSsmZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753727399; c=relaxed/simple;
	bh=m39t4hBEDIOE4JkV53k7vdPJAG4/pTKjuu7PU6u/wj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KLSpSYWIFO2KfX5WByXmpYlDCpohKoJCy6K3mGtOyh8vZP4aiUNsS7xV3q+rTBzdygd5a9yYD/2vR60/xV0JHhR+iHP9crkFVTwQOWoFOkolomD0sg5YEN/Fwy/fOeNLRW0QC/WfcrBjBVS1yTvfUVIiEP9Paycc/+ThMLBiGfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RxRRx4bW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlVQ4018404
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 18:29:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oT3tXcSx8+6IFxvzSzWBOGBoJkG+N20NCBDeHWmRh9g=; b=RxRRx4bW+XfnjtNx
	cXxPfHvYE3kKcnxdM9/MlmG8oFS37+PQ89XZIIdeXMmN9m4UyeGOIbVxbWEfKlvS
	zXbdCe+sxd7uvON5kJ5bGT5M1SfXV6Nh4gzvfEBbKHpLJwV2XUIHDEXCTdCLaTSf
	fdQU5TEs2rlvD0xvSabZilWSFqE5tszYf7KDUH92dHYXOiFYSFylsv26+GVCvruN
	oLRKd4vdPayCzglgYIxJAfQwt4ECUsESUbzoaOoEprCJjLSFPKfcxOx5cBl/kFyp
	LodkABTEXVQz+ErtotXVSkrcRoUxOYsoMI6/Op+BMlhuE7BcbMVIhZ59POVc5JPe
	jH82uw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbkwfqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 18:29:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-315af0857f2so4324260a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 11:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753727395; x=1754332195;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oT3tXcSx8+6IFxvzSzWBOGBoJkG+N20NCBDeHWmRh9g=;
        b=qd+LJBOPhnfWFX1LzSY5xI8fy7uStgKxAibxJ+WBMUcL/MqYHT9C4N6jQPuNOyhoUu
         UOPqN1WoaXIzRYBRtOy3BZXnRKp2GHNgZyjeBMjo2jApIwG553rqk6aaA1pPQP6zKcFw
         woH4yWwlTb2pg6dawUzxFgsfSa4tdICZHqTHYVz+VgO79J7Oi0c0JAgYV1M3OqF4TsaK
         g6YmFlYCUTsxH1BXcHOD8p7Nhm8Ij7MeOy6En8AU3uoNf85OWxDnfjKiYhg5ZnmiG4ft
         qZBspenebTqhGSQUXckph7ZgzffKTDqTsvWTD1/DShcc6CzFAZdwk4YgVEwlTcejyoiK
         m1ag==
X-Forwarded-Encrypted: i=1; AJvYcCUDvKvkqY4GocJNYscNVdtrMYtnHCQ6ylNIQaS1jxcIFng5T/LrDbdSxOfru3skEguvoAiXJ7ChgD6cplSP@vger.kernel.org
X-Gm-Message-State: AOJu0YwtuinQOgsMOdt9kO5bnDwujxHRj8pydnnJnWDajbzKGbiz27VG
	n1+pyeC0bLN7Ldw534avJkB82rmKU/F51YxVwAOA6Oq0dwyV1YszluzLbgP+FsSoKyRqhIntlY5
	KmYKEVwtB0BQZM6p3YG1hiCEMv6wMwwLjB3QfeSJQWeqUDD8m7wKOsdnBP4HStddeAwbz
X-Gm-Gg: ASbGncv43El61wZL49ZiUt5jFIwP748CiB+AiiN2Y7hkn2zIIaRhWjXqQd8vLlRjGl8
	OwYmUQwuDs4j4+6/IsPjJ5rPSe9W4zI+F1ptkLGX4z9MHXNXE7ugVxK+uBP64NwQP3eCOnLuxWU
	02eBp6XLCDEHCFnq7u6HMunmZUX8VO2B/XRll7FCmhgMqEQ0e4GjEMyiTkAcfOJIznVGWT5Z6u9
	4WnC0u2twzALVSQO4op2+PK3HW6FoBlKWfwj9W0J6oZyksghe7PHgQtMCB+kdVPqZh4mW/QlmTO
	S75enHpn3W2dyM56hVw1oFMqidLCNUNNmOon4YDA1Ew58++VXp8n41lKzFVzo7SpSGFvQIql5po
	I1qOd5IlP93SZmXw30qfCgA==
X-Received: by 2002:a17:902:f30b:b0:23f:f983:5ca1 with SMTP id d9443c01a7336-23ff9835e51mr72280565ad.12.1753727395434;
        Mon, 28 Jul 2025 11:29:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAAEQKwWNVIHaeiLUK+6MPkWiAUDHenXFMWUMIoSJAH/g0px54Std4EA5mF2F39xEpbfaLQQ==
X-Received: by 2002:a17:902:f30b:b0:23f:f983:5ca1 with SMTP id d9443c01a7336-23ff9835e51mr72280055ad.12.1753727394829;
        Mon, 28 Jul 2025 11:29:54 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fc5a9d219sm55658715ad.98.2025.07.28.11.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 11:29:52 -0700 (PDT)
Message-ID: <8399dc75-6363-4ae1-98cc-59b5b62dc8b5@oss.qualcomm.com>
Date: Mon, 28 Jul 2025 11:29:31 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: display/msm: dp-controller: allow eDP for
 X1E8 and SA8775P
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Danila Tikhonov
 <danila@jiaxyga.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250719091445.3126775-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250719091445.3126775-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=6887c1a4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=wmqSsp3ovfGiw9AtJwoA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDEzNSBTYWx0ZWRfXyVUMfFed17s1
 wmL4LxNvkXosieYucPaCbHcZ+eckwETWMmgq2mt4oWB6KlM0J2qyhS/T2rNPOoAGW5dDgKTbjgC
 IsLHnNnpAHGGghlHNR0Vazz9ha2R4YTmN+IHyQnwFoT6BYNXFZMI9H1i+KFoynX3Xnmqb0PIu31
 +icJvKcQgPQu96BWo28gofrYE2NUGbfTUKAul7oVc3QpB86W0O1Arg8/mAMh1MUImcMPLj81va0
 Rr9GGbDn/lIQhf7gSjmL8E21yL5OaVnRVfO5DT3HAmZe2zl4qMxKMqhDDqmdONdoMZmmcHGYArP
 MwTmpjcHxtvjRBd9Qgn33pfLhfiurEt31FpJ2lEgV/wRg+g5Q4SUqPzs04R0sKGaZPvChaAIb5t
 b6G/k7pknWRhcWwPJLaHsHI9KyTwCZBiIVp7VuV4fYEBm7PnxyAE4yxutGLty+7e7P18N55Q
X-Proofpoint-ORIG-GUID: 98qAbLTs1hHmVBuWRdZ5gyR1vKJ-8piO
X-Proofpoint-GUID: 98qAbLTs1hHmVBuWRdZ5gyR1vKJ-8piO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507280135



On 7/19/2025 2:14 AM, Dmitry Baryshkov wrote:
> 
> On Qualcomm SA8775P and X1E80100 the DP controller might be driving
> either a DisplayPort or a eDP sink (depending on the PHY that is tied to
> the controller). Reflect that in the schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> 
> Jessica, your X1E8 patch also triggers warnings for several X1E8-based
> laptops. Please include this patch into the series (either separately
> or, better, by squashing into your first patch).

Hey Dmitry,

Thanks for providing this patch -- I'll squash this with patch 1 and add 
your signed-off-by w/note.

Thanks,

Jessica Zhang

> 
> ---
>   .../bindings/display/msm/dp-controller.yaml   | 26 ++++++++++++++-----
>   1 file changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 4676aa8db2f4..55e37ec74591 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -176,12 +176,26 @@ allOf:
>         properties:
>           "#sound-dai-cells": false
>       else:
> -      properties:
> -        aux-bus: false
> -        reg:
> -          minItems: 5
> -      required:
> -        - "#sound-dai-cells"
> +      if:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - qcom,sa8775p-dp
> +                - qcom,x1e80100-dp
> +      then:
> +        oneOf:
> +          - required:
> +              - aux-bus
> +          - required:
> +              - "#sound-dai-cells"
> +      else:
> +        properties:
> +          aux-bus: false
> +          reg:
> +            minItems: 5
> +        required:
> +          - "#sound-dai-cells"
>   
>   additionalProperties: false
>   


