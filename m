Return-Path: <linux-arm-msm+bounces-82109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2C9C6453B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 14:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DB8F834108E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 13:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A849B30F93F;
	Mon, 17 Nov 2025 13:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yo1HwbgP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HvJmhSaq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3486330D35
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 13:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763385412; cv=none; b=LkiiuIVsMkaioGqjt6sDhhIyNVF7w800RQX+uuTxFjUoMHmngtzsdoophrTBqp93YU9goRb1oYcu3tc+8Wv5HAfuN2pn8NmT8QC/YzIrUoA1TQKhcDu1oeVkNrsYYZvvNywAZXoKWKTa0QrME0lB1dZW/y/gvzPRnXcpJZz3jmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763385412; c=relaxed/simple;
	bh=Lg1FNQ/T2tb3wYSaYu1C2YXzroX2S9Vu+0zBOuUf58Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ivgiFqWtFp6jQ2b+I8/0+WiuYujcPMHto9+1x0EpzkJFhklWzVzCa1tHS6i/r5rhSF8RS5jvwO0xGlTMIKoyk2dDibzo9XpPDFw9oqkRG+oiDnSWKThCjyII3qwYsaM+x4JwKGTPb5ywW2gAUo9uGaeHXzPLviBNgg30+pv8IRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yo1HwbgP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HvJmhSaq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHB4bia3318397
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 13:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Vj5ZcMOs3KsLHT8Zdi03abv/
	VC07dPRnuxMbrQ23NEE=; b=Yo1HwbgPT0K1lIgI7/ws2S/Gme5GT3BE70Jy/BbL
	L3qHAHm2tdmv6m2qTWF+uJgwegqXkQlrj4nozq9+0uraKnQrXvRjMrjBSq/kqMTz
	yfwRAb2/qKHAxT/aHn8sKP8Ge19exTAr6Xt9PUvkKqkFtNDgVKcyWCAqjFYDG/Nh
	bPIg68DqOi9TbF3wHcxTyxfY9ZKj6+NQCdaeuTZt35UDEPcGAKydX0dG+6Ui/8eP
	I1D9ZF1eZvQVkdZ25JbQ2pqH7L9lVpkGTgTN/yrlFQDopeM6pcmMdSHye7u3yTyy
	V1WNuC73hFqzLRbY4gm+CjeSRHT5nwX/956V0NVKzaCPHw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejm5ctj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 13:16:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-343e262230eso5225670a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 05:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763385409; x=1763990209; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Vj5ZcMOs3KsLHT8Zdi03abv/VC07dPRnuxMbrQ23NEE=;
        b=HvJmhSaqZI0WdZYWfbltqvIHn3jbrVOdwIHspoo6c6rxh8bS9Ar6t1/4Ndh1gPo497
         rry94WpFlG2ehCjWlhRHSoOYLrEZ8KqD50o7fb20Gw0ODr8bdy7AR38eSMmka32epYPg
         NBX2f2rCoy/ZcUWmFmXEyPlLw9fRdL8jnlwm2Z3JJiTGfdjhqVgG6SONSouFTfP/ZC3v
         yMxC6u8ODs9TGihMQoflHwp82vCvt9YtA4SryBzaO1BXzo7OteBn6umCAumMxLfx1QGG
         xcEJgk/PcAUJWODxPt3LDdY6w1dTY4XeFPb+JLhB01Ds9u12rJfjVNAhWHM4KvW4FJe8
         dHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763385409; x=1763990209;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vj5ZcMOs3KsLHT8Zdi03abv/VC07dPRnuxMbrQ23NEE=;
        b=BD0X52iqQtGur1LNi2jqUPpXEdL3WOuBpVovGsdmMfe5alDqrs7aximVni4RfDLN44
         ITZqQpwgnyVSGtnW4f+GzlpA0CioI6qa388n1zitZz505dmLWvWyjQCWWTLqG2yKZ8WA
         78xb3NWcKxpq0liLHhNTY6de0qVE+oS31TAes68TyBSHJUJFZeFR67fYuV/nhlpnw+qe
         mswuF3Ln/rlAGX2rR2CbllV27kAVTi6E8ooUeaqntZW4sZDK0ExyrUM0Yk5GJuEjsuIh
         j4fi8dHzqZMLfUf2iJguT76Y1FGcQKV3I5vI7nbLSGX6eYGHVfqjzIms3eZFD+7SDtDj
         Xjdw==
X-Forwarded-Encrypted: i=1; AJvYcCVQoZVLGP9u/HE1/wgjlNqDWsTxlPczwYWIwlBq0IvVCznIDfspZmFXLqoRLmLQaTI406FgdQ0Uev8rZd76@vger.kernel.org
X-Gm-Message-State: AOJu0YwUTAvy8MN0wzoDR6rWrbqisYuJL4vvdTdCBBQWLBdUI7cYgpod
	HC6bCgM/2hfmpwGJGOlXWNqB0IbC3GTQRKcuix+4ygSSqLmFN76PiyUXQ/nmlLo7u2Ej0mP6/83
	+jzLe4B4Y8lwaqDseRBG3HDTii0WdQFEDA4ome17BajazQ04yhiHmEIwqsTyhgLpaTbo6oXGDRH
	JAJTDgVYRc6vndo6c+bRqyfHEGpPTqe9M/sGr/E3dyKo0=
X-Gm-Gg: ASbGncshm5iZtuZpcNePuneiTghTGyOLhSenHwOlC2O0Np6i7+ToEBKPObQSBGNRGiY
	OX4gHRDfLlgdpd5SVAhTjHL0z4dN5GR6+ZW3RF8w8Vfp6ZNl7JN2tsmKFZNmA5W0cgM3aimf+vo
	/Rdu2AMRoWnXbpcQZXMgSfylc0rQoppIfP5QwCYe//3U6x6eQivKcwBKrJtBbDxDTPVivC/fMAF
	IPjRfqZtfC2ask=
X-Received: by 2002:a17:90b:1647:b0:33e:30e8:81cb with SMTP id 98e67ed59e1d1-343f9eb3971mr13201760a91.13.1763385408488;
        Mon, 17 Nov 2025 05:16:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFihb7teyupjKqIBCMh+TDYSyILYGMrEp4gWjInkFX5Zos5pwMEb0Fz1Uc0Vjzvg2oHO3cVkntD3anF1J/+5y8=
X-Received: by 2002:a17:90b:1647:b0:33e:30e8:81cb with SMTP id
 98e67ed59e1d1-343f9eb3971mr13201713a91.13.1763385407848; Mon, 17 Nov 2025
 05:16:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251115-dpu-fix-gc-v1-1-0a4fd718208d@oss.qualcomm.com>
 <6457c60a-2ede-4df8-ad82-d974690eba89@oss.qualcomm.com> <CAO9ioeUfZQVy7VFUp8FEVHN2_uL0ZB9jbkuexWY4D12YN_O3Jw@mail.gmail.com>
 <8541a10d-99ca-43d2-bafa-8e33bba01382@oss.qualcomm.com>
In-Reply-To: <8541a10d-99ca-43d2-bafa-8e33bba01382@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 15:16:36 +0200
X-Gm-Features: AWmQ_bldWn3qGJhpGBYv-2oYFmnlXXeCyzixQ_jXnUrblALzLNWv8mieP4Sa1iM
Message-ID: <CAO9ioeVT_1qGedvdACkE4pqbsP8VReeArbe=-zaH-SHfhi3pkQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: disable gamma correction unit on SC7180
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Federico Amedeo Izzo <federico@izzo.pro>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDExMyBTYWx0ZWRfX4bfwidH6jnMg
 XlYsWiiGMv4NM2Iu3r8FmGTPivN3v2ryFEi9n9vm/s6EtIWNbiwp0lUiM7oZClNAwisKYfOWWDL
 KW3193PlFluf8pXFQ7xHbFagEkEPWzMYWpnAR/yOzVGqu6Mh42S1VAk8w6tDdzBrNN7VIphJdya
 mmRZN0GXeOQcd/PLDSfhV6ZZTJ9+Y9Cq23HZ3fJK1nTXQx4hIiP0Zp3EFtvk6e2VVHVenQSym5G
 uEprsLiLocSSI0NzKqS0DTzfbJopGIlJ8qnD8yEkZFsOKXxzn7EzJ6bkXR+83pYN5tGEa2vQEMT
 UofJKMuyp7dlEsx75xcoVAtpAr1avmHA+PLhBzJtDsn1ieyT1Y3OwwQojhLs/DrsTvebpn4YFxU
 jXRNGfSTjN32IP4yalv3h9U8EnpDEw==
X-Proofpoint-GUID: AzVP3NKxSn1EMGYktut4EkP_u7s2ttCx
X-Proofpoint-ORIG-GUID: AzVP3NKxSn1EMGYktut4EkP_u7s2ttCx
X-Authority-Analysis: v=2.4 cv=Pb7yRyhd c=1 sm=1 tr=0 ts=691b2041 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=srVbb6NRTgbgkvQ9qfIA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170113

On Mon, 17 Nov 2025 at 14:10, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/17/25 12:51 PM, Dmitry Baryshkov wrote:
> > On Mon, 17 Nov 2025 at 13:25, Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 11/15/25 4:08 AM, Dmitry Baryshkov wrote:
> >>> IGT reported test failures with Gamma correction block on SC7180.
> >>> Disable GC subblock on SC7180 until we trage the issue.
> >>>
> >>> Cc: Federico Amedeo Izzo <federico@izzo.pro>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>> ---
> >>> Most likely I will squash this into the GC patch
> >>> ---
> >>
> >> Peeking at downstream, 7180 and 845 should have the exact same GC
> >> (v1.8).. it seems like there's an attempt to program it through
> >> REGDMA instead of regular reg access. Not sure if it's actually
> >> necessary or just an optimization
> >
> > I think it's mostly an optimization.
> >
> >> What tests are exactly failing? I couldn't track it down on FDO GL
> >
> > See [1] and other failed SC7180 jobs from the same pipeline. I haven't
> > triaged it yet, but I assume this might be related to platform
> > resources (it has only 2 LM blocks and only 1 DSPP).
> > Another possibility is that maybe we need higher CFG bus bandwidth
> > when writing LUT registers.
> >
> > [1] https://gitlab.freedesktop.org/drm/msm/-/jobs/87878393
>
> igt.kms_color@gamma.log fails, we get an ENAVAIL (-119) (which doesn't
> seem like a good return value for this error but anyway..), dmesg says
>
> 05:42:13.199: [   75.472174] [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu error]failed to get dspp on lm 0
> 05:42:13.199: [   75.481487] [drm:_dpu_rm_make_reservation] [dpu error]unable to find appropriate mixers
> 05:42:13.199: [   75.490235] [drm:dpu_rm_reserve] [dpu error]failed to reserve hw resources: -119
>
> which comes from:
>
> idx = lm_cfg->dspp - DSPP_0;
> if (idx < 0 || idx >= ARRAY_SIZE(rm->dspp_blks)) {
>         // misleading error message, it's not LM%d, but DSPP%d
>         DPU_ERROR("failed to get dspp on lm %d\n", lm_cfg->dspp);
>         return false;
> }
>
> which comes from:
>
> static const struct dpu_lm_cfg sc7180_lm[] = {
>         {
>                 .name = "lm_0", .id = LM_0,
>                 .base = 0x44000, .len = 0x320,
>                 .features = MIXER_MSM8998_MASK,
>                 .sblk = &sc7180_lm_sblk,
>                 .lm_pair = LM_1,
>                 .pingpong = PINGPONG_0,
>                 .dspp = DSPP_0,
>         }, {
>                 .name = "lm_1", .id = LM_1,
>                 .base = 0x45000, .len = 0x320,
>                 .features = MIXER_MSM8998_MASK,
>                 .sblk = &sc7180_lm_sblk,
>                 .lm_pair = LM_0,
>                 .pingpong = PINGPONG_1,
>                 // no dspp here, errors out
>         },
> };
>
> would simply binding .dspp = DSPP_0 to the other one just work here?

Only LM_0 can use DSPP_0, that part is not flexible.

> Also, would that mean we can only have gamma control on a single active
> LM at a time?

We can only control gamma on LM_0 on this platform.

BTW, the other log is more interesting:

[3] https://gitlab.freedesktop.org/drm/msm/-/jobs/87895515/viewer


-- 
With best wishes
Dmitry

