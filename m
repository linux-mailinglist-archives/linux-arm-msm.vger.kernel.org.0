Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3631F6AF1B0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 19:46:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233242AbjCGSqb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 13:46:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233192AbjCGSp7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 13:45:59 -0500
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8AF4AF744
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 10:35:28 -0800 (PST)
Received: by mail-il1-x12b.google.com with SMTP id x10so8901748ill.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 10:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678214082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RhnCKRU3FrFy7owXRxJ4GDyF7xXRyM56M4QHIhHLjc=;
        b=kORW+pIlMebspso2CmKvb21/4EqcQ8FIywmJ6n2OsiGtF9JQJZfIrSK27w18Y2LbKd
         mlqKKcA3pIoJ70sfqa9x8lfSHzGwjs6SqxIzgUlgN7XYNAXNfvBMJKFFS2ZKP6g/2FFM
         f8MMJ/XDDlw95a2zcZraK7Av6SQkPt3YHSYaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678214082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8RhnCKRU3FrFy7owXRxJ4GDyF7xXRyM56M4QHIhHLjc=;
        b=5e6UgjXHkFC+9sWEEu+RoU/rtvBzwCu79nvOf5IxnLx/smKotAkRdW5hDVr9Mb4u+l
         4I28V5uqLeXejOH76/q0zq4AmmPPMBRcURef406RxidT/z099vU3s8rBgtCuVovzWx9Y
         qahsReMpTUnmL67dOG7jpe9ZFJPz1/G/pa0i2MHZhmEs/LYSDm0GBWJpG7Kazgx8u09F
         ZpoPCZ2kW6kRxjTKEs+h7bIYljvAhg6GxHIgq9pGtwLWy6KMaQWG0YJ1nB1SnlLsSTkK
         B7hLekJP1/ZQRpUPM6ZmIIAnaa+bI7jFOpG+np2M+OhOzgsIvoc8hGD5GPvjxQKHZ3sv
         n0Bw==
X-Gm-Message-State: AO0yUKUP1hpZ9CVHm2cruFX8oZb5mgwpebe1BXlpqhN2mz4dqxUi/wO4
        4qx7fpIWLpQNQzjZ5VtTGcRk4S8G5XO2cBndXLQ=
X-Google-Smtp-Source: AK7set9+D87Df0ZrrHpQsV0JeBMb3vOCuNaviXDQpo3TM8hWIazNu2PAtbXAlfSS8zQhxoxBVRzn5Q==
X-Received: by 2002:a92:cda2:0:b0:314:5aa:94b4 with SMTP id g2-20020a92cda2000000b0031405aa94b4mr10018951ild.7.1678214082518;
        Tue, 07 Mar 2023 10:34:42 -0800 (PST)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com. [209.85.166.174])
        by smtp.gmail.com with ESMTPSA id n19-20020a02a913000000b003c2b67fac92sm4366102jam.81.2023.03.07.10.34.41
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 10:34:41 -0800 (PST)
Received: by mail-il1-f174.google.com with SMTP id l2so8928378ilg.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 10:34:41 -0800 (PST)
X-Received: by 2002:a05:6e02:1241:b0:316:f93f:6f83 with SMTP id
 j1-20020a056e02124100b00316f93f6f83mr7914002ilq.6.1678214081396; Tue, 07 Mar
 2023 10:34:41 -0800 (PST)
MIME-Version: 1.0
References: <20230307164405.14218-1-johan+linaro@kernel.org> <20230307164405.14218-2-johan+linaro@kernel.org>
In-Reply-To: <20230307164405.14218-2-johan+linaro@kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 7 Mar 2023 10:34:29 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Ud3hBV===AeeSsPYN9YD_gNniQAeQ2sZ=cGSpMCzq-HQ@mail.gmail.com>
Message-ID: <CAD=FV=Ud3hBV===AeeSsPYN9YD_gNniQAeQ2sZ=cGSpMCzq-HQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] serial: qcom-geni: fix console shutdown hang
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
> A recent commit added back the calls top stop tx and rx to shutdown()
> which had previously been removed by commit e83766334f96 ("tty: serial:
> qcom_geni_serial: No need to stop tx/rx on UART shutdown") in order to
> be able to use kgdb after stopping the getty.
>
> Not only did this again break kgdb, but it also broke serial consoles
> more generally by hanging TX when stopping the getty during reboot.
>
> The underlying problem has been there since the driver was first merged
> and fixing it is going to be a bit involved so simply stop calling the
> broken stop functions during shutdown for consoles for now.
>
> Fixes: d8aca2f96813 ("tty: serial: qcom-geni-serial: stop operations in p=
rogress at shutdown")
> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 4 ++++
>  1 file changed, 4 insertions(+)

I'm fine with either this change or my change [1] landing.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

[1] https://lore.kernel.org/r/20230307073155.1.Iaab0159b8d268060a0e131ebb27=
125af4750ef99@changeid
