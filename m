Return-Path: <linux-arm-msm+bounces-118194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iQHhJ/20UGoV3wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:01:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDA5738C50
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:01:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DFg+EsVW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=F4ZFEV+g;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118194-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118194-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 52DD2300CE88
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 09:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 506DF3C552B;
	Fri, 10 Jul 2026 09:01:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0485918E025
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:01:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783674097; cv=none; b=LubBP5SWcEDMYcd3y0ZnPKd0vWwCtzZy2vAX3BKfOX0etjCTQG2eOwfAsxl75DacaXq2idhl1x9NgzGW0GYwnfDIYneWTfOQaxsjO1ulwjI7O7HjR71Z2ZOuoqlH/nmAZlDEdNydrYaxRr44d7sY4PVts6OtRW+sXvlZMc2he88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783674097; c=relaxed/simple;
	bh=2hU5vlqn/46hnJA5UcucEoZwkthop1XHo76k/5pv2cs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dvhkB7GWsDJO4sQUKcFJV7XycWmnhZGNVswfRnM4W/1RxAOmi4p0AbX/vc61Crdl65LDR+PVVw6paGXmCuYtEx3qxIt5XoyAx6R2OzqIHnIPFlV5fqVeu3iybmNvoCBvaa8P0N31tAcXdCCdrTgIw4PUvQ6G+MfUfbMgPKA/gJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DFg+EsVW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F4ZFEV+g; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7e3u8188984
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wuzMI49ssy9A7XP1S29dJe48fWRlUqZSEkKR0Ps53jk=; b=DFg+EsVWXNaVWPc1
	jba1FyX9qMwaMoOQNdh/HUEeqIlOIW9Zs+UvHhgTrHtA53yc/0jcAlEP5Sc7vhdz
	WWtXaBNjOSxz2bjQ1dpkZqghqEArRBMX1u3KII2dp30gZiqROBkzVAGn9pvgCVkG
	6ALHxMFjCsmRpI2ONVsAlmaLcxcIiHMg/OTIYrdTeuvbcKS2t64gVsnwkW0gVK3l
	GulZArBQBrtw6zgAl7YRRA+jePey8M5SAmtcOfUmvyXrHXDy+Zo6nl6+KbJU7qeF
	Dde/M6FiauuaIvvLKOkz2xc4cs/lZZeMea8ZnuR28OHU312GKw+LsubiablzBcSJ
	TB2PQA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeesunms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:01:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381abcccbf4so740638a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783674094; x=1784278894; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wuzMI49ssy9A7XP1S29dJe48fWRlUqZSEkKR0Ps53jk=;
        b=F4ZFEV+gJ/F5hz7N5Ne206gnf0gssTzt8dEdI6Lv80ZDezONPEUokqqNJeweX1PUep
         5IfM2NR4JqNky875USYQEboLz2jIs4ryeXHYSmsTzJXVAtDXWhMd2B4j9+vYdQDxqRRI
         khF/em7jtLGFevrRx0L9V5Nu9JtYE64aYfSosBLQUqLBmuQxa2y5U8YrsSu/ye9AlDrx
         zu4UblFjZSHB+5w7ofXr5x/AwsmT6mCbg1vX8OyEOYa9UQy6COmELdnOQFb6Jbq04NXC
         5ggV1yXxPv8wA1VBP2q63vSi8wReCciCZGl8plSIXIVXphaCF8i9+E3rI6nXDjexZziQ
         /VBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783674094; x=1784278894;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wuzMI49ssy9A7XP1S29dJe48fWRlUqZSEkKR0Ps53jk=;
        b=iLLSdxPzBVZX+Zqd0Vcx0FaK23MeOplY0xU6XHLNiA631bg8seUoGb0iDci6AEzPsP
         5tyzvRwD2odZGK3C3IhKHey56VW0LcjCy5ZJ0MQI4+x1HGHNz1jpQayk8aztOEfRSQt/
         6UNFJcaZ3Zd/7FLlH4viHKDnm87z6n81dXH7TsGaa3HDzVXEEG/3i3ZUnhc5ZBrDESeM
         7k6z7jivmxpm+VANjzVfaC5ftfWrxpjMDGAr8DKXKs21A6iNNUhoUuRk8PXjr2Xzbs84
         6gOJ0OMdbI/njnPock4Hv5obQNUyzherBk6MiWLbXTrlQwOfEyxG6uadlL6QjGhy8WRi
         TWKA==
X-Gm-Message-State: AOJu0Yxz28qOtskxISJZDF8Vw5uNfGfs1eWWIqvnEQzoB0sbw//dABIZ
	3QbwqNJ705O4PNxSkk5j3i1UTRgAV4AM6FB9QgZ/MpTgDUbrxpk2HBFK60G+bxflMrdDpPJK2nE
	NmcJtpWwjkwsdA5xf3xIkJbNzfnA+qDHMzlQdcr0grWjiy7Q+KOM3keeg4qWsjvuoKiGm
X-Gm-Gg: AfdE7cnBQ+YXf9EKmNHVeDQZal7MSmrbXFry9UT+vJPGelVdRelY35WKbf04TtULev1
	+4YezopxiMRbs+kgvt1Qre3EB0QbkNGkkgykWbx1vLkbSmWpzWvJX4+wyIAB2W9D14bZrJKMfN6
	hbG94d/YDEWRgqKt/MzYONwJuLobE+xn2G3Dp/d1yV5dxYMNnSJ6/QFb8OXelTTzetxo/Vu4DyT
	/3LTKcPspnD2Xk1stTKv+5YUSKM/1S01oZZCDy6YVp9sRng70FaAjTCHAy6hELVUcbXESH1CIcN
	G3o4FD2mjQQmKrQJ+mxoprzv0E0uZbbOyLvSCvZzREcLvGVvYzcZg1U7KO7lkPEuiTj4qh9sADT
	PPW1UHwuB/SCSv96yLgxpFDhzNakXHPOmbFtcQXzg
X-Received: by 2002:a17:90b:3fcb:b0:387:e0db:bc2a with SMTP id 98e67ed59e1d1-389426928aemr10826700a91.42.1783674093811;
        Fri, 10 Jul 2026 02:01:33 -0700 (PDT)
X-Received: by 2002:a17:90b:3fcb:b0:387:e0db:bc2a with SMTP id 98e67ed59e1d1-389426928aemr10826636a91.42.1783674093347;
        Fri, 10 Jul 2026 02:01:33 -0700 (PDT)
Received: from [10.206.100.243] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5213f28csm2445496a91.0.2026.07.10.02.01.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 02:01:32 -0700 (PDT)
Message-ID: <ec5017a5-8af7-433c-a011-9ad7c6cd33b7@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 14:31:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
 <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
 <8a3cc857-0b1c-4bd5-a5ce-a564823ca614@oss.qualcomm.com>
Content-Language: en-US
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
In-Reply-To: <8a3cc857-0b1c-4bd5-a5ce-a564823ca614@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: d8WlEHJ3vCR7A6tmxUzrF-z3HXrQfv_O
X-Authority-Analysis: v=2.4 cv=bbpbluPB c=1 sm=1 tr=0 ts=6a50b4ee cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=WBgsH_M69gYJ2YN3IGUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA4NyBTYWx0ZWRfX86klm/iTj+ey
 F6ssLcxXxCnIYT8UV+BNXzZNHvKqv4N9dlipbUaKw4va/HNgklfTDyNZJ660AupasMHOika5KC0
 Zy40Br9rzSainFKl8VbHS0mTsyplh5I=
X-Proofpoint-ORIG-GUID: d8WlEHJ3vCR7A6tmxUzrF-z3HXrQfv_O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA4NyBTYWx0ZWRfX7vCGA/1ZdNp5
 jQ+c6o5jKR+AaZ3ZnxbI/ZjEN9jaEDM2YPbUgkcGDzLR6iiZ73JkP6YWNVtOSiP1+SPKCKtHDzQ
 QygryrLz/D3NnwW147kqYechn/O2RTYo9sCQt2r4mKWKjSEWc04Eerzw2v0n4jAt/xLSg72Ebxr
 Sn4aK8m91zZLIi+txhhIB/qK+LYXSpbQDqKfSfRFGQR0W6De8rhNS4ZE24HBJ9hEWd48pi6B/UY
 Q2XGmzH9JUn4Kd594c3LKnF/mgdYbsj83Ozrs7X52yOht+1NLUDxhVhfMucplFtW2FJuCql9rNB
 HbrayO58HqWCQonb18yVbRDSqq1t3GDY0S21rxRkhRv0nhalzYZL8JrUVGin7solQfjd94ncFBT
 U9g929GA6+tXmXYLipJlDpqo0ZdOis+qzM3PrVKl6MeqS+W1YZpLKHcP82X+LwOgb0Bx5KP3xAP
 LT/Pm1eXrq9bhjYlQEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118194-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:nabige.aala@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_SEVEN(0.00)[7];
	RSPAMD_URIBL_FAIL(0.00)[oss.qualcomm.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[arpit.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arpit.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4BDA5738C50

Hi Konrad,

On 7/6/2026 3:33 PM, Konrad Dybcio wrote:
> On 7/6/26 8:04 AM, Nabige Aala wrote:
>> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
>>
>> Enable the Qualcomm Shikra MDSS display subsystem on the Shikra CQM EVK
>> board and add the DLC0697 MIPI DSI display panel node. Pin pm4125_l5
>> to 1.232V with regulator-allow-set-load for DSI PHY PLL stability.
>>
>> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>> ---
> [...]
>
>> +	panel_bl_en: panel-bl-en-state {
>> +		pins = "gpio91";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +		output-high;
>> +	};
>> +
>> +	panel_bl_en_suspend: panel-bl-en-suspend-state {
>> +		pins = "gpio91";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-pull-down;
>> +		output-low;
>> +	};
> output-foo isn't necessary, the panel driver will assert it as
> necessary
>
> Konrad

Ack, thanks for pointing out.

Arpit


