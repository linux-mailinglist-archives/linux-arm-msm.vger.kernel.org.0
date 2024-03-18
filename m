Return-Path: <linux-arm-msm+bounces-14420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFED87F07D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 20:37:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 409951C2145F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 19:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E8B756769;
	Mon, 18 Mar 2024 19:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EigCsaLf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5E711707
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 19:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710790675; cv=none; b=a3+fgsvsNT/lqk5F9H1yAj406rWYflkOEl4xMy6s7jHyGiUmvhfJO6F8iYsnmsTdRpuMoW0RpFK3H8xeFwmzhUB292l6YN+QdScEW71YXms2G+8VkM7YPCyWONigML1FuyItaB0jeGpdnYrwsV+EDO9GMNMlmgn/LWQIK4weZcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710790675; c=relaxed/simple;
	bh=CI084V8cwdZvQyXNROxkn3IbY00cnN+dX3japdJLysk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EZ6kjtUcZS0Hf8zKJAeFOp4GhQJzM3gkVe39t4ubtZgFzhFS/mtmvBnBm9NPqGtjozCDLkjFFKYsiLe/ebOEYVEOdXzkaz7inUfBI3GLR0Dgv4a4Bji6u3AW9PZ2+TvnvB3/xzaDWW0aKMJmdCEuCGAfRSQhJXOH9gEjoUAefzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EigCsaLf; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-430b74c17aaso22705091cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 12:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710790670; x=1711395470; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CI084V8cwdZvQyXNROxkn3IbY00cnN+dX3japdJLysk=;
        b=EigCsaLfDyZ9Gc4G087WXK6RmEdpuO6ZD2b7c+BZ5ntd3jeH843HgdWyxETSHmdMAP
         SC5vErLAN0+dOJ+DTlG0Eq30nWrvUapMeynO9YXL9/5SBESF0C6yfBKSKS8B5w0CepOi
         4pSgmrMLJzr6JSXq5cDplR0R1NfZM1Dm1UldE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710790670; x=1711395470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CI084V8cwdZvQyXNROxkn3IbY00cnN+dX3japdJLysk=;
        b=aUawrA5nQq8ONrlOzwYtBEDFleTFbHzSEb2o41Jib7KaY70UKnK6KI45GT1Sto77H3
         ca3umVY5lV1b1Ul3T+x22xi+FaPDLdwoI9ltJ0yUSVw73quZ3NzZOqzSDXvkqXw8pvis
         VzL84LEmAAvd9zXEaS6bvkmgxjk4fH81HT8tlS2wCPOtfOK7dcAFjPnRT3KqFiZWCuTV
         KBf7iX4IwSKwbfFZr0SUnMtwEOFvuwSAyq1IspwCiK4pIXCkVr1KlDbaX2l3gCdqCwNb
         k4/1XirQXIuUS3aUP7VQV9i4rPhZLv9+ORYNgFdyjESA52WfRWZX/wmEooGNEBS9EBvH
         f5YQ==
X-Forwarded-Encrypted: i=1; AJvYcCULgQfdiIkFT+I9dHzimp97zFwSLDflWoNqq7RDRiBZEN6hgEIMnlT2Cv93Kk3cM/gpYKJABhO0ISqs0iZOd0/NywT2gJXF3xI6MBSIyA==
X-Gm-Message-State: AOJu0YxNq9VBfWyaNAkoGpa7SO7TAPL8W0joJiig/nurAhprLouwV5wR
	qCpehHQSbDLisAhr9bXLFKdR7r6Zdqzuwo5SmNfbtI9JO6N7ajiGienJl2Bw9NjK2yR08CSzy7Y
	=
X-Google-Smtp-Source: AGHT+IEfGQgoyUHdAziVymZwxQzwjtbHJQkeL9rD7yL6eKMsYKuz9d3gh8j6ZkrhH4JmDSC7jeAhtQ==
X-Received: by 2002:a05:622a:5299:b0:42f:200e:1a61 with SMTP id dr25-20020a05622a529900b0042f200e1a61mr14204481qtb.34.1710790670614;
        Mon, 18 Mar 2024 12:37:50 -0700 (PDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com. [209.85.160.173])
        by smtp.gmail.com with ESMTPSA id bs23-20020ac86f17000000b004309c6a90b8sm753277qtb.27.2024.03.18.12.37.32
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 12:37:33 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-428405a0205so63201cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 12:37:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXJi+SuPsdKoaeeWIhs6A7/7yB0QE388FwPoUhh72qoT4wL7RV5seBQfZAY7mmNcnk/ejx599k+wqyyGf3fZKtFLO6exPsiogo13F+0ng==
X-Received: by 2002:ac8:7fd0:0:b0:430:9ee1:a8 with SMTP id b16-20020ac87fd0000000b004309ee100a8mr5892qtk.3.1710790652484;
 Mon, 18 Mar 2024 12:37:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240315213717.1411017-1-dianders@chromium.org>
 <20240315143621.v2.4.Ia5dd755f81d7cc9a4393c43f77b9be4ed2278ee3@changeid> <CAE-0n51baqN8cEubSqDegqDwL7O6=iEfN5Ho2OykqjmkjQDcvQ@mail.gmail.com>
In-Reply-To: <CAE-0n51baqN8cEubSqDegqDwL7O6=iEfN5Ho2OykqjmkjQDcvQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 18 Mar 2024 12:37:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U+kD852eCOxeJ97_483FMCXBZn+eaPPyb2VrXiGm6V1g@mail.gmail.com>
Message-ID: <CAD=FV=U+kD852eCOxeJ97_483FMCXBZn+eaPPyb2VrXiGm6V1g@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/msm/dp: Fix typo in static function (ststus => status)
To: Stephen Boyd <swboyd@chromium.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>, 
	Bjorn Andersson <quic_bjorande@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 18, 2024 at 12:26=E2=80=AFPM Stephen Boyd <swboyd@chromium.org>=
 wrote:
>
> Quoting Douglas Anderson (2024-03-15 14:36:32)
> > This is a no-op change to just fix a typo in the name of a static funct=
ion.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v2:
> > - ("Fix typo in static function (ststus =3D> status)") new for v2.
>
> This was sent at
> https://lore.kernel.org/r/20240306193515.455388-1-quic_abhinavk@quicinc.c=
om

Whoops! I guess we both noticed it at about the same time. My patch
should be dropped then. The rest of my series (patches #1 - #3) are
still relevant. I won't repost them since they can be applied just
fine even if this patch is dropped.

-Doug

