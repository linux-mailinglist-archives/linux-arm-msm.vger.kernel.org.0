Return-Path: <linux-arm-msm+bounces-15318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F371A88D2FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 01:02:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B6BD1F2E04B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 00:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C435A20EE;
	Wed, 27 Mar 2024 00:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ET6t/O7m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC43A22F00
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 00:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711497732; cv=none; b=ddTh2Woe9PsKSq03nWu5m3O2IfCl8TaafpDtNjh1x/Oq1sA3SMV7JOCWhMqxSklhHyYxELj4P2E/vz8geKpV4JnW5A87//5izskHE5rSL3eKVg+wWmUGkifPjmTqbE8h5veGzd1gp9x7eyFqIysjh02DkSGxlMhojVJIMBsikJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711497732; c=relaxed/simple;
	bh=b3qAeVJSMtoMjBpYjddKvJfFtb78liB7dwpMEWwnVvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sS/Uv2uMnj1T2SNqSeh7yY2EZYDtiIvCjqQVPtTUOAz9vzc1AXSWmdV+c1vvG7NaqleSeny4BUM/v6eQQQ3NxxO4KNoBpez27jLitjNx8zhsuMyOJErEu9fDfkFMP8URC3SchExDdIp/Fau1HCfHHhmFdKMzh+GVkXS4/TWNXrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ET6t/O7m; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dc74435c428so5995951276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 17:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711497730; x=1712102530; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tS0zc7MW0kmEmnpstJm/aVt2IhnEYkSbjvjwNRNCsKc=;
        b=ET6t/O7m48hreWKLOAXDWVWI/SndJTsnlljlFSuzJQ981keKZWdszMPEduEQHB0xSj
         TsWsoVj8UQv0aBxOhb5gX5bV7CFo8O7BHaxhc4VJ5attv8CALtuIzb7e4U8Pxwr/Bscz
         tbnEuWcRxOENIdoq1RMqG8svLuxe/kA++7NuzyTx9jEY9pdw2RLDnm0eyceGYz+HJZL9
         GZarfB14/lCsoCr/ixcEpeDYLKxubCVbrEN3KA565AuXODCIyPCz90Xvf5dmgCZr8vYu
         9kjjaBv4PyPoZ8w6dLuYIHcsbtAUSIH+nLXsrImTrF6mWS26INRTmWkRsjcyXD23Md9k
         o/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711497730; x=1712102530;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tS0zc7MW0kmEmnpstJm/aVt2IhnEYkSbjvjwNRNCsKc=;
        b=ltGtVj3gZn4quDJcvGyt/OEyZcbpgfBBohovFjhMNl7815Vl236oUZ0dP9IaNaqc99
         X1L8O81QKd7EaX/ovTm4O5CLdhnfoR6KI67+tHNpBICf8Uwm1x7F2TEA5haslMXg4zTe
         AxfnHFFcXiW3jp57r16dRzOZakulOzRVNDOfqSjow5Ob/jIu/eyZAhyprkaVnb+HR8mo
         AmvwoTFVCpe2wU6U7DG/Rg4Gz1PEdzOsal2mAk1UcDoCgO+4uXBlcOpM4Jd/pGbExCBD
         i1Q1HyEahQpVMN5PP6Z/a4DJdTfYEmUceUhh4V0Befy9YiyMW6/13b3Unb4zlT5Yiewt
         o5ew==
X-Forwarded-Encrypted: i=1; AJvYcCXcB8jodM0ETIvOT1gBuSGVJk5XPSR3Ud3WKgbSmlJ+MVDX9w1bAYaBlXR1kiWJ8rA9cLneSRyB2DPy1kFZGvDAeSKaz1y4yM1SF8Uxng==
X-Gm-Message-State: AOJu0YyVpXb3rgOymFsY14bGlYdusmRuja/Y86/UHOTO+frY9Tu+nmGL
	CHGnd1yaipoYzxKwY/VpgFnw1xs8QwOtrcIU8DYUe97bdqJdBLcmWUlkF002/me3v5jBYjouQ2r
	uevd10U5UbAeEOeu/adFZJZWuGWVKuKqHAy9vhw==
X-Google-Smtp-Source: AGHT+IE0CLdgIxaupn4P97/flUIXcr4ydXAa7ow+nC1nF997KzOScE1dzX7ClgNkAVGwtfkCHk7mRqplM/Ne8uj/fUw=
X-Received: by 2002:a05:6902:529:b0:dda:aace:9665 with SMTP id
 y9-20020a056902052900b00ddaaace9665mr8653289ybs.60.1711497729965; Tue, 26 Mar
 2024 17:02:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
 <20240323-fd-xml-shipped-v4-9-cca5e8457b9e@linaro.org> <510de518-da75-f0c4-479d-c5f95c7c72b6@quicinc.com>
 <CAA8EJpry2dHyBF4wyXeFAyLu+9_tYg3xyP6eAM7RzJzOiOqypA@mail.gmail.com> <464ff2ec-b023-4485-0565-ccc63f951088@quicinc.com>
In-Reply-To: <464ff2ec-b023-4485-0565-ccc63f951088@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 27 Mar 2024 02:01:58 +0200
Message-ID: <CAA8EJpoqU5-m6LVaQFLB-8k8V9sAQti9wA7oXjHCW7A4u5TDmQ@mail.gmail.com>
Subject: Re: [PATCH v4 09/16] drm/msm: import gen_header.py script from Mesa
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-kbuild@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Mar 2024 at 00:34, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/26/2024 3:25 PM, Dmitry Baryshkov wrote:
> > On Wed, 27 Mar 2024 at 00:19, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 3/22/2024 3:57 PM, Dmitry Baryshkov wrote:
> >>> Import the gen_headers.py script from Mesa, commit FIXME. This script
> >>> will be used to generate MSM register files on the fly during
> >>> compilation.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>    drivers/gpu/drm/msm/registers/gen_header.py | 957 ++++++++++++++++++++++++++++
> >>>    1 file changed, 957 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
> >>> new file mode 100644
> >>> index 000000000000..ae39b7e6cde8
> >>> --- /dev/null
> >>> +++ b/drivers/gpu/drm/msm/registers/gen_header.py
> >>> @@ -0,0 +1,957 @@
> >>> +#!/usr/bin/python3
> >>> +
> >>
> >> We need a licence and copyright here.
> >
> > Yes, this is going to be fixed in the next revision. Mesa already got
> > the proper SPDX header here.
> >
> >>
> >> Also is something like a "based on" applicable here?
> >>
> >> <snip>
> >>
> >>> +import xml.parsers.expat
> >>> +import sys
> >>> +import os
> >>> +import collections
> >>> +import argparse
> >>> +import time
> >>> +import datetime
> >>> +
> >>> +class Error(Exception):
> >>> +This file was generated by the rules-ng-ng gen_header.py tool in this git repository:
> >>> +http://gitlab.freedesktop.org/mesa/mesa/
> >>> +git clone https://gitlab.freedesktop.org/mesa/mesa.git
> >>> +
> >>> +The rules-ng-ng source files this header was generated from are:
> >>
> >> Is this still applicable ?
> >>
> >> Now gen_header.py is moved to kernel.
> >>
> >
> > Copied, not moved. So Mesa remains the primary source for Adreno
> > headers and gen_header.py
> >
>
> But all future development and code review on gen_header.py will be done
> in kernel itself OR periodically we will sync it up with mesa?

We'd sync from kernel.


-- 
With best wishes
Dmitry

