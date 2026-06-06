Return-Path: <linux-arm-msm+bounces-111523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fpEgLik6JGpG4QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 17:18:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C032664DD03
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 17:18:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MzqznNGy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GXHgib8Y;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111523-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111523-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8EB3C3003494
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 15:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A26E318AFE;
	Sat,  6 Jun 2026 15:17:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EAF1DB356
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 15:17:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780759055; cv=none; b=soqWWVZf9DD93fUPQ7imQpyA3UaJKmOA3vSFLi2XZ/EhAMl5w3wydtpp1JWM5ODtY5X4DnRM6xV6LeuhDObsx6531rtN6qaEVwX7uwPTx6aaLltRZ/UHunnPcvXlNQknV9af/0xiRsgLzMd9dswsXA/VMKmDta1Ow/jFNOpP2Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780759055; c=relaxed/simple;
	bh=rCrpHORZ+IdcnYQ/BZqNJiwdQvQYdRlVbv4p2HNrb5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SevV7BJ7my8A+R+f9ROBDbnufpxCT6wNZxaJf8MxtSxCrbg8/zN7K8coVKW+5zhE4ABtChuGEzjmX+g+fLhR7UOSIk4dbxWgkhnU5ZQNPlJ/WvnBqyzwOb03ub7z9RCr4IRUdvfzJaXAT/OczlFKJzdrifHFXIYh+Xv5X+pputU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MzqznNGy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GXHgib8Y; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656EuOTA2179023
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 15:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=74qZG2gktXRXFhZ157JDE+5U
	dt4H0C4uI/LT2/Uh9u8=; b=MzqznNGycmE+WATNjxY9fLt68hQ4HAQQz1EpJIgi
	0dw5pBlqOVlkGaKa5+QJyU27iOXmbjDfWAvtAwaQ6QpwgDkty/POkbaovx5+qX0c
	cxV+/ADFGdYgrHUX/jHdE2f6PRDA9+R5iuk9kJN3b+ftxklew8dnbY1fnV8MBKrk
	qZoQ9qT3w14z7I2cSNuVL34Q+5jNaZxJ4OgUpJgBhNAvWbt025pxA9k9I044Qqiv
	7n4fit0m2L3gHzq2hTn2cSO674HqPFHFC3KLWFh1CupWqxx8RAyI5t/5GsyCdNYb
	JRyrZEkZAZ/fXXGxMHZeAfovv701hNExp1ZsfSHdGJLvEQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emb4w1mwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 15:17:33 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c554284973so3573908137.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 08:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780759053; x=1781363853; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=74qZG2gktXRXFhZ157JDE+5Udt4H0C4uI/LT2/Uh9u8=;
        b=GXHgib8Y1KAd8RmNdr6dKfljt1hj1mM8PEAkRhE8jaJxyhS81QQj1hlObfRsUmVlXx
         pag7vfW6bs0/iXEs9Kkx2pR7H4kc7OlRHBqyl8vq0kfElWU+udSr79pRQ2s274nDbwOv
         alS/6SuZmiQSLYrhgFOZigyc9WAaUYS0dt0KFnkhNHw9YAAVcngY/g17i7FWfiBfxGJW
         zXWkHYiOF4qcqQxErJWOpL2k5T4JC6q7Q4d4WYL+oltrXmYnePg+8SIVE3dTJW8ouLRj
         2146yqTPd01rlcTamjeq8wZKAaajRtcHTvcwS2T55q580bT/Q7bpLGPjXZ3X1dTj8/GC
         z96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780759053; x=1781363853;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=74qZG2gktXRXFhZ157JDE+5Udt4H0C4uI/LT2/Uh9u8=;
        b=LL1WSsl2PR5R4YtEuH2qGEnNL9P54ia0y5aKnmI0hfZcHXGFDaRLYUqeIWMxyghLX6
         2HJ+iac/fpSDMMoI52VOZrRmbpDSxWlxajqZBFRKYJo3vzhmlrrL7nP4HmUHC7p+38Ac
         eZoxza3+B4K1IBOgq9tISoYzBl1X8um2UsCEur6MGEVEAm2AtF0Y9WPu3hxlAm1WaToF
         mJCttWIglw8rfGtc0xGhktdKpkNSQQokfjPtzkJ1Tfm490v/UE9m4fIyH+ey7h1xmRyx
         iHslrSYrzapQCrdAScdg0D6QgPRjNp1VESjlS0zSWJjsL84nLM4rNA4l2tQJyMVPakzh
         0Sog==
X-Forwarded-Encrypted: i=1; AFNElJ+9Ab8d3Ldshfc7sZG02Z1YenCKRIAIN3leM5dmo0CEflNXf49Ko9j+4aoxMKxqHVs6E2VRIlMixZmkDxzu@vger.kernel.org
X-Gm-Message-State: AOJu0YzIXYT4ijckuuWerN1CLqzAE6UzE5VpjdnTZ8+3WFAo+EPgoIhc
	qyUu/CLaZ4rNIAORl7UAvlkPdpA500UviuNHq7JwQALcP+DjnprXgBmhw6G6jjnXdDPWwUZmdUb
	WW+I44PPuckyCSCPPlBPjyBz0fPaA/+0j+z779Dzbqhc0/CCScYaInhtS4X066Rz1+APZ
X-Gm-Gg: Acq92OGbfn8Mc5LItJzENf9Ufbo1/Cwf3guLUAel/6ugi005yNu9lXsWgv7RaXyBU9L
	W6qupJkTjk3EVPxubrxwYFdcwRXgTK7mS60xnzjHAdMgPsyKCUEIIlcem85dH6h2ObyFPZxmOfA
	fYcaIAHz/c+vpkvJ1yl3gDG9VFPOXsGST7ztZUHUBjwIHP8bpFOrttAawzEIAqXMA0BIpLP9f0S
	bazTdsEPzwjKxOj04ghMAVky9zvwFpgFmXdiDgjxHSOrsK6lez/IyIOYftI793bAPKzPKm+bIVA
	RTvLjPAfGB2EYyk80bXtdF4szRidjrnZ7Y6pvgS1eP0s3Rw1eJpWM741J00q/Sh2Czxqqgw10Ws
	zUduF4K2YzhJGLlhap7TO5TBvGbI5vZP8PWKaJfvpPw9/+QMf5PEVsCZg10xFT8FgjtS9wVIhm7
	Mx1PpVwwsexxqroSAjRe1fMhz4ab5m1gqHYHqS+km1YDTLrg==
X-Received: by 2002:a05:6102:441b:b0:631:37cb:1e64 with SMTP id ada2fe7eead31-6fefc00fc45mr4349209137.4.1780759052675;
        Sat, 06 Jun 2026 08:17:32 -0700 (PDT)
X-Received: by 2002:a05:6102:441b:b0:631:37cb:1e64 with SMTP id ada2fe7eead31-6fefc00fc45mr4349199137.4.1780759052255;
        Sat, 06 Jun 2026 08:17:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b98fdc2sm2537787e87.63.2026.06.06.08.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 08:17:29 -0700 (PDT)
Date: Sat, 6 Jun 2026 18:17:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] clk: qcom: gdsc: add LEGACY_FOOTSWITCH support
 for MSM8x60
Message-ID: <yv5t2llliqz5fv35cgw55o7usamrpujlnh3msmpz324l4p5yfz@s5pr4dos7sh7>
References: <20260606-submit-clk-gdsc-msm8x60-legacy-v2-0-187a32d2f015@herrie.org>
 <20260606-submit-clk-gdsc-msm8x60-legacy-v2-1-187a32d2f015@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260606-submit-clk-gdsc-msm8x60-legacy-v2-1-187a32d2f015@herrie.org>
X-Proofpoint-ORIG-GUID: ErJymAFtV0VKnOrj9KVWMLLXFfQpGFIR
X-Proofpoint-GUID: ErJymAFtV0VKnOrj9KVWMLLXFfQpGFIR
X-Authority-Analysis: v=2.4 cv=YIWvDxGx c=1 sm=1 tr=0 ts=6a243a0d cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=FpyeHBnFSVQUcGjnY7sA:9
 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDE1NiBTYWx0ZWRfX5RyOvb4efbkT
 OPxojZqObQNLBTwuXzfHUSJofb2/zNy5sb741DwgcVtNy6JEjzNaV53jkHAGKsPD6U+pJEtkY01
 dZEgP5wLbBRGNJFuFuFXsSRrlcls56sJYbCdkpHVELGROuI2znksw6+XNKFfOfggciAEeZsI5RV
 QKMm0yzFvYK5uOD+dDn5LOgqfJ12m+8Uxlm/SD+KFiZfRWFN7/JKXxKFrC7RIs8hLXjlHn99GgW
 YLzUCFST/Kq7LIwOVUvNGc7MWoJhyT7W9m95wgDZ4R8OAYzLM6ytv109HxfpFGpXPCJCc58kT1A
 75F5XHcQZdaLzFBC09DQQ160E72m4f0JRW9TMoQ/uok5P2ghzkdsLwbc3TMR4CqyLffPiVlKBmc
 CrZ7NYZy/TMNzQUSsdaU8lqEZuC8zxjRLD5IV6jctNKHfHr6c6bB2iiBXVnTOrJm6e6XFRqeGps
 dlcsN/GL/+ceiePoHTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060156
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111523-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:sboyd@kernel.org,m:mturquette@baylibre.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C032664DD03

On Sat, Jun 06, 2026 at 02:34:26PM +0200, Herman van Hazendonk wrote:
> The MSM8x60 family (MSM8260, MSM8660, APQ8060) ships an older
> footswitch (FS / "GFS") block that pre-dates the GDSC programming
> model the existing driver was designed around. Adding GDSC entries
> for that family's MMCC power domains needs the driver to understand
> the legacy register layout:
> 
>   - the CLAMP, ENABLE and RETENTION bits live in the main GDSCR
>     register rather than in a separate clamp_io_ctrl;
>   - there is no power-status bit, so software cannot poll for the
>     transition completing and has to gate progress on a fixed
>     udelay() after toggling ENABLE;
>   - ENABLE is positive-logic (set to power up, clear to collapse)
>     rather than the modern inverted SW_COLLAPSE semantics;
>   - none of the modern wait-time / HW-trigger / SW-override fields
>     are present, so gdsc_init() must skip the wait-config
>     programming block entirely.

I think there are enough differences to mandate a separate footswitch.c
file. It can further be used by MMCC on MSM8960 and APQ8064 platforms.
It might result by some code duplication, but I think in the end it
would be easier to read (and it won't clobber the existing gdsc.c code).
Add footswitch_register() / unregister() functions and call them from
the common code. Make sure they are replaced with stubs if
CONFIG_QCOM_FOOTSWITCH is not selected.

> 
> Introduce a LEGACY_FOOTSWITCH flag and the matching code paths in
> gdsc_check_status(), gdsc_update_collapse_bit(), gdsc_enable(),
> gdsc_disable() and gdsc_init(). The enable / disable sequences
> mirror what the downstream vendor footswitch driver did on these
> SoCs, with the regulator hand-off normally done by
> gdsc_toggle_logic() spliced in at the matching points so a legacy
> domain that has a parent regulator still gets voted up/down:

-- 
With best wishes
Dmitry

