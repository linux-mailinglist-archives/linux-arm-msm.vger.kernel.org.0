Return-Path: <linux-arm-msm+bounces-90626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAO2Iw0OeGmzngEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 01:59:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 130998E98E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 01:59:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3DE383021999
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 00:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F0F2147E5;
	Tue, 27 Jan 2026 00:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ADz6hDkV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jisf8Jvb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB931A9FAF
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 00:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769475586; cv=none; b=hEu1Z0NMueCYoQ4r7AiyM9tOJPXoTJZY6kYtsvAbdnF2j/MqBZfu95/YHDP4P4GeATKzGwv8nUfNi1uZkHFehLb3hBI3LAmeNbXk3DXHRVNdPuFmraKy5vX5LGcJBZNrzFl6tog1wCcYMygBOqwXyDMlw2eqqqkcnM9eaTjpcls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769475586; c=relaxed/simple;
	bh=HPh1ghOGwS0n+2cjOSOdNUbjA52oG8cdoHCR3UDrxA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sRXuQuMfKOr6+G6IGeE/1R8fSr+JTAbbYPG0FKASs0euUBbqF0tyWjhwg81IFmKvMYOBg8vvBwWRyCBw7h4js19C8Oh0xZS2TgQTrYCMH2k5u8R14wacEDg3KeAndG1XMoejzk8FKJi1kqbBVt8ZpEAlrrI26dhTqPFG+57AKp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ADz6hDkV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jisf8Jvb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QKh1T93351461
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 00:59:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YR8JboXN9/6hwv7wNQ3EDN2O2tmeKpBTJemRHuPwNT4=; b=ADz6hDkVntfYmT18
	KiwcrJsszqZLU6xGG51/vwCq6SU8k81SJqrK2VPtYZtDaAihPVz3PtKZZHkOH+Zo
	mBsi7acnwjOOO/09LmhiOJhpbDTHIhiNhR9ZP4WSk5VnwV0ITmpKYkATrMoeYVyN
	1YUFC+c97P05zU1lnBNCa47wiJkQ0yq2mqqsOe+lu7JhKoI4/yTOrqHcuVy5bdhu
	UA3sDQWCjiSR3M/R6wiZFr4CaU6qPpdse7xPtf6EhaJSmKTgb9QQxmSEDFd0RXeL
	QWXAt8Iens2JpWSOkW4sfvWRTTy12wDZSyLPRYXHercdcwCISqtYMHR0ydO6HYwN
	DRxlMQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxcb0h7k2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 00:59:42 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-81fdfafe6e9so1790508b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 16:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769475581; x=1770080381; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YR8JboXN9/6hwv7wNQ3EDN2O2tmeKpBTJemRHuPwNT4=;
        b=jisf8JvbJo3UwKb3Hw+mp5PGQEYeR30AXqSSeMdbwuD3VL1r3M3w40RWTbbCWIeWM2
         0TVAL7LZXrkL7TQl6AEtknEBhQdWKsdZfCddlwu3bzvGQxAdKi2AxmWr3NVQK7Ij5nx5
         5yNEaoJTvzUMyZWFbSMv5RN6ia3MdsiPuL1d8KyUtd3rsHaXsf5b1uX9cZsFBc8sc2GJ
         fUpHxHxIu5cpb9tW+gToL2FH6qcq/hqKzEfH8R5/csQ9bZk86/S2SviisMslP/67qsZX
         5mfQG1wBySIAJWpENKEWJ1fxTFk/Emz4RYmk/MSVcdxNLYO3EXqtlKEQmDM5ILPXGhab
         2iJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769475581; x=1770080381;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YR8JboXN9/6hwv7wNQ3EDN2O2tmeKpBTJemRHuPwNT4=;
        b=HWFkLwjZ5bv6vdZUMGsITaO6qe2bUtVJ6X8ipY5BDtAd2ohcM5aupNwIplGxvtYukW
         UTvefLjvfaApiZAX2ueN9GahbmIRz2w6+P3kLq9v25FUvR2cBLWWxLwYTuKBB6kKl84B
         jnaHy1o0Vb1btpHYxFKdVjq5DxnR8qKkhe3GPh1gJJJ7Sd5zMLB8nrkSYyQFkMhnY3AA
         yxzylf0E3MvWGMGYZ+hB4LF+D1Yskf/0GJ2JVWwgyNRisnorEnc2alCxOPWxPtBmirbS
         RAYru7c1S22/CWLH99LdUNwJUxY05EOqkAuTVDCQFzG9lVP4Em7VHmvDak0z5AomBApG
         +J3A==
X-Forwarded-Encrypted: i=1; AJvYcCUTj5LNbnjZW3RMKkUe65/pri42SkvEi8Asa/+xBIZfgicbcIchkhqIjrx1avcONSnkA9Wej/ljZFCXOCoM@vger.kernel.org
X-Gm-Message-State: AOJu0YwFZmyjMgaES9/i8v83DPd0OrXGOrWiJt2EiFsZJxFz9W1AxA4T
	Q8y4waBHY96QgxELq5Rm/pf/7iitB4FWLuagZe36+2fh1o768B/AD0olH1EwTTA2SyR4yx8hQDT
	kapBGCjEifL4F9W1V5ub+qtXZt1DE0Xz6bGgYKTghrL4dWWnAaUM1ycUlHphQ3Wh4rtgJ
X-Gm-Gg: AZuq6aIwioiK2ywpLihf+9VztGHyvwm4iieDR8WI3eJKmKLIlUiTxvl7RNi/sLjJB49
	MGXaK8qIM2kX0GY4ZvyscSN2hpPvvi/wVwdD6RP5p8siB/wjpnreTHXpg9JsmBdHyxC9RAiL5Yx
	xJooNwKkbOyRqAmHpoVQxsS9AP/InEuPvMxS1+gKGlL+YtnWOb+EJl7e8/ItYHzeKulAHr2lhr+
	6nXbHnX3BiQ1mNW9I5QdkjONn8cjWm+AJhISxOy3HczOIPh/0weD0GBs+t75CcRv5EkuXPkwMAL
	z4SImxj2PzhDbiDcZXlSTqanE0eV2drNFzqnTTFeBIOpHlIfNTesIwD+vA9lXqppOqHpwBKROlu
	uAFKQ66FbIMrSu56V047D8XZu9e62ckW7iGrZx3z9akpbRfYBlgtaRWj0bwlCW23hG6UPCxXnaW
	E=
X-Received: by 2002:a05:6a00:1495:b0:822:abcd:db0f with SMTP id d2e1a72fcca58-823692c3b99mr99310b3a.52.1769475581299;
        Mon, 26 Jan 2026 16:59:41 -0800 (PST)
X-Received: by 2002:a05:6a00:1495:b0:822:abcd:db0f with SMTP id d2e1a72fcca58-823692c3b99mr99287b3a.52.1769475580837;
        Mon, 26 Jan 2026 16:59:40 -0800 (PST)
Received: from [10.133.33.228] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82318644bcasm10356570b3a.2.2026.01.26.16.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 16:59:40 -0800 (PST)
Message-ID: <49e38ec0-3ad8-4808-9488-46d444a52211@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 08:59:33 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com>
 <20260122-enable-byte-cntr-for-ctcu-v10-5-22978e3c169f@oss.qualcomm.com>
 <cd175b3d-d8d1-4efd-9698-80a6c238d819@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <cd175b3d-d8d1-4efd-9698-80a6c238d819@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PC6fbSuz88-iDX2kwhEoAqtlUbsv7AtN
X-Proofpoint-GUID: PC6fbSuz88-iDX2kwhEoAqtlUbsv7AtN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDAwNiBTYWx0ZWRfXzdLViuqFGejn
 ExR5VLgEeMlId1HisJT9kJVsoxmrqT8S42Bld52+gplbqP1jAR+sFs4Gmlov2PBJkHLsXV7S1La
 IzLJuGNl5iRodWBsU+3JjnfKAbw9p6wgyImq/SNdSTxYnk3BFbpBpMvtg4Ssh5qIe71UAcHqjAF
 Lj2FgnNbZl5kQbW9yaRUSyM+f2Wdh0YBUWnD4uCvnradRazQpWaztYtY3RCqZDrmGPMMnAyNAPT
 e8a0O5i9eyDE4ftWfqlqAk6IJ9VMM8DlgXT2vUsfVdocHzLVAf2cipdXmT/Xd4X/RBiemttwycE
 tZGEW/cQE0/dAxK+KUt1WQUdGpwKmuHn9MFCPFb/0cAn4Vh2TyT7IK/qfib2+bGtV0eo17T8OoW
 zN2f3Gy7JyX+OoGcmpS6iAZtb/Xm1/BjTGRq+5s0BE+LOhNFi0Gth8YnbMH5eTT+1iqrUrUGZCm
 WgJG+fNrXCccGv93p+Q==
X-Authority-Analysis: v=2.4 cv=IdyKmGqa c=1 sm=1 tr=0 ts=69780dfe cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=SkUS4XPTP4F0jhogtscA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270006
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90626-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,0.15.70.40:email,linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 130998E98E
X-Rspamd-Action: no action



On 1/27/2026 1:22 AM, Suzuki K Poulose wrote:
> On 22/01/2026 02:08, Jie Gan wrote:
>> Add an interrupt property to CTCU device. The interrupt will be triggered
>> when the data size in the ETR buffer exceeds the threshold of the
>> BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
>> of CTCU device will enable the interrupt.
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Reviewed-by: Mike Leach <mike.leach@linaro.org>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 10 
>> ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight- 
>> ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight- 
>> ctcu.yaml
>> index c969c16c21ef..ac27a8b89085 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>> @@ -39,6 +39,11 @@ properties:
>>       items:
>>         - const: apb
>> +  interrupts:
>> +    items:
>> +      - description: Interrupt for the ETR device connected to in-port0.
>> +      - description: Interrupt for the ETR device connected to in-port1.
> 
> Is this all the hardware supports ? i.e., can it only have two ports 
> ever ? If not, why restrict it to two ?
> 

The maximum number of the TMC ETR devices of the existed QCOM platforms 
is 2. Per Krzysztof's suggestion in the earlier version, I limited the 
port number to [0..1], so as well as the interrupts.

Thanks,
Jie


> Suzuki
> 
> 
>> +
>>     label:
>>       description:
>>         Description of a coresight device.
>> @@ -60,6 +65,8 @@ additionalProperties: false
>>   examples:
>>     - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>>       ctcu@1001000 {
>>           compatible = "qcom,sa8775p-ctcu";
>>           reg = <0x1001000 0x1000>;
>> @@ -67,6 +74,9 @@ examples:
>>           clocks = <&aoss_qmp>;
>>           clock-names = "apb";
>> +        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
>> +
>>           in-ports {
>>               #address-cells = <1>;
>>               #size-cells = <0>;
>>
> 


