Return-Path: <linux-arm-msm+bounces-39803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7B89DFD3A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 10:33:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 09CEEB22466
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 09:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B89B1FA82B;
	Mon,  2 Dec 2024 09:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sh2DOCRR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43E41FA257
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 09:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733131972; cv=none; b=AoOQlD9Pu/gPLPA40Qya4E6lY7ZdE2TRl3Jq6MhthDBu4BqXGFXHvr0mxPt9F+2Mdaj7zPGDDewLCcJjyjj+sAJ4Vk+WFT/BFsmbT68bP3PqoOD4LEirao+Q/+9FCbsnnqt4OptLQlYOG2Z1kE+TmfCsmG4cZAQXBJ6FBaEGQEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733131972; c=relaxed/simple;
	bh=eYORF81wpS5r5CboRFAWx5G/GfVASyQGa5TvPaUF1yM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sg4g/e+rnPoBYAUoq6aVhWNs8py+w+dY9Yj6C940BgGWFsMMvY1BLT6VgZpVU8NYWtV8QmIOsyPO1iuDgtSwZneq9vc3MpUAFwwFaR71iIz3jbeGB3rVDPb5nDbfjXzgUYuvALWoYtayQbjGuIslddx56MGRFli6i1LWcBH75fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sh2DOCRR; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e398dc7864dso2193177276.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 01:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733131970; x=1733736770; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ykJ4gnZ8OI+lNlsS7GnWz+Q0GYuAZsbDat/k0gHdcy0=;
        b=Sh2DOCRRIP6YQyWFw5vRejWNdbnXGXUZjmZke4QJ2bHCf61mc6wP+yJR4eHngvM1gU
         8tWJsx6K6OPnI4w5DBbz6/Jv5VTiXulyrBYcYNRU2+C329w0scY2lWBoSumjGlAq9OEu
         jiMnld81lJMCu6yS0kYHoQpcqPwySI3xSPwVdaosVJ2XVzor6pk7+E+MTatvrwtalDDT
         Iv8FqF0MUK2Hesrat+bXYf8hcuJ1GNWJ7+7Vw5S3KNHaunVZiAq0rWMf0e7fiFQhb7RC
         x/T5oi3ff+8TXtQyeJLTySyYOQOiKT7IUuziCxcflV4hjdzvXyrNnH/Z+vc/HYHGlbjh
         TtbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733131970; x=1733736770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ykJ4gnZ8OI+lNlsS7GnWz+Q0GYuAZsbDat/k0gHdcy0=;
        b=P9upW6Wq1BiF+u8XFCImLH9pXht7DbI9yC4jcfpEt7JLKG7qowMsxzMyk4sYq0Q1hP
         7IlETayp2gjlmeN6FdfCgy9HpAP94V75skx3Vx6E7qaoyWm/ECqTH7z5sIwuthgs6fGD
         O0SS1t7kW7GiTJ/oPDyDMpdVJPJdjNg52ZUirSP02YcxNlgb6mlyLzBIrudkky+G04XR
         MnzCMgUGyUZlN/7EhbrBZvunN0NRr3Fm0XWrQOMMHe2dxi6ChKhENLvuD1baqSzKrlB+
         3+wCxgWD0VMQIaApuGrQGMHUXAaM/Ys0XqpFJIcYD1XJwcMuTl+fL+AAvT1+8Ps3kMGN
         Y5qw==
X-Forwarded-Encrypted: i=1; AJvYcCUMxqkflQASkUtlSZnwAq/BgE3+x9MIfbJnnmwHgNd22qrMbnlO+IAzCn3zUByhbDZf92VBTsJTRbQouwhG@vger.kernel.org
X-Gm-Message-State: AOJu0YxuqC6Xg8OOUGzQAke5VrS7oB+z0vNkUklLB7+b9iIMtp44Zh/Z
	u1sXL4zu/RiUcHCXRjN/ezzM/BkGxjP3WkV9Q2FKdZoqbwBjJBJqQWOh81DFB2O4MMdwyDHtuRl
	5GCZsfe9fevcGUvm1NVSRE+Ty2GLtSlYvOznygw==
X-Gm-Gg: ASbGncsp0MWnTkkwjhX+u6qxMDFFW9Rv4VNZcITw9JXjG2d/RaVBQBBey76iQzzyLXU
	BzUEFtS9ljKP6FbSKj58MQStsdAL5BQ==
X-Google-Smtp-Source: AGHT+IGT3z3TbHSFBQBWWQ1KvYeMAU20/kLWtZdyfcltpfmv3iUgGjIOBFmp2Bw/pBAtCruUtd0beWsC6yrtxdL0HE0=
X-Received: by 2002:a05:6902:150d:b0:e38:b889:7eff with SMTP id
 3f1490d57ef6-e395b870d38mr18514341276.6.1733131969951; Mon, 02 Dec 2024
 01:32:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-6-09a4338d93ef@quicinc.com>
 <CAA8EJpprTGRTxO+9BC6GRwxE4A3CuvmySsxS2Nh4Tqj0nDRT_Q@mail.gmail.com> <95a78722-8266-4d5d-8d2f-e8efa1aa2e87@quicinc.com>
In-Reply-To: <95a78722-8266-4d5d-8d2f-e8efa1aa2e87@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 2 Dec 2024 11:32:45 +0200
Message-ID: <CAA8EJpo-1o9i4JhZgdbvRxvoYQE2v18Lz_8dVg=Za7a_pk5EDA@mail.gmail.com>
Subject: Re: [PATCH 6/8] drm/msm/dp: Add maximum width limitation for modes
To: Xiangxu Yin <quic_xiangxuy@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, quic_lliu6@quicinc.com, quic_fangez@quicinc.com, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2 Dec 2024 at 11:05, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
>
>
>
> On 11/29/2024 9:52 PM, Dmitry Baryshkov wrote:
> > On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> w=
rote:
> >>
> >> Introduce a maximum width constraint for modes during validation. This
> >> ensures that the modes are filtered based on hardware capabilities,
> >> specifically addressing the line buffer limitations of individual pipe=
s.
> >
> > This doesn't describe, why this is necessary. What does "buffer
> > limitations of individual pipes" mean?
> > If the platforms have hw capabilities like being unable to support 8k
> > or 10k, it should go to platform data
> >
> It's SSPP line buffer limitation for this platform and only support to 21=
60 mode width.
> Then, shall I add max_width config to struct msm_dp_desc in next patch? f=
or other platform will set defualt value to =E2=80=98DP_MAX_WIDTH 7680'

SSPP line buffer limitations are to be handled in the DPU driver. The
DP driver shouldn't care about those.

> >>
> >> Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
> >> ---
> >>  drivers/gpu/drm/msm/dp/dp_display.c |  3 +++
> >>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
> >>  drivers/gpu/drm/msm/dp/dp_panel.c   | 13 +++++++++++++
> >>  drivers/gpu/drm/msm/dp/dp_panel.h   |  1 +
> >>  4 files changed, 18 insertions(+)


--=20
With best wishes
Dmitry

