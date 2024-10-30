Return-Path: <linux-arm-msm+bounces-36466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A068C9B6904
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 17:20:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C0F51F21BD4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 16:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E222141B7;
	Wed, 30 Oct 2024 16:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wgzIJJBm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E259433D5
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Oct 2024 16:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730305219; cv=none; b=jlmxaA2vGp2Cvrh9C7y8pr3Ne5OWf9hGXdGsyGhEewN0+KnQYeUT1wx0zrQYTjZ0JtG9ek+Jd8j/VUgG0XHB2q7tyIQbPkhZkvrCeIdTSkPQ1iYf46PthEzqG+jujn/YqqVK/Zdj28thI8xaN8I8eWCWbEIpZ/DOROQUuzsxJwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730305219; c=relaxed/simple;
	bh=ZoeeM23AhOsJoaMIxiszSC2XcIlVdHVidjykxIDzU+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QpopAdIbsllP24S0Fh7wxe6ymXLmQM9gOSI9+LlLvWFVizpVKy72E6df9z/au6Sz52VDHqBs7UqWSW8ZFFgetgbn3i7CmrM6ch8cnrpHXyfKOu5GYjlVDBoduU8yuFeW+MP6a1UitxNWkD6k/ifygLxByUTK/X1Wa6wjtTRTdXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wgzIJJBm; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e30d821c3e0so903821276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Oct 2024 09:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730305216; x=1730910016; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZoeeM23AhOsJoaMIxiszSC2XcIlVdHVidjykxIDzU+g=;
        b=wgzIJJBmetnUTiaEpB0vGoDtoba6KdUiLsHJNufG8BHenu+SWD2JrRPU4vHJj5A2xP
         tccLoWLfpZ2iN2iU2Ba3xtdQekKhANuufNPYmie/fpKAMw925gg6mro0MMJWd+d6t6Zm
         BC3asm2oM0ZATcGplLYSvBxhMq7ClV9tXBKSQRvWsC2IMyhEWRfqHq4b9OFWJDGEyVub
         3xONaS3lffnQPnZFKvVUGxrWcunCoRnn0wylhMOb0e4ZbXk3a20bjboiG/P8Of36yk/q
         tMbqcp0vxS9UMI+dOV8INjE7bYoXOsvjf4faP3LCl3n4K6mP5lo96L31GgIptqPlPx5w
         MUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730305216; x=1730910016;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZoeeM23AhOsJoaMIxiszSC2XcIlVdHVidjykxIDzU+g=;
        b=rxzn/J8s4dTWQ2D+3YWCvelNLvSd3ebRetEZRZQqrzAN/0b8H1BEO7LVQZyq5wy7PT
         K+0LHHnUHQF/A8vnOTPQMULMOuWsgtxDuaX88j1221QjNjSqE9y1wZUhhze8Gmc55g+8
         cb67+gS0KJK8CoMZnbvkpxL70J2+tf/rDV//gV9RXOtGdtpRn6k+IiYYUPNn8A8Vw+4A
         TSc76/ZJvkDFiceK7OGzZFy/rIVt0lZpA5kDIqns74T+DXYp3WbeusGssk/oXaDC7KpU
         b5k0YWUarFnkTwJV+4SdrDJowkDLp+R8mk8QVwjrRCg9QpWMtcc2CP7EVVFqNwxqql+i
         JJuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVj3k97+x63wyQipE98D3c22/hslDAYkZBRjP/Y6NEq6ZJbCXmPgSvdaFE+H+jecL0yMeI1YYuz4YmBgZ3P@vger.kernel.org
X-Gm-Message-State: AOJu0YzazFke0lJ04zasmzeb3QSgA/qxtWY5OBPgHV/IGFZpKk4c7dR/
	7+bqlYcasTLvcSQlJRvn+L6lnfhKFHY0O2rT9z1kGxrpXd45vHYzzIhzJDVM0fWlCCRjdVSHBYr
	IRIs9RyyTsPr/9jjCb+QzMXHSiDIpDlew1mbAyg==
X-Google-Smtp-Source: AGHT+IEAL+ig1I6YxHPWKDxM+c+9tJ2nZijR/HzL7xEopbO7n014y/uWJwP5fAjn2UqJzH/+xfmkQd4UvLAFkD0MR6U=
X-Received: by 2002:a05:690c:60c1:b0:6e3:36cc:eb74 with SMTP id
 00721157ae682-6e9d8afa635mr194581497b3.32.1730305216352; Wed, 30 Oct 2024
 09:20:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030125512.2884761-1-quic_sibis@quicinc.com>
In-Reply-To: <20241030125512.2884761-1-quic_sibis@quicinc.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 30 Oct 2024 17:19:39 +0100
Message-ID: <CAPDyKFoY8CnxF7JXzkT9_WXyM-TJhW4kmTw=H8NEzch32N1_7Q@mail.gmail.com>
Subject: Re: [PATCH V5 0/6] firmware: arm_scmi: Misc Fixes
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, johan@kernel.org, 
	jassisinghbrar@gmail.com, dmitry.baryshkov@linaro.org, 
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	konradybcio@kernel.org, linux-pm@vger.kernel.org, tstrudel@google.com, 
	rafael@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Oct 2024 at 13:55, Sibi Sankar <quic_sibis@quicinc.com> wrote:
>
> The series addresses the kernel warnings reported by Johan at [1] and are
> are required to X1E cpufreq device tree changes to land.
>
> [1] - https://lore.kernel.org/lkml/ZoQjAWse2YxwyRJv@hovoldconsulting.com/
>
> Duplicate levels:
> arm-scmi arm-scmi.0.auto: Level 2976000 Power 218062 Latency 30us Ifreq 2976000 Index 10
> arm-scmi arm-scmi.0.auto: Level 3206400 Power 264356 Latency 30us Ifreq 3206400 Index 11
> arm-scmi arm-scmi.0.auto: Level 3417600 Power 314966 Latency 30us Ifreq 3417600 Index 12
> arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> arm-scmi arm-scmi.0.auto: Level 4012800 Power 528848 Latency 30us Ifreq 4012800 Index 15
>
> ^^ exist because SCP reports duplicate values for the highest sustainable
> freq for perf domains 1 and 2. These are the only freqs that appear as
> duplicates and will be fixed with a firmware update. FWIW the warnings
> that we are addressing in this series will also get fixed by a firmware
> update but they still have to land for devices already out in the wild.
>
> V4:
> * Rework debugfs node creation patch [Ulf/Dmitry]
> * Reduce report level to dev_info and tag it with FW_BUG [Johan/Dmitry]
> * Add cc stable and err logs to patch 1 commit message [Johan]

Patch4 and patch5 applied for fixes to my pmdomain tree - and by
adding a stable tag to them, thanks!

Potentially I could help to take the other patches too, to keep things
together, but in that case I need confirmation that's okay to do so.

[...]

Kind regards
Uffe

