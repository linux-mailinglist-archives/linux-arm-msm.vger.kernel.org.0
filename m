Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11D2D3D2D82
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 22:16:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230394AbhGVTgL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 15:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbhGVTgL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 15:36:11 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35FBAC061757
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 13:16:46 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id t6so7979569oic.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 13:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=lGBGDn+lOFNngvvH3L1P75ECn+Xc69iUtWDhuizhmRk=;
        b=WBVq6pEiIdZU+GzhLnjTWPaJtocMzNL82BgTggr5nUPLGGS8R8sX+BOMVEApmfkRw9
         8Y56V3g4r4I8SqKRkOSNP4326oh1kzb+1PuACxmp6HoAfAsgtrdlAJ556GV92PT7exzL
         McADJKZB9Lb+pcbQrmy4bQpGWLhDQQptnnwPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=lGBGDn+lOFNngvvH3L1P75ECn+Xc69iUtWDhuizhmRk=;
        b=oKeuQmMZZhagdhOGB7LwoeP++J+mumjKaF7mZ6AEVIOgXAP5gbCQLnuoTs/yLHC2VC
         0veP1oswwglfkIknRFJRGxtOIeU4mQpagLqizXUm58KIwQiAgJN6mLAneKTQ3rQVivfu
         FkhI0KV1O6AIUfeD0XgCZ51tyl1NBzKxqhJxs9OnGisSYl6rLJOpIbOWm93nsDHPIB7S
         DFtZHgAFe9i2+yIwmPN6z74Rpn1okPHnKNLVOob8LrxYgG0X69sofELR6wdzN/n5d5Q9
         Qs9NiEyrl+Ocog6Ikq75c27SrJw8BeLInGai/wDXvJKWNdIE5Ut4Gqityq1o3zmG15fR
         oBsg==
X-Gm-Message-State: AOAM530KdcYq+yPsNbK2PKMd2krVVQqr3aFn+Q+b0GLNJoG5MxwSquxR
        bk27tisLhGEVbI1bVXALil62cc/pskc1+c7FVn0iZg==
X-Google-Smtp-Source: ABdhPJxjTaEbkRrBN/FqiRS6clBxB0FcklPeiI3sKW/kjDjrRLw/EbOnNhQjT9Uf5BJl9SFEVjqPUChYPfrbRGjQLhI=
X-Received: by 2002:a05:6808:114a:: with SMTP id u10mr1175746oiu.19.1626985005662;
 Thu, 22 Jul 2021 13:16:45 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 20:16:45 +0000
MIME-Version: 1.0
In-Reply-To: <20210722024434.3313167-1-bjorn.andersson@linaro.org>
References: <20210722024434.3313167-1-bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 22 Jul 2021 20:16:45 +0000
Message-ID: <CAE-0n50iOP5K8Q79ShmLowWErxMFRdYZRg=hDszYn8O4OJaz6A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Initialize the INTF_CONFIG register
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Guenter Roeck <groeck@chromium.org>,
        Vara Reddy <varar@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-07-21 19:44:34)
> Some bootloaders set the widebus enable bit in the INTF_CONFIG register,
> but configuration of widebus isn't yet supported ensure that the
> register has a known value, with widebus disabled.
>
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
