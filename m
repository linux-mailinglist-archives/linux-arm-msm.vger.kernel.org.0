Return-Path: <linux-arm-msm+bounces-54667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1067CA921B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 17:32:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 210DE16EA41
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 15:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4726E25334C;
	Thu, 17 Apr 2025 15:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZWXTavXK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CE413B284;
	Thu, 17 Apr 2025 15:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744903960; cv=none; b=neHI2wQQiuqqmXo4ufMQdP5GduXpiDolOMrwX94GPqBrgYbJ3la+fmXVIPE0Y8ecIublJsvpzQVEwm5HBlNPY4q3/sI8p5FcVhwLYYwvPmR//WR6bdktJWUK1HoKt2fy7NKMCLha7haFfSacYZcNXzndm9ev2+x64nUoxrZbCB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744903960; c=relaxed/simple;
	bh=2h6/Nzpr79ivuIRUmRHxbY6xRJap+DrNqvXM5a86Sn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=quDFPeOeYUCqhGZTWTCFVwg7I0KGS0L3By9CDz7abF+w9OKIbjoK36gqcs2jF7JroLkOQ9SjvcB6qrvsu5yWVWFUU1TztalUfCqjJojyzLagdDYZk8+V7583jpsiMBDBrnFYE7Hvb5aIC4asUXWNH9poWKXawQaAWonndPCgqSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZWXTavXK; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736abdac347so63874b3a.2;
        Thu, 17 Apr 2025 08:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744903958; x=1745508758; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjUaDefyEQ6W4VYwAVRnmpwPnaJPpd/esXUe2Z+J9U0=;
        b=ZWXTavXKcbKRMtcNvI6aFpLkomrlRLULIqHtauP2FaEXaMixcZBv8AxQhQ13g53q/l
         66GjU8m5blseESCxG9hD2EHZdX6uFP3kibb1arN9tGrUbt9/Gjje6xIy0X8vC6uiDirM
         dYujUDkc+sA77GAJVWWWwREusxMqRlNgB2QfiDjGcD8CILqEelBN/sbxEendUbwYFptF
         M8m1Tc/gWTQm+65JDTQ967jmFMkg1Ra/s7WlVJEmVfgrIIaIQLK5Go4tYuUzTnT7xlTF
         B08FNhdOZGjgl5sSwUigvqjx13KJcdmhspMgMsAvPSBCXSDD2EJtePgRu53ye6r1eADO
         oBKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744903958; x=1745508758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hjUaDefyEQ6W4VYwAVRnmpwPnaJPpd/esXUe2Z+J9U0=;
        b=xFDYvCqxynANrxLSS/Tgys1rBbzICx57eyUpWyc2qfBBPh0ZUbH0tQxnzzfGJb3bhd
         7YU1QQ8rV/Ek2QVvQwN0NBddExtHDw0CsHXYNa9Ms0y7v2qC8HzWyIuPBOxSPdILbnO0
         i0IpYaL7dFaUdb70/TSsqcv7yNP6uqHB4wUU1ugAanB2gybM4scykkT23JlUELX10m+R
         HmbfCFJ2Zw6JWVmKnjYFOd0omeqtdrm0qHi1BEzGy5ZKEwWZQDGImpkO9g68AV+hSJFJ
         gMUfOn6YUzI1xqC1ZvY/tzUSBdgf9OFXa+wxd1EO673x69Sj9yJAjJOltHy4ZjBVWVi+
         S39Q==
X-Forwarded-Encrypted: i=1; AJvYcCUqKddJzDkhRYPOeDajoNb0QTNR1TnyMZUHfFcw4eS2Vb4nlk9h4t6a7UXwaFhMUzsKar22xvFQtszzpTiUiDkO@vger.kernel.org, AJvYcCVBStu/hHSSfvJDzeQO/EfknAbeePTKia9hhWcaNrJ6hGkUNRtZ9JcALUnacj4V5dymyVew6thTQFHzuJDB@vger.kernel.org, AJvYcCVBenTsDigME0x4PLGO7J27a6Ib5MwJYjWkf3OCMrP6Nk8Vi6TYT+awH3W5GMBmtN6xivtN//KrYwDd9vhL@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ26Nyrpt7qD/k/9MJYC3gE5AflDNXLk1Eo45AtKfj/pzJhCNo
	TCgi0DtjDgvPnJ3YHvGbCDOzLyDqQTsVJ8nr367b6PQrkLt/PLFQhDoT18JzjY013sWRhWLKWLQ
	vcGi/o8XMMrw0AtymmcljpKf0Wqk=
X-Gm-Gg: ASbGnctZIDw+wLWgsboKCsIKTEp1jhzkyoPZsafg8U71vLE3/OPowtOJFU/dd9aUXd4
	q7gtj/DufG28aoAyJhvZ8BTl7TguA4Boa3f1ydBtG/+Zf3fH6LXIcV0qpBuqN3mzaFvZmlkJ5A2
	STqo8TiIpa/4WY0650St5cHQ==
X-Google-Smtp-Source: AGHT+IE6OhXZMCc9wpiri+W4GcoHWYxzV1G7qF+USV2g8DAn6FuLuDMgrsi+iGOQM3HWGaFndQOBglxe7DtHrJLrQFg=
X-Received: by 2002:a05:6a00:a94:b0:737:6589:81e5 with SMTP id
 d2e1a72fcca58-73c31bb50edmr2482676b3a.2.1744903957824; Thu, 17 Apr 2025
 08:32:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com>
 <20250410-topic-smem_dramc-v2-3-dead15264714@oss.qualcomm.com> <20911703-ab4e-4eb2-8611-294730a06d2f@quicinc.com>
In-Reply-To: <20911703-ab4e-4eb2-8611-294730a06d2f@quicinc.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 17 Apr 2025 11:32:26 -0400
X-Gm-Features: ATxdqUFdx8uZJbCBVyTuqT8Yis-K6K8ZkpwgS9WYh0KUtOUx2ershvG0Vfr4j4E
Message-ID: <CACu1E7HDmQXDNtEQCXpHXsOKPCOgrWgo+_kcgizo9Mp1ntjDbA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/msm/a6xx: Get HBB dynamically, if available
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 3:45=E2=80=AFAM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On 4/10/2025 11:13 PM, Konrad Dybcio wrote:
> > From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >
> > The Highest Bank address Bit value can change based on memory type used=
.
> >
> > Attempt to retrieve it dynamically, and fall back to a reasonable
> > default (the one used prior to this change) on error.
> >
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..a6232b382bd16319f20ae5f=
8f5e57f38ecc62d9f 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/firmware/qcom/qcom_scm.h>
> >  #include <linux/pm_domain.h>
> >  #include <linux/soc/qcom/llcc-qcom.h>
> > +#include <linux/soc/qcom/smem.h>
> >
> >  #define GPU_PAS_ID 13
> >
> > @@ -587,6 +588,8 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu=
)
> >
> >  static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
> >  {
> > +     int hbb;
> > +
> >       gpu->ubwc_config.rgb565_predicator =3D 0;
> >       gpu->ubwc_config.uavflagprd_inv =3D 0;
> >       gpu->ubwc_config.min_acc_len =3D 0;
> > @@ -635,7 +638,6 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu=
 *gpu)
> >           adreno_is_a690(gpu) ||
> >           adreno_is_a730(gpu) ||
> >           adreno_is_a740_family(gpu)) {
> > -             /* TODO: get ddr type from bootloader and use 2 for LPDDR=
4 */
> >               gpu->ubwc_config.highest_bank_bit =3D 16;
> >               gpu->ubwc_config.amsbc =3D 1;
> >               gpu->ubwc_config.rgb565_predicator =3D 1;
> > @@ -664,6 +666,13 @@ static void a6xx_calc_ubwc_config(struct adreno_gp=
u *gpu)
> >               gpu->ubwc_config.highest_bank_bit =3D 14;
> >               gpu->ubwc_config.min_acc_len =3D 1;
> >       }
> > +
> > +     /* Attempt to retrieve the data from SMEM, keep the above default=
s in case of error */
> > +     hbb =3D qcom_smem_dram_get_hbb();
> > +     if (hbb < 0)
> > +             return;
> > +
> > +     gpu->ubwc_config.highest_bank_bit =3D hbb;
>
> I am worried about blindly relying on SMEM data directly for HBB for
> legacy chipsets. There is no guarantee it is accurate on every chipset
> and every version of firmware. Also, until recently, this value was
> hardcoded in Mesa which matched the value in KMD.

To be clear about this, from the moment we introduced host image
copies in Mesa we added support for querying the HBB from the kernel,
explicitly so that we could do what this series does without Mesa ever
breaking. Mesa will never assume the HBB unless the kernel is too old
to support querying it. So don't let Mesa be the thing that stops us
here.

Connor

> So it is better to
> make this opt in, for newer chipsets or those which somebody can verify.
> We can invert this logic to something like this:
>
> if (!gpu->ubwc_config.highest_bank_bit)
>     gpu->ubwc_config.highest_bank_bit =3D qcom_smem_dram_get_hbb();
>
> >  }
> >
> >  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
> > @@ -2467,6 +2476,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device =
*dev)
> >       bool is_a7xx;
> >       int ret;
> >
> > +     /* We need data from SMEM to retrieve HBB in calc_ubwc_config() *=
/
> > +     if (!qcom_smem_is_available())
> > +             return ERR_PTR(-EPROBE_DEFER);
> > +
>
> We should add "depends on QCOM_SMEM" to Kconfig. Is SMEM device present
> in all Qcom SoC devicetrees? I wonder if there is a scenario where there
> might be an infinite EPROBE_DEFER here.
>
> -Akhil.
>
> >       a6xx_gpu =3D kzalloc(sizeof(*a6xx_gpu), GFP_KERNEL);
> >       if (!a6xx_gpu)
> >               return ERR_PTR(-ENOMEM);
> >
>

