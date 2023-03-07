Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 804AF6AE732
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 17:48:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231278AbjCGQse (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 11:48:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230487AbjCGQsF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 11:48:05 -0500
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EC1B9CFD3
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 08:44:36 -0800 (PST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-536bbef1c5eso254822057b3.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 08:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678207475;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fudFHVuFTBFg/trnMAjwYtHP559hB1IlUkkm8c37Y50=;
        b=C1FtktTUZLRScveIKZ9szc5tqFc6zTVlhosAm5W76bIoTA3+jownCZemOQJtXqOj/i
         OswV+evhE1bJddGQbzMng1HQJDkU2BUx6B9RB9Pe9n0f/n4QtjzYtDChr0Ayz2e7bRUU
         kMYvci9lBkG6mamdFC3GBN0aEpock3bvfim3piuR76BI/d3rspNk8J3Z8ZaumNx/OMzA
         UmV9535q5E0zVsf9yBGCMIGTSfIdpnxUU0qb6MG9EKVAD7TIPSkEsDGgQGFOerMUOlB4
         jfqW9qFop3MurMcW8Upi8uSgzVR1WrvzZOgJtH517PHHvOzldcVVB2GjoDgA3OVlz4hs
         OO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678207475;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fudFHVuFTBFg/trnMAjwYtHP559hB1IlUkkm8c37Y50=;
        b=xkkGlF0iJZ4eh0s7heorNlLJw1DmKd5c8LXKYVDGPEpGSizmkID8cQ30nOimTE/zJy
         O121wRScqCh/QM8UToG/flcf8VbstWqtNpvnyszny3jy1D/DO5onHrI/yAttgDFP6rLE
         Z7/iagruimNc+I/MtlrW/tfV0HPupFlCHdPMnTaVxznJqqiqeBMFegOjgkGhcAZuSolW
         0tArB3AAN9N2zaBTdLk264fKmCv1JaPS6xRqdVeKYYf9/pqfexGN9SRHDplZY36k2Fdc
         1zHc9kFDEqk803jJOIswOUpyq1FyZU+hwtO7UmNH70V/Jw+AyKfCEEeVeNeeJ5qMDrBL
         gJRg==
X-Gm-Message-State: AO0yUKXCq99fh4n3f3hhqptPeOXMABJ6wDlootVcqw8S0eDi1l2aJ5+m
        f1bDKSLn1Gur2ZA+/Wlfgi+HfxNwMx64WLQaVwjhtg==
X-Google-Smtp-Source: AK7set8Mlhd3BMu0el6kBe6TVY9uurv9wWYfzGKZYZ3v+8bg59K0iPFTbzTLcG3qzqvWFFLjae+E3TdWxy0lihl0lxw=
X-Received: by 2002:a81:ae26:0:b0:52f:1c40:b1f9 with SMTP id
 m38-20020a81ae26000000b0052f1c40b1f9mr9643617ywh.7.1678207475364; Tue, 07 Mar
 2023 08:44:35 -0800 (PST)
MIME-Version: 1.0
References: <20230307164405.14218-1-johan+linaro@kernel.org>
In-Reply-To: <20230307164405.14218-1-johan+linaro@kernel.org>
From:   Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date:   Tue, 7 Mar 2023 17:44:24 +0100
Message-ID: <CACMJSes3usJUvCsrMBR_9dDGCbo2y7JqA8-B5mP28H2Cjg-v6A@mail.gmail.com>
Subject: Re: [PATCH 0/4] serial: qcom-geni: fix console shutdown hang
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 7 Mar 2023 at 17:43, Johan Hovold <johan+linaro@kernel.org> wrote:
>
> This series fixes some of the fallout after a recent series adding
> support for DMA transfers to the Qualcomm geni serial driver.
>
> Most importantly it fixes a hang during reboot when using a serial
> console and the getty is stopped during reboot.
>
> Doug just posted an equivalent fix here:
>
>         https://lore.kernel.org/lkml/20230307073155.1.Iaab0159b8d268060a0e131ebb27125af4750ef99@changeid
>
> but the commit message only mentions the regression with respect to
> kgdb, which is not as widely used serial consoles generally, so I
> figured I'd post my version for completeness.
>
> Either version of that fix should address the immediate regression, but
> fixing the underlying problems which have been there since the driver
> was first merged is going to be a bit more involved.
>
> The rest of the series fixes a few bugs in the new DMA support that I
> found while investigating the console regression.
>
> Johan
>
>
> Johan Hovold (4):
>   serial: qcom-geni: fix console shutdown hang
>   serial: qcom-geni: fix DMA mapping leak on shutdown
>   serial: qcom-geni: fix mapping of empty DMA buffer
>   serial: qcom-geni: drop bogus uart_write_wakeup()
>
>  drivers/tty/serial/qcom_geni_serial.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> --
> 2.39.2
>

Hey Johan,

Douglas and Srini beat you to these fixes but thanks!

Bart
