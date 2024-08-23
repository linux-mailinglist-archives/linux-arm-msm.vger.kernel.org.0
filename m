Return-Path: <linux-arm-msm+bounces-29416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F338895D7DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 22:33:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32D511C225BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 20:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2CFA1C174A;
	Fri, 23 Aug 2024 20:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cFTZss0A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5171F1C7B65
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2024 20:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724445207; cv=none; b=kA47/DH3rKcpZPhzb1U0CovJeBQwOp68JbA9sQi96sA3+TRyL1h3jIn520lYiUH04cxMCoOqz3cfc91pr/YgDZ2u+hY6CpLhFZhLwCbFfzu4D4FVpILJDjajxWTvhygiFnmdzkWyOi05uJtEBTP9XRdVm/5aUmVyUJE/DJoC+Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724445207; c=relaxed/simple;
	bh=MsOMxkYeIW9qydJzRqD0Ihv3BRacgITErjIgiRvw2KI=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VnuA2epa2uhrbzHKr6F22AyodqdDTh4WkLraBzK27DituR/cdRLoNplakxjPWjUd/bn9Qirj00YhzZH3iULf4EwNF61cafxfQSyyyS98sBphT75J7QFN0ZlWSFm1b6pwu6RIC6/NpgDEWaaTplceKiUWlo7csiIVluvRrcirIzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cFTZss0A; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7a1e4c75488so143269585a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2024 13:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724445205; x=1725050005; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/0Yyeee2Vf8r1D/wovFCOKuxZaGFv9fKeG3mfjxEVas=;
        b=cFTZss0AaAWpfKQeI8Idfc6fqkRGpIPKMJXs8fvEZraYzcmoJoA6hTJ0ThLIGiwNNr
         F30K72MKPjoT2g6KfmMBkTAFWbtAzmEoZbdYzgxKpYK5iHCSrUZOQDov+oWhG3O3YklN
         kVVUqJCL/yQJCif6Bv1AdisX4MGrx90wQGICg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724445205; x=1725050005;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0Yyeee2Vf8r1D/wovFCOKuxZaGFv9fKeG3mfjxEVas=;
        b=fxdCG9URiNLpm6gq1kRMDXB1LVLthuVqH3mzOWRmhEOh0v4Ibpnt5auHiOkVQcht4z
         /1wCFSO2JlO8U74bfaGrwBSC8lyN6OgF305efwpBATXynDadnuYmq3rA5d+IzI4hAW5S
         2YfHGfIKT6f7FJ75soPD6EhHDnAKSEEleE3lmp+DJWaFn9SJccnMS4bhb3AQTSi76Izo
         Kind+DSOvySH1KxCAaXZNw/1ZKpxVQzxpBiP8pOuJCWYVPu+cc019YAlZlpdpT2LBV7M
         flaN39/FNTiBsg//3oksIYvR1njqJ5+Ak1gdCAR1RA6J5JIZuBDT0aPlyOIPcwOocxQZ
         X0uQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUi5z8ucJOyM/TwuLTwLK68VWu9x8tUj7xgr/6rrh7WtjZlYcJ8cCyPqFj7MiuJRgYM39qhMo7j2ZKib4L@vger.kernel.org
X-Gm-Message-State: AOJu0YxUsSIDRa+ItMA14RQQnfhubzu9DtA2nc5BMgcwS8vibsnJGICP
	zrfFJbKFPhXgBaGroqfuiA9ueSDWvbCa8f26nrI1mTocS4ZBa/yVz03A1aF+/4Kv4wOR58T6E5a
	5Xq4XtXn050X/IdX40vshCZ20imYmv+cYQFb8
X-Google-Smtp-Source: AGHT+IGW/VO5LDbH2qUnWbdRuqhhtG11KOFQeC4peX75Dv4BIQ4AXaDFfDgoU0VrJw72vzH9xwkXBWdGeZo2zOTAGgE=
X-Received: by 2002:a05:620a:461e:b0:79f:dce:76c7 with SMTP id
 af79cd13be357-7a6897c444dmr460409785a.68.1724445205109; Fri, 23 Aug 2024
 13:33:25 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 23 Aug 2024 13:33:24 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <d03d5425-bd7c-4c20-a54e-5708ffd059e0@linaro.org>
References: <20240819233628.2074654-1-swboyd@chromium.org> <d03d5425-bd7c-4c20-a54e-5708ffd059e0@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 23 Aug 2024 13:33:24 -0700
Message-ID: <CAE-0n52=kQzEx76D5AmZfui_X0jqejQ+ENz+VQunY_ovph65Hw@mail.gmail.com>
Subject: Re: [PATCH 0/2] clk: qcom: gcc-sm8550: Fix shared clk parking breakage
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	neil.armstrong@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	patches@lists.linux.dev, linux-clk@vger.kernel.org, 
	Amit Pundir <amit.pundir@linaro.org>, Taniya Das <quic_tdas@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

Quoting neil.armstrong@linaro.org (2024-08-21 08:44:00)
> Hi,
>
> On 20/08/2024 01:36, Stephen Boyd wrote:
> > Amit Pundir reported[1] that a recent commit 01a0a6cc8cfd ("clk: qcom:
> > Park shared RCGs upon registration") broke USB and audio on sm8550-hdk.
> > These two patches fix the issue by skipping the parking bit of the
> > shared RCGs for devices that can't run so slow.
> >
> > [1] https://lore.kernel.org/CAMi1Hd1KQBE4kKUdAn8E5FV+BiKzuv+8FoyWQrrTHPDoYTuhgA@mail.gmail.com/
> >
> > Stephen Boyd (2):
> >    clk: qcom: gcc-sm8550: Don't use parking clk_ops for QUPs
> >    clk: qcom: gcc-sm8550: Don't park the USB RCG at registration time
> >
> >   drivers/clk/qcom/clk-rcg.h    |  1 +
> >   drivers/clk/qcom/clk-rcg2.c   | 30 +++++++++++++++++++
> >   drivers/clk/qcom/gcc-sm8550.c | 54 +++++++++++++++++------------------
> >   3 files changed, 58 insertions(+), 27 deletions(-)
> >
> >
> > base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
>
> I'm pretty sure sm8450 & sm8650 (and probably other SoCs) could be also affected, could you check ?

Does someone have the hardware to test? It looks like sm8450 isn't using
the shared ops, but sm8650 is, likely incorrectly.

