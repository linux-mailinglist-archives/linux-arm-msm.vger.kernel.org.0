Return-Path: <linux-arm-msm+bounces-89985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AN5MAievcGmKZAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 11:49:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BC3557E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 11:49:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1BF1266257E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 10:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1BB347AF64;
	Wed, 21 Jan 2026 10:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jrn3Q2Wk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B2LPEcId"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99712477987
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 10:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768991078; cv=none; b=V7lLXIIHbUIlykJw2IkgjuQ+SqEi1TOEtz9onrxi6EyK3q/AwWtmBCz7FHSzq78Q46KBNlCfCpYFDY+YWKLeq7uamNCa2bn87A08pzVSxCNzEa9wKtHo2MSLTv8pRjry+cwvn2ai0Y++O7RVP1vpRbQTBSzVX9LK2WiA8VhIKVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768991078; c=relaxed/simple;
	bh=GtkDq0AVAXsafKfJ8Qu/lM5yzQrBn+9BgtOwEwwV3y0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=biu5KigVrhezveehgzdY4fOWXt5aQRRnNhk1OGflfAvQpOvnTKAVnATnhFWwpHxCsLgFM4Aeq9zNK6QbOiX0G/GnYG58RtAPcvcdwMCZ1gGujRMvP04kEW+mAWSIvU63zVzRQQXX5CEg/kIPyUNvGlQLkmTeKbdYNKACCpsVmvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jrn3Q2Wk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B2LPEcId; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LAM8543229360
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 10:24:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KFE4ttxShgGWSHqSr/ahnkh2ANNwECm3HxYcEo/sAgE=; b=jrn3Q2Wk9QINJM/5
	r2IHoGuyk3M2knm6vUdH0pHJ/JU8q30GUPXyIFzpAyxfbJ5BCS06TGHE9n/GgIkc
	FXZSWT7AMHa2YF/qcOk4PtWgtMkyxv9uGz8hXwS+Lrbt01Yzh5Tals4AXfDuLTo4
	BZmFa6fWPzwimxvoq6jBPDSq/Z1MkU7hQu9xC7c/OE5e16tHBcnKqnxCXeDomxpf
	ua7v6TldWpChjjC2X+b3glysYzHJOFGO7QyYzKjFGXAGCFcWJiA4+jI7VbVClZho
	yweM4qubpbgd7JIhtkwSOYAgc0Hw5qcYXkRSzZfuQPKiFkYdLARBRj6DoBRsWslg
	glsgLA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btqvp9ax0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 10:24:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a090819ed1so42432145ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 02:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768991072; x=1769595872; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KFE4ttxShgGWSHqSr/ahnkh2ANNwECm3HxYcEo/sAgE=;
        b=B2LPEcIdC8Mxtg6PjDFXa2JOGRRWQbk5IS3PFgW9MfPzraDLUouL7HAtC5IzLTBHg/
         QK/lJRtFzhJ2cEBGdNKDOVPPGbH5x+bllitnBO/ZbTvr8p6lFML9uP4EN3DjxQo3/wUd
         SEjQse7lbGQxuibx3Gs+HKwXAPjiIXy1EqfuYHDSAliuuRgi0FcLg29rSOL+pwZbAUEB
         bQBNNw3tuKvyOa7GaBoQiLA61HVUER1KoAdwBfd2mKvtAM5RQ1oc64kFOSWcqPlp898/
         r5o9ySHuLs19+ePyyzzyd21d9+bsPQYkEQzwmV00xJ7empjRsePEeAG9ulaQ6qCXF0lA
         tBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768991072; x=1769595872;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KFE4ttxShgGWSHqSr/ahnkh2ANNwECm3HxYcEo/sAgE=;
        b=vmGZKEcYXsiZEIsDlt40ZvSs8RhvfINdtWFH+Qi5A+eDdWE3c5zvTYhEpq5vy29Y1H
         92tJnYt6ctWf4NL2U6UZK4+xHN8nQ7FlqqhSRDpcjr8Fo/AIN6B5Vj7Td9+M2k9I3tUp
         FYP2Tk2RTO5hYT7MvGFFunVz3FQcgPmzq0Dp71mipJZ7W3TfYUlJW/LSLoh1Bsd/K09o
         cP8JQQ2LszFDQ4XHcOp5vcqY2Zfrg8WIxZhMU7eFwupgfEPi2nYpjXgHKdJhzNr5Ibrd
         xRJ7BSnywfXBczdA+6VMuKAzpX6dl795aNTl8yDuz+PubCPMxx2oWneNfgP+NawzM8cb
         tAmw==
X-Gm-Message-State: AOJu0Yx5jnoKQ6Mv40s01p2uoG6kTjQZzJwEMS8qdY/g8bwh/V8JQiM8
	IEG9+M+sYzKpOpuFxGTPIYqsBvmROUz4L83s4+CMDChpjuTYR+Myip11t7wV7pVbED/LTKPpPmP
	kYkIARhrLFDOgHD5KCAT40d6BDHlnvxpn4Ent2iu/gXqo3540WTnMsVla5gz+JcvqARya
X-Gm-Gg: AZuq6aIQrCG7R23JXM5XmEGas+a0HqSfAnvxkl4nQHz9Sv7LmTzwz0SBp22ftqB49kK
	3bNOE1Jf2JOgXaCApKJ8usAxFpMoKsrBd5elP3EUBNPYEOG6TmJ3cGVTTrfrBZ/ouzQW5rQe47d
	+tJUIbqRsTCkfpv60qq/YLni0cNaFGNCyQydziWSJLW+0Lhf4My2u9bFU3w4RxgeIEC7OexLmij
	pDMF3L8+s9JtWbsnsCcZ+OnZaBJawcZxLXhXPsFYvTVMuHLxVg+4xFeXK6cXjBXgc5qfkYIKZ16
	4javBp4ESrON00+eP2FInicETeSCEtQaFp1feabqye4kzXWkcfqbHvA6/kUadhrepSN+pu8ai9N
	UKkYC3oPSmERe29hUZsy6ulICDwsW7XzDVQbKSAk=
X-Received: by 2002:a17:903:22c3:b0:2a3:bf5f:926b with SMTP id d9443c01a7336-2a76b1624e3mr46412505ad.47.1768991071811;
        Wed, 21 Jan 2026 02:24:31 -0800 (PST)
X-Received: by 2002:a17:903:22c3:b0:2a3:bf5f:926b with SMTP id d9443c01a7336-2a76b1624e3mr46412295ad.47.1768991071308;
        Wed, 21 Jan 2026 02:24:31 -0800 (PST)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fb2bbsm149645795ad.74.2026.01.21.02.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 02:24:30 -0800 (PST)
Message-ID: <45e5526b-d565-4420-965b-1c6a687cbbe0@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 15:54:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v2] dt-bindings: mfd: qcom,spmi-pmic: Document
 PMICs present on Kaanapali
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com, jingyi.wang@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
References: <20251215-knp-pmic-mfd-v2-1-1e91138c6fc6@oss.qualcomm.com>
 <176789374037.1117798.14242637055422802029.b4-ty@kernel.org>
 <b393f218-df47-4119-88df-9b3ce23180ae@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <b393f218-df47-4119-88df-9b3ce23180ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bxK9yifVo5t5INQxR-rr6ZPxp7LRL-Ja
X-Proofpoint-ORIG-GUID: bxK9yifVo5t5INQxR-rr6ZPxp7LRL-Ja
X-Authority-Analysis: v=2.4 cv=cdPfb3DM c=1 sm=1 tr=0 ts=6970a960 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ikTDaN9Z9rpKwyn_FasA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA4NiBTYWx0ZWRfXyNpEmhtG+niX
 cystrDkqtOW7DWdCy+3aCGDtxsLa3yKG7YdmnS2gX6FRgu1Bm76IrNhzUIeJqBSIXhS4jRxAtKL
 WSkmln6vnVubyW9RjBQVptsecmQLt6cUhWIygyWWRZzGPKx511gMFggdyAC3P9oZngbH0bh8+u9
 yRX8dCo0tdp7yy8koM6vM3/LiHwB9kvZRXAudMHma3B0LCdmvnK4ZtCi/9Vr7ewneZijNd22JXN
 eZBFYol3H6qxPwTHGV8IMxslOvBcFDLIV1Nm1rOfZBi3tN9N0IduO4g+ZjLOvfgECtpm2UhHX3O
 1KCETeCs6x5Tg2NCPQJimdYW4qsJPUkoLTvgpZmPmvMhONs8E6Appie944Refr/wGRo7tlw9Ck1
 MaNKZzELEDm4+NmU5wsVYyscoCcP/q1MQ221EuhhKRThfU5MajsM9cwmZHfqZ0t4MzDreSIhJbC
 5IaB604wFUt1ICopR3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210086
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-89985-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A8BC3557E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/21/2026 11:36 AM, Jishnu Prakash wrote:
> Hi Lee,
> 
> On 1/8/2026 11:05 PM, Lee Jones wrote:
>> On Mon, 15 Dec 2025 16:39:35 +0530, Jishnu Prakash wrote:
>>> Document compatibles for the pmh0101, pmh0104, pmh0110 and pmk8850
>>> SPMI PMICs.
>>>
>>>
>>
>> Applied, thanks!
>>
>> [1/1] dt-bindings: mfd: qcom,spmi-pmic: Document PMICs present on Kaanapali
>>       commit: 2a84a41a8c2d3cbc2460d2bc60569a35c4157e76
>>
> 
> I had pushed a V3 version of this patch earlier and Krzysztof
> had acked it the day before you applied this V2 version:
> 
> https://lore.kernel.org/all/7c56b471-5fab-4cad-bf48-4da261d5bd9f@kernel.org/
> 
> Is it possible for you to drop the V2 patch and pick the V3 patch instead,
> or do you prefer me to send the delta between the versions as a separate
> patch ?
> 

If you prefer picking the delta patch on top of V2, I have pushed it here:
https://lore.kernel.org/all/20260121-glymur-pmic-mfd-v1-1-2aab4f21e79c@oss.qualcomm.com/.

> Thanks,
> Jishnu
> 
>> --
>> Lee Jones [李琼斯]
>>
> 


