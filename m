Return-Path: <linux-arm-msm+bounces-117324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RtRLMRoCTWqstQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 15:41:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2C771C0AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 15:41:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NWuVIwir;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ap3G1o2z;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117324-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117324-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5EBF930782B3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 13:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6BD41B36E;
	Tue,  7 Jul 2026 13:28:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0332E419316
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 13:28:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430907; cv=none; b=Yv6ODLKtOgVZgOer87cvkqXnMdrvscExqiRyDeoq4a3JPAlGgFoPESdDjWFhhNf/Dkbgb6wIJB1ShK7s89d/jlRPKeCH7xdSKFBk8Q+TkAG1fmfbdODDCPa3ogSsGHFaMFGbN9TKy8vb3tQzEdd5U6F0jiTx72/klGkKhvRpcoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430907; c=relaxed/simple;
	bh=nuLeoUEvOpXq9AkGBJOxyT85nniQu7opj6lTMbg2iLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cscy32iLVzSPkGmUN1GXfHqDVuJxFq8v3siMyysLafnEJVnNygV55RTECx0fpPoYcXxXf1n2ZPMLhIRLxaHvM+KP5td1hfh5Ghda8RknFNSphnQ9xh1qbFen6gClR0CuZksfHFNhLArJXtGtNM+TFzs7TQHIZNGG9mfMolspTgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NWuVIwir; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ap3G1o2z; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8tWJ3768603
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 13:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3+BWYw27ihfmCLaAceDPp5weMHgOmeY7qTCbRdEdx+o=; b=NWuVIwirqTZmHAMA
	2nzlt/+8dYkyruTu4xT2JDM9ZJYh2QtSz837mrOje0yYqeSby9B3Vx83PpTA2fYO
	V82Dk/A111COS09W1pr9G/vUnn/CClXsvcF90V8ik3MESbxd4Wa1te7vLKPv2F5f
	SozhbPVZIwvz4h8FdSQ/GAtZqdqjggXo5TUuAMBHkUiZ+oVJ2ZERG8R3kCnTC2Il
	Ky3F9N2MEMQ9/qrzTRmPPvf3h1TsjJbQJ0xY3/Zk7gnU2kd7hl3oBFbTlvo1rirN
	eM3grW0Glae5H4Xm/mKhTkgUdd2OG/+Shtgt7FdW/RPscPJ8zn9J4xr+kIPcZ/Ft
	LB6mtA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8qj7amud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 13:28:24 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c89956023dbso5771622a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 06:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783430904; x=1784035704; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3+BWYw27ihfmCLaAceDPp5weMHgOmeY7qTCbRdEdx+o=;
        b=ap3G1o2ziE0vTEBZes9PNqXrCMvicB38n3Oz8r6kOfI4IDVW4vfvPAHNmKx6+mSCKV
         PHrGvRIqGSX6oIOGyuL9no67B7GkQxc1PPfErbklx29ON8S7abWWTYphVHpDNbcjaUNr
         HFBPxgRJ9A825Y7BnRtPaaUIdDXTWWW+j9XHxRrwezSaC0imsAqM4KqmfF6X5sZAKPto
         PX4Mcdwfni2QCorQLGiygoUm5QC/GuYdkDIYIAZpdyW3iB9HXjdp5ap8YI34ROCMI/1e
         ia9NcQ5odKqkASwQwVAI86rwCCqd3n4K1jiSooiWTf0J34uK0a1NRTTBhTAxwG/aDbLW
         eGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783430904; x=1784035704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+BWYw27ihfmCLaAceDPp5weMHgOmeY7qTCbRdEdx+o=;
        b=XmQaOJ/kCCp6V6kIsbYGSykWea+T3qkRM1d0piEKMTHG1jSYIr/Qite0B7ERCRgvLz
         VDv/Ukc7qByMU76YlD63Y7SmGrH+/9nJkvSZPl07o7Di1i8ZGEyVR2hMCBVX8Hf4WaG+
         XW2sTDbsjlF0K/KQSqflLiIQbvZoyCgTYEVjF9qHb/O2rzHvub2BEYf1gqHXIBXs4IR+
         YMHT3P1APxwNqwbP3KCcYMTuKhqUIifTdWKwrV3sKEsp8WxbszzIVhuiXuOyRfSPsZt3
         K8u/bJ3eAA6g98xYoeP65+f6qIQx2+39B7s768uWOGxyhGuZNT5fAgtp7tNKEt1eiROo
         2SXQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpuol9s8gOiNUsVv2BMvwUMQ+wuYolz3ekD4EoiM3AY/jCMMSRqRftnDSUwQufsNmPGoN2g2v+4RmWqjb8j@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6fvh7utUpIHQvfIclv/h7hDW+euZfLI4zuJ/IJvNjIVyVOe2E
	2X0oRQ4qAuINKvN5sRNeyE9A+MPSvnaq+sbnmkBzeXFWcg31qu2/LA4iKwf32SfKC8DW3blXCBH
	UC5iSpewyLSwFYOG9SFAtlLLIMmRtB39k2crOjv/sj7MPmPxFdy/Sit1XZGCFyrOFaI1r
X-Gm-Gg: AfdE7cnX15Kz49pge14PkwGBkejDBOVFc7Cb+ptgVYXhNez+rYV9H6QNawp5C09NiiI
	0riOlVXcywgTz1+vA3MUkN/X4Hi1na4YoMNQaYJqZMY8f37thXii0jLav0M9lgpxUoY0jvwKUez
	eLWhtpchGpJzzdIadvciNZ7eiG8Sakiuq7lLaXKljKvaJNHeyRyTMGLEDUfGsMhdzfhv+v39JOO
	ubneGd9Lf1mAS/rCpQ0fLxXVscvgAuqGkKvjAyYn0R0VWsqWwn8Q22UxjXd7LyTzqZjBpOv/VJ1
	WIhOeyESTO3g8fTdKYdvt60gSVfh4kpe/ocIsxovN8VXrQk3hoW0QGKoIA21BwUx07llZWPu8nm
	BpkbQx+TMkq0fyc5qffZPGlp7Y+ooFLvnvtLUAauidK7p
X-Received: by 2002:a05:6a20:cfa8:b0:3c0:9c1a:8936 with SMTP id adf61e73a8af0-3c09c1a9bebmr3947192637.62.1783430903561;
        Tue, 07 Jul 2026 06:28:23 -0700 (PDT)
X-Received: by 2002:a05:6a20:cfa8:b0:3c0:9c1a:8936 with SMTP id adf61e73a8af0-3c09c1a9bebmr3947139637.62.1783430902989;
        Tue, 07 Jul 2026 06:28:22 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659fa13bsm8137106c88.15.2026.07.07.06.28.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 06:28:22 -0700 (PDT)
Message-ID: <1f258146-4ef4-4442-85e3-84af7ad735b5@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 18:58:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/16] media: iris: update buffer requirements based on
 received info
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue
 <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
 <20260616-iris-ar50lt-v5-11-583b42770b6a@oss.qualcomm.com>
 <6f7622c5-2bfe-49f1-ac05-81e33c8bd66a@oss.qualcomm.com>
 <cxlhuzzvst3joilbhglxogx5hedqx6esbo3j4o3qzkeevqkrt2@47aaykt6z7yc>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <cxlhuzzvst3joilbhglxogx5hedqx6esbo3j4o3qzkeevqkrt2@47aaykt6z7yc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qwygSk7s8XTLVHtEtxVisj48jeNYu1_j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX0VdSeABsfp/K
 RXod6aSRx8cvGFhhjBqbFA/5nJei3ovoYR+mpYGZASSoIaxRiNeGZzTFHnYverBj0Rr3VdzFADi
 /GS2jsSh//j8aQ8+NGYjObsmNtuk0uSOHBDlZzZP59H/XRomHaekHG2yVZNOfHY0/MQx8m0VTAM
 FH6kh7iwAKxj9A177l7Gmmcmh39n3tMfuEyGk6SY7Vreqji8GW2AsLzPiEiv5ZQ16F/1tqxxmej
 tSb+qANmtRCt+U5GQPHMX+G0hLbWYOBnjj5ocqsu6eZ0u073gWGz00yg1Ssytz6ahSxgYBAivku
 oNfpauloJfN1mGML+/dEk6AJjqY3F3l8aLhQkd/fZ2iznEBtHitbkQLjwxY0ejplu9Tu1+bsukB
 PZlzREGwK4Y5YOEWCJWK9d2Y1ZrNWS338nn3R8KGS/2vCiTYpSUuz4ni5v4Ekakf+sqf+HAHkXD
 bilcYHvhnoxuiUA098w==
X-Authority-Analysis: v=2.4 cv=PIM/P/qC c=1 sm=1 tr=0 ts=6a4cfef8 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=--w9Y1qBsydm4NR-mTQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfXx0j5gUW7i+FK
 ahc2XZE6Y+cF7+PxU9TxI/P+jdxr2rKryZPHQ60Qy5swbuBN1F0g93DX/BvjMxO3oTi2yyeGZQR
 7/QrpSr/Vnn9k2VSj3cWc0gdnUFfXSQ=
X-Proofpoint-GUID: qwygSk7s8XTLVHtEtxVisj48jeNYu1_j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117324-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF2C771C0AA


On 7/1/2026 6:55 PM, Dmitry Baryshkov wrote:
> On Wed, Jun 24, 2026 at 01:37:12PM +0530, Vikash Garodia wrote:
>>
>> On 6/16/2026 5:34 AM, Dmitry Baryshkov wrote:
>>> Upon receiving data for HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS the
>>> driver should update buffer sizes and counts from the received data.
>>> Implement corresponding functionality updating buffers data. This will
>>> be used for upcoming support of AR50Lt platforms with Gen1 firmware.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>    .../platform/qcom/iris/iris_hfi_gen1_response.c    | 75 +++++++++++++++++++++-
>>>    1 file changed, 74 insertions(+), 1 deletion(-)
> 
>>> +static void iris_hfi_gen1_session_property_info(struct iris_inst *inst, void *packet)
>>> +{
>>> +	struct hfi_msg_session_property_info_pkt *pkt = packet;
>>> +
>>> +	if (!pkt->num_properties) {
>>> +		dev_err(inst->core->dev, "error, no properties\n");
>>> +		goto out;
>>> +	}
>>> +
>>> +	switch (pkt->property) {
>>> +	case HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS:
>>
>> If i check the venus message parsing logic, it loops through the packet till
>> it hits the case.
> 
> It doesn't, see hfi_session_prop_info()
> 

I see the loop happens a layer before during msg processing in 
iris_hfi_gen1_response_handler(). It calls for 
iris_hfi_gen1_session_property_info() for every packet of session 
property type, i was wrong in assuming that one property packet would 
have multiple property types in it.

Logic is fine.

>> Here, we are assuming the first packet type, in the pkt to
>> be the property "HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS". There can be
>> multiple properties in the packet, and if
>> "HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS" is not the first one, the usecase
>> would break with incorrect buffer sizes.
>>
>>> +		iris_hfi_gen1_session_buffer_requirements(inst, pkt->data,
>>> +							  pkt->shdr.hdr.size - sizeof(*pkt));
>>> +		break;
>>> +	default:
>>> +		dev_warn(inst->core->dev, "unknown property id: %x\n", pkt->property);
>>> +	}
>>> +
>>> +out:
>>> +	complete(&inst->completion);
>>> +}
>>> +
>>>    struct iris_hfi_gen1_response_pkt_info {
>>>    	u32 pkt;
>>>    	u32 pkt_sz;
> 

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>


