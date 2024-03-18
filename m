Return-Path: <linux-arm-msm+bounces-14419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D90A687F06B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 20:26:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A2A1B229C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 19:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 218BE56B6E;
	Mon, 18 Mar 2024 19:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fDlDzAPt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270C756755
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 19:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710789993; cv=none; b=FCXrA2te5PgxeBpEgv2DkmbBdNw9tOBWq06IXrH/gXq4Q6LnOdGjI2NjBocD1SjNgm1iornT8erQrJy1VfNHaL+GVVzmWmfSRAqNzYzwmOg+bMxkHXZGzbS/cANVWqZ9ev5nOTIBJ0whq5IRAodyL3pn1KJIPrpf+hPqCly22Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710789993; c=relaxed/simple;
	bh=xvwBqy02Lt//XY7TKf5p6Szodv2siVQMtlWkmKgSadE=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GcSD27zjPFKHqsIdSYSRY2kVoNEx4/qHhuPxUJuKIX7rdkX7rBTSJjEK+XEQkJKEA3/0bWpyIR3XLVm2CCZz8KB2MCaILWZ4yrsJpvJ3NsKHCW2UKxRhW/s+mw1InrMCfv1XW/zHkUD4/O7zs/76xMGz0ztfLqoyfR91LP+OLM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fDlDzAPt; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d4a8bddc21so18554041fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 12:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710789988; x=1711394788; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xvwBqy02Lt//XY7TKf5p6Szodv2siVQMtlWkmKgSadE=;
        b=fDlDzAPt18Ei8s8QtbQPupUnvUc1kL0d5rgaM5yfoLBBypKUG4zj98gKcZg9J8a1Nv
         nnL9ECUdf2gu+a17Hw5Dxkxqir/Kw0jHBIINKFB8qtYheaERJdzstJGzRC+nmtkb4lU2
         uEKa9pdMuHgLG/EI3+dnxasbkicna7Vne6Gu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710789988; x=1711394788;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xvwBqy02Lt//XY7TKf5p6Szodv2siVQMtlWkmKgSadE=;
        b=w5vnk+fBVVELmQkhaBlZAkJ8o7tRdHe8msqq9t6NiInEL+YrmaeuydEQcNxsELKqHS
         AaDkMGwfVpJU5hio2vUxEuVD1lQGEF46DwGJmwvN1Nlh0wBUFfIvfF9ERmqOagJL0ASJ
         zxf1ti6M/1LQN6jrY2rkouJRv/ibwh7O6SOTYTil7jGG63KpcqSH2AX7kolREvnQdAom
         vAM/HHxQPAa50WhDIqweCUf2GZ9RYysSR4cigYRP40wU2uWDym8N3g0mL4O6UqUYnLRi
         PAm90GceaC5kzNb+eZV+qcNkG8SkQ0N7fNAhdE9I9udr0TGjBcFVvz/s0H811euqC3ee
         kkHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXW4fcqE92YIbtPch7TsNYnHvAR74SkLQzlBQ4LQrG+/Q1OKSQwiuuTXF+bgnmcuWLWTZ4y2xBINZXqIyu41IjsyPR7Qy9YqToAkAnkWA==
X-Gm-Message-State: AOJu0YwSSb6CLeUmcnbbQH8cbhowANQJHG0dLSXu7MOb2HoQYGqkI7yw
	TaE+rzlAapL9ye7D31U0h/UtB6J4ZpmwpymrRhxaRRGcvzYQwE80qHEHQRWahM/Xlxr+aItOhqL
	StWVtYMt4i1+qhz1aORlakiajfqYLU8KiaxnT
X-Google-Smtp-Source: AGHT+IFe4SIqBk2a4Gcqz06qiXmOLolMnAnmlf22UjLfTc3cWz8vho8vUCaBS8BcelwlfYICaPBpPRtqxlh+N67N26o=
X-Received: by 2002:a2e:7c19:0:b0:2d4:b061:d9f8 with SMTP id
 x25-20020a2e7c19000000b002d4b061d9f8mr1711566ljc.39.1710789988109; Mon, 18
 Mar 2024 12:26:28 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 Mar 2024 12:26:27 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240315143621.v2.4.Ia5dd755f81d7cc9a4393c43f77b9be4ed2278ee3@changeid>
References: <20240315213717.1411017-1-dianders@chromium.org> <20240315143621.v2.4.Ia5dd755f81d7cc9a4393c43f77b9be4ed2278ee3@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 18 Mar 2024 12:26:27 -0700
Message-ID: <CAE-0n51baqN8cEubSqDegqDwL7O6=iEfN5Ho2OykqjmkjQDcvQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/msm/dp: Fix typo in static function (ststus => status)
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Douglas Anderson <dianders@chromium.org>, 
	Rob Clark <robdclark@gmail.com>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Douglas Anderson (2024-03-15 14:36:32)
> This is a no-op change to just fix a typo in the name of a static function.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v2:
> - ("Fix typo in static function (ststus => status)") new for v2.

This was sent at
https://lore.kernel.org/r/20240306193515.455388-1-quic_abhinavk@quicinc.com

