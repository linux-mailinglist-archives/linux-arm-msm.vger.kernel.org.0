Return-Path: <linux-arm-msm+bounces-103078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HlEMHD/3WkRmAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:48:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C0C3F7836
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:48:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D49973014C12
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 08:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F093B6C03;
	Tue, 14 Apr 2026 08:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WBcIM9qG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cu4H3Cju"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AA6342144
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776156415; cv=none; b=EPETlYXaNI0m+FO6b7SUdSnnpHEZGTMun6h0jpnBcGEj51Ii8FWS6LcM5myiBx/11xQjI1xMjeD85m0zdRKNCjfexI76gp+JZKCZFjsjgsHYqbQf/h3QT2+mdbKvTP+toS/6X39mNS7/cYFT1YZ0HAnighU6Ms8gv4YhqAoR+1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776156415; c=relaxed/simple;
	bh=SYartanFMsIv2g6KjhxWu2Uxv7zuc881jae3LKtkqM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=shzDl1OzXi/6D8bGS0EC8FcOk6ORU2PkakARVsnac++gIO868Qe3Ufif4xaOsuYEQHlgdtlvVVm7yjG5QXObx9/v8gThWtiq/ie0NPLiOzkADO+ghyaRxxKbSfpXq519arytuCApIXfpSQUQupUJRcc3m/FUTivpmBQyDJ7TagE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WBcIM9qG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cu4H3Cju; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6vrI0967261
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9HwoJ6Qkx24lge+pKZcUJTrizcXF0yAUZNbBWQ0V6Pw=; b=WBcIM9qGm8abf0gY
	wMOp1RpexZQQsSNkdTdA82jRVyfKGJSqjHr0TxsTzEe0vnHnIHg9aq2pAZccjpMK
	MGcYCsvRWnPGfD0WYebNRtByZ7qHsMYQdujy1sFI6bKsGHXrLHcm7beZrBJ94Wkx
	lgO7LkRj0cwK24rKZKNIOSqLcMOohc2KJlRkx5pAEU9/fFBJUqg4iaRG1eAYvOkB
	jJlnk5q8GJzRFmiDyB5ZX0zNqh4S15BD/Z4c3CXxwGc/2Bdd18HI8qvaWbiOZf4d
	LjnipRinigDQxNRx8L3qJcFuBiYXDN0cspq/8gYJI2c4xfwU7A7oi43p9ZbQLTvk
	wtYLqg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86v1tj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:46:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b9074bd42so14699321cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 01:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776156412; x=1776761212; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9HwoJ6Qkx24lge+pKZcUJTrizcXF0yAUZNbBWQ0V6Pw=;
        b=Cu4H3CjupsiK5PhTU/MysiM+xH1iHYLqpZqdTyXIFYpyQrZIAk7Hg9pjNjNTv5M8b/
         MNUFkB4euJExVYqSk6tsgQsQW4lBncVfJg5lYRxtU4k2aF6nQ8ali7qWbWMGoaof/0Ed
         FZK2diP9JZ+jrfgzf9NIFJ5vRpD2Z2TCh90WVv2dQBTQJQvdgrFuMloyvO2ihVCqgM6A
         FVuxJD1EebMs5OqmzxbHLli07mIhaTLpNWdxxrdhHYwUMTUyn+xCi31NCWMWgeUSSgwV
         MfPw6yT0UOZhugJuGwlg6+d7NOMSJZV7yi65nHSEJ+bdNrVxybkqlhjDAuIea6RXLOWV
         R2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776156412; x=1776761212;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9HwoJ6Qkx24lge+pKZcUJTrizcXF0yAUZNbBWQ0V6Pw=;
        b=CehmIu18g+jRRb2TnLJSVCWEgrDFv7iRTvgIbMc54eVDQ6c1ekPpd0KE1QMUO0KWq5
         e5zmkWtQprddvDm+GMHHjkOpOey4F48tdp29V9x5BUXCMCjfWQR6RSoW4b38TyL1BR0Q
         nM+2sn7rrzvqnFxzbmtv3nw1RZldsBX22+AD4FCxqqbTo57PGRD8gj1tuaF/Eez6kLMm
         n5ciauJPuzjAYQn7lkDcd4VsZ0zr41AF404PkmzTgMjXvtRUp7LxFvO2ida4P1VLR2PP
         PQ3EUJr/3tYNjfO4NbJSV0p/cddkBmpQk67tUhN7T7LbOZnAj4E03I7LSNSac+62PBH+
         7C1A==
X-Forwarded-Encrypted: i=1; AFNElJ+z2/roTFWIy62+8L/hFKY28IqpoFikOAN9mxMIs3bK9nbBoPXS7+NHyLJT9uMfXqM2v9xfXnd8ftZgu1X3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0LWb/ZaN9EX2EjufZtZJ7/ZBZq1nkOVakQ87/VD22gn4xbjJI
	r9KwDLFhP+r3KNCPqdQ18lLOmfUNLGYIiKjNStCEHaB0KNquf2N3cm9iO29yF1Vk3Bipbh7zYWP
	j3vK4qti2ksqZollSo3a/F2JWXHsVudL8x22zy9mWTqbOIUGaBo2ZbVgMEeMMkxzm2XYc
X-Gm-Gg: AeBDievX5NZ8tPGAYh3fhsmg6/AsxmQL9MLLQDFclhk2Q5OKLWNU87A/MzYo744toFK
	XO3tuRAyxnw4+A34SH+m3dhvxI41yXFbF3iReO+8C2y05Thp88iipvhdHsSlcr3F4cUuSXFr1je
	cEeiEo9/BrMw3K/dIEatH5w6uaDpw+h66UGqqMfXzs5V2FowZWNcYRb0GXGSHyfFCHa7WgZiOXJ
	6t7x0vc8LyxpZrsLl7P1HBYp7IuP+HncU0KV4hPAvsz/ruEO6878foBS1NKJCsL36gbhg5nycea
	H24zU8dKoaDhMxgFvjveCFpl6+UklqwQ9Vt2zB7W7B9skKsHxI7mXpZZA6A/58jysHIZudAPb4N
	ZXQu28tD+3Cz79LkFGb9eP/EzMEqM2zXwJfsdK7fTouMoi+/4/Yyt33WUz1IubEbF0KDnhqgGxO
	PWXJbS1V4Vk4YC+w==
X-Received: by 2002:ac8:5949:0:b0:50d:714d:e966 with SMTP id d75a77b69052e-50dd57f6e28mr167151591cf.0.1776156411818;
        Tue, 14 Apr 2026 01:46:51 -0700 (PDT)
X-Received: by 2002:ac8:5949:0:b0:50d:714d:e966 with SMTP id d75a77b69052e-50dd57f6e28mr167151341cf.0.1776156411332;
        Tue, 14 Apr 2026 01:46:51 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c8a4fsm369699366b.54.2026.04.14.01.46.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 01:46:50 -0700 (PDT)
Message-ID: <dd09f4b8-b0f2-40d7-80f0-bdd2cb382c65@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 10:46:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
References: <20260413121824.375473-1-ajay.nandam@oss.qualcomm.com>
 <20260413121824.375473-2-ajay.nandam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260413121824.375473-2-ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA4MSBTYWx0ZWRfX+IKlL8NFcggI
 fIdzoehbcC6pkLGGAq0Hrnj2ue9On48z1c/8EiDTpbSHQBYWx4B1B37o1nsJ/ExckDy7Q1m1vyc
 rTtNet7ZWN6w4UWRR+Xo29jnLjnZqerPNTg4aGCCGNudoLqY/eYCrpEOIjkZleWmCImq42HgkIe
 x/xCvkGtPM99s3tX5m+x19+y2jlyrgH5NSnV0/Wy1ochCgtryLs79voRKUuOrp24RHKINuM8/tC
 6vZltzaB4XgKi4WGshi+5yK4oQ2KrcEX+9y7NqDX/+F3LCE3hGM96FaSAd1Ds9C6huO6rliQ3H/
 rEQuiQSRyc7feSgJPaCD+7BmBzqR2iRryO3lCFtldGI6n4dSLoiAHzkhFBa+8ciDYp8ke/+J6AN
 fvB3VU1CwMKaUuTthVcpdYsDih5NWIjUZ4I8jFhwemc3FazhZwtfSgc+onhCn3lZvxV0HLi8vN0
 hsycDYwLhNTgSll9cNg==
X-Proofpoint-ORIG-GUID: thQoQmcxD24xtz30doS3QA_9IKKgytog
X-Authority-Analysis: v=2.4 cv=Iowutr/g c=1 sm=1 tr=0 ts=69ddfefc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=weikHDwYOGaAN1ZrU1wA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: thQoQmcxD24xtz30doS3QA_9IKKgytog
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140081
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-103078-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 24C0C3F7836
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/13/26 2:18 PM, Ajay Kumar Nandam wrote:
> Convert the LPASS WSA macro codec driver to use the PM clock framework
> for runtime power management.
> 
> The driver now relies on pm_clk helpers and runtime PM instead of
> manually enabling and disabling macro, dcodec, mclk, npl, and fsgen
> clocks. Runtime suspend and resume handling is delegated to the PM
> core via pm_clk_suspend() and pm_clk_resume(), while existing runtime
> PM callbacks continue to manage regcache state.
> 
> This ensures clocks are enabled only when the WSA macro is active,
> improves power efficiency on LPASS platforms supporting LPI/island
> modes, and aligns the driver with common ASoC runtime PM patterns used
> across Qualcomm LPASS codec drivers.
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---

[...]

> +	pm_runtime_set_autosuspend_delay(dev, 3000);

FWIW I have mostly the same comments as on your other series

Notably, msm-5.10 uses 50 ms of autosuspend delay for the macros
(100 for VA for $reasons)

Konrad

