Return-Path: <linux-arm-msm+bounces-30298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C391C966890
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 19:59:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C715281113
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 17:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D1BC1BBBF3;
	Fri, 30 Aug 2024 17:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SIMdyvhG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CF61B6544
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 17:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725040786; cv=none; b=PTjP3aur6gnkqnPDAFgWZ/rGK1UUkChaTZirU5kBYxBNdfvsskHnDaAv+a996RVt2MftT/XaU/I3RQf4+7zTFF3nHKSGwi2mUW7KhvRk4mz43WNu1R5LlGq/4ipsq6Wcg8z/gZZUG+1d4Z9A7qKnoZl96Wks5/+wEm8bsKRqhgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725040786; c=relaxed/simple;
	bh=bj/8ePnd9N5jkwmNNZHSUu+WS6alCNx2/c1EgzNdu9M=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JviCuFjvT91XHlSSqK4RIc/IbAOsocyCWSbEyhKe3sN1DInlnLUCqcWjGqwQixUGAq38EOtqfaOcDcxtoPC5BqqhAkMiZoDqkrxZJSwr1ZUMOJhnuYowd194jxayOClbZg6DuGt7h5kkknInL+4Lj0DEcSScL5HpDBAiaFEjH2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SIMdyvhG; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7a809736a2cso118923885a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 10:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725040783; x=1725645583; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jhz1rRhno8njq5zktzlz7/IAi0Jmdsp69Iep1staOok=;
        b=SIMdyvhGa2tNknrfuAlGbuTiBQCLg8LVKPbuBVhKUij06WbtZfJfsPAhtEvGZdqdZ6
         +LQAC8Fho0oUKZfjrFKOeIMMp30WwQgzEIx0c4UVBjiAriusiApcWM+nZ4aoGokvqzhE
         roh2cl5uwpZsy8vx0SeLMv5ab8V5FpaMat64k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725040783; x=1725645583;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jhz1rRhno8njq5zktzlz7/IAi0Jmdsp69Iep1staOok=;
        b=cQLw270oYTKOqRifN8ULtAgGLpdBLRCnkiOIYMv6y/JB8C4Ssv5IgC0eWst6wN/0zb
         JlL5gU+BcFqua9/3lnMmGAMxcLNkqkIbI5Qw9LmZzL+FXU9eXZqm2krie6koOXIbo/2c
         TV7H3FK2lnLx2PR5uCpvPHQzKbu2YX0csswX8LKD8I6aQx4aUsHoO8Ut2vBHe9pQtafV
         ibEaqtrMwbkQ3Onff/VmJXejZRXMElUdA0/S7lZP0cxVXjvCUAAegqhPB/sWtpbNM/g7
         RPs+rIDncbXTplaVoOgb/GdrHflhAqZjQjBc47mQ5bLpoSmiC/YzxPR+nY9C6ItwJCAP
         bGAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkEpPS72e0DjrkJbjoz5rjZsbSIOf7TvNgZFcJ5oMetwl5F76EB8DGXRKhkaF95jgSkh710oBWMTeQCkQZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwkKwLXG308qf0zq4WP3b25trHfSPxz7fQ0gznrAFoupC5PhD7H
	KbhYzHn65Ok5tYONap383o/TFw5b8CLWHPWYhv7/HNzIPNGn4It54sVxM9EInqYwt+KR6afX4Au
	kR7DsjJMiDJfqYXdlASMV4XUJq0bu5ej8XeN4
X-Google-Smtp-Source: AGHT+IHE9gJOVOJVUWUOzVHbgABXqnqZXNh9tS/AWBDgyXu5yk/NgBnqXpZ3pSyYOAZ/GdUVzRGNh7r9+6YhsM3pYS8=
X-Received: by 2002:a05:620a:3909:b0:7a3:6dd9:efa6 with SMTP id
 af79cd13be357-7a8041c1bbemr727023785a.33.1725040782659; Fri, 30 Aug 2024
 10:59:42 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Aug 2024 10:59:41 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1edc1fdb-ccf9-4dec-9669-d8c33511c7b0@kernel.org>
References: <20240819233628.2074654-1-swboyd@chromium.org> <20240819233628.2074654-3-swboyd@chromium.org>
 <CAE-0n52rYVs81jtnFHyfc+K4wECvyCKmnHu2w9JhPNqvMYEeOA@mail.gmail.com> <1edc1fdb-ccf9-4dec-9669-d8c33511c7b0@kernel.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 30 Aug 2024 10:59:41 -0700
Message-ID: <CAE-0n53p3=-dJLRXkkReUXWEy=yNUtLvgs2R6tMHtZmtYZSxXw@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: qcom: gcc-sm8550: Don't park the USB RCG at
 registration time
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	patches@lists.linux.dev, linux-clk@vger.kernel.org, 
	Taniya Das <quic_tdas@quicinc.com>, Amit Pundir <amit.pundir@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Konrad Dybcio (2024-08-30 05:24:20)
> On 27.08.2024 8:12 PM, Stephen Boyd wrote:
> > Quoting Stephen Boyd (2024-08-19 16:36:27)
> >> Amit Pundir reports that audio and USB-C host mode stops working if the
> >> gcc_usb30_prim_master_clk_src clk is registered and
> >> clk_rcg2_shared_init() parks it on XO. Skip parking this clk at
> >> registration time to fix those issues.
> >>
> >> Partially revert commit 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon
> >> registration") by skipping the parking bit for this clk, but keep the
> >> part where we cache the config register. That's still necessary to
> >> figure out the true parent of the clk at registration time.
> >>
> >> Fixes: 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon registration")
> >> Fixes: 929c75d57566 ("clk: qcom: gcc-sm8550: Mark RCGs shared where applicable")
> >> Cc: Konrad Dybcio <konradybcio@kernel.org>
> >> Cc: Bjorn Andersson <andersson@kernel.org>
> >> Cc: Taniya Das <quic_tdas@quicinc.com>
> >> Reported-by: Amit Pundir <amit.pundir@linaro.org>
> >> Closes: https://lore.kernel.org/CAMi1Hd1KQBE4kKUdAn8E5FV+BiKzuv+8FoyWQrrTHPDoYTuhgA@mail.gmail.com
> >> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> >> ---
> >>  drivers/clk/qcom/clk-rcg.h    |  1 +
> >>  drivers/clk/qcom/clk-rcg2.c   | 30 ++++++++++++++++++++++++++++++
> >>  drivers/clk/qcom/gcc-sm8550.c |  2 +-
> >>  3 files changed, 32 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
> >> index d7414361e432..8e0f3372dc7a 100644
> >> --- a/drivers/clk/qcom/clk-rcg.h
> >> +++ b/drivers/clk/qcom/clk-rcg.h
> >> @@ -198,6 +198,7 @@ extern const struct clk_ops clk_byte2_ops;
> >>  extern const struct clk_ops clk_pixel_ops;
> >>  extern const struct clk_ops clk_gfx3d_ops;
> >>  extern const struct clk_ops clk_rcg2_shared_ops;
> >> +extern const struct clk_ops clk_rcg2_shared_no_init_park_ops;
> >
> > I'm considering inverting these two rcg2_shared clk_ops so that only a
> > few clks are parked at clk registration time, to minimize the impact of
> > commit 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon registration").
> > We're up to three or four band-aids, that we can probably wait on
> > applying if we make all the shared RCGs determine the correct parent at
> > registration time but skip the parking, except for the display clks on
> > sc7180 where that exposes another problem with shared parents getting
> > turned off during probe. It's possible that other SoCs will want to park
> > their display clks as well to avoid that secondary problem, but it can
> > be an opt-in case instead of a change to all shared RCGs.
>
> Are all cases that need the parking obvious like it was the case on 7180,
> i.e. some downstream branch is stuck and there's complaining in dmesg?
>

I'm under the impression that we need to park the clk when it is shared
by a remoteproc/firmware or is associated with a GDSC. It seems that on
older generations of hardware the GDSC would get unstuck eventually, but
newer generations stay broken and cause all sorts of havoc.

Note that in my statement earlier in this thread I'm talking about
parking the clk at registration time. That's done to avoid a problem
where a shared RCG turns off their parent PLL and another shared RCG is
also using that PLL but hasn't parked yet. The solution was to park at
registration time to fix that. It's mostly a workaround for the fact
that the clk framework doesn't have a good way to track dependencies for
all the child clks that are enable at registration time which want to
keep the parent PLL enabled. The problem is that it breaks things like
USB that has strict frequency requirements for the link.

