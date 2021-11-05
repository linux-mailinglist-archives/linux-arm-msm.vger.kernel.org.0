Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 518404469A0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Nov 2021 21:26:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233490AbhKEU2y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Nov 2021 16:28:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbhKEU2y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Nov 2021 16:28:54 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01F54C061714
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Nov 2021 13:26:14 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id x9so10660725ilu.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Nov 2021 13:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Uw0GAODwRueFvBOQE2OGWsggM53Zcuqt3yCcWbHWgkA=;
        b=ZDCN/m0tmqnKaMhe26FXs3xZ5Si8fvJfzleOAKObY1a/TB05o9H4RU9PduYZUA8Ri/
         bRLZ77CghW64RM1dj3p2bmSYjZU4v6wqLhkQcNTMlCTsLe5+9QXsX3dRNmrdyjFIUm27
         ngqeVF/UcylsMcCudABfAf4UBFkDA06ibJIaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uw0GAODwRueFvBOQE2OGWsggM53Zcuqt3yCcWbHWgkA=;
        b=IgHSxnQqUJ+9JrMVBm59CxoNiqtAj/jyXQZm7bxRznurlJZZXmmT5cxAO78mvrBFLe
         EY+egG3gcBEMeLCVPq2XIVjNqogk97UlRcFO9AGfIFlqErzGdoDnZwNFt1zucsDpXnDm
         gW/J/tHzsRkCAEIbBC8OyaiqxWS3uYZXReuKxvFqFeH7rgmlk+9Gs9/httY7Hz6cOkmo
         RYXOGJV+WgyjkysVZszSMHQzOqZfIDb2Y81knFraW3ZzX9PMU2sbGgIBL93q9gELgU7U
         rLHfp/jD+RnWhf3k+ZqqdAPvhVvJEvCgXvvPJoxR/7pxDkL23vzMmr6hJw0NK2saDDTI
         XCPg==
X-Gm-Message-State: AOAM530a6v+M9AkHRMdxD52FOJCEzee8jv31XIZDTAuEd+UEud/PCubv
        apLs0vhExdhF9rDSulp4UXXg0raukgLx0Q==
X-Google-Smtp-Source: ABdhPJzMe339cFQDAAn3rhKPq55mFZRr+GZCR1nNnRbE8esNn1X7pvdPFT97TUMxs8Fdq4/XlN54ng==
X-Received: by 2002:a92:c0cb:: with SMTP id t11mr33206263ilf.154.1636143973419;
        Fri, 05 Nov 2021 13:26:13 -0700 (PDT)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com. [209.85.166.45])
        by smtp.gmail.com with ESMTPSA id u4sm2736537ilv.81.2021.11.05.13.26.12
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Nov 2021 13:26:12 -0700 (PDT)
Received: by mail-io1-f45.google.com with SMTP id 2so8746537iou.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Nov 2021 13:26:12 -0700 (PDT)
X-Received: by 2002:a05:6602:24da:: with SMTP id h26mr1098936ioe.168.1636143971873;
 Fri, 05 Nov 2021 13:26:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211105202021.181092-1-robdclark@gmail.com>
In-Reply-To: <20211105202021.181092-1-robdclark@gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 5 Nov 2021 13:26:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wz0bDNUVdbsjsPv-CU-4WF1ngXT5tODSRpG9qtUqs70w@mail.gmail.com>
Message-ID: <CAD=FV=Wz0bDNUVdbsjsPv-CU-4WF1ngXT5tODSRpG9qtUqs70w@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/devfreq: Fix OPP refcnt leak
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Steev Klimaszewski <steev@kali.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Nov 5, 2021 at 1:15 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Reported-by: Douglas Anderson <dianders@chromium.org>
> Fixes: 9bc95570175a ("drm/msm: Devfreq tuning")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
