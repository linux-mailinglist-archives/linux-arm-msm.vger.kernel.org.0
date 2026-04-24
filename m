Return-Path: <linux-arm-msm+bounces-104381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFaCBrYD62lsHQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 07:46:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B4C45A052
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 07:46:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 325E3300DDC6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 05:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FDA3223DE7;
	Fri, 24 Apr 2026 05:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rm4qOSEb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fBW5PAwq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D01E33985
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 05:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777009587; cv=none; b=Gwlco3EPV8klCDTzBaUM3m5uF8aDzRekh8HB4HyVymAbRdCT8DzTlWRCDsF4nna0Alji1+0+M5svN4UKzQlZeZNDMuhjfJyAlMJASpXRP9SQMz6ZXcyh/JAIWKIwI1Poh8RoekktCs80KAftRAt/xYjBwoXZWuOKRWfenRGbO/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777009587; c=relaxed/simple;
	bh=6h0E1rgdxczYU0CT5P2lJCAiRg/cHchvRh282wnoUjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j4aDhaERxmr8AvSS79kpchkY0dYyRRkAYW4irhDGo/GLvKeShXMweOE4Jd/oo3pE+jX8Iym2Pcdi0CLNMbQG4rTrmuIjw44YEkxPo6bWHX9I8dJTCp9AETOR+Up3hoGaFAPyn/3gKUu3nYH/m0FIhEOHkRaJfFb2gF5xmSm25SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rm4qOSEb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fBW5PAwq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O1VVoV4012142
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 05:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9gUsVSvv3gW8kZzUU59zczVlqNb8Y6Af8gyP4aWpdqk=; b=Rm4qOSEb4Y/2PlLc
	nX65NWUC8pwzCNLangZYdFEZhYrsAhtUkHraBeFDRZRJzRDQhpdjqSu4XG7n6wRE
	/MlkC4wTEPIgUEHFU2RQQ2ds2OXlfY6NAH9HXwnxLEfgamkAOrbZXfmfC8x9wS+Y
	jAM05X1WUdt6da8y+64jVVLVTtxZ4RqdFeyenD6mI3i7wc/spvmzzRbpt5m2KOau
	za+i/qdT0/HkIz18qcxb8p2iUxKoj0iO40TP1gq9sIY2Ed0gw3QxHPN4bgDUfXxY
	II4ZGIUlc6CYKtmg4PWjJT4vLrstCFpKH5il4MWYIm9d6Z9Jk1/ZQvwFwlBQ2UIw
	eDfznw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqpq9tpyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 05:46:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f0e12d375so4444831b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 22:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777009584; x=1777614384; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9gUsVSvv3gW8kZzUU59zczVlqNb8Y6Af8gyP4aWpdqk=;
        b=fBW5PAwqZMEazfN8lZgWOERhzJRjG7GmMJtCLW+KV9MPJrcRnBvKW8o/bZWES00cBj
         mCff0qY5jP/dAOHNJv5z2/r1xMOd0X2JzqnIKLPK1yUoo3frMMzIX09EA/k2uLzcJeZd
         iB5z5c0mr756tlmqwRLgpxjrQMBuohQDCxRCZ4Hbp9+k8zzLJJrEf2MEiHUzcZM+cpd2
         MkndTcbGpAJCPHDFe7GUg63Tnxj70dZaLVOoeRoo8W4/NmF0c+fdRQ8g9kNmpKhpUqlh
         LvUxIY3cK1kJ+FvONOBoFX2PaA6MdCQKXQp0ERhlq4L8/aZfAsO4py0qQYnmsK7Avjq5
         PCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777009584; x=1777614384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9gUsVSvv3gW8kZzUU59zczVlqNb8Y6Af8gyP4aWpdqk=;
        b=a6H7KqrwXPUBukIwOEHFVQcciQ0pgcb2znG/SujR+6xCiXU2nlCwFq3Byw/YcmEL3K
         m1/AEqBke75aJAFJKFuQ6L0i4E98R7mPe1CQY1/5BLMn1PCtp9/fjf+rx67hD7NxyrGw
         NUXDdj1WUUPdiSUwJoOpa/btlyiNRbJVeORH2X3Chhx7uQDgUfBH+mTEabtRRj3LyQAY
         Hx62iLirRvmIQKQ2r9A6e9xTnUQp5ks/6sePXhWUZSq2AKvlb6nDheOzE3kdhJF2ROI1
         Znol59b910c/5nglcZC1OxMYGVyHt5S8Pnvmm7VcLYljgVnOiM8iixBO1ycYq6JqQSKA
         WQUw==
X-Gm-Message-State: AOJu0YzA2s1irW+mJEuvQxAwIBosnJ/u26wHkuLIT0IH4d5AURZy04G/
	CO5lKify7uwUf6UvK2HlO8oNekRvCjR3Q0xN1J9aPSntlUTZnpWuxPdCRII3QvpiUUvQmnRWJr8
	29W+bP7z4gYQQJJbQh7kWAHJPUthOfm/C03d5+CgZ9Wl2gKM4RYGOHJeKEVOcNOlG9nbm
X-Gm-Gg: AeBDiest3TtL5NOmyXDBA6G9PeBAZN1QHMFoCUzwiFf8uMQyUb0KwABtsqm07YulPIk
	wUDagYmur8O03BI9xHJzukU2QBbhmsXdtj4XZM3q5Hsl7KdRTVvGo/RMJgT3ol+mok+Gun/KEtQ
	3hc/qtheOzRjp5wkLpHkgfLtNJxfcSGnuFnzJENOg1O3b4mIcoHhx579+99HL+q3e8QlfteBHg7
	xtLRD0hYhSw81AvPAif6+ucYC8foe3V8v0SuuBKyGBuQpZ0pn/eh7wEgtBBwk8ZmpK7m7MtJ+lh
	BMe3IXHh+FEZtpEv7q7w5PqRbNSumOCB5VsZO/gdtfg2Qh2fehrOI2RLFv03QaZR6FFVi/D2nF6
	rvHEU4cB5ZhhHo9yRvq6V2ejfsS8G5mOi2NFU+MZKXBPLCmuSL2DAlNca
X-Received: by 2002:a05:6a00:1da1:b0:82f:2319:7d4a with SMTP id d2e1a72fcca58-82f8c91a5d1mr28410112b3a.31.1777009583696;
        Thu, 23 Apr 2026 22:46:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:1da1:b0:82f:2319:7d4a with SMTP id d2e1a72fcca58-82f8c91a5d1mr28410089b3a.31.1777009583197;
        Thu, 23 Apr 2026 22:46:23 -0700 (PDT)
Received: from [10.218.15.94] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9819e5sm23122727b3a.2.2026.04.23.22.46.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 22:46:22 -0700 (PDT)
Message-ID: <dee9cc4c-2495-4214-867b-98344c847441@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 11:16:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs6490-rb3gen2: Add WCD headset
 playback and record for qcs6490-rb3gen2 industrial mezzanine
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260423071951.3181130-1-karthik.s@oss.qualcomm.com>
 <eab2d0b8-a949-47d8-b953-fe34bd2fd869@kernel.org>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <eab2d0b8-a949-47d8-b953-fe34bd2fd869@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA1MCBTYWx0ZWRfXyNoiuhWGuEMm
 K4V8xQjhI+iZVRWDzX20LPTnJ4hjeYF3waD8SxQ35XVRN8NG8scRlOYq3BZBSqJe6XL6Z5+nSsi
 NL5Z808aLwYnkQtNZLaETx/JhPuQhAxldyb7qiTcELNvoVwIKWrDjdvl3bs+YAz3iwD9fhwae6D
 EYJotTinTp1VzQaQUSQIfCHqSujoHPFcKbPUjwEOQl4wIBhHn/hAHR4jfLWQOtjhY9ySFACpip/
 QNYAIcVXVruwxLwJLL0nc1FZHMhhIwv+hJjUHvmUNXEI7QbUTkqDySwhxdNWHZ934eGWsQinvkS
 T3VbRDC5j60MPSL1bSIdDwX8KOkG4GcoCdZQJcqxVVgr4A+3p+i91cWUolhA9CjlMKr8eKGsBfr
 RWT5G/Ws2Wx79StHVGJEUzBat8hr69mA3X1MM4sxPrLILmgOUtGPjVxSmRa/v1ce9/Tybk5Mqt+
 3ItbfLIeHzuRBMcKXyg==
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=69eb03b0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=AUdvcLI8t8Vz5Mycy7wA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: SgtTr0ZM50mPRbK6-M5rN6ynqgHrfCuC
X-Proofpoint-ORIG-GUID: SgtTr0ZM50mPRbK6-M5rN6ynqgHrfCuC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240050
X-Rspamd-Queue-Id: 73B4C45A052
X-Rspamd-Action: no action
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104381-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[karthik.s@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/23/2026 12:50 PM, Krzysztof Kozlowski wrote:
> On 23/04/2026 09:19, Karthik S wrote:
>> Add WCD playback and capture DAI link to sound node. Add WCD
>> codec node and corresponding soundwire nodes to perform
>> headset playback and record.
>>
>> Changes since v1:
>> 	- "audio-codec" node moved before "regulator".
>> 	- renaming node from "audio-codec-0" to "audio-codec".
>> 	- dt-nodes sorted alphabetically.
>> 	- patchwise run on the patch and indentation errors fixed.
> This goes to changelog, so under ---. Take a look at other patches how
> they do it.

okay thanks for letting me know, will change as you suggested.

Thanks and regards,
Karthik S

