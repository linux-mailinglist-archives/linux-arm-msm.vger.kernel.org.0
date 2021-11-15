Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29981452840
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 04:10:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346514AbhKPDMw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Nov 2021 22:12:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239846AbhKPDMr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Nov 2021 22:12:47 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCDA2C10E5E8
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Nov 2021 15:40:32 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id m6so38313234oim.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Nov 2021 15:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=+vkIUHgpzbJDI/aE4qWRN6on5+ys3atnnjej/kwyIKA=;
        b=MvwYgzJfl2z6wYdr1mxeicKXhoW/hXOKCTTlNpU020Ph8jqOYoqbnuXHhEUhEeOuet
         /khOM4iBa9JfVkpDvECqEBzOP/8MS7WmvFsWxLf4lOHGHGj59aNacA7xJvWnp5R4rzeC
         9S0j6j9vp9ridHSVldRvp0Kb3u1mYuoSRjSWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=+vkIUHgpzbJDI/aE4qWRN6on5+ys3atnnjej/kwyIKA=;
        b=Kh+k1mineUj9vxuNDNRANIjgm7aF0RjzqFC4ZD8Vt73NbyQ7OgVudyXfuaTaV7MyEV
         RSpQ7YPYmvYvdRHNJMac9Hb/BaYZdoH9TiRCS888A2A9uFUkIxJkTS/N4FTccKQ2Gts6
         2aEY1iW40HfzztSap5phFvpM7xbXt8VETW1lIGABuNAfYKRWAerLRtDulpiyKo4FrUV6
         y9DyBrFsIn9+CUkwr82CKcw4dizFWtk76GeEHHiXF7Hzf8x4G6twg5SNXXKqA8+d+LjB
         Ri3MLexr/kmgZXOqgKBjd//MaJ7PE41ASpqS9+WWwqGUWLpReyCHSgxeshErkl5xi1iV
         JZ2A==
X-Gm-Message-State: AOAM532i3VJJ8YKkiWKtTNJHsYHP5N+7QrpIHcdoRRDjJ+ycErRE+zS8
        QK4EURkpPcFPvBNx1fu+LBqCiFTAJcUAwsLnt/HZOg==
X-Google-Smtp-Source: ABdhPJx6sFabeBeRR3jlaia33qeOJQBpKB1AbeYvHvZDZwyzUsfM+A7bo2X6isvJ81dQZc5z//IKWU21dGnPlynzfeA=
X-Received: by 2002:a54:4506:: with SMTP id l6mr49040451oil.32.1637019632340;
 Mon, 15 Nov 2021 15:40:32 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Nov 2021 15:40:32 -0800
MIME-Version: 1.0
In-Reply-To: <1635860673-12146-2-git-send-email-pillair@codeaurora.org>
References: <1635860673-12146-1-git-send-email-pillair@codeaurora.org> <1635860673-12146-2-git-send-email-pillair@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 15 Nov 2021 15:40:31 -0800
Message-ID: <CAE-0n52ONQVGG__JsLUVjjCOdHnw+xqx5HF89ZBGrUF0yjusSg@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] dt-bindings: remoteproc: qcom: adsp: Convert
 binding to YAML
To:     Rakesh Pillai <pillair@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        ohad@wizery.com, p.zabel@pengutronix.de, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibis@codeaurora.org, mpubbise@codeaurora.org, kuabhs@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rakesh Pillai (2021-11-02 06:44:31)
> Convert Qualcomm ADSP/CDSP Remoteproc devicetree
> binding to YAML.
>
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
