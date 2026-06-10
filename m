Return-Path: <linux-arm-msm+bounces-112446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OhJoEjxVKWqPVAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 14:14:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA83D66928C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 14:14:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=k9ZQfilt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=d2NUtxD4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112446-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112446-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97D47322CF9C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 12:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF6A404BD5;
	Wed, 10 Jun 2026 12:12:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752363DBD76
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:12:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781093559; cv=none; b=BU+j9CnlbQGz9HoT30PpmEFwTK5tq1bBwyeNNX5y4kwtnFbg7fj0SJromSvuC7ycQCV/9MTth/VToXZGhYmsIyvpNNJG8X0PuPbpwGrqUsmHWQxp7DvLz7+VRoB8imr2ByaUVraGwpvPv1+qZhh8MfsGn73eyTv5OjPY8rL1HKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781093559; c=relaxed/simple;
	bh=L0qZU6i34qpv+dgZCZSCEzfepQSubfCh6BsSq1iUQpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J6uictEX9OedSdUbshnjzNVM0ZvHaef7HQ1aWxivW17wNrdCizjjBtCwfmsdE3fDQn5xzV7hc1b5qjrumZiC3OQclxte5QIkIbcSgt1oj12Gz/dcQcv676O5AHywRsIGe58tU3q+nhQf1W1n/j02HlhfOGoZ04ZP9bE1jX8JhQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k9ZQfilt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d2NUtxD4; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBlcp1134988
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:12:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xGkUpLUxzhuoLP0OdwLiPqPmRiRkn9HrYAcmu30w4u8=; b=k9ZQfilt+a71nvjj
	91Pc8x2Qlq0RR6NQrRuKrjPzV1jVBeV6mg1HL0nnQ8/WIrnlrEsIn5RCFBVYpnkB
	xzpJiklROibXTgk5x2oGjRhBw/AuYyvx9NXObdWNcEdwto2h8VMU6SaZr2WsQC01
	smdtJGens3ry8VwxsbQHQB3vVjD9s11iq/ancHDAlsmgOXdsYcoww/EOivOzIQVC
	nQzQ3FMMO2GCC7XOoc1K1qZPQ60ceqF1M+iSkmC6pkJ72AQ1/KiK6tA/F+0Zg8YT
	qacFNvA9Utd5uGqMoMP6zTX7oWm3GzJL9rgExip3r4uIloCls+0adbZEKvVGlz21
	zYcZ1A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0m1sqa5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:12:35 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ccd6375a5cso12376666d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781093555; x=1781698355; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xGkUpLUxzhuoLP0OdwLiPqPmRiRkn9HrYAcmu30w4u8=;
        b=d2NUtxD4hhBfDAPqXU7C/PL2zc5LE0+JSYQP4w1Xggl4SaPx1J+kQCfNzxjzf4OW8Q
         DZv3qaxhDZNNrRBBPfo8ZHvO0Ys8cSpHeQdXnMghPRZrvP7YDw6cyvXXgomrsyEmBeLe
         T5AWM9CUldVWxyDxFXlKa4vonrNoIJWmkZfLAqmHuNT5lQRiDLxl6Ej4FhZyWXpyicHr
         lCyan/nubIgYGjyWB4Sz7jXUdqWDkrln3M+zHRsf8fmgSkhoN5D0Gxh+KCdIFrafgGLP
         utmddDmMpoxB3ep/PpFNw751j+OdGBnN7KbLue2LgePs1aNQendBiGzmtnXyOyrzg7Ph
         RJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781093555; x=1781698355;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xGkUpLUxzhuoLP0OdwLiPqPmRiRkn9HrYAcmu30w4u8=;
        b=ZUUumHgSVH+O07klNBVORSh2ujVJY6v266x4DSNPh67O4lw5QBMcB6sgFhE7DoKvzA
         GYMHRSctl1JWRaddikv0Ge86QOQrycFLsegQE0OH+KzDAYVymz5t5/Kpa16yvzg2Ff5u
         z+b7VVBXnb3VeiFTIQ0bDySfN2w+DC2k46KqJIOIyCEWknd9cK6Wo0shpunXAKd/ARHD
         nIG1ZGUtHeErsmo6OIB4tgLEMmCRRLy7Ff07EwbxM8SVMWnorAGtSMn2pP13pBMet40z
         Vy3tOwIz7aMtJkFNRVbU/pcWcJf4KWI76fyCYLN5VirMAEpcHb5DJDYAuilbi7jveA5a
         Jltg==
X-Forwarded-Encrypted: i=1; AFNElJ8do8Fp7jptiTypWUg2wVqE90yoR+Aj4osSxhCIw3fNy9ylXjtz+MH8I7/Oemc5Jm6XNTbC7bUc84hDmq2r@vger.kernel.org
X-Gm-Message-State: AOJu0YxQkRGFOR5+NXRgsjjgE/6+e2VidnQzgSQHKpY8kEKcGBE8hylI
	LyJJ3c1Sn4nSLUrFUJovSKjq43uqdwfpNz6keqlUX9nOI9V0Dr9AQ9OoVzbxv6sxyQcWucjPHfE
	JvPR2r3l72PdCCd6BqbrJ/auAhdaCEEql5RRPOnDjTQ5FGFAWlBGX2yAJ/aNiBg2vp5Gd
X-Gm-Gg: Acq92OFm8th/7nXjU+Etk3/tAqZ+4DpM10UniVXxpUdwBfeWW/UzRJBcNjLT0bFRxki
	dp3z+IFTGblZjwq4hCTAS0dSgpBDG3RHVidy1iUEuXti5J2kLs4lcqqSGePVEq0Bqh9maYT1JXC
	iTJ4lFKqvh6HvVLwIV+qiF+DHom1x7Y00ZEMFU7k08iNQz/8eIyR422839bIlckyhr9zC9WIldg
	ZvKZUHuWYPq0PkLehnKC3zBQX1Drk8rv3xzHS8nr69hMPLNg8tYcWPoGskQ6RZKAT/g2peg+N/h
	6cETBvNoO05CiKuUP23MmbeT03js825LYA4n+KnB9KSJdmw9NdheRkdNb1qdhFWjtsJl6ewBF05
	25wOoyMreIzUU4vkUpqG0O1t+c8vMiAOYW3TcGOBOk8pGCHwB/5hVvqQf
X-Received: by 2002:a05:622a:93:b0:50e:5e6a:c7d5 with SMTP id d75a77b69052e-51795aa8074mr209898721cf.1.1781093554601;
        Wed, 10 Jun 2026 05:12:34 -0700 (PDT)
X-Received: by 2002:a05:622a:93:b0:50e:5e6a:c7d5 with SMTP id d75a77b69052e-51795aa8074mr209898381cf.1.1781093554071;
        Wed, 10 Jun 2026 05:12:34 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0517721e5sm1193637566b.9.2026.06.10.05.12.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 05:12:33 -0700 (PDT)
Message-ID: <841a54ff-6287-48d2-a513-a7442d624ab6@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:12:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: arm: qcom: Add Lenovo Yoga Slim 7x Gen11
To: Krzysztof Kozlowski <krzk@kernel.org>, rob.clark@oss.qualcomm.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson
 <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260604-topic-yoga_submission-v1-0-57c70c23d0d6@oss.qualcomm.com>
 <20260604-topic-yoga_submission-v1-2-57c70c23d0d6@oss.qualcomm.com>
 <7a330941-8715-4523-9f39-10b57586c69d@kernel.org>
 <CACSVV03J7Y4-ADRNE+4qArqsWvQZ3qmTc04r7vmY64s0qDYFkw@mail.gmail.com>
 <799fea04-e7d0-4184-b9ae-4cebfdac38d5@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <799fea04-e7d0-4184-b9ae-4cebfdac38d5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDExNiBTYWx0ZWRfX3fSxkuxg3tDM
 q4xjSV40EhYmACYF2hmDa5td9bKjf+W2MRzElsuR3RfHe7x0q63cel+9tCTf6EAEcShkXlBAQyK
 DaFSm+ZnUGRzRWSJalFRSWnfEw7MxiftDtznXFFwTxHPGSqvJRsr4WtpKL1WIXbMegBxlBr3ipQ
 yrfmzgOs3wlOvukmYdoVtW4QiiUsqZXvJq19MqvSFf2JtlOg+UGERh0rlk8Qa3yKPZMA0j1KMQq
 dC2ngl4vhiW0EEKTEtekhAQicJBDasZRX3GIgmR64+GEAxo96Bgh4JPU3FOSpDOjbv4u9+GjJI7
 1n5fNmXinUYlqlKDeXuLu++Bx/EvyTs9/3ZCpplf0s3e9vSWYBdtT+nHu8FuHSPHbjMNE3lpPn4
 HufGAIG2dB71uxDLvxF9RxvyarjayAwgElbfGuHOnru9GyJO6KP9gmOdqgmkyPBab+/AAFMiypR
 cSDuQdhxNM9ofTwe++g==
X-Proofpoint-GUID: tQ7GRR0vxJi3Lq7ce4LHWU0yVVExr7QS
X-Authority-Analysis: v=2.4 cv=UdJhjqSN c=1 sm=1 tr=0 ts=6a2954b3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=8k6WQxmsAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=8WJLHc3ceWcLwtWtDxIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: tQ7GRR0vxJi3Lq7ce4LHWU0yVVExr7QS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-112446-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:rob.clark@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dianders@chromium.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,chromium.org,lists.freedesktop.org,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,lenovo.com:url];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA83D66928C

On 6/4/26 5:18 PM, Krzysztof Kozlowski wrote:
> On 04/06/2026 17:13, Rob Clark wrote:
>> On Thu, Jun 4, 2026 at 8:09 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>
>>> On 04/06/2026 10:06, Konrad Dybcio wrote:
>>>> The Yoga Slim 7x Gen11 is a Snapdragon X2 Elite-based 14" laptop from
>>>> Lenovo, featuring an OLED touch panel. Add a compatible for it.
>>>>
>>>> According to the spec page [1], there  also exist other variations
>>>> (based on the Mahua SoC and/or with a different type of display panel),
>>>> but those are to be described separately
>>>>
>>>> [1] https://psref.lenovo.com/Product/Yoga_Slim_7_14Q8Y11?tab=spec
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> index 50cc18a6ec5eddaf48542b85387c2d430cd4721a..fca3d180489d4cd3eb2726a722f15febe44f03ad 100644
>>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> @@ -68,6 +68,7 @@ properties:
>>>>
>>>>        - items:
>>>>            - enum:
>>>> +              - lenovo,yoga-slim7x-gen11
>>>
>>> I imagine you might want different panel variants, just like T14s has
>>> LCD and OLED?
>>
>> I expect this will be the case.
> 
> Then better to prepare for this now, otherwise later you need to change
> bindings. If unsure what other variants are, then at least make this
> compatible panel-specific, e.g. lenovo,yoga-slim7x-gen11-oled-foo-bar.

I took another look at psref [1] and there's only OLED SKUs (today?).
There are however, two different resolutions available and both can be
touch/notouch.

I don't know what this will entail - if the panels are both samsung, I
would guesstimate the same driver works for them (and Doug was against
adding new compatibles [2]).

There's also different SoCs (which will need another #include in DT to
override, sorta like hamoa and purwa models; they seem not to be
available in the store rn, but I'd assume it's fine to just rely on the
SoC strings in the compatible chain to differentiate them.

Konrad

[1] https://psref.lenovo.com/l/Product/Yoga/Yoga_Slim_7_14Q8Y11?tab=spec
[2] https://lore.kernel.org/linux-arm-msm/CAD=FV=XBn78eOC_zG0S2U-W3whrVYEpghKF_WgX+3zpUJ82-5g@mail.gmail.com/

