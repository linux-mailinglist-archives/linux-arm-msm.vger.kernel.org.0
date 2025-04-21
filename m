Return-Path: <linux-arm-msm+bounces-54883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6F0A95717
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 22:14:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 413981890198
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 20:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B01161EF37C;
	Mon, 21 Apr 2025 20:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cDEbqahc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80191E5B89;
	Mon, 21 Apr 2025 20:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745266448; cv=none; b=ToM7VfrjYevdLAxTtmb8miJNsDvKBJMDP5ScgOALsucSq49lTJkZyjwuSzVk10LJv1N0Ra3xo6pQZJhwCOZARWHBs4PHXxOvkZvqDY5gbY18i2cxNJnr9DkbXTYz5mOnvytBaiSW66mjQOlyNr81QTpipeLpfvTntm+3h80HP1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745266448; c=relaxed/simple;
	bh=L3jogH28Ee6aYFZfYKaHaTeC52HPAhU5Te9unMzaNyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pT+R1fGLDZafjrwNyLT05Sjv1+yAYCr7Oy0q2daCtamNWVcCEPJFLIXToRG6ek0X6kdWRbzDrOlttgIlM4H3Cngy+gLIhbdn/VwmwL+QOJrI8QR1GBiLeILqfXZXphj2nuQ4sXRZtxfimiHEezMWAekTVCLg9Mhk0hJzCCoArMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cDEbqahc; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3d8020ba858so43880295ab.0;
        Mon, 21 Apr 2025 13:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745266446; x=1745871246; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BUYYVHs0K9sSiocJ6t2874qRQrS2PCPz1Ru+t8N0kRY=;
        b=cDEbqahc8AgzRGX5nvUmFc7PoocAa/8CD4ADXd0nf/YegKVTLixRSevh8j+27bYgs3
         y2gY1d9wLmS0lmwj3XWAlIA3mg138+HRzQ4A9gWA3SHEc2xUaHpmz/5rBqR7mdDqRpl0
         v0k9Rra147D9l4uel+0DdiMPeVk32ibi85QCf0w6VE2OyJ8xh4huG9mBud9kWybS2Wn1
         pZNZgmItEATxw/kINdp1IORRzONO45xJoDuKx0L6qG2gsMyuQTXzIBc4n77UYKuAMntF
         FxpBWfE8fGls8hJjZtbz6UeFgTgg286hlmZVoj8Q8/+Tf3DBn+2S+f8LuC9a7IGsNY6u
         zpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745266446; x=1745871246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BUYYVHs0K9sSiocJ6t2874qRQrS2PCPz1Ru+t8N0kRY=;
        b=Eh2VX3gK3CVbhma5r3OqN4g6/svZNDRrI3NvzkBjxZYmjgpG4hR1pY7R65/RgSIbTR
         l1azO3oKD4nfR6lLTbUQ5qDBOgse2uPQ+Vv/4czmvVW0YKWazbaaYhkj6hX6clgQh1SS
         R3NK9qcw6nxx/wKxMeEfnoiV+W6qekjuzsQZnR6OJEM8g14oemXNkJ/34uTg5c+EdBG8
         Puhi/2+txS/7iJ1f3lfPnuPN/UXRLnDco+V5U15XRoXPM+8lHJhWxCw9/gdVQUDM+bfr
         ugzCo2+JExjSOdJ3oOixvIXES6YTEgjxhBTSxE8s+tgP4scHai8mcoJnkHJZaRCwJz4Y
         6Uew==
X-Forwarded-Encrypted: i=1; AJvYcCV0EKFbjTxqUZRPYETYziP8ZLmK8f33Wzb7Aofc7M5AlgCUzmtjCEnvKcnSnZ4ymfgjmSCKopKhvRNCiuuz@vger.kernel.org, AJvYcCWOtEXNu03NWlWJH29SoT6TvwTHruGSgYaIbc3f9qU4lVf4GI+gBf4915uFb+koDakfs2XY9WMEoSWeERWUE2wh@vger.kernel.org, AJvYcCWXAVfU7+KuD191Fzc080bX7elQgOJIILOiybKVwvdA+23BmpP530m74dHhYjoLtqJtbAiPdb5RhW/PfJBl@vger.kernel.org
X-Gm-Message-State: AOJu0YyXJKGBxdkyR8sWZA8MM2m8hX6Qo9scd21ayvl6Y7ejRJ4jw8Ek
	z5E3ANlpXJgtYz03HdUW07/mu3VAQp/ZGyJC8ZFeffxEy8+rRhKCj1fQFc7Xp4nDpQPNFN9aYIP
	XgyLJrBZn98y43wF62OSi967BIpw=
X-Gm-Gg: ASbGncsZfm79IX06MNSCqpjgdJEtzsLcCsxhIhh+bbsOvO4Q3AkpYPOL/mVJVzs/BMS
	omqWgb0h89ICiX+EnV1Vqmz1Ebhd6tx3F1cxbC90JOyQz87seO/nJuATp/r5iJrj0Kt0r3gAS4U
	iDNS25NYtszFxmoeb6smMOvOzk4tt8MHIeBOzwFJiEQ/GDCm2lBfCa
X-Google-Smtp-Source: AGHT+IFsMVrEWpfqecECl7zT5OQiMCWupejKs7VtqS5rGjPbaevtE5TQaBYY4Va6/egz7G5xy7YIPaM/LB4LD1cYPlU=
X-Received: by 2002:a92:ca48:0:b0:3d3:e287:3e7a with SMTP id
 e9e14a558f8ab-3d88ee5e3c8mr132413655ab.19.1745266445839; Mon, 21 Apr 2025
 13:14:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com>
 <20250410-topic-smem_dramc-v2-3-dead15264714@oss.qualcomm.com>
 <20911703-ab4e-4eb2-8611-294730a06d2f@quicinc.com> <CACu1E7HDmQXDNtEQCXpHXsOKPCOgrWgo+_kcgizo9Mp1ntjDbA@mail.gmail.com>
 <1282bf58-e431-4a07-97e5-628437e7ce5f@quicinc.com> <CACu1E7GwMCt6+JJQGgSvJObTMMWYLPd69owyFo7S=sxu_EEsUw@mail.gmail.com>
 <16845de2-a40a-4e3d-b3aa-c91e7072b57f@quicinc.com>
In-Reply-To: <16845de2-a40a-4e3d-b3aa-c91e7072b57f@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 21 Apr 2025 13:13:53 -0700
X-Gm-Features: ATxdqUEM_DlVLZMehZNCyiqvxRBh4hgHu9s9MhnYMEPwKOXfVEAoGtGXkOlFs7c
Message-ID: <CAF6AEGvyeRLHFBYmxkevgT+hosXGiH_w8Z+UjQmL+LdbNfVZ+w@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/msm/a6xx: Get HBB dynamically, if available
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Connor Abbott <cwabbott0@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Sean Paul <sean@poorly.run>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-hardening@vger.kernel.org, 
	dri-devel <dri-devel@lists.freedesktop.org>, freedreno@lists.freedesktop.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 9:00=E2=80=AFAM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On 4/18/2025 6:40 AM, Connor Abbott wrote:
> > On Thu, Apr 17, 2025, 1:50=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quic=
inc.com> wrote:
> >>
> >> On 4/17/2025 9:02 PM, Connor Abbott wrote:
> >>> On Thu, Apr 17, 2025 at 3:45=E2=80=AFAM Akhil P Oommen <quic_akhilpo@=
quicinc.com> wrote:
> >>>>
> >>>> On 4/10/2025 11:13 PM, Konrad Dybcio wrote:
> >>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>
> >>>>> The Highest Bank address Bit value can change based on memory type =
used.
> >>>>>
> >>>>> Attempt to retrieve it dynamically, and fall back to a reasonable
> >>>>> default (the one used prior to this change) on error.
> >>>>>
> >>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>> ---
> >>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++++++++++-
> >>>>>  1 file changed, 14 insertions(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/dr=
m/msm/adreno/a6xx_gpu.c
> >>>>> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..a6232b382bd16319f20=
ae5f8f5e57f38ecc62d9f 100644
> >>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>>> @@ -13,6 +13,7 @@
> >>>>>  #include <linux/firmware/qcom/qcom_scm.h>
> >>>>>  #include <linux/pm_domain.h>
> >>>>>  #include <linux/soc/qcom/llcc-qcom.h>
> >>>>> +#include <linux/soc/qcom/smem.h>
> >>>>>
> >>>>>  #define GPU_PAS_ID 13
> >>>>>
> >>>>> @@ -587,6 +588,8 @@ static void a6xx_set_cp_protect(struct msm_gpu =
*gpu)
> >>>>>
> >>>>>  static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
> >>>>>  {
> >>>>> +     int hbb;
> >>>>> +
> >>>>>       gpu->ubwc_config.rgb565_predicator =3D 0;
> >>>>>       gpu->ubwc_config.uavflagprd_inv =3D 0;
> >>>>>       gpu->ubwc_config.min_acc_len =3D 0;
> >>>>> @@ -635,7 +638,6 @@ static void a6xx_calc_ubwc_config(struct adreno=
_gpu *gpu)
> >>>>>           adreno_is_a690(gpu) ||
> >>>>>           adreno_is_a730(gpu) ||
> >>>>>           adreno_is_a740_family(gpu)) {
> >>>>> -             /* TODO: get ddr type from bootloader and use 2 for L=
PDDR4 */
> >>>>>               gpu->ubwc_config.highest_bank_bit =3D 16;
> >>>>>               gpu->ubwc_config.amsbc =3D 1;
> >>>>>               gpu->ubwc_config.rgb565_predicator =3D 1;
> >>>>> @@ -664,6 +666,13 @@ static void a6xx_calc_ubwc_config(struct adren=
o_gpu *gpu)
> >>>>>               gpu->ubwc_config.highest_bank_bit =3D 14;
> >>>>>               gpu->ubwc_config.min_acc_len =3D 1;
> >>>>>       }
> >>>>> +
> >>>>> +     /* Attempt to retrieve the data from SMEM, keep the above def=
aults in case of error */
> >>>>> +     hbb =3D qcom_smem_dram_get_hbb();
> >>>>> +     if (hbb < 0)
> >>>>> +             return;
> >>>>> +
> >>>>> +     gpu->ubwc_config.highest_bank_bit =3D hbb;
> >>>>
> >>>> I am worried about blindly relying on SMEM data directly for HBB for
> >>>> legacy chipsets. There is no guarantee it is accurate on every chips=
et
> >>>> and every version of firmware. Also, until recently, this value was
> >>>> hardcoded in Mesa which matched the value in KMD.
> >>>
> >>> To be clear about this, from the moment we introduced host image
> >>> copies in Mesa we added support for querying the HBB from the kernel,
> >>> explicitly so that we could do what this series does without Mesa eve=
r
> >>> breaking. Mesa will never assume the HBB unless the kernel is too old
> >>> to support querying it. So don't let Mesa be the thing that stops us
> >>> here.
> >>
> >> Thanks for clarifying about Mesa. I still don't trust a data source th=
at
> >> is unused in production.
> >
> > Fair enough, I'm not going to argue with that part. Just wanted to
> > clear up any confusion about Mesa.
> >
> > Although, IIRC kgsl did set different values for a650 depending on
> > memory type... do you know what source that used?
>
> KGSL relies on an undocumented devicetree node populated by bootloader
> to detect ddrtype and calculates the HBB value based on that.

Would it be reasonable to use the smem value, but if we find the
undocumented dt property, WARN_ON() if it's value disagrees with smem?

That would at least give some confidence, or justified un-confidence
about the smem values

BR,
-R

>
> -Akhil.
>
> >
> >>
> >> I have a related question about HBB. Blob driver doesn't support
> >> host_image_copy, but it still use HBB configuration. I was under the
> >> impression this was required for UMD for compression related
> >> configurations. Is that not true for turnip/freedreno?
> >>
> >> -Akhil.
> >
> > AFAIK the HBB (as well as other UBWC config parameters) doesn't have
> > any impact on layout configuration, so the UMD can ignore it except
> > when it's doing CPU texture uploads/downloads. We certainly do in
> > freedreno/turnip. You'd have to ask that team what they use HBB for,
> > but my best guess is that the GLES driver uses it for CPU texture
> > uploads sometimes. That is, the GLES driver might be using
> > functionality similar to host_image_copy "under the hood". It's
> > something we'd probably want for freedreno too.
> >
> > Connor
> >
> >>
> >>>
> >>> Connor
> >>>
> >>>> So it is better to
> >>>> make this opt in, for newer chipsets or those which somebody can ver=
ify.
> >>>> We can invert this logic to something like this:
> >>>>
> >>>> if (!gpu->ubwc_config.highest_bank_bit)
> >>>>     gpu->ubwc_config.highest_bank_bit =3D qcom_smem_dram_get_hbb();
> >>>>
> >>>>>  }
> >>>>>
> >>>>>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
> >>>>> @@ -2467,6 +2476,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_dev=
ice *dev)
> >>>>>       bool is_a7xx;
> >>>>>       int ret;
> >>>>>
> >>>>> +     /* We need data from SMEM to retrieve HBB in calc_ubwc_config=
() */
> >>>>> +     if (!qcom_smem_is_available())
> >>>>> +             return ERR_PTR(-EPROBE_DEFER);
> >>>>> +
> >>>>
> >>>> We should add "depends on QCOM_SMEM" to Kconfig. Is SMEM device pres=
ent
> >>>> in all Qcom SoC devicetrees? I wonder if there is a scenario where t=
here
> >>>> might be an infinite EPROBE_DEFER here.
> >>>>
> >>>> -Akhil.
> >>>>
> >>>>>       a6xx_gpu =3D kzalloc(sizeof(*a6xx_gpu), GFP_KERNEL);
> >>>>>       if (!a6xx_gpu)
> >>>>>               return ERR_PTR(-ENOMEM);
> >>>>>
> >>>>
> >>
>

