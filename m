Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C5B34305E2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Oct 2021 03:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241199AbhJQBeD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Oct 2021 21:34:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241141AbhJQBeD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Oct 2021 21:34:03 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98B3EC061767
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Oct 2021 18:31:54 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id x33-20020a9d37a4000000b0054733a85462so372358otb.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Oct 2021 18:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Mf0Mwk4Nvj9HUEe3bQ6ZCswhorXqyTpELHryvN43LX0=;
        b=ktf+x61/yH16k3GIVUn9Uco046qC1qV6GoQrHIzfWAt5dEvcyFOVtXj5zvIJHepK1u
         Sg1WH8QkUmDWekxPMe/PsUq59SULVXtWX3eR5H0oM9F3SOGMRG0tLQi8L8GUt3MTWL+p
         v67sCkR29toFeJxP+Xsq2HjrMpOz5ZQIWJ+0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Mf0Mwk4Nvj9HUEe3bQ6ZCswhorXqyTpELHryvN43LX0=;
        b=qvlMzS3ZjlfB9VdXu4KA+edZT3mbeKuWm/UPrI9alqWGoGIgWbLq4c7WpZI532D3sm
         NfgTJ9l6b0sRcwqxwVZjA2cdXlm85gBH3QCrvuc13EJgU0iMS3JSrqTbJ95vGwfYApjU
         TgrKzAr3PAW80lcvnuoyaVHD/cW24fO1l2or/PgCsdq4WHQTLxl8q1zpviyuxlr5fD7h
         tSIDR6v47k5GDeUqR6UR3oMcG9C0QhizDKnMCiqM65yFwpPRNL9SHfxrpf+TvUta55vO
         X+lq5XDtaSWEhU+OhLI7CWG6XZeSPNkt1Due5PnTmMVIRJPf5c9WoPLj4llfd1eNy8iK
         F6vg==
X-Gm-Message-State: AOAM530B/Y7UQmOlmSXbvEmyawOI3PRBIkXmkx6fy9Z0D9JUG3Tw9CKj
        iOTy295GbQtiFymdvLvoy/Dv1YMi+XkO1Ys+IepuoQ==
X-Google-Smtp-Source: ABdhPJzzZYs3G7Cs5Kx0YRYBhZZYkqRuo62R0Tx74imA+M7M9wHiZ5oWBZcO2tUw6r5JwbttYUQ1DUTJaey7RPOEM34=
X-Received: by 2002:a05:6830:1c2e:: with SMTP id f14mr14737706ote.159.1634434314051;
 Sat, 16 Oct 2021 18:31:54 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 16 Oct 2021 20:31:53 -0500
MIME-Version: 1.0
In-Reply-To: <20211016221843.2167329-8-bjorn.andersson@linaro.org>
References: <20211016221843.2167329-1-bjorn.andersson@linaro.org> <20211016221843.2167329-8-bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Sat, 16 Oct 2021 20:31:53 -0500
Message-ID: <CAE-0n515j1xqZqQUky2eom_Jq9E7rHOHPastZ7Xp2zGbv0ypCQ@mail.gmail.com>
Subject: Re: [PATCH v5 7/7] drm/msm/dp: Add sc8180x DP controllers
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-10-16 15:18:43)
> The sc8180x has 2 DP and 1 eDP controllers, add support for these to the
> DP driver.
>
> Link: https://lore.kernel.org/linux-arm-msm/20210725042436.3967173-7-bjorn.andersson@linaro.org/
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
