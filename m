Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB13A7A11F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Sep 2023 01:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230084AbjINXnI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Sep 2023 19:43:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230041AbjINXnH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Sep 2023 19:43:07 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF87C1FE8
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Sep 2023 16:43:02 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9ada609bb62so195138666b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Sep 2023 16:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694734980; x=1695339780; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ffsw5m1PXl5CYPaF5hVOzi1zPkWams0dilWKJC5stN8=;
        b=QLRQvEWXGl5VCV0iFSa7Z77bN6vkqPnWAlQGzQBXSthKlgIzbGepdeYzqE+aSMMr53
         1XSLjG9XmXNs7ldsdLOGzItCh6Z4eG4koUomRi8pO1OO5/wzlmKInO6k9Av79ixOR869
         OPbNx09KWg3HOVOvo6XTO57KdQzK0ftmUy8Tw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694734980; x=1695339780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ffsw5m1PXl5CYPaF5hVOzi1zPkWams0dilWKJC5stN8=;
        b=KJR3qoMstUbNUcuB5+U40LR30tZNgY8PoHW7Sw+ql5lgVOJD9U4Jq8YJpzEnNJ+15H
         +HQkLPtbRDcVIM04h2meo0vCCj+FjdkjY0jUyxGkEOOn4+pz/DjlN5HER9ib8CXZPa3H
         8rLhyO1VkhxExMeCgovWwHjjBh2Lvj0L20LIwxSjpSZlJ+zbkCvv9BDwfRqJNhgvKLPw
         blBAY+KKmwaOklnU/wOeGaG7vUJb4kF2XLTdpdOBLpovY/WDl9Mo/KUfylh9O+k4XpIL
         eD5eYan2xa/yEKQdXE1VBfZq6Qzv+9D/0l4MIZL2Iqxk4ZSR2jEHHxQk4agf6n77htRB
         P7Sg==
X-Gm-Message-State: AOJu0YxcuM3z7f/4Ye7WonoOELLLs1sKp7YyHKzb7AT8fQQX3WyEDBsd
        OQ3uZ9s5YBMnJEdfhiquGuvdtRK6VXDC3SYV0ZlSaQ==
X-Google-Smtp-Source: AGHT+IEfIO6Pc6awtpoREd6/8F03n26pY6QmZIQdD+J4cgbbpsP7+aOb00+4roXTwSKtbrMDdfVrUw==
X-Received: by 2002:a17:906:519c:b0:9a6:4f23:9d8f with SMTP id y28-20020a170906519c00b009a64f239d8fmr11730ejk.47.1694734980773;
        Thu, 14 Sep 2023 16:43:00 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id re20-20020a170906d8d400b009ad87fd4e65sm1636555ejb.108.2023.09.14.16.42.59
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 16:42:59 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4047c6ec21dso1265e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Sep 2023 16:42:59 -0700 (PDT)
X-Received: by 2002:a05:600c:1daa:b0:3fe:f32f:c57f with SMTP id
 p42-20020a05600c1daa00b003fef32fc57fmr70422wms.0.1694734979632; Thu, 14 Sep
 2023 16:42:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230727171750.633410-1-dianders@chromium.org> <20230727101636.v4.11.Ia06c340e3482563e6bfd3106ecd0d3139f173ca4@changeid>
In-Reply-To: <20230727101636.v4.11.Ia06c340e3482563e6bfd3106ecd0d3139f173ca4@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 14 Sep 2023 16:42:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ued9suf95ub1-rftO2Ffx_Rwv7XvAf7yX-s7djO889+Q@mail.gmail.com>
Message-ID: <CAD=FV=Ued9suf95ub1-rftO2Ffx_Rwv7XvAf7yX-s7djO889+Q@mail.gmail.com>
Subject: Re: [PATCH v4 11/11] arm64: dts: qcom: sc7180: Link trogdor
 touchscreens to the panels
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     linux-arm-msm@vger.kernel.org,
        yangcong5@huaqin.corp-partner.google.com,
        devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        hsinyi@google.com, Chris Morgan <macroalpha82@gmail.com>,
        linux-input@vger.kernel.org, cros-qcom-dts-watchers@chromium.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jul 27, 2023 at 10:19=E2=80=AFAM Douglas Anderson <dianders@chromiu=
m.org> wrote:
>
> Let's provide the proper link from the touchscreen to the panel on
> trogdor devices where the touchscreen support it. This allows the OS
> to power sequence the touchscreen more properly.
>
> For the most part, this is just expected to marginally improve power
> consumption while the screen is off. However, in at least one trogdor
> model (wormdingler) it's suspected that this will fix some behavorial
> corner cases when the panel power cycles (like for a modeset) without
> the touchscreen power cycling.
>
> NOTE: some trogdor variants use touchscreens that don't (yet) support
> linking the touchscreen and the panel. Those variants are left alone.
>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> (no changes since v1)
>
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi        | 1 +
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi      | 1 +
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi         | 1 +
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi        | 1 +
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi | 1 +
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi   | 1 +
>  6 files changed, 6 insertions(+)

FWIW, this old patch could land any time. All the earlier patches in
the series have landed.

-Doug
