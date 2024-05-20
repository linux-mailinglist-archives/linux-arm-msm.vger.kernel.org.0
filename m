Return-Path: <linux-arm-msm+bounces-20080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8208CA26C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 20:58:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80FBE1F21A66
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 18:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F764AEE3;
	Mon, 20 May 2024 18:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bAPnp4Sp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DE31DFCB
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2024 18:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716231534; cv=none; b=BWuvq4Qcc//crIKNwOwCxd0Zkif4PICvTdcnlzZYoRy8xF8mjtWdZfLkws3f52iZuntLckYnmfUACrHBkSidqQLDqKFiL+9E5988nKvsvQI1Jdi2oy2KVn1KFjNtcJUAueVelIGOS1htYokZn7b5unBQe1Fvy0XQnVGe8zxI6WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716231534; c=relaxed/simple;
	bh=fBnCjpKJ7CF65HGWNGXJZSrAbDCCX00X0RQT571Lttc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gws6h/9KYOWh+S28/7Si6JgOurc8G3iLeKQdeYPd7H93OxNIZgGVjqDFcwlWKUO+7II0PhQYQNi9hvPPf9danYTmUr0jfHw3WKNR8vy1SKOcFhZj7RFRyP3gC9I0WIqtSssTmBJlbwMtPIZZ2AYSZLxrxCkX06+mLlnsrFQIQ1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bAPnp4Sp; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3c99e8958faso1470073b6e.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2024 11:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716231531; x=1716836331; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=df0l1z5z3FCtw3Ch204FxFA5rR9YqNy64rwyV2fw88o=;
        b=bAPnp4SptxmoFbRkuGl/PzzDsgHaUGsjy39ofUdnmmyevTSzfewDziz6/Of40xjtzg
         l35Dfp1U9E8PyIfqd2SkXywtz6vesOwcDLdGFmRNBawkiqpzo+7cDVsWeCvKAfoZqH43
         BbIm6em4fSGrDT4pEy3jOT22IXwqXiod+TU1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716231531; x=1716836331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=df0l1z5z3FCtw3Ch204FxFA5rR9YqNy64rwyV2fw88o=;
        b=RktbMqDV6fzBMdZ33fZx0VWuYz0tXK9LsIzSYludVJ5vrpxoV5+GYzKz4EmugWVGmF
         BNfze/gLrhXLZMPpcYxUaZ/AnuM8/vFx89Rs0gUbO70gdywCBoFYlJKKOMGZKgx24P17
         PEdWy1Hrbo40kN7Y0ozzli3Tunlp7Q9p8HP4cP6fQkIS6qdUNLHkkenGZuE8hOiKq6+o
         LKLYJ5P/MSIT8/WppwRbR+Fvr4ZrHuldyj1IU+gVHnsxzxOFZAued4y4DLnGSsg+92ML
         Rn69O+w1kZ/UaW3+S3QqJaXl3GMMuDMjLnCWwbIvGAcHIunmNKWt34Y1nefGdpUU5Q11
         jOow==
X-Forwarded-Encrypted: i=1; AJvYcCUoGSeTC4s9EQFKUA+XOwr7nM6h2GKXhF1DbH3OZHlzPEoMNhURlR/EfxUvkvsy5GhTrcUkGdy3yuCoeUdtSZAnDmHyv+WFEmVQsZsawQ==
X-Gm-Message-State: AOJu0YwDyggGLMiYUAigV/4zHmzvTH6JGknTCdYJewFZiSU2WDP4RpeV
	GKFpUNERp/UlEARii2+4pGyukjbWJeQ5FXQsiVJRH/nU00S/78ahvohuvWWn/AS98YKfPp9u74s
	=
X-Google-Smtp-Source: AGHT+IHurSqRqZlVTDsssQOlCmNpMS5b/+5qEkLoUDZiWzULbbmxd2NFCv7q0ZoanGOgUcU7hsWKDA==
X-Received: by 2002:a05:6808:30a9:b0:3c7:2d4a:d2b4 with SMTP id 5614622812f47-3c9971db286mr33388410b6e.52.1716231530887;
        Mon, 20 May 2024 11:58:50 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com. [209.85.160.174])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-792eb161bbcsm734867485a.101.2024.05.20.11.58.50
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 11:58:50 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-43f87dd6866so388301cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2024 11:58:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU6Jysvy4HGCzpx/NIcnC+VbYBm40cGy3DM6G2zerTEGZPB5f394rLg4wr46yqKIR1kaoiv/Mjt6rc0KmFfFhXX+A0V+zlqdtvSmF6Dhw==
X-Received: by 2002:a05:622a:1918:b0:43d:a002:b with SMTP id
 d75a77b69052e-43f7a91b195mr5561141cf.9.1716231529626; Mon, 20 May 2024
 11:58:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507230440.3384949-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240507230440.3384949-1-quic_abhinavk@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 20 May 2024 11:58:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Us-459kG-h1xT2+ffuSGuTLJ-UrJBD-5seRh4jAeHxmQ@mail.gmail.com>
Message-ID: <CAD=FV=Us-459kG-h1xT2+ffuSGuTLJ-UrJBD-5seRh4jAeHxmQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: remove python 3.9 dependency for compiling msm
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 7, 2024 at 4:05=E2=80=AFPM Abhinav Kumar <quic_abhinavk@quicinc=
.com> wrote:
>
> Since commit 5acf49119630 ("drm/msm: import gen_header.py script from Mes=
a"),
> compilation is broken on machines having python versions older than 3.9
> due to dependency on argparse.BooleanOptionalAction.
>
> Switch to use simple bool for the validate flag to remove the dependency.
>
> Fixes: 5acf49119630 ("drm/msm: import gen_header.py script from Mesa")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/registers/gen_header.py | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

FWIW, it looks like the commit this is fixing is now present in
Linus's tree. Is there any plan to land this fix? It would be nifty if
it could somehow make it in time for -rc1 so I don't need to track
down this patch every time I need to build a subsystem tree for the
next several weeks...

-Doug

