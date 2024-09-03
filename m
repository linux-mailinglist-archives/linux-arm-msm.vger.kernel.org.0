Return-Path: <linux-arm-msm+bounces-30477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDF49695F5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 09:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE074B23489
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 07:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E7E20011A;
	Tue,  3 Sep 2024 07:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s2pQwyaR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D7A200113
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 07:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725349645; cv=none; b=Od/DWMpgT0f77dwaQW94yhJmBvGIJG9vxcmq//UIR1WuX4XVrami8MpWHWrPHTRDKMCp0fAlq/bWvRvihgdeEWAEx8ecQC7SCDXtS0yyfDpvWMSEW1JMd7C9g3/Zf6dlh7IaUR8WgTxCbsGYzBIFHNIrqvW+nogfseLuACFHSPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725349645; c=relaxed/simple;
	bh=E25DnjoEpBHy51+tnD7q/0eyokrouWA7ePrDFhjMpBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jLN6uhDOx4Yo3Cn7HClN6X1gRQBgT3e6/4mUFUWet1jTsA0R5FyuNOmNY0JSJVdqY1snlTkpiJgNXum2qz6vUTDIj3Twy0zGWI18AgRu60qCK6/CWQT9Byk5CLEgGgbm21JLxCmAppvmSMSYkA0wgShM6jvknfYAG5lgzsDUQko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s2pQwyaR; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f4f2868621so53366151fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Sep 2024 00:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725349642; x=1725954442; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OL+O5F/W26pAAF8S9xmS5PPYBL0y/yPpcEVoxw70NHo=;
        b=s2pQwyaRQsltGynvcoCFVJPyzeJ+5d935TXYo1T4uUdayXLbLlC2wkNrydbl0PdGh/
         GY7Y68y1nOWuJ4vWYpNTGlB5au+YZ1qHwIEJ1+OUKHhGjaRDwxu5b+w0NhQTO8J+uORs
         5+JcoVIYhxEtcYthzEYMfOIdYRqEXEliZa5eRPpG24BDU8UVhF02gW11RGWRm+nzPmAC
         o3sxht4LID2OiKYaLlDX4vv/C/zZjUr3WtfVQGBeljl0C1vcXOk0IXpLf80rkt0CQ/me
         JQJyC0uy+jaEs4jKgt/RzOLCJ5omxs029LR3aYP80U5VnfbH03dJkbNKNn4xN2/MqCMr
         6W0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725349642; x=1725954442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OL+O5F/W26pAAF8S9xmS5PPYBL0y/yPpcEVoxw70NHo=;
        b=vEUBi5ZIdNzGocILD24OdhBH2h39xwvvN6XvsavCNrS0fRC4UMqz7c7Njo2DtebPUW
         TF6m2J3AuOhVr6Iw+NIBy4C3mKUyMybk7xzrhd/zT8oLp0I2r+8CyjKvsvcQJVsI+s1h
         je7osPiEJgyQluKuKqdQxnQLAyjsL3/CfiF34F8adgjbXrs7TCRpczHIgYYRE57GVxV8
         hKvITpTS/yihSx5/CI9Q9y97IyUJje6febEyKAPpYRHngXpwfKp0iTDmmyEqHYoGbRVw
         /TjdWJ5IIjbbGB2pyDw23CtJ5AapESQOs83Vl9S13GNL0ZBdc6Ob+cBn24w67rWNA5y3
         xdkA==
X-Forwarded-Encrypted: i=1; AJvYcCU/IdRa+7YWn9aokKKjLauLUZDfyiH3tGhb/3xUggFnmyEk403+qTvluI3luf1fQyb6FkfpjvG4Ge3aqe7N@vger.kernel.org
X-Gm-Message-State: AOJu0YzObigEn3NBRVHuySCcoVq3tRRd6BgE9ofMAPdnVKC3QPfzTlWV
	OhfUgTxT50knthu9OZl1BtUlmjBI2YkygOjnaY1vmXbnK3dI1DVfaoI4MygTeHy6fW7TiTdvP79
	WD58tb0/gwYTLvRZsxCtR3FQQ4JmT22P9HWEWhg==
X-Google-Smtp-Source: AGHT+IEsITSehtqunQcllGI2R18oGW+LB35+NdwPbJ0C30RGSl/5d1tF2owb6nrGdmdjtxXKofybAcjZ3qWPaJdZmDU=
X-Received: by 2002:a05:651c:220a:b0:2f0:20cd:35fc with SMTP id
 38308e7fff4ca-2f62902e264mr69310571fa.7.1725349641715; Tue, 03 Sep 2024
 00:47:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-6-bdb05b4b5a2e@linaro.org>
 <CAA8EJppJUB=wmaU+Hnh1=46deh-_wgd2qKtS-MJRkowUr8bhPQ@mail.gmail.com>
In-Reply-To: <CAA8EJppJUB=wmaU+Hnh1=46deh-_wgd2qKtS-MJRkowUr8bhPQ@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 3 Sep 2024 15:47:09 +0800
Message-ID: <CABymUCMrXOXDxkO-n_b3woDUL=PALmQm5oVCp7N5d1887mZ7SA@mail.gmail.com>
Subject: Re: [PATCH 06/21] drm/msm/dpu: Add utility to get mixer number
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B48=E6=
=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 19:07=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, 29 Aug 2024 at 13:19, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > Add utility to get mixer number via CRTC handler
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 7 +++++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h | 5 +++++
> >  2 files changed, 12 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.c
> > index 7d0fff9472441..a27e39c525d1a 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -1306,6 +1306,13 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool =
en)
> >         return 0;
> >  }
> >
> > +unsigned int dpu_crtc_get_lm_num(const struct drm_crtc_state *state)
> > +{
> > +       struct dpu_crtc_state *cstate =3D to_dpu_crtc_state(state);
> > +
> > +       return cstate->num_mixers;
> > +}
>
> Merge with the user

OK.


>
> > +
> >  #ifdef CONFIG_DEBUG_FS
> >  static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
> >  {
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.h
> > index b26d5fe40c721..701c35803633d 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > @@ -301,5 +301,10 @@ static inline enum dpu_crtc_client_type dpu_crtc_g=
et_client_type(
> >  }
> >
> >  void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
> > +/**
> > + * dpu_crtc_get_lm_num - Get mixer number in this CRTC pipeline
> > + * @crtc: Pointer to drm crtc object
> > + */
>
> Move kerneldoc before the function implementation so that W=3D1 can check=
 it.


>
> > +unsigned int dpu_crtc_get_lm_num(const struct drm_crtc_state *state);
> >
> >  #endif /* _DPU_CRTC_H_ */
> >
> > --
> > 2.34.1
> >
>
>
> --
> With best wishes
> Dmitry

