Return-Path: <linux-arm-msm+bounces-113385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nXT4BCI0MWrKdwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:31:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B30D68ECD3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:31:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oHqSze1r;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bVr0kYni;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113385-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113385-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92B2C3198577
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07DB93B9D97;
	Tue, 16 Jun 2026 11:28:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E101C84D0
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:28:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781609291; cv=none; b=ZpzsIDZbA2VEUNBrL2w3UaT26C/36Gt/FFh2lK5aTbWrKMJa2lv0N7ISyA2E3hevr168iCwBrQ4UYR2J440HMGAHLg7w7nX5qWR6HXojNISKccD7M201yk8QlpB1SjuyQqOVJSi1PCh7lxLGBNwnJsZNQE5BW6B/eAchMpRR/Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781609291; c=relaxed/simple;
	bh=S5DGeSiWBHQERMNc2Ho8UJIoJGYQx8ljeq0erLmXIjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wp5aUT0KAZpObyZOWH+TwmuGVsYnhBXbQaqJ3KcWEe3BvTEj12ALT7Tvng42iUYmB9UGsIobYkUvpK02HGL6sA0KY4xvw9xWcRZ1FvdtCBlD4JiWDsnpvFrB9gRWaU8MZH+lV8JjgOtuPLmgMFBvrEm9ThPQ8T2AlMDA0OhKyso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oHqSze1r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bVr0kYni; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GABEul3223740
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hoJLZQD2EEa0tSnrFDi3f0vHL8Y+Bwo3kq935KpPr90=; b=oHqSze1rIzdt21dn
	YARjGJ7Ge6GN7U6HVfjZy2vHVJeAxyKgq3FYXWZBAZg/2vNZIniBBBljt8IoXEBE
	ZIUYgwH5fMXt2gqHrdAlAtV8afEj7XF8Ekmio31bTf9M9zAmF41SdpLkoD9lRBm6
	REvG/EFqZNWB3J72tMFwA0x093gJwCkvU5klHskta7YYFkGLgHVhLMBblx5OIKWt
	1V/lismEgC9AhJSWka+SFoj7mRgfyHmez/LGYVT2d06wvNTHogwRDch+WRtXNlQI
	8jG/EHEqwtYVSpKk057nY9ArVkjeP+LcpvY7y9mD62knoPDdejRg4YbNDxlnqDqm
	ZBOM/w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1yss0eb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:28:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915737aaf0bso23763985a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 04:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781609288; x=1782214088; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hoJLZQD2EEa0tSnrFDi3f0vHL8Y+Bwo3kq935KpPr90=;
        b=bVr0kYnittuQ2iNWC3TUXbdE2VXGENT/yBCPZNaZUh+Pue16InM9xKEJlIrRgQcKIo
         fwVXFd0lRvn8Vg6KPpaYe6xnbMRdp7CqxN+pTkF/6yRh2cRwi0LvtxPlNt+pzVcceumC
         p2bJ5sryVjN4OqhTRgyGS/pIJijav6UMpRppyq0CuVZOoGTqdQRrFNcQHPDK3MF5Rmaq
         Sxpsm+IA7ewL4Kx0ZpHh4jSLljHrS3oOwRkXcxmOuRQkdAiIZQqGIDsKt9oye15xre2m
         U0IDPQVgEKBFV4Clrx6hTwxwELEiZ2+mjP5A+6B/qSmGFZBBNvYRbsWq61hys14GX3vM
         m7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781609288; x=1782214088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hoJLZQD2EEa0tSnrFDi3f0vHL8Y+Bwo3kq935KpPr90=;
        b=magn+7axmmjOKesp36+ShqOJ5QTHYa6hULaW8CeIiFb/T5hDQNzFWZiTK5J3gJ7w6V
         Cvu4wyXspemojxJycMiHplUXo0ot3frVkNXK+n3Kj3n2w7+bqUdOglhtbCv3oDCMKhx7
         t4W/ew7x0lkT3SPXlaLJFweVMeD3UoxB9AAyDwapAN14ZWDEXgIrRkYQqyNR6VoJwZFw
         0r7JEnI2XsOYxNOvIjVzceKt1N3d4y58DU8/8jNX5oIlcHKxlW5u5ApbyJibECpsNo1P
         xGQV5WEg/kp1QY8EKBxtD8W2+gePP2Vie/7eJbuBTQb/m3XIHuLNMskYjcFTqpdDOgp+
         2QHA==
X-Forwarded-Encrypted: i=1; AFNElJ+bCu03SWG50bpbjyEWbyqKObX54woFKlIOxPF31Mx/lusm+9L/z33b+N6Ecty4BFKdg2sEtWrR3D08vwIx@vger.kernel.org
X-Gm-Message-State: AOJu0YweD9iEZMmwv+Jqg305fVQZireKRVg+smXukpTmtUjNmX6zH0xK
	rBVLPFsVj3ARJoJgMOHgngwGr9u3rjsJ10aLKZg44fe/gBu8Sbj9cCjPvzVrXh0eiSsnYOULKXu
	Q7ZM0qal2DxfBBagL59/eUKw+pL8ktGO47GokFU4A+RPBiLdbaLa2MbRwnMWeNgJI9nkG
X-Gm-Gg: Acq92OGSg+ZHWfBZMfPXXsi+mOZaOILGmq2idHNKOnKKGliWhJ+KtMAVSrIAydXlrFS
	9tkwxujOT9Mt2J3Azv8mB6VgHtHiaZHg+YCSEOsVbCofpCDrqfa7ytxz9pawadpAO0SndU4H2n5
	NzA8TnWw1VjWewqZSKB2tLFXGtW/cXRbQCGQJJy+e3Ki0aqwFJbMd4Vks/uuq25Rh+pJeC0d9kd
	eWqEnJQSundWlFp0w6LIVJxDahmCNydITLv8/qJ1eNoqPaACNE9fNFkWdSfb32kJktf1GzJ9Xam
	ygUMYMXjHf5kOoJdvvm8ypHh3Y9x9kaF/mB3mn87c5YYdwtYKPla1cM+BYk9uGJhI9ZcKjEY2Tv
	oAKMjtAwAEb/3wM+aL161+vfqL7nV9lJ73pmCT+t2Y4ipiA==
X-Received: by 2002:a05:620a:40d1:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-9161bca6345mr1744419585a.4.1781609288141;
        Tue, 16 Jun 2026 04:28:08 -0700 (PDT)
X-Received: by 2002:a05:620a:40d1:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-9161bca6345mr1744416685a.4.1781609287724;
        Tue, 16 Jun 2026 04:28:07 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb522167dsm628573766b.25.2026.06.16.04.28.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 04:28:06 -0700 (PDT)
Message-ID: <d6da3d13-a8a7-4dbf-b89d-06a1fbe41260@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 13:28:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: arm: qcom: Add Lenovo Yoga Slim 7x Gen11
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, rob.clark@oss.qualcomm.com,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260604-topic-yoga_submission-v1-0-57c70c23d0d6@oss.qualcomm.com>
 <20260604-topic-yoga_submission-v1-2-57c70c23d0d6@oss.qualcomm.com>
 <7a330941-8715-4523-9f39-10b57586c69d@kernel.org>
 <CACSVV03J7Y4-ADRNE+4qArqsWvQZ3qmTc04r7vmY64s0qDYFkw@mail.gmail.com>
 <799fea04-e7d0-4184-b9ae-4cebfdac38d5@kernel.org>
 <841a54ff-6287-48d2-a513-a7442d624ab6@oss.qualcomm.com>
 <uieb6ukjokwnppc5zfr6bjychqsnpikwmiy7j7dmt2kgk7k4zi@2stv37ijv36o>
 <ac191a18-bcb4-4fa5-a179-b72a6ac928cb@kernel.org>
 <20260612160519.GA1118842-robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260612160519.GA1118842-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: b6H_ZGgwoIXHMX3jM2iO7mJn6tuUGgEv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDExNiBTYWx0ZWRfXxmPofHYlTIxh
 M1+DCgeKTkTDcIPoo0P/jskwyjYMy4Lf8/Qts8ZaqS0RBg6V1xuCo8ZQdVROAaQGGJ+Q1VKr75o
 DdgHWptXkINf6+HTf7k3dR8E0CEgNWw=
X-Proofpoint-ORIG-GUID: b6H_ZGgwoIXHMX3jM2iO7mJn6tuUGgEv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDExNiBTYWx0ZWRfXzA0hDI0Y396/
 XOompx2X9so4wVGHbYadLIBP5M4xlIiYpvpDW5TEBTCzgR1+ymwRu3DdKe9SKI2PD2La9xVgeUN
 4CcgdiFFtsJXh5zq2DOMjslWg86fOmwq8ysXMlgRag+xilMHrBq05KgJ11ZpJH0ErTbmHy+wu0G
 AH1K14tPJuL8mIHikPO2Fyv9uf3bzFkwmj6blZNXVJ8mDm+2UjokZvrS7ZWsnL98VFH7IYmy/qr
 twVrApj0FXQ73z9sIZpWbrBXcbGw0boyEDJBQwREaI+Fqcep4fa8i1St3bO+N7LGkzkl47xvJnA
 wozqXnmxyPOXBABrCweZatXzZUQVyWr7up4cVxDMuMm8jgVkColVsUJYol31eBYu2WRAd0O9Z8N
 u+0Sy5A0dh6Uu7/vsl7sBTuN8EXf9YmQBsGNztEgwjknYS9kZghihiEg1Yn6eCaIlV4LZ+VYCCV
 WkaF7jgF3nSAkBc+lyw==
X-Authority-Analysis: v=2.4 cv=JJcLdcKb c=1 sm=1 tr=0 ts=6a313348 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Kc-3O7wfv0iHM2_tCFYA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-113385-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk@kernel.org,m:abel.vesa@oss.qualcomm.com,m:rob.clark@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dianders@chromium.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,chromium.org,lists.freedesktop.org,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 8B30D68ECD3

On 6/12/26 6:05 PM, Rob Herring wrote:
> On Thu, Jun 11, 2026 at 03:48:15PM +0200, Krzysztof Kozlowski wrote:
>> On 10/06/2026 15:31, Abel Vesa wrote:
>>>>>>>> @@ -68,6 +68,7 @@ properties:
>>>>>>>>
>>>>>>>>        - items:
>>>>>>>>            - enum:
>>>>>>>> +              - lenovo,yoga-slim7x-gen11
>>>>>>>
>>>>>>> I imagine you might want different panel variants, just like T14s has
>>>>>>> LCD and OLED?
>>>>>>
>>>>>> I expect this will be the case.
>>>>>
>>>>> Then better to prepare for this now, otherwise later you need to change
>>>>> bindings. If unsure what other variants are, then at least make this
>>>>> compatible panel-specific, e.g. lenovo,yoga-slim7x-gen11-oled-foo-bar.
>>>>
>>>> I took another look at psref [1] and there's only OLED SKUs (today?).
>>>> There are however, two different resolutions available and both can be
>>>> touch/notouch.
>>>
>>> If the other SKU doesn't have touch, then you might as well mark now this
>>> one with touch suffix or something like that.
>>
>>
>> If you decide not to have any changes (new compatibles), then at least
>> please document the above reasoning in commit msg.
> 
> If the difference is just the panel or touch, then isn't that captured 
> by the panel and/or touch nodes?

We already have a couple of DTs for laptops where the touchscreen may
be there or not, with the additional hid-over-i2c node defined
unconditionally and it works out fine

For the panel, it depends.. If it's another "Samsung ATNA"-class panel
(which I would guess is the case, but can't know for sure), and there's
no other changes, then it would work too.

I opened the build configurator on the Lenovo website and I can order
both kinds of panels with both kinds of SoCs (X2 Plus / Elite)

> OTOH, if it's different firmware builds and generally treated as 2 
> different devices, then different top-level compatible is probably fine.

I unfortunately don't know the answer to that question.. 

They all carry the same model number on the website, it seems

Should we go forward with an optimistic, single compatible for the known
variant ("lenovo,yoga-slim7x-gen11", "qcom,glymur") then?

Konrad

