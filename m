Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B420E1C1D74
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2020 20:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730033AbgEAS6W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 May 2020 14:58:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729839AbgEAS6U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 May 2020 14:58:20 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88CBAC061A0E
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2020 11:58:20 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id j20so7997535edj.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2020 11:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anholt-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vt0QD0qGDDBVo/FGY17/QPfRi70EGhMjrVST5CXganc=;
        b=n+VOSW7MD4XNSmZihQfjum+mxK5FnIdMcEiBsOxO2YKarPrGhNRlvcg2KHGBfRAO6e
         4gbTcv566mvkBg2iFpc/NReOVomtY9GLeW4yURrBxLL94iCOMH2NFhidOSWDfOVLE8h5
         QYrYIGtF90V/JseWG8q987eBRh2ABNYDpFCvHQr5VZK4WNOxMrhCyO9RONejoHOPH296
         sHzmULyHaChfwP/e/fMlyiabp3YCA16BBXIfKWM2tDqpwkLKNwN9ZYhLwBrIsHtUfS1Y
         fXdtX4nNCU0HVUP/jeU7v5WrRblEk6xrYarJ+/+Kfdv8tLcKTkqacAqVy9gqdGwqr0YQ
         VRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vt0QD0qGDDBVo/FGY17/QPfRi70EGhMjrVST5CXganc=;
        b=DIv+dMIHBaAVNH9IXHsHsRJ10o9Od7xy7xdZrV4XvRcDL6LdwE1SRMi/3ky4i3GaSc
         tljngNVcv4mSiM4c7wpm4N3XwA/WUaQYZvAsDkxp/nP12gsHqH1/z0rGe8M992OIijxj
         TUBD15q61WTWQnqthWNnYGqnxxh472sKEagEPfRJjSI3vDxrOxz7KxVlqgv7G/SAB9Ao
         o9mmH/hWpMMsYWIXyjfV3k+UoOl030vTSAQwOgpX6TYF3bq1NrcprUaMO9ZPL4NJFhAf
         0bREVufPatoP6xMOGenm1RwCZUKFQuFuI19rMLMfs3wOYmFoHKL32hz+ObdwlmLxKvQd
         J0fQ==
X-Gm-Message-State: AGi0PuZxl5rSbOdsB0ZGvzm8OtPe8ePA/vfC4YKW5z4OxVwVyED53Jjw
        KLVfI2r+UGB4MmyQ1sbVUpaqr78Fzvy6hEfTXyNqjw==
X-Google-Smtp-Source: APiQypLXpYI05phFZgf41A4e2ccy/aLjYv3h3qo7mTf3PdPfV7hhelvJX+6ErvFxVnYeV8WkozZ6Kn83pMp9XjQxpfs=
X-Received: by 2002:a50:aa8d:: with SMTP id q13mr4726587edc.88.1588359499000;
 Fri, 01 May 2020 11:58:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200501182533.19753-1-jcrouse@codeaurora.org>
In-Reply-To: <20200501182533.19753-1-jcrouse@codeaurora.org>
From:   Eric Anholt <eric@anholt.net>
Date:   Fri, 1 May 2020 11:58:08 -0700
Message-ID: <CADaigPXLOp8+cJ6XGzUm=bmyyhMO2qCGHhgAA44Auq9NvhfFhw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Check for powered down HW in the devfreq callbacks
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, stable@vger.kernel.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 1, 2020 at 11:26 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Writing to the devfreq sysfs nodes while the GPU is powered down can
> result in a system crash (on a5xx) or a nasty GMU error (on a6xx):
>
>  $ /sys/class/devfreq/5000000.gpu# echo 500000000 > min_freq
>   [  104.841625] platform 506a000.gmu: [drm:a6xx_gmu_set_oob]
>         *ERROR* Timeout waiting for GMU OOB set GPU_DCVS: 0x0
>
> Despite the fact that we carefully try to suspend the devfreq device when
> the hardware is powered down there are lots of holes in the governors that
> don't check for the suspend state and blindly call into the devfreq
> callbacks that end up triggering hardware reads in the GPU driver.
>
> Check the power state in the gpu_busy() and gpu_set_freq() callbacks for
> a5xx and a6xx to make sure that the hardware is active before trying to
> access it.

Chatted on IRC -- while this avoids the instaboot on db820c when
setting /sys/class/devfreq/devfreq1/min_freq, I think we should be
using pm_runtime_get_if_in_use() to avoid the races while still
avoiding bringing up the GPU.
