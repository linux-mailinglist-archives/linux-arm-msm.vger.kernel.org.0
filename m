Return-Path: <linux-arm-msm+bounces-98440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJLlH0SNumnSXgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:32:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 864C32BAD77
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:32:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B32A33003831
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E264342CA7;
	Wed, 18 Mar 2026 11:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cMOTsQTz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P/QwAdva"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774E7175A69
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773833533; cv=none; b=MkfLNu2LiF+QQC2itrwE5WpZoO5DmBLOk5y6b+k2YwQ6JSDs+0dUv8TZOxfMkjphAP09mitMvV4hQDlwRoUTgiwTZgc44OctIkI6Vw3rKowH4SUdUYTunSLLigvplhUC/Rp4WQXVyF86/p9Kb8/rjZrTJc4y7QscPR3ZNGVpF2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773833533; c=relaxed/simple;
	bh=an9ITnwrG9sn7ZcZp+JlDtwA+d8Em/2aPRzVbZaB2ic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AH48L0jJwd4T3GEPSZMwenI0ICFSqy7ejqZozX0OenhuWJOoQ/M7AjovEi7zfziVwH9ij3eKvnIS/31EEqbtMawZxY3XAJm04flSBHBoPucql+xFcMQ3G32ytogGf7j960BLUu5+7ijKd8Tr7+9H1R1LukyuqkPEGrtqKhWyLVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cMOTsQTz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P/QwAdva; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I6ZKg22878139
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3fuO/S36hrHNVPfroMptKib3Y+eWWyQsCXUkLO35Maw=; b=cMOTsQTzkzS3h20U
	M3AJaE5yQ5OT/qFrXiGhnOUGcg6c8bdqaf7J4bfXfjTzyuNIph75i8oVttv3q5yf
	MW55fVTvt6uhaTzrAioo+E4lvctHbCI2sQMGFgN5RZacQfT0GthQMGLes7PI9mzx
	DjbB4fBw/4uCWn5ltCHx/QRBZBd7uknWidsi4M6xu2sIpx9WYZFLi3Toi8PA4BT7
	PL+7xnbEQFE2wMlhfVuVh3c8t9N8FOylioeEU7lFYp76TOPmqDidS1JrS9LzT94n
	m8eE6JQ7xTU46COMq7T/DLXnks9/yKkINbHx5+v1zoP8x2ln+ZfkScEp9ZLcc87q
	bQWvMw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cypwr18wq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:32:11 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ff04e26bd9so1607659137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773833531; x=1774438331; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3fuO/S36hrHNVPfroMptKib3Y+eWWyQsCXUkLO35Maw=;
        b=P/QwAdvat4t4mAw/oqhF/cro2ZkrU2HJiBQbvNXyqgUjg7jsVfWb+wviz0HHPhF5hx
         facnDUa2I5XNB7lUtKLKErlQOCqAbkYGmhMdq57R29HyyLcafcOm1ndn4gFVUoD0AXs3
         vvcjys7gPu3L8KkhsFP8NOwQPxJ2IJYV1JsrccnIBgjhsvoyIVcVRoVwO+aopd7PHu01
         lIat41N92yT3POP5jgXxSyx5p7bzCAUdzfeZ7xE85OWuyEt9Rte5XqE8cFsXfQRHdTMF
         G+268Uc3XSwB+P7SnP1DFBS2GlXRFfrS0FRFYPcCglQCUv9EV3d4rFWuhF62PLe4iVWE
         q72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773833531; x=1774438331;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3fuO/S36hrHNVPfroMptKib3Y+eWWyQsCXUkLO35Maw=;
        b=GsbE6YFbRmxRVqe9sJX6EoF2rBSeCSfNvCD4irNAG7NyQjEmU5JP9f1PBEvV15BKUR
         COrlEYYdaWYcydl1yds5uA1ag3PsHGVietRcKnbQBR3RsoWAvlfJ4HAALuWb6Fwa3RwK
         /FabemjlswMPYwAm4PerIimKtMmayhAi+ynQaDmFLLI6/VVolAjFoS1CZ7nQgzSkXGzv
         /T8I3JaSHDKN6i4y4r57c16/S+hUXhxXubpIj9qIdm0knCPW8f4WpxXw/Uq765Oid1Xo
         b5PVHpcRRUTC5Bh0MvdIMgwwS3dyqGFFKkVK6wDSmLbdnTlnLY9aOX5fBule2iD3oSds
         06dg==
X-Gm-Message-State: AOJu0YxQeLxojYZL129MILo5B8b7iY38qkU5EEQ7zGGH8NMl09nMSUhO
	smNxC00v5tQbVLO00d+JdeGyApLZxiCI4zQHmju8vzWP4Iz7N6zxmZ+aZuNgQu5zxBuMPse307w
	tP44OOsda8pOU8ehmGPqql8ZC7zuwAorFfCTr/0S9J3r+Vvtm7f2mZDmfwh/+ghVJuScb
X-Gm-Gg: ATEYQzxdUwrUE+YWnwqj45f0pD0mRIHJT7NrlT6p5HvLSxRYMft0D99fmBlgVCrqpJ+
	NttMs3yk3Af2EiMsd6SGIYcfe0Ph0W38/DsUtgYSkggkIRrZexwmoDB87Rx+w97SzCZ7VQh4ppS
	a3R6Xt4PjAH3cQbORpA9K5fc6ViOkodmzq27V//3eD2xLoeEcOjYGJSPOyV4vkUlc/iK0445UpC
	cnrZzgjL6xc0k3gi2vlTYF24/qTwuJNPQ/rF4z8UWGXW8bp/6zUiqEJTKzyYa2KNbl9Pg6NmWk0
	5NpP2OGVX0ccRwJ2rExEYIKZWkrhg4q5YZisu39zat07nRLO/hWSE+0CtbqZB/mHDQRKzQrtxM/
	gXnMldGzWT11f8BxpbKlFMbuLEe51jnKsD6yrinRxgkCulFK03Z+b98cvsSO3/fgvnEGLCT0m+W
	3OK3g=
X-Received: by 2002:a05:6102:b0f:b0:602:77d7:938c with SMTP id ada2fe7eead31-6027d4b977cmr674959137.7.1773833530831;
        Wed, 18 Mar 2026 04:32:10 -0700 (PDT)
X-Received: by 2002:a05:6102:b0f:b0:602:77d7:938c with SMTP id ada2fe7eead31-6027d4b977cmr674944137.7.1773833530389;
        Wed, 18 Mar 2026 04:32:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f170659asm185160666b.54.2026.03.18.04.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 04:32:09 -0700 (PDT)
Message-ID: <2227a9d2-fb34-4d54-8122-c00f54009de1@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:32:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] clk: qcom: dispcc-eliza: Add Eliza display clock
 controller support
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d2975a1a-04bb-4026-a0cd-34571f99ae02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bIcb4f+Z c=1 sm=1 tr=0 ts=69ba8d3b cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=2QFKZ8CVrmOv300_2-IA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: oiwC8wMh8PkpoJex7TFH0dMcdg8Frk-B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5NyBTYWx0ZWRfX0RbwR+xLtnNe
 goImnJVjXkpkxFchycb+l2SiF8WDnb9/zMI1v6mYbWKM9znRW/1OeCg9ozH2HTO8v9/5vl57NH5
 Xwji9YjOkogAIP9wvm/n7GnC6nnuzLrfvWLup5d0S+wp2xHLVZR54uj+pI2wcVtOaCh7+AfeveQ
 W1n28G0NLBlUfRF2IBqZKDIrCi4aP5GNRpOBEMDqNRXrIdtWAavSOgBugtixUXujFEfo0KqB3V/
 EHQO/ocFrdAaNillv2FMlhBe+IEfs1t37wZSJ4wIQnPg/Zqofl5650DYakUUCkt66kdntaUSZKi
 nFu9Sy5PGnlcL4S6x11Zi0iZvANunaxpCASeIi50E8AU6qUuqN5tczZAxukLlRo0w/BTEtbHYRa
 J2OS89OpwGWnUv6+15i8fIZib2JaeXH2JmHdDk0nhKxeoNCrx8l2oXwyCvCCJCWQyoCTRtZKWQs
 OocylomkMVo4FhaxmVA==
X-Proofpoint-GUID: oiwC8wMh8PkpoJex7TFH0dMcdg8Frk-B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180097
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98440-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 864C32BAD77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 12:13 PM, Krzysztof Kozlowski wrote:
> On 18/03/2026 11:48, Konrad Dybcio wrote:
>> On 3/18/26 11:39 AM, Krzysztof Kozlowski wrote:
>>> Add a driver for the display clock controller on Qualcomm Eliza SoC,
>>> which is copied from SM8750 driver plus changes:
>>>
>>> 1. Additional DT_HDMI_PHY_PLL_CLK clock input,
>>> 2. Eight new HDMI clocks,
>>> 3. Different PLLs (lucid and pongo).
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
>>> + * Copyright (c) 2023-2024, Linaro Ltd.
>>> + * Copyright (c) 2024-2025, Qualcomm Innovation Center, Inc. All rights reserved.
>>
>> -> Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> 
> That's the copyright I found in the downstream code I used in few places
> here (with modifications) and I am not touching them. I also don't care
> about these and I am surprised this keeps popping in community review...

You may not care, but our legal department does..

> This was in original v1 and you did not object there.

I didn't notice it then.

Konrad

