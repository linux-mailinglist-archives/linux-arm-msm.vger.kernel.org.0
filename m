Return-Path: <linux-arm-msm+bounces-118744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fCTzCKPIVGrJSwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 13:14:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D2F74A366
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 13:14:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NrlkrMvp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=i0B1+N5r;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118744-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118744-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3ADFF3008741
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 11:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F136381EBB;
	Mon, 13 Jul 2026 11:09:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659BE37E2E1
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 11:09:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783940976; cv=none; b=BDCKTBn5HEh06fZMpeVnE/J0YYRfbo4pf5puVhu65sIq3NN0yBxiiwvjWLZYMLZJNDA5VEwEBa4LvNSj0bRd9REvqz8mxRAXHA8e/fmtOX+3jX5uSuwFozsE2CtAgawbQ2qtOH7W6+BMWrz3jCSTs5jPjklV5LzFwF/hj+Idl1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783940976; c=relaxed/simple;
	bh=oTzHapr0m4GWqMHoVKB+zUrcoOxplD5vE8TgFIaEGB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bl6BWaibCSBlGDPq97RiR6oO4YL+9XE6kpYPq1zzSdSLEBTk8zh83qUZDioG5Wx4/VbmGvPVW3bRDEbQSYzK63gcmchyIpmSuxFemW+eyxOUf398d0aIXSnT44Mr9OJ+me29nz1TYKJYPr1TNdpPvHRIFbjVY5R7g/gKtbagNHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NrlkrMvp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i0B1+N5r; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9dTPY952873
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 11:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kXlfaTZwrb8382Qn5XcQieyV+sy0vh/kCq17fdwe73s=; b=NrlkrMvpO4alWrcd
	yYHvTnL+HuWLGPjTsrvCXLnKlx/BNqQ/gPvunnKV+eG+6lfObU9DkW1L6Wg7zNE/
	RPhqNKO2uFB5EUCK786ra8NZdIX9O2Dy2ViOlcCa4X13+Mb//dKSJ18Gp/AxTvVH
	huIu4Ofs2bDIJQt/nYIiyWcz5Ruogsmr7bsfOo25M8WjE1rdGRe0vNWDypeOnhII
	i/WF4o3Y9jvP/SfjLqa4eifRBTRx0/svXojI7KipPhykulkWiQc+TfLMtsnGxoLN
	uOhu1JHXgQTGMZkoObtCgDDMBmiw4oUkfQbppG7kUcgC1vlRtbFXCxWpN+6655e1
	YX21VA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk3g9y9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 11:09:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a8c689b5fso44448251cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 04:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783940973; x=1784545773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kXlfaTZwrb8382Qn5XcQieyV+sy0vh/kCq17fdwe73s=;
        b=i0B1+N5rNqzGbMHy464SQ3zYXrHAg/Iypj+nSeXeDidR0NM9zGxXfD7vOHoKHp2fb+
         j/Xha3kPY2BqBt2PqSO+JXh2rhtCg/0uoW7QgO4k0kTzgfdYVbpDajTz6ocOZ27J9Azw
         XryWWiPgGr7sxiSLIX87BaeDLyX49TTv59UyxeK5N57uDRdXYp0NdaxAKjf3kykvYB4s
         HBBwUMXJ3TcQmC+oA+vxVKw8C4USkW69XowTNuOAHpg4Vsgz1y72Ea0+jk7sr+wMKTPc
         wP3/HV+inhRRunvIaCcoyqbvtar9ZOmYHCCvWrHbDhkYnceEUtVU8C6atHss451GZwN8
         fZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783940973; x=1784545773;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kXlfaTZwrb8382Qn5XcQieyV+sy0vh/kCq17fdwe73s=;
        b=Iz1hDo0MVl635jhg73EdvEcISdwkmDUSZwzo6WKMuHfn9aN2rqVa31ELzE8KH8XIaU
         UmRd25eiA7B4mJ/Xq3VntEV84QHRijle6RDmr0qTwi5v/dGnj7yiaOwWNni08BOTyF0o
         IZeK9g/zsWf0uOgcLKkYtVGVaocoYOP/S+hWzNkK1WSkYbG8QgfURUnWfB1VF/GWlvyv
         TDdjJyUD3q2m8RjTDTKucB56KF/qkCpdaIRNzYjhcr/M+xIv86o31YRL6y+ybaklFXBY
         nw70wjtwM4mgbB/+4g8cW8/XP94yOLWN5MO2t3obVsIk99pR7eQ4ICiBZIFih5FuKf00
         l84A==
X-Forwarded-Encrypted: i=1; AHgh+RpPuK9FobENTKmAGMPnhkVO9Sbrk8ZpQFDhBWZLOR+JDf3IGZEr2ooNg5inbZMDR2f90pK4prY2wuFWjtfm@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9JkQQG1nBYOD9mp7I2NNW5fa6hPOzc1ZRA7tPSSOt6n3yu1b4
	X6lT/K5+QEymnC6QSC3mE5SEkI6ZU7WJ7WLm2exUSbIFXl4AGVw+XbdA5BmTI5U0pHJr8EOplGf
	8kjY5pjvfLI3dFaCaRNWX2uf8J1sT8wU1pwoKGx086QbYtBjjup+cjRCAgv0qLSJhNYDx
X-Gm-Gg: AfdE7ckiSUP2p4X0+xKXE6jIRfgrLFm+DkrIt3zZhmf+GWEFX+KnPoSu3CwGgMIjTRB
	xFNiY8ak+KZ4dn4sFjoMd93eNZuzRmXonLe3HoLXFaTxsu6tDceB5a6rehFMVq14LK7iMV3wdhW
	f5b6o13IdEOmZdMGgF1DSk8EhK4zqVgzrhq7X2dm0Usv3yKpaasFI282uGRJA4PX5Q7G8Wy6Lkm
	bsRJk+xRNn2dMZHqr5dItPV92sYkDHoHA5b51Pjk3Wll5o0/P800f4LkG6DiwUs0I64lIVX1sy+
	qFZHkql9kTfab2CPfrYtTWlvSap/DtQaq0e4Vqz6/xpBe/Y676X3BVhwLPvPs7C1GUxKvA/ENDE
	SgIk1f9PTIJiSkojIfdPXOJxoa4WXqcuTSQQMUksNBtU=
X-Received: by 2002:a05:622a:109:b0:51c:10aa:9cd with SMTP id d75a77b69052e-51cbf145dd3mr87094031cf.38.1783940973600;
        Mon, 13 Jul 2026 04:09:33 -0700 (PDT)
X-Received: by 2002:a05:622a:109:b0:51c:10aa:9cd with SMTP id d75a77b69052e-51cbf145dd3mr87093571cf.38.1783940972784;
        Mon, 13 Jul 2026 04:09:32 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19cd8971sm14591344a12.5.2026.07.13.04.09.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 04:09:31 -0700 (PDT)
Message-ID: <5213fe39-0c8e-449d-90db-5488fc4180a8@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:09:29 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
 <akviE-ANATfFPdYZ@monoceros>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <akviE-ANATfFPdYZ@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fOIuIFtkXlILQFDSeOOUHcCBuFr47MmE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExNiBTYWx0ZWRfX3AqSZtUE6hDX
 yZqblUPd0EIPh4J4wEYS+biA5rBjX1kx3AzmmJpbS54U9Hisrzp0TPSvKd3b1XhuwErEAuryjYL
 SwEjXnSUHMBbBUBekmlZssFw0hS2W3U=
X-Authority-Analysis: v=2.4 cv=e6c2j6p/ c=1 sm=1 tr=0 ts=6a54c76e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=hFMuEfU6_yxUS0q6VWUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExNiBTYWx0ZWRfX2VGKMs+HIUiG
 wMxxMn8yUa4A94sL+tOOBmaXAdJOi+47XNMm/MPpceGuQ8rF4LHCsDD6x0QhyRBl0wlU27fNJFK
 Sw8o38s6A//ctbtK/cE4HENPpPT0cllli9pSEYRPRon1oPKIN+PM2TEb+lTu5mOQLjSjW0tURX0
 ZoqdIGgxnsapIGL3fnKYoTTrbXhHZVY2r9GL1LGLwjvbXpodTo6OUeI/09Wf3HfWDUHeYUdesXM
 PF4EDuuZxduvJHy9DEfP+3fLY/1j5NgGshTQhsIRM2Zaunjr1nhNsmok6MYEKrofI+dt1ldsAym
 GYAy8V2irobBh27tfgqH1xp9szfTSKP1hjK6YsJYXyQtfxRCX48W8gFy+PiEQQflce6pnVFAbFK
 Da3+7eosIQV2HX11MDhmefla4IrhXTSQ3mrtKtcBYyUJuMNuAGeFcpgIU2X7bXJZz7LXKggE6Zw
 i89tIa10LwRjqADltcw==
X-Proofpoint-GUID: fOIuIFtkXlILQFDSeOOUHcCBuFr47MmE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130116
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
	TAGGED_FROM(0.00)[bounces-118744-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 65D2F74A366

On 7/6/2026 8:13 PM, Uwe Kleine-König wrote:
> Hello,
> 
> On Mon, Jul 06, 2026 at 10:11:13AM +0300, Atanas Filipov wrote:
>> +#include <linux/mod_devicetable.h>
> 
> Please don't add new users of this header. Only use the
> <linux/device-id/*.h> that you actually need.
> 
> Best regards
> Uwe

Acknowledged. Will be fixed in v5.

Best regards,
Atanas

