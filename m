Return-Path: <linux-arm-msm+bounces-112866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xryAOjK5K2pWDAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:45:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A4F6775DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:45:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XkAEE3f4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=es0+5dGg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112866-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112866-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E5F9305D12D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 07:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ABE13E0C44;
	Fri, 12 Jun 2026 07:45:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15F03DE434
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:45:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250347; cv=none; b=BzGZiCSAb+nvOqDG39Z8Lh6mzgY6aZ49hUXvAXTN5yinrCoHHnKHWJf0lH64iXBiXpCgVqJutKcraFVbRMpIv5rnpOEcYeDfdSGYthqxx24fQ1oT8smX7BE5Gq4xWyuUZj658YIED4BEPBK5wKbg9jwsfoFawAUNmY/n84zi8jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250347; c=relaxed/simple;
	bh=oqyAAju77rL7I9tdHbdL32nVK3skm76C4Ttw12VmQpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oX3uEamx0ybmzbYlxzCClZXmZCUVeqyT6GR3sHPWYEUx5fd13ST5QSG0Qfl9AH2ug5eV+s8vnFnJUjI6vgd/KY80kXvRUPZukydwSaVKtJh2D5R7CnMu4PVe6/ksZuLshURq8lKumptDLH0l8TwYgSI1NmhXk6C2x4OW+mDI5G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XkAEE3f4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=es0+5dGg; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3Brf42506213
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+ZyRBCSN/hk3H4ai8tkv77y4cvsYinOfExSB9fWp4Fc=; b=XkAEE3f4TnrdvXCt
	Hm010cWpKbdklM8bfvOK1brDH5JLTw94l1+cAM9KYo2EzJzUVbKGaEtK6Kn0QMid
	Egj00FXymG9ZyzC469iuO1begwmZB+PPmzGS9WpIxQbb+AfKaQGQRtrD9YvPxzW8
	x2Tm6u/6/m0WLINOfgpMiW85Cirkw1MXrx/4UmNIWBwVc/gLWdh75daImhOsvpF4
	wpOhFOvTzygxot8LW6Y/jmi/C04/sYpMrDBEC2ZRaA3rE+XJ9UffcUGKvNUxsSWB
	rbPYeklWjTKEQxd7RgObdirOn2EmN0IQLTMy/t4xWAHvxQilBS/fOCqds2OUGmJb
	6FpBuA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1cbjk20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:45:43 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6c554284973so727182137.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781250343; x=1781855143; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+ZyRBCSN/hk3H4ai8tkv77y4cvsYinOfExSB9fWp4Fc=;
        b=es0+5dGgh1jFDQQ1iggg+nqQk4zRWkNrd9ZVwuKZEgMbTcUA3yzE0WIMmU9JXMmz7l
         HyzU8AbbGvqzeGoDOEkdWCWfey612eJ9HFpRyQC8/LH4CuXsNSsEPukCYpGSok51XV2u
         Rsrm3XQAhieCZ3Bv+KeBVTQFmAKyA8dW7ZeBkAHKBQfPXH1Waw73ljLVk5yFje5rHHuI
         +iE89PGhnGQYS/+BuM/P/eGEDuup7VKKeLIRJsmq2iAqcyxzOmVPs72P1Ra0SV8vY98M
         kwNodIOpiiPHhL83TjGL9IZjand6uclu2eUJvX2aHNJQYzyJbkIRGZfXYO0TaULVUWd4
         6JVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250343; x=1781855143;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ZyRBCSN/hk3H4ai8tkv77y4cvsYinOfExSB9fWp4Fc=;
        b=n/Bi1piydofqR0007xU8ZSqnT0DmADt8w4IJ8FCMg9DpT+ngiQaYw2na1+zvaAnNcq
         qzASwmrhroJFU5ilqEb1+J4fBBp/EEOqPoP5TeWc7e6RZqAruxnpvZJth133NPlhaFN/
         m9gqEwAoXZ3NGAoJu1O0vb6J6BU4LlrEogDmz5o9qLlUDH1HRbQw34Ojv6quUmmey920
         78ymKFdtw/1zrqnayrauSuG37v4ks5a8uzt6dONf7sSoOlcARYuUnYR/1yUfsZcSjbAF
         MfmgaQ0odCHQGJGU0ZsnFxbfJtImGgshm1S/MkxE1ToxK0BNf1A8ac0Itii07a6a9nfT
         0xJg==
X-Forwarded-Encrypted: i=1; AFNElJ/lF2sviHLy1HVDc/73Pc0eCT4SSooXYIQAXBd78eddozHdgrSA4Pwr/G1xuB58bZpeAQiuJeNP53iLcfmg@vger.kernel.org
X-Gm-Message-State: AOJu0YymOgvebygsZjlrV2L/OVU40yY65kucWy6Uf2AZYJeIIFNaxWO5
	jzch26IsAgLmdGnfRuxvDqAt2vGebP5tH84VuTEdD65ZQdOvXzNLj0o8rZ4lB2mh8eZ8v1cE8rc
	y3AvZvJsG7Zb9Cmi+AvWKH58PstZHYrZntv3vhFCWQFaOPoMBHPrzJ4kxlm6kASBBOWnV
X-Gm-Gg: Acq92OGAe0660L9+KOIZq5+T0Ea1hOr/Ra/uV4UdH1Hv4as2ILNA0T2KrjING/DVY5w
	1JElTCQkffA9ooA3fMJ2hNwQeyTTNer5V538GFJGIKm3TNYBG57fnfKY5148bVJY2OPcWvZFzWI
	E/it5VqK0h6jzqxK6ofJv4WJ3Slk+ZXuGALaDbT8K/wIqqwnFvO3gAN4kQazE9KUoKTOD7LlF9q
	FRHINpIV8+F8wXiG4g8wzg5+IyUExfNZkH1TCZPU3agEEem8jqp+bHmoOx5aIVIeZZ99ukDQaWB
	sE62ucrCpYNGyVNHild9LEXea5vQ2ByEqQf99hChz23P4JLfjQaEu/nY6VX9V1vVW67gscO1qB1
	+iWSwoAsBWEPgzYyBqmgpbciHiam8aw8UAxhrXJMSDQEWZwaly2QwJoMvbwvqzYf2e2AfNXcjHH
	f86fmLHFQVkX6kdotrZe5Babx7qb+9FkZJOhc=
X-Received: by 2002:a05:6102:5094:b0:631:44b7:b88c with SMTP id ada2fe7eead31-71e88d9512dmr679176137.20.1781250342885;
        Fri, 12 Jun 2026 00:45:42 -0700 (PDT)
X-Received: by 2002:a05:6102:5094:b0:631:44b7:b88c with SMTP id ada2fe7eead31-71e88d9512dmr679165137.20.1781250342454;
        Fri, 12 Jun 2026 00:45:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f3a7c2sm4277131fa.28.2026.06.12.00.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:45:39 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:45:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Herman van Hazendonk <github.com@herrie.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 3/3] clk: qcom: add MSM8x60 MMCC driver
Message-ID: <odah75s43zzrl75lh7sl6pmhoy6bd3rxy6h3fl37bjnmbscnvh@h4ehezi3abn2>
References: <cover.1780148149.git.github.com@herrie.org>
 <dae03d8bbd4a9cf14622eff86f8f83460fac5e86.1780148149.git.github.com@herrie.org>
 <a3a6f1a7-5539-48cc-920e-5a555ba04e7f@oss.qualcomm.com>
 <5umlewznxfu7pmprbvbprsqt5uwjzb666kw5gwdxethpfgur54@mlggwypljii4>
 <CAD++jLmm6VyFCrxYA14e-Cbj_7dQu1OkkazYiWS_=tSZgCRqyA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLmm6VyFCrxYA14e-Cbj_7dQu1OkkazYiWS_=tSZgCRqyA@mail.gmail.com>
X-Proofpoint-GUID: muLNPS07s-1o6x4YumA7bTKPo7H2ZO2H
X-Proofpoint-ORIG-GUID: muLNPS07s-1o6x4YumA7bTKPo7H2ZO2H
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA2OCBTYWx0ZWRfX6QZ9+05TgFtU
 6r8MRHvcmUJX945zgdPWUcDPtAWkTVfBB7/AziB+JLdZ5h7XU3nGXSOolYELkueNWAD5kIb1NbH
 jPG3CvDH8KY9ESPpeEmXSpEdIU9ghQs=
X-Authority-Analysis: v=2.4 cv=S57pBosP c=1 sm=1 tr=0 ts=6a2bb927 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=cTwmTnRGAAAA:8 a=G2TPh9Oh8OHQQZjzltAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA2OCBTYWx0ZWRfX+oi3FOIlzWzV
 KkGhZ1ip6UiTQIi9sw4zRIgsd7VoEEziyPMo1/hwTdrPHMNxl6Be72xCksyYnGtH5KQzZRdxzw8
 Q7JBIv5x4LOhJ5fso6nk/yYx9Uo4LBBjEWpac4+ryjaVJZILfSNv9BTcG6b14xKX82o5Z/p2das
 WgHXLKf1HVLF+jOJFiZMqnSI6SVDGOwtFa3xVXukIeFx16I4lYbj2plTh7spkSqWHOF4ZEfHk2N
 35k4QjLau2wR3N3u8dxjAr/rZzIU+JggzTgMzC/nb2oCONtlXcKhwZ0PifVBiIIAlODA8rAXZT6
 LWBzk1p4Q29ch0ooxDQynVwnkiavYFBhSeSsbNhVwAmt4rFRnJ/cc9Sc0qRRiTrg77wkpJF7L4p
 LFNNhpqwYURn0n8Zr1wbQEkLMUczhfYZkZpPHSwEE6ri6o3vAWvjpLkmDLRChheLPUhutj26NRK
 xxtU3DplcDfjOaakoeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120068
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
	TAGGED_FROM(0.00)[bounces-112866-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[herrie.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:github.com@herrie.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: A0A4F6775DE

On Wed, Jun 10, 2026 at 10:20:28PM +0200, Linus Walleij wrote:
> On Wed, Jun 10, 2026 at 3:39 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > On Tue, Jun 09, 2026 at 03:44:39PM +0200, Konrad Dybcio wrote:
> > > On 5/30/26 3:58 PM, Herman van Hazendonk wrote:
> > > > Add a clock driver for the Multimedia Clock Controller (MMCC) on the
> > > > MSM8x60 family (MSM8260/MSM8660/APQ8060) - the Scorpion-class
> > > > generation that preceded MSM8960's Krait CPUs.
> > > >
> > > > The MMCC layout on MSM8x60 differs from MSM8960 in several ways that
> > > > make a separate driver cleaner than parameterising mmcc-msm8960.c:
> > > >
> > > >   - the pix_rdi mux requires a custom set_parent op that temporarily
> > > >     enables both parents during the glitch-free transition;
> > > >   - the IJPEG GDSC requires releasing AXI, AHB and CORE resets;
> > > >   - several rate-source pairs (MDP pixel, GFX2D/3D) only exist on
> > > >     8x60 (e.g. PLL2-derived 228571000/266667000 for graphics);
> > > >   - the camera CSI / VFE / JPEG / VPE / ROT clock topology lacks the
> > > >     later 8960 reorganisation.
> > > >
> > > > Used on the HP TouchPad (Tenderloin) for graphics (Adreno A220),
> > > > display (MDP4), camera (CSI/VFE), JPEG (Gemini), VIDC, VPE and
> > > > rotator. Reset IDs are exposed via a separate header so consumers
> > > > can reset the GDSCs and individual blocks.
> > > >
> > > > Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> > > > ---
> > >
> > > [...]
> > >
> > > > +   .clkr.hw.init = &(struct clk_init_data){
> > > > +           .name = "pll2",
> > > > +           .parent_data = (const struct clk_parent_data[]){
> > > > +                   { .fw_name = "pxo", .name = "pxo_board" },
> > >
> > > Please drop .name (the kernel-global clock lookup), this is only a
> > > backwards compatiblity measure on existing drivers. For new entries,
> > > .index is the best (because well, it's the fastest)
> > >
> > > [...]
> > >
> > > > +static struct clk_branch camclk0_clk = {
> > > > +   .halt_reg = 0x01e8,
> >
> > From msm-3.0:
> >
> > +#define DBG_BUS_VEC_I_REG                      REG_MM(0x01E8)
> >
> >
> > So, it seems, it is a debug reg, not an actual halt reg (but I might be
> > mistaken here, I haven't looked into the details).
> 
> I think the define just has a bad name. You have to look
> at how it's used.
> 
> This define is in msm-3.4 for msm8960, clock-msm8960:
> #define DBG_BUS_VEC_I_REG                       REG_MM(0x01E8)
> ... and then it is used in 10 different places as a halt reg:
> 
> $ git grep DBG_BUS_VEC_I_REG *
> clock-8960.c:#define DBG_BUS_VEC_I_REG                  REG_MM(0x01E8)
> clock-8960.c:           .halt_reg = DBG_BUS_VEC_I_REG,
> clock-8960.c:           .halt_reg = DBG_BUS_VEC_I_REG,
> clock-8960.c:                   .halt_reg = DBG_BUS_VEC_I_REG, \
> clock-8960.c:           .halt_reg = DBG_BUS_VEC_I_REG,
> clock-8960.c:           .halt_reg = DBG_BUS_VEC_I_REG,
> clock-8960.c:           .halt_reg = DBG_BUS_VEC_I_REG,
> clock-8960.c:           .halt_reg = DBG_BUS_VEC_I_REG,
> clock-8960.c:           .halt_reg = DBG_BUS_VEC_I_REG,
> clock-8960.c:           .halt_reg = DBG_BUS_VEC_I_REG,
> clock-8960.c:           .halt_reg = DBG_BUS_VEC_I_REG,
> 
> and in the mainline msm8960 driver 01e8 is used as a halt reg
> in the as well, see drivers/clk/qcom/mmcc-msm8960.c.

Ack. It would be nice if this was mentioned in the commit message.

With the commit message updated, it makes sense to me now.

> 
> Some qualcomm clock registers being named DBG_* has no
> semantic meaning, one has to look at the usage. Maybe at
> some point some engineer thought it's a debug feature to
> be able to halt a clock.
> 
> Yours,
> Linus Walleij

-- 
With best wishes
Dmitry

