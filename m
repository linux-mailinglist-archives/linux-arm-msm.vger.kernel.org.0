Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 067C73DB578
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jul 2021 10:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238330AbhG3IyB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jul 2021 04:54:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238308AbhG3Ix5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jul 2021 04:53:57 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 638C8C061765
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jul 2021 01:53:52 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id u3so16424567lff.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jul 2021 01:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6/y2nst5DhRddrxH7FP8tT6A3puFF+bOoUQNQZh3zyA=;
        b=Ma77ZMtAEMp3DCJI9CiJfurS2sz5X+vHLaWMtEIAYkRDx7/4tLDIJPi5r5sEXf20rX
         vXyeOquE51nPkcdkrSdSEFx8YeYa5ZWUZ3y4CD0Rv76L4Enuazt1Lt+mIbQomhNHJ85S
         vRgevcwq6/OdKXxDIhTf/1f22SSNYNNmDkIC4J35Z2TyO/wC7kUvgIYIqYuUOkvWWiuR
         95tr1ADKF4hWaO+Yi2JbRspF1US0LkWNU5Vbg6kB/PIR8O3t+3eIzy0qpPmlWRwq2U3t
         0AhL4JHC3FuLHB3zaLj9hwAKymG9c8rmY8+SaW3sSDMs/Tf62pRrUu1vSe3RlewNWre0
         3JhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6/y2nst5DhRddrxH7FP8tT6A3puFF+bOoUQNQZh3zyA=;
        b=edBFiQxntAo49OkFefFMYROJHZp7QoEKtfXtoURPNB5wp5uc8IsfRCnsFLmDYwqy9y
         +GM/OX9w2+N7FO1VmByv64dZKiRlyiYb3YTysbFxewAvMtxgWYEfCeeDZopPvqMUZUQy
         6zXaE+YW2oZNXaIlLssgLtmNNRGRlZKDvXBVcM/Zn9/2OhQwNUrAiDxH/IjRJclD6v9H
         ok/UAxCI/OAZZOnN6cvSd8NvMmPi0tosrKpTgl4I0sM60evWq7SKL/rGrIZ2WzD8HkvD
         vMM44sACGyFeg/i4k0JXrcFdnmbie4JF7d8omx0CqADVHg77iX1Dvn543yuePu2jA/Ax
         Xf7g==
X-Gm-Message-State: AOAM530sWvQI7x6mGoqOvvQmNf9R5lDDs8OSrc720wgv5IFYgjjTOuWe
        UWipH74CsQQPZ+yY+5RHNwJH4bQRva89iFo6j/ii6w==
X-Google-Smtp-Source: ABdhPJx1bJcgu56msMl2K3E4iGpbHP52YHQs6+zU5WcFPdQq75FWE5Pw85EYQe6c/vgrClpLB+2LL/++Y8ZFcLVyUmU=
X-Received: by 2002:a19:c7cd:: with SMTP id x196mr425452lff.465.1627635230350;
 Fri, 30 Jul 2021 01:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210707131453.24041-1-david@ixit.cz>
In-Reply-To: <20210707131453.24041-1-david@ixit.cz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 30 Jul 2021 10:53:39 +0200
Message-ID: <CACRpkdZR0_cf=baNkDuAS_JT0OkKLufdspUut18=de7X0urckw@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: qcom: apq8064: correct clock names
To:     David Heidelberg <david@ixit.cz>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 7, 2021 at 3:15 PM David Heidelberg <david@ixit.cz> wrote:

> Since new code doesn't take old clk names in account, it does fixes
> error:
>
> msm_dsi 4700000.mdss_dsi: dev_pm_opp_set_clkname: Couldn't find clock: -2
>
> and following kernel oops introduced by
> b0530eb1191 ("drm/msm/dpu: Use OPP API to set clk/perf state").
>
> Also removes warning about deprecated clock names.
>
> Tested against linux-5.10.y LTS on Nexus 7 2013.
>
> Reviewed-by: Brian Masney <masneyb@onstation.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> - v2 improved commit message, added R-b

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I guess Bjorn will apply it?

Yours,
Linus Walleij
