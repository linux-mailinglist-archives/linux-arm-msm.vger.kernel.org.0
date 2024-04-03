Return-Path: <linux-arm-msm+bounces-16316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0E5897346
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 17:00:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD1171C20A9F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 15:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D931C149C48;
	Wed,  3 Apr 2024 15:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JupSHcPr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19021146D62
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 15:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712156450; cv=none; b=pEfGjrbEdCkPmrUuduZVJ0g5CvgGfp3o9FScOLUaN5Tt/mNvdWbG3m+cRuosNDdmFBDRjbhwzti4gPSW2ZqlKbGl1MGaTEg8y7wMitj9+mDUsGqOel8Bwtk6dlo+PbLGYN6UjFzpf6ZYM2O2kMOL5o3NA6vKOXK4YWWplKLjYSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712156450; c=relaxed/simple;
	bh=zMNs2xRGdIsRtrHnyiRNB60g1lnKe0hn5mw4qi2E+UI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SK0KQaF8O1Cmo8etCCt504HAScGccLQFaq2nxZH37U7mLva7C1CsA83dwi9oUriijykZi2Q4DhDRbRUjgt8wll6HK9poWpgtPmf0FPQNqmv7zHgS9cNyWU1Sb8rRETZDDplLLZQZh3e7rBlemDfuFj+OnJBL7noqnEA/JLnhfCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JupSHcPr; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so975579276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Apr 2024 08:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712156448; x=1712761248; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzSRFLsznPK3uNgAw548RIHGK9k926CGGelW0csLXJA=;
        b=JupSHcPrR/WKzuVRjfanb7NdC05Ljtg/xgAqBERQP9OyYzcbI0YacZj0qnYFTPE+nD
         NfzFdZaFz0BPioKmCPOYrTG1EpeoYCaCoozr3KImO+RSdlrG5z3IBAOMiNWibUFYn2Gq
         BaukyaI1fov73+Sql7tePIFGUPH3RV66zqzqTtgPKRRhpX83VdS2lehGjKvcBErk1Xtj
         juCFi4geLNMPKNcDmNTcFyDI/dIF3/4fykBYaW0+lDTBFo3wBmarluRPL/zd5Kna/iCN
         XGajRtBVzdcUPe+pJLucF6nMyCzqYy7WHqEaNaQnikz+YuYEkkkCrE8IrxUugLkZU32m
         0xdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712156448; x=1712761248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DzSRFLsznPK3uNgAw548RIHGK9k926CGGelW0csLXJA=;
        b=Ia/KbzSsEMP/cqyfwgpIDR3Axn3IC7MIsd6T6PKJNB+cwFar+R3WyPTIUHcTDLfggH
         2VS8okmEeLbB+ftx0qFe2n3JLSLGUoUBMmDHiHKN1nZYxyot4Z/9DxyPVGGJKYH8AOKg
         /i2P2/R1GNIlcGXiMgLt80kIz1Xc3PJxvnUDhWp4a3Gf1EkH07yREDKRDkKza7o+CtiQ
         m3NvZvJB4Z51Uc6g+NNf0fRIWnlCOhhqLcNohuTnikR3bzK8hpricq5e1xc6+VESKKBp
         IdVMnqo1ly/R1XVYcdzKgespo1r6qG64zfGJlk9B4v55mBqN7+YClc/fkaE2kOr1tYb1
         zS9A==
X-Forwarded-Encrypted: i=1; AJvYcCVL5UqYRfzzn/ElscoOiXGBNb6y9RennAfwlBuFSCtYMnmOHPUhZCcV2Y+hpuc4hf20/I3/SMUUiVbLuSEhr5DTwwre27xdyYD1IuNutQ==
X-Gm-Message-State: AOJu0YzYXK73EStvOIzIqiayj5YMdvqI1ysAZGlfkqShgLC9giifVfUq
	TXlNl3aMIV5hdcP7ujiaiMD2Wvx46CLV5PjcedQl1FyMnwqEUEYS9TlBaS2LYl9JO7gfCSC1eKM
	TGMsXHKNmhZbGKMBaLa/I8W/zzrWSAetAihBxsQ==
X-Google-Smtp-Source: AGHT+IFMWq+bKOySlKpu/7NA/TV8AEAmhob3YdjdiXNZxuBQ1lQvwLaAC8inv18M4l6Ln7Ef9PWW8gox3RQR0bQVUro=
X-Received: by 2002:a25:8692:0:b0:dc6:d102:a0bb with SMTP id
 z18-20020a258692000000b00dc6d102a0bbmr1904903ybk.24.1712156448065; Wed, 03
 Apr 2024 08:00:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
 <20240403-msm-drm-dsc-dsi-video-upstream-v1-1-db5036443545@linaro.org>
 <CAA8EJpqF4rVsWG=A1fNYWWi7rjHDmu_ftZttXH1v41v8wBgAiQ@mail.gmail.com> <CABymUCNNhFTQZ6NSOL8SmLzCSOktvR_Sj0s2TSmqa0_56CSvDg@mail.gmail.com>
In-Reply-To: <CABymUCNNhFTQZ6NSOL8SmLzCSOktvR_Sj0s2TSmqa0_56CSvDg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Apr 2024 18:00:36 +0300
Message-ID: <CAA8EJpo_TXTsuK6XsLx_3aFTXHjoe6FRRqOjcN6zd-FdAXZQAg@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] drm/msm/dpu: fix video mode DSC for DSI
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 3 Apr 2024 at 17:44, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B44=E6=
=9C=883=E6=97=A5=E5=91=A8=E4=B8=89 17:57=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Wed, 3 Apr 2024 at 12:11, Jun Nie <jun.nie@linaro.org> wrote:
> > >
> > > From: Jonathan Marek <jonathan@marek.ca>
> > >
> > > Add necessary DPU timing and control changes for DSC to work with DSI
> > > video mode.
> > >
> > > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 9 +++++++++
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 8 ++++++++
> > >  2 files changed, 17 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/d=
rivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > > index d9e7dbf0499c..c7b009a60b63 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > > @@ -115,6 +115,15 @@ static void drm_mode_to_intf_timing_params(
> > >                 timing->h_front_porch =3D timing->h_front_porch >> 1;
> > >                 timing->hsync_pulse_width =3D timing->hsync_pulse_wid=
th >> 1;
> > >         }
> > > +
> > > +       /*
> > > +        * for DSI, if compression is enabled, then divide the horizo=
nal active
> > > +        * timing parameters by compression ratio.
> > > +        */
> > > +       if (phys_enc->hw_intf->cap->type !=3D INTF_DP && timing->comp=
ression_en) {
> > > +               timing->width =3D timing->width / 3; /* XXX: don't as=
sume 3:1 compression ratio */
> > > +               timing->xres =3D timing->width;
> > > +       }
> > >  }
> > >
> > >  static u32 get_horizontal_total(const struct dpu_hw_intf_timing_para=
ms *timing)
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gp=
u/drm/msm/disp/dpu1/dpu_hw_intf.c
> > > index 965692ef7892..079efb48db05 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > > @@ -167,6 +167,14 @@ static void dpu_hw_intf_setup_timing_engine(stru=
ct dpu_hw_intf *ctx,
> > >                 intf_cfg2 |=3D INTF_CFG2_DATABUS_WIDEN;
> > >
> > >         data_width =3D p->width;
> > > +       if (p->wide_bus_en && !dp_intf)
> > > +               data_width =3D p->width >> 1;
> >
> > How is wide_bus relevant to the DSC case?
> > Is there a need for the Fixes tag?
>
> 48bit bus width should be used when DSC is enabled. Without the
> widebus configuration,
> a lot dsi error happens as below in DSC case.
> [  206.275992] dsi_err_worker: status=3D4

Still, separate patch please.

>
> For the Fixes tag, the previous patch mentioned to enable the widebus
> mode for any DSC case. So it is fair to add the tag.

Yes, please.

> >
> > > +
> > > +       if (p->compression_en)
> > > +               intf_cfg2 |=3D INTF_CFG2_DCE_DATA_COMPRESS;
> > > +
> > > +       if (p->compression_en && dp_intf)
> > > +               DPU_ERROR("missing adjustments for DSC+DP\n");
> > >
> > >         hsync_data_start_x =3D hsync_start_x;
> > >         hsync_data_end_x =3D  hsync_start_x + data_width - 1;
> > >
> > > --
> > > 2.34.1
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry



--=20
With best wishes
Dmitry

