Return-Path: <linux-arm-msm+bounces-6394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE47282347F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jan 2024 19:31:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D67FF1F247D9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jan 2024 18:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B7971CA81;
	Wed,  3 Jan 2024 18:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EvvCEh+o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB701CA85
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jan 2024 18:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5e7c1012a42so89120207b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jan 2024 10:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704306708; x=1704911508; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EypQhAgpKSEMykAt8XH3pIpDrlPGwlaMgIPyvp4cOig=;
        b=EvvCEh+oHP9y1/R1VkUJgY2ufo18kVUGg4W9BBMg1+YynN39weGaqB1r5EQzfyFkhA
         jKz/DZYO9mmj1HUMkA1M+/IualHMGEA9ysrbbhY8KdcKlY4rcWzRtuxqRmEC68G4zRPA
         6BtaLZin+73p3oQgcZomDYttr9rW3VJfZJFtcU3ZUZsjvVWPQMLyTeD5bdQeRn5OY87I
         y04URxFbHEIlztzZ24sp26z6Qsna895rg0e5aFXLicIWmMI6mb9dlUvPE/LWMv+QA4Nc
         mnJAAm0/X3IWhpZBbAvurR2r0OIHeqDDJTjr4D6Tk+9lUPIVnVuEjRT+JCnqbXZdpuFY
         VvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704306708; x=1704911508;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EypQhAgpKSEMykAt8XH3pIpDrlPGwlaMgIPyvp4cOig=;
        b=wXBCt8YB8bqYAIPoMMJAF8Gqxn/wuAbte4w+qzulCadJE8mYRwPWRo0uuiT7IM5drJ
         W8L8OrqssxNzJUb3H3p/0SCYZ9KivF4lzgFgkhwl6hm+C2wzzbgjOy0pG368FjF0CfKs
         cIIFCfSGEq+QtqX/0GPcclNx3fQgj3shqUJYMeP8eAToB56hXa5pF79eKWBMKS0AL9Gd
         4nCAywJtt9Tz0jZ5BtKyXCoaODc3sZb7gTcnturCYva9OypyC/MOW/AZ00hBBjLJq3qq
         77cAa0+QJYbw0wPG10SK+EFYtiBAkejweOxmmRdRmRHx0TWZ5OLscyjNCGsJJHty3rhG
         vm1g==
X-Gm-Message-State: AOJu0YzWVVjENml1BZPnIRXboi3SaGXLr7w771dT5wSw4xdYdOpLQO+E
	qBQxptGP1AbPQEMKi74iLyI1DMWXhsk32HyT1peyJlAhEio60A==
X-Google-Smtp-Source: AGHT+IEQaGZC78gwYzc0Wr0wMm3mAfxWGbAd6xhpfKYekxpolfrbYTx7PWQbn4KbdEk8ecio6aLPYFKObUXDUav2YpM=
X-Received: by 2002:a0d:d812:0:b0:5e9:4c7a:5036 with SMTP id
 a18-20020a0dd812000000b005e94c7a5036mr10125804ywe.85.1704306708080; Wed, 03
 Jan 2024 10:31:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231227-topic-rpm_vreg_cleanup-v1-1-949da0864ac5@linaro.org>
 <ae1c1cb6-00f9-41ce-afd1-d557fbf3034f@linaro.org> <8ef0364b-2649-4bef-81bf-30934afb1e38@linaro.org>
In-Reply-To: <8ef0364b-2649-4bef-81bf-30934afb1e38@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Jan 2024 20:31:37 +0200
Message-ID: <CAA8EJpr_HR9vfsjr=NeWAc34FyfHAHXLJxxVPqfD=2KGzoppDg@mail.gmail.com>
Subject: Re: [PATCH] regulator: qcom_smd: Keep one rpm handle for all vregs
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jan 2024 at 12:03, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 27.12.2023 12:48, Dmitry Baryshkov wrote:
> > On 27/12/2023 03:29, Konrad Dybcio wrote:
> >> For no apparent reason (as there's just one RPM per SoC), all vregs
> >> currently store a copy of a pointer to smd_rpm. Introduce a single,
> >> global one to save up on space in each definition.
> >>
> >> bloat-o-meter reports:
> >>
> >> Total: Before=43944, After=43924, chg -0.05%
> >>
> >> plus sizeof(ptr) on every dynamically allocated regulator :)
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >> ---
>
> [...]
>
> >>   @@ -1440,11 +1438,10 @@ static int rpm_reg_probe(struct platform_device *pdev)
> >>       const struct rpm_regulator_data *vreg_data;
> >>       struct device_node *node;
> >>       struct qcom_rpm_reg *vreg;
> >> -    struct qcom_smd_rpm *rpm;
> >>       int ret;
> >>   -    rpm = dev_get_drvdata(pdev->dev.parent);
> >> -    if (!rpm) {
> >> +    smd_vreg_rpm = dev_get_drvdata(pdev->dev.parent);
> >> +    if (!smd_vreg_rpm) {
> >
> > I thought about having a mutex around (I don't remember if secondary PMICs and/or chargers can be routed through RPM or not).
>
> A mutex for assigning this?

Yep.

>
> Konrad
> >
> > Then I went on checking other RPM and SMD-RPM drivers.
> >
> > clk-rpm: global variable, field
> > clk-smd-rpm: struct field
> > regulator_qcom-smd-rpm: struct field
> >
> > Probably it's worth using the same approach in all four drivers?
>
>


-- 
With best wishes
Dmitry

