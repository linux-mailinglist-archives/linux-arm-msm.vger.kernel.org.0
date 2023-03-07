Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89A4E6AF324
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 20:00:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233332AbjCGTA5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 14:00:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233368AbjCGTAh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 14:00:37 -0500
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12676C488E
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 10:47:23 -0800 (PST)
Received: by mail-il1-x129.google.com with SMTP id b12so5351133ilf.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 10:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678214840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7BUelKDKk+33uckJ7LNeCbNjLijtX6ljbEKj2F7sL0=;
        b=TlR/FyIjWLnMbONWCzB2Z6S+1hskQcmd4MbBShge2gPaXrJlel8FOlsCisvLJ16fFE
         eoBirk5vtVILcDRxPAdzCQqOmjHWQbznyJSidb/BQ+aDLNdkhzl2TMTUscIuKEYpbzL9
         6IIGGFmOGG24sXQsXJId+46gZQ62Npjp0eunE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678214840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O7BUelKDKk+33uckJ7LNeCbNjLijtX6ljbEKj2F7sL0=;
        b=nLsvOm3uwIVm/ZytF+ZT4Lig3xxtTGzsziARxADgCd7uRLkdlTiomVVLZ3pIZvtf8J
         HKP7TrFGDhFMuqjCyP5GW5wDlqe6x3ZEwW2sJajfHLxgVpEPDT4UmijLtKICuattj48O
         qwyg2iFjcN1bT8L2MPgxjFTo150bgNztzndL+762T65HyCEO48C7bfTv2eFTXH+lTqA5
         CP+ut75PPp2YmoqluuNaqUaYhK2jQBkUmAQsB7yd4VQQrBpepe0Xh4nnNuXn7U68Xpg9
         /Jy6PDDFLGsVJyam/llXVBVHicIpshaQPKr88+77Vi0pWr25uVJMa2tpDQ/dsSoDXa9B
         xN4g==
X-Gm-Message-State: AO0yUKXeQ1B7NVJ4XouqUT2mVY/b15UG9PUwYrz8lNJsiEqOSJeg6hBD
        opTg2YTtd+5jtWjtrr1uEdcn9Y2cmhgEOMszsAs=
X-Google-Smtp-Source: AK7set9mXHghpcGo42/w1/2ptKc5bgnRe04hbMnaFSacf+ypdWGQikexiZvOVw5UoK1SUzkppX5mDg==
X-Received: by 2002:a05:6e02:188f:b0:318:a84d:bf53 with SMTP id o15-20020a056e02188f00b00318a84dbf53mr14501040ilu.0.1678214840459;
        Tue, 07 Mar 2023 10:47:20 -0800 (PST)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com. [209.85.166.47])
        by smtp.gmail.com with ESMTPSA id c2-20020a02c9c2000000b003c4d6e89360sm4211996jap.71.2023.03.07.10.47.19
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 10:47:20 -0800 (PST)
Received: by mail-io1-f47.google.com with SMTP id v10so5786632iox.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 10:47:19 -0800 (PST)
X-Received: by 2002:a02:aa0b:0:b0:3c4:e84b:2a40 with SMTP id
 r11-20020a02aa0b000000b003c4e84b2a40mr7756944jam.6.1678214839473; Tue, 07 Mar
 2023 10:47:19 -0800 (PST)
MIME-Version: 1.0
References: <20230307164405.14218-1-johan+linaro@kernel.org> <20230307164405.14218-5-johan+linaro@kernel.org>
In-Reply-To: <20230307164405.14218-5-johan+linaro@kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 7 Mar 2023 10:47:07 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VTDHFkSf4qnexNOBoXzV-sMPBRjSqMrB_nrsuCPpO=WQ@mail.gmail.com>
Message-ID: <CAD=FV=VTDHFkSf4qnexNOBoXzV-sMPBRjSqMrB_nrsuCPpO=WQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] serial: qcom-geni: drop bogus uart_write_wakeup()
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Mar 7, 2023 at 8:43=E2=80=AFAM Johan Hovold <johan+linaro@kernel.or=
g> wrote:
>
> Drop the bogus uart_write_wakeup() from when setting up a new DMA
> transfer, which does not free up any more space in the ring buffer.
>
> Any pending writers will be woken up when the transfer completes.
>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 4 ----
>  1 file changed, 4 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
