Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AB67101042
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2019 01:32:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbfKSAci (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Nov 2019 19:32:38 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:46753 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726809AbfKSAci (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Nov 2019 19:32:38 -0500
Received: by mail-pf1-f194.google.com with SMTP id 193so11190079pfc.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2019 16:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:subject:from:user-agent:date;
        bh=o0OXgLmHTG6WHUoLd4+XFd/oiOrWoJBJ98oXwGWf49U=;
        b=M5FXXW0mR0xn+5fsbeH0ePNNujEUWE4+jL4vomKqcmMB5GfonCjRlaIdutis/H5QB3
         zAuMK1WjG32gGhpBOHHnDhMAREoTUU7xKb+mmBwWqIxeQbdzL4MQc+HxYvdIqqZ9dKnQ
         opTS860TAZBLz8BVfzAH++6rhEyMViLuHo5rU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:date;
        bh=o0OXgLmHTG6WHUoLd4+XFd/oiOrWoJBJ98oXwGWf49U=;
        b=Nyf26HjtOlAUjFgVNxO4tSCA2miLJ5Uek1no0M4GdOYN+f1iN/ChdAKR/0sg7D7Ie4
         iMrIX9+sCEO+esqHDX//J+uIsB3gNrIqknF9FYXG64SFLv4kVw5xmSdlMIJg7wVDRXpO
         RcDuphqCnww2zxT6yaGyOqYpYtl8teIt5qmmvWhD+htGETcwqkpRkB9TgTY4Ng16/O1G
         wLluD+kNuIa8r6eergzXIBRuXhHDM4WjKWfFXcZQamUs/ivN2qli+8qus3Xmv4BNobdi
         h71BpzWwLRQF+HNLczR+4A4hKbxcO6c4SgALevCpg2aOv3gGYWqv600UhTTTZ1A56ffo
         2KwQ==
X-Gm-Message-State: APjAAAXyHftn6qWliyMm8RUosOUcdfjZKErV90Kxr1mpX384rycG+WUN
        JwgLSHWJ3FsLGoZlJ5hN52vSPY4++Tw=
X-Google-Smtp-Source: APXvYqyAKyUgyhNNCirKuH+kZ1grecYk6P0rtU1NXPsuBpylGactVDgBMuarRDsz9xu7bEt2bBE6ww==
X-Received: by 2002:a65:47c1:: with SMTP id f1mr2187675pgs.393.1574123557349;
        Mon, 18 Nov 2019 16:32:37 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id d23sm23136047pfo.140.2019.11.18.16.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 16:32:36 -0800 (PST)
Message-ID: <5dd33824.1c69fb81.2d94a.4f12@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191118234043.331542-1-robdclark@gmail.com>
References: <20191118234043.331542-1-robdclark@gmail.com>
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/a6xx: restore previous freq on resume
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Mon, 18 Nov 2019 16:32:35 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rob Clark (2019-11-18 15:40:38)
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/=
adreno/a6xx_gmu.h
> index 39a26dd63674..2af91ed7ed0c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -63,6 +63,9 @@ struct a6xx_gmu {
>         struct clk_bulk_data *clocks;
>         struct clk *core_clk;
> =20
> +       /* current performance index set externally */
> +       int current_perf_index;
> +

Is there a reason this isn't unsigned? It looks like
__a6xx_gmu_set_freq() takes an int, but maybe it should take a u16 or
something?

