Return-Path: <linux-arm-msm+bounces-16791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B60DC89BC7B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 11:59:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 578431F228A0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 09:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8975352F6B;
	Mon,  8 Apr 2024 09:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jnFlnxVH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6BF52F63
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Apr 2024 09:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712570363; cv=none; b=LwHY0ccYCsy2+JGkvyEWJ/JKyurmrB53Jy0t6+JQE5QDKqNC7QR9LPrrsdySKzxvr8TmEbpyK++avYESI+zwZUpba51SXyvfbaD3SXmZfjZqY0BA/p6TMED00eDbmtmVs9VhXm+yk2D6hEpeE4CMj8/binLhQG8beRr8MyDBqYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712570363; c=relaxed/simple;
	bh=P9KvZdO6slCJDjFtM9O7W2ol2wm72dfbTBqp5WmjxYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jUmIoD2Ti+QISqlbyC/p9vuTDbl2ifpUnMsaq4RdbNTLEvylm6AqdMFnRUVkaadwErB8Jkb0W6Q9pnNrJ4SwM3Je/5FaniGp1kbOkdeyUEgfcMTaN+771h5GqgbVSTRUVwNah592EpneVI/0cTYNlVBuvTZ2F54f2ZEkScJ1UGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jnFlnxVH; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d872102372so16102841fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Apr 2024 02:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712570360; x=1713175160; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aX6aDaiTDQQKwwQqDMi3cKuVKSE0XZ2PoAlIbyTQoEY=;
        b=jnFlnxVHYNFPXlRkhXl76MR8YAwDFwRaxWO1HahNf9IxEc2x9IPnACVHRcBL2nKAu/
         qenENkkb5pOye0PixTWnNinpARHtCLKrkZD56tZTuwtFejeGdH9WbuerRgxVgzC2x5/h
         hiap01kk+VH3OrSk5K1E+4WrMSo2gHRSb8UYZsJiJS5AXw8HGPaUSq+F2hcVUJNW8D/M
         vnhCUS8nnRdw4DsAh27blg4CYM6NIQGxfv1ghX8Lw8Uf8iwcYHUKHevaFABvAOuCR5Dc
         BmcL54YKaYkCndezPNevYut2QHvMroXGh8d+Cf7zQdpch9R9pVCRo2xo8fNIuW0gmGbD
         sQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712570360; x=1713175160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aX6aDaiTDQQKwwQqDMi3cKuVKSE0XZ2PoAlIbyTQoEY=;
        b=dL9Q4HItUXBJUgtlv/9QHTElTtTauf+BJy3PCE9z2sMAhRQNk2+Nz9hhygduIjKknV
         4mA03ONGTIBw2ahd1ds+59tp5pCmckI3fFzM7DPUg3fBhdgorOwzXTRHgFWQKHriMfVI
         LiJWGgLodIPyTT6yM/2CLv+Lbd1nUpgvAHeVQhoQMQTyuwrObUQpyAUIV3K5qewlqKiD
         O7nlK8mW3zEjGY3oxPjphF/5Ezp1X+NqyHa2T16RSRSr6jZ5BioCkakYX2PIeT0Gr0KI
         GEyFqnXL6lUdVJdKUN10JC0BjNDCCFGstdbwiwotiTY6WqYVPAPPLink7GFRNn9RPSme
         l5Jw==
X-Forwarded-Encrypted: i=1; AJvYcCW5uIJvJup8tF3XY7lOUVV8rOp+3nkI4vlUn+kXcEZj/IftVxMDPMSW0PccOqA0N+o0oJdwB9L1ZqPRMy8gbjjsa2HP2ecJ7pJvh8jkMA==
X-Gm-Message-State: AOJu0Yxun3QViRY3BUQhJPKf3gaccKWOodLdON01DuX2opCnErv4Mjpl
	29RPfAf3xUUPDV0qEvkzYKWoM6Mi6UNwB4HxVn9fjmWNnj42DWgg8Eo/soQFNDZNHoFfg6mtJeQ
	oup7IAKjJECd0H72RjO7coOAusNKxA8iZnYb52GJHiqrFM7cTYAS4rA==
X-Google-Smtp-Source: AGHT+IHpETVzYi9e2vtA/Z+GVefLYWp8VsykEgivacn22jHDLXO0DnsTxWYCv5yeCFyTRv4rCSYQ6OxQVFNE84nksC0=
X-Received: by 2002:a2e:4942:0:b0:2d7:1805:1071 with SMTP id
 b2-20020a2e4942000000b002d718051071mr2997230ljd.14.1712570359813; Mon, 08 Apr
 2024 02:59:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
 <20240403-msm-drm-dsc-dsi-video-upstream-v1-6-db5036443545@linaro.org> <CAA8EJprvAiOYnzJNduhr9MZe6asfE5ygtupTNbp4dcXD-U8jsA@mail.gmail.com>
In-Reply-To: <CAA8EJprvAiOYnzJNduhr9MZe6asfE5ygtupTNbp4dcXD-U8jsA@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 8 Apr 2024 17:59:19 +0800
Message-ID: <CABymUCNW4zpP4H+gKw8+7NPR0D08jM2ze4AVG89+KSwZYoozkQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B44=E6=
=9C=883=E6=97=A5=E5=91=A8=E4=B8=89 18:51=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, 3 Apr 2024 at 12:11, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > From: Jonathan Marek <jonathan@marek.ca>
> >
> > Support slice_per_pkt in msm driver.
> >
> > Note that the removed "pkt_per_line =3D slice_per_intf * slice_per_pkt"
> > comment is incorrect.
> >
> > Also trim the code to simplify the dsc reference.
> >
> > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 35 ++++++++++++++----------------=
-----
> >  1 file changed, 14 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/d=
si/dsi_host.c
> > index b0507a42ee6a..0c6f40dbd25c 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -866,17 +866,10 @@ static void dsi_update_dsc_timing(struct msm_dsi_=
host *msm_host, bool is_cmd_mod
> >         slice_per_intf =3D msm_dsc_get_slices_per_intf(dsc, hdisplay);
> >
> >         total_bytes_per_intf =3D dsc->slice_chunk_size * slice_per_intf=
;
> > -       bytes_per_pkt =3D dsc->slice_chunk_size; /* * slice_per_pkt; */
> > -
> > +       bytes_per_pkt =3D dsc->slice_chunk_size * dsc->slice_per_pkt;
>
> Please don't mix cleanup and functional changes.

OK. Will fix this.

