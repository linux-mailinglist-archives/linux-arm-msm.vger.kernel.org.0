Return-Path: <linux-arm-msm+bounces-19602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D648C150A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 20:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 749E61C21EAA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 18:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3CA17E112;
	Thu,  9 May 2024 18:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eTGu0bf5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064363201
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 May 2024 18:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715280630; cv=none; b=K/TkVeCc+KqezFuqYB/fAc1tCCqllaQUNXQn+2/du6N4rkNYXfWP0m7fh7B0jOR9XmlwcgVT1kq4jt71BqKGgRTZ81v1KfD7CiGrAW8O5/hrbsCDAtglX0sJO4g1LvtwKftn6JvAN6Wcu/PaEmvKBrx66ohIS9qeZWZxYKHwEjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715280630; c=relaxed/simple;
	bh=4QzClZ1gRVtyCX7YdwhFlyPn+GYCunj82D3LkrwSRjw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Q4keDi46le9TzP8Q6aueB6rZtx3xeANCvdR41hfAT31Eiwj22F+043aWhJ17WHMEvAbgQ6GbaHskU0y/A13GqXyspBcTaElchzyt+LCgwr6Tujxa4INqbD48V+ojxBNZPPyKHirXpNOppkFKprS8KO+S8KbOH2TOlZ3KXhditaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eTGu0bf5; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5b277993a48so485855eaf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 May 2024 11:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715280628; x=1715885428; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rKMjOnnO0WYipffLPmzjc4/xyv9Lp/0n3YbamfBbS/w=;
        b=eTGu0bf5Ru22CpCUZeqHStpJDSnuKPFbxwXHKDoxK6yVtHVmyLfTEN2gkg4Lh6rNyX
         BJz0e6dlhfBrrsaUl8k22XJIA/p47mHT1yi+UlzDb3Qo4ghSFIWNyYSjJN4IQnLRvTut
         z5ZwSHfbYar7QwQse+VAacPL/MMaJITQm0mHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715280628; x=1715885428;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rKMjOnnO0WYipffLPmzjc4/xyv9Lp/0n3YbamfBbS/w=;
        b=fRXs98RE1b3nHb4llHHROA3Rdpi9V36DYme9eTYknwKygUsgV3O4u6DANVKWyxneZc
         YkpiUOimRBGCDRSiEW159OIsYe9YnIHBHmj8CB+2MZPtvDp+xhAHSxXg50E4gSjkiDeu
         NnmEtPaMkhUZqNg/hWWJtnINkWNZKHpOmP26BD0/51nsPA72inCnxUmfgV0xZIx9oaF2
         zO5lG+gUCNBN7Qdoy6FmX7UJiJhJjI2IQZsRlu/Du8IBQq4D4G6zefzrA+9WNimxPMGc
         Gs8aD2/mLbou3dhOhOFNp3VWZ/KO2fq0d1BERZIsUUatXnCoGNANjqxIIUozcApGAUO7
         8hDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrFqCF7wmfpYo9N6kI0Rmq7VhZQYkOWpL2qsjuqbXN3pE8NMfdlkDChwwDMY6SHcP0Czig9p0UOkjnoa6YSe0I4jlq7oneqq485iRVcA==
X-Gm-Message-State: AOJu0YycqRXT2kigX9sFAER9quMfLKIZ6TSUQ2wVkZ104rsD0s6Lp2MQ
	SfSAhdQan7XkgBJjbsSFbvvF3o9oB+VjZ7zGzWzen3eLgr0s7JNyQMMXGgk/GQuCnXpIJXDH4BV
	PqA==
X-Google-Smtp-Source: AGHT+IFd/03/cHYo9a/gplcpFv8hUZ1aOz8VA6Xf/Hz97e/a5NdGGQPXY3UqcDhUiBKGZPMDyXinJg==
X-Received: by 2002:a4a:bd16:0:b0:5b2:8256:7f3d with SMTP id 006d021491bc7-5b282567f61mr180162eaf.1.1715280627829;
        Thu, 09 May 2024 11:50:27 -0700 (PDT)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com. [209.85.167.173])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5b277bef476sm227902eaf.19.2024.05.09.11.50.26
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 May 2024 11:50:27 -0700 (PDT)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3c5ee4ce695so427416b6e.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 May 2024 11:50:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVRAnDGRYuyNPp/o8HwB6DejND8YTJhW4etty4BXLfxEDHC0KetibpDPXdUt9TLypa0EHdExHXaffviEPTzjaKIRKXgG5ahKd1BzoCV1A==
X-Received: by 2002:aca:190e:0:b0:3c9:7aef:403 with SMTP id
 5614622812f47-3c99706bb87mr458934b6e.26.1715280626326; Thu, 09 May 2024
 11:50:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
 <20240507-cocci-flexarray-v2-1-7aea262cf065@chromium.org> <Zjs9h40l9gfaiOei@pengutronix.de>
In-Reply-To: <Zjs9h40l9gfaiOei@pengutronix.de>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 9 May 2024 20:50:14 +0200
X-Gmail-Original-Message-ID: <CANiDSCvon2eW4aHk8JD2_GDR9hG1FBhgbCOEZ+W2RC2HHsXM5A@mail.gmail.com>
Message-ID: <CANiDSCvon2eW4aHk8JD2_GDR9hG1FBhgbCOEZ+W2RC2HHsXM5A@mail.gmail.com>
Subject: Re: [PATCH v2 01/18] media: allegro: nal-hevc: Refactor nal_hevc_sub_layer_hrd_parameters
To: Michael Tretter <m.tretter@pengutronix.de>, Ricardo Ribalda <ribalda@chromium.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, 
	Andy Walls <awalls@md.metrocast.net>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"

Hi Michael

On Wed, 8 May 2024 at 10:53, Michael Tretter <m.tretter@pengutronix.de> wrote:
>
> On Tue, 07 May 2024 16:27:06 +0000, Ricardo Ribalda wrote:
> > Replace all the single elements arrays with the element itself.
> >
> > Pahole shows the same padding and alignment for x86 and arm in both
> > situations.
> >
> > This fixes this cocci warning:
> > drivers/media/platform/allegro-dvt/nal-hevc.h:102:14-22: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
>
> Thanks for the patch.
>
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/platform/allegro-dvt/allegro-core.c |  6 +++---
> >  drivers/media/platform/allegro-dvt/nal-hevc.c     | 11 +++--------
> >  drivers/media/platform/allegro-dvt/nal-hevc.h     |  6 +++---
> >  3 files changed, 9 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
> > index da61f9beb6b4..369bd88cc0ae 100644
> > --- a/drivers/media/platform/allegro-dvt/allegro-core.c
> > +++ b/drivers/media/platform/allegro-dvt/allegro-core.c
> > @@ -1852,14 +1852,14 @@ static ssize_t allegro_hevc_write_sps(struct allegro_channel *channel,
> >       hrd->dpb_output_delay_length_minus1 = 30;
> >
> >       hrd->bit_rate_scale = ffs(channel->bitrate_peak) - 6;
> > -     hrd->vcl_hrd[0].bit_rate_value_minus1[0] =
> > +     hrd->vcl_hrd[0].bit_rate_value_minus1 =
> >               (channel->bitrate_peak >> (6 + hrd->bit_rate_scale)) - 1;
> >
> >       cpb_size = v4l2_ctrl_g_ctrl(channel->mpeg_video_cpb_size) * 1000;
> >       hrd->cpb_size_scale = ffs(cpb_size) - 4;
> > -     hrd->vcl_hrd[0].cpb_size_value_minus1[0] = (cpb_size >> (4 + hrd->cpb_size_scale)) - 1;
> > +     hrd->vcl_hrd[0].cpb_size_value_minus1 = (cpb_size >> (4 + hrd->cpb_size_scale)) - 1;
> >
> > -     hrd->vcl_hrd[0].cbr_flag[0] = !v4l2_ctrl_g_ctrl(channel->mpeg_video_frame_rc_enable);
> > +     hrd->vcl_hrd[0].cbr_flag = !v4l2_ctrl_g_ctrl(channel->mpeg_video_frame_rc_enable);
> >
> >       size = nal_hevc_write_sps(&dev->plat_dev->dev, dest, n, sps);
> >
> > diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.c b/drivers/media/platform/allegro-dvt/nal-hevc.c
> > index 9cdf2756e0a3..575089522df5 100644
> > --- a/drivers/media/platform/allegro-dvt/nal-hevc.c
> > +++ b/drivers/media/platform/allegro-dvt/nal-hevc.c
> > @@ -210,14 +210,9 @@ static void nal_hevc_rbsp_vps(struct rbsp *rbsp, struct nal_hevc_vps *vps)
> >  static void nal_hevc_rbsp_sub_layer_hrd_parameters(struct rbsp *rbsp,
> >                                                  struct nal_hevc_sub_layer_hrd_parameters *hrd)
> >  {
> > -     unsigned int i;
> > -     unsigned int cpb_cnt = 1;
> > -
> > -     for (i = 0; i < cpb_cnt; i++) {
> > -             rbsp_uev(rbsp, &hrd->bit_rate_value_minus1[i]);
> > -             rbsp_uev(rbsp, &hrd->cpb_size_value_minus1[i]);
> > -             rbsp_bit(rbsp, &hrd->cbr_flag[i]);
> > -     }
> > +     rbsp_uev(rbsp, &hrd->bit_rate_value_minus1);
> > +     rbsp_uev(rbsp, &hrd->cpb_size_value_minus1);
> > +     rbsp_bit(rbsp, &hrd->cbr_flag);
> >  }
> >
> >  static void nal_hevc_rbsp_hrd_parameters(struct rbsp *rbsp,
> > diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.h b/drivers/media/platform/allegro-dvt/nal-hevc.h
> > index eb46f12aae80..afa7a9d7d654 100644
> > --- a/drivers/media/platform/allegro-dvt/nal-hevc.h
> > +++ b/drivers/media/platform/allegro-dvt/nal-hevc.h
> > @@ -97,9 +97,9 @@ struct nal_hevc_vps {
> >  };
> >
> >  struct nal_hevc_sub_layer_hrd_parameters {
> > -     unsigned int bit_rate_value_minus1[1];
> > -     unsigned int cpb_size_value_minus1[1];
> > -     unsigned int cbr_flag[1];
> > +     unsigned int bit_rate_value_minus1;
> > +     unsigned int cpb_size_value_minus1;
> > +     unsigned int cbr_flag;
>
> The struct is modeled after the specification in ITU-T H.265, which
> defines the fields as arrays. It's a limitation of the current
> implementation that only a single element is supported.
>
> Maybe replacing the hard coded values with a constant would be more
> appropriate to document this limitation.

A define seems to convince coccinelle of our intentions :). I will
upload the fix in v3

diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.h
b/drivers/media/platform/allegro-dvt/nal-hevc.h
index eb46f12aae80..361e2f55c254 100644
--- a/drivers/media/platform/allegro-dvt/nal-hevc.h
+++ b/drivers/media/platform/allegro-dvt/nal-hevc.h
@@ -96,10 +96,11 @@ struct nal_hevc_vps {
        unsigned int extension_data_flag;
 };

+#define N_HRD_PARAMS 1
 struct nal_hevc_sub_layer_hrd_parameters {
-       unsigned int bit_rate_value_minus1[1];
-       unsigned int cpb_size_value_minus1[1];
-       unsigned int cbr_flag[1];
+       unsigned int bit_rate_value_minus1[N_HRD_PARAMS];
+       unsigned int cpb_size_value_minus1[N_HRD_PARAMS];
+       unsigned int cbr_flag[N_HRD_PARAMS];
 };

 struct nal_hevc_hrd_parameters {


Thanks.


>
> Michael
>
> >  };
> >
> >  struct nal_hevc_hrd_parameters {
> >
> > --
> > 2.45.0.rc1.225.g2a3ae87e7f-goog
> >
> >



--
Ricardo Ribalda

