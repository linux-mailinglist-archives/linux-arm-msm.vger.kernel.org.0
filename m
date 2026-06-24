Return-Path: <linux-arm-msm+bounces-114349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b/mYHnPbO2oceQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 15:28:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1196BE9A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 15:28:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iBbDXkoc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gFFI+ySs;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114349-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114349-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7B5F430010D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 13:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B649317A300;
	Wed, 24 Jun 2026 13:28:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B99D30D41D
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 13:28:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782307696; cv=none; b=NNBvmM1qKn87cfr1zlBZBZfx6L8P6SdBLf/3AXwJxa9dMbFhHBPGv6jNFogLbfo9iOa2VxNVJn68CtTpA9m/O7xKI9F2l9atfeIUpPj6pWPtReJ+wyaKeYRp7cbVffp6gp646D/wpAyn2znF6F8vR1FNx3DUql77YmIX7i5nKo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782307696; c=relaxed/simple;
	bh=IYaiqSwkKhKq2oKq6noG5azMdI22xDjR53P6dIK4/TU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EswFxn8GzDFl3d1rEKaN4iN0GoJKTwhqJC3+QIk+vCi8FN2g1/sTDPr/Jh8T927dJ7Y9Cs+dVHM5V1Co/jL+AGfDWwIyPEUwD9y1xFtm11Kx2P4VCA6TiEvNr3tG6bcm7j6D6aFhuCM9893hpFbJDGYjESlBOfpY1EuyF2PkTgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iBbDXkoc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gFFI+ySs; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OAO5pl2505130
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 13:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cE5e32Jq9K4Qp/o2vpwbsBEqdWa2a4rwdZ6gyyitcTo=; b=iBbDXkocA62hP9V7
	NbHB4LoFdsZiL2otz5aw3jzwrXx36qQLZWf7/vqCY2x8+EXDDjspyiW0lzLq2L01
	qNSr85lYtheKTlkoJtUG+w3EzA7m6cfsmzulBKT2E5LmCqdrgH4An3LKSyP66mtT
	WkyAzW5uyKBlbeXGzIG6s9lljBO168d4nYdQOPT65UjWBoExCYDVOmj3ZzJXjhd5
	o6uAbLx74k8Zt872yfh+XavqcKECFWsHcbWTw9awIb+E/jWYgjAkEXzTbBTiHBiy
	Yv5LyOxJqzMm5kaod/XTqQrkm+Wd06p4uZVB3OIIR+FZ9zfT6edBhphdVHYrb0ZF
	1VP3hA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05bfadqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 13:28:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8de715f6ebfso2530946d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 06:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782307693; x=1782912493; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cE5e32Jq9K4Qp/o2vpwbsBEqdWa2a4rwdZ6gyyitcTo=;
        b=gFFI+ySsur5tGkfI41iFHPPk2QN8gAV1fGASG8Q2DHBnIi2EcJu7zzdST7CHDV6gKM
         dLAYqqDb5JL5E5fOJcJv+3gEdE3m2ptOliT1hi/bWoeU7wKVjZX9GZrvfDwG5LZ3FcAG
         BdJv7qCV/CHIq6WZf80i9i2x47B9n+wheRdHH0eaPQZvDEjH7ZdRwLvp5cLl5oTdDRW3
         9UBXjskJOl6DeT81uvD7pk/v9VhBrOtxJRVgM3S1TEBau3Jr0lbi0Z1xfFZtgtE4WEqq
         K3+HCekqMUBFL8O6TqArvC6yXZV9S+hhnbEbVzl9yIhdw3JAlLANCy1oy783sxu9sX+L
         DD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782307693; x=1782912493;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cE5e32Jq9K4Qp/o2vpwbsBEqdWa2a4rwdZ6gyyitcTo=;
        b=cc4Qce5fwK+1hP9Cnm0qIVHTQkLPnAnx4itQyXjx1/XNAJGR3b1pgFu7oR/w9YwNvM
         7xge4ATjvlghas0RUCuWad1skAPTtpj4W/DSLccISQwebIltS7YKP2CHwWPftRtRwZNw
         Gg47sk/7JdhtGELw/t6GDXkQAOw4pMV6Ol/ocdlHcgmVLsJJmSnQGM2HLd+F2JkaXylF
         sdl4wnG9FU5RIYSHpeooMKC4HJrA5cFCEywlrKeqgET9nH/XPAwqzh39dVSnPuw8arAG
         MoZchMvhkY10sfSgIe+xlPtnx/4J2DQY88VdRYAvHer3UaHiCav/MAYJmS2/mq/GJlQA
         7o6Q==
X-Gm-Message-State: AOJu0YwzKfIheBhhbpNizyd3fWlNJ+Z1zsmHcYCneP9WuOQyPOeURXW6
	EDPHsvywZXT330Orx+rpojBizxeBzELD/mclR6TsiNleylP+Py2krpOiUOEJHdwhZNTLq2+4rns
	t7rAcIq6YUv94S7Shp89EUPtRAKopCBx4+9SWe4BP/TB6zpu6TlgZ7H8UYAaC1a+hlx+f
X-Gm-Gg: AfdE7cmN4yN9yw3AE2laBKPEfq5qP8Xcll0jn3gTCn7kI03gIbs027A7r6M0hQ7lZP6
	38yxm1Qv6WnbKs54LCuP4AWKEL0IW/jkNnIjYE6pZCrP19IRxz9vdR9g9drTtit3xb3pffd3+Ng
	Pr58498Vm/HkM/OUyS01JrXabcTXEpvApA+SR8PXQzIn+0+eowup1TAGJze9xgzs1wj91RGI/uK
	CbiMq2Icx3TXR/W0iDXNoC6FO0QLWT7Snbs4NuLcmS7eL5ncbkYYRYjjaemUcxlE2fe6fqaof9C
	ibJrOqL7wq/O4mV+lGA8uVGyTBh+nGXD+AnieIk2exHA2yg0+XLHD/ZcrvXgjSioK4bemefNds7
	dPOuIVeVcsuwV0s06dwZfBIt7khksHrKnG6E=
X-Received: by 2002:a05:620a:3185:b0:915:8197:4490 with SMTP id af79cd13be357-925c95b2466mr942762585a.4.1782307687813;
        Wed, 24 Jun 2026 06:28:07 -0700 (PDT)
X-Received: by 2002:a05:620a:3185:b0:915:8197:4490 with SMTP id af79cd13be357-925c95b2466mr942759185a.4.1782307687275;
        Wed, 24 Jun 2026 06:28:07 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60ac7c1bsm661168166b.33.2026.06.24.06.28.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 06:28:06 -0700 (PDT)
Message-ID: <53cade89-1fc4-4ba7-aa7b-815b9e26d88b@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 15:28:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] arm64: dts: qcom: sm8450: Remove unneeded reserved
 memory nodes
To: Esteban Urrutia <esteuwu@proton.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-2-37e2ee8df9da@proton.me>
 <e1e492ab-884e-442b-8410-cc100c54fd5f@oss.qualcomm.com>
 <6123a923-21dd-4f69-9ac5-02165963027c@oss.qualcomm.com>
 <b3541802-3035-40ee-8327-a65bd5d2dfee@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b3541802-3035-40ee-8327-a65bd5d2dfee@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X8Bi7mTe c=1 sm=1 tr=0 ts=6a3bdb6d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=oK1bmnR47wnCuWhRGskA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: -jD6unTdCCrUM2THm_5U8BHriYeGj1rr
X-Proofpoint-ORIG-GUID: -jD6unTdCCrUM2THm_5U8BHriYeGj1rr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDExMSBTYWx0ZWRfX1VoAUaqw6br/
 t+ch0nGFeOizLNi8O+ipGlpyr9BQIskwnX670pB5kA0MTAR2CcEf5pZWTTTrlyMVq5Mbkn2IIVL
 VQVh/Fwrz1jLdWhAhUm05giTLbkMDFc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDExMSBTYWx0ZWRfXwXKHn0f2DP9v
 /eDvuQnNlNegnLrT71fqRaDeN/j3TEFZ1EprxxR1Nnmwh9qcOlU7iVf3LzNUvIhDHqjS+y3HYgR
 HNOicrffI8bxH/3f42i/arkHb6aMGSwLZRcQvweRfKD/5ly4lqvKJFHjYzX715I8+L+8YC+8YcQ
 +2fwUeCAOwLZiZO6bTwA2nhShqqwBd91i6JSc79djJmauGrpA/BPRiYdNXAbHybr6TEx7kQuXls
 Zw2sIqZXIGss3lOeYO32f5h2GuIj992zhUhqZnOpSDXo9zif7NRwkkTj4d8rhYhDah5CcX0bcM5
 2U6dNDYr+bo9Xr2tKm+jIcA273deQHEY+4PLDPbsidojMHDGAThda6ECVWbTATPwJnnFDGaQCA8
 3P9eT4paXT9/QgEkSqhKkOH9reb83A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114349-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:esteuwu@proton.me,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-phy@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E1196BE9A9

On 6/24/26 3:26 PM, Esteban Urrutia wrote:
> 
> 
> On 6/23/26 7:03 AM, Konrad Dybcio wrote:
>>> This is mentioned in the memory map description, but is not part
>>> of it.
>>>
>>> I booted up a 8450 HDK and it doesn't even have MTE, so it's
>>> probably valid
>>
>> i.e. it doesn't report MTE to Linux. I don't know if it's Gunyah
>> trapping it.
> Then, should device trees delete these memory regions on a case-by-case
> basis, or be left as is?

I'd delete it and reintroduce as necessary

Konrad

