Return-Path: <linux-arm-msm+bounces-65638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18037B0A112
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 12:52:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44E6A16DBC4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 10:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88ABD299950;
	Fri, 18 Jul 2025 10:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XQ3fnn8K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0115A295DBA
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 10:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752835938; cv=none; b=cBdPu7I0Yy/xDHdY3uqB1BSjx4WDIgIw/M3P82+Uht4sEyhUbzvhEzrpw6yXfVf/n8V0rOY29OTO408smOvIRrKBk5yZWS2Fp/GdJszbHTnptM82+CeBmb1+Y4AR4H2t9yt/L8dGNlAJCzd2+5jKs94D+GHoPDVMOJydjdtidho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752835938; c=relaxed/simple;
	bh=JTw4ho8gPONRFyF3/gD6HJRo/r9ISc5JMn6DPjK9wo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PnfqAHhEigSXho2PIsRNdlKr53ygI7qLLAMLQosKpFPeJ5PdZ8inpJIq8gkaeSFTjB2YJHQdQP0Rc3e9a14xUjhufXl+tet3lDq4ucyN8b/JC2jkeAJvRPuTUwJAIMHmn/lJpy6WB0abG5LnYmfSCGHwIg39o/UBP9EtsigxQQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XQ3fnn8K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I8UgOd021705
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 10:52:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z5VSiGr2ZsbWALN5zUGrP4LvnTpKbEmqDudeNgwiofk=; b=XQ3fnn8KWQnlFULU
	5L3W73USuyaN7s2dXbIcdUf6p7jmGnYi+oke2do1OxoajZRizQRTxrENbqmhs2Hw
	GYvuHVhwEm8qWnR56XeNF2cuT1eRtQ3D0HZ7PmoP3fhHB+StAnc3DDP/30xVU2+h
	Bi+OeqluFL5oHg1PycnzPfWSVOJl5Nqqrg6hHQfvskCZsQKbpgD+7/TQISiMldkB
	RflRK94JMxxC8YJLNfsEcyQc4ez8zmq28wM3y90BXwId2VNXTM2Dj5LL4b1OehHE
	AWstoSXfcxsCwDemu8BRjgxb3GyFCYPFBL8S5YwYx90GYdPU1MW6p9BplYHZTiMm
	9Pe8vQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu8k1c3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 10:52:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fd3aeb2825so59402556d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 03:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752835935; x=1753440735;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z5VSiGr2ZsbWALN5zUGrP4LvnTpKbEmqDudeNgwiofk=;
        b=XNZKC+qz89OlGPEJBZLJ4dJEvk2elBgw6nYgNYy5rKYGbvfF9YtDPuVUE3h0RhTmiT
         4ZgH15bq76hyZcVeSU4E4nweMp+3vcRqMPnWuaaFPAtMZn++RXH6ihkP6BPLhlmgwi/R
         6lvTYotjqOXdf6xcjxdyRd+40iODLMiGCxRIxS8MFmTUld+RZypz+HgvBd72+/N6CLkl
         kgnVAxYZ3R0cOZcdlg4DTk+1rf2kuujoBlbDtYAU8/BonDss0W0T5MPkJ+cLih2siwHz
         86Bzb4lcUnX0lvsTKrq6nOSvXxghX/zBHYo5wcL5ri2UdojrzGCQlB+cU+pZk91/o/Th
         RrKw==
X-Forwarded-Encrypted: i=1; AJvYcCUHyZhvtOFSnIUN5Qib4pG+pDtjUl+3CciAm1tH2yFdjbX0YVPAUMmixmmNqnfjLKpTYC8U/WG3ny8HY951@vger.kernel.org
X-Gm-Message-State: AOJu0YxjIox+2eX4oEyXLjJqWZW9EZt3jskLiV1eyTDITo3LXWkkaZFH
	Y50vetedhtyNGbk582MN10kYvDZt3V9e/M/w4I++sh87Kl9cO/IkgTKgVKCXNZHXXfN9uiBcquw
	7Tykp0hfhIFcifqPwUlCRjkVj78reb/S6RuuwisEoXfXFnt6koa/DyXlD4523zPYlGcKI
X-Gm-Gg: ASbGncsNxbR9hs0G0n/KtB2wUvBVKVq1NBQvHWrJVyh7zzyiJ3smASpGuxdfojGdTP/
	DivRFtkVKURB7I2XQ0euhSlJI88qQQsArVvLE+Bs4HJ2XthTALtuC2P+jD+WWE5A3viazOzackN
	RgLqlERLJrBRBgvZMC+t4izKQOZ5AWsGssEHKZWodfbGPvVGgBCG6h/UrJMJmbqfNbN06GRDXfx
	D+BBjHtyUlo/35Gu442YbRWgta/EdK9SEeiRurYjqffqVBzElNmx9E0sXXTfa4eq0M/hM30JRfz
	w78NY81zulV97BMcZ6b3mzNgMqlifKEjDtLF5t5oqxwZ2vlP9gJ32nCyWwgShdNTkUp0TfmcfGb
	sitQdC164DeyJWCVI53Wip1SAge1kYRXCbXnyuCo5WMaC0hob5/eK
X-Received: by 2002:a05:6214:e8f:b0:702:d1aa:46e6 with SMTP id 6a1803df08f44-7051a113c5amr35693426d6.28.1752835934540;
        Fri, 18 Jul 2025 03:52:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKvAUe8ztGpRE1cKK45MSgMouCPAT64Xsgug+JyUGRTY/H140Uw/uocYvI3w9Cr7n97LJF1w==
X-Received: by 2002:a05:6214:e8f:b0:702:d1aa:46e6 with SMTP id 6a1803df08f44-7051a113c5amr35692906d6.28.1752835934062;
        Fri, 18 Jul 2025 03:52:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31d7c6b2sm212215e87.86.2025.07.18.03.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 03:52:13 -0700 (PDT)
Date: Fri, 18 Jul 2025 13:52:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?SsOpcsO0bWU=?= de Bretagne <jerome.debretagne@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xilin Wu <sophon@radxa.com>, Dale Whinham <daleyo@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/9] drm/msm/dp: Work around bogus maximum link rate
Message-ID: <jsynzhzzt4drqcrvbuprjnvu33go4gow3l3hxgafuczdn67uhm@2eq7c5rzflr5>
References: <20250714173554.14223-1-daleyo@gmail.com>
 <20250714173554.14223-7-daleyo@gmail.com>
 <A9DB4AE061FD8BB9+3519a519-1a29-49c1-a07d-28a0577677cc@radxa.com>
 <CA+kEDGGaKrYO9Pu3un_Nq_6AOZC5L9sG+CEwh2ZEzWFeHGqtEA@mail.gmail.com>
 <eb0f5be5-3a6f-4969-affd-c01a6216ad0c@oss.qualcomm.com>
 <CA+kEDGE1kb12pW_OH1n4LmB9PVtgEsft563p9Cx_Mxev9Em3Ow@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+kEDGE1kb12pW_OH1n4LmB9PVtgEsft563p9Cx_Mxev9Em3Ow@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA4NSBTYWx0ZWRfX6HUbyalZL6l0
 R/3RKa1O/wQJuvEPxBfvaMq2v60RmfcLVhGH6K5LQZ4Zs4EL6WEhmexy1M2oHcgEcUmAjfbEp85
 wnT+JIq0N+eEoa9+cnETmEJziwH83PVi+31Lw5OYn24x4lZYC53us16zMLeJa4qM8o3z0Pf2Gle
 zEoFs+DShZs1Ik/LBJyQ47oHomiFuLvNYeYMxoHJmw9p5oaB8VjNeVgR/RGP03oNyPUCXbdtIAB
 9VYKwfy7So9PJ0fBh0PPnEDqI1K/bgSlmrG9tTNxXL81nXdHQRnHH9VIRAAiZ0UcHUSN/7lGQ5T
 GQmLYTzFJsF1Q3ABDx2VRk7vOE0USIY9tPjAtL4pCVlcwjocMaMk6a9f/tV3pcnODCl+FaMjQG3
 u7rQ/FISWxmr0ybL2gpJp0SFaHw9mJquSM6cf3VoJ3A+E3t1lMdO43yo/y/KslFB6w5o5rJO
X-Proofpoint-ORIG-GUID: o7V3ok3ym_pfqOxE5OAWHJahxhkRlEmu
X-Proofpoint-GUID: o7V3ok3ym_pfqOxE5OAWHJahxhkRlEmu
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=687a275f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ksxQWNrZAAAA:8 a=pGLkceISAAAA:8
 a=7PkR_4yZ3uwBbB41sqoA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180085

On Thu, Jul 17, 2025 at 11:36:38PM +0200, Jérôme de Bretagne wrote:
> Le jeu. 17 juil. 2025 à 23:10, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> a écrit :
> >
> > On 7/17/25 10:27 PM, Jérôme de Bretagne wrote:
> > > On 2025/7/17 04:21, Xilin Wu <sophon@radxa.com> wrote :
> > >>
> > >> On 2025/7/15 01:35:42, Dale Whinham wrote:
> > >>> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> > >>>
> > >>> The OLED display in the Surface Pro 11 reports a maximum link rate of
> > >>> zero in its DPCD, causing it to fail to probe correctly.
> > >>>
> > >>> The Surface Pro 11's DSDT table contains some XML with an
> > >>> "EDPOverrideDPCDCaps" block that defines the max link rate as 0x1E
> > >>> (8.1Gbps/HBR3).
> > >>>
> > >>> Add a quirk to conditionally override the max link rate if its value
> > >>> is zero specifically for this model.
> > >>>
> > >>> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> > >>> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> > >>> ---
> > >>>   drivers/gpu/drm/msm/dp/dp_panel.c | 13 +++++++++++++
> > >>>   1 file changed, 13 insertions(+)
> > >>>

[...]

> 
> > >
> > > Is it a feature planned in the short-medium term within the MSM driver?
> > > If not, would a quirk like [4] be acceptable upstream in the meanwhile?
> >
> > I'm not a display guy, but this looks like yet another block of code
> > begging to be commonized across DP drivers,
> 
> I agree 100% in principle, but the 3 implementations are different today.
> 
> > so I wouldn't expect it to be a big blocker.
> 
> Well, it is for me :)
> 
> > Adding a panel quirk doesn't seem in order, as the panel is /probably/
> > very much in spec, and it's the driver bit that's missing.
> 
> I agree that a quirk shouldn't be needed. I guess we'll work on
> upstreaming everything else and keep an out-of-tree patch for this
> issue for the moment That's a bit sad as this will block regular
> users from easily installing / testing via the Ubuntu Concept ISO
> for instance.
> 
> Or could the quirk be accepted temporarily with good comments
> then reverted when the driver adds the missing support? I guess
> it would depend on the time scale of this support landing.

Unforutunately, there is more than that. We should also be writing the
LINK_RATE_SET register. So, just setting the max_bw is not enough.

-- 
With best wishes
Dmitry

