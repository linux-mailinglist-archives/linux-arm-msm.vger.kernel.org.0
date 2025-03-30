Return-Path: <linux-arm-msm+bounces-52838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6B9A75B55
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Mar 2025 19:17:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1233D188C175
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Mar 2025 17:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F591922F4;
	Sun, 30 Mar 2025 17:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VXU74ws/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDDF3D3B8
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Mar 2025 17:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743355069; cv=none; b=KlYIKYHw4Ruz9+GR7BmlwkjQa43b2GKmKSdeO6BOG5Qca+UBh1j1eizHlt3oebt8e3++zQ91pIGv7PaT0kABuscMpY0T5AOFeEpaSRGtLZBz2Vzjrfnk6bNKA8S3wtr5nUN6sPxAhkEUxS4qIM0RnAVJIMU3M1TcxKfuytlBg4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743355069; c=relaxed/simple;
	bh=S9AM5kQkINYFuwdChO0UETHMV8+Nceks4e+Zzk78Ad4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QMtucJcXBy1StrVe/JUkqEKPEubHqp3n5HY1a99ckUIvD37Dpuq63G0VqBUWw83+amspeooJKfFneGxV1otSh6oZa6OW0Oy46/SpMIUXrokPAvQUuy1ypqeZ+szS4rLB8QrUhLnklSkfmbpOzDifYinBKw11XbhBWN+K05/8kKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VXU74ws/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UDwYA3009617
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Mar 2025 17:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EcwUdgEiSYf8BTglQ0dIsDse
	ErgZKSvhrPT4HqNTL9k=; b=VXU74ws/EgVaXuLpI3SybCXfNFE+Sk1b6sz/qWN4
	FdRvgA76UV98/HCjnohkWCsIJcOHv/UVw28A6/KRAWokFNP4v0AhlDNiRYIDWsSC
	ynunMDf1SehqTwTrqkQ59fDrUijS8iSmZsnZduXLpoCxWkeL9K3TI9xUqvR5iEu9
	2dyx6X7x6wrpLjzPet1j4kLD1tDNN7lQlS83XKgK5v8dUtQ0B5D/DXFYAM0MC4PK
	dPN9lB5n8O/JPTGpDR8Yy1g0LdS6l7HjIpkX1Gm1Udu77ZgaCN8yC3mIihXntVE5
	lbWEGDkt3nYRuOCW6jI54xlXsmPCWvRWOvsAxh3WxcJ2zw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p8f1ajvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Mar 2025 17:17:46 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff6aaa18e8so6169115a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Mar 2025 10:17:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743355065; x=1743959865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EcwUdgEiSYf8BTglQ0dIsDseErgZKSvhrPT4HqNTL9k=;
        b=ea12EiAR4luyRNT0EfjVD6q8e248I+wyLOJKu/nZ52QUH5YvlKE6YZSaNF6r3gyg4l
         BakjihnjHlJu+SjvO+MgSN0u+0mJHYMLuY8TtajWSUXsIIqiO5fjogJ5IXW/RotyvmJZ
         mfGUwh7o5uqVLJX/esiYEMBjgZgtIFxifDdUKrIJfIwfDik2qrdDG36BPziNBESJicIR
         8c2pKrxYVfsE8DeiqHjlGuqLRUbS6qg6hYs2iF7esJnDkp5sQfbxXH0JFBwH4XGmn4IS
         LqGqiaiXe7egCXjAvWiYen2Dirr5HcrUG0LENLcSc936iZ7vwdbeL1pmg76K1VCboOFe
         BONw==
X-Forwarded-Encrypted: i=1; AJvYcCX4KI7EvR9rjTuT9vXMutA4tk8lHmrMRzw90pjM0lqmuO9zkSbipeV0RKU5VLJUUoh439pEhCl2mmk8bE7/@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs38e5gTygApCgy2ir5Pr5p7t0cAeQo3BSatkx0iMVJh/QLoQk
	67XIbi1ycnz2GRQ+YrxGQxXUldbE+sr/+1vVpUEy5YbgmyNtLgRRHIgHpg/cHx1xg9zHjeeuV6f
	ZRmrun28kMmjlePNn7Dm8X8+Mz+zw/foKQJv1aoLqhjs7Bc17FiXzHKzmB5/q43Wv7NZYm4Z3rE
	daYMBhDXdbU+HK/W0o4u/XPSH/Zt+YsRk7rgJaWaM=
X-Gm-Gg: ASbGnctnd2Ju7G19dEkFB6WSFyDD5+O9QGLXgCgQOIRvt1o8zbHeMAUxvTfs+cHrD/r
	HuTG+jQIO5MlmHz6P6V//ADMFMH1D+5jkROLlZsiZWKHGGkxH4YpzPWq37fWHcwNFVJAGyqE0
X-Received: by 2002:a17:90b:3a44:b0:2fe:a8b1:7d8 with SMTP id 98e67ed59e1d1-305321654e3mr9795821a91.25.1743355064707;
        Sun, 30 Mar 2025 10:17:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE169pd79jXAIo01uzlr+kN2gZtfMu7kLVkVb4gh8lE1YluloYnuKAfYmw0Vaz94tUj+Ycsdr2wdfChwIZz4rc=
X-Received: by 2002:a17:90b:3a44:b0:2fe:a8b1:7d8 with SMTP id
 98e67ed59e1d1-305321654e3mr9795791a91.25.1743355064304; Sun, 30 Mar 2025
 10:17:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v3-1-156801d97a8a@linaro.org>
 <qub7j44btsgd2vdn67jn65c7y7kx4dhjojoh4z5erjalugctad@fyenu2xkuo4b> <CACr-zFCOqGmsFnJ_aW7cV99gmQdEtso3JGEiFFeKjk6-p6R54w@mail.gmail.com>
In-Reply-To: <CACr-zFCOqGmsFnJ_aW7cV99gmQdEtso3JGEiFFeKjk6-p6R54w@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 30 Mar 2025 20:17:33 +0300
X-Gm-Features: AQ5f1Jp11F-zF0UJKEy2saRvg3cnx5AXZoElc2BHHK_IVeLuKyNtM3nbubHanT8
Message-ID: <CAO9ioeWTgK2AYYt19VSOVjF6rt00xZ=gt1=dUb4A7UEEMwgaSA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/dp: clamp PWM bit count to advertised MIN and MAX capabilities
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Rui Miguel Silva <rui.silva@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=AsDu3P9P c=1 sm=1 tr=0 ts=67e97cba cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=SrgeRYV4RCk8RcaWdqsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: xkbASCHmYW0lMF7XL4nyw2u3nmYBCUy8
X-Proofpoint-ORIG-GUID: xkbASCHmYW0lMF7XL4nyw2u3nmYBCUy8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503300120

On Sun, 30 Mar 2025 at 20:11, Christopher Obbard
<christopher.obbard@linaro.org> wrote:
>
> Hi Dmitry,
>
> On Sun, 30 Mar 2025 at 17:42, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Sun, Mar 30, 2025 at 05:31:20PM +0100, Christopher Obbard wrote:
> > > According to the eDP specification (VESA Embedded DisplayPort Standard
> > > v1.4b, Section 3.3.10.2), if the value of DP_EDP_PWMGEN_BIT_COUNT is
> > > less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, the sink is required to use
> > > the MIN value as the effective PWM bit count.
> > >
> > > This commit updates the logic to clamp the reported
> > > DP_EDP_PWMGEN_BIT_COUNT to the range defined by
> > > DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN and _CAP_MAX. This ensures correct
> > > handling of eDP panels that report a zero PWM bit count but still
> > > provide valid non-zero MIN and MAX capability values. Without this
> > > clamping, brightness values may be interpreted incorrectly, leading
> > > to a dim or non-functional backlight.
> > >
> > > For example, the Samsung ATNA40YK20 OLED panel used in the Lenovo
> > > ThinkPad T14s Gen6 (Snapdragon) reports a PWM bit count of 0, but
> > > supports AUX backlight control and declares a valid 11-bit range.
> > > Clamping ensures brightness scaling works as intended on such panels.
> > >
> > > Co-developed-by: Rui Miguel Silva <rui.silva@linaro.org>
> > > Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> > > Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> > > ---
> > > Changes in v3:
> > > - Properly rebase patch on top of latest version of drm-misc-next.
> > > - Make patch more generic by clamping PWM bit count to advertised MIN
> > >   and MAX capabilities (suggested by Dmitry).
> > > - Link to v2: https://lore.kernel.org/r/20250327-wip-obbardc-qcom-t14s-oled-panel-brightness-v2-1-16dc3ee00276@linaro.org
> > >
> > > Changes in v2:
> > > - Split backlight brightness patch from T14s OLED enablement series.
> > > - Use PWMGEN_CAP_MIN rather than MAX (Dmitry).
> > > - Rework commit message to reference eDP spec.
> > > - Rebase on drm-misc-next.
> > > - Link to v1: https://lore.kernel.org/all/20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org/
> > > ---
> > >  drivers/gpu/drm/display/drm_dp_helper.c | 48 ++++++++++++++++++++-------------
> > >  1 file changed, 30 insertions(+), 18 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > > index e2439c8a7fefe116b04aaa689b557e2387b05540..fcc26cb96a51066a503433b2dc660126155d179c 100644
> > > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > > @@ -28,6 +28,7 @@
> > >  #include <linux/init.h>
> > >  #include <linux/iopoll.h>
> > >  #include <linux/kernel.h>
> > > +#include <linux/minmax.h>
> > >  #include <linux/module.h>
> > >  #include <linux/sched.h>
> > >  #include <linux/seq_file.h>
> > > @@ -4033,8 +4034,33 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
> > >                           aux->name, ret);
> > >               return -ENODEV;
> > >       }
> > > -
> >
> > Nitpick: please keep the empty line.
>
> Sure.
>
>
> > >       pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > +
> > > +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> > > +     if (ret != 1) {
> >
> > No. Please take a look a few lines below, where you are removing
> > corresponding lines.
>
> Hmm, the original code which reads CAP_MIN and CAP_MAX both check if
> ret != 1 too, am I missing something ?

Yes, you do. Please scroll this email a few lines down.

>
>
> > > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> > > +                         aux->name, ret);
> > > +             return -ENODEV;
> >
> > Hmm. Why? It was 'return 0' before and your commit message contains no
> > explanation.
>
> Yeah, basically returning 0 here would not set bl->max but indicate
> success. Is my logic correct? I will simply update the commit message
> if so.

Please describe that in the commit message why it's required for those
two reg reads to succeed.

>
>
> > > +     }
> > > +     pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > +
> > > +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> > > +     if (ret != 1) {
> > > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
> > > +                         aux->name, ret);
> > > +             return -ENODEV;
> > > +     }
> > > +     pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > +
> > > +     /*
> > > +      * Per VESA eDP Spec v1.4b, section 3.3.10.2:
> > > +      * If DP_EDP_PWMGEN_BIT_COUNT is less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
> > > +      * the sink must use the MIN value as the effective PWM bit count.
> > > +      * Clamp the reported value to the [MIN, MAX] capability range to ensure
> > > +      * correct brightness scaling on compliant eDP panels.
> > > +      */
> > > +     pn = clamp(pn, pn_min, pn_max);
> > > +
> > >       bl->max = (1 << pn) - 1;
> > >       if (!driver_pwm_freq_hz)
> > >               return 0;
> > > @@ -4054,29 +4080,15 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
> > >        */
> > >       fxp = DIV_ROUND_CLOSEST(1000 * DP_EDP_BACKLIGHT_FREQ_BASE_KHZ, driver_pwm_freq_hz);
> > >
> > > -     /* Use highest possible value of Pn for more granularity of brightness adjustment while
> > > +     /*
> > > +      * Ensure frequency is within 25% of desired value.
> > > +      * Use highest possible value of Pn for more granularity of brightness adjustment while
> >
> > Huh? I don't see a corresponding code change. If you are fixing the
> > comment, it should come as a separate commit.
>
> Sure. I will drop this hunk.
> I folded it into this commit as it was a leftover artifact of moving
> the code around.

Please refrain from folding unrelated changes.

>
> >
> > >        * satisfying the conditions below.
> > >        * - Pn is in the range of Pn_min and Pn_max
> > >        * - F is in the range of 1 and 255
> > >        * - FxP is within 25% of desired value.
> > >        *   Note: 25% is arbitrary value and may need some tweak.
> > >        */
> > > -     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> > > -     if (ret < 0) {
> > > -             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> > > -                         aux->name, ret);
> > > -             return 0;
> > > -     }
> > > -     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> > > -     if (ret < 0) {
> > > -             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
> > > -                         aux->name, ret);
> > > -             return 0;
> > > -     }
> > > -     pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > -     pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > -
> > > -     /* Ensure frequency is within 25% of desired value */
> > >       fxp_min = DIV_ROUND_CLOSEST(fxp * 3, 4);
> > >       fxp_max = DIV_ROUND_CLOSEST(fxp * 5, 4);
> > >       if (fxp_min < (1 << pn_min) || (255 << pn_max) < fxp_max) {
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry

