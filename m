Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8F8C4D0B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 16:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbfFTOsW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 10:48:22 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:34570 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726786AbfFTOsW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 10:48:22 -0400
Received: by mail-io1-f65.google.com with SMTP id k8so152324iot.1;
        Thu, 20 Jun 2019 07:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VsQgLN55m2Gadfa4Rkhy/vSEEq52+zbPqM7w5Sqzpzw=;
        b=j2DEPEe4nld4yIyPis9Njlqjyfk9imzNxLBH6KEDxpb8hgq5acI9Z8sjs1xuyRraQd
         HS1C7IEN6L9TQrFV2SUneM5xM/6Gs26rLPbV0Fp+jjjZsuEWIy3K7ijDfGLajiI6XJd5
         3lPkXIEl+0iAUNndnphTgPGxOYHzQzXSABUIwbrVgtX6jH3zlRgmzKrd0Pu8p6nG3gRC
         /CZmXYuaezyFl/6RhZrGNYo3FJ2ZKrnK3ewS02liO5Acb+W4vnOPqud0MXd/jSIJ2Tk3
         B18WirhpJfp4Rmw5v9PYnTNFTdoNhr4iEljimEfc68Bp350tJ/ci6gNucn2JtwlfNIcd
         ofOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VsQgLN55m2Gadfa4Rkhy/vSEEq52+zbPqM7w5Sqzpzw=;
        b=ruwdEfV77bbH4smPWSz/eWLzdcnSmLxQVYVjBbIgXJGl7xLyxHN2MU4BeD6DXYgrkf
         hlkskRUi9KXVSKTqOcuzkP3kOPp/5TNvERRZut2kyyY47z0YP8TZyaLOf1uhNijvv8Kj
         SCEEQQCU7PMrzpdPT7xuECpBkH+uUOA0cBZv7kTmtfWVkoHM8HCgJ4XAk5iie1QEFhRw
         3xAkyat80i4KnfK4ZFIdTHjlP+L1Xntz5VYz3UFF+hm0OgOGdJe2wbpJAJcLbChIOPou
         W2LJEkMEkxYIg993x+p0bNhofjQ+Rs1CUJs7G4ffkTKfg/5G+cdqq0ym4JLdLE5B9vbQ
         wDxQ==
X-Gm-Message-State: APjAAAXDOZs6oHW0LdFLOLW9S2971YItN8mNb+v5+PX7hK7FsLy+8Zed
        SKx5hMUw58pBOynQK5fHFG2kBC23r47hUfCgeps=
X-Google-Smtp-Source: APXvYqymqUxrf8avJ4KxgGLTzfC12Z41YYErMCh3cVS0mHma2ZJVWrRojP1WSFL43Rq+qeb5N3d6E2Un86A0iYmOnyE=
X-Received: by 2002:a02:ac09:: with SMTP id a9mr18708279jao.48.1561042101139;
 Thu, 20 Jun 2019 07:48:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAOCk7NoTN6JEo7B=8P=T4C3t_Xr8eQUX=KG9j4N+jXZ8Pw2f4g@mail.gmail.com>
 <20190618221022.28749-1-robdclark@gmail.com>
In-Reply-To: <20190618221022.28749-1-robdclark@gmail.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Thu, 20 Jun 2019 08:48:08 -0600
Message-ID: <CAOCk7NozdcpnHpot35KyQ9OStrsVUvLN3-rL=q3Lzu5jfk=3-Q@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 5/5 v3] drm/msm/mdp5: Use the interconnect API
To:     Rob Clark <robdclark@gmail.com>
Cc:     "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Boris Brezillon <bbrezillon@kernel.org>,
        David Airlie <airlied@linux.ie>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
        Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 18, 2019 at 4:10 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Georgi Djakov <georgi.djakov@linaro.org>
>
> The interconnect API provides an interface for consumer drivers to
> express their bandwidth needs in the SoC. This data is aggregated
> and the on-chip interconnect hardware is configured to the most
> appropriate power/performance profile.
>
> Use the API to configure the interconnects and request bandwidth
> between DDR and the display hardware (MDP port(s) and rotator
> downscaler).
>
> v2: update the path names to be consistent with dpu, handle the NULL
>     path case, updated commit msg from Georgi.
> v3: split out icc setup into it's own function, and rework logic
>     slightly so no interconnect paths is not fatal.
>
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Looks good to me.
Reviewed-By: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
