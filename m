Return-Path: <linux-arm-msm+bounces-111725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aXMBJ+JzJmrdWgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:48:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F41653B17
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:48:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TdTbDGVq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UhgQ290N;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111725-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111725-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 464763014699
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 07:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6746E3939A9;
	Mon,  8 Jun 2026 07:44:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DE931E84C
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 07:44:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780904676; cv=none; b=HRLcgg457XYQV/n0EXEr/n69rMkotAgzPup7TVTikGHDUjlnBf/5cTDNzbK5aBIvTDSZjJ6U6iRBchPfJevcO9qtQW61b0wHEhQpOzBhAQOW/dnXyBM28EZm25EQSnefrvlXhoH/M0JsRJCdTPfxv1uSYltYSC1GL8ELqFN6zvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780904676; c=relaxed/simple;
	bh=KWb3kxI1hzOhODqZtIDXwc/K6/WOw09NORDY5ydQsgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p4xDyip5w0eM44imSB2XyIn3IR8HPn0LljSL3uAzeO2YWYTlf+1L4bK8/hVpXfLvPDXj6cWAPeoq6Pu1hQY37YVF/sHOTmKu/XICGyefkiBLc8HzRPD+oSx/DwKHPrbVcv1k9hM0BBvCiUesNd7SOdIjkdMSnGD3ku7IpEa2x7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TdTbDGVq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UhgQ290N; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OmRF2317599
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 07:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Om9/b3InRoC7m27xNLOqNi2c
	Zral7wPlDrE1Hdjnq5s=; b=TdTbDGVqCbMhRZn/ozDNKNXieW+sGOrTrYIF1GiN
	mDDSJ0jCTvTz7t0MiyDX/RnvUrr+tMO9pNAOAlfFeoU2TKle90DT/rhX6NfV5NIK
	xie/r1KN+wkH2RbkeVxjyABzq1ot2eZQkMAU/wpW31owgigaVtUP77cfJrGwjaE5
	uO0vv2quHt9LYuNmKjjXdFNfPSHRL5IZmUU//6hbOLXacSlJvJNG+TZLbVLnZjbT
	H+LrjVXWUy6sY+AJQJ5j/F0t25dUZIR8OchaT/ybO3Je3dXWV/0WafpuRi4XFYNP
	7nPg3QVEOZKTWawcfAeK/yNZll8s89Gdhsjfp+7ryHzAZg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcadxbj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 07:44:34 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6c33d75153dso1594780137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 00:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780904673; x=1781509473; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Om9/b3InRoC7m27xNLOqNi2cZral7wPlDrE1Hdjnq5s=;
        b=UhgQ290Nd7gTttNeDF07bZjf+lngbg4C/9cdaRYGAgNrNyRvks6hU2zHg5HG579R09
         zK6Gg3HVlAn2w8TUCd2bBs8EmRsMLb8DEM7I0Ub+Tff9axtzI7rIi3vCxHJ9V4vxQCiS
         QbDpCsRpibwk0Gc7mUq3t8Nc4QAexxDJJYlWbSDM9tzt10IuaBa81H4qbXuZNAPc4I+h
         Z161uFWuHZGUHibmw17J7J/29e6z5l1xsh+GRgNOimJgdWT22N4tuEN6Kojx6h6aJZwg
         AQu9yTG2bDswbN10i4a3BduqFYnh8aVuKvJXteC7/FURSK3F8wSvfD1Ze4nxl3pwV2cg
         3LvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780904673; x=1781509473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Om9/b3InRoC7m27xNLOqNi2cZral7wPlDrE1Hdjnq5s=;
        b=XJZRPlOH0337EY4+IYzZ1F68NbMQoqPSTbKRspjPzR41KJpEH4ftlxLT0yrGFamnc+
         MZJuHvOifrjItnmj85JSTEDNnkuuXYuHYipR2I/X+UlXXNsuzkp1DsO5t3uQya3yXBFM
         3zTt9wd3fgRgDWw8so7MX60EVBcwvojJN3C/L2asVpOj3E4al3gub3SRQ+tNTp4h737X
         /06vTldu2oa9XRvhVyBN42InalgiZcf6HtoSl1uf4G019x3hQoEBkUc/PLFft/v2LSOe
         uEnOzFw91/PdXRBYIKmx/74ydzMzl4JXqg9x02VLspjXVo4F0a6gUThS/eb3S0N4xI63
         dXTQ==
X-Forwarded-Encrypted: i=1; AFNElJ9T8CSPQTPc19BoJqZjJttm3U56kmzd2wcdqcYphmiscbicLucZEPu4ASIqff9XPCKbEaDPC0zAG2QYuQfK@vger.kernel.org
X-Gm-Message-State: AOJu0YwOkZ8MpIfJOto05D/iG+B2hNLWdNHpHK1z0EDa9rOPh9Guwo93
	5K5WGge32/GlweRo4vHFMv3ghPAnrhoHWL2CvyXZKjjqDmvk2NpzXuZ99nnMe56OPd0HdZHBYNR
	WoSqq2Q0iEnMUJ6gHQiLIg/e7k8Ed9m2eGPQt6tK6wB9GcmR6uyH6NkTDX29+KP/cPufd
X-Gm-Gg: Acq92OH4prizzTuJTJe71tMfS7M30FpfsfjzwhlQLL4mbJWPZ7t0ayOVdYh/Yw+i4kO
	KsCxr8LXxIC2gkDqpHvyn/Ht/1yWAwFUpZY/5efS1lNChFMhSNRKEZZ/6vY0HpN8TgeNShzxD8p
	zVjII+pj/Zp/hjtunM6gvVPCJRZgxANxXnlkbAbUDWXwXjnVZrrEZ0w+r+hfJdRdyElOuKeDj/V
	3SGGgtWkGpXF5F5Y5S4OeHui3C82z7OIpDsGYwi75F06MWMTXi62Ky92Z4gzqxg+ST2ShqNqRx7
	l7IBzlKGnNR+9f/CC8KvgvpMB71ptV14j7iSXIsQu467GtbRPGwkgpz8QSUEFMi415m97GB7xmK
	dsS2v6/3AtRP6DGVDrUy6fIqxqO2c61YiUI5CXNRwEMSYK655JMU/yuAGDZUbWSTG9SD49WuelD
	eN9ge5DRaWVirze1DIK09yE/fyjOV/w7tdY/1AHZ9wxSJ7Iw==
X-Received: by 2002:a05:6102:510a:b0:612:c135:1b77 with SMTP id ada2fe7eead31-6feff62a683mr6073301137.27.1780904673352;
        Mon, 08 Jun 2026 00:44:33 -0700 (PDT)
X-Received: by 2002:a05:6102:510a:b0:612:c135:1b77 with SMTP id ada2fe7eead31-6feff62a683mr6073289137.27.1780904672939;
        Mon, 08 Jun 2026 00:44:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b990344sm3610214e87.65.2026.06.08.00.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 00:44:31 -0700 (PDT)
Date: Mon, 8 Jun 2026 10:44:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm670-google: add lpi reserved gpios
Message-ID: <jbaedqlb62m6pspq46e2wdaqlvimzepqjzxz6fnnroluu5bwqp@cotavveesjvm>
References: <20260602021722.30760-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602021722.30760-1-mailingradian@gmail.com>
X-Authority-Analysis: v=2.4 cv=DIa/JSNb c=1 sm=1 tr=0 ts=6a2672e2 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=BITVXKfNEooxrV_AlJUA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: ayTORPU5_81Zuhs0GtwFo9OrJy2InbKP
X-Proofpoint-ORIG-GUID: ayTORPU5_81Zuhs0GtwFo9OrJy2InbKP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA3MCBTYWx0ZWRfX+HSwroV5a+1E
 UC8MTg7Hkjkt6Dv0dpwIGdhMMam/vJ+JId5qRqrnBHNrv313VCNnwVd4Imv5qDmuBLfEhfR9gl1
 SvQ1MsAoPnsYXQEiiS+hg7LegO/DILIdpCeGV4qoWNWoOy/NBoPWIHNbwadFwZeEcQ+fLkCrLU+
 QFXToaTzuGbvrzBRtTglD2UB6LvsCEkfgyN1I76lG7d/zK6515j1xTvFH82f1TmUiHiOKfSi42Y
 DO0bm8k4GJvdo/X+zF9VWPNj52MQ/2bNcgjJi6gWCt+Xh2K+uefT0cTXtQgSlMQhdXO92v8EdhY
 yL8Q08NapCLMEgsNKj48gyxWJ1LPq27BZE0hfCvQALXuaGBbByAuqdeV4dFN1RNmzOWYpgGQX3b
 +xo3j8yXonZdoe1gyyiSqbjNVCfagLUhXUzr8wXrazHD8XCVnfLmTaid2tcFe5ONdZpnoTRbduh
 pvwqjFaqka7zyMFabiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080070
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111725-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mailingradian@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 15F41653B17

On Mon, Jun 01, 2026 at 10:17:22PM -0400, Richard Acayan wrote:
> Add reserved GPIOs for the Pixel 3a, which blocks access to the sensor
> GPIOs. The hunk in the original patch was dropped in the commit because
> it depended on an unapplied patch, which is now commit fe9f4a46895d
> ("arm64: dts: qcom: sdm670-google: add common device tree include").
> 
> Fixes: c4b423835ee7 ("arm64: dts: qcom: sdm670: add lpi pinctrl")
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

