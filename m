Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 862993FBF28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Aug 2021 00:59:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238942AbhH3XAJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Aug 2021 19:00:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233699AbhH3XAJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Aug 2021 19:00:09 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BEA7C061760
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Aug 2021 15:59:15 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id n27so22364737oij.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Aug 2021 15:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=23R8fKMXH4DxuDRCrTSwyAeEWCGLs+lyC4XMuQ81hJ8=;
        b=QEt5vB+J+ddmovN0j7CUy8wn8x5yFU4N0Y9ayi0DKxX8q+BVaY7929gtQp1ppB7KOv
         20u76lWLosHkqxaFAvY55PaCDYp0LTFIKsPQ4PUcA9jF+QuBHI47KbnibvX5WkFuzkYl
         pnho/WmKcYjwF1TMwom5aTzBNUFHZFb7LwTKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=23R8fKMXH4DxuDRCrTSwyAeEWCGLs+lyC4XMuQ81hJ8=;
        b=W7Pl9Xf1lxe9ZPGoQfX5MJU0SZPHPTtTBaJ43ExlirWRnudew3F4TgDnTKhhPT+1Z7
         0ktMLtWrAs6p0beCdjNBlHhs6AhJBpDCLLuGIBLfDqbNWhiOtIhbqG2squolGVYtsq8J
         DIApZzF2QcspOlrNIfxLWVy2AmGth7GzN5Kb3jLp+H5sVlV77rbvNknY+EETvZN6EtKy
         zK1sGkYTfYb3jkdGuS6ZAIkRzprgJWAC3Dxmjsjy42gyIGD5ifm8ZCKV80awk2PLiXEJ
         VHsaPBAteuSe6sAWewUt0/mDqBNNW5yiba3OI+zfKQIIHno/Blbqu2emRWpSdxu0H6wc
         SJWA==
X-Gm-Message-State: AOAM532SHtQ4uQpmq6yEqncXWRCxBcMi2z5mVBsF5kBdMZPy9D/azvvO
        VgyJu+OR7sfrEcrnuYJ4pnWjThP9109W/btwJIfYZQ==
X-Google-Smtp-Source: ABdhPJxlC/joPvSoDsoEOTZeOfqE7RatXYPvmu42VW0LMMlNpAJfL347e0/pP2v9YPue3u5i3tJskWLI5vGa9ZnmWZg=
X-Received: by 2002:aca:2310:: with SMTP id e16mr1139491oie.64.1630364354502;
 Mon, 30 Aug 2021 15:59:14 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 30 Aug 2021 15:59:14 -0700
MIME-Version: 1.0
In-Reply-To: <20210830080621.1.Ia15d97bc4a81f2916290e23a8fde9cbc66186159@changeid>
References: <20210830080621.1.Ia15d97bc4a81f2916290e23a8fde9cbc66186159@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 30 Aug 2021 15:59:14 -0700
Message-ID: <CAE-0n52mwKmw5=_UmAAjFxCvMZYeqGrFfLy6RObf6LP-g=MB7w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Move the SD CD GPIO pin out of
 the dtsi file
To:     Douglas Anderson <dianders@chromium.org>,
        bjorn.andersson@linaro.org
Cc:     sbhanu@codeaurora.org, mka@chromium.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2021-08-30 08:06:37)
> There's nothing magical about GPIO91 and boards could use different
> GPIOs for card detect. Move the pin out of the dtsi file and to the
> only existing board file.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
