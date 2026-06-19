Return-Path: <linux-arm-msm+bounces-113833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fb5NAbYyNWoeogYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 14:14:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 934EF6A5A08
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 14:14:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=n2+p+fQ4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TkC0SvdX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113833-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113833-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 087A230066B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 12:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8826434751D;
	Fri, 19 Jun 2026 12:14:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EEC367F31
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 12:14:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781871282; cv=none; b=FJFyYjZdlXB5EZjJq8TuTcj0RUoGaFIBYQf1aH8fev9tbE8hDZs35OLSbT9D/2QhZrV9HnTQoguI128Rnm7oXDIxrT6UoXedYRvntI7q9VBFN3EHsz1hiTrAil9SJ7V8aMpLYNqaUeqgn7IImxXPk8XNsdmikBFKpeNP3FgSjNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781871282; c=relaxed/simple;
	bh=gmlc2x3Sx9TTXS2SnEsXIeKsBRFp3YpvrWD1xNAK2HY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=udex7wEZ2YcUBlYexexv99qhDLaq5+FqTOPaWC+mcLUYtUHtUSBxEa1B/UdTmLgQyTKryBFgH5sTnOEKV8goFQ5C0ORTRt4jgq9XuMbSuA4a5SKfH63M7dWONs8aZezQjL4LVtpceSW34fnqkxbfhg1o90NR9LTC4v3d1QUaxJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n2+p+fQ4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TkC0SvdX; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J7Op2E2257797
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 12:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YB5TdQQBRKdo3NZtG8wlUHn81r0WZQz2AuX2RuLMVLU=; b=n2+p+fQ4wCRjumLr
	9veJ7nFFJGeEtOdWgOFs1ybRBss+PDVGhQEGMHlenqzHC7hEbextHucdEabVTKPO
	UOtTPWPbi8QjLPE501VmZkFaTl2Q75ETZrOeKQdZM0z+YDRG0p6qRc1ICku8bEXd
	PvIxR6mt1kAiFrA2poopOGmsCvcn0Uzt8gjd3SzeGVsXgCsDgmbUgdMzKBi1PVne
	LtXdnX00ovAhka7v5I+VbhEbQfaLeUimLF4RoP0o0sNnHhfS8HoQj6pnpt23f/o5
	GTiLs61/miBQehGAdMak3r/Zw6Co1CEX41JdKufLNRgMkPQSvidbyCCyVOHRdnpr
	F9LEpw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evmyrbe8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 12:14:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-519fe742290so348741cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 05:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781871277; x=1782476077; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YB5TdQQBRKdo3NZtG8wlUHn81r0WZQz2AuX2RuLMVLU=;
        b=TkC0SvdXMnxdbJ7qh05Ekxyl99PsAU1gkNU54/1uBRpDtcA0R622RyEy16xgoJTToi
         yuGiZmTg+9zExR6YMYfJzFIG9MEgt5muZnHiy8ORukw51uhLWVMpb+NANPM9STdY224Z
         ZWsYeBLbMOnpBI6ztwNvk2ealERPtpi9nHMXgeY6lKfbeEBDcpX3PzuZQPFm7rgmRv5d
         fTedEnXAj2X9mVgDmp2snoFa2QnoBmwuAollcrvKlT7bXP5zqCxF4UzV50hclZIT1MUx
         C9AIV3va97s1SVtdNrLIhH3NmesRvwgGcmakP3NhsINxjYAnXGJGBQIaoDkF2d7RP3LM
         uA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781871277; x=1782476077;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YB5TdQQBRKdo3NZtG8wlUHn81r0WZQz2AuX2RuLMVLU=;
        b=EgMj+La5TbrAYAQ0GkzLtk2VOW2ICREQV2VjA69J4fZKTwg1cAhtkM77oBW4ku2N+X
         HLaoNqLn4FvRDx2ppVzs7uSqseptiIz+B9fSXanyC1/i/bS3bQQ85FzWjd0SUYBgKgfa
         zPeMjMzCUdyZzpJsADpsGP4X9OCEy8WMQ+XvH5NO87Tlwcu4pIkFCsXfWBLDvaRCupvZ
         QgT+oRWxP9u9hmuGDa2UZR5RIKJfdD5EPYP8bWhSXmlqduwvRZ/BZqFSyLuIkYaIe6RA
         GCoTfY4kIwh5+yPhL58VIeWuQVX9lwnqpHm32ZnWfhq/yY9pbs2WhU0bEPAVLoXOCYLD
         ML/w==
X-Gm-Message-State: AOJu0YyHA2Q5+SIQoi4vLNmBVhBNuRoRFquGBW2xgTXmdZOGJS2U9SCU
	jYsO6z6BifxbG8muHfOGaUfNPzKTRtPaFF/TIbWHdHOSaHk5dvqCg4xQp+gxope6Clz+mBsAPJS
	d0rlYM0+77d1zXnHkQzkMIEmhLfVJr4VkDQbUeBncl2VBOLbgYEuDsT/aHz/BvVvGTR9s
X-Gm-Gg: AfdE7ckvHWHLVJDUJOQWsxsPJqwg1Dl7F6V6R7FFPeOtamxkQOUi6Kf0tX+U9VvgGH6
	+mgo5cX1RP3r3LikrRN8hfar8axlb7UHRRQVS/iuhRNVFFtqZdGKBDNvQYws5OouxhkqgA86OCE
	qonNI3vrb0l0hcMbB3X+9YLQrVPr7Q5hOhUzkWRtyu7+mrgln/pWGvyc/ABSmQ8YU72AoBOuuS2
	hbdLzMw/N4l52THm0+ozKYj/L7FwPQ6cEuD0dGBj58eL5ML153L83eh11CypC1rzu7+4psDPr9N
	MfqZ9yLG7TSBckwjO1/Lj3KDC/Ftxa4IqxNdJeHb8j1m4+vjDXeRPpGjVetRWckeMP1UVz4R7f+
	E7VH23LRZAKBSnlgIld6tHoYKwHXSrxIP0ME=
X-Received: by 2002:a05:622a:41:b0:517:8999:6c50 with SMTP id d75a77b69052e-519fef5752amr3187441cf.8.1781871276923;
        Fri, 19 Jun 2026 05:14:36 -0700 (PDT)
X-Received: by 2002:a05:622a:41:b0:517:8999:6c50 with SMTP id d75a77b69052e-519fef5752amr3186881cf.8.1781871276235;
        Fri, 19 Jun 2026 05:14:36 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-696edc880cesm855827a12.8.2026.06.19.05.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 05:14:34 -0700 (PDT)
Message-ID: <5ad33cf2-3168-44f2-89fe-a7fe1420f8f4@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 14:14:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] thermal: qcom: Add support for Qualcomm MBG thermal
 monitoring
To: Sachin Gupta <sachin.gupta@oss.qualcomm.com>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20260601-spmi-mbg-driver-v1-0-b4892b55a17f@oss.qualcomm.com>
 <20260601-spmi-mbg-driver-v1-2-b4892b55a17f@oss.qualcomm.com>
 <7478c540-a5fc-4238-bba0-5b04547f57c7@oss.qualcomm.com>
 <487f0ed1-dfc2-4f7b-94ce-60045017a663@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <487f0ed1-dfc2-4f7b-94ce-60045017a663@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RZWgzVtv c=1 sm=1 tr=0 ts=6a3532ad cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=JThlKoFKImu4mk-f7WUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: BPQJlgfBfMDVXJJvo5zp59xFpWmRinDk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDExNCBTYWx0ZWRfX49CnkCCpdgm3
 wvLkYW1rOIxB23AnSfaCvcVKMyr2L0YEcfPMedv611hbW5FEY4xEldo+kKbXCUX3uqaO/s8qi81
 WE6GvnhFx/zoJrNfRYzvYYbYE8Y+CS9rhek2miWB8g0giQ3G+atfPGG25vjGqO4Y/kNWYxZxV3a
 v3tSZ7x//PZs/srpZgGm4Hnelnz99IF6ucJ7LGmrvrYJoMmCEQllFfPWGeovwGtdKp1W/LA55A5
 Ec1ZJszCOUxMwr58cZ7SLEfUHU9OmJMuCD1xI1sE7argae+OB95EVcRskbJSAbCHfOjdQun90WT
 Kq4du7Ep96A2hTzfyx/j9Jt87r974N2bJJtGnknYLWLEVwByJVz2KDOgFFQIDY5DiqlKdUTr3to
 Noifdu8aVkD/0yWkFBPJgkhXEJDWOI6c0uE8W/vkh5LLIET6SV8Z7AbIwkC+3GzhDR3dIUCFYSi
 52ooZWCBjDcod/UHGOQ==
X-Proofpoint-GUID: BPQJlgfBfMDVXJJvo5zp59xFpWmRinDk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDExNCBTYWx0ZWRfX7DSYrO18ZWHf
 lYy0jSnfnHSC3HGB0y6zsD4IPSEhRxa9o4+/Jmgn6mU7gRRLGo0VKw1PpzzIZWhgc0m1Gt/vMoh
 fBIIbe6b30VGVNb8oNn74qCMiRiGSiE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113833-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sachin.gupta@oss.qualcomm.com,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:sboyd@kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:quic_skakitap@quicinc.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,intel.com,arm.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 934EF6A5A08

On 6/19/26 8:45 AM, Sachin Gupta wrote:
> 
> 
> On 6/16/2026 3:40 PM, Konrad Dybcio wrote:
>> On 6/1/26 1:01 PM, Sachin Gupta wrote:
>>> From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>>>
>>> Add driver for the Qualcomm MBG thermal monitoring device. It monitors
>>> the die temperature, and when there is a level 1 upper threshold
>>> violation, it receives an interrupt over spmi. The driver reads
>>> the fault status register and notifies thermal accordingly.
>>>
>>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>>> Co-developed-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
>>> Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
>>> ---

[...]

>>> +    /*
>>> +     * Configure the last_temp one degree higher, to ensure the
>>> +     * violated temp is returned to thermal framework when it reads
>>> +     * temperature for the first time after the violation happens.
>>> +     * This is needed to account for the inaccuracy in the conversion
>>> +     * formula used which leads to the thermal framework setting back
>>> +     * the same thresholds in case the temperature it reads does not
>>> +     * show violation.
>>> +     */
>>> +    chip->last_temp = temp + MBG_TEMP_CONSTANT;
>>
>> Will this work fine if the user tries to set the max temp supported
>> by the hardware (i.e. is there headroom for max+1)?
>>
> 
> In the current implementation, temp == MBG_MAX_SUPPORTED_TEMP is not accepted (temp < MBG_MAX_SUPPORTED_TEMP), so the last_temp = temp + MBG_TEMP_CONSTANT path is never taken at absolute max. For accepted trips (strictly below max), there is headroom for the +1C adjustment.

You check for `temp < MBG_MAX_SUPPORTED_TEMP` and there's:

#define MBG_MAX_SUPPORTED_TEMP 160000,

so passing temp=159999 is "valid" and after the addition it becomes 160999,
which in my understanding is outside the range

Konrad

