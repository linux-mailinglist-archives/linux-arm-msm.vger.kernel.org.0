Return-Path: <linux-arm-msm+bounces-110972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pTHTI70nIGpDxwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 15:10:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 83340637E90
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 15:10:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZDKKye9W;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LzaEF2Eh;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110972-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110972-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5074304891A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 13:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 616AE480DCC;
	Wed,  3 Jun 2026 13:04:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FFA480327
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 13:03:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780491840; cv=none; b=tDn7PUxhYyi8ltkIaY2lkzF6FiCxbWxXcz7fBQpip4qPnsrW4Q9I95QtQ3yfACj8t2o3gfgxCla7CviSMlxVXL6rSTracfpX9xb03rUIady71jmv0JZlAFApmV+DE226zqJO852+7IIe8h2yRaGMj99tGqdA5A63IUcUlkRSO78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780491840; c=relaxed/simple;
	bh=ZAWq7q6CcZ1vHTMzqUB+xc2Q1paB102zps23h0VZjoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BEfZ0ixmFd4ee42OZ0YwftTYFdbkONoiM/4E/ZgyhxtDNEFiXv7t0w8Lg4fjDn12GLepa2IpIVSlIuS/iv/kp3TM55IJKtkswQSUEffGB4vYWe5lxz7hUk7k0ADaFW0r0lXSSldt6w+VQAAk7dXKmZeu19XxzFmA+k/6Bd9j9rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZDKKye9W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LzaEF2Eh; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653Ct3Qv1756374
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 13:03:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SUKm9YYEQI6OdE6YQifIsyofez6s+wjK8CMcZYA45ok=; b=ZDKKye9WrI8DRLhg
	fdksZrITISiWBbAzREOMa+Duk0ZclMr8+fFtNyEs7T8odq7LV1bXzLQQfSzJugEp
	3KW2O05N8JVNlP94XQRj+OYkks9vN6LD/r4Zx/Y2yUx1CdumUzzaiJv2GX+iGaiF
	/4erKwdmMFsfYlPG9LiLb4yIgydUoOT6/ZlxNpRy1lGXTw+Yjb28KyAc/xHgvYD4
	fWCU+g3D+QIzoX6txLG+gmL8/kYgqIO4wVWC7ebzRkdNEAyzkLGzBMxzeMZbA0+t
	gnQbN4f95S+mLDEqlqmt1TvbLf6DH0NSXwhExd9z1PaG2x9+pN9KvsJUYSCMvU4a
	IP5cPA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejff01er7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 13:03:57 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e6f5350426so39046a34.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 06:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780491837; x=1781096637; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SUKm9YYEQI6OdE6YQifIsyofez6s+wjK8CMcZYA45ok=;
        b=LzaEF2Ehjzv1rwls5PdnxKivAZMZQ/fM+nZvgvBfwYPcSyuAm13GIhKrS3VLXrCnbP
         NtyX7VGsSx14D6wpNc9mo0qYJS67OMiFigM5Tp2xM1a6B6+M+8NkYHcCkl4EvdcEfAY5
         CoUrdFP0Gm3nyXjgy2lxLVfaZg6zetnvO68Ku2jvVICAellggab3oDzqew9jORcdEY89
         v+7yvJ55aDZhtq0ePcjhf4N4b65TArLCT4TaaR2TiapkTGnsbIIGUzZiYI5/CCfdY3j8
         dwpUhbZ6CoaLVNPOnehKo0WIPaP1h/v6ZQV9VY5CinKz0aHxQ3bRh55CSU0ZCAYujB/a
         HrYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491837; x=1781096637;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SUKm9YYEQI6OdE6YQifIsyofez6s+wjK8CMcZYA45ok=;
        b=HT0RmBh6eSEecQ+kDMcr1v1Kbgol8FlW//UzLjn7FQJS3QQyxw4+uVRUCgsQHnQre8
         urk9llVpzYKWIKoNL0zU53FU1tb6eyd1KHFrfeEPh3Hfh8UUOTWd15t22eShzDz2Bw6S
         sYfVf62v4gZHYk5xmky8UUxo1rrVqbeE/LTPGVoMY3YQB+UTdlcKWmqd16rSh3HZPIDH
         2u6s7/1o+JULIvF9bZChqTM7a7ntcuQrkWrTLST1QTKV7M5TMOunQM5sV+0fn79l0lVN
         YsmMta9gPh+aBFIcEa4C2/iDotNzctWZeLyBBzSPxW1Hl53jKqeg/ggCk9u9P0JS5MVY
         ytig==
X-Forwarded-Encrypted: i=1; AFNElJ/ckXKGEX9X/zEnGqb2QWontBiscHi2Qilr56+tq7UFZvTUaPizhCTgNlwmJwRgURf4Omk4ANfxq3vlPNrh@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn/JSX8HVNGyoq/GdkY88GIf+l9lnvAzoyeiUiI08ZNrgH4VFi
	yWZYBkH00ft0FEEWFME+/rt4h0yvTx1vdTr+iwjGkaFDbQ4/mGdaOQsg6K2yZXskQ1PboSKeiFp
	YZ+FiVeozd1c1S2fHbNb4LqDgMYUzT2Ln7cgnsg4NOzGtUm7Cx48srb42GvDARqVEt0Hr
X-Gm-Gg: Acq92OHBtVS8uuGiuucvCfd4hl/TGf0WbLlmBkA3b/pud4/DaJsvxDK97QhiAeEUMLW
	LL1zDm/DH4+IGE76wUcJ50KVu/Z5hjy7KF5Dn6cLZtAgivkMQm+muBnWBu5lANMNv9d8H16YiIJ
	AeXGucyBoHxZqju4w5L2Up2PaQLhqh04MTPmrWUC8xwzRzRZlbwpCx7qksD1s6yht7lXvEpJOxP
	Ao/Y7hWBcOZmTI40YFiybFWeuY4U06rR72jxYiF2n1ZySA951+1pEWp4E/SjoixU9sdZkuGWrk4
	xR0WA0sYoFfxXSD2HqbyOLhgY1Fr1HR3sEbhjTVmZG8klOhxZE376M490Xtd3dlC5u9h8qfzzg3
	kjpxZBvkydFFkCPyHV9gD7KeKOsFC4ZaAU8VDAdfF2jXm3qlKkafY0FXW7adjiu/Kn5KCS1UX+g
	w/Yi90dW/Laqg=
X-Received: by 2002:a05:6830:81c7:b0:7d7:ea6e:322b with SMTP id 46e09a7af769-7e6e5fd80afmr1348559a34.0.1780491836473;
        Wed, 03 Jun 2026 06:03:56 -0700 (PDT)
X-Received: by 2002:a05:6830:81c7:b0:7d7:ea6e:322b with SMTP id 46e09a7af769-7e6e5fd80afmr1348417a34.0.1780491834475;
        Wed, 03 Jun 2026 06:03:54 -0700 (PDT)
Received: from [10.100.11.76] (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051770994sm152620766b.13.2026.06.03.06.03.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 06:03:53 -0700 (PDT)
Message-ID: <bf72e433-bb1a-4fa0-b8d0-32611b4e2d29@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 15:03:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 0/7] Add support for Adreno 810 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Alexander Koskovich <akoskovich@pm.me>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260515-adreno-810-v6-0-fbe04c7203e1@pm.me>
 <3dc009dc-8f36-4735-b849-d952fb626cf4@oss.qualcomm.com>
 <3vzdlxnee4w6mur5qiyk2rhewlugswxarhevv7l4zo47qnnqah@45oxl7rjqawv>
 <01b424f6-6617-442a-a77f-9b7a8472c447@oss.qualcomm.com>
 <191d66ef-7d36-41e0-b29f-1ddd47812b75@oss.qualcomm.com>
 <9a999b51-8131-4032-82c3-72d7eccbd222@oss.qualcomm.com>
 <25812e14-d691-4e15-8fd9-82cacc203eee@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <25812e14-d691-4e15-8fd9-82cacc203eee@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: u6DaDevsCxnoKveAvzqpKxQoloqA6q8U
X-Proofpoint-ORIG-GUID: u6DaDevsCxnoKveAvzqpKxQoloqA6q8U
X-Authority-Analysis: v=2.4 cv=LYwMLDfi c=1 sm=1 tr=0 ts=6a20263d cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=Zrx8uGjwauVpT-NhnRYA:9
 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEyNSBTYWx0ZWRfX5ASHO/AyPUPw
 Xfxt5iMQ7UmYSe9x0o5ktHEnAyYouEBH3+3n70EGAlv1r+EWdxYT6GdLcGwOn1P5n/V2FEPDIem
 D8Ju7BUMJ7bM2cgsRI0ockUmhn4cd5B06gpsVNd2GGxJpAxomtYwoPS/N8j1yGNQW/s/wHnC1Er
 rtlEDAZZ017lFl1/id3R3WIlf8dqK9zN3RBd/qeTZq8NC7nz8n6wfS3ZfIe/QSisbyjQBz7/v1x
 /tRkCS0iMkE573Kbu3/bsHPgCieYw9lbEFb/LHZ72A6QO1H6+KNknTMUnVeZKIj9y8l/rt4xtob
 kDiwSn4JptWH/VAB/E+WPDcO7zP1aTReG5D9tRZr0UGDouqLB/3i/et0mrgbY98W0VLlqdIzGlh
 JjI242onNZlWaC+fKlPQ3b+yGxN2++79Abc98jufiY+oMYpvZRgH9sn9IPr4LfaJeaymstFaohk
 RSeE1qB7u5rpWPmHMTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030125
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
	RCPT_COUNT_TWELVE(0.00)[26];
	TAGGED_FROM(0.00)[bounces-110972-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:akoskovich@pm.me,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:andersson@kernel.org,m:luca.weiss@fairphone.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[pm.me,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,fairphone.com,vger.kernel.org,lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pm.me:email,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 83340637E90



On 27-May-26 22:07, Akhil P Oommen wrote:
> On 5/22/2026 3:11 PM, Konrad Dybcio wrote:
>> On 5/22/26 11:39 AM, Konrad Dybcio wrote:
>>> On 5/20/26 9:38 PM, Akhil P Oommen wrote:
>>>> On 5/17/2026 11:54 PM, Dmitry Baryshkov wrote:
>>>>> On Sat, May 16, 2026 at 03:52:08AM +0530, Akhil P Oommen wrote:
>>>>>> On 5/15/2026 10:38 AM, Alexander Koskovich wrote:
>>>>>>> Adreno 810 is present in the Milos SoC and is the first GPU to be released in
>>>>>>> the A8x family.
>>>>>>>
>>>>>>> This series is marked as RFC because it depends on a few other in review
>>>>>>> series, GPU GX GDSC handling [1], QFPROM efuse for Milos [2], and devicetree
>>>>>>> support for Glymur [3] (for a8xx RSCC offset fix and X2-185 bindings change).
>>>>>>>
>>>>>>> Also depends on the GXCLKCTL block for Milos [4], but this is no longer in
>>>>>>> review and has been applied.
>>>>>>>
>>>>>>> [1]: https://lore.kernel.org/linux-arm-msm/20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com
>>>>>>> [2]: https://lore.kernel.org/linux-arm-msm/20260331-milos-qfprom-v1-0-36017cc642db@pm.me
>>>>>>> [3]: https://lore.kernel.org/linux-arm-msm/20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com
>>>>>>> [4]: https://lore.kernel.org/linux-arm-msm/20260417-milos-gxclkctl-v3-0-08f5988c43a2@fairphone.com
>>>>>>>
>>>>>>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
>>>>>>
>>>>>> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>>
>>>>>> For the rest of the patches that doesn't have my R-b tag in this series.
>>>>>
>>>>> Unfortunately patchwork doesn't capture tags from the responses to the
>>>>> cover letter. I'd kindly ask to spam the list with individual r-b's.
>>>>>
>>>>>
>>>>
>>>> There will be another rev to remove the RFC tag which will hopefully
>>>> have my R-b tag. ;)
>>>
>>> Do we have a resolution on whether the proposed fuse values
>>> are OK for this platform?
>>
>> Ref:
>>
>> https://lore.kernel.org/all/oka0Q911ixJLZzAbfWBx54dOmxbQAre36QqHUX4iDZoH3TE5jD-IqTAHspti6B8kfpLQ-OTnuWjFdXtsqJM-CUC8G9R3x_9vFI--LnpppiA=@pm.me/
>>
>> Konrad
> 
> Yeah. this looks fine to me.

Nice, thanks!

Seems like Rob pulled in the series - thank you Alexander
for your contribution!

Konrad

