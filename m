Return-Path: <linux-arm-msm+bounces-16771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 602AF89BAD8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 10:50:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADBC828267E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 08:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 023E62E64C;
	Mon,  8 Apr 2024 08:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AQ7B1SQF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9F73BB55
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Apr 2024 08:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712566135; cv=none; b=m52usB/KaQUQE1vGImJHUaDMusKlKsOGNzD9RP9mSKNVyOfXS0XOsCRiLhAYW9SXnTgXgmb0Yww8PI9apF59rAjgjASquIWk7B+LJkKzvnztv7CsJvUqvmssjGsxE8vuAW9Fj1yfsccYrsNHmRNqS/xGro2CLbOE2UrzM9NC89k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712566135; c=relaxed/simple;
	bh=unaSmNZPgCC0980ZqjQqMm0sE/ZlSmkie+b224+BZCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hjuBSyk7IMLQ/6Ek3ja0Wpq//aKWOAcl+EUlttlUrdBjxiX1wZ9T5YhmJQM0qBUXJ8NVrzVGiKxIbAowkIpUULyHlcHPjiGRG3T1YCAgjD6cXQ9KS0Ym+qlAEUgCSQqF2BP66qyrBk7WnxGoxkCd/zXOf//iPWk/3pu1VM3cvKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AQ7B1SQF; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dd045349d42so3790589276.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Apr 2024 01:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712566132; x=1713170932; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F7NI1a3KJOYbUdllvSAieuMW0BytOpwEyZTxcjSweC0=;
        b=AQ7B1SQFfXxIDMeTEo2rY3sUPVvsh43A7DoUMcxlISSDMClWPBMsFMERO2Kgb90zG8
         TX8V/VETKb+u2N2vHpjwIWUDe6Ek8hHOmD6FvBESBv6xRdvHTMS9q21XirKn/RVfR7Cd
         Kl5VJrFwmL2m25uHUZFkxx9xO+BOXfCWw7mq7GTQhHcRQRhmDbpOnR9aoNjEtJ682TRV
         iTVt3u7xBlBp9V9td4x4FlWYPcQc5H9cnobKWrs8k/evrsd1zt8xhnhz7urN2AfXJq9U
         86Ul0Npn0gEoGeHptO9xopoiKEgAQBcKZXY1f7Yyqmi4OAFL4AFH7O9CCbUwE6ofau+e
         eFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712566132; x=1713170932;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F7NI1a3KJOYbUdllvSAieuMW0BytOpwEyZTxcjSweC0=;
        b=lXKVQmFu6j9zPaDpjRhLVNgls/8zx3nzIkR/lJjWewnKzF83ig1rkLm0WqxwH1A9vj
         dEO83dou88ntBEfeWZLrqiLO7Zm2COXRYw0oIlFHrNjV/HU3z/fRqWVbrC25r52RfQm0
         ppQRwfncOjVVHu+Q/hlbNjKOO37fufD7wN/RDEANuOVagvIykQDC5r+RkovTaHjihDPa
         bC+D8iPNc5oah+MMc5H930SWFHQ9mMYIXmQhRsZQB+oyONIWk/ATcniBKasMIixWllf7
         f2fVSUMNZ7d2nAQ/CJkcMEWIHqKsqpU5cN1c7P1hSQPefTeOdKNG0O2QR2ojHg0ZYZXP
         rlFA==
X-Forwarded-Encrypted: i=1; AJvYcCXi0jqyMl6/g8OcRZG5gDGx3tbIRUVuknwg7zhiGegLlwgN4PMGNxAV9uOi2ufHZVX7Tq7YVJXi2t0uMZclq9Xh0m8kq5qHZL92J4SePA==
X-Gm-Message-State: AOJu0YygIS6RYmq1qrYemEChdg1NR4GhdxSeC8OXMgKAgNuLu+DN3H2+
	p43asQ/2vhG12k3pn7iAYOtMlNNki1Vp/mjeidHs4004m7EbHkIK0pjp2nyT5Eng6x00kD0Z358
	FwxYE0VKETOzMhGR4GhNM2NoKQwj8JIVF/kXHfWBKpAU1iDWJ
X-Google-Smtp-Source: AGHT+IEQeHmk38rLUm1S6f8awpQg2EktVcFZ4Lukaa8kZida8w/IUtZcOLqQzNPzXn2oIiDTfj5wNOxJrG7cDph37d8=
X-Received: by 2002:a05:6902:2b04:b0:dca:c369:fac2 with SMTP id
 fi4-20020a0569022b0400b00dcac369fac2mr6609762ybb.3.1712566132588; Mon, 08 Apr
 2024 01:48:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240405092907.2334007-1-jani.nikula@intel.com>
 <eondf5x3wz3nccxpnqxtb7gtvf3k5u3bz4qwhn3gbcy5pj73ku@fue4tej3xgnq> <87frvwb7i5.fsf@intel.com>
In-Reply-To: <87frvwb7i5.fsf@intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 8 Apr 2024 11:48:41 +0300
Message-ID: <CAA8EJpr9cEv6Yi1q+8u-+mU2V3yp=C9rtpnCu+pyouozukYQ=g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: convert all pixel format logging to use %p4cc
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Aishwarya TCV <aishwarya.tcv@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Apr 2024 at 11:09, Jani Nikula <jani.nikula@intel.com> wrote:
>
> On Fri, 05 Apr 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > On Fri, Apr 05, 2024 at 12:29:07PM +0300, Jani Nikula wrote:
> >> Logging u32 pixel formats using %4.4s format string with a pointer to
> >> the u32 is somewhat questionable, as well as dependent on byte
> >> order. There's a kernel extension format specifier %p4cc to format 4cc
> >> codes. Use it across the board in msm for pixel format logging.
> >>
> >> This should also fix the reported build warning:
> >>
> >>   include/drm/drm_print.h:536:35: warning: '%4.4s' directive argument is
> >>   null [-Wformat-overflow=]
> >>
> >> Reported-by: Aishwarya TCV <aishwarya.tcv@arm.com>
> >> Closes: https://lore.kernel.org/r/2ac758ce-a196-4e89-a397-488ba31014c4@arm.com
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >>
> >> ---
> >>
> >> Tip: 'git show --color-words -w' might be the easiest way to review.
> >> ---
> >>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  8 +++----
> >>  .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  2 +-
> >>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   |  4 ++--
> >>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 24 +++++++++----------
> >>  drivers/gpu/drm/msm/msm_fb.c                  | 10 ++++----
> >>  5 files changed, 24 insertions(+), 24 deletions(-)
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Thanks! Do you take this via the msm tree?

Yes, I will


-- 
With best wishes
Dmitry

