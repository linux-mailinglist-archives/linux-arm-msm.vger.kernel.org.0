Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1CC9455245
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 02:36:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242290AbhKRBj3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 20:39:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242289AbhKRBj2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 20:39:28 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1EE6C061570
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Nov 2021 17:36:28 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id h19-20020a9d3e53000000b0056547b797b2so8096366otg.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Nov 2021 17:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=9klc8dAWLIAubPklXVyh2fWbEFTP2hyfnLgaBXBCupk=;
        b=gm/ER4diKPKHKzcanyuOyKFEAaBC80UL4emy4g9pwIdas+tID4z4DofaLSACBAdJWJ
         6eRAFc9WkfAGEDe7dAvKWPMYK/nsGr8bKEGuynfyPQdM/1DXAxHU3WdSFGUPBq688mE8
         r8dsWUGLcqGMnGoiENXgHzTSocHtwot/CugYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=9klc8dAWLIAubPklXVyh2fWbEFTP2hyfnLgaBXBCupk=;
        b=t1hCqgYdbMvRiCzH0Cg5ZMNsDfHvvKXRXMzouNhTqDa1qB52QXIGjtCROW80MSupGi
         JNvUmdRoA1aEFY46SKzFLfKg9Cphlunx1NkKslu7vi5CHByHhlUQM2TVy9V7YhWeRMBw
         NqfToFtvWXQQhuhjWgJZgee4sgPfBNa8L1JwCTAonYmXuuXWWDQXZTK53UakjkbDcXzA
         N4v1qfFDB0w1BDN4QrawmmU5Wny+sVd8Q4ljKrXUvQ+WWabOviPnIManrvjsGWZomHPx
         gUzMR0b3xY0JMw+C4bnmkdpb7P1tgWI4iBBzSCTZN2t4RcJZSgQxzyet09fq+tiEFqr3
         VQmA==
X-Gm-Message-State: AOAM531a2kLXdyrPQC6n3i4mHQ6igI2vyd5Br72ffJmMIpnG05nzALSy
        d+ElrmNXKulSAW1YCT6tFksruhbjPkp3/xTWiz04PQ==
X-Google-Smtp-Source: ABdhPJxKd82uGdEAMk68vFffNMn/X25qk2e/DsVmbx5gTcvbt9QWX11Tks6gt8LfLbpB/OZhMEehjVPDGZs8hMou7WU=
X-Received: by 2002:a9d:2243:: with SMTP id o61mr5815934ota.126.1637199388369;
 Wed, 17 Nov 2021 17:36:28 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 17 Nov 2021 17:36:28 -0800
MIME-Version: 1.0
In-Reply-To: <20211118010453.843286-2-robdclark@gmail.com>
References: <20211118010453.843286-1-robdclark@gmail.com> <20211118010453.843286-2-robdclark@gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 17 Nov 2021 17:36:27 -0800
Message-ID: <CAE-0n52AAfNqYP5MM1CUntkM15ftskuPVRNyCbBdCbp8mFHL2Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: rt5682s: Fix crash due to out of scope stack vars
To:     Rob Clark <robdclark@gmail.com>, alsa-devel@alsa-project.org
Cc:     Derek Fang <derek.fang@realtek.com>, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Oder Chiou <oder_chiou@realtek.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rob Clark (2021-11-17 17:04:53)
> From: Rob Clark <robdclark@chromium.org>
>
> Move the declaration of temporary arrays to somewhere that won't go out
> of scope before the devm_clk_hw_register() call, lest we be at the whim
> of the compiler for whether those stack variables get overwritten.
>
> Fixes a crash seen with gcc version 11.2.1 20210728 (Red Hat 11.2.1-1)
>
> Fixes: bdd229ab26be ("ASoC: rt5682s: Add driver for ALC5682I-VS codec")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
