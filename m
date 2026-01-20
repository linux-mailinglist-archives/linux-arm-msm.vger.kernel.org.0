Return-Path: <linux-arm-msm+bounces-89901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLHFKtYDcGmUUgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 23:38:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D264D169
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 23:38:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9CC396AE22D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 22:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B5B3D3312;
	Tue, 20 Jan 2026 22:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RrsU96/g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EOa+OJwz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C4D3D34B5
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768947385; cv=none; b=Y0X/KfZESbKDbq7bGKhCS2Gat9xnAakFanNUIIhCkUcPeoDXBpBUAQTBBM32MVt7azJacPr3xEx+KyfKHY2p6gKor1L6b+7zjSn+uENDug17MhsvIWW/84GLlmEAtaNoldnSymycqK0SGI1h1ZK/Ow99+qg9NLOhPMZU2WBR7yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768947385; c=relaxed/simple;
	bh=aIF2sq1G+SBDQ2SeQKoKfuTkG90GCyflJtqsoFKJ/Pc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F5owSXx+M+jqNUa+zXiPq2c59e9tt94qY9HMvxK3qfftDhQqSGR6GUNBm5ecxuS9UQW6rqyo/O3H/O2+MkWMX439mO3j6cKp/Z+SIoylDqLFOpqF67nTGsPFEPBvLhmUQJ9O8ghyi9vfCq8mXrEfMU+C0iFKHgMecvJVUQYGzlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RrsU96/g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EOa+OJwz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KKh12Z877858
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	898n42PZbM7sQ/Hguy4+gqUdwRDFS04P1ZHCu2BuyGo=; b=RrsU96/gWhayivnM
	deUFLchEkp/oMi33gFSkMcPPBQNFuj1Mqb+fCywK86Drb25SkcfsxppkJ78OcDg/
	qUQsoJujFU7ikn2UrCahsehW8CBxIvtUUEeF/q5kuF8Cyh7ijgDGY+nrQgDFvofr
	Pr1D1gSFJ4Ac6NcV5WnwqbEJTW3bbwgOfgiRb2Vt00LlQCkqRuqPkP2LOkd/6i82
	xuKirjvA1DpRSbCELevPqPDLG5s7+RHDn68YGFJ+9GLEscvs1pbMWLoKWUYLwbvS
	Tpa952jkJwOfjyvsSD0+n4MfX7KE7lHVK+xqlklLkhGLEhs0C62PhiEXxzOe5e1V
	zifyOg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bta42hu0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:16:21 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ac39bd5501so5326733eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 14:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768947380; x=1769552180; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=898n42PZbM7sQ/Hguy4+gqUdwRDFS04P1ZHCu2BuyGo=;
        b=EOa+OJwzKeXjgcsw/Yu/29pcJXzM5v+G7o2KmuW70Gd4SQkVNZMU+oI7XfRZtVZetj
         vAk6xlu0Qx+WcVOHGh7zN8WLWxYT2IhJv8bmAvlPYxN/QinwBhrpBAwK1hbxHpUjOI06
         nSYLYeQe5tZjW1GCocV+v8jNJsvYa0oorKPOR9KzmiS5XGQM3ezp7l6rQv42l2jeDQsQ
         falkhXHOE1qdVf59Y/gngBzyWepD2akNDxO9pc4rjq3w+tGOf4e1Bs3YG1HO0D0V5MFa
         IeSTsSE0ERASQpasWZEzeQVWyFsN93ok0Q+utFYJHfxm5WhJVRjzZvlqqSXm0L6xzq+k
         cQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768947380; x=1769552180;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=898n42PZbM7sQ/Hguy4+gqUdwRDFS04P1ZHCu2BuyGo=;
        b=WVTvN2OfR/r798Cuq8wC7U14Er6uHan4C4o3AnRQFrm060Mndq/rw1t0+T6oBwtiWW
         4fI0cmyQj9Xf4mEOcqJAtsweMLNI6/mxd0O9HDCKddCqPiaCmqgAHNqI38hJab+42+Et
         tpeTcvK2tXj9TS83ACIADffp4JeOQu4dIpOMjIliZN/3R8geyouAljK9AvCUoH/cBck6
         XtURowZwE4SlmQbUciq/GcGSDwPjOdbwo6mAmcK4A7GO/S54eBpYQzdiM6+2RH+ybqdE
         vTOTyMQoIIq7Kdz+8ocLeedTEQjsBcg5bqd8Bvk52vhCUAHXqwFwy2td264hV6RUrD8h
         tA8A==
X-Forwarded-Encrypted: i=1; AJvYcCXODQNCEHZxoZU8OP4E0B/ervy1Gu0Cb62CMHtvpFNT7XHrTLyMjuhm5fP/N9i7q+iu9pVHoljySPBY4m87@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ6AKPuAk+QODZUXKcU9krJ2nt2XZPkyPqDScJNj9Gzq8MIS7r
	pTT3VQ5jd/i8YrFlsi/v1PVGUzO7re7ZIR5xxqE+TB7Oy1SedVL4UCqc1ApWiXq3+eoh62kP0i1
	vkujkt09wV6dzasvSofxC1eRAGRYFexwqA2d9509+Kpzp1p9WNj88Og80/FXloipdFhW8
X-Gm-Gg: AZuq6aK7oEF8Vrb2epu9A48ifLY0W7nHX6QYDquEtRIKjKLbNuFWvwNJSfilfhN68Ch
	EX5PUjePi9nQSLhLv0vqzPNUF5+GP6JXT3D64rYqmmE3dkOyxNKjIh7yxH3Fw5iFXJbWSr2oCIr
	4VYkn4UUO5nLz2DUsG9CioHB2rSGwSJmCgi/R1AxZlGPkngDB+XLTWyLQOdPwlZzx5m7s/A61ej
	CNPe5FEpIfQRwrjgsqTUSH9pqKmt4J2vq0OmaBVZcXRJaNv8rY7y6+6zag8nyo/CrjRC7VC4xfW
	HAGtgm5+6SsNoLEnrrRJBzCPTWhWqaVt5OUcdLiOZancCM8Qt2+SpxrBwb61Vdv6dENta2gSkPG
	h/Vb/iHVk6JolNi6gZBlhgr4URE4fkgxcoGQ5pzorjzMLjAypfuCPBvSlKM1wtu5Pruk=
X-Received: by 2002:a05:7300:1489:b0:2a4:7b58:1a25 with SMTP id 5a478bee46e88-2b6fd7905c1mr2372030eec.27.1768947380254;
        Tue, 20 Jan 2026 14:16:20 -0800 (PST)
X-Received: by 2002:a05:7300:1489:b0:2a4:7b58:1a25 with SMTP id 5a478bee46e88-2b6fd7905c1mr2372005eec.27.1768947379600;
        Tue, 20 Jan 2026 14:16:19 -0800 (PST)
Received: from [10.71.113.255] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b70d7f729bsm1680791eec.16.2026.01.20.14.16.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 14:16:18 -0800 (PST)
Message-ID: <5cec9127-bdc5-49d7-80e1-2ae26f81163c@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 14:16:17 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dt-bindings: soc: qcom: eud: Restructure to model
 multi-path hardware
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260116232106.2234978-1-elson.serrao@oss.qualcomm.com>
 <20260116232106.2234978-2-elson.serrao@oss.qualcomm.com>
 <20260117-courageous-chamois-of-focus-20d5d5@quoll>
 <sfazro75vspadpe4wco7zvlalcy2wbrbdjx2wn7lyonjgw22sf@z73u67pinusx>
 <4d6ffe96-2113-42fd-97e5-42247f073aef@kernel.org>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <4d6ffe96-2113-42fd-97e5-42247f073aef@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE4NSBTYWx0ZWRfX7iEiMSN4nEND
 wcFss5pTuKKyubYqg44fI5YSmwYFHzyQcboWDCuVuRF+dbc8CXz0gU9euopb71/VzJxHnuZ8Qxy
 HCQqhpE/HBIbOR0khvdYXaC2mf0ojiiYFwcHt9J4O9E8RzXqEn8f4jdn46Ws40F+wQG0h8UNr5e
 U15Aegq0Fwrc2Rnc2LyLbtj1P/6a3fdH/QyspRT4b3pjcu/vCBQcxCqxXXmKQPRduj3HiCptMaJ
 SaG9DPWuBRjEvpzDPQkeca4YlzhK5ACVG+bdkJ1lnuQTS+5YBSFLhCDiI+8ASd+yFluSuMvEIOH
 9zkJ71X1qxGCzqvQ5PURCRlTdUQiZoBmb9ySqjzBjaGiLT2yVxCXgVWDMnfzYJZiej5pW9DfTBt
 i0hWo69AGJ9uZjLvsbJUyGSgzit5X36HyC5/dfp8KIWWx3pIUkiVaTf4Ky0Fn2xxEyd+5j7kSW6
 gz4aQnQhIVnv3GMEiyA==
X-Proofpoint-GUID: p5Sq4yyewEJpvmim1mj2u7QptE902s42
X-Proofpoint-ORIG-GUID: p5Sq4yyewEJpvmim1mj2u7QptE902s42
X-Authority-Analysis: v=2.4 cv=JeSxbEKV c=1 sm=1 tr=0 ts=696ffeb5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=esL1I7lv05GZoeN1qSMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200185
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-89901-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 83D264D169
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 1/19/2026 11:20 PM, Krzysztof Kozlowski wrote:
> On 19/01/2026 20:58, Bjorn Andersson wrote:
>> On Sat, Jan 17, 2026 at 12:57:58PM +0100, Krzysztof Kozlowski wrote:
>>> On Fri, Jan 16, 2026 at 03:20:58PM -0800, Elson Serrao wrote:
>>>> The Qualcomm Embedded USB Debugger (EUD) hardware can intercept up to
>>>> two independent High-Speed UTMI data paths, depending on the SoC
>>>> configuration. Each path operates independently with:
>>>>
>>>> - Dedicated PHY interface
>>>> - Distinct USB connector and controller associations
>>>> - Role dependent routing
>>>>
>>>> Model these hardware paths as separate eud-path nodes to accurately
>>>> represent the physical topology and add below per-path properties:
>>>>
>>>> phys: EUD exposes a High-Speed debug hub that relies on HS-PHY for its
>>>> operation. This property references the HS-PHY associated with the UTMI
>>>> path.
>>>>
>>>> usb-role-switch: Indicates that the USB port on this UTMI path supports
>>>> role switching. In device role, debug mode inserts the EUD hub into the
>>>> UTMI path. In host role, the EUD hub is bypassed and UTMI traffic flows
>>>> directly between the PHY and the USB controller.
>>>>
>>>> This change breaks backwards compatibility, but the previous binding
>>>> omitted critical resources like PHY and did not describe per-path
>>>> topology. Without these modifications EUD cannot be guaranteed to
>>>> function.
>>>
>>> It was working for 3 years, so your guarantees are just imprecise. FUD
>>> is not an argument.
>>>
>>> Qualcomm task at 2022 was to post complete bindings. These were posted
>>> and accepted. Three years later you say that previous posting was
>>> bollocks and this cannot even work?
>>>
>>
>> That is correct. The description of the hardware that was provided when
>> this was upstreamed and the binding that was accepted based on this
>> description is wrong.
>>
>> There's absolutely a value in maintainting backwards compatibility in
>> general, but is this one of those cases?
>>
>>> Nah, take responsibility of what you did in the past.
>>>
>>
>> In my view the responsible thing is to accept that we got it wrong and
>> make sure EUD is enabled end-to-end so people can actually use it.
> 
> I would expect to see what is not working. This is in mainline for three
> years, so the assumption is that it was working for these three years.
> If it wasn't, this should be described and "cannot be guaranteed to
> function" is just imprecise.
> 
Thanks, Bjorn and Krzysztof, for the feedback.

Let me clarify what I meant by “cannot be guaranteed to work”, as I agree
the phrasing can be improved to more precisely convey the intent.

The concern is not that EUD did not or could not work historically.
Rather, the issue is that the hardware description provided by the
binding does not explicitly describe ownership and control of hardware
resources that EUD depends on. As a result, correctness of EUD operation
relies on behavior outside of what is expressed in the description.

Concretely, the binding does not reference the HS-PHY. In practice,
EUD may function because the USB controller (e.g. DWC3) keeps the
PHY powered and configured.

However, this relationship is not described as a contract in the
binding. The USB controller may legitimately relinquish PHY control as
part of its own power-management or low-power transitions. The EUD
hardware is capable of operating independently, but doing so requires
EUD to have explicit control of the PHY.

The hardware specification lists the PHY as a required resource of the
EUD debug hub. Not modeling it in the binding therefore leaves the
description incomplete, because EUD resource requirements are being met
implicitly through another hardware block (USB controller) rather than
being described directly.

In addition, the hardware can expose multiple UTMI paths (dual-port
EUD), which the current binding cannot represent.

The intent of this patch is therefore to correct and tighten the
binding so that the hardware resources and topology EUD depends on are
explicitly modeled, rather than relying on side effects of USB controller.

I will update the backwards compatibility justification accordingly.

Thanks
Elson

