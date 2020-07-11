Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5F4D21C40E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2020 13:49:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbgGKLtH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Jul 2020 07:49:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbgGKLtH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Jul 2020 07:49:07 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29CFFC08C5DD
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2020 04:49:07 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id h22so9303828lji.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2020 04:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XtfKot8ZssXyPkPO+I+4ExwhCSPuFUl0sOsDrmkzlC8=;
        b=YtE/Av3bVbWUb1Iwokjhs3fiSvRQhLlfVYgp/g+LQvy4d1OYBXcE63gXGMOzz574Ot
         PUMdmLBd6z6GvBfYr91kbor5HYfdQsENqFiK7APq0QwO8lSHcsrcnfA7BDE/2UqLY2CT
         3BfyOUSumHxubjzqcC9uuxxttUexSVN67Cc+VTcuelCjZKcRdUgdv3oaQxFx3joG/XyI
         9avcLEjRIpQ9AKIMaqp1cG8s0mnFkZvG3XBtJ29FsoJzpV3R8y1861DGlRrZRwiXcGtb
         cYEvRsBhVJHaZG2+v4Wh5Ur9pbx5Nzal8KCiODnZYinrki/jYJIp1HLWRC0LXlvysmI4
         tATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XtfKot8ZssXyPkPO+I+4ExwhCSPuFUl0sOsDrmkzlC8=;
        b=GTHKizuca06NMhRbvf1X7idU2kxqbLW2Mmi2uxRHrYBRrlQljZdFEOnnCj6divJd9B
         UGK8nYc/kuwBIfJ2j4x1w/2T8+jbAO5xAonVbCuxc07poIKo9Ud2BjQut4F0f0BMllza
         WXkjsCbPUy/CCzlkMlfdf/dbWpIIUE5yJVex9Et0G1XGWw4tgfUQHoR2UaUxfsIcL2hW
         C6lZYaDqNO/7d1U67EYHEzHxMrbmFN9+j/5zvgcbm+2fYSzPR40XHC+dNn0glySFEti7
         hVak42ZERpyExL1lgRT4zc7aQJtZplGN1SRf9DO9Q5HQcqk14HGzfXl0d9YaJxoYz6PR
         lC7g==
X-Gm-Message-State: AOAM533X3dS5HUZAKaOfbz9bfQG66kjLH52d4KCe0D95oGdyKVVdGINM
        GbBAHKeT6dCrn0wg/dBneY96eYet9+ULm+/XLoFxAA==
X-Google-Smtp-Source: ABdhPJxxFmrJz7/vRwpDkqiIuwv2rWq4N6yDKkszqYRfmcjiTZlBxgzh+2T4uIrxNxpy8O4zOPyOVBKyMRyXLYBeKnw=
X-Received: by 2002:a2e:7a1a:: with SMTP id v26mr26485425ljc.104.1594468145646;
 Sat, 11 Jul 2020 04:49:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200707203529.2098979-1-robdclark@gmail.com> <20200707203529.2098979-2-robdclark@gmail.com>
In-Reply-To: <20200707203529.2098979-2-robdclark@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 11 Jul 2020 13:48:54 +0200
Message-ID: <CACRpkdb0+V7AmvG0JXXETzayr4Q785OLhBWjU414tUJo1toJOQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm: sync generated headers
To:     Rob Clark <robdclark@gmail.com>
Cc:     "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Harigovindan P <harigovi@codeaurora.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        zhengbin <zhengbin13@huawei.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 7, 2020 at 10:36 PM Rob Clark <robdclark@gmail.com> wrote:

> From: Rob Clark <robdclark@chromium.org>
>
> We haven't sync'd for a while.. pull in updates to get definitions for
> some fields in pkt7 payloads.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Out of curiosity : where are the syncs coming from? Mesa?

Yours,
Linus Walleij
