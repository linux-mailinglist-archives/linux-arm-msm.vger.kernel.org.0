Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54A766DCBD0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Apr 2023 21:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbjDJTys (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Apr 2023 15:54:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbjDJTyr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Apr 2023 15:54:47 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAA8EE73
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Apr 2023 12:54:46 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-54c12009c30so225591847b3.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Apr 2023 12:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681156486;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hVSuxMbAqEPyVi9yC8m6tq1S+nROIsHX2hkvUDvRI/o=;
        b=YOBTOqGxNCmNhgEmYv0FNp0qxvtNLFWoU6pCg8staBFs6JHY3hDi7xVDJPoLCc3H1C
         EprPsB5Pt8sGVU1O+P7VbUX/VGdSszLu4mheYIHdzJCot9D1XI6gtEpMBsuNUfFcK+YF
         jzUv+cp5t0W60N1uC28sAV4Ek5bCr7nk0ZhgZkRAfY0edgUb8RKJVfh1sCe3Rf3PjZQp
         4fiAPJX8c5yBAJbuXSjy8GgkMXam0KpQRXxPu+vXu3p3/jZhhtBR7nKRJKdgxSsvWit9
         yNJyGfcFGeyKXFfJjQF54Yhs0VuRYHNrG2UCMm7ZRNFVhUXFkQfOmQHjAZlqfdkCs5/V
         px8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681156486;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hVSuxMbAqEPyVi9yC8m6tq1S+nROIsHX2hkvUDvRI/o=;
        b=Ffbodj5bS4sQ2R+amffHCnK2y5szSJKhhkWGZVs74LPioz17AoF/dsg/bf8IyRzt5a
         Q5t6L5UY5jlcNsMVi1rdPJFiWV8AEn2DOEH7VXTS/6cMtbxvNv2LLOT5PljxCVxuvUUg
         730nSnyRBZXvzT+vbwZYo9U2Yn3S0DEUhDvI6yAJ4X5Zadm79RHPZht3rZiibT+ZVjhE
         aW+2b39FqwBLJ35kAybB2/40eQZaBTDMH0lzXQTYNT4GNRVBE0x4/CzUzOhfFm+asHcJ
         HVJw95B3SdEuudQqAer5y0tzJdXTbMh8ryFeVlt14QfxT/4HYKOx5QrUNL40Ihx4DKgO
         Et/A==
X-Gm-Message-State: AAQBX9f9GysS/0UCoM5unRFGygy37wTZXGWA0NOBHfbadvetFCtvY+2u
        hTR2xq1q4O68DkAtaQEpOFfnQsOKQOBW+7sq7CMT/nAUd9rIypqN
X-Google-Smtp-Source: AKy350ZgRZcZYpWJQUeIosylHkgPa4AxB8416V8GRr7Kq8Bb3lqiDtKZkIPHZeIbY0SdqCZNDCk2b/r4BVo2IMy4MwM=
X-Received: by 2002:a81:ae51:0:b0:54c:1ab:6aaf with SMTP id
 g17-20020a81ae51000000b0054c01ab6aafmr6290994ywk.5.1681156485968; Mon, 10 Apr
 2023 12:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230409011329.2365570-1-dmitry.baryshkov@linaro.org> <CAE-0n51mkvb0nmF19NTXeLegzJJU=53ywUOqEP0skMtU3Oh3xA@mail.gmail.com>
In-Reply-To: <CAE-0n51mkvb0nmF19NTXeLegzJJU=53ywUOqEP0skMtU3Oh3xA@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 10 Apr 2023 22:54:35 +0300
Message-ID: <CAA8EJpqvuOTd-_aLDxoRnBx1rFg2scwGEH=W76G0aEUEX9uOgA@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/msm/a5xx: really check for A510 in a5xx_gpu_init
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Adam Skladowski <a39.skl@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 10 Apr 2023 at 22:28, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2023-04-08 18:13:29)
> > The commit 010c8bbad2cb ("drm: msm: adreno: Disable preemption on Adreno
> > 510") added special handling for a510 (this SKU doesn't seem to support
> > preemption, so the driver should clamp nr_rings to 1). However the
> > gpu->revn is not yet set (it is set later, in adreno_gpu_init()) and
> > thus the condition is always false. Check config->rev instead.
> >
> > Fixes: 010c8bbad2cb ("drm: msm: adreno: Disable preemption on Adreno 510")
> > Reported-by: Adam Skladowski <a39.skl@gmail.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> Maybe as a followup you can put a WARN_ON_ONCE() inside a new function
> that gets gpu->revn and warns if the value is 0?

Sounds like a good idea.

-- 
With best wishes
Dmitry
