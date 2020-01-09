Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9E8F136382
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2020 23:58:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728657AbgAIW6e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jan 2020 17:58:34 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:34633 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726299AbgAIW6e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jan 2020 17:58:34 -0500
Received: by mail-vs1-f65.google.com with SMTP id g15so120279vsf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2020 14:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d3Ic+/+tOQj2Lu5zb82dqbL3LnFvo8VU2lGIIpV77vw=;
        b=Vs4XiohJHiCv9DpKDaL8PP0Cv5qmD17Ku6z6gwXdTevogicvgzz0V56LTDKUUfNPhW
         Iwx3uHBuDesHk/r2q0/LgARjOLEqx4IOpy0IKZ97asjGTuxOtDPF+Jub17jyVKigXjQ0
         hlfVpIYGC1LZrXImn2ixRg2dQuyHeSCEDqyhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d3Ic+/+tOQj2Lu5zb82dqbL3LnFvo8VU2lGIIpV77vw=;
        b=QFl9qsz2+L7SAzNB9kv1WAZjq9nR973l8fJi2Xh4dHZdjW2YAVTqDzmNKe+4+/3gxk
         R8V9STuV9BEuapAi9Cjt7QMlDCeV0QuFqw/0PhYWhxX+KMX1+ro+9lei7c+aMKqK8+m3
         32JXw11a7hdGV2ELH3LqbZGPsEw0TClaLmTu9p2b0uMCtRU5iso69vzqiD61/e1Mkcil
         w19bm2iffslqmx2PgdMuShJ5JpPRfkIyOemxNKrDLqqmKeBOje01+jS80WJ8AHESUTdf
         OCPXZVeAIHAxClc3n2Oe0anGnresIsH/44Zlht/v4/3kcRpuKfAX0dJEjtY0jdVNWw5U
         Vn3g==
X-Gm-Message-State: APjAAAXruTdZy4iXUXLAUOTsl28qX2gaVZT0BMYALGmeV+h6X1DPkVwW
        UIeYdu+OWLfK5r+98pOeIxDX9927Bqc=
X-Google-Smtp-Source: APXvYqw5q6nuThUIg7TOU6YBDr3h3CkyTwvntQsZMrWuny4nnshkR3oMl846vVA3mfJPJAOzB8ezyg==
X-Received: by 2002:a05:6102:31a3:: with SMTP id d3mr62957vsh.60.1578610713415;
        Thu, 09 Jan 2020 14:58:33 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id q189sm9374vkh.44.2020.01.09.14.58.32
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2020 14:58:32 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id k188so96125vsc.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2020 14:58:32 -0800 (PST)
X-Received: by 2002:a67:e342:: with SMTP id s2mr50831vsm.198.1578610712346;
 Thu, 09 Jan 2020 14:58:32 -0800 (PST)
MIME-Version: 1.0
References: <1578396597-18324-1-git-send-email-harigovi@codeaurora.org> <1578396597-18324-3-git-send-email-harigovi@codeaurora.org>
In-Reply-To: <1578396597-18324-3-git-send-email-harigovi@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 9 Jan 2020 14:58:21 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XwkvGgJUeNs=aKoirSw_f47QoDTuvQF25VE7ychwdJTQ@mail.gmail.com>
Message-ID: <CAD=FV=XwkvGgJUeNs=aKoirSw_f47QoDTuvQF25VE7ychwdJTQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/panel: add support for rm69299 visionox panel driver
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Jan 7, 2020 at 3:30 AM Harigovindan P <harigovi@codeaurora.org> wrote:
>
> +       drm_panel_init(&ctx->panel);
> +       ctx->panel.dev = device;
> +       ctx->panel.funcs = &visionox_rm69299_drm_funcs;

I haven't reviewed your whole panel driver, but I did just try to
compile it and found that it won't compile against mainline.  Namely
this needs to be changed to:

drm_panel_init(&ctx->panel, dev, &visionox_rm69299_drm_funcs,
       DRM_MODE_CONNECTOR_DSI);

...because of commit 6dbe0c4b0fc0 ("drm/panel: Initialise panel dev
and funcs through drm_panel_init()") and commit 9a2654c0f62a
("drm/panel: Add and fill drm_panel type field")

-Doug
