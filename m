Return-Path: <linux-arm-msm+bounces-16455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 345CF89936D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 04:55:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAE11285DCE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 02:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42FA7171BB;
	Fri,  5 Apr 2024 02:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="btt669Pb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B154168C7
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Apr 2024 02:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712285703; cv=none; b=JiEQgdhAItbZSjxr2tXds4iotC+GdGt5E5WQTc1H6TYYelNJg6XV5ehL9UBGCzXdCkrNfdRj5dutB4ysGwf1OJwkFgv8NW/mDNVpdd5/Tw5NM94eOm2djhkDKVsLD5ph5pbexCWzH+NMDm03yBl9z0K3DPFMbHkh3ZFqetj4W28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712285703; c=relaxed/simple;
	bh=YdWgYZZy6+ImQbZGCSH7do3YA/hmyop0f165eRYq+Cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L3qpETfUJ5+8zE4XLq3a4cJJk4y/u2k2xGEgQ+Fpi2YnJzw6uSzmq0rqLs9YXoI6CqpYSrjqU0TiT1WYBy6IKEKiI0hPjM+4b4E8gFE4BGTQRLO5w5AGX3Z9/Q1BTwzalYgRPZhB74m3kX8xGXlkFPjCqODG7gMNfpnnpRdefCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=btt669Pb; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dcc6fc978ddso1432497276.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Apr 2024 19:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712285700; x=1712890500; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EfDPM/jBlrvHW8pL/mwrjjQGf0cytLyBW2ZbeZaxa8w=;
        b=btt669Pb8VLcPK1DnKNJJ/+DQD79ZSQs+HDS4IoNHnJMNCt8X5fT0SFJindBqQu71S
         wzrSLhlYZP/Onm4G8PEmPzRGZ0XZIxgXho02IHI6t9IffnR/BsQVt/KHiSVCjpEMoW+Y
         VQvOyiHWevAq4j5K5sOvBJWI7kGey/Yvfu6LAklMfF7z+8RXOoRlxDghi9RW8GQw4KLS
         ZVlIoLOI9yYhho0Prb9+SDY9GuJbSTZ0V64B8fupMS/opHTSjgVjFhw4tVqrDkmaTPQZ
         Tu+OblJrjgsxRQXuE1Ha7XysbFaUHhFUkeypqW79X0VhuwbTj0MK0262NB5uOfjLplO5
         yjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712285700; x=1712890500;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EfDPM/jBlrvHW8pL/mwrjjQGf0cytLyBW2ZbeZaxa8w=;
        b=e9bKQFwvdIuE6aBLNqxtk9iRolrO3Rj8VU1aIQ0e7MIGBYLYZm5ZsXuv3I8fYQJXXw
         WT1MPB/fVsVWhOJPprtH40swGLuEJ+6zOvSUI4k+9uSAiZIjK0sJ7ob3bIAFO258LslX
         Ii6saf4Se05Jos0hkodF4Gn+lNe4J5s1ztxqUHjq6t6u9kveZMiSy7fxnH7LskMN4DV2
         OAozp2fCC4UA6YGVWF8Z41n/0AljdTSgCLZNoMFDdC9tIHdl1oGTg4aCMwN9yhz5Odt6
         0W/C28+IMSG6qmIX0osZDAjWvtj9rcTfeyM/3UhanG95vpcU9C0Hf783iy1FgGPCMKnC
         HaWA==
X-Forwarded-Encrypted: i=1; AJvYcCVFzXAqW/EBfaFzsa23KP4LCuuYXqXIYiPg34SQpmgXcldTq0pZih50w0Zanh1bow0zGL8X2utATpZNY0TThohBv9+rY8IO/J8/p/soJg==
X-Gm-Message-State: AOJu0YxoFX0eFjIihrLGu06Y2ChaiVoHogXsomegr5bQQAiohnEC6+Lt
	PKOYQgjOMa6E3zjcls8Zj1ZUGmHDEsl7Qi8LMUiS+SkZyuy5JTwE8vb/3zB7BKQ6gfiMqWaIK8i
	xybYA8qh2Jc/uP3aUzfhzP/+notmwtvJy9XDTZg==
X-Google-Smtp-Source: AGHT+IFivS2hB8z2W9hwonWTCxmRcOXhWI/RFcC0uZQ37FAI9e0SKdalGASHEiDclHq2P1ZBRA6kcdGTvgLJPN2UQoc=
X-Received: by 2002:a25:dc92:0:b0:dcc:6894:4ac0 with SMTP id
 y140-20020a25dc92000000b00dcc68944ac0mr207083ybe.20.1712285700487; Thu, 04
 Apr 2024 19:55:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240404234345.1446300-1-swboyd@chromium.org>
In-Reply-To: <20240404234345.1446300-1-swboyd@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 5 Apr 2024 05:54:49 +0300
Message-ID: <CAA8EJprZ8Ehx+M7vy1pH8OT6Of2v8-trecCJZhF5wxBRSGQoXw@mail.gmail.com>
Subject: Re: [PATCH] phy: qcom: qmp-combo: Fix VCO div offset on v3
To: Stephen Boyd <swboyd@chromium.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	linux-phy@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	freedreno@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Apr 2024 at 02:43, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Commit ec17373aebd0 ("phy: qcom: qmp-combo: extract common function to
> setup clocks") changed the offset that is used to write to
> DP_PHY_VCO_DIV from QSERDES_V3_DP_PHY_VCO_DIV to
> QSERDES_V4_DP_PHY_VCO_DIV. Unfortunately, this offset is different
> between v3 and v4 phys:
>
>  #define QSERDES_V3_DP_PHY_VCO_DIV                 0x064
>  #define QSERDES_V4_DP_PHY_VCO_DIV                 0x070
>
> meaning that we write the wrong register on v3 phys now. Add another
> generic register to 'regs' and use it here instead of a version specific
> define to fix this.
>
> This was discovered after Abhinav looked over register dumps with me
> from sc7180 Trogdor devices that started failing to light up the
> external display with v6.6 based kernels. It turns out that some
> monitors are very specific about their link clk frequency and if the
> default power on reset value is still there the monitor will show a
> blank screen or a garbled display. Other monitors are perfectly happy to
> get a bad clock signal.
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: ec17373aebd0 ("phy: qcom: qmp-combo: extract common function to setup clocks")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

