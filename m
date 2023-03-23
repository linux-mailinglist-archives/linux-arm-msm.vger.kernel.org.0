Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9CC6C6189
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Mar 2023 09:23:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231256AbjCWIXX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 04:23:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230515AbjCWIXW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 04:23:22 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09E66EC4F
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 01:23:21 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id p204so12743097ybc.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 01:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679559800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0Uj1D6Vqv6eak6KS2dw5QFFUEfJrY+AgAxpx6hngss=;
        b=aeJEBmKYCou/2yRAhdrhEFObNMaQFg/4BWZrhU3vILJzHRL71UsWpxr4B8Wd16IORd
         d+sQ+X4oT1/Dy1afmOCOEeHYl91vNz+QIDJxYMQafU011ZH7x14k+mDHdbbYe6PrSeBC
         oe7dnnNpivzS368qIdpPFl3eNt5oHn5Tb5CUuLjUBnTQuNYzfetoDCLC+wRuK6UsY2II
         3T255Itm6cM9tmSgN39G6V9B4TZlGCRvIIz3Vjt5oZJbIuW4CSKnp6sxVNJ5jEQkFI7j
         5ozs8GDgzqo/Ma5SKiHcuoWx0oima6ShmRymvHWJqHWiIoamtRaDH8E6jG0IwawnhtWj
         oDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679559800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k0Uj1D6Vqv6eak6KS2dw5QFFUEfJrY+AgAxpx6hngss=;
        b=8C4PECrvOCPPj/BKqYJ6HkXWLlmHanNVbJ05GP5G/pO3eyZ48T8S0TP+y5N5aZJCKy
         t05ZmEAQWLEi8ohwmliMshEetcCACRfIIJr7etMI+GpkaVgVlQHqR/f6iKcCUXIFtGOV
         rWWFwIltsl3CH5Bx8D55LCxzH2A+UOkrdDpEpPpM+RR5cknzEH2A0VldVQ5M3BYtPOFG
         qZFtYcBhHgkcFhpCTX/6W4LwzQ/l1oSKP8xPsBPxxWvoS1xXnXx4GWC1R0XLt8627Anj
         8J0xybhERb+biSrY1BeqplsQMKI3nsoB9Wf/HZDLrjslP6bsZt7USIhpjHvWZ+KIwysU
         TI3Q==
X-Gm-Message-State: AAQBX9dbuLVzESTlvZS7RHfl+fPm70abCY/zW37KzmiGTlvoBr14oLbS
        13mIKr6I4u9ubcWgX5NTlJa59pY9WmpYiuZxp7HzBcNN5rCcojaI
X-Google-Smtp-Source: AKy350YPGJ35B9iOe8VCljZyntYq/QtonM0DlTvDbtRALy1W0Ec0fsVbAquagmZ2Q4I46+NueAFlfzuUhJ0Qb17jOC8=
X-Received: by 2002:a05:6902:1005:b0:a6b:bc64:a0af with SMTP id
 w5-20020a056902100500b00a6bbc64a0afmr1780411ybt.4.1679559800269; Thu, 23 Mar
 2023 01:23:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230314183043.619997-1-brgl@bgdev.pl> <20230314183043.619997-13-brgl@bgdev.pl>
In-Reply-To: <20230314183043.619997-13-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Mar 2023 09:23:09 +0100
Message-ID: <CACRpkdanAd8J2b4Ky=2jmwchVi9_yojnUQoM1OrzW79_inFV4A@mail.gmail.com>
Subject: Re: [PATCH 12/14] dt-bindings: pinctrl: qcom,pmic-gpio: add
 compatible for pmm8654au-gpio
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 14, 2023 at 7:31=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Add a new compatible for the GPIO controller on the pm8654au PMIC. It
> has 12 pins with no holes.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>

Bartosz are these two something I should apply to the pinctrl
tree or will you queue them?
Either way:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
