Return-Path: <linux-arm-msm+bounces-92767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEDbGBgDj2kmHQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 11:55:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B65135461
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 11:55:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24D27304BCC4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 10:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5920034B661;
	Fri, 13 Feb 2026 10:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A7/NKsr/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I7MyPJi5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A22B2D6E58
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 10:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770980117; cv=none; b=pdqa08blmDFGpQyFHoFAquJKtpo/5tOMgIuSPJzOfU1qOULAnbsjLQRrFE+G7g7KGXYNN4V9Y5Y5TVFu7mu9II7Ciz/7UgmP4FvVOlm7Sgu3395w0i2jBrjRu1ES/eyJzqGUMSjIuaIXeZCOnJ9mFKauu418xx1sOwhista0lIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770980117; c=relaxed/simple;
	bh=sISlQNo22rhzeXky3hysxZuotkwCFL5UOEy78QbT9GA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kXnVuNUtKBiwq6ZVmsPNasu8X+IOYQ5IV6C5adnxyMA0CQ3gNOvfMHxMIrM0oW5xw2zyzwo5nQPKOWaSw2RVIXks8k3IHhLHeaAht8rzPCOh/Qn6tkJear4450FIoWGeLO5V8GYjKlEcg4SavOz+DY5PFXJTe8E2DdqB5L79Jbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A7/NKsr/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I7MyPJi5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D7MVdY2627978
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 10:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zouAPUjQyVlj9GPmB6CLRV7EXXiZWNs++RVmMWYgHOc=; b=A7/NKsr/Zmc8EQUY
	I/alKTHEJLsf5D2+jw1AOZ40DKII3mqwc83s4ozT+BPS2BbIMIIABDQlmHPl40Rp
	jChC7uwk37NXwBeB3lc+qdukdGDOP3QD9NTER9koqquSMRLb3d2EIe1Go5QKY/am
	uq0jme+Xe9d914Skre/j0TyT1D7SdrcMjy9G76iFdJitmSv9rJcB95lALH9Odivh
	cOnqGieSyX268kU+Tv3kOPVWIT4ZdXYA2O6yPe7ZLOQCC3k8/fvcpAphbaiiK9f7
	v1EoWE9/KICn04TvwGZnfGKwDI4O/bEGKvjbmHQmWlsciF7VFq8+/Jcy97AALBmN
	MdFzIg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9ygurr26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 10:55:14 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8954ab64c65so4654926d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 02:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770980114; x=1771584914; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zouAPUjQyVlj9GPmB6CLRV7EXXiZWNs++RVmMWYgHOc=;
        b=I7MyPJi5MunLu4BpjxmWX7x9LgdX6VplX3DIkLdaKyMenb/u14Rhv8N/NTf/VAPk+Z
         5NaIV/hRlGNS///thSMQ2x1ed924+0LVykphh8Uhv382CYKq+yXioi77qYL+pMKzxGcV
         HvOcZ1xgoWjwJET32+uwmmX5TOEPVWO5VBGGiYouNornzvFzdG0VBCBAdLpzLlH0nLL5
         ZoqyX7F90+psTJrcJLMnmQJo9I9o149cqEzOMjGW2kc8+Xu+7jW397jbE9rBiNhM+PSN
         v/h7cblSZuqa8SAuAZ/SxUxAuSxxowmkhO53rhLAiJSuSGbjWCdKLEjkMgJLgq1epEpa
         8CiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770980114; x=1771584914;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zouAPUjQyVlj9GPmB6CLRV7EXXiZWNs++RVmMWYgHOc=;
        b=BuEPCLPX6nN09Z4KgFcgwnE5iYA77fhbFRgjKnyJYdAjXhY4NQwUBJavaMHty/SDc8
         dcLvK5br2uutkFPrj+Ip/WchRFFQ3vDzx+bhpXLBvwULMa5Ti2mZ+64fc7D4q3s8P92g
         EQwlU8/uPvgK86GaF+cWQ0Wzf5pgxwajwyillkE6+UaZH2Gi50m9aQF2IjcVNQnrdxs+
         pbZMcSBT3nXwa33trnpgR00nJsBGCzbfkTpZwzi01n/m56IRQPJ1MNdvFWjw50v8gVJ8
         IILCluArw6P9cZ39ePGwSosX3zAIy5sar5xgQfhxAJs3wLdH2cDdBU99n6DOrd0lSRRh
         NzNA==
X-Forwarded-Encrypted: i=1; AJvYcCXL+gtyx8W6wRaM/spG17deQDxVrJBtge4OGb+RSUnGL7FLsmf6KgWwCRsVwx36AGHXlMSzsv651UA3dpwy@vger.kernel.org
X-Gm-Message-State: AOJu0YxkQ+zZ6EaOAZI8DbkO7Gi3C1jPVdw57+g4L3PsTWnJ4b/AIpvN
	H/XHRCAuikyQRXLhhgfgtroGfzRSdNv2CNnMqB5XsHNLNXygXJmUSUDeh8MUXQS6E0B2aN+stlg
	Np+umzrkQQDgRloFqZtRle7C3cKRfYT82+QJjvLnhv/CGCHSx2NEq0S0GBYRdRGxG7/Bm
X-Gm-Gg: AZuq6aJN1P8egBxFfy0HephO4LV/6YiMVVapSgr/e+PRNPt1E4qJUyc6BHq8SSKV/Z1
	QTMoOwQ+GhpAiP9UJhAVoqZCh4m3Ed/bO9CxwfhYHqhGSCo7RZ6EnLC6oEOa4kBfj+8I/ArWcth
	AsiebfjYD7yCf0xqjFjlRaFZoTu21kLGmIb2yIXxAJOjS+r5pmDi3s70B+NgaUWScYXGRWPX7wj
	ntNqrasvlmRT5XHfrNvWtL3zUbsN5WBNOEksYMkAR1JJFhAr3BMN5Er7lPvK2Y6A9kbZWkAiMB1
	iLby6uiQITJwNGDrXleHNRvD7cSIiCPV/XZl4qzkt7cGflchb2/yxzAbyZCVLsPFhU6rHl0EytF
	piDXZ95mZVTUQD0xDVTMpiYXfGjsjg8M8A0Rz25EfuKZIRe6iir2pUEs2fcqPUBA/wJ58Rv5aYt
	cbEnc=
X-Received: by 2002:a05:620a:258f:b0:8c5:3892:a554 with SMTP id af79cd13be357-8cb408477a0mr171810185a.3.1770980114365;
        Fri, 13 Feb 2026 02:55:14 -0800 (PST)
X-Received: by 2002:a05:620a:258f:b0:8c5:3892:a554 with SMTP id af79cd13be357-8cb408477a0mr171808185a.3.1770980113926;
        Fri, 13 Feb 2026 02:55:13 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6e95004dsm247492166b.5.2026.02.13.02.55.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 02:55:13 -0800 (PST)
Message-ID: <367a41a9-8e80-4bcd-9985-242469024b31@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 11:55:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hwmon: Add Qualcomm PMIC BCL hardware monitor driver
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-2-7b426f0b77a1@oss.qualcomm.com>
 <7911bbae-c507-4420-a05c-89242941f774@oss.qualcomm.com>
 <66e6696d-3fab-4da5-ab89-4067d856f186@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <66e6696d-3fab-4da5-ab89-4067d856f186@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: l_rs_ffdQlUBt3X8hyJa2-zFAsdiiG6W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA4MyBTYWx0ZWRfX5439bIeQFwMu
 le15no9yxhG7pDgHb3YSm2uxNtpqOpEkhBCIVIj4gl1rLeXbRj1bIttb98/UYVbgsNJbRC+pPGD
 PYzO420Z9VuI8Z/VaB7QL6SemxYDMsSf5TyIB+lZGSrSSrdqEe+02Mj2aZWAv5MKNT3uglGQ2zX
 JhRWJEMsmrU0c1PpkN0YN7ZdIZ8LtX+eeNvCCLkfkATGlgyl7O+m9F6SMZCFF9UeXzZKfwosd7T
 hZMTOxJM8ngne4zwa7XfPsAgVjM9ME6L8ayudXDX4ElssCbYauiyg/d0HYoGBgDRRbT91sSUKO5
 LsLMOmJ0hcKQklWrlWsuqMw+l6ctEbDAR7QlqIkduon1MibaZXVU1yCh4puMM7uUdX9u5FlsYyH
 H323s3nv7IpU/rbChMwDh/0hbIEDwxurUYylPywIBJGJteGIZVDuegDavt8FHnHoTOQYqiVlhDf
 9K8YMZ/D10WWwK/xujQ==
X-Authority-Analysis: v=2.4 cv=If+KmGqa c=1 sm=1 tr=0 ts=698f0313 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=0IPvm9oXmU5doNSm3s4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: l_rs_ffdQlUBt3X8hyJa2-zFAsdiiG6W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_01,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130083
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92767-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C0B65135461
X-Rspamd-Action: no action

On 2/13/26 10:42 AM, Manaf Meethalavalappu Pallikunhi wrote:
> Hi Konrad,
> 
> 
> On 2/6/2026 2:57 PM, Konrad Dybcio wrote:
>> On 2/5/26 10:14 PM, Manaf Meethalavalappu Pallikunhi wrote:
>>> Add support for Qualcomm PMIC Battery Current Limiting (BCL) hardware
>>> monitor driver. The BCL peripheral is present in Qualcomm PMICs and
>>> provides real-time monitoring and protection against battery
>>> overcurrent and under voltage conditions.
>>>
>>> The driver monitors:
>>> - Battery voltage with configurable low voltage thresholds
>>> - Battery current with configurable high current thresholds
>>> - Two limit alarm interrupts (max/min, critical)
>>>
>>> The driver integrates with the Linux hwmon subsystem and provides
>>> standard hwmon attributes for monitoring battery conditions.
>>>
>>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>>> ---

[...]

>>> +                    enum bcl_channel_type type, u8 field_width)
>>> +{
>>> +    u32 def_scale = desc->channel[type].default_scale_nu;
>>> +    u32 lsb_weight = field_width > 8 ? 1 : 1 << field_width;
>>> +    u32 scaling_factor = def_scale * lsb_weight;
>> Would this be equivalent?
>>
>> if (field_width > 8)
>>     def_scale <<= field_width;

Actually reading it again, that'd be "if (field_width *<=* 8)"

and the div_s64 could become a mult_frac() if you take care of the types

I would then read that as "some PMICs have a higher resolution ADC
but with the same range" - would that be right?

Konrad

