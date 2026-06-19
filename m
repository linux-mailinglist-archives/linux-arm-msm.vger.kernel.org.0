Return-Path: <linux-arm-msm+bounces-113838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KB5YHjc4NWqOpAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 14:38:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC676A5D05
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 14:38:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Ebjtth9s;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kiSap0W7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113838-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113838-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E56A43020036
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 12:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC162387348;
	Fri, 19 Jun 2026 12:37:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7634237BE93
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 12:37:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781872678; cv=none; b=olC9L45+avtj4c94mC2VyQKev5mMg5sT4kGRGqwbKs+LdQwqtAut5uX/AlI/dITLONqbSPfoGkCvz3MmNMLN6uEiNxDx3zHud/f4U8ETBkosOw31ayYqA7yAd5/f8VwdvAaaoJPFP1q1B8P0eVr7qa0/TUa2JA6qCNwFDEbz6ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781872678; c=relaxed/simple;
	bh=s91aBWIbD5YVObth9ob5saZK1S2OG/vt+ArfeoMThIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Svv2NPmPM2kSxuFUjU/Okpe58oGn01f+wDoJdvnBXu8Dlm3cE30hCL7fyaXTyzzPAwv4jlU8RpBhw/EZiDc2zN+VVKB+F2hPbUAq/QNliyWHwiGE3ij0AUrThyWAUVobtjzh2PkemLFKLuh5SLtcMhZv+r1SmUedmn9DRTOHdRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ebjtth9s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kiSap0W7; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JCZoRx757556
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 12:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tH+KT6o+4/EXGYtJ8mk55q/zmuMFzZSdiVFyox+CC2o=; b=Ebjtth9s941BEZx5
	94uCJeh2tCqjIeQZz1ptplBLLg/0C18wtKYH7CNSAv5Y2KS+9HIj/hsNZLDbEnTh
	UWj12zNl8PYpSLYhCkSm01nMWaj7Wrz5a6A2YbKAGhHZu2rjdCgG2NT/M7ZT/WNd
	nNXJniWFlXsobOK6ZXZbDxdzU6p78wpN7sMtux6OfOAC/XR1TEOFT7hq+w1LMSsu
	ATyJ4rrTpbTQtcIz8jKoq1ZXfyClgBQbEoTil+A46vmCm3qo5S4EkiPpcPuUA67Z
	6DHrp13/bOmCMMHDRaX8uiEDjnC31OxgSIACuTBXM9MsKVf0Dt9g5KVp3GA1GIaS
	VkLgcw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evm22bx3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 12:37:55 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-966d2895042so96412241.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 05:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781872675; x=1782477475; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tH+KT6o+4/EXGYtJ8mk55q/zmuMFzZSdiVFyox+CC2o=;
        b=kiSap0W7bQ9+E6ISbdEUAnoxVz5Z0cJ4ILlcZsVambwDCZ1BBYmRQFP2eWhP7eFVR/
         t5qz6+x1DlCErasX5xIrnZIAxgfHE19957bPBektb9Ig0dnnTQSFyqhPqCkQKdpKTjdE
         vSO1xpLHwfKbjOJx9ySVG4I8VGtkO6gM1E6WCLH6TbJvPzAj4vM9aEV+W/axIM/GuXrQ
         qJHENtgv/ZF3PGyl5aSd/Rj9owiGyLv/zjv8W7JG48VKHHgWToV2tvo0CM/eJJD7zVZP
         FUGPrMgBK8fXBqWb/zoG+1coKfpjaLtrBWB/pa+2GKjrgg+pfpFRxleqwiJpXqFC/x9l
         cIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781872675; x=1782477475;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tH+KT6o+4/EXGYtJ8mk55q/zmuMFzZSdiVFyox+CC2o=;
        b=FZt+65V71+ldRQjI6k8fTVu7Tng5GZQ0hkVSs8XQxA2IP39lNUC72C+U5UomY0UHb8
         eC8Gln9F1GNkWLjtv33cYq2t1ZuD4rtxiJd1nWdmL2nGICh/fLLQydjPF5YCanXLRogh
         BkNc982UmqzCrYcWxK7dx9tpIM0bXSSblFiO6kkUwEv5RSsuwNt7cWoR44GcLI6PvqaG
         BR+Xm0PWeiFTEvqjxl4wdqXGIaUsrQiJWZzO8uzmNHg8XzNekTRljVRg1PCZT/28a3BI
         LdyRqAxMx3Ev3RSbqQi1Z65PhwrbHGLOBVMxLR1/rdkzISq7+7rBwnUgrzyjKxEPmnMc
         qTXw==
X-Forwarded-Encrypted: i=1; AFNElJ+G/R2mKQNK9kmhbxJ/mfEEtZCoM8Xt4hN6ru0uN8WeBa1ghG4TKcJb41qerWbulHrPhM2zl4982c0pxyDe@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5E5sL32BzRFQ7Fc09faAw/xPFb4SXm7fcdCPB1J0vTOY+t77q
	56HJBN5V7kgPMhEpeXWeqyuIEyoDcxNBoDQKTH+bDue0EzBNRHEvUZnMUC55YQovQrYPYE9e84K
	IMYANVXIQUwxUfyAfaxNV9VTAxdjMJIvzASoUy8yOTsNb30fR5ZrMTj/rTwHUdpuMNjhI
X-Gm-Gg: AfdE7cmf7ZLncPU0RvrZR6OmRhE+X6WxfaAW2w/c4uX2Y7W6bP0ydiSLrKYzwKsSPSJ
	zl+Rgj6lUGvPBxucPbtawn7ax7mRtzdmSm6OSat/lAvf3TrX+UdYnlGCFefyPnT7UMFqdRhlBzM
	oLqKQmK/sjrIEpovRTdfXJHohKuOqKZp2Ey2ZK27C4iB4Yq5jozomFJY5iWP/GzSl6XaOgTY2N2
	ebd1lbZCTOsePOK9zyQ0ntAWtTEFD4cx/hLf0KeZh9mKa8dtctAaS6+Tmx12H089wFnDQ0J8Rdi
	GK9GPFnd1zrJfW11K0zRdcSooofPohSSdk9CFeJ8dWgtyioccnbX8J/TWKi6jtragNb6Ov3OTB0
	b/CTZOvf//6io8NpmHmDKsqP2Bpdi0yhESdw=
X-Received: by 2002:a05:6102:4415:b0:632:509b:e399 with SMTP id ada2fe7eead31-72a03b8d80bmr809967137.3.1781872675114;
        Fri, 19 Jun 2026 05:37:55 -0700 (PDT)
X-Received: by 2002:a05:6102:4415:b0:632:509b:e399 with SMTP id ada2fe7eead31-72a03b8d80bmr809953137.3.1781872674575;
        Fri, 19 Jun 2026 05:37:54 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0a9a1568dcsm84124066b.51.2026.06.19.05.37.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 05:37:53 -0700 (PDT)
Message-ID: <d1437b71-402c-44ec-a193-8296016575e2@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 14:37:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <514cf213-5778-45e1-8d70-d3fe27991fcc@oss.qualcomm.com>
 <7JNJ4dUNz4ennJ5dkzhfLSuVo72JpfZAbprICPRqlRYnSzVDJw6x3h-1nESd_PK-3us9f1V3qOiLiywsTqP8vQ==@protonmail.internalid>
 <f01c0e22-4e5c-44e7-9ea4-4bc8d53aea2e@linaro.org>
 <29e8491f-20e8-4082-8943-66bee7e3af1d@kernel.org>
 <5ca611b1-0663-4975-bd56-b1343851e5fd@linaro.org>
 <83c12dc5-fcb4-4089-9917-9f0fcc4f940d@linaro.org>
 <1b107aca-a857-4e58-a763-39c82af67747@linaro.org>
 <67b6f6ae-bfca-4afd-adfb-6ec1741105d8@linaro.org>
 <335238ae-c476-40e6-8639-44258fefe988@oss.qualcomm.com>
 <04479989-8aca-46bd-8153-1dd033f1fdd5@oss.qualcomm.com>
 <qt2d2anvwlubaicwhw3rur7u47v4swqbctapcw5qek54f2yzdu@ljd46avkfgy4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <qt2d2anvwlubaicwhw3rur7u47v4swqbctapcw5qek54f2yzdu@ljd46avkfgy4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YN+vDxGx c=1 sm=1 tr=0 ts=6a353823 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=xgdi4esuw1k_wJbNTHEA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: AtfTVeT465MTYdGgdqA9gaWr1vYNKAgH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDExOCBTYWx0ZWRfX3HFHsDGYnw54
 Rsw6H4fUsK2zdOY3KgTaSOyMSS9zCfvnbvrUKFlftGa0riYebTCXYAjVoSX7HHRF56sTo+u0Zdm
 KOU2iDyb7V1kG6mAe9fGqlUP7MGdrB0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDExOCBTYWx0ZWRfX6XufZUNTYq2Q
 daNJWUIU5t+F0i5m2QjI7qCvXiJdm2VqWlkGlBSnrvCgwFlW6mg86a0MU7WyWsV17fcY2SEjO7U
 Vex5ttSWEKxIJrnZ91PU4gqgnQhZLkAGmoIfKXpB5JxuhT5XglCQuUG0e+GvHU2RBTKgTrHsDtX
 g7nKWsUY8v5UBHcV+E9xJo5I6p8Que8QbqjRifNS8JSfoFhb1OiNK/Tzfx/NhkVOE50heeFiSWH
 WpeNb+yuRHNHtseTb4dUH2iy2s0gupzGM8wuWMQq4qk6Tcxxv0o/K3zkqwX+phKR0oMV0G0+YFa
 BErosawceORKF9u0T3no3ErlvjfnpSERwHiRpOVP9oAzyMDJYimviRfhthH+exYF5jS0p9Ekalt
 f/pkeqndtKw6ZfLMhMPbWaDJWEXYqEyonMRgEeN+MHhqk4Fj0N/4r4KSHvliJyVucHprkn7RWab
 LcqRNYlWNbpwz25YYkA==
X-Proofpoint-ORIG-GUID: AtfTVeT465MTYdGgdqA9gaWr1vYNKAgH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113838-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vijay.tumati@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:bod@kernel.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CEC676A5D05

On 6/10/26 12:30 AM, Dmitry Baryshkov wrote:
> On Tue, Jun 09, 2026 at 12:20:56PM -0700, Vijay Kumar Tumati wrote:
>>
>>
>> On 6/9/2026 6:56 AM, Konrad Dybcio wrote:
>>> On 6/4/26 11:06 AM, Bryan O'Donoghue wrote:
>>>> On 04/06/2026 09:46, Vladimir Zapolskiy wrote:
>>>>> On 6/4/26 03:30, Bryan O'Donoghue wrote:
>>>>>> On 04/06/2026 01:07, Vladimir Zapolskiy wrote:
>>>>>>> On 6/4/26 00:18, Bryan O'Donoghue wrote:
>>>>>>>> On 03/06/2026 21:51, Vladimir Zapolskiy wrote:
>>>>>>>>>> Actually, one more thing, Why isn't TITAN TOP GDSC here?>>>> +
>>>>>>>>> If CSIPHYs are true subdevices under the umbrella CAMSS device and well
>>>>>>>>> described as subnodes, then likely none of power domains are needed
>>> [...]
>>>
>>>>> CCI is not described as a child of CAMSS, here the situation is different.
>>>> CCI probably_should_ be a child of CAMSS given the design we are going for here.
>>> Yes
>> As of now CCI is an independently usable device to configure any I2C slave
>> that is connected to it. If it is to become a child of camss, it should be
>> self contained, as it is now, and camss may have to become a simple-mfd to
>> make the CCI independently probe-able? In which case, we may want to follow
>> the same protocol for all other sub devices like PHY. However, if we do not
>> have any requirement to use CCI independently (who can confirm this?),
> 
> Uno-Q uses CCI as a semi-independent i2c controller. There can be other
> similar designs.

CCI still physically lies within the camera subsystem and needs both the
TOP_GDSC and the AHB/CPAS clocks to be on.

devm_of_platform_populate() will ensure that subdevices will be probed.
simple-mfd is essentially a hack/shortcut to call that function for nodes
which aren't bound to drivers (e.g. because they represent something
without a top-level software interface, which is rarely true and why it
seems to be discouraged)

Konrad

