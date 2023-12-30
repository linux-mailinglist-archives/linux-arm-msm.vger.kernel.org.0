Return-Path: <linux-arm-msm+bounces-6148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 704AE820919
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Dec 2023 00:26:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04C001F21CF4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Dec 2023 23:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 540D314A92;
	Sat, 30 Dec 2023 23:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tgdGXe5L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A222214A8A
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Dec 2023 23:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7816e463b8aso239403385a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Dec 2023 15:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703978805; x=1704583605; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KTwb/1u2PMknvKhR5t90x9dUO0vwpOhOGb+hJuRUYxU=;
        b=tgdGXe5Lo5A+7+lWkZD7u9mQtJvA9xJNli3s3cHKCx8bKQ/tiZfJh7Vo6YEc231RhW
         +/877wConqguF1Pl2/5Wt/LZiJ8YH7incBoNtA5hSD7gSBQYpHdx2pWZpmFET09P1quE
         sDfvIDdHp0KCqJP0Med5co5Jnvby80qsStNhJ0OGGAUfe5/sHZ/XuXW2ybLse3F/t+Re
         SifLPRmC5WbZr2l7+/Rzp8YfOIbGWNjkcxINkQiiNii7be0VtupwsJdRnxkSN+Qp7pOH
         6P8Yvl23UmDqukk0GbOreEEwNMTo/fJfuIlr1Es1ifavRCLxE3i4s/0ERsvNEgwCBnC9
         q02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703978805; x=1704583605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KTwb/1u2PMknvKhR5t90x9dUO0vwpOhOGb+hJuRUYxU=;
        b=MXJ80uprYyH8tyfZ49IfqOaZlbyTq83QHRHafEgvokvUvUsI59Qy5n56Yvkub3KgCl
         TtXI84XkB2itNjH9OrOFgwiZpbcH1I6A2Qz4bcmCQ5zULucl9nkceATDRJ1m2r5Pf4fb
         UyHbd1K4sirPDXexehij7uXdhXOMO6GOhxT3Mx9WgCeTXdDDH7FffWoDV2Vb6ftyDBvA
         JNHqBIGmj32rwopG3bUTpAsCrj6QErZsJykcRh/zhXwlTbf3+jl8qsO6b34VTqKD1VrY
         yoOZF+maKGbR5eO4YM850Oo1s98cTF4saxsOY89I4BFBb8sqetKhotlaMwkGniTsCRbH
         EvoA==
X-Gm-Message-State: AOJu0YyU55ZAIslDu7T6l5LwyamiLQ2l2EQOD0MweD2U1YIVxn8EloQO
	G/GksitBx0MI7kEeez6qlmnbtI8V/KIiJznKYmJFAUXNesfC+A==
X-Google-Smtp-Source: AGHT+IHfZmNgnYDzJsbgUA+6u2kNcOlsYvhBqdPB0W1kCemlcIXw9mDFBODf77CKWhl+4n+tmQXHWRYxg7lP99YlMdY=
X-Received: by 2002:a05:620a:8084:b0:781:2b26:f48a with SMTP id
 ef4-20020a05620a808400b007812b26f48amr17434362qkb.20.1703978805452; Sat, 30
 Dec 2023 15:26:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231229225650.912751-1-dmitry.baryshkov@linaro.org>
 <20231229225650.912751-6-dmitry.baryshkov@linaro.org> <d6447285-5485-4a89-b8e9-43625f00f960@linaro.org>
In-Reply-To: <d6447285-5485-4a89-b8e9-43625f00f960@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Dec 2023 01:26:34 +0200
Message-ID: <CAA8EJprUH_cwUow=93ASEdr8rEzcQcL8D65vJpS-8ZoTB1jPEA@mail.gmail.com>
Subject: Re: [PATCH 05/14] drm/msm/dp: fold dp_power into dp_ctrl module
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Sankeerth Billakanti <quic_sbillaka@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 30 Dec 2023 at 02:12, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 29.12.2023 23:56, Dmitry Baryshkov wrote:
> > The dp_power submodule is limited to handling the clocks only following
> > previous cleanups. Fold it into the dp_ctrl submodule, removing one
> > unnecessary level of indirection.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> [...]
>
> >
> > -     /* set dongle to D3 (power off) mode */
> > +     /* set dongle to D3 (ctrl off) mode */
> :thinking emoji:
>
> [...]
>
> > +int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
> > +             enum dp_pm_type pm_type, bool enable)
> > +{
> > +     int rc = 0;
> > +     struct dp_ctrl_private *ctrl;
> > +     struct dss_module_power *mp;
> I haven't checked out the rest of the series yet, but cleaning
> this up with rc->ret and reverse-Christmas-tree (merry late
> Christmas!) would be nice
>
> > +
> > +     ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> > +
> > +     if (pm_type != DP_CORE_PM && pm_type != DP_CTRL_PM &&
> > +                     pm_type != DP_STREAM_PM) {
> > +             DRM_ERROR("unsupported ctrl module: %s\n",
> > +                             dp_parser_pm_name(pm_type));
> > +             return -EINVAL;
> > +     }
> > +
> > +     if (enable) {
> > +             if (pm_type == DP_CORE_PM && ctrl->core_clks_on) {
> again, haven't yet looked through all the patches but this screams
> "if (enable && pm_type == DP_CORE_PM)"

I'd prefer to keep it as is, it follows the existing code and it is
also more idiomatic: we perform several checks if we were told to
enable clocks.

-- 
With best wishes
Dmitry

