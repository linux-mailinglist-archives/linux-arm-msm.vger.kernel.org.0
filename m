Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B09C355114
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2019 16:07:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727919AbfFYOHo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jun 2019 10:07:44 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44737 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727705AbfFYOHo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jun 2019 10:07:44 -0400
Received: by mail-lj1-f194.google.com with SMTP id k18so16393765ljc.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2019 07:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=24XJTrHa0Yc4s3sKxxyNRNMHk8lPxt030dDP8xPw5N4=;
        b=dBTA9gXzvS9VHnSTxJ5VXq8BgDgH6lEyEC2arXbYVK3n3XqvVQxKWCN0aZsPBo7dNb
         NDF6mOHe5LhwpJp06hWsnvYcL6kDXe7UOikKtHyR3zJr6c8uDR3bW9CEJjbwSMqB9Mt5
         LuXHubjT/cdVNrbJHgjGvpV1HB82R5cvlHQ60TwKD77obG/HNRbkSByaGpwJFz5TnINr
         HLEK0cRLiOvK/8pvjvW2zGYDslsRXV0MmQkXndzpPlAtDceFvMD/dgrEU5rDSMLVAgXy
         g0Q6tT5nnF/hsp1ONNrpUiYScx47fPgEFw4n7+oMQkHkQAnPt3kpMz6KIU3p8M6g7xHZ
         /LIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=24XJTrHa0Yc4s3sKxxyNRNMHk8lPxt030dDP8xPw5N4=;
        b=jOax+Ai1gBAHgrovQ/hRTDTVf4B94jxc9sEOOEtFHWFiuEbOV6olNfshhwiiNBzFPu
         l+WhW1DGIOopOZyEAL6SN4aBHtfCV4yWvkB1BV6OtkmZ2a9aFBe/HrrV2oDslyjzsaOI
         QrGUaqq3oCgpIVipGfYqvU8noOrd1Zd9sXkoSLFdfpm8dKd2d5yWOyOOQR4zxIqTmUlK
         UTG4FIIOD5qOu2oIztj5OK8v1u5kp1Sws5sc9vdHcuyuDaK5u1XplVkJhVH57MyCXVaN
         swjuF89HodvNuYHnmhpZh+R/xGja7kt4HP/bHkI08YWlxBOtvgb3/XiXNoSfQh5/HqBU
         GmfQ==
X-Gm-Message-State: APjAAAV2B+Lk90TO2uDUjQPWdWrybKyCEgrGiSQdWDHT2oJzxwEeBufg
        iBsT7Rk6Ubs80hp7mMyi/AZE9CAw+n/RyLYiec5+Jg==
X-Google-Smtp-Source: APXvYqyjrDxpNXoWoBRzWyreU6t0oFZefNmzaDjlnTXV6ya4jhyfq+7zm2Vv8USOB8y4emzxmQG1awzZwLIh1cr2/8E=
X-Received: by 2002:a2e:a0d5:: with SMTP id f21mr52627090ljm.69.1561471662514;
 Tue, 25 Jun 2019 07:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190621202043.95967-1-natechancellor@gmail.com>
In-Reply-To: <20190621202043.95967-1-natechancellor@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 16:07:30 +0200
Message-ID: <CACRpkdZFvNNodNas2hQ-4iuS-UgHapMR-Y8f715Hbj_PH04iRQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: sdm845: Fix CONFIG preprocessor guard
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        clang-built-linux@googlegroups.com,
        Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 21, 2019 at 10:21 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:

> Clang warns when CONFIG_ACPI is unset:
>
>  drivers/pinctrl/qcom/pinctrl-sdm845.c:1320:5: warning: 'CONFIG_ACPI' is
>  not defined, evaluates to 0 [-Wundef]
>  #if CONFIG_ACPI
>      ^
>  1 warning generated.
>
> Use ifdef instead of if to resolve this.
>
> Fixes: a229105d7a1e ("pinctrl: qcom: sdm845: Provide ACPI support")
> Link: https://github.com/ClangBuiltLinux/linux/issues/569
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Patch applied with the ACKs.
I'm sure Bjorn doesn't mind.

Yours,
Linus Walleij
