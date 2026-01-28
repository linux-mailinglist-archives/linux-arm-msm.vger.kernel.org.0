Return-Path: <linux-arm-msm+bounces-90939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCKpDHbkeWl60wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:27:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BA29F6F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:27:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2A63830054CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 10:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0AAE2F2616;
	Wed, 28 Jan 2026 10:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HO3mc43+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kGEfkLqK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053D02FC876
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 10:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769596017; cv=none; b=KZ7OoBN1iuuYeNpboU6FJRRyMNmb0q20/xL3fvIx68x8Y3VROShMIjOK+gMk9emkv9HA0ahLgH1sW1lZmLyUCN6e7i2SekIvcEG2w8ciFcbN6knoZYcRwi5aAstxG5iRng2r9elCWad4uQ66U/am8OG6W+A0urAnn6yY63MestY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769596017; c=relaxed/simple;
	bh=Imfj4iTgQ95yP4Qat4djxcT+jyDZxygR8oV4n1WRUwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dIPLaNuDRCYrACrLl8xR5RhgjBUaL1c89ZE+QnkE5mF1dUG3kjiAa8MDkhICtO2OLWNbBhpj4QuS8Q2h0x5yj6W3XSZ/QMzrVSUtQmglLXLk9DRwV42F1P0KIW81UY0S+URJcpIfyLQi3L9CTN4M1oJchcxqEDX6jFhYD86p+r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HO3mc43+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kGEfkLqK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S938ok3247337
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 10:26:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eD0aQjQxqkMyhCgn2ts5UcBjgfEIq6adVpGl4zx4qlc=; b=HO3mc43+Ae5ux/pM
	eZZBun4mrKy9eS3gUKMF7Xn856bTmIwc9v3gHS34HNpZ36mcrdyPvKXdCzfbwzkN
	atChW+uLBKKvkG+SKg1VgN/rf4MKzeYg4Lnvz09gZE9mSMvSauf4fl4AAibQ7xfQ
	EBBHPzFUmDC5fX60Kt2PJKzplCTEI7B/YDRbM8Do3zlMWmTlYAV91uyCSv1ZowNG
	ZXm++pIjCQT1tnDcGfUfnu3EmKL9Td/zbi+lhfw4l4sveszXWqLmqxVIfoGPvKfL
	oLUyO1MZvD19YvfTDJTilnCyRxYJ/gagDrWcGWwxhparwDltEpR/Rjy3iYMsP1Yf
	WA803w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bydfk0rav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 10:26:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6de73fab8so210361185a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 02:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769596014; x=1770200814; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eD0aQjQxqkMyhCgn2ts5UcBjgfEIq6adVpGl4zx4qlc=;
        b=kGEfkLqKmD9lobcFlv48NUCPDpVeBM8nrTkueN/Tzf805Z4HTpdkh/IAzFr5d1VZy0
         SQMTHrkYxlGfIl+6RBs3rfUieJ0SMWamx3bW+5AHy1QzhpTKqqrv5ADL2JkmL+vhUwkL
         3IRLtMjySL7XVSz3Eed9PF9IdUw5YKFvh0a9qTx1hQOuPnWUCoiFryVfir4jz0CPjSbo
         xm6yxr8vUuQJjn+fSO67thdoaqBOP06Gp2Gy1n0qJErAkSlL2CciWEwn8q7B1xbpmN+r
         N6/Gf17eJh0s0FEqlBSP2bw7WARHiol4jB3MHdjiUMbVhxcMQLgOLp0n9gnfO9zFiXzl
         zl7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769596014; x=1770200814;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eD0aQjQxqkMyhCgn2ts5UcBjgfEIq6adVpGl4zx4qlc=;
        b=RcEpVuaYXppTmSm2qq4aF//pfkQg0hdLunCfoy/mda9xcAi38smq/vD8sjzIUnHgY5
         nTWEtsBMqup3mXrpq0d4cfhmxqBT7Mam9T0zqH9/sxtywN/gNBAW6ppWZsrloIUTOCaM
         ALb9RLDToRE6zDn4ld5SEiFjQXTBz4ah1r11Li2S8672KPmeXyRDKt1i57FA3sUIGbHj
         JaWNZ3/fK2EABI+p+SL4G3UDRZ9zs1qMAjE/XTXInNJV4v8ZfCZw6aBhqClKA0e1gR4V
         v1OhjoIguIB+V5f+uz1g/2ar+xwkycAjFCrSwZsGhVXOwXtzihm23UgneLIBE6TDXjcj
         MHuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsMyJeCeq4Tp0tMz2Mht7M6H2BLX0E5bY0WNqYwGn8wUlzWM438QbBJSPJsbTpNGy7NYvYX+0m8WA/dT6w@vger.kernel.org
X-Gm-Message-State: AOJu0YypCclngCdZm6aV5YzZTwqcVDiL+hh/cuoC72jKOcwk0tNymIaB
	x7D47kY4/YYe4FA9tYqG1RQSiww+TCd3ZoSu6udQZZgJnX4g3JIpWTmXYg0btxxPWewHQPTKmCG
	9Imew7z7i+XHEvpf3d1BxW8PBrSf5w4l0wR5az0dzN7vlX/ZMiZj0jgvXOuM90LuXdTuj
X-Gm-Gg: AZuq6aLPQ1zHBCTqhOOhAUS8Frj4CyWoCZ/AkbM3eX2NZmEPUMrJ4TEGZnD+WoJ/Owc
	z2unF8T/8flYjwizQ4s7LVkmzDguQOZbf+bERewBgHuukL0C6LporW/bkd7FsnvnirmDpeKnuEY
	XxcuNly5T9F0nY00yaLjCwzyTLICizDIcQ8Qj/KCqkgn5hWOtoz4AWLQqSWbQY6NFPyYYDs5Uux
	iE7HzhW1ibv4AVOTI6zq38FTftlp65qRaAQOSd7AzTya/Q5Ml+Yfss4mloXvIxe02a3TxiiLgw7
	wIWmUociWQcVWrVmETE82z/sp0dn+OJyVSQGapsb8X331/gxNvrnlDqwxqcMlf99OtXShsr7r5O
	L+NkiVPy2LKRGl6kQ102Bz4ImjaQAmEyw0vSI+BittSONMAJoDejRufhzxH+IB0y5uGk=
X-Received: by 2002:a05:620a:4448:b0:8be:6733:92b1 with SMTP id af79cd13be357-8c714a7e659mr123181285a.0.1769596014177;
        Wed, 28 Jan 2026 02:26:54 -0800 (PST)
X-Received: by 2002:a05:620a:4448:b0:8be:6733:92b1 with SMTP id af79cd13be357-8c714a7e659mr123177685a.0.1769596013601;
        Wed, 28 Jan 2026 02:26:53 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2e0868sm107030666b.58.2026.01.28.02.26.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 02:26:52 -0800 (PST)
Message-ID: <bb715bfb-0f6f-47e3-b8bd-6592dad824ac@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 11:26:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: clock: qcom: Add X1P42100 video clock
 controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
 <20260128-purwa-videocc-camcc-v1-1-b23de57df5ba@oss.qualcomm.com>
 <fxzm4767ged6hikpblsnh3xzec4qm7dzyfnds7m2ljedhj6n46@zkm7zxz3oo73>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fxzm4767ged6hikpblsnh3xzec4qm7dzyfnds7m2ljedhj6n46@zkm7zxz3oo73>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA4NSBTYWx0ZWRfX3+U9QtyISRNF
 CBUlcQfhaJFqKMF7joRKXD2rHYEhwGpVfIRVJzFu+Fooiq5/IiZpIiaAwgwAd9+8LGMpYEsHUrm
 DBsLa1rbMS4llbF6Jm5zuJ6yr0lDOS0sQHoTjHoyhy9HJ0JEDiuxMclRPhPCBlB8RvBOq3EBwQj
 ZvvmDKU48eddWlU34thXwY+IIxINNC6Y5RDSWE9L1PeFVEpgNKVdoJjqcjRzDJK3/fyEhbcBd12
 SYKud+hDw8IMkMBh9yEuOuXtsJneNyhZcpun/qRrPWa3kbOeiIvZb8yBEU0FPWpSGgTSRfvQmLt
 DndUsiWAJn1Ai8352NCqc25ZcYSyji2iAqGmEsAr5Fnt2DcJxa9Kd0HIhX1azieQP0ygdKxcGXe
 jn7q6uryHjKlJjJy9uUm/wfFv+wuLPJgAACsVBfglHa8Uow4fTsy6N6Omd00nweEH94w4gwxykr
 QoxHWXykU968lLf2iWQ==
X-Authority-Analysis: v=2.4 cv=XfWEDY55 c=1 sm=1 tr=0 ts=6979e46e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6d1n1Ba-E67CpG4V2ygA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Y3V0YNzm2oydLz8SwE1RZWwQowqd7NB-
X-Proofpoint-ORIG-GUID: Y3V0YNzm2oydLz8SwE1RZWwQowqd7NB-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90939-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C5BA29F6F4
X-Rspamd-Action: no action

On 1/27/26 9:34 PM, Dmitry Baryshkov wrote:
> On Wed, Jan 28, 2026 at 12:56:32AM +0530, Jagadeesh Kona wrote:
>> X1P42100 video clock controller has most clocks same as SM8650,
>> but it also has few additional clocks and resets. Add device
>> tree bindings for the video clock controller on Qualcomm
>> X1P42100 platform by defining these additional clocks and resets
>> on top of SM8650.
>>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
>>  .../bindings/clock/qcom,sm8450-videocc.yaml         |  2 ++
>>  include/dt-bindings/clock/qcom,x1p42100-videocc.h   | 21 +++++++++++++++++++++
>>  2 files changed, 23 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> index e6beebd6a36ee1ce213a816f60df8a76fa5c44d6..e8bf3fcad3fabc4f3b7e8e692c6c634d1aed9605 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> @@ -30,6 +30,7 @@ properties:
>>        - qcom,sm8650-videocc
>>        - qcom,sm8750-videocc
>>        - qcom,x1e80100-videocc
>> +      - qcom,x1p42100-videocc
>>  
>>    clocks:
>>      items:
>> @@ -67,6 +68,7 @@ allOf:
>>                - qcom,sm8450-videocc
>>                - qcom,sm8550-videocc
>>                - qcom,sm8750-videocc
>> +              - qcom,x1p42100-videocc
>>      then:
>>        required:
>>          - required-opps
>> diff --git a/include/dt-bindings/clock/qcom,x1p42100-videocc.h b/include/dt-bindings/clock/qcom,x1p42100-videocc.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..eb6c9b7264f8cbced7cfa0001903238ffa168431
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/qcom,x1p42100-videocc.h
>> @@ -0,0 +1,21 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_X1P42100_H
>> +#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_X1P42100_H
>> +
>> +#include "qcom,sm8650-videocc.h"
>> +
>> +/* X1P42100 introduces below new clocks and resets compared to SM8650 */
> 
> And then someone introduces new clocks or resets into SM8650 bindings
> and this gets busted. Please extend the existing header.

This is funny..

$ rg sm8450-videocc.h arch/ -l
arch/arm64/boot/dts/qcom/hamoa.dtsi
arch/arm64/boot/dts/qcom/sm8550.dtsi
arch/arm64/boot/dts/qcom/sm8450.dtsi

$ rg sm8450-videocc.h drivers/ -l
drivers/clk/qcom/videocc-sm8450.c

hmm! :)

Checking further, we have videocc-sm8550.c catering:

        { .compatible = "qcom,sm8550-videocc" },
        { .compatible = "qcom,sm8650-videocc" },
        { .compatible = "qcom,x1e80100-videocc" },

and including qcom,sm8*6*50-videocc.h

BUT it doesn't end there

qcom,sm8650-videocc.h starts with #include "qcom,sm8450-videocc.h"

So it's quite a matryoshka..

Konrad

