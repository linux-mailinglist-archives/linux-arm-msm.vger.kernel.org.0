Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD076B8323
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 21:54:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbjCMUx7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 16:53:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229740AbjCMUxZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 16:53:25 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E29CC30C7
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 13:53:24 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id h19so14673912qtk.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 13:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678740802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXlzN006xu3ZBfFq7erm402Or2NyISMhbX+wHGYXkEM=;
        b=oJVMobxQTq/fK7Mcw93LhfePaKHEdZb+5Dk0NZWNkLvoafPLA5ilrwCVU1+hj9F3bm
         9aGicSUT/WW4whH+nZ6a6/MdF20/28OZ7q5BZ0l+YHMnrKOhV3cgeU0wUL1FPepSgDP1
         ZvYdhT7QFMMlfof+AVTV7VyIpCzNau11JfmHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678740802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cXlzN006xu3ZBfFq7erm402Or2NyISMhbX+wHGYXkEM=;
        b=MBlA+jP5GhVM23ajBR6zimaLA6lc4RKYfDhyvzeH83ALESaCoKsEy+6NW351Es/fe5
         nrS1MQ4cC39L3+nSw9gfA9IV4nXJc7gGQ+S6/44/N+CCyL+MWijJpye2W9daC2WaSwm9
         WoMotECjBmLDa+Bapmz2a+NBKNhlPtvghQz98qxDYppMQLGPc4stsRgS6W4ChvmVSS9r
         S4/tqZkpLIV53t35O2A5Y+M6ww9zNajMt1p6Wwhj/Xq9PSpRB5GQmzrxkiOMHHLg5DDP
         E5dRofSD9HM+OLaKEY5NOILS9V6mEr9Fr0jzf/e6JHvVSUDREMCBN5Q1qTds9bYstdc9
         TpUw==
X-Gm-Message-State: AO0yUKVizywzrxdAMtmYAwBAw8LvzDOkdGkDgNp6TCGGWBtYeKZqlvg+
        G0PQQA3jqHPOOC/UcmPRPQWbsZT5Og9FZ9KUgQg=
X-Google-Smtp-Source: AK7set83O5x2xbPIMiADt6xh9b9MZue4mYVTpjeQduAGg0vOSGIenqx8ZMzzYJz2xJwRCr3CF05gPg==
X-Received: by 2002:a05:622a:184:b0:3bf:d6cf:6cac with SMTP id s4-20020a05622a018400b003bfd6cf6cacmr24238597qtw.63.1678740802186;
        Mon, 13 Mar 2023 13:53:22 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id l3-20020ac81483000000b003b7e8c04d2esm487827qtj.64.2023.03.13.13.53.16
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 13:53:17 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-53d277c1834so264997987b3.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 13:53:16 -0700 (PDT)
X-Received: by 2002:a81:ed06:0:b0:540:e6c5:5118 with SMTP id
 k6-20020a81ed06000000b00540e6c55118mr6945254ywm.2.1678740794346; Mon, 13 Mar
 2023 13:53:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230307073155.1.Iaab0159b8d268060a0e131ebb27125af4750ef99@changeid>
 <20230307073155.2.I106c39498d8094c6f5e7ada42c7db17aa5c64e48@changeid>
In-Reply-To: <20230307073155.2.I106c39498d8094c6f5e7ada42c7db17aa5c64e48@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 13 Mar 2023 13:53:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XFEYPbC64TFLVUmky=1Y-b_iyqiwrALvjKTM_NWr34Dg@mail.gmail.com>
Message-ID: <CAD=FV=XFEYPbC64TFLVUmky=1Y-b_iyqiwrALvjKTM_NWr34Dg@mail.gmail.com>
Subject: Re: [PATCH 2/3] serial: uart_poll_init() should power on the UART
To:     Bjorn Andersson <andersson@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jiri Slaby <jirislaby@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        linux-serial@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kgdb-bugreport@lists.sourceforge.net,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Mar 7, 2023 at 7:32=E2=80=AFAM Douglas Anderson <dianders@chromium.=
org> wrote:
>
> On Qualcomm devices which use the "geni" serial driver, kdb/kgdb won't
> be very happy if you use it but the resources of the port haven't been
> powered on. Today kdb/kgdb rely on someone else powering the port
> on. This could be the normal kernel console or an agetty running.
> Let's fix this to explicitly power things on when setting up a polling
> driver.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/tty/serial/serial_core.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Just in case it's not obvious, even though we ended up going with
Johan's series [1] instead of patch #1 of my series, patch #2 and #3
of my series are still relevant. I can repost the series without patch
#1 if it's helpful.

[1] https://lore.kernel.org/r/20230307164405.14218-1-johan+linaro@kernel.or=
g

-Doug
