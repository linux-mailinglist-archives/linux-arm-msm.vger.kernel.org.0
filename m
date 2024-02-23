Return-Path: <linux-arm-msm+bounces-12405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 23895861C65
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 20:20:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8BB45B232F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 19:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 186FA143C40;
	Fri, 23 Feb 2024 19:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2FBGXpg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64023142645
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Feb 2024 19:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708716027; cv=none; b=E2DsmlxmTdDdSpNOeuvD62YmGZHx09bDQL8uu3V/kK50VPupBRvoyCd14lG/Z6/ZC02pBCl8fmoHKTdxemyzGaBISIrqBTtVX6WJ0XNwloSxNWgpqjf4emc1w1GGld4lKp/VxEeIWZJ8wWNOIZh+WfBdR9ssiYj8QB4Zt0jTcqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708716027; c=relaxed/simple;
	bh=M5k+Z4nPDwnRiBjbOv3TCMIZZge42YuOc06DAKki524=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fkUi0zqOTPRgr0XhMDtevJDf4pNAHaLZmF8cbiuI1UAZ8p+ZUnTxY+EbGxXg9QS26gS2LBEp04OQBbc5c21HcsdI5tGmOSfV8rojYM8gKdh2YRrdQGLxxGJG42SK764kd96Wfsrt5KB3lDW1r4d9HfzKqMB+udXm4XBPvWLaNM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K2FBGXpg; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-56454c695e6so2195928a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Feb 2024 11:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708716023; x=1709320823; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M5k+Z4nPDwnRiBjbOv3TCMIZZge42YuOc06DAKki524=;
        b=K2FBGXpgybSe7SFnFlLLoG4pvtlX4s1C1wv7oSD0iA12lie+h85ycWS83f/Dw7bHSu
         VK6Eutfz6JdqY+Fl68h1awhsurKYsvYPLTPPd/3IGePUnZ2Yvws95znPwfN47d1l2fY/
         oiWFenO65vgl6vkYWFD5LGusV7oT10ttwY5+VepscWD5jfJKGCsoZTGoxakl2DvgcuT0
         WJLcOrte6NMmxg5TXQcbKtPRDG9y/vZpPcVyQCo1tnTd7ByWeK0JhfaTX2a+NH81qfgm
         NxSiNE4XKM8ACuSfThTqKtMI1IqmZwuhQrinJSF20QXjziQ1pij3oE5NrtEmraD7Z5p3
         2a3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708716023; x=1709320823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M5k+Z4nPDwnRiBjbOv3TCMIZZge42YuOc06DAKki524=;
        b=pGmJH6J/EVoWmeE/I9+E4dT6alQz8niA499spNom1YgB4N6K2BE59HrRJyBjpH2LTM
         UyoBuhW4sqWhO4qAExOccHRz0Zvi0tW3JC7FkqLBkWu4Fq00vkzTMqI3rqkQnRDPrtyR
         irjx03A3V56qqroXzwe/qNRdfyNI8k4TNLiqGcvwZw/XGzodCVisOq77FYglTSSdW4HL
         40WaIWoBYcHlKiyTrU/uDw9R1VTzMk91ixaq4mrZVAZWBcLNaQzjR0BQDV/xS8rfaMxq
         HMxueF7mydLD0hqmG7+jU7fFZ1/4smzBvpQW0i39IlTbfme1Eb/vXFcoeLwtmN30TO5C
         PhOA==
X-Forwarded-Encrypted: i=1; AJvYcCWjf2dhBoYQ2YPQsvVghJtuhiho+OzNa9JmiE8u/88DDV7p0Tn9bnRM9u4QezoVuIxHOfXgWTbb2Dp2mWrCL3Juc6FKoJnz+QC1yrqEEA==
X-Gm-Message-State: AOJu0YwS2ruliyx1z9VCMMpdQXXZ3j4zmtlNvpVOS1iikmJrt2eXLYoc
	TZrlyDVe0S3m2U+gevdXFwFAWeynDR/rIPwp8feiQCW8b7ivAgUY+daWx3kJkpCX8LV0CPma/1l
	sy0Vn3VhDjZByHwc4yz1wHNUwM3M=
X-Google-Smtp-Source: AGHT+IFxzxNvseF7FRtNGReSOFATSOOCh/1iiT7dXL+XxvU/9GXBLYa5JADHu4mYKLvEoJ+ZN/R02g6XFdvoxwcEuBM=
X-Received: by 2002:aa7:cb4f:0:b0:565:7ce5:abdf with SMTP id
 w15-20020aa7cb4f000000b005657ce5abdfmr600067edt.9.1708716022607; Fri, 23 Feb
 2024 11:20:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240220121741.2994222-1-dmitry.baryshkov@linaro.org>
 <54a3f3d9-ad3e-4828-96c0-61dd81c61d76@collabora.com> <CAA8EJpq-17XSwmoT1HKVgxi=fUKD-fETtwbtpznR+RY+iFCE6w@mail.gmail.com>
In-Reply-To: <CAA8EJpq-17XSwmoT1HKVgxi=fUKD-fETtwbtpznR+RY+iFCE6w@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 23 Feb 2024 11:20:10 -0800
Message-ID: <CAF6AEGtsL2pwQQ2pDDbYmRmp57aX2WjtD4qsZ=J_p07b+o2Tkw@mail.gmail.com>
Subject: Re: [PATCH] drm: ci: uprev IGT
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Helen Koike <helen.koike@collabora.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 6:36=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, 20 Feb 2024 at 16:31, Helen Koike <helen.koike@collabora.com> wro=
te:
> >
> >
> >
> > On 20/02/2024 09:17, Dmitry Baryshkov wrote:
> > > Bump IGT revision to pick up Rob Clark's fixes for the msm driver:
> > >
> > > - msm_submit@invalid-duplicate-bo-submit,Fail
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > Do you have a gitlab pipeline link I can check?
>
> Before uprev: https://gitlab.freedesktop.org/drm/msm/-/pipelines/1109455
>
> After uprev: https://gitlab.freedesktop.org/drm/msm/-/pipelines/1109501

jfyi a couple more fixes landed after this, for kms_plane_cursor
(skips->pass) and kms_universal_plane (fail->pass)..

I have additional fixes for kms_bw, and kms_plane_scaling still
waiting for review

BR,
-R

