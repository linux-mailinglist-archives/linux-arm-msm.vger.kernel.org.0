Return-Path: <linux-arm-msm+bounces-65669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CA4B0A5CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 16:03:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8113C5C0754
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 14:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAD3527BF7D;
	Fri, 18 Jul 2025 14:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fdR20Z8T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E20F15ECD7
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 14:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752847384; cv=none; b=urnYEfXLZCfrD52faljSd3KAjJY7bPMMenrxsdGV7XUwPbN6GAevcsTfydNMlL5lFLDHPx+BkjmfYCX/IbB7SOlM6EOhYWGEkf7smKdtwvLnvk0KqMox0cUsEi/3TpmZr87I9BKWY/4I86AiT+WCG7yOPZ8CckJyvpFO4H/B7kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752847384; c=relaxed/simple;
	bh=oxn3IwVTE7XSOYRmBd//e1DLeZb2q0A+/xIJwcd3XFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hXX/rw25q9PSvWV4ZT7p61YskWgUEf1JadfXBc5CAApK7dP7DH8Lbhmrf2ZHAs/RaO+UVF1z4ttq7ew62idyQgb2W5jvdHxd8CR8mIPQlSYemDe84gd61uxroema4A3AhNDU+YJM7MC2bCXMYueY/uhvKl4mpcB8B+PMWVx2JwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fdR20Z8T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I8hOAU028094
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 14:03:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sqth6q6knDV0c4169t8Y4KfYUSLGiSnvgG9U5KJWf+I=; b=fdR20Z8Tv2bfQ4RS
	ivUOSzvyP0AQHfycy2lFDqDXwSpa+5S0dmXjQWR4Uufqu/sW2guK3wPUKJSNvcs9
	kg5d2D8FgTZ4/dtZ3NeUzqEla0+ZT9NCGhREZx+RTRA3PuHEtB6FnGki+eXI64VG
	SK02lCALPeJXLR2wbAyPhUZKnlM0Dp0f2KWfK1e6aG0aSKePiWzS5aYqcoyqPTHO
	zGd8TLoee4LofmzpFKvV9fHmvcMZU+7uzVfkcUR6cXN9XyczFpW4hH+2ZWZhr9RF
	GtTiWziFm4UcHmxoxWpMg+rVX+mqSwogqnWjF1mdXyCNAE2g6RbEHehIWslkkJ27
	PqbCPA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh641fu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 14:03:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3141a9a6888so2063927a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 07:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752847381; x=1753452181;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sqth6q6knDV0c4169t8Y4KfYUSLGiSnvgG9U5KJWf+I=;
        b=PzXgPQQrcYkKYf5ohN8j19ecnoecWBS32uVqFxdR0xrt1+AzFtjlYHmrK8XFmpyGHp
         w+WYaPYL96VjnmAwebK2co5T/VarZqodCh5QBu7mM19e06sooYcRqS6xfsM+r2gShEhh
         4gAlJTGeQ+iSqDMuDrWLXsJLkf7h1Tb9VQpSMLNYcFRU4Lzi9a8IdoyAs0wkmqAGZpTE
         70nX+Y26SGtBuvgsk3denjggvRdq1gQGSKMMA9eEyZqDS2+rf2ri/Wnhbd/lI18tZfGY
         6IlrNSL62v7jzfxyw5x5sA4i7V78iYH1y/5/VBc6BhI1i0NB4+6VFftp91PIhvrTZvYN
         nPRQ==
X-Gm-Message-State: AOJu0YxwLQX+f617fVMoKROQBLy9OqZDAVOzR1aLJOgLem8B0juAchHM
	MTS4s00mrfWpUKYqGz1iIwcLigCPxDUIOqB5Xvf/0zQWOAFifGLI0FCbxeA18GrIzl89PTv0z/r
	h1FaaoieHX9SVqExKLxasuWmN+pumcMW7JC/CP2jqiHN1f8M+vbvN/k7QUdwG7iXAYUD0
X-Gm-Gg: ASbGncuKWIBoDiP+gDinAR1vBw+Dlu4wPGzpx1aLwovG7hrSnXM4WhtgRdJM65bHFC9
	dR5s9r5vbYxQEe0lbyuWOLeSqHgDMoXyvNjvFLdwgAS+TqyOqmPRs0ARdMrpl1PROKQPrfdlmqk
	mQ43BX6lRM/sTCoFEREFn8fpiiXPvoC9VIFRGng0gGND2ykcF6/SH8dDQXmPe9nCRkJdrWwMgcu
	Bp00yfrVdY6DcQ4ajrXtQmM7Ch3ADsXZUfIelsH4+Tep9Z256tYgW8w4qcylLAR3xxfq4M/+GwJ
	xfpdOUf5QHhJ2hgKDaWUVOOqAyYr3rG9KvM2rrzqv71f+/XtvDOyTHV48PWrGfjwpZQucs4Jmfi
	9pExhlUDFxcg9qqgfkt3pgA23VDNc0JZvt5F7Idj0XNjyoF3K4Thb
X-Received: by 2002:a17:90a:fc46:b0:2ee:d371:3227 with SMTP id 98e67ed59e1d1-31c9e7617d1mr18338317a91.17.1752847381216;
        Fri, 18 Jul 2025 07:03:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHx/Y9pNMGr8gS5RpnPZrq5fjuBLOtCovUN4eitkJ53U2heLtj7mZN3nIf+YOVTn/RDfU4J8g==
X-Received: by 2002:a17:90a:fc46:b0:2ee:d371:3227 with SMTP id 98e67ed59e1d1-31c9e7617d1mr18338214a91.17.1752847380598;
        Fri, 18 Jul 2025 07:03:00 -0700 (PDT)
Received: from [10.79.195.52] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc3e45e6csm1391851a91.3.2025.07.18.07.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 07:03:00 -0700 (PDT)
Message-ID: <a2be3ff9-d364-4a6e-a8e2-e0391e979b11@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 19:32:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add glymur pinctrl driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_rjendra@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250716150822.4039250-1-pankaj.patil@oss.qualcomm.com>
 <20250716150822.4039250-3-pankaj.patil@oss.qualcomm.com>
 <e69e6128-3f50-4bd3-89bb-09d7b237a568@oss.qualcomm.com>
 <19b62fb0-fb49-4a90-bff4-f5634547f2fe@kernel.org>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <19b62fb0-fb49-4a90-bff4-f5634547f2fe@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=687a5416 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=ISValDjW7LgzQFoTVgsA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: y8EllVmTK16N-89RIdCpVgRQEmK9eQrl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEwNyBTYWx0ZWRfX5z7xbntABXGW
 wEistjNLVvLKnWKyKNusgpQU61k+1L6hOzjEV7Qj4QbN2sqryMYh7JAHUcvBsD9JZvpORrBd+wV
 j1riY4wcbUrSn+6YpqpaENb6S4xqkisv5pPgOXqrkQKpz+M+H8UFRVnsDf+iG8a6OzEp3xRR4HC
 93cWWZcprJ52Dbm0T2D+15vE0tk4TygbwDDi+Cx+r3wXdwKr7t6aOJ+hkKW77jxMi54z8vIX9kc
 FzKt2pZOHyZa/n1aEP3k+VDXMGRnhopLeDNzLkH8nyuFzGJXQGndBq9nCtdAqwhVLJP+qza25J9
 qhXGqLOD3x3IcJxSi+8LhJ6GUMf2TVxDVmngXoKi59O6e9jwlKAf2QxHfNnZHGjL3X8D1vGAnR5
 srejT+bwf5WhAgiy6CGuypTjaqLHkAAF9OsDfZdceVPbSjbWdgieAOLsOyeRdV5JVCs3nHSV
X-Proofpoint-ORIG-GUID: y8EllVmTK16N-89RIdCpVgRQEmK9eQrl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=973 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180107

On 7/17/2025 8:09 PM, Krzysztof Kozlowski wrote:
> On 17/07/2025 13:52, Konrad Dybcio wrote:
>>> +static const struct msm_pinctrl_soc_data glymur_tlmm = {
>>> +	.pins = glymur_pins,
>>> +	.npins = ARRAY_SIZE(glymur_pins),
>>> +	.functions = glymur_functions,
>>> +	.nfunctions = ARRAY_SIZE(glymur_functions),
>>> +	.groups = glymur_groups,
>>> +	.ngroups = ARRAY_SIZE(glymur_groups),
>>> +	.ngpios = 250,
>> 251 (0..=250, incl. ufs reset)
>
> The binding said 238 GPIOs...
>
>> Konrad
>
> Best regards,
> Krzysztof
Will correct the bindings along with the driver fixes in v2.

