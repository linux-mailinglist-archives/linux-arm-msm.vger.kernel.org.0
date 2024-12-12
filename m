Return-Path: <linux-arm-msm+bounces-41682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F77E9EE1E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 09:52:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 075641665E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 08:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDF58209F41;
	Thu, 12 Dec 2024 08:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o2vpnqAQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C64148FED
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 08:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733993548; cv=none; b=uGopxq0OLSUPoEIafwoArvQmBBX93TJV6KN5FOOuMBx0YB7DJYhjKpB4nmZqFo4PUmouMwXNIU8ddMRCw5QSVDJ7/O0Kaf6Tpgr7IFsVQQ5IUCvPlQpd19oXBQImqbpfEmBvA4W68SJpfoQ+T3tiMV4+UKLZRwBRz6QNNSjfpnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733993548; c=relaxed/simple;
	bh=N8A1LAPfEi1fYfnhkG2YMY5LQLbZ7ppndxjdGbFuh48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JUUA17L98xi6hnnXq9/UQKPjousKVAf8F4hhP3Bmsw5pfjISCM7F9rmDFRuVojz/guds5PZOHhV+DWF/RBjVUdjiIlVl5ZJFZv8Ymk/GdK8Hb7+SfIjNAxRL9UWYxlaWbb2PBWc/W8l/7tu6opmkPChqUmEwheZ38KRymjpeplo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o2vpnqAQ; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6f006748fd1so2814467b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 00:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733993546; x=1734598346; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zBYYfU/SUdPVtHo0D4rKIxqkiR1eC0tO3k5fmat0Ujc=;
        b=o2vpnqAQXhyZSbflXvWyYVVk8M7/qFCho60/iZ3xagv+k8aij2xGTGvveY713pTPfP
         Rt0X9zKV/vNIXWBnPUfHpHm9ftRV8k/XSCneGOaI39I+had02Am2eykz7ztNMDQ68KMJ
         rjL80NtFx14Af0EqI8y4QluXt61JjRQOULacTaGHyrtvGfI+EIXsNKj+gG38zf15dy/1
         ry5AAlFKURsW7hLz5sXKMDsyVIJlKZXz8PMzTT9RaiVed7UoC5B8XrpVKXs5xap+7+7V
         h7sNiHqTHWUo89u/TSDqq3RGILIKuQUVTYRzWjI7aDL/2H9vaqfUqDpV7yUGP3I7wAxz
         zFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733993546; x=1734598346;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zBYYfU/SUdPVtHo0D4rKIxqkiR1eC0tO3k5fmat0Ujc=;
        b=bEF7YFlJGKWZCXJxDe2t4vVTL9WZf5qPbvSFS/YltijoQo99ihwQX/e+3GT9QNwjV/
         5iz6dyiSsOWc88QY3uAEJjWHkW8EPCtH/xJWeNqiM75dqPgTBjNk8SS7jyEWTv3t7+5J
         bTpdd6hGlHqxNRSlZGQOdF8DrsRYy5PH2IrThwQQz816Srqyzaz2/XsLZriyr3GZmc63
         LiZE4dutfOblCma8cu97bufx9RBMltNCqEp5oWFgU4j0msguN+RK58aASU+3DWxgYQxE
         TrRc20WfrbS009FLVexp4NIJt3EcEF5B51byEuAAIli77zUz8FWZY+jEDA9EykUwsLjQ
         51oQ==
X-Forwarded-Encrypted: i=1; AJvYcCWE9wN979L27lLJXpInkrNJ3HKOBpVrz9L5FnIkE8YwtriGaD69qcXr9xSMkwzG8C6+ezkHWIEf4rF0BNSg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz38+Q66AHabmMGw17gJbc2c3jIbu1SLzSIqY1ZLReTMU7eMzXz
	/BehOXbnehzEHPVqZHffVkqnjX+tmOm6yAGHEpcvs6LREWYaUxboKQncY0Vg4wxR8iWZfgy4wE5
	I14yiaDZucGdpNlSqR3yvgl9f4rz/qn8BJuM4Ng==
X-Gm-Gg: ASbGncvSSHnQGESAysVTpRqe5Qvsplgqn6M7cOMXD4AAelivCHFnjQMy2OLH5nYZcg6
	cp+Asyr5K/6AeKA9RMLL0kvHeAgHDMbQkZIbnfg==
X-Google-Smtp-Source: AGHT+IHkVQ1Yt+kY8VtgAgi00tlSfxYbOT7T8OOEuC4FleojTSZwOUMMM2zASe42MRgtPnns3I6Kz1HZiopK744q4ng=
X-Received: by 2002:a05:690c:4489:b0:6f0:237e:fc4f with SMTP id
 00721157ae682-6f1aa5f58c0mr24536087b3.35.1733993545838; Thu, 12 Dec 2024
 00:52:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
 <20241212-fd-dp-audio-fixup-v3-4-0b1c65e7dba3@linaro.org> <c5090fcc-d7ec-4d49-aa21-8d1aa7f6a1c7@quicinc.com>
In-Reply-To: <c5090fcc-d7ec-4d49-aa21-8d1aa7f6a1c7@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 12 Dec 2024 10:52:16 +0200
Message-ID: <CAA8EJppOjAjFVUFSEXJMbJ4aV_MvzpeTuKDkL7P+t_Mw47YECw@mail.gmail.com>
Subject: Re: [PATCH v3 04/14] drm/msm/dp: pull I/O data out of msm_dp_catalog_private()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Paloma Arellano <quic_parellan@quicinc.com>, 
	Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Dec 2024 at 04:59, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/11/2024 3:41 PM, Dmitry Baryshkov wrote:
> > Having I/O regions inside a msm_dp_catalog_private() results in extra
> > layers of one-line wrappers for accessing the data. Move I/O region base
> > and size to the globally visible struct msm_dp_catalog.
> >
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_catalog.c | 457 +++++++++++++++---------------------
> >   drivers/gpu/drm/msm/dp/dp_catalog.h |  12 +
> >   2 files changed, 197 insertions(+), 272 deletions(-)
> >
>
>
> Fundamentally, the whole point of catalog was that it needs to be the
> only place where we want to access the registers. Thats how this really
> started.
>
> This pre-dates my time with the DP driver but as I understand thats what
> it was for.
>
> Basically separating out the logical abstraction vs actual register writes .
>
> If there are hardware sequence differences within the controller reset
> OR any other register offsets which moved around, catalog should have
> been able to absorb it without that spilling over to all the layers.
>
> So for example, if we call dp_ctrl_reset() --> ctrl->catalog->reset_ctrl()
>
> Then the reset_ctrl op of the catalog should manage any controller
> version differences within the reset sequence.

The problem is that the register-level writes are usually not the best
abstraction. So, instead of designing the code around dp_catalog I'd
prefer to see actual hw / programming changes first.

>
> We do not use or have catalog ops today so it looks redundant as we just
> call the dp_catalog APIs directly but that was really the intention.
>
> Another reason which was behind this split but not applicable to current
> upstream driver is that the AUX is part of the PHY driver in upstream
> but in downstream, that remains a part of catalog and as we know the AUX
> component keeps changing with chipsets especially the settings. That was
> the reason of keeping catalog separate and the only place which should
> deal with registers and not the entire DP driver.
>
> The second point seems not applicable to this driver but first point
> still is. I do admit there is re-direction like ctrl->catalog
> instead of just writing it within dp_ctrl itself but the redirection was
> only because ctrl layers were not really meant to deal with the register
> programming. So for example, now with patch 7 of this series every
> register being written to i exposed in dp_ctrl.c and likewise for other
> files. That seems unnecessary. Because if we do end up with some
> variants which need separate registers written, then we will now have to
> end up touching every file as opposed to only touching dp_catalog.

Yes. I think that it's a bonus, not a problem. We end up touching the
files that are actually changed, so we see what is happening. Quite
frequently register changes are paired with the functionality changes.

For example (a very simple and dumb one), when designing code around
dp_catalog you ended up adding separate _p1 handlers.
Doing that from the data source point of view demands adding a stream_id param.

In the DPU driver we also have version-related conditionals in the HW
modules rather than pushing all data access to dpu_hw_catalog.c &
counterparts.
I think it's better to make DP driver reflect DPU rather than keeping
a separate wrapper for no particular reason (note, DPU has hardware
abstractions, but on a block level, not on a register level).

-- 
With best wishes
Dmitry

