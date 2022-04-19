Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35170506B4E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 13:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351881AbiDSLuI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 07:50:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349667AbiDSLuF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 07:50:05 -0400
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F00633A17
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 04:47:23 -0700 (PDT)
Received: by mail-il1-x134.google.com with SMTP id k12so3374074ilv.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 04:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ykcELTPl3yH9J0baO/p4z7jLcOC0M5/r/e8/mBAkHnI=;
        b=e4PhPOdJaJfimlQ4PKP6nvJoOYYDO5nhMeCsGeEv6haqQTg93XVt03aKOL6AoLkFPu
         T5OF1x/pbvAbtUSy4xnD9UX0dMy4WbIsmDYQajjTITQNcuoRUEJPq0ZkhyIGCrGh6uTl
         lb5jV1BjGtJ0mfnl3MUx0I6jIoV9SG7wH0Q42AJiWV1hHf/J/gz0b3ZudKZ9St6jopCH
         nrcJZ5WqvqX4cVLPfupsECzGemmeENF/FC97ESh+M8vuIG9Sf38AVI/rWkn9pIoXXbZB
         i1rWAPJGity0IQT/GHrSyNFItd4Rc3FPnb9HV7zyXrDkP8+lphpYJxetdhi/ZEDR2b2R
         utcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ykcELTPl3yH9J0baO/p4z7jLcOC0M5/r/e8/mBAkHnI=;
        b=aIY4QMpBp9d3aIJGSsGuETDAeEkbQRpZaApErKKu2JhaQTdnO023H2DkDCHWOiSlc/
         K9+28IbOrsWWWuXou+YGYQB6T8DIq/8DrzwvdMxdYKAb1CYufQ0LcDHTK7iFhuJfrI6l
         e/NdhpzIK7sBmlKNjlpIqMxv6N8uBC3sUYGFCdtoevNs9lyle+BUALMVGgA5lOsl8zo/
         oGn6nwNTC8pSC7XqqcK9ZYLl1C54vfQcVH7WvBx6RAO+Plv5dm1mNXcwX5lvyMMk1/0P
         ZEXtlkL0Jm3jjte2rJ8ZhGQ2nOyrfOz/xNwxWurDhUwtXckPyl1/YW1nnukMTyV/OvNY
         1OjQ==
X-Gm-Message-State: AOAM533l2dhZv9nCUwKyi2tQRBi021ZAFLwziJG9pAJiA9P3YmWfdxrR
        uBXQlbtD4yobZ68fcS3z4xNYTP6mq65tkOMJFs/KBnhJ
X-Google-Smtp-Source: ABdhPJy7crHXTaEuQo99Mp/W+v8jrmimjM6PwPT1diOsxifhhFRZWL0zCIlHsG2CEZYe0FG+aqUVV6LKJgGtnE/Liog=
X-Received: by 2002:a05:6e02:b2c:b0:2cc:5f3:5d2c with SMTP id
 e12-20020a056e020b2c00b002cc05f35d2cmr6679560ilu.218.1650368842620; Tue, 19
 Apr 2022 04:47:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220413234845.276726-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220413234845.276726-1-dmitry.baryshkov@linaro.org>
From:   Josh Boyer <jwboyer@gmail.com>
Date:   Tue, 19 Apr 2022 07:47:11 -0400
Message-ID: <CA+5PVA6c79qh8Cvjy=8Zz2T353sGap1h6P4RtYuA0wp54wWEtw@mail.gmail.com>
Subject: Re: [PULL] qcom: add firmware for APQ8096 SoC
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Linux Firmware <linux-firmware@kernel.org>,
        Linux-arm Msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 13, 2022 at 7:48 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Hi linux-firmware maintainers,
>
> Please pull the audio and modem DSP firmware for the Qualcomm APQ8096 platform.
> The firmware files come from Dragonboard 820c BSP available at [1] or directly
> from Qualcomm at [2] (registration is required).
>
> [1] http://releases.linaro.org/96boards/dragonboard820c/qualcomm/firmware/linux-board-support-package-r01700.1.zip
> [2] https://developer.qualcomm.com/download/db820c/linux-board-support-package-r01700.1.zip
>
> The following changes since commit 8a2d811764e7fcc9e2862549f91487770b70563b:
>
>   rtl_bt: Add firmware and config files for RTL8852C (2022-04-13 07:10:23 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/lumag/linux-firmware apq8096

Pulled and pushed out.

josh

> for you to fetch changes up to afc44bb26f7656e4bda1b63e530f787ffefb7609:
>
>   qcom: apq8096: add modem firmware (2022-04-14 02:34:16 +0300)
>
> ----------------------------------------------------------------
> Dmitry Baryshkov (2):
>       qcom: apq8096: add aDSP firmware
>       qcom: apq8096: add modem firmware
>
>  WHENCE                  |   6 ++++++
>  qcom/apq8096/adsp.mbn   | Bin 0 -> 10533521 bytes
>  qcom/apq8096/adspr.jsn  |  21 +++++++++++++++++++++
>  qcom/apq8096/adspua.jsn |  21 +++++++++++++++++++++
>  qcom/apq8096/mba.mbn    | Bin 0 -> 213888 bytes
>  qcom/apq8096/modem.mbn  | Bin 0 -> 7434352 bytes
>  qcom/apq8096/modemr.jsn |  21 +++++++++++++++++++++
>  7 files changed, 69 insertions(+)
>  create mode 100644 qcom/apq8096/adsp.mbn
>  create mode 100644 qcom/apq8096/adspr.jsn
>  create mode 100644 qcom/apq8096/adspua.jsn
>  create mode 100644 qcom/apq8096/mba.mbn
>  create mode 100644 qcom/apq8096/modem.mbn
>  create mode 100644 qcom/apq8096/modemr.jsn
