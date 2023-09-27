Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45FDC7AFED5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Sep 2023 10:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230251AbjI0Io3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Sep 2023 04:44:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230163AbjI0Io2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Sep 2023 04:44:28 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A1DACC
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Sep 2023 01:44:27 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5a1f00b75aaso21101977b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Sep 2023 01:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695804266; x=1696409066; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2a9BLS4u3DgICvLzOii5evpo5Bqh/hTtSobhBQ9qFg=;
        b=LE2UcuhNgnQszwITPoxCxRb6EGj+9wZDVXj8jNtBXELIZrXK/PwPsfrVp/B0h7fmNT
         wVetQbwf5qgRyopDRzKkxfCv2NuyKEEo203fmtpxwsC/EwcNJDf7GSOd6iNPvJblTOik
         uXf6UF+I0r4KCSvj27DewIcTpQm0b9d1m2+Cic5q1Ps60XaRdPvK18a9AhzfRLsKWZ0D
         Gf0nkPHN9KB0dMPP/FocyGX/hrwZuZ8XYg7Ztk/iAoVr2qnsvJCwWDwDPJUrQDT0a6lr
         uDSvsaLB2AHAxm+XOA+h/EcgpJy0Ca/WFC5Nj2nOCKXSDWHKHyfgL0oGCrhG3vdjzVaV
         mDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695804266; x=1696409066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z2a9BLS4u3DgICvLzOii5evpo5Bqh/hTtSobhBQ9qFg=;
        b=C5vlBFWqDrTBgiVfDgFEbQjqOBnFzwoLGVSFCVhBg0JFJmTMuzCqboMfxsFPosOFPp
         A/L+IyOF/q0GEsUD3UbPwbMe0ASmqlguXNwNElrp9rsWn7Rh1KgP4r2IARpJFgILh0Em
         rLoQSQk+jBrhWmh3aBs1OFNUlqrsMZWdsv1LwpjH1WlCijdJbaNK+akl4y0jL596Ti12
         HXt9fMQRzEzlTU67YKzk8sf7jRonAhNk9cXp6oGCJkYQeyxjGHuZxaLMg17XavA0Bclr
         1r30z8HkkcTdp7PejKnGJCqVWc+DMV2Xb35cYAz1iWxfnJhvq9aHjVAXRWlu1nDv4TcH
         +Caw==
X-Gm-Message-State: AOJu0YykL7iWPk4xp1zAlRP2szWgSSSh+bx8j7L+zopNVK/BkbhyUpN4
        UZi004OTOz13Opk1pJU4CHZJ6UXZXhQ7QtIoVwcF4Q==
X-Google-Smtp-Source: AGHT+IFI3OXUIw2YZjlJU3xxbWIddHpKtE/ek2D2wzGlJ0JTneFMoPW0I+2IJDJjj40UcgXnDZmQNbomJZ1OppPYI68=
X-Received: by 2002:a81:c253:0:b0:59b:f736:4948 with SMTP id
 t19-20020a81c253000000b0059bf7364948mr1497316ywg.33.1695804266446; Wed, 27
 Sep 2023 01:44:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230923131432.21721-1-matti.lehtimaki@gmail.com> <20230923131432.21721-2-matti.lehtimaki@gmail.com>
In-Reply-To: <20230923131432.21721-2-matti.lehtimaki@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 27 Sep 2023 10:44:15 +0200
Message-ID: <CACRpkdbs-k2QU9XrZj1sUE5e8QEdfQ=AWhxtvtxA9d7fkC+NOQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: qcom: msm8226: Add MPM pin mappings
To:     =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Sep 23, 2023 at 3:14=E2=80=AFPM Matti Lehtim=C3=A4ki
<matti.lehtimaki@gmail.com> wrote:

> Add pin <-> wakeirq mappings to allow for waking up the AP from sleep
> through MPM-connected pins.
>
> Signed-off-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>

Both v2 patches applied!

Yours,
Linus Walleij
