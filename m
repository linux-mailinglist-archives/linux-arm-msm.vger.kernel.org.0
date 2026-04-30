Return-Path: <linux-arm-msm+bounces-105382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHO/GGF082nQ2wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 17:25:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 039674A4AE5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 17:25:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1EB04304D8CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 15:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E758D2DF137;
	Thu, 30 Apr 2026 15:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nA7ZlNwC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TFQE49b0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6D02571C0
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 15:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777561967; cv=none; b=ZG6wXHtd9MjCoq/TfdfZQFFWyiBpuZJoNRJ6msdxdDYNEkqUS23b/PnjzGOZ+42Pqlj7IjBiKiHsxCAD+CJcgRnk0KerxWvexuOws/uOZnl8ywsMKa+IjQcDqI8DcFZhJ2IrQq8r3xXADpM2b/v8ZdkhDnwomXjF17C44m1jqss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777561967; c=relaxed/simple;
	bh=G4L0Xf8IL4fWRdLnsrKd1HOfE8DHAWvVmaVeHwz8C54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e/OJ3sw93UQ6VcYqquzAPlp37BFKl3nFfS6ztgpAOg6KlFGhIp9zcFAXcG+y3AzLUhsBFeSZz/2KSAdDCE92jIQj/p2HjoPLVtgqZZ+Vdg33M+HAL2isSVBYQ8p1Il17+0lD6p2rFlaTGjzxKkeRSTvL5ZoR65T9v0E3+izL6F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nA7ZlNwC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TFQE49b0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UDNeU52480914
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 15:12:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ulrYcfHf8eIqVY1+cFokIxV8AlG+2IlbHsMqaIrHX5w=; b=nA7ZlNwCnxkpI5Ua
	T6G1AUGmSdjawvYbxrjjjz0AeBOPpy6GZpQNm4/z+usJ7YfN4maIZqsCk0VhKPSc
	hHphZIFqkJB+IwUwPxcvf6OD6uRNnrn/4G7LzIyEjkU1ykNclaSr5jdwQiRmZvdx
	GXD2LS+EsBuZ3is+J1nYv+5lbj277XrsvoFr4xLAn1qyBBUHWo833MoTk/KCJ11T
	tDiBWgtiB79WiozhqPl6RYjded62mRvhoTn+WvGBYFs2LDn49ZitpY+OZ1zkqICA
	zLcRKFcixkg3PFmK8+dko2US/nR73peqs/8eoP9JNywyfy8PNbHOSgnywW17ncCK
	7h6oaQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv7x6gj7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 15:12:45 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95cd67d9a7dso47116241.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 08:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777561965; x=1778166765; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ulrYcfHf8eIqVY1+cFokIxV8AlG+2IlbHsMqaIrHX5w=;
        b=TFQE49b0TWm9tyGcXvlmVbSITqFPxFJTkw8S1cJvt0Bp1EsdGZKA+qQUWZdMPkFo6F
         NU4YP6kv0hfoF6BYLtmOUIqHo7Mji+gIxKYSjKvXjxUzRS42PuPx/IvznBBb2WMVtAD9
         7l+05zn+wToBc+6cMwd13X2zuyZJTcSWm8q2z7m/FJbu7WlzfKJuKQDjAEvZpWbJHIG7
         IV+IJwNJn0sKtTasqRJHNNjAtxXup6C379a5yCpfZvtdepfyKpwqumVeIzo3u1eDJpx4
         4fVQ8RWOoDq/k5Pc41LnRt9epsYC1qP9oUDki/DAuvpS/EhGV+/8x06wQAI2LnpJ0tPY
         7QEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777561965; x=1778166765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ulrYcfHf8eIqVY1+cFokIxV8AlG+2IlbHsMqaIrHX5w=;
        b=IqTq+6ebjqun4tuwn9lkviJtX6UGSWfqcPV/gcjPg5TsXavRMZ6RMxkix1oleGczRO
         DuetiSz7oYJhMsrJkGGpakpyqhJA/AwsvDCbDGp9X0ym5OiGPZpRbpy26VUlmgqpRBWb
         Nu8zTPP1JILniGu6BKm2xXZC0RrcqHH3jRFYc00vxMJZrDxzS2R3VCHkBj25k01fR9HE
         OA77abCGif1JyHmYDkdDLYV7Vj3S+m24snhc+9aRFPjQZE7aGm0/16AEa47duS9ZV/TR
         0XMA14OotY0Xp6QDNa81H3nh9tN+GXZg+Mr4ofKHUSNZ4KYAqxv4bo08ZhLcjVVtuURG
         Wnzw==
X-Gm-Message-State: AOJu0YwYu7gAPuisBI8Mxu0Z1yA2kb0NnVS3JSRO/BxsFXXhXjKA9zS9
	JEFpTNcajq5Qv6FxuM2AKyXLjL1Llr0IShi+xQs/N9IV8aR7cxGHwVuj92dTcAyxESydO3FAuI0
	tKa4+juvW5+nd8PcukaTnD5z6Oa53VdMmc4hiWNseMHOfkB7GvktkwPqWgFHYcTzvHKr1
X-Gm-Gg: AeBDieuVroFsj1gtBWrzvGkjkbhqrivCQEXm+2bOcl8+GUgsRvvU0ywyL646op/UrYM
	CEjNVrhrrvrg/FlnJIpLretG+DDICcPPv5ToTeBTX3JiH2tImLaNqBW12e4WQfwtz3OgvQlsP14
	Oj3SHLo6B2+8P4+fs1OwgEODaPC5ut03qRJ2UcTu8VYGmzAOF0nct6iAXQFAuMkmUVI9S0Lqnmf
	dkwIlW51wdqcEWWXHy/4FHMcqLKdjImksimIXYqs0dBEWTYivMbupj3fpvD/INkFu9GCbL/2hXH
	yhJ5CcMtrqz82BTC1IvfDwO5LICgTfp2TBSSuIeFJGzZX9kzf6v2pDd0nypMdArVkXpmou2j+ag
	k+6IJ2maW1q8XCuZDjgSMZ1C/+0h0oUrk8KThDSMJmDTbHSM7JwKu79C+fPZT4gwfkqYWJiEboV
	j9XH1FccICNBsByA==
X-Received: by 2002:ac5:c9ba:0:b0:573:abb5:7d39 with SMTP id 71dfb90a1353d-573c9698ee3mr610462e0c.3.1777561964656;
        Thu, 30 Apr 2026 08:12:44 -0700 (PDT)
X-Received: by 2002:ac5:c9ba:0:b0:573:abb5:7d39 with SMTP id 71dfb90a1353d-573c9698ee3mr610434e0c.3.1777561964239;
        Thu, 30 Apr 2026 08:12:44 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6a64d919sm8497666b.23.2026.04.30.08.12.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 08:12:43 -0700 (PDT)
Message-ID: <efd349b8-eb01-43ab-ab0a-99e6d9ec0885@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 17:12:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: pinctrl: qcom: move gpio-hog schema to
 tlmm-common
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260430140118.3684018-1-swati.agarwal@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260430140118.3684018-1-swati.agarwal@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7qJtbJFZhchN3huClVXMD6Q_z9E0I4YN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE1NyBTYWx0ZWRfXwmrUCqFEoiyp
 cGbrk4ITMicLt5GPe58qOZw5OG4WX6jM/ZzKSNko6lhJAlt1BXA00fhM9ow3cygyNrI8+aEVQlB
 IJI6h6dxYXoMC6r6l61+FhhmtzdOVTS6u1nMMaWA652EIFLCHxxCk7nJIUQkINP25ofwOGBJGhM
 cQ6SIDFysWi3JUDpjCEjNR4w/ulWg51gu6Jx4Zh8i699jubP9JJsexsWzFEpEqYZ+36fB4mF6yH
 mFrDQLYhhsC1qIYw+lzQexGYVSABrO1YWhJaSbiQEM5ua0zGR0C6jQBEaMxzNLDgdkc/v9Zrfvn
 ypmhFvAg3adDS92eZ4J638qRu4VQviggKq+cM+xsuezJAlnxdErwX4J9r5ZPy2eBS6fe7qFoAjL
 tTLgbeaAPg7EgeSLmDCZN54S2qLdUwbDxeuf/2EijKTZXkRtoJogPIwcNIoR0bjek9EVBjvVo9A
 mcgaLKkOlBraqMFcTiA==
X-Authority-Analysis: v=2.4 cv=XoTK/1F9 c=1 sm=1 tr=0 ts=69f3716d cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vT5BNdOIVckz33J0OJoA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: 7qJtbJFZhchN3huClVXMD6Q_z9E0I4YN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300157
X-Rspamd-Queue-Id: 039674A4AE5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105382-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/30/26 4:01 PM, Swati Agarwal wrote:
> Qualcomm TLMM-based pin controllers share the same gpio-hog binding
> semantics across multiple SoCs. The gpio-hog pattern currently defined in
> qcom,sdm845-pinctrl.yaml is not specific to SDM845 and applies to all TLMM
> controllers.
> 
> Move the gpio-hog patternProperties definition to qcom,tlmm-common.yaml so
> that it can be reused by other Qualcomm TLMM pinctrl bindings and avoid
> duplication.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
> Changes in v2:
> Move the gpio-hog patternProperties definition to qcom,tlmm-common.yaml
> 
> Link to v1:
> https://lore.kernel.org/all/20260417152014.3000797-1-swati.agarwal@oss.qualcomm.com/
> ---
>  .../devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml    | 5 -----
>  .../devicetree/bindings/pinctrl/qcom,tlmm-common.yaml       | 6 ++++++

Please also remove it from qcom,ipq4019-pinctrl, which also includes
tlmm-common

Konrad

