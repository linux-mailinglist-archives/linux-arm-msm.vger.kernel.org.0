Return-Path: <linux-arm-msm+bounces-117429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wN5jKc2JTWpZ1wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 01:20:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7B07205ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 01:20:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DtwjNrEP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dV64NLRn;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117429-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117429-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97141303F7E9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 23:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3174836A370;
	Tue,  7 Jul 2026 23:20:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41F42F6560
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 23:20:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783466431; cv=none; b=i0owET/9eGpKW80suS2LcX97x5GReU7KqOMsWkI79HQPGOa1E0mypk7ky4UDNH2kq/wHYPU7AvtcoG0BKGfXPgdUxdFetgd/8OFWtuUms24dORtugY4YYN8RjiF0RMAoD1Fx73KXgzVHzI9KYbO3IlB8h7WL5lKfMhI5xbG087Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783466431; c=relaxed/simple;
	bh=nNLvNAxE8oTJKmVhdhD1v29LtZ3M/VtNU3SAL14/dFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eiKFTLRr2UqQr44oyu1jTtR/ZZOQe+80FlTQTDx/251HRyxjUa2KYUIfpO8efzGolBCmm5NGviq7moxWpyEyf9trEBN+qfkg5eeRuzXfOUpbxFFiqGHfBfMDI61TuFDColpueMNiO6iNMAnXW70/Rgk2iMsw70xlaFdlZB6H2MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DtwjNrEP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dV64NLRn; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667Mcsvv879219
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 23:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LGjjqLq+Ks/g3qQWYtvwlz79UBgaLrZTTvu4D5iBSCQ=; b=DtwjNrEPrDz+RPMT
	28n6Ywp74gEkEl0i6Dx3KqJ71xVDkKuZOdHv4Toa2NVLlVvfnoH6UBT3kjpw9vvr
	FUapcSuo4TOIsCJ6E0JRcpR64M59Qmo98TmXUhRYikfGec2ZHDznSwpF6b6HTuK/
	X8R6F4Yk+etS1xKyJCugWEaufx0Mo9t92quwkImca0cIL7bzGSI6DaO+zICmX0ul
	F14oooUEmA0JL3sCfExEGaFFrSbUmyzJx4GhE21hHAtTaUhAh3g5OMwxSrUo70wm
	vpL98Htea2Oj8ODo/cgw9lnwBJR+Pmze3d6K0k+dwxsn82SE4mJ9Cb/L74dc1iID
	Z/67BA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f99hgrbkq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 23:20:28 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso12226a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 16:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783466428; x=1784071228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LGjjqLq+Ks/g3qQWYtvwlz79UBgaLrZTTvu4D5iBSCQ=;
        b=dV64NLRnY+3LchWeoM3ff1v9DfJ92zJ2M0OrnLZ0zvdi9QX7bingjNxqSONwpd4CA9
         PqEJAC/u5/OOc5mvlPN5etIZ0FGo18v+PLB7N15CboXM88KdbNJBmsXAQeDMXuOpSY4D
         rpyAgYo4MP0PsUQ2Gb2b0k01KyzWYtyJ5GAYqkzaWVDRPfl//38O4OT+IZuPja9acnio
         2N07jnBnOalWn9LrkZqj9dBoFdq6QOq6kFC2bIT7OhB0C65Lte5kA3PpJUPuNEkVu3Tr
         u1GCQ9QDm0Jroz/gSNpiLgaGIvZjfTar+cXNfD3BabN50UHDHd3lB8D+URsC3wGcrG+n
         aFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783466428; x=1784071228;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LGjjqLq+Ks/g3qQWYtvwlz79UBgaLrZTTvu4D5iBSCQ=;
        b=c04t8BI+YuV6LVF8f9mixIrGkSrk3aKY/s4WQ9IS7jcPT0GxEeb7J4L+FiKn7cL34x
         0OSpAia2K5MmmJhB/CptnmNuv/EKqbCUsAiP5CbI5TXV8ChhHJytgrTnnFaCgFsQioMt
         YfE0fQWKhwFHFydJIeKoH8mKwri+LYdb4UCAbfbF00p55l8BOR2auZ+l6Ns/cvRr10cv
         TBiTG6ozLdUcw1eoso20KJG+O9hskMg8nXKDlkEh4omykmqXK8x5YLIFc/252UAC8pcM
         TDqv2OIs8ghi+N4sEf/eNl8m/kdyD7KptUg81E+C9CPF/HSnKLveFPYzNn0kw2C5EbUy
         Bbgg==
X-Forwarded-Encrypted: i=1; AHgh+Rrfpo2Kfu57Cky0Se1P/4gi6khnlwdArfKTD1lnl3D81MwGaLW3aCmjD1rihB65rHG0mQu7WRuMGRFr/iBU@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfti+86kCfIbsJwJHfp5mTap4BeURDM6pHST0i+kQpoDHIGaie
	GHf9M0hMm7Do9GJcXF6mYsffspKIu6OUBzEDz+SrQ0hRc4WsQgENyeaVQIoSVwIZdsDP7jpb2TS
	/WdooKhYtun9qPYp9fFcg+27MBJ5aTrJ43C2bFbRbUkksi2AvpMCvXOtqm3jOSqkC0Ia6gVaC94
	y8
X-Gm-Gg: AfdE7cnwumJr1SVTDUTxurNnw1AtnKBwPr1fk0UiKoin+Jc5RQgQp1tFwKpIWSR6Eyy
	giG1q7SYmlXYNXOoYacLruY18TEEYyAiY6u8+qbBxliClVdrixS+850AXz9sMWunVN2vZwmHRPy
	7luHfOMZBXhNLXufjV7gviXEo5IKXNVtkSXlkRZGfe6ieftGD4yfCQDlJIM6j44hoQtM/bCtMgg
	jnmPCOJZC7zPwn8DOOi43sgwBNqpjooQp59tALgTAhDMpncZljnEywEnpBNK9/PFG1otXQFUCPg
	JUEhuV9TAxjSIOnkaB0OmLxQ5ezAIYMw91CYdfwu0x/KUF1Ay9ib98+BwctwKa6BTKA7e/Wted7
	NI9Ac45fnwsIGBPoJq+yuX1IArhwtXEK3rkioipQ80pHF8P2DcCz/LKVqehf9R78DRn80krWQpp
	zii/c=
X-Received: by 2002:a05:6a21:1f81:b0:398:840d:39aa with SMTP id adf61e73a8af0-3c08ee371e3mr7498705637.29.1783466427590;
        Tue, 07 Jul 2026 16:20:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:1f81:b0:398:840d:39aa with SMTP id adf61e73a8af0-3c08ee371e3mr7498684637.29.1783466427149;
        Tue, 07 Jul 2026 16:20:27 -0700 (PDT)
Received: from ?IPV6:2603:8001:7f00:fc12:b897:54f3:b10a:6577? ([2603:8001:7f00:fc12:b897:54f3:b10a:6577])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ac0557sm15675242eec.26.2026.07.07.16.20.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 16:20:26 -0700 (PDT)
Message-ID: <c2e03d2e-fbab-4632-b4bb-25c6a11bf88b@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 16:20:24 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] dt-bindings: soc: qcom: eud: Add per-path child
 nodes for UTMI routing
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <20260501170635.2641748-2-elson.serrao@oss.qualcomm.com>
 <20260703-manipulative-mauve-centipede-f8c95e@quoll>
 <2105eecd-b2e1-48b0-9795-ddffa8e43937@oss.qualcomm.com>
 <ur3haudwnsvg2vpdwrsea5ik665xxafsuz3iznvjctw6algz2i@amy37zfoumoe>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <ur3haudwnsvg2vpdwrsea5ik665xxafsuz3iznvjctw6algz2i@amy37zfoumoe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8WuYrVrp-9lYDh0pNuv1ZEMt2fe_-efJ
X-Authority-Analysis: v=2.4 cv=CviPtH4D c=1 sm=1 tr=0 ts=6a4d89bc cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=Xh3BmAQj8LICq2LrjkMA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 8WuYrVrp-9lYDh0pNuv1ZEMt2fe_-efJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIyOSBTYWx0ZWRfX6k3dYWTJDyl5
 oXyS4rAqTJ+7t9XHePUpqtCx8R/hMrOlEMDSHTtiIKu2/Duh5ixC6WV2eScchTLfVgqubZdk5ux
 TqEkFbeUEmTPRh3vehwVFCFwrO2q5xo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIyOSBTYWx0ZWRfX2UGe+Qabzwkh
 XSepYyvkh7S3qeAiTXk2yB7GkuZG5/a7X7yVkNV9h4AIlSAobzi7NA+39ALVpFozvmc8/qDmq+U
 JWAmaiFrhXVLCNcHJRn5zQJ3dMrbIA9MK819Dt1wGDhkFdQt4H6DfPJbJKdGpCLHBZ4yVKhSCvX
 /SNhP12k28FABWQ1ADJHq3iiRKk+MwDfBL5cdXZcd+jJq9IW9G0dbvQYaTohaizDANS9ekwDSRe
 jdpVu5SafDt09E7aQwgq/XemGfRFGy870lRrBVu+woT/lA+lAzRcMRX1fGsDyPoLg8lh8m+RT3u
 KQyWy/3I7N3Ntr+K5OQgzCcYOvNwDIalUUF0NAOrSChj1eKhfcsI1hDvrLmypWnBvWKB2bqEjwa
 x7SEokafmgBDssY6F+XzANLEydJLqniEWOTVsKEK0Gg5D7L3mvF8kgI/AeaPq+JUCoa8N9SMbLq
 9zXZubS3ZbrTEn/EetA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070229
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117429-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[elson.serrao@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:andersson@kernel.org,m:gregkh@linuxfoundation.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:quic_schowdhu@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C7B07205ED



On 7/3/2026 5:01 PM, Dmitry Baryshkov wrote:
> On Fri, Jul 03, 2026 at 10:56:19AM +0200, Konrad Dybcio wrote:
>> On 7/3/26 9:45 AM, Krzysztof Kozlowski wrote:
>>> On Fri, May 01, 2026 at 10:06:27AM -0700, Elson Serrao wrote:
>>>> The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
>>>> independent High-Speed UTMI paths, depending on the SoC configuration.
>>>> Each path is distinct, with its own connector/controller connection
>>>> and role-dependent UTMI routing.
>>>
>>> You miss SoC specific compatibles in the patch. Binding describes ONLY
>>> SC7280 but you claim here it depends on SoC (not sure what is a
>>> "configuration" of a SoC).
>>
>> The hardware configuration - some (older) SoCs don't support muxing
>> to another port. The binding only says 7280 today, but after some
>> version of this series lands, we'll wire it up on basically
>> everything that came out in the past 10 years
> 
> Yes, but I'd also prefer to see exact words / platforms / references
> rather than vague "depending on the SoC configuration".
> 
The wording was intended to describe the EUD architecture implemented on
Qualcomm SoCs (as described in the EUD hardware documentation). Given that
SC7280 supports EUD only on primary port, I'll reword the commit text to
give exact platform references and add a compatible for a SoC with
dual-path EUD support(like SM8350) to serve as an example.

Thanks
Elson

