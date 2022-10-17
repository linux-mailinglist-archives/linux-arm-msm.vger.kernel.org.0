Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7FA0600A52
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Oct 2022 11:19:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230497AbiJQJTK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 05:19:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231452AbiJQJTE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 05:19:04 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C604F2180B
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 02:18:47 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id u21so15092991edi.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 02:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+HqAIl6nBJaeTsKPrd3Fu1M8Q24TXGKoN11JeqqOoGQ=;
        b=OUMxqBlyLog/Cl8agdjk25/WRV0xCBdMiotiEDcpVSGtmZ6+Ckbqnpc7DCdFbPYYJt
         1yUUZYDeXQnl0gQh5KTe+ojvd1s4Coo8UtsuE5do0UZLghcjm7lyOd9HvwRIDqB3PTB8
         P+JmU1m0niHDX5DQuej6CeIaEwP/4jIlqVBlqUEkBWBPWrwytfsOViSeEAewTT1VQ07G
         wXyzKrnrbwx5qEcLxvd++JmAeIs32nYp9qbSnhptfvA//kkt5z7zkOmH/7KoJjFLI8qC
         cEGBp4Nwyd9qPRYgwyAOUsRoDkrxv7z8j+PylWQ2EVYU8xs3lFFwWhOwoxfp0H80gTUd
         Wr6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+HqAIl6nBJaeTsKPrd3Fu1M8Q24TXGKoN11JeqqOoGQ=;
        b=zBEIIb3vC5JDqKa/wYK6zU1fCTOSfPbXmRIf6kyNvF7kdQwuaV4HUgcW5TIt3w8p2X
         YdLQt7CSJR/c/bgO/J8VE5O6EbrcxNNN37xmyGfu8J1Cxt9AdT4tjogvM+TyFn8YQGiT
         uZAR9GlLDch4jla1Xt6GdTpfJTXSMfnRBY610WAMxOLU4MlyjgGcstg12IHBkyCZe3bp
         X/l8Q1h1lSujkpg7az8y6PqS5otGtNG42KUK+DWISR2j6GYdva55bb4Iu5VNWNVDcAGp
         PPmyZtZJxcU2JzyBA4VHDpY5AirIH728rPEUDNDGygR0NLJ5DxtQaZ6oxLceX7Yg4Bmw
         ERJw==
X-Gm-Message-State: ACrzQf0xZuk386vBdpYd/64DFExWGU07mUtVgZHGVvW4jtbLYrF8oKVd
        gJfAmZnwQRQOWDNSUc3HDmyfKJlNhxeUSjPHOSOzLA==
X-Google-Smtp-Source: AMsMyM6dy0W7/AbolGk9+7me5a49jX88i4urkUqsO8zQdLx+msJsCLBRnqfnOjgEd1Y5uv+zt8vkYxuXTpcSPP2JPH0=
X-Received: by 2002:aa7:c98d:0:b0:45c:6451:320e with SMTP id
 c13-20020aa7c98d000000b0045c6451320emr9368712edt.172.1665998279122; Mon, 17
 Oct 2022 02:17:59 -0700 (PDT)
MIME-Version: 1.0
References: <20221006194819.1536932-1-robert.marko@sartura.hr>
In-Reply-To: <20221006194819.1536932-1-robert.marko@sartura.hr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 17 Oct 2022 11:17:47 +0200
Message-ID: <CACRpkda9vrPskHYbasqWpDcap=qwP3_QoEpuEBgbC1WQ4=aoYw@mail.gmail.com>
Subject: Re: [PATCH] spi: qup: support using GPIO as chip select line
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, broonie@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 6, 2022 at 9:48 PM Robert Marko <robert.marko@sartura.hr> wrote:

> Most of the device with QUP SPI adapter are actually using GPIO-s for
> chip select.
>
> However, this stopped working after ("spi: Retire legacy GPIO handling")
> as it introduced a check on ->use_gpio_descriptors flag and since spi-qup
> driver does not set the flag it meant that all of boards using GPIO-s and
> with QUP adapter SPI devices stopped working.
>
> So, to enable using GPIO-s again set ->use_gpio_descriptors to true and
> populate ->max_native_cs.
>
> Fixes: f48dc6b96649 ("spi: Retire legacy GPIO handling")
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Cc: luka.perkov@sartura.hr

Ooops sorry about that!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
