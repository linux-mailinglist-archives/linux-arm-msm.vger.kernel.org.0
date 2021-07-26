Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49F843D6A65
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 01:52:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234147AbhGZXL7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jul 2021 19:11:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233994AbhGZXL7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jul 2021 19:11:59 -0400
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AC7DC061757
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 16:52:26 -0700 (PDT)
Received: by mail-oo1-xc36.google.com with SMTP id t1-20020a4a54010000b02902638ef0f883so2654457ooa.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 16:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=dRaHtjS0KrTz4yuMDHKsz+U68MHHTci+vBVq7wMAHKw=;
        b=AvHO4vlBdmphRLFE1VF1DCJfbyTvm/5I94Unc/gLh+OhuuKt7bnc/QMo5D0l+5vdX9
         HUBVtcsSCB3rh6Cs96P+4lu5ABM/EN3WeQJZGQg1nTOIArK4SQhBFK4KnHQdjpIboXlf
         dfDSdYpePU+/obZDzB4Fx2hhqJi48U6l8l04Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=dRaHtjS0KrTz4yuMDHKsz+U68MHHTci+vBVq7wMAHKw=;
        b=qeiRjp4ooROLsnmfk6Rb98YKRKS/tdDDEIbGckerrEK90C1PeSMBZogMBY8ThiMqvs
         utJ5KKXb3R+8EKUHIdNs5xvAi68JIZ2k4rmQDcueCRfUWVC+u23GtO/4PahU5A+5pqmv
         xV4rDMHdbQ7t+MXtPVgla2In1JN5Qw3UVrw43nUJhHYg7lTlqhHwMjt0S92fwsaDiKn5
         fgjehCuozrAd3MY3KqmC0bp8gX3le7DSmrkXzNsn7vMVl8WOv7P5UJ4Qo2EUzy7PSY4u
         fV8cxPT17Jj8xsAx6orlMy56QO3iQNpyAGmqkjELMf4XaAwnNhvkpgJCsELIIEqXnw6N
         4kMQ==
X-Gm-Message-State: AOAM53246l9orYWavVyK2WNYCRIHs5WgfPNenkpF/1ArvT4VdxXsz/KZ
        x3mXIvbWC6GVj+E5Na47wjDXtygg01lJ98W9vZNmyA==
X-Google-Smtp-Source: ABdhPJxSyAGaBm1flEDwyQLTJt1JWFzQAyotby+cedJ15X8enDG0o3MaedDkJEWuJ2piJSo1jaW+PEA+CtzX3wp4PZQ=
X-Received: by 2002:a4a:a6c2:: with SMTP id i2mr12012017oom.92.1627343546057;
 Mon, 26 Jul 2021 16:52:26 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Jul 2021 19:52:25 -0400
MIME-Version: 1.0
In-Reply-To: <20210725042436.3967173-6-bjorn.andersson@linaro.org>
References: <20210725042436.3967173-1-bjorn.andersson@linaro.org> <20210725042436.3967173-6-bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 26 Jul 2021 19:52:25 -0400
Message-ID: <CAE-0n53J6dqB7X7LoKd4VYVgA-ujbV1shFWdYZvLZZ+q3Tjpmw@mail.gmail.com>
Subject: Re: [PATCH 4/5] dt-bindings: msm/dp: Add SC8180x compatibles
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

Quoting Bjorn Andersson (2021-07-24 21:24:35)
> The Qualcomm SC8180x has 2 DP controllers and 1 eDP controller, add
> compatibles for these to the msm/dp binding.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
