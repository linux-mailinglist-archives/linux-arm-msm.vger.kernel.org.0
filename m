Return-Path: <linux-arm-msm+bounces-104394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fa11H0wq62k8JgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 10:31:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D7245B809
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 10:31:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 057F53068D4F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 08:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D9A33368A4;
	Fri, 24 Apr 2026 08:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g879Bmck";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TYyrvBC4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A8332AABA
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 08:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777019203; cv=none; b=XF3Js27Q8L4EAqjj7sWTepvPH5JYV22gHBb4RWSR7utTr1WKY9tZShHl+l2zsJgJ2+uVZL8sF9GHKEzOSkEMA6rhsecsIRqiE8PEE2xAA2cgdXslQqDdb1n+3Qz8ujtR4U7ojsOyIXhGBCyMs7/hofLcpaMOa9nXETM6KVhnjf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777019203; c=relaxed/simple;
	bh=mrjuOE3fp3ldYK8xPEL5xhkLTfhi7Ytij2WNvb3Mg1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LMLZUr1VpnIblQB+QsN9XRDwZrVhMZEnzJUkT29GIbewXXh730M5ONTd7fLBDTaTsp6wiLvbpxHiYAv1rVCWDTG3EF3K36jHNluMm/Jo7B2y9YUZaJuYRJJGUuTzvDD6aA9OL9E1veAQYXxfYQYG/O0XaO2Wjnf4bI2jv0ops9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g879Bmck; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TYyrvBC4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O8LkhU4012117
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 08:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sKHlaaiNgSfzIyzrCdP3s4bzl4EsQF8dr24Ms2iKUW4=; b=g879BmckryV4ZlOB
	VZwc1CVfNaVvWt42wfdBeVu9mEwcxJk37RGmn6MhAkQpCnCYvislqOrzQP8Zk23U
	Y0MBXgzxF9DDL/yooDBuQMZZcd/dWSWIj3AvjW3fZgzS0e/LOziYoru47UcV4f1w
	H6Zb9CvOXoxW9YeIFOr8hjxj53Ra42k+aW338OvqD9M+GMSgifcDxeMFgtrnSDm/
	WyudzyXJaTxMjMPqCCGxhIX96owmP+SRs0a+r7SryYe+kiiW7Hnd69NnoikgNMKN
	/EToGOVU3+f/9gaqVVTePvMdkmXdC7ABycEonEDWvxs8/ALJV3aE4VJ6FfjKM8z9
	AzJRkA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqpq9uccn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 08:26:40 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so4449203a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 01:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777019200; x=1777624000; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sKHlaaiNgSfzIyzrCdP3s4bzl4EsQF8dr24Ms2iKUW4=;
        b=TYyrvBC4IFbN/Ktv2ZGJ942Prok3iDFDyGUq2YzdYW9RkBwgxJDFe9hIzPM3Q302KN
         O6xqLg1Kv/6i87jOOrTYH/SOJLqVM9dUs6T0JePy31USI1R9e6xjnDU8RWIySxujccgk
         Ad8RX/o6qLCmx5c07halWHA3xTaNMF3Y6YGNyPCjOi0hFymBFvTndz+unbs+x3wfMaK3
         uxkSh2YYqfmNErCPMSUQerx/F43L0VW/kQclZw2ZJUltrQDWKcuBrDFXZ1cW8QJBCqVx
         QOshVfvNF7XaKo8HwyVVLYEq05FrY5bVs/WtvFgJR29KYs6ubl1CaNx8pVF17ilHc+ql
         t4nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777019200; x=1777624000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sKHlaaiNgSfzIyzrCdP3s4bzl4EsQF8dr24Ms2iKUW4=;
        b=hRoS/3FM5P94A7JvZLQpWIbAqnGNar8+2mWxB690EbBIrOSVTgFUvSfrqDCoqcRhEQ
         2dIlT03EpM6iwZUtw7DakNhRbNR28eTq59+6kmeebZgnTHJ8/Bw+sfneZLMfYy2cu16V
         UB11d06plZOeWpPs4vOeBamu6r3b6RPotXjwkNa3VP/xSF0adOYz5YqmVohWy73aK5zp
         XyNNa3p2L+30GnqERPSRzQOp/3Aq4NCX8F3BZdpVn1IfMt6PBs+HsoMHF8GICNH8/WHe
         ndPWNAqShs+DK3OBSwKlbK8qVkKxYwrFLZk2S4x9KbgMMUStvASy4oD54aCGD6Ptag33
         oGRw==
X-Gm-Message-State: AOJu0Yz0Wd5slH3a92jTLWX8b9bUfshEoxgztkwvaUoyqh8Y3q9ImsAr
	M7Po7s81GwGRefcI0JdGjhjK5aIn5hEqxnYBRDBfydcKHBo0F1qLzH9xPuEQC0g3+rAbjm6IQ3d
	DtFPTCTYXs9a40xAY20WIZg7evtw6cm+HQqGMoGltm8ZaAGoE41IGNodmmYzoTkHVeVO/
X-Gm-Gg: AeBDiet1StEw58EcMGpLtSRgC7dIbd0zGLqHFmrjOVEytRs9smxmHqOK/Nzzm4eF15v
	vJF18ZE4a9h8UM0CPiczzkfZRTfmC1kC9t3DxT1znPKE070B1ZvJQBUxptza+dx4BXh5BmI6mvz
	lIZ1rk0KTmvXS4TvWVRCGP0JdiGuUqrY0l19wLVLIJa89pPFhx7GfzDXyCPTOkKxdDZU0aeBF09
	/2MxJwm6vHYcP1kdgbmnQDI9rtK+/1swwRzebfp6+bWA4aA7hVo9UMJ7kbe1JjD8eHt16YZe48Q
	vTM23kcxvD9HdDNhfybDimiIEMX+PELHiFSM3okh/+MeSaXeOSCYj2iPGQESBEuomAVWQu1ck5G
	e6VafXEP2ddlMqQHu9hEPOCzJLlpWqptOXeNQoAA7zd7W7fu1Y+xAXNc8Ee6r
X-Received: by 2002:aa7:914b:0:b0:81f:3bcb:af2a with SMTP id d2e1a72fcca58-82f8c8c39c3mr31279181b3a.26.1777019199750;
        Fri, 24 Apr 2026 01:26:39 -0700 (PDT)
X-Received: by 2002:aa7:914b:0:b0:81f:3bcb:af2a with SMTP id d2e1a72fcca58-82f8c8c39c3mr31279171b3a.26.1777019199243;
        Fri, 24 Apr 2026 01:26:39 -0700 (PDT)
Received: from [10.219.49.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec06cbfsm26639666b3a.58.2026.04.24.01.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 01:26:38 -0700 (PDT)
Message-ID: <ce370616-9499-471e-8217-726655764b00@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 13:56:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] pinctrl: qcom: lpass-lpi: Switch to PM clock
 framework
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com
References: <20260420123135.350446-1-ajay.nandam@oss.qualcomm.com>
 <077cec8c-f6a3-4ee8-8ccf-7bc2e540bc61@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <077cec8c-f6a3-4ee8-8ccf-7bc2e540bc61@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA3NyBTYWx0ZWRfX473K/POMGbys
 NaXimK8UV88xXxUqny9lYGZG9TMn6HEjQ7W//yT7CQvxv5tIDL8caKrTPX/f9m0dMNC7pqtC2Rf
 vuDBqXnSQbOeDR2HR+5R88F0xn5BKblfxXCy9yAm4y5xBWANDvGN054Dfgk7R4Yh/56F5p81XRJ
 GpgOVWVSbcdR05+09fKU6wzopEzMhp6EE4jfvrxagIl8VyAN7hhSfz0WRqNWYJ65YLoWwPREmGT
 UyamTLZyKDqtz8NPyBNwaz6MQhpkxPecLJA1BjV13BKHSrCW1Z+AP0gLXFi+r8Wy75BOGXrUc4S
 bnXOVKCs+5Bk63NxN4UquiPZqSzYmuzyN+zM+B+XtJPxK0NMNtPpPSTNoH9qowDdJr2SCYfl3Sw
 5cgPJ7Fg+gXJhW/pv+gyI9UmC44XzZ2AOtGDjnEzlGV+CPm4yHg9D7ZSce2BXfwkcj+Ixd5iqLS
 ear8TuKUYf9JZd5nXSA==
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=69eb2940 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=T8sK16H612TzD4tvtxEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: MQAUn0TdMdbe9QXffVLGq_wwon4-p19G
X-Proofpoint-ORIG-GUID: MQAUn0TdMdbe9QXffVLGq_wwon4-p19G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240077
X-Rspamd-Queue-Id: 10D7245B809
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104394-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/22/2026 4:29 PM, Konrad Dybcio wrote:
> On 4/20/26 2:31 PM, Ajay Kumar Nandam wrote:
>> This series moves LPASS LPI pinctrl runtime clock control to the PM
>> clock framework and ensures GPIO register accesses runtime-resume the
>> block before MMIO.
>>
>> The common LPASS LPI core now uses PM clocks and autosuspend. Runtime PM
>> callbacks are wired for all LPASS LPI variant drivers sharing the common
>> core so behavior is consistent across SoCs using DT-provided clocks via
>> of_pm_clk_add_clks().
>>
>> ---
>> v1: lore.kernel.org/r/20260413122233.375945-1-ajay.nandam@oss.qualcomm.com
>>
>> Changes since v1:
>> - Kept GPIO helper return type adjustments in the runtime PM access
>>    patch and switched access paths to pm_runtime_resume_and_get()
>> - Added runtime PM callback wiring for remaining LPASS LPI SoC drivers
>>    (sc8280xp, sm4250, sm6115, sm8250, sm8450, sm8550, sm8650)
>> - Addressed style nits in GPIO access helper declaration formatting
> 
> Each patch must be self-contained and not break functionality or build,
> so that bisect always works
> 
> If I only apply patch 1, non-7280 platforms will still regress because
> the changes made in patch 1 require that pm_ops is set for the clocks
> to get enabled (otherwise it'll just autosuspend 100ms after probe and
> any subsequent accesses will crash the device)
> 

Agreed on bisect safety, will reorder the series in the next version.

Thanks
Ajay Kumar Nandam

> Konrad


