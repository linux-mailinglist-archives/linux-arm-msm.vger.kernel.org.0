Return-Path: <linux-arm-msm+bounces-98443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iI6lKgePumlUYwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:39:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5776E2BAF44
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:39:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8809F3066888
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C163C5555;
	Wed, 18 Mar 2026 11:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="olnI2wtJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RkV/NOwn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94C13C277C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773833789; cv=none; b=lCO9+bHwAQ6TnFEVH2ygE5tDSLbTvRgh3j6wJiNGbwXl/qYmG+U6zJqYayNX5uVzw/a6lkBhQdbk1yLEC49SWfbJj386FKUFKMpysiHuH0H1/bWBXZ9aJ7yBAOMmHXNdsnCI7oDtn10RZDtEm2i8Ohv0GqJJnzwKCwmECUjrfHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773833789; c=relaxed/simple;
	bh=6HHWVybq0B6lYWd9+iWN30dQUWTovV+r0fcvkzXr0VI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C/CWz81nw9rAkM3GFQQhtwD17sGb7ecVE3u23h8i/EJDdjeWDsdmu7rdguMrTn9AvFvoWqb+eUO81PsQmcRhuFTRd0WWwH3LfxxAod9pLBO951AW/mCvFZl0ot5J6x0T3NQ6C4PRtM98FiAJ6TMnZfcbF2LHHXvuMWSVUjAWgI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=olnI2wtJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RkV/NOwn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IBBE6Y320243
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yy7Z1kHkosnYj/2AM+aRz7vi1e+/TI88w0bNr9oWboU=; b=olnI2wtJ/VDXYx9m
	Nre6qNntujuiZ8ABiE7iWGonOESj1jqWzaRhue54BaASJvac3ck9F6Gi2PPkhBIb
	Ct6fO1pvNVmyQOU8BQ7COT9oYVe6PHqIRDTNTce7UShn7Gl2w1W4G4jJtRgFXNlL
	n/JwT9gTc0BCrYjr/u+oKYAZKFX6/jDY7NJtuJTNsejSCVGqfvywBPPlFJGOcrRe
	52AdOlFQ5LSYTw23qWN4eQgQ8Kmw9oPXwrElJyU8nPZ0EUOv3xsgTW4DauoOTEbx
	FLwmy7ZhaMDxvBvfhvxbmrd5w8h84s5acy9Ju4lC2w6hT+HLWN7expSZ4wpUALdo
	hMKsvQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytxyr2mt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:36:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50923a9bec8so18640171cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773833787; x=1774438587; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Yy7Z1kHkosnYj/2AM+aRz7vi1e+/TI88w0bNr9oWboU=;
        b=RkV/NOwnAJSldVd8NSLHNUzk4Wz29yGfl8PWMFC3nizl+mzGRkzMH3vCVPhKCVVUyg
         w2u9pvnedOofoTadWB6IFuup31GK7i59Vl/NsXGFhfdMCVraZQ7XFoPzrGFiwRpE/tYj
         RkkN+5crrjdgSVNdYB1nLi8k78bNYtNFWEy6uTEpRwd10MM4rKFfsi800IsGjxR/OTlq
         N1tSyQS8SAkb65lXe4u5/Pik370c7KbHOeLSrCXEuYdNt8FKL5WJgLTrQ5HmGVNa+pj7
         0I1mOyg42pXVALh/tTnbzlYUk1Vzirdg73+xQSIvzBiX1WXBWhXa5fd8+1SJiyPbFOQg
         wLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773833787; x=1774438587;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yy7Z1kHkosnYj/2AM+aRz7vi1e+/TI88w0bNr9oWboU=;
        b=XIx3At9J0nhgzRo5Cyr7VG5O+PB5YZBaG13vMjvVazdHzv49ivGa+7ItXot3yO53A4
         trY/rKUgP3zxtgzHrZAxsCEuu2KsRCoApJbnQSDc4S5+VAC8ulQXv0RvTkB2D87Xx7l5
         zwLcXcgjRrp1WfB2BsfrsF/UenhyMWgl0G7rfxmQS7bV3jOgF6zjwRp0Hzgw2wB3f++A
         fRsxjlNHcBmb88T2fgB0FSFc7EO43FC9kOvs7UJzg1wtIH/dCdZ22pWiqz6vr16NWobO
         KUAB5pMkp7xIQiYCfaOVuYQZVzXZrSOqxb9kYkp7/vPDDK/DogZSXIbxlbMF3N+o8a9f
         4FCw==
X-Gm-Message-State: AOJu0YyV0WFXFYj/nihg09oxh2EPxUibAasKVf0sWO3/6qT2LpomECDq
	EvTH/XIg6dvLfKxrtAGGfFBPbZkCWWq55/U0dF3+kg838+AaiEtrxF7LnYHpmMI2k4SP5u/cOz+
	h5z4ij3VXDNdczxqFV7ZCX6PemygKoQSLpUMaCzuytGF9O7BXs+6ehu30Mjf6dAcExfI0
X-Gm-Gg: ATEYQzzCdyGjIQ9kSZK02yg1ghCXC0q/ob+yKLO/uoPeKv8+63l2CXdNA1b4sWI1bNU
	RjCWLEArNCkkbVMapNXHitlbVQCM7NHmr/lESNq6JlyN+ILP3WDtweMlXGz3CDkBPkbzm9iPob0
	XxS1cf/q5yU0R+EAtaO1HYRFwY+QuIwE4u1zdTfsvecX7Mz9gFZIvVSI9K/BihbEfNZ4LpD+0Qr
	rE2nua73eAhxBUJho6/jbeKlAsuiwzFn0oZGtmUSKgmAGmkRmQrQ88sbpJ6OgqiJWrVY4CPAkCj
	6jctXVKrxgwxfui7LzaGZOr3xu2MSiJ1DjmDVrFwLT666JblANxnYMHvl8xizqOsaPqdHbsZGfZ
	LfMi3KZpVqLel7LbCCbz6KBBkAaUAuDl3s2jD0s+1vKD/EOa0
X-Received: by 2002:a05:622a:1196:b0:509:1cf9:ea06 with SMTP id d75a77b69052e-50b14889b65mr37680041cf.56.1773833786973;
        Wed, 18 Mar 2026 04:36:26 -0700 (PDT)
X-Received: by 2002:a05:622a:1196:b0:509:1cf9:ea06 with SMTP id d75a77b69052e-50b14889b65mr37679541cf.56.1773833786423;
        Wed, 18 Mar 2026 04:36:26 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856ea8fb0dsm251504145e9.3.2026.03.18.04.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 04:36:25 -0700 (PDT)
Message-ID: <846ae47c-8e0e-4fdb-899d-de679d013fa5@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:36:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] clk: qcom: dispcc-eliza: Add Eliza display clock
 controller support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260318-clk-qcom-dispcc-eliza-v2-0-8c05581168d1@oss.qualcomm.com>
 <20260318-clk-qcom-dispcc-eliza-v2-2-8c05581168d1@oss.qualcomm.com>
 <1a00582d-66d6-4325-aafd-156cfacee8cd@oss.qualcomm.com>
 <d2975a1a-04bb-4026-a0cd-34571f99ae02@oss.qualcomm.com>
 <2227a9d2-fb34-4d54-8122-c00f54009de1@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <2227a9d2-fb34-4d54-8122-c00f54009de1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rdgiUuimHWDYHrBtRNArkP9vglTu0K_8
X-Authority-Analysis: v=2.4 cv=FKAWBuos c=1 sm=1 tr=0 ts=69ba8e3c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=BJVpgZEWj_MAxDIDL34A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5OCBTYWx0ZWRfX5PBsbuZQhGut
 2ovjscgC7t3N6N2TYvOtZ3OX40+0vm7/9X5jwpvSLT9OgVBQOiVC4DEVSaXwfmC/f20vYm2jCEA
 vBqa+VaeNsSLY8svkU61+Xn9plLCtnDI5NiLxihG5cUQPs9K24v9vZQWS8vnW1pVofFHvEzzzcK
 H5NQ9B5HZlmblc8plUr3hJNoANJZ5r062fWqHw2dqmym1pdGrQHiRTxno7V2RpjgbIvfza6cKc1
 BA0cQxfWjZa2gmxXE8Ltpgw48D9MJ9BQXCBf/MzwdJ8WhbD4Fao0m4fANVqRN+jcPqapUf6H2P3
 JZLWTjMbwZIiYfbuU0OLlFHbRSBCxTpUrwhGxw7MvhQzNYhyxnWYPl94RtOsqApxW89rt3WM6TN
 z3G8xSz9uG/1lF0RmQRNZawP0/zgOtWJuW3mYgoF1NEzRUIpDNYLPHY8BNSDBOTV9kw5cjH23ch
 vOm6ztKBXoUVEbIlIrA==
X-Proofpoint-ORIG-GUID: rdgiUuimHWDYHrBtRNArkP9vglTu0K_8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180098
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98443-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5776E2BAF44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 18/03/2026 12:32, Konrad Dybcio wrote:
> On 3/18/26 12:13 PM, Krzysztof Kozlowski wrote:
>> On 18/03/2026 11:48, Konrad Dybcio wrote:
>>> On 3/18/26 11:39 AM, Krzysztof Kozlowski wrote:
>>>> Add a driver for the display clock controller on Qualcomm Eliza SoC,
>>>> which is copied from SM8750 driver plus changes:
>>>>
>>>> 1. Additional DT_HDMI_PHY_PLL_CLK clock input,
>>>> 2. Eight new HDMI clocks,
>>>> 3. Different PLLs (lucid and pongo).
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>> ---
>>>
>>> [...]
>>>
>>>
>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>> +/*
>>>> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
>>>> + * Copyright (c) 2023-2024, Linaro Ltd.
>>>> + * Copyright (c) 2024-2025, Qualcomm Innovation Center, Inc. All rights reserved.
>>>
>>> -> Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>
>> That's the copyright I found in the downstream code I used in few places
>> here (with modifications) and I am not touching them. I also don't care
>> about these and I am surprised this keeps popping in community review...
> 
> You may not care, but our legal department does..

And your task as community maintainer is to care about community and
Linux kernel, not about legal department.

Legal department can comment here, if they care. You as maintainer have
rather responsibilities regardless of that legal department.

Don't bring corpo legal stuff to the community.

Best regards,
Krzysztof

