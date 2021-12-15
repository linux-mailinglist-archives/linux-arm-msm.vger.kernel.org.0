Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E87D547617A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 20:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231972AbhLOTRu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 14:17:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239511AbhLOTRt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 14:17:49 -0500
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 532E9C06173E
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 11:17:49 -0800 (PST)
Received: by mail-qt1-x832.google.com with SMTP id o17so22944036qtk.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 11:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YShFWoZdfohuIaoHkzJfvwaOjJW0YWCrtgF0tbZxfuc=;
        b=UlCtoyzOkFrWyGOVFaJU8qsLzBhhoHooghGXITRKZE1Zq83KKPIb7c0zSx3QLeLT8L
         Y+xCxzUh1a6yaaBd3ZKqWBQN6fihrnKTkT7bhYZKbKdPrk9urj6tVs+v4zpgImJsz7a7
         gk7RQntBh0cyirDkrQeVsT/0aGZGbZHEDVAJrAs6SkRLSOrSp40EOM0zB+Hd28B52FNz
         qblXXrz6FFNXCQI5Jl/44mtLAArvcM4LRQ3XDj1+rv9YDKjnBpWUNatahXv3R8u+Uumi
         CRZ4Gj7RSyDxX8D+ydnP9DyPYCdMOiBYxPGc6TEUbmAh78HgRXO31fa8FpRejHglm8fg
         3bFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YShFWoZdfohuIaoHkzJfvwaOjJW0YWCrtgF0tbZxfuc=;
        b=nDDXI5ilFRXxIdDFMq9q9vE+rUxgh8sowtwwOxkH7fmvtgtMHjFtOd6X9YSUR36zhp
         TpyR8IontBDZ1+8wfb5c+rKR6EkHDaSTmcc8daHFliV9BpRK21NP7smKDKH8ggH8e713
         L4lvOicZAsVthjC8fbS2UzHXljm9ImSu7C/ckN0yELGwGwe8FsQS6f/CqpTBZoIR2YUL
         ys9MbjxnN5xAgpEHOkuRYSwVM5aINDhXMj7KVIit0CJs9dIgXcNpw/x+QDPs4EHDgkG9
         oLiAVW9sTDvGnSflMfP1IUPjpYc8nNqH0YUOZkt/3m/Dr9oxISjeGRUxIs1LgpYdWLIM
         Qhcg==
X-Gm-Message-State: AOAM531VwprtgfeCOoXhgJ7lxFPGQATHhitUmxfmEH9RCJGoM5RwdUN3
        MVSEHGML74XC7dyn3t5TTdnqkDSfHBmqI3T/tRGuTg==
X-Google-Smtp-Source: ABdhPJzQ6zkCPECZcOmZlwDiF42Ds+mkiAEnmTOqZu1jr5lAXLAvu/wLfGhsMecRyWc/+WsXDPDGT2QtSA8ScDqEFfo=
X-Received: by 2002:a05:622a:15c6:: with SMTP id d6mr13380932qty.439.1639595868469;
 Wed, 15 Dec 2021 11:17:48 -0800 (PST)
MIME-Version: 1.0
References: <20211215174524.1742389-1-robdclark@gmail.com> <20211215174524.1742389-2-robdclark@gmail.com>
In-Reply-To: <20211215174524.1742389-2-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 15 Dec 2021 22:17:37 +0300
Message-ID: <CAA8EJpri+3AjazR2saJaa3Uo05BhC_2gEsRXHJ5wJ81zs5AUTw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/msm/disp: Tweak display snapshot to match gpu snapshot
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Guo Zhengkui <guozhengkui@vivo.com>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Fernando Ramos <greenfoo@u92.eu>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 15 Dec 2021 at 20:49, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Add UTS_RELEASE and show timestamp the same way for consistency.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/msm_disp_snapshot.h      | 4 ++--
>  drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 9 ++++++---
>  2 files changed, 8 insertions(+), 5 deletions(-)

We should pull this out of disp/, it's no longer disp-specific.


-- 
With best wishes
Dmitry
