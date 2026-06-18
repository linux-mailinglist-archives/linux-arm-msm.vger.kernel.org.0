Return-Path: <linux-arm-msm+bounces-113705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BGHpBKC1M2pgFQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:08:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC41869EBCC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:08:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cgmVfjPG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iaUpb0jZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113705-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113705-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9615B305A5E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 09:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4165381AF1;
	Thu, 18 Jun 2026 09:04:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D06384CFE
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:04:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781773479; cv=none; b=YoLT4eOVtBCeiZxIqXFjBic9S5GZIOBp7Mr/2FUQWJ59/d7PQ3lmpmDTLNE+U/FEHQlg4/UNWl03XQYvSWHwsMgN24vEFB0akin76RMNEvA5H0akH43C27evi5vzS3kNiSt9imjMCt9EZqjYZmPfpXy6zZTTyLhkf78JImf01j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781773479; c=relaxed/simple;
	bh=KTJtCRBahX3fXBvE/Go499ozEyEznlJ/MraKxFUabxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e/A2kudIFrX4u8s8IHalmS6GsfM37fhjEizS4SegSxZAEhxLj7y8XzGiS2DgRxHb36Zl7vuUlFb55qAPAsbc27egKTitQa/juOS3db/GXNkPoqEn+E9R3RgUneP29JXP2cO1/8pzW08Sv0uJlKQmVXF2MciffK9LiyJppnbmEl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cgmVfjPG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iaUpb0jZ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8DPeR3399732
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Bi/S6Rwsqd9YnOHV+H5Xke+fS5rIcjPFcQVzd5Civo=; b=cgmVfjPGbEBHwpgo
	GXr65WE5MkAGSVHZ55UoBYpXvGMSqV3fWZpaZWFAQmfNpdnI6AXbZzlzB1fyajeQ
	uVVZVgkqpdDstuKPc8IyctMG1wI+3Ky/6lgDmR1LnBy0s2YgcNMSKCsPDOz6KZ0Y
	Vc8oUrxcbRvwoQU0fCkKCexvm79Pt1gx2FsxJhQ2KkXOKwEWZmD3m4jFNnExi6b+
	8PAKkB503IgqPRG/woljU1QoU6d98M71fg1aBUt0rP08Mo36QGH8yEF8JVnASxOn
	45HosI0KBvsxoZLsbDm3KO2MbFUt7r7igUzXWiKS8Qc/btKH+wAbEvWT1CtaE5NF
	OzTn7g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev0vk2nnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:04:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915827fb1a3so15148385a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 02:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781773476; x=1782378276; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Bi/S6Rwsqd9YnOHV+H5Xke+fS5rIcjPFcQVzd5Civo=;
        b=iaUpb0jZ3hg+qUko3c76zB/SIf5EvnNyULATDc7aiqCWfKbVtxV8FbgkDiYBAF07wt
         Ydd9yLzoZPjn7q1f61P/ra1ZAKn7vx69hfVskmJmQwPEfvFhbOa57QB2JRqyI2Y7bPM7
         /TOotMJ/cPXzYJKJHBbk3w17OZnyH6i2z3kLBhxCjPjphQyuR6D9v5Rc7touz+QTU8PW
         dXhIyrnlc9hl65VperGkeHH1WItT4M2Hw9iz6LzKOKB3WOs1eDip8Aq33onyM/13hE1p
         rYBrCQEw/OX67AhDOkmsyJydOr4ivdODRMfqeYLikqfySv0fq0/5OQ3AA2Q6Dn3uLK+b
         kLJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781773476; x=1782378276;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Bi/S6Rwsqd9YnOHV+H5Xke+fS5rIcjPFcQVzd5Civo=;
        b=nLx2GKmnWFTMvj7fCsE10nnyUWOKI3/B2/p05JWZUROm0DQnpULVkFs72MkGjvjC6D
         pZDBxFbr6DcEu7DT+z8u3EYuxr0AbL/M4xWev933+SWLOqRTahmfADhWHQSZBVJXvXrT
         ykig7lEoW4VNMpJZHkpa35oTEv5lVyRQD7GknSBEUOi/EpPDjwz+Mi/RU1dA74Mkvz7N
         V23qVbdsGv90zTE5bgNZ3uq93c7azuXr9IR4Gd98EnJxVSyNT9ncfsLOc/2i/BQSFksI
         ymPCqZNFa/1rFzvyWOIby4Ca8yd5RxtUSOpvOtLfBimq3N2un+sdXSjzxgZ0Evb7KRSc
         K6GQ==
X-Forwarded-Encrypted: i=1; AFNElJ/gKpvWvPZOGqZ7TitU2N5+FlB4kCXrB9kR/FMqQc+n1kXPvEV/9Lsd+28S4NhSMb2DtFjt3Bk/cSLUFfSx@vger.kernel.org
X-Gm-Message-State: AOJu0YyLVMQJUWeaBnfhNHkO0yceBTHzn1YLhx7k/2lHTgxRjCujSg/F
	uhjcb4D0uQWMR0DdIp81vZmIOO9icYY6EXP4Wmvb/VX40C78qmE+s3gWBM0+v/d+vVx++QquVRq
	KceomMnm5Dci1lsmajOvgzeAT7pKGkch04W2Wkz7KsGdMTc1vPlYcEr6ROxnPQO9j5RZI
X-Gm-Gg: Acq92OFWqdiYMWOnVdjub6ISMaRCDvmxyQ9QNbTk/c4IS/D366YdY3GAbjlMcvn9wPq
	N4Fs1ogJedih4GgulpRxr7HV337boGGVEC9UL1Eq5PPR699cv20YhRtxdN0d0FWNE8mdu1jhe1y
	gYLa6KS3azgI9fQFchtqtfqiD1j0twwzPjZa8rZhIiZ52jhBBJiNKrb95slYF54oeYP3amrSi/h
	GrEj5x8k2wLZyFHPAJa0XingRc77E2biKcw319wC2dOtu6zFnwvi7s6rXu4zwTcvo1TVMRf6NKq
	Tg7ep+ol2MhlmDUAC5S66vfb4CPL+38/ps+sFx1yZfZBVsUyVwL6gGRQsvuEp4NBdOijzPnsGHr
	p0H8CR5S1er3nnYmTL5s7/tTWXGaRUI3huts=
X-Received: by 2002:a05:620a:444f:b0:915:8197:4490 with SMTP id af79cd13be357-91f2a9c3693mr258567085a.4.1781773476411;
        Thu, 18 Jun 2026 02:04:36 -0700 (PDT)
X-Received: by 2002:a05:620a:444f:b0:915:8197:4490 with SMTP id af79cd13be357-91f2a9c3693mr258564685a.4.1781773475902;
        Thu, 18 Jun 2026 02:04:35 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0765b69d6esm80087266b.18.2026.06.18.02.04.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 02:04:34 -0700 (PDT)
Message-ID: <7ac67f89-c6b4-4e0c-8eec-1e5c757777ce@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 11:04:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] arm64: dts: qcom: sc8280xp: set GPI DMA channels
 according to DSDT
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
        Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260602081451.3808833-1-zhengxingda@iscas.ac.cn>
 <178040480680.1778078.1165164069560552075.b4-review@b4>
 <bc4644a6c1e30a99f1ed5d967c64ba7f5da77fbc.camel@iscas.ac.cn>
 <178073773007.397244.9871455646149843167.b4-reply@b4>
 <7ecda3d0f91b0d96bcec44ddf485ed5146788220.camel@iscas.ac.cn>
 <178073918523.417326.15121723011916371966.b4-reply@b4>
 <1c33b1dd7d187b17b21b17339a4f1990e59d2f77.camel@iscas.ac.cn>
 <CAH2e8h7y9PivdMh-h78VSqMf8i2vSR2fvVaO0P1eYBT8qgEdUA@mail.gmail.com>
 <bd5ad1b53eb009377d0ee492b0e007e45d36f6a1.camel@iscas.ac.cn>
 <12a8cc4f-3c45-471b-8a0c-f7473cefa190@oss.qualcomm.com>
 <926a0fe9224d73e0f5e3f58f3769c6247b1cabd4.camel@iscas.ac.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <926a0fe9224d73e0f5e3f58f3769c6247b1cabd4.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: X9FUrUg2rEbSXG27vmRRLnUhIVau1vGK
X-Authority-Analysis: v=2.4 cv=DNy/JSNb c=1 sm=1 tr=0 ts=6a33b4a5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=fGO4tVQLAAAA:8 a=ZjbuNi-wRcj-E7w4fbIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: X9FUrUg2rEbSXG27vmRRLnUhIVau1vGK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA4MyBTYWx0ZWRfX2+L02LROBG4u
 sqQbArC1o6KW2iD2q0m7xgUt/EMrWlRuQlboFfpxjQ+S/IzwzE2dw4hjpvGjudwT3ZxYYNZ6wg1
 ZNMS8/o9Hd9UCm9cGTGhuuI4roxBkfs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA4MyBTYWx0ZWRfXyQBjqz8A0/kD
 fFpq+Az1l/0S4aW/wrB7yOLJUqkj0Mz+7W4kgDMhXtmNkcaSU9Dg3U0qMKppKrFz1s2gOdRmapy
 nPxImosWxEPkQO39pyKtFq0xxTDFml1d/aLYjIoOEZWT21mZvvooCPvDhYUTvSKOxS9dOQCaMlZ
 pxXaBnUrqicUsUUdClBWBzht48aJzjC0UV9WeZZvgcSsxOorllX+qKcHTKvVK0OmNr65Xs7Dz6O
 42hn454QkpWOM2Sevc29bApnDERQpmqbsqphRSFMsd1r8pLRAXZSYcYjtwkPBs/1jdfVjqnB52n
 Utkkpbfpxfugz72mRS46Itzv0sKwDySsQZ2RWKqFxn7f97wPUokWSNui74OEsbgI9deoVmlWobJ
 +/OL5esOmD+DdUFd69ZG2qDx/YJ1VfPM1NnVZzc0+DEpehtvJBebyqKPZtoAQntWuJ7gmRBPFAJ
 M0h5+f4Wcev1VylG29Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180083
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
	TAGGED_FROM(0.00)[bounces-113705-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[iscas.ac.cn,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:zhengxingda@iscas.ac.cn,m:mitltlatltl@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AC41869EBCC

On 6/9/26 5:54 PM, Icenowy Zheng wrote:
> 在 2026-06-09二的 14:23 +0200，Konrad Dybcio写道：
>> On 6/7/26 10:49 AM, Icenowy Zheng wrote:
>>> 在 2026-06-06六的 21:51 +0800，Pengyu Luo写道：
>>>> On Sat, Jun 6, 2026 at 9:21 PM Icenowy Zheng
>>>> <zhengxingda@iscas.ac.cn> wrote:
>>>>>
>>>>> 在 2026-06-06六的 17:46 +0800，Pengyu Luo写道：
>>>>>> On 2026-06-06 17:28:35+08:00, Icenowy Zheng wrote:
>>>>>>> 在 2026-06-06六的 17:22 +0800，Pengyu Luo写道：
>>>>>>>
>>>>>>>> On 2026-06-02 21:21:27+08:00, Icenowy Zheng wrote:
>>>>>>>>
>>>>>>>> The magnetic keyboard (USB HID) can't be connected
>>>>>>>> somehow,
>>>>>>>> others
>>>>>>>> are
>>>>>>>> fine, such as the spi touchscreen (not upstream yet),
>>>>>>>> which
>>>>>>>> utilizes
>>>>>>>> DMA definitely. My config is here
>>>>>>>> https://pastebin.com/SdjuyJYk
>>>>>>>
>>>>>>> Is this a defconfig?
>>>>>>>
>>>>>>
>>>>>> Yes.
>>>>>>
>>>>>>> BTW it seems that CONFIG_ASYNC_TX_DMA needs to be selected
>>>>>>> too
>>>>>>> for
>>>>>>> exhibiting the problem (because there should be "public"
>>>>>>> GPI
>>>>>>> DMA
>>>>>>> consumers to trigger the stuck/reset).
>>>>>>>
>>>>>>
>>>>>> Is this still necessary? I checked the fedora discussion and
>>>>>> your
>>>>>> GPI
>>>>>> DMA fix. And GPI DMA is only for the QUP-supported
>>>>>> peripherals as
>>>>>> the
>>>>>> binding mentioned, devicetree/bindings/dma/qcom,gpi.yaml
>>>>>
>>>>> The devicetree without this fix seems to be still incorrect,
>>>>> because
>>>>> with the device tree fix even if the GPI DMA driver misbehaves
>>>>> the
>>>>> system won't be stuck (although it will iterate all GPI
>>>>> channels
>>>>> and
>>>>> then fail to function at all).
>>>>>
>>>>
>>>> Back to the start. You said some GPI interfaces aren't available
>>>> to
>>>> HLOS, your mask is 0xb(0b1011), so I use 0x4(0b100) did a quick
>>>> test,
>>>> and spi6 consumed it, no stuck or reset. Could you give me a
>>>> unavailable channel?
>>>
>>> I think channel 0b10000 of gpi_dma2 could be an example?
>>>
>>> It seems that 4 channels are tried on gpi_dma2 before hang on my
>>> gaokun3, but as gaokun3 has no known serial access, it's possible
>>> that
>>> 0b100000 or 0b1000 is problematic.
>>>
>>> (The reason gpi_dma2 is checked first is because it's the GPI DMA
>>> controller with the smallest address)
>>>
>>> BTW I just took the values from Windows DSDT, which is quite
>>> conservative.
>>
>> So, with DMA_PRIVATE set, is this series made redundant?
> 
> I assume technically the trustzone is still protecting some channels,
> although the system stuck issue is fixed.
> 
> This series should still be relevant, although not so emergent.

So now we're down to the case of the TZ reserving some of the GPI
channels (presumably for locked down/TZ-driven QUPs) crashing the
device on access, is that right?

Konrad

