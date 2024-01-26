Return-Path: <linux-arm-msm+bounces-8483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B48583E34E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 21:24:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 991931F26926
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 20:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D7223742;
	Fri, 26 Jan 2024 20:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="go5OrEiA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAE723745
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 20:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706300636; cv=none; b=dxO08sBW22SmofWBMVR20TsIexbfHWDvqC0eoHe0jjBIc75QzmQI0hMSC0SUaGalyrESoYK54kHALgCmGFD+q9w0yKpuSbudI0Xiv1Wip/bpNpJSv07BeJbZ8JX2Kb+Iz6YlW1c9vuFOb19e2eLYqivkasHTCxD61znx43C3v2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706300636; c=relaxed/simple;
	bh=nE5OHZdLIvj/a7Lmd2brg9FJ10IxwXyugfknK5YldI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iPtvRDw2l9zMoy9ff/a2DjU8eQUdjuXfDNQfvoQZqderDveJrcrCqoh5NO17p5UwKAXP+kZC8cwBBC2GhM9KF6Aa4ts0BT8tDTZu8hsLGXNEOeXJZi62bucF/jrQ+DZo1BVTPY/JTlp6xa8k1UNTEmCYFYhAhdl1QVJcyjI/vLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=go5OrEiA; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5ff88cbbcceso10461837b3.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 12:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706300634; x=1706905434; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZDpAa3J0tQehwA7Ry5x3tOdmo/d5D+jLymbO2mRHCxM=;
        b=go5OrEiALk1Pm1OaDOc9mLle21fYZ0OZD6OLALmCcRtdRZkZnfEIfhO73YG+pjAnyc
         PvIv2PzuYgBGT1k08QOiXZeYnk+cy+UzxhvLUKvKWydA/0H0j531edNVaZazA1AmN1D/
         x33672s1Oa2Dwy71u7dlG0DjkuyiVSLEMa+ipwvSHr5EBWKZoIgbdOaMRBDLuQuXDwUc
         btNSPUTfh0qzuDpHoiRqlW2vCEJ0UQsKXHL2S/JxIY+uqyDkR2oKhyGfjQmWALxKw99v
         xek7iP3VssSmHfsVl9APV14DNIH64rE8AAGGY+2upihFQQE7Q/U0HEIz00OQPT8I5uqh
         cWUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706300634; x=1706905434;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZDpAa3J0tQehwA7Ry5x3tOdmo/d5D+jLymbO2mRHCxM=;
        b=xEg6aqapCl6Pd7v3ZK27DlHKLRNuZiWgUA/SKHN6Zi75kuGAa8AN36dzbpEP+OaXDq
         yR7u8QPaJl6OXxF6WAWFg3U9lMp7s+oaXoPBVzF//by2rUPWC6ga0XyMla3skoSK49fU
         MI+kVzo5GhlNUmuKaLHR24H6hARzu6xvCR/7bQNN8khTCTP7B1cQ8p2iVlGuaMSMzEDe
         pKelReavWYW5pYf6L007vLefSop2hZ3+/vOH1gbUpWjONcItGGLcT6HDBYFOX0Z3qU0R
         vfFd/nT7Tv3e6kJUl7lhFBIe37V7Au5EuFfwJof9jtx46SylTaoP0i8ZU1HgeF+0u4du
         ZKzg==
X-Gm-Message-State: AOJu0YzZK2IJRDK7zaNfYmULU+eUUAJJY5NYFL1eU73br19DVaYkOAO9
	uuiseAiQSeW580scLVJlqnl2mcFidfbh924mD+xlaReuJDvBlFzWIisjlorxwpNnmaM1XHXLP7p
	1T7IjljHSECdXscbWAoj7zhkIrcB4mH+sjg2cYTALpe/AK6a/
X-Google-Smtp-Source: AGHT+IFPF1qh1U967GMR4IMG8c2YBW/cJng//YXeuLBPB86SGHhjM8CdAyJiEtMQUeyEpXkZzGmpDP4rnUUw9ZtJD9I=
X-Received: by 2002:a05:690c:3603:b0:602:ce8b:6aec with SMTP id
 ft3-20020a05690c360300b00602ce8b6aecmr735792ywb.51.1706300633869; Fri, 26 Jan
 2024 12:23:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 22:23:42 +0200
Message-ID: <CAA8EJpoNuWaJTGs7MfHCQ+OE69HT+NZ1kjEw0ZJtvhZyS778zg@mail.gmail.com>
Subject: Re: [PATCH RESEND v3 00/15] drm/msm/dp: clear power and parser
 submodules away
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 26 Jan 2024 at 20:26, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Reshuffle code in the DP driver, cleaning up clocks and DT parsing and
> dropping the dp_power and dp_parser submodules.
>
> Initially I started by looking onto stream_pixel clock handling only to
> find several wrapping layers around a single clocks. After inlining
> and/or dropping them (and thus dp_power submodule), it was more or less
> natural to continue cleaning up the dp_parser until it got removed
> completely.

I see. I have resent v3 because b4 for some reason didn't pick up R-b
tags  from v2. I didn't notice that `b4 send --resend` doesn't pick up
changes and just resends the previous version.
So I must beg your pardon for the spam. I'll push R-B tags via response emails.


-- 
With best wishes
Dmitry

