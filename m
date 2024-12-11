Return-Path: <linux-arm-msm+bounces-41590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E019EDA85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 23:59:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC7B3188976C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 22:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0BC1EC4F0;
	Wed, 11 Dec 2024 22:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DNmy12XT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC20A1F2396
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 22:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733957936; cv=none; b=TPq+QQM0wox9cxIcbxO1xLkxXkUjloa0nBpIiIRWghFmHq4sPiSYnu4r9LYn+cbFb17zrGNCRINQmZSZhqLd8bT9shbrsRegzpxonUSP6fX3d8/VbOSX+sMATOQjJIRW9EvR+AilQJaGKhM9/gXLAtV1aP4pes1Vfjo8tTtc5jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733957936; c=relaxed/simple;
	bh=d7oul3/epjfIWJpF9pC+/pDis54zJFCmAnINjv8ddgk=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NZsV6ReYUsnmIR/avZUIOiOPmwK8+0XKL9VPT8J8mXw3kEoscjAI4jYv96V8phdivFHiOCCRJQ/9TtHp0gMz+tqTAc+gXucMIfSeCpjvjmjTsFGT36RX7tNqXmXuyIQpK2fMSkW2lz6ANeJN264ZYfGBezmbjEd97CWaaeRceq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DNmy12XT; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6d8fd060e27so59796d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 14:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733957934; x=1734562734; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d7oul3/epjfIWJpF9pC+/pDis54zJFCmAnINjv8ddgk=;
        b=DNmy12XTKkCDpbqK6KAJl/PMNWZHizJbEIAOhZrLVE1XvqWmwroY1dMPZ4RyC//lfy
         y/yL3c5q6gmnHPwF4RB2/bZn8nD50KEBhmqh9Nvk6p55eLdEs4PnHd+wTGZCRtU4nIfF
         Xs/djWhbZ4H/5kXmiC5Xuy0B/UIjEQbZClNnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733957934; x=1734562734;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7oul3/epjfIWJpF9pC+/pDis54zJFCmAnINjv8ddgk=;
        b=NgjjHFmjhpA7ezkeOtVISTaDF46jXvLSogr4Q7SMkGSoJChfsPzKVa2/PA5oGE2vyQ
         ZNkxYVvvIBlUPFEZxEKVS9Qh9cFvQjeyIp/XD5lL1nXaSsutuYN2cr0Ruh43BeZ4upe4
         gn0+mZcgzm/XWeS1mEEQcn4o8aEtepM283vzML42bCUKkbqtRVzoQwcww9ocGO1XuOKp
         BePpMMFjvpBZdW2fqCoJaCtF4pD6EON/ukbEd2zAyUvZtC+KMQZPp3XIk7ps1RLjQryC
         7NTvz4Qst6kExpi48EqTKC7467Iy5nWa0ON4mkxXdzY2SvfugLV0T7qKYXU1wJD3YaNJ
         sThg==
X-Forwarded-Encrypted: i=1; AJvYcCUBWZZbqWKGMw7trJtZIPyN5cGwNsLhu7fYBwj+7tGjQCSIDYNFsZcsVvC686iaE5QwZLO+nGoGwLFAeond@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ3BoH/FVaStmARtdXn2CjRs2Hjk8kXsRkqo5EbZxINBtti74Y
	7atO8p3ROnd86ZjH3WD/wQBHA9TI23t5ZeGWZWjf6HQiSZwywJLSfyeXKZrxbbwOoXbJ9MpRbqW
	5B6qihrHLRaNDsBvwNOXEjD8rnyP/kiN61ow0
X-Gm-Gg: ASbGncsr5zQpNRUvR2c8PS6Q8+ZHuSlJD2OD7l9HtzlRkoN6xd9EA1fP1m9U+7QS+yc
	xKAQXGs1K8LgxpOhIHqUiwKXOLyt5IYOEmyeek13Hn4Ng6D8SRkrtztn+SEAQ/aQ=
X-Google-Smtp-Source: AGHT+IGPvlar9kD/U1IZ+NJKxYLinjgrZQ9MpbRulgpuokUWHWjoaaMJU+Xn5x1nVqU9KmYDv8PLu/rJckgmgpIo2wo=
X-Received: by 2002:a05:6214:5293:b0:6d8:8cb0:b40d with SMTP id
 6a1803df08f44-6dae398c5efmr20747426d6.39.1733957933934; Wed, 11 Dec 2024
 14:58:53 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 14:58:53 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-14-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org> <20241202-fd-dp-audio-fixup-v2-14-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 14:58:53 -0800
Message-ID: <CAE-0n50Ae+HqW2ZvZ5n=zgw0ZNA+ndgUFf_vFXZs3uzj3VPQzA@mail.gmail.com>
Subject: Re: [PATCH v2 14/14] drm/msm/dp: move interrupt handling to dp_ctrl
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Paloma Arellano <quic_parellan@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Dmitry Baryshkov (2024-12-02 02:06:44)
> It makes it easier to keep all interrupts-related code in dp_ctrl
> submodule. Move all functions to dp_ctrl.c.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

