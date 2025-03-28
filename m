Return-Path: <linux-arm-msm+bounces-52755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3900FA74932
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 12:26:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E264188B9DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 11:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143FE218E96;
	Fri, 28 Mar 2025 11:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KBpNxt4l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7D0214200
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 11:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743161155; cv=none; b=UtmDdR7vGiv5FRtYjm4l4M4Ad0wo8hKCaBlJPhhNMm8L2vqstnYKD31GZdvjvOhsBeG0oSBRM9mwF/noQXQy8e32DaVE4vl0INLE+UUmVZW/dm1L3umimg8nq82elcj/0YpDeOvI8iOccY0bkuefx2ARulhU++bNIVO6NLf/Dqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743161155; c=relaxed/simple;
	bh=x23wwB4xsjX2meICwHlleD8C8MmmjdNKeMo+ALJfDiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e1IUiJVZJcpCerJDcFIAV1R/6TNZ31Lu8CXEF83Sii6u5rB47RidDInEebtar23GUBui4Sc3uJlPxwPKRdTsqY1EK5l8C1USofOyZLpbGMX0fzP9GSc2YaNmnOn0G/FnrSkaqLsQX3vnV8/Jwo4RdgYdxuAVX55zT56y3K/slko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KBpNxt4l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52SAlork023865
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 11:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pqlsG7HVwbMO8SHWDdbJKSEa
	wwKaCkeHowGeR1YIQhE=; b=KBpNxt4lD+OO3TdtoKGcrg8qwE1WcnvJ4TtjIZWl
	0E6CziXrkpGYac0fWEFMBaDRmzr60Ws/XegC44+Zp3D31pY0eUd5zg/iqvjlhNxa
	hg+kvZ9xbLtylQq/kGX5XHjYrtsMC6JTvZeo9/TIY5v0EFLQCXG39a5k7L9/djCB
	8qNmX6npmK5s8RN7bsLClBASc/7rqULlzUhNE1NbHi+2IxfETXnJTUhG+gqw+vDx
	2/02Il/WsN4g/m4G11wiM/ZyUxgUOOU0qs5KTea1kOU500a+Enabz7YzAvffgctW
	k4pLHjxLiQS2lr99VHpg9jIXNzwT6Ncto4J4ixzXRptIqQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45njsc1fr4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 11:25:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-30364fc706fso3597867a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 04:25:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743161145; x=1743765945;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pqlsG7HVwbMO8SHWDdbJKSEawwKaCkeHowGeR1YIQhE=;
        b=foRkVZH2mBpSh2ng0c+Ng7fn5cBL3vXN9BAoaAwjtfZJvXyG3qxB/hVRH52bRNI11A
         PgBcHZ6g0hYlsdghpog0Pvu4nGYn1iXGTqx8BQxv9uOAZfRtchiOxRIMvYN5wLTTHmop
         +T1ccrqO7vz25MxiTQeSUyirzeYUiYPIv0ohJabSZK4CqN0Oop4kKFFAsNhX3ZDTlQao
         KfjTKQtYVYBk66O234xBNpauItLEPbcawD0BZaJY/jh99otTgnjxjVf9mfDBheyt48el
         +2kNJ1sSLfONNJoxN8MwO8fdY0B9aGSbnuy84mIZp0HbWL+TI8IuyN5v+muCNDjBrQFp
         UtzA==
X-Forwarded-Encrypted: i=1; AJvYcCXV2i/LZpTeyqH8tJadNPJiCYQyLaoEldxsRspV/ShmNKxoiUrjWNUvnZdynqIeKlK1qVIHEEkoDjJwq3I/@vger.kernel.org
X-Gm-Message-State: AOJu0YyU+LnF90ySd/3bBKV0mN5N1JikmP9SNSYnhB/t4vMY7CE69Rc6
	UUQziRXlXOyOtKntzhPBcb8KCQOOn0B2PVrrE9GZ3VL3BZmhTO2e6kMaS7u3acPNKp4VKe+zt5Y
	goDceqcw07m3NJxHIn/wDOW3aUDmInmRxb4p+AbjgXnuYwStTnaYxqr4/oH2wdjaeQvXAYh6rh+
	vLdyS3xXm/UBtPmxl93T5/7Jn4ELKsPtisrSwVAH/R2hsC6sk=
X-Gm-Gg: ASbGncsFSi5b9DqoecABAXtuecFHgyL0O5xqyblxDLoEjBvgEteBLtmsY3FeX6HYk/v
	D0tqtR7mCMApPPXUhYGm+t4QB3fMs7UmfKNVvEOqxWL0yv+dkoirZQSjprX8ctuNwYjpVjnaQyw
	X+sTfb2aeEr3RlsYwdEWmVO/vO0uCuhw==
X-Received: by 2002:a17:90b:520a:b0:2fe:b470:dde4 with SMTP id 98e67ed59e1d1-303a7d6629emr14425823a91.12.1743161145453;
        Fri, 28 Mar 2025 04:25:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENcWU2HRB5T841FEOhELYIRsB9RU5dL+LX2Kxhjm9eEW11rYJtQocJo23zFLw/ZPShrHTSDf86pQll/18SFfU=
X-Received: by 2002:a17:90b:520a:b0:2fe:b470:dde4 with SMTP id
 98e67ed59e1d1-303a7d6629emr14425776a91.12.1743161144958; Fri, 28 Mar 2025
 04:25:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327-wip-obbardc-qcom-t14s-oled-panel-brightness-v2-1-16dc3ee00276@linaro.org>
 <07c48ba0-dcf5-4ece-8beb-f225652c5014@oss.qualcomm.com> <CACr-zFBwbniB3H5cnq0higsX6a_G4Be26N-nNL8JAzci8y9_Mw@mail.gmail.com>
In-Reply-To: <CACr-zFBwbniB3H5cnq0higsX6a_G4Be26N-nNL8JAzci8y9_Mw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 28 Mar 2025 13:25:33 +0200
X-Gm-Features: AQ5f1JrxhgMaxmJyZU0MNfPc6gRkgQJ5WNKikA3K4Gn68SeH5VdyTI6hypt1zpY
Message-ID: <CAO9ioeUGS0dX8tC6gfB8GmDB136WFUg4erE9NSNBUCcPrYsUTg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/dp: fallback to minimum when PWM bit count is zero
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
X-Authority-Analysis: v=2.4 cv=fJk53Yae c=1 sm=1 tr=0 ts=67e6873a cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=PAbUfbVKnXYd5dnhZjsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: KlJQbDY2240_AMfTKgZLCh86aB4Wodhc
X-Proofpoint-ORIG-GUID: KlJQbDY2240_AMfTKgZLCh86aB4Wodhc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280079

On Thu, 27 Mar 2025 at 20:19, Christopher Obbard
<christopher.obbard@linaro.org> wrote:
>
> Hi Dmitry,
>
> On Thu, 27 Mar 2025 at 17:40, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On 27/03/2025 19:25, Christopher Obbard wrote:
> > > According to the eDP specification (e.g., VESA eDP 1.4b, section 3.3.10.2),
> > > if DP_EDP_PWMGEN_BIT_COUNT is less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
> > > the sink is required to use the MIN value as the effective bit count.
> > >
> > > Some eDP panels report DP_EDP_PWMGEN_BIT_COUNT as 0 while still providing
> > > valid non-zero MIN and MAX capability values. This patch updates the logic
> > > to use the CAP_MIN value in such cases, ensuring correct scaling of AUX-set
> > > backlight brightness values.
> > >
> > > This improves compatibility with panels like the Samsung ATNA40YK20 used
> > > on the Lenovo T14s Gen6 (Snapdragon variant with OLED) which report a
> > > bit count of 0 but declares an 11-bit PWM capability range.
> > >
> > > Co-developed-by: Rui Miguel Silva <rui.silva@linaro.org>
> > > Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> > > Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> > > ---
> > > Changes in v2:
> > > - Split backlight brightness patch from T14s OLED enablement series.
> > > - Use PWMGEN_CAP_MIN rather than MAX (Dmitry).
> > > - Rework commit message to reference eDP spec.
> > > - Rebase on drm-misc-next.
> > > - Link to v1: https://lore.kernel.org/all/20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org/
> > > ---
> > >   drivers/gpu/drm/display/drm_dp_helper.c | 50 ++++++++++++++++++++++-----------
> > >   1 file changed, 33 insertions(+), 17 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > > index dbce1c3f49691fc687fee2404b723c73d533f23d..0b843d5b634f89f144b62b30311834d118b79ba9 100644
> > > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > > @@ -4083,7 +4083,7 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
> > >   {
> > >       int fxp, fxp_min, fxp_max, fxp_actual, f = 1;
> > >       int ret;
> > > -     u8 pn, pn_min, pn_max;
> > > +     u8 pn, pn_min, pn_max, bl_caps;
> > >
> > >       if (!bl->aux_set)
> > >               return 0;
> > > @@ -4094,8 +4094,39 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
> > >                           aux->name, ret);
> > >               return -ENODEV;
> > >       }
> > > -
> > >       pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > +
> > > +     ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> > > +     if (ret != 1) {
> > > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> > > +                         aux->name, ret);
> > > +             return 0;
> > > +     }
> > > +     pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > +
> > > +     ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> > > +     if (ret != 1) {
> > > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
> > > +                         aux->name, ret);
> > > +             return 0;
> > > +     }
> > > +     pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > +
> > > +     ret = drm_dp_dpcd_readb(aux, DP_EDP_BACKLIGHT_ADJUSTMENT_CAP, &bl_caps);
> > > +     if (ret != 1) {
> > > +             bl_caps = 0;
> > > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read backlight adjustment cap: %d\n",
> > > +                     aux->name, ret);
> > > +     }
> > > +
> > > +     /*
> > > +      * Some eDP panels report brightness byte count support, but the byte count
> > > +      * reading is 0 (e.g. Samsung ATNA40YK20) so use pn_min instead.
> > > +      */
> > > +     if (!pn && (bl_caps & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT)
> > > +         && pn_min)
> > > +             pn = pn_min;
> >
> > I wonder, what stops you from implementing this part according to the
> > standard, rather than adding a hack for 0 value.
>
> I am simply quite dense, I do not know this spec or the DRM code well
> at all ;-).

Okay, no worries. It should be pretty easy:

pn = clamp(pn_min, pn_max);

No need to check for pn being non-zero, etc.

> I do appreciate your continued reviews though, however painful it must be.

It's not, no worries.

-- 
With best wishes
Dmitry

