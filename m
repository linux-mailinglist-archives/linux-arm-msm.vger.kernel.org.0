Return-Path: <linux-arm-msm+bounces-107245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLD3NR9HBGp2GgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 11:40:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F48A530CEF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 11:40:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0D103168579
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 09:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE233E5A28;
	Wed, 13 May 2026 09:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LUf1g9nt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hxRTc43z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59893E559F
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 09:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663983; cv=none; b=lXrWkGi+DGhXh9MfvBeTij35TLd/QM3q62PBxlarTFTX14NSfY6sDKEOJXJc+MLTFUtjnKaV5k7IxjEz2Yn5TDSTlRtAwBnibnayFC9v1PuMXiyt6bAFCI7G55shK3RK5nS5ZYXiYUJCm96ESF5b58QgpsApeZpOvIb5brbC7WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663983; c=relaxed/simple;
	bh=NKnLkb2sr2xbZve2OLQZ/3C74K73Z3uIV/fC+LLhTXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aOjfpAzHeOJt5Sd/S7+g2xK2aC4Ph1rDGPy9OQDQIR8JknybMqVugFUC3geDgL7+n933drnz8/loFjB90F7DMbh5+Q//6vWvwwTgmYAWvC7A7bFdWpE7kAeFiPxMxJh5qwcasIhovZXtWJ2ndsfQS6UiT4qqThzCsBnBKgyyT5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LUf1g9nt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hxRTc43z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4p9S62331406
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 09:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ubGLDC8aD+/jdmq08jDx3ISyhe8T6BJJF2GBKRoCBHQ=; b=LUf1g9nt1pzCHwq2
	5O/+0XGEIJWOG+C2yj3hw7tQCdV3oJapub0/dMTUqH2gez0oMOvt4s65CVY2/NIo
	vVgv9EaUJMAw61m6ePk8dRmY4qXEHgKFBPTqmWr0a0BWjaUjfZcPRvo/yFizioC7
	e2R9B/PWFmhJ7/TMglKQR0WOQ/zFflv9l+4JbQDf4j3gAoOP1SYt2tvCcza0TEiQ
	GOc7d302AJTvX5XIMx/3st7SxJWUWrJroTmnBnZ7SRQsCVlDV9RHrWpOTkvzrYb7
	H+oc7utzUtIUYcwRu7aKFvX6XZH/RpFswu0h/pIkdDJka8c+O11Qf+LfmB5+2cIt
	NPqoxw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43ypcddr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 09:19:40 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-573ac60fcc2so555674e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 02:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778663980; x=1779268780; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ubGLDC8aD+/jdmq08jDx3ISyhe8T6BJJF2GBKRoCBHQ=;
        b=hxRTc43zKkQd3qOPHg/4CkDDaHXo16sg+FC+UqX9+sC2Z8L+/mdQCBkM3sXKxxx97Y
         TxSFWKQ9u8in/Vps+AYKCWL8dgI/YbyMMXbyLrT6mqgjxYtqkJTv5J9F5Qyi50jY0inB
         VAOk039oj+e9h9GyZMSXgUISWNdNldWnM7pshQ2sQHj+rKOkkOvuo2N/pvD4sm2lKQ6C
         LTB+mlCUs0wIifOlGQ+TMHvH83J/xUDhN2FpHWLQ88suoMHrmU9gmSPjvFlNtiGlzxLT
         poMMjTUdbxXc96xZ/8GFoPHZEKMpv87Q0H+4QS0D98mJ6A4XCvsLMBwABmYlRwb48sw2
         /afA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663980; x=1779268780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ubGLDC8aD+/jdmq08jDx3ISyhe8T6BJJF2GBKRoCBHQ=;
        b=dVz8GPd7gsTl/qFWVNskdr7H3+b8qI6H1F13Ph2QKJ9b0XCbM0WWLp33EysZg9C6X7
         hVHKVuWan9ToXpDJwAFN3YZrmoMZWTpDhDZCRgWnLI9AV4hyKNyzco6zqYmlMDJZT37+
         ls9z8YEcBfd0MxZI26/NCts6A9RyVIRFnRifL7kAg1FJfm7+CZHiDPsGPU9oSgpydqfO
         xFm6/Mf5Q4QmAseKVkrdbapYK1apDUhfK9oC7yzWUJG3SANfmuYhHLPywDgPAml5jJjk
         J3/dQwvLEcxn/rD1hmTdQpifVMdfUaIN1qkBqfv+NIdyfd5EUWUV/yeIGAwFfvLpR6U3
         NllA==
X-Gm-Message-State: AOJu0YxcDX1o4YXyTbnG6+lQJ7J5Km7x8GRiW/5F9OxWZX2U0CRj5xXX
	V/NBNa4mR5+qC5yrWmDPJH8AbwCSstnQyduKeooPDTBDB/ujc3PaWcIzWcbcIkkaiSXBcZvQt1k
	0IUPbP9TlGrcxIr9oYP0hreHJbu8uq30pmEFVbY33oIHNzScZPUeol+/LmPbFNiXaabC5
X-Gm-Gg: Acq92OEg0OvzLFMvPuurkNiQBQXpPinTfjKX71+yRnm0O5iPWCg0gspudvAbb182d/J
	PJU8HiDkIFHmcR9AyPBwZeu1omzkTa/LNkkKaVHWRLJZt2kUDFSG1po/n2KcljWcUOmqPqGj4q4
	Rq5yWdW1btC5Ntb/udpkBL55Y+VQYwqG2m7+ObWOUaws46ZpzrSuXC7fl/wdaDQcxJ9ilHt1Xv7
	9UKM/nDIKSG44v5ntldyt9pjc+5p1HllJtq3R0272dGMWxb2UvU3hDfX5iUqpEOl5L1Y+GzshFb
	VNgifT19CqSCsAiOTDbj4FaoJZNChu4XlYA3U0dy/ObHFzl0YfMpfBAuxfYJILcGnWQ4yNBdl4A
	Gy7hUO0CmrqLyk18qcuw1ydpwTRfnTFb/6iC+ibLpRTfrp7OsK5TB4plAETAjoaN/2KwVcaYg3w
	T0UGc=
X-Received: by 2002:a05:6122:1d9:b0:575:1954:439d with SMTP id 71dfb90a1353d-575e719b22bmr254866e0c.3.1778663980221;
        Wed, 13 May 2026 02:19:40 -0700 (PDT)
X-Received: by 2002:a05:6122:1d9:b0:575:1954:439d with SMTP id 71dfb90a1353d-575e719b22bmr254860e0c.3.1778663979826;
        Wed, 13 May 2026 02:19:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd09513b8cesm420785266b.38.2026.05.13.02.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 02:19:39 -0700 (PDT)
Message-ID: <7854c9d0-2b99-4f67-8a7b-cb0ebd2f270a@oss.qualcomm.com>
Date: Wed, 13 May 2026 11:19:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: eliza: Describe the ADSP and USB
 related nodes
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260512-eliza-adsp-usb-v3-0-6420282841c2@oss.qualcomm.com>
 <20260512-eliza-adsp-usb-v3-1-6420282841c2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260512-eliza-adsp-usb-v3-1-6420282841c2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TeZmlnAyq9FtdpRKBgroftAxuWT-HKHS
X-Authority-Analysis: v=2.4 cv=R5kz39RX c=1 sm=1 tr=0 ts=6a04422c cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=68niEd13HyaExDxXyQUA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA5NiBTYWx0ZWRfXzzrEpm3Q3RxU
 iGUQbQb+plEQkI9g4fIp2OP5mJMxkJZ3or4Ejqk0ErGIFXKxmRjyvmGzChJykRcEvqU3AC4XwMB
 LHrDQovGml29CLP3lHnQN0gIuF4aqcQBFORwZMuF2HB7ekUAdBYa2RBDkutz9YTKBrZW5Mx98a0
 OCCsCbYGGZh/tHSZE1afYrg9pI+tIGCJsoCauwf+kGCQ8ap/DQovRMozTPjIqKtARIy9VVSmEIe
 rxuMNXeLYW4tWbYWPRwo7m3tybV3VvT3nkl14GKsEXeip5NnYU3N2S0NU9ohMzUJ2bMcsKedFZX
 DBiIcqonHLqAvnIs05HjlXsnpvKrZNr8fifOuJRSIzdcl0Ga+Y4hj9EIl04bgxgLXCfo1YDQcV0
 OQkAQK2/TYcwUUBqIfJUPJY/kLtFCp75Y3YPLs9hILX7iQ/Oxh6T6Fuyy3hwCxuLErZeqBCtrKP
 BkwUYtP52wbcK3pOrfg==
X-Proofpoint-GUID: TeZmlnAyq9FtdpRKBgroftAxuWT-HKHS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130096
X-Rspamd-Queue-Id: 6F48A530CEF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107245-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Action: no action

On 5/12/26 2:26 PM, Abel Vesa wrote:
> Describe the ADSP remoteproc node along with its dependencies, including
> the IPCC mailbox, AOSS QMP and SMP2P links used for communication.
> 
> The Eliza SoC features a USB 3.1 Gen 2 controller connected to a QMP
> combo PHY and an SNPS eUSB2 PHY. Describe them.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

