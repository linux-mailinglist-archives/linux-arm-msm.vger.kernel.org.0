Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4BC32C193
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 01:02:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389475AbhCCVhy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Mar 2021 16:37:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357214AbhCCIUe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Mar 2021 03:20:34 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35F00C0617AA
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Mar 2021 00:19:53 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id i14so3676549pjz.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Mar 2021 00:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=PM+ZyrAzhPWcczvghcrbAJYRu9kPAEObR9xBWMwNMDA=;
        b=gRnwTT2D2Qv17IEktnlVuanRdrxeAmR3L3jgF5pEQ8g3B8Ysfly/z6K1ktz8MgkvxE
         fF4sOg+7/JhW5m0V/+etu0CaKnHtWi/R5pH8rzU3DNq4pL4S//dTHI/oqCBYM6YkYjes
         Qkwt6EPDyHW5acJEzzAUeasu71myXWxbzKaHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=PM+ZyrAzhPWcczvghcrbAJYRu9kPAEObR9xBWMwNMDA=;
        b=A/vkNhG3PH+ss1poKW8gaBtF0C2LcJpibcQPJPgCzzatcfOBcWrjF0p7q119gyUPvv
         DmBj34NuEbdjc1AmWfzQoEcmjgwz4Ostbi33nZcEL3v5zI1PbaogR1phksK9QgoxOar3
         D1YgApqB6b03tMo0W24yr4KEKwqB3n2SNI9mKkMOA8xaWzJgRckzSJs3/fHtaIcdU9gj
         Q2P5BG4X1hL8qJy4e38mKlvF1+91HD+4ka5kye5z9dqHGu7M5pDs3nTYACA7fpuWaqzc
         QpBKkoEE5E9ZjB5w5f66BP3hoGHUC89W+yS9LBHLLhR9V6Hk6rdCMl3bbFjw7Cp4JzbW
         H/hw==
X-Gm-Message-State: AOAM533GETh85NA+lCRwOJrfLW8eXTlBzV75AV8GoCedhhf5YmIuT+DL
        IobeR0h5VejcxJbk/u2Cq5Y93A==
X-Google-Smtp-Source: ABdhPJyeS7RzwtOTkkPzrCKLJYFTzBrnx6Uap9DROLJFWpzrrscugtQaL+TcHwJOTW7M8aCBXfapuA==
X-Received: by 2002:a17:90a:d0c1:: with SMTP id y1mr8359625pjw.164.1614759592795;
        Wed, 03 Mar 2021 00:19:52 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:2510:ab07:78a:7d78])
        by smtp.gmail.com with ESMTPSA id b188sm25272192pfg.179.2021.03.03.00.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 00:19:52 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210301133318.v2.12.If93a01b30d20dccacbad4be8ddc519dc20a51a1e@changeid>
References: <20210301213437.4165775-1-dianders@chromium.org> <20210301133318.v2.12.If93a01b30d20dccacbad4be8ddc519dc20a51a1e@changeid>
Subject: Re: [PATCH v2 12/13] arm64: dts: qcom: Add sc7180-trogdor-pompom skus
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Rob Clark <robdclark@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Philip Chen <philipchen@google.com>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Date:   Wed, 03 Mar 2021 00:19:50 -0800
Message-ID: <161475959090.1478170.938228652801288465@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2021-03-01 13:34:36)
> This is a trogdor variant.  This is mostly a grab from the downstream
> tree with notable exceptions:
> - I skip -rev0.  This was a super early build and there's no advantage
>   of long term support.
> - In -rev1 I translate the handling of the USB hub like is done for
>   similar boards.  See the difference between the downstream and
>   upstream 'sc7180-trogdor-lazor-r0.dts' for an example.  This will
>   need to be resolved when proper support for the USB hub is figured
>   out upstream.
> - I remove sound node since sound hasn't landed upstream yet.
> - In incorporate the pending <https://crrev.com/c/2719075> for the
>   keyboard.
>=20
> Cc: Philip Chen <philipchen@google.com>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Tzung-Bi Shih <tzungbi@chromium.org>
> Cc: Judy Hsiao <judyhsiao@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
