Return-Path: <linux-arm-msm+bounces-114904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3CV0IqU1Qmp11wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:06:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 101946D7DC7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:06:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nuA01vUW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FkAg0f1J;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114904-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114904-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F05123040F88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C0D2F872;
	Mon, 29 Jun 2026 09:02:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4CB3F7A9E
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:02:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782723733; cv=none; b=Y7NnAFaZQ6z5Q2SXalhSCs0SAhs6VC9OJrvagh/9+Q/1Vq2Wg2IF0vDzrvJ0t9VaoFnWUdiW1/nBKuC/4s/Jw1FyuOd3Cf92lFLYJr35tfP2eSY+WLr97Fox/46L/YtztwHokmID6G5BALn/S/lGwCMPE2tTSQZ5Xu3iyRPpm2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782723733; c=relaxed/simple;
	bh=Ri0hbrm6/ZWciGWTp2WHj0QoAjI2OwKruW9r3vgXugQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r+mbWuE7C1QaVdcoJPql4vVrdcM7chzqzsxcOA6B/zEVJyD2HOjTLTM5p3BbkBGClG6sIMikvs0GV/vDbj3EIvev8SbGjFOu8ajQDnaNiodv2KY+kpeuhMpIyuwOugSo2/Ry/BP6V+dJ+b3zInCOjeVdvQSg7uYZjiFihG0VhEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nuA01vUW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FkAg0f1J; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8aSmG2368200
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:02:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ZyZHqhbUNn0UPPgoVU9o7uK9rU1luTmL+9XEO0/HgQ=; b=nuA01vUWni7S3rri
	egn49InRI36TWL9Sc4TpbnMivLX8Sguwvd0IHJdk6DHLvvxElLP16VtAGh283ek8
	15lUUdDC8BgeCfAo9q0mRPT2wvK5gJQ7kPjk2y0TTRX8rjlDjrqb58dHZebreuBn
	Yw5OyH1Pv8GJX6r446VHB2tmNt3zqqNiUo+GNfMvizciEIFpDmRtjEM6lu8HbYAP
	e6x0HH0+srgpOoDivjkkbjJkEXfyXxATMlevQbI2KasGZFpIeHQYmjLW64VGmRGC
	ADPJesRk3wVuQCKFs4L3xOrnYlcV204cdD2X0MmH8w7N1mfChSTA0V20krJWQgwb
	SrZB+A==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nbgr3df-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:02:11 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9693b69c4c0so33046241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 02:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782723730; x=1783328530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ZyZHqhbUNn0UPPgoVU9o7uK9rU1luTmL+9XEO0/HgQ=;
        b=FkAg0f1JvjGREXkuREwicTd6+jsa1k/dm/XztExNwTIWf0piLhhIwyvERE8M1udEU/
         uHOrZdNj4AOPbpor3RrWBEcqx7CX0v7YU0JP6qp56+0zL69vdz3psvA4AZ014xm4CWCJ
         WlDtuPOeDXZN2dAu/c+d76lMiJaN2THqkM4Reqn3MCDVNsvETh9xKUOC8nk+P4wGBexg
         MMnLvpLztDdvSMwMJFp9W3W/JDMOtf35MJwfH8kkyH/IDmjFjgx+ejcz5tYrwjQk/OHo
         xz5YX+X+s9oRg8lg62KDuEZo3pvTe652Jg1wk0nqTZY3hYyL/qAcbt4wrewtrEyHDyoO
         9k2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782723730; x=1783328530;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ZyZHqhbUNn0UPPgoVU9o7uK9rU1luTmL+9XEO0/HgQ=;
        b=p7rOhGDGF+uOz2q69RsohTrpvydqymbsbnmPnxLolp+Mmx9atjG39FohAadGJgtvrd
         B0ITCCJHxcmzbPbV9xTQj1UaMqS2aGbTdMrgoU5RNju62iC6C/P4CoeXQCQEaWS1EU0I
         NDckhsJ7qLY3oFHMuFU9Gmhw7YiSFv6Zg2WJf5eENPQ6dq+EBaHdHUwSqyXQ/RNL0zFo
         /JJUcIOGY9sGMwxfmKlx8umS50jT+AyQ8Rwb4ujR25Roa9v4C/Lo47dwLmWmkV6Il5wR
         v9bpHXZFoMlSCFCniwNUEnltQdfbcJZk8x1rd6t6jiTaMujpicr6HEaSMaRloUGeqmk5
         pHgQ==
X-Gm-Message-State: AOJu0Yzelq1tvmIvatHYsvjxQymIixnCJJgxfnrIaNIaAMKsx0risvM2
	epQzubY1rSTLWs4SKwSnNTgV9VRL3Nuk/WB8ToKA2vuGu/KK3KOYrd1DildIv40ACr5lnlfGmvc
	b125V4FaM5MybHjOVUnFdBMW3j0n6DxbZUfKWxnRL0JJSQrYz/zZSd6oZYhGMyikRWPac
X-Gm-Gg: AfdE7ckHYE/RyC9afF3b7KXSTVIEg42bD/Jrj0wDsziadJnud6+HLwQkqkDLgX6GC18
	B1ecY4/I+tn4TLXliulvbExzqGqXTYXa4UjwTd06E1kGJCe48ah97AO4ztPs4S2SW3RqI1Witgt
	APhBk8nVAR9b3yi10ObDo7d8aywcre8Rxy+frULryXpDxcuVk9/s8PCiPiaWvy5ta3KJpE1F1rU
	B2qaeB0bvK6Km3gEtJh7r5YmjTKRoA5Y2xOLoWodth2tZ7EsVVsPJ7YnsIiNdAMx88XoEDG0nzZ
	KQ87qi1LgUwY8NLS5YLpsB27/C/n2GIwXo2FdGQDYyc5kUj+tHPMtBWbXvVDTUymxIKzWkCkKCG
	2HTkF19BjiSFtfw5i+aqa298gNndqzfG2K9I=
X-Received: by 2002:a05:6102:5121:b0:739:5c3d:605b with SMTP id ada2fe7eead31-7395c3d68d4mr167786137.1.1782723729987;
        Mon, 29 Jun 2026 02:02:09 -0700 (PDT)
X-Received: by 2002:a05:6102:5121:b0:739:5c3d:605b with SMTP id ada2fe7eead31-7395c3d68d4mr167773137.1.1782723729535;
        Mon, 29 Jun 2026 02:02:09 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6986625efc1sm1307322a12.19.2026.06.29.02.02.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:02:08 -0700 (PDT)
Message-ID: <eb8d944c-0e52-46f1-8c8a-52ea624b70fc@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:02:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sc8280xp-x13s: Fix the
 drive-strength of mclk pin
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260629065905.15651-1-mitltlatltl@gmail.com>
 <20260629065905.15651-2-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629065905.15651-2-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: k3K0U0avyzltM8v5QXPqd2k0vDFs8ErA
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a423493 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=rPEeh-01POpV73vmElEA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfX4cGuW/aO38oo
 e4W4msEcKLADxUaJqZ923NIJU8zvzyZ01l1a/lgz2VRy5r9cdKtLZRG5CgFWxHu/5YZb4LZoI4R
 GN90qavfYs8AyL9Pvgmzzy62euWdfMU=
X-Proofpoint-GUID: k3K0U0avyzltM8v5QXPqd2k0vDFs8ErA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfX4tFhn1rIcxgC
 kSw2MZhHUN4qvuElYvbUjVhtlnNU4SV9HgUUUh9KnAvy7FHk77ahAtyTodmDer1N+FoBnBAkumj
 UU+wM502uRRHVqtwwVNqU9q1vPiOa4b8ExIbaE70595AT30m4mwvJ90DQ/F5ehqtkFIpk8fYLLf
 amTVtKVjoUSAAH1M8Ds9rLvbZBO0zWhO06qBfCUIXUy0Z5pYmf3EUw5ckLwYSzcBApcVsiV3qwB
 pGVfOXUzfrxon06HVuPm3WHFxcfvcHpZUSQIS5cE8ctGZK+u1ckq/gVg/Fx5pSQhEU7c74LwRQU
 klDOQR3WuhsxTMjVWWZPwM1B400Z/eXAQ6hOvXXNerVnxp5HCNJzUIp8SKBUzzjULZFV96dk4Ko
 Jg8jO3c6IdbSLHwy2QaYMJazUbyDVEiS3z53k9rXBMJqFqUCNnMKQYjJ9BZefIzHyZjixHj/GI+
 BFBCU7DymncIY2npkqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290071
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114904-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linaro.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 101946D7DC7

On 6/29/26 8:59 AM, Pengyu Luo wrote:
> The value can be retrieve via windbg on Windows.
> 
> lkd> !dd f111000 L8
> 
> ctl_reg => 0x284
> 
> in drivers/pinctrl/qcom/pinctrl-msm.c
> function msm_gpio_dbg_show_one()
> ...
> drive = (ctl_reg >> g->drv_bit) & 7; // (0x284 >> 6) & 7 == 2
> ...
> seq_printf(s, " %dmA", msm_regval_to_drive(drive)); // (drive + 1) * 2 == 6;
> ...
> 
> So the value is 6, not 16, it matches Windows now.
> 
> Fixes: 21927e94caa5 ("arm64: dts: qcom: sc8280xp-x13s: Enable RGB sensor")
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---

Thank you!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


