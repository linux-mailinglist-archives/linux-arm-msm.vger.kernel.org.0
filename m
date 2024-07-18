Return-Path: <linux-arm-msm+bounces-26604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A44937100
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 01:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93886281B02
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 23:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 268DC14532A;
	Thu, 18 Jul 2024 23:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TUN7n3kF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4A977F2C
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 23:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721344231; cv=none; b=PX5qWAPzJm0o5d5SSX6kO0SzrZS7bv1gJ+bJ9Un7qw6YfwePIkPrEGTrMj6cIuUbYbS0A3+bJZg9MVaJgHNSQSp6tDrMbZflYdP34acFCGO5SCca1sZy4MpZbaOd7OcyumE4qefwaE5HZo5NHZNMIJNWigxdikNYyXa5AArO4eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721344231; c=relaxed/simple;
	bh=5RsoVd5sliGC6jDsRNW/LxfNCShIK7sBspxYM3SJnoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MixlCm3SlgXiItYnsGKru9L3M00C8y9UReuk2f8in2kP/3yIu7VZIt61+hFPkXLVC62J/lsFYMETk7XV9U628v54nSphRiH6dugZIuemN0vPPNPtBHxw34c1yHyfYz0x/////ryo0bLe02U3KuTNQi38Yqg17wsEIzMpvMC8Ook=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TUN7n3kF; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-79f16cad2a7so52057385a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 16:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721344228; x=1721949028; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8/jfrbQkF4NocC2ktC4TuqIHUerHtNF+x1nkqsRqBY=;
        b=TUN7n3kF0uiVRVuR/Jr9HNKb4EN9WCn3mySUMPX3brqtbq3jWa48lREn4499xLp2iI
         6JX7eXbKOGUSyWpmICFgMWvNFTRFq6AEHP7XNeqVN9hyB/qwScF54mNPM3nCdV5yujw8
         BGSqtW5I0qNvQyBKK+n9dpRJUDbvXGqc5yT3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721344228; x=1721949028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y8/jfrbQkF4NocC2ktC4TuqIHUerHtNF+x1nkqsRqBY=;
        b=NtRQ7HvQ46VpM/U66QimM49yJsjm0DFnXaFA6boJuH3b1B07/PZITndtfmbqxMZYsT
         2NJpiNyKbARjQ8MDtqL8pn3zUh8RJRa01WbyT5kPMtNBNMcmq1ItsW9Q0CMGa3DBu2kr
         klE0ysbQKz4sbcTff/cp57kXlgEbOHlyDtceHvGBcNWGSn10tcyIfFaAhOqYhseh2I02
         6ZoZ6lWabnIz04pm+0lqHQNHBK+EWYCHeY7aXVgpbedKecSkh+KOgILOuXK/Ihm9UsYl
         3xJICvT6AJOEqogT8Z5c+4jObCETGnzQjyK5GDFkyGzsTScCFUofM39vX3gaIqrDEJok
         Us0Q==
X-Gm-Message-State: AOJu0YzqUO5yGODimF53Y8Pp3AYxSEUsQOiDgLQviJHs9TMR6CkYCS0d
	fdiSNEjHJGLf3U1b3URM3UCu2hDhvnT6oNGlMs9laJIhxobDJk/Nh96bum076qGM2VvDV13TuwQ
	=
X-Google-Smtp-Source: AGHT+IFgQq0IhCviw6+xUbYhrtxiwundXmVuFjpFIF71LIYEAyhWLRr/3xCNS3sdBLQUTkPqKxY0xw==
X-Received: by 2002:a05:620a:4614:b0:79f:11d7:8175 with SMTP id af79cd13be357-7a19392329amr255810785a.32.1721344228072;
        Thu, 18 Jul 2024 16:10:28 -0700 (PDT)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com. [209.85.160.170])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a198fbfb73sm11064185a.46.2024.07.18.16.10.27
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 16:10:27 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-447f8aa87bfso141361cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 16:10:27 -0700 (PDT)
X-Received: by 2002:ac8:4cc6:0:b0:447:e0a6:9163 with SMTP id
 d75a77b69052e-44f9ac92860mr946841cf.14.1721344226869; Thu, 18 Jul 2024
 16:10:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240718184434.6307-1-robdclark@gmail.com> <20240718184434.6307-2-robdclark@gmail.com>
In-Reply-To: <20240718184434.6307-2-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 18 Jul 2024 16:10:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VmM=Qgm8e-uTF4OMk5-qnpdgb=6fFDFt3v=WCAujUU3w@mail.gmail.com>
Message-ID: <CAD=FV=VmM=Qgm8e-uTF4OMk5-qnpdgb=6fFDFt3v=WCAujUU3w@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/panel: samsung,atna33xc20: Add compatible for ATNA45DC02
To: Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Rob Clark <robdclark@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	"open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 18, 2024 at 11:44=E2=80=AFAM Rob Clark <robdclark@gmail.com> wr=
ote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> The Samsung ATNA45DC02 panel needs the same power sequencing as the
> ATNA45AF01 and ATNA33XC20.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/panel/panel-samsung-atna33xc20.c | 1 +
>  1 file changed, 1 insertion(+)

I believe this patch should be dropped and, until there is special
logic needed for "samsung,atna45dc02" we can just rely on the fallback
compatible ("samsung,atna33xc20") matching.

-Doug

