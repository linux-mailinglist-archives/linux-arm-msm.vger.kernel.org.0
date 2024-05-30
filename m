Return-Path: <linux-arm-msm+bounces-21175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B078D5629
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 01:17:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43065287EFE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 23:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 670876F2E3;
	Thu, 30 May 2024 23:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CcFY+4Hh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDF64D8C3
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 23:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717111018; cv=none; b=ZTJGIBODJW0wmg44nJSDIXN5J6LT96HyMLJquPCAYR/+ViRQOC+7me81z5p0cba/5OVy1SiZBfUN5SDUbCV6Hl2N2E8zdLLXnWIWjrXP5+6iulNPGQkbTGqpBEXU9nzZpuSQVy845YIYOE1VgG+FB4p+bW5x3cMCsgID3Huh/GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717111018; c=relaxed/simple;
	bh=31u/vGw2CPYpYVL836bANXvOaTurmnqIhIoXVtya3nM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qIJ0BaRKNbo9ojG0iCoP9KD9aWq/8w5V5qGowI7Qs/BnFmaVeikizLeyqybsmqIQZuGCRrdM0HKu598eEjPodNPOfiru+f4z4JJGQJtK3f6mqAX5wFR8HYJQv7KOWMD8ecKNHIsuI7uOioR8NuiGOk2w0kCtLvZFlYuIn7Yyq1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CcFY+4Hh; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-794f60da205so1565185a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 16:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717111014; x=1717715814; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h8KNeqwgU441IhOlEftCeN31AWUkQGVDTw621Xo3rrs=;
        b=CcFY+4HhTuycF3r3c8CKCIdAzuzc1/CdB5NSMsH7+quLAqcmDUR1ypxBZ03UTaKb5n
         MNNS/96HVjMdMAK5Axmuyxs1YrfRVIyGlrDztSJErhgtY82wvOJ4tJKQsLTqQHQtrjjv
         KpFo7HXy03mHNeWaLbAlRzct23Z/xrMRqT7Uo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717111014; x=1717715814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h8KNeqwgU441IhOlEftCeN31AWUkQGVDTw621Xo3rrs=;
        b=s4MGQdnr0ygjPif3rQVTair0tRPOVykhS5pI1ZFo7kTrSL+CCsKFHmaqeB4o8vQHOG
         YQdyXy4xMSXG6+wTvNJraH1FIov6ug39tDg3Ud/YLv5D84I5rZgpgkXI6G+6Bfj0HeVO
         Wt0AIQPnMXO8ROoNpbrT91yFAi4Gc6DMORr9DtLbekjiJ9qcpU6Fb2pP2YVAsdqaqb4/
         HuSNLeZP3tFhn3fg7mdBiPoe6scZGwq7iO2oB4h/gqZvS4DfXeNYrMv5QPR+RUGOpWXb
         Ydi27PvqXfQJqdG9MohmQlFc1fViQtIYOE1EFjnNDMM27j2U2dHKbQNlcl8IM2Ng7F2n
         yAZA==
X-Forwarded-Encrypted: i=1; AJvYcCWLZg+vkr2CAdEyVVsiIXGROckQT4F3C8DUze1cnEvaZ8ewLxIEUpN2FpuOks1YsZUkgccHmFe2x2MGI5eGm89PHJgQE45x6q4vGxsinw==
X-Gm-Message-State: AOJu0YzTaXePW/noI0hTT+bGFVsJn7F5wxbgHjIq+OD64i/+3ftrJNqr
	PIs1BdF9vtxWkMm0V3YhJ6nIGSI5boDt/ZmG5ELkaQpKrm1XCVuX+AHZgKO73UyxDm48DBP4QAq
	wtA==
X-Google-Smtp-Source: AGHT+IELFxtNrNhuztvMcD83pVDdjQpG4Tx7WIQcQ2bML+0EqCG6MCHg4Qlh82n8bPrdFLOY0YIlcQ==
X-Received: by 2002:a05:620a:807:b0:792:faec:3e3e with SMTP id af79cd13be357-794f5c7c671mr15109185a.17.1717111013593;
        Thu, 30 May 2024 16:16:53 -0700 (PDT)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com. [209.85.160.177])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-794f2f128ecsm18908685a.42.2024.05.30.16.16.52
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 16:16:52 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-43e14f0bd75so75091cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 16:16:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWPHUWBYMtd9d98n3vWKGurtr138OefuDbD+O6FxHsxyMnvP4cxJUu7lI3TMnny+A68EN2aDkqHuerx6yYOJGoOUA2LzeQT2gJ+ZNvmkA==
X-Received: by 2002:a05:622a:1cc3:b0:43d:e001:69bc with SMTP id
 d75a77b69052e-43ff4f80e4cmr291431cf.17.1717111012344; Thu, 30 May 2024
 16:16:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240531-edp-panel-drop-v3-0-4c98b2b95e3a@linaro.org>
In-Reply-To: <20240531-edp-panel-drop-v3-0-4c98b2b95e3a@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 May 2024 16:16:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XMgAnaEaHXZJL57+66OXs0afP9vurxf_ffqkum=xqEfA@mail.gmail.com>
Message-ID: <CAD=FV=XMgAnaEaHXZJL57+66OXs0afP9vurxf_ffqkum=xqEfA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] drm/panel-edp: remove several legacy compatibles
 used by the driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Sam Ravnborg <sam@ravnborg.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, Jeffrey Hugo <quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 30, 2024 at 4:13=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> There are two ways to describe an eDP panel in device tree. The
> recommended way is to add a device on the AUX bus, ideally using the
> edp-panel compatible. The legacy way is to define a top-level platform
> device for the panel.
>
> Document that adding support for eDP panels in a legacy way is strongly
> discouraged (if not forbidden at all).
>
> While we are at it, also drop legacy compatible strings and bindings for
> five panels. These compatible strings were never used by a DT file
> present in Linux kernel and most likely were never used with the
> upstream Linux kernel.
>
> The following compatibles were never used by the devices supported by
> the upstream kernel and are a subject to possible removal:
>
> - lg,lp097qx1-spa1
> - samsung,lsn122dl01-c01
> - sharp,ld-d5116z01b
>
> I'm considering dropping them later, unless there is a good reason not
> to do so.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v3:
> - Rephrased the warning comment, following some of Doug's suggestions.
> - Link to v2: https://lore.kernel.org/r/20240529-edp-panel-drop-v2-0-fcfc=
457fc8dd@linaro.org
>
> Changes in v2:
> - Actually drop support for five panels acked by Doug Andersson
> - Link to v1: https://lore.kernel.org/r/20240523-edp-panel-drop-v1-1-045d=
62511d09@linaro.org
>
> ---
> Dmitry Baryshkov (3):
>       drm/panel-edp: add fat warning against adding new panel compatibles
>       dt-bindings: display: panel-simple: drop several eDP panels
>       drm/panel-edp: drop several legacy panels
>
>  .../bindings/display/panel/panel-simple.yaml       |  10 --
>  drivers/gpu/drm/panel/panel-edp.c                  | 192 +++------------=
------
>  2 files changed, 25 insertions(+), 177 deletions(-)

Thanks! I'm happy to apply this series or also happy if some other
drm-misc committer member wants to apply it. Probably we should wait
for a DT person to make sure that they don't have any problems with
the bindings change.


-Doug

