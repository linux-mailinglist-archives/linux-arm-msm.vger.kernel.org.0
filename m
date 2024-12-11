Return-Path: <linux-arm-msm+bounces-41438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 633CB9EC7A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 09:47:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41D27188C722
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 08:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9261EC4C1;
	Wed, 11 Dec 2024 08:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Od9pYJ27"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9401E9B1A
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 08:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733906842; cv=none; b=DCXnBXRabsuBMhyC9RWAxdWHYDKtopQwZg/Zqwa70K7m3jo1ts7l3bjqi4DA2bH8f1hg6cRtIB5Cy5pamrCsET9HpKibJGYl4wW469qfxDsmhwWjAgGu4HZfSFzNpsAsP1IFJocGdHXZRW79JrUi4nLGmlyv8xXvChHDjF2xK10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733906842; c=relaxed/simple;
	bh=VCdtky//FuKQ1O98k1ZwZq74x732mntDSu0a0sp4nnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YsWA0KFFgIcHaCSG26jSYdGNUNINREZDnHHzi3reWmAQusxQNyKBvdxSJR/z23cEPssM3WVNoZmJPhBTvhDSVHXsNkb81z7A4MCVlkU97WgknoVLmm0+kUQbykbtzVpmB9IOxd3WZ784Z0FCNOzJ1603+GFnu225THWhVFLZTjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Od9pYJ27; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ffd6b7d77aso73543381fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 00:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733906838; x=1734511638; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WZ9yw5+eiQnubxYw3ZTt7r7hhaE0oRY7onPmgVMFj5s=;
        b=Od9pYJ27MmeUIMvCcBya10un1oCujI97lTizjsJg/4JUKva00FaOwTMnp0h1qhGOj0
         KgKgA5tqPFKv9NdDHHMqS/z1fkyNtPq43yYIRrB0mSvYay/9Is3tJJlOTTD/ztcpe4Oz
         28ksnIu5jUzLAivNW1AMmu0hSa9hK0pXoo12lDloeM6F0TRBtERFjaNu6I9eX+KoKGZv
         zl2+hOoFNeNts/AfGhf3jA9O/FlF+yUlwa3VZRiHGUQ+lVaXNXOlWrkUIKHiKTALHwGz
         ClrzT0BudeUIDra1fa+8AZtWx8OPLYl7BG9n3mnnv0Mfm8NssqeetyDRD2muu7ts2EXa
         qPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733906838; x=1734511638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZ9yw5+eiQnubxYw3ZTt7r7hhaE0oRY7onPmgVMFj5s=;
        b=AYRGdcS7mr9KYRQUHb0LmPxC9S8O1dlAjqjTpa39wnDO8XJB1xzG7C6j/cfDPnnPU2
         TJnugESzIsUhK3jmQBqtSJfLNvLh9Swo3X7dwl6Pq7GIPSSX0AGrltJZ2tbIVwJnIUzZ
         dNOfP+OGefE319E/sr8DtANr73Kgdwt/6gvkAJzjvFPnspHmHI9nVLh5UPH+zImFxgBp
         HnUnwxpuAZOTFwNBAdmwmjp0yPiDvfxoOyjUS62UjGZ7KdCLWUsWRb5w+DNh3kArg6mb
         b7w/+DWn0hKFMEbga/tcjQSRzIncCMbg0mrK+2YvrDJDnuIb3JKhKj2BXiY+g+4u5gdM
         XrjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtFIOUk5XIgfTriUAzDjpLYGMu+uy1H0bTZADO3Vq0x6o/p75cCNYBzlcm5nDiFmNRxHkRjW9YVclDWiK3@vger.kernel.org
X-Gm-Message-State: AOJu0YzFhBODuXaDLu2RsqUlXewKaNjomFJjmbUygLzYzR/1shqR3aPe
	MugfiM+0+6ZtD1Apt/7/hcp6Kdflp6obfy1HfooR+na5viXUvKsJhUvDRazbdhA=
X-Gm-Gg: ASbGnct9YwhjW8T35Pec2dorYHrMmh6OIRWtLBtmHw+0m7dh5K89qDSg+hNF8Akkz2f
	Jmwe7soIZx3y/b/SbDmm0yzDhe2Rg1tco1ZtbaRSnewziheN9EJjV6BeqMp5JLy1ibiwhj5j2mD
	ykMmhJMIaLqhnGwctQbtJv/3NIMzzb8kewO3HnrYNguteJB4kbWadqiaVDpYZ1w0UktsnhbihKH
	Sd5p1tLXaFPMlJswoa0LX67NhqA1qUlHEEZ47VHJGEemMPiICg+PkwF8I5PrUqEYAHn5haJ+bZB
	5HvIXxXe6ZvDC4WiKs+hSahcczqvYH2zVQ==
X-Google-Smtp-Source: AGHT+IEzbCuaw2gb4SoiLfoCGhV4qUqReRteL4cHA8BdEPX67hviGCcUhbWK23EzV3nUwwQBFx6QyA==
X-Received: by 2002:a05:6512:3d18:b0:540:2339:3761 with SMTP id 2adb3069b0e04-5402a5ea3c0mr647882e87.31.1733906837971;
        Wed, 11 Dec 2024 00:47:17 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54020b50393sm796000e87.20.2024.12.11.00.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 00:47:16 -0800 (PST)
Date: Wed, 11 Dec 2024 10:47:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Stefan Schmidt <stefan.schmidt@linaro.org>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Jianhua Lu <lujianhua000@gmail.com>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 27/28] media: iris: enable video driver probe of
 SM8250 SoC
Message-ID: <35tpvx2uok22tmq76fe6mluiqnkymm2es6iu5jjj2zapeio6me@l4obuknsn3gz>
References: <20241210-qcom-video-iris-v8-0-42c5403cb1a3@quicinc.com>
 <20241210-qcom-video-iris-v8-27-42c5403cb1a3@quicinc.com>
 <CAEvtbuuO5Ga+wW9rstX_e_RGnm5jSNSHmyy3w3M9FTopNhKttQ@mail.gmail.com>
 <b4f35301-6361-9e07-73dc-023e87c80857@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4f35301-6361-9e07-73dc-023e87c80857@quicinc.com>

On Wed, Dec 11, 2024 at 11:54:09AM +0530, Dikshita Agarwal wrote:
> 
> 
> On 12/10/2024 9:53 PM, Stefan Schmidt wrote:
> > hello Dikshita,
> > 
> > On Tue, 10 Dec 2024 at 12:08, Dikshita Agarwal
> > <quic_dikshita@quicinc.com> wrote:
> >>
> >> Initialize the platform data and enable video driver probe of SM8250
> >> SoC. Add a kernel param to select between venus and iris drivers for
> >> platforms supported by both drivers, for ex: SM8250.
> >>
> >> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> > 
> > [...]
> > 
> >> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> >> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> >> @@ -17,6 +17,8 @@ static inline bool iris_valid_cap_id(enum platform_inst_fw_cap_type cap_id)
> >>  static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
> >>  {
> >>         switch (id) {
> >> +       case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:
> >> +               return DEBLOCK;
> >>         case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
> >>                 return PROFILE;
> >>         case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
> >> @@ -32,6 +34,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
> >>                 return 0;
> >>
> >>         switch (cap_id) {
> >> +       case DEBLOCK:
> >> +               return V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER;
> >>         case PROFILE:
> > 
> > The handling for DEBLOCK does not seem to be part of the SM8250
> > enablement. Or did I miss something?
> > It seems they should be part of a different patch that makes use of
> > the DEBLOCK cap.
> > 
> this cap is part of platform caps of SM8250 and the value(set by
> client/default) of this will set to firmware as part of start streaming
> through set APIs.

Then it still makes sense to split into two parts: one for DEBLOCK
handling, one for the platform data only. Or you can safely merge
DEBLOCK into the main caps commit.

> {
> +		.cap_id = DEBLOCK,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER,
> +		.set = iris_set_u32,
> +	},
> 
> Thanks,
> Dikshita
> > regards
> > Stefan Schmidt

-- 
With best wishes
Dmitry

