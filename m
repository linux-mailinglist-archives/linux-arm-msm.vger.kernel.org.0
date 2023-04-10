Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3FB6DCD46
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 00:09:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbjDJWJf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Apr 2023 18:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbjDJWJf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Apr 2023 18:09:35 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5868E70
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Apr 2023 15:09:32 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-54c12009c30so231713757b3.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Apr 2023 15:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681164572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ExqCcoy3bWj9jdGV9Q3NacWOqs4Dtk8vHL8H1J12RJY=;
        b=BKqvHMuHlRPIU7wXVr5olsFhIZQX++5QDybdKhcnOhN4x4kl0/zeY+UqXC+V8SjSiG
         jruquk5A1NRODV6/T+RII1S8IJ+qQAEVFbsKDjCQuadaVc8MC0d7fOIH2mzsShe1SHne
         niX+lSoCCi9RrDLsYAqtH4S98S9BKsDGPhfhCOhqgE1QjGuHBarkz9zCOFBKjkba+zDO
         ZAg5AY1YZPOFE5zCKJxCQlUa7nQzZr9GSrziAkjpr6RZetzTNZVqCSQhhE9MxuabRnvX
         LSPqpT9Ua+N+xcIpy/Dtc4Kd+jDSogAAt597r+bscFQ3DGoCFEPhE6hqHWNNiOX659sg
         4bgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681164572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ExqCcoy3bWj9jdGV9Q3NacWOqs4Dtk8vHL8H1J12RJY=;
        b=G9GmD+xXCkdAUalrhNxQ0Vjiw4rOUUAyKg5Bv3QVqXjQSLVuuQ3g34A3cX6YOjA4oK
         FofMAMFpQFjB7+9z6wQ3x/BGom4/VSjN5S6vPI9ZcMNOd42vnPwqZbWMU5RcXFPQWOfr
         kfh7fjPrHbDHjJtWft0FwK9rPBBzJF3tXqfJzmjeyodD7c6pwt6uQSPek8DY6OPfEkmv
         qSO13gC6uRrTPP64uNByrtk6Mkn1x0E1bxFFGnJ5LHpUeD+2wuDOlurq0RkSx/tck0SB
         TEhnqL/QEQikmBOmIvr4D1VLmM73JhZmsTNiUY3ymlTe70qhXQ8YryRHvsfPwKUSCAXd
         sVAw==
X-Gm-Message-State: AAQBX9dgU3oyxWydvTJkHvYIZ7XLt1oAokfnuEO3bl3atf6dR22VY9UB
        AAIvgLtFfhx9J2L+76xDv27QzCUDgj4e7dGERq08G6AxIb3UPTQl
X-Google-Smtp-Source: AKy350a26EOdXNrw4MlpwtY9Dz/Z+hhGFiC4d9G8eVMorvZSwWjglGmlnnmKRrMbFTj8viOMnnU18qFJFz1Fh/3VdYo=
X-Received: by 2002:a81:c904:0:b0:534:d71f:14e6 with SMTP id
 o4-20020a81c904000000b00534d71f14e6mr6436772ywi.9.1681164572146; Mon, 10 Apr
 2023 15:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230327125316.210812-1-brgl@bgdev.pl> <20230327125316.210812-13-brgl@bgdev.pl>
 <CACRpkdaYHaJMn7w_q12V3Q0WW71-U_kb+XsR1tNsirF35xYEoQ@mail.gmail.com> <CAMRc=Mf3d+ZmRs+Rj2HeWifoL0Vqzszxh_hUFDFq4eyvfgKQ4w@mail.gmail.com>
In-Reply-To: <CAMRc=Mf3d+ZmRs+Rj2HeWifoL0Vqzszxh_hUFDFq4eyvfgKQ4w@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 11 Apr 2023 00:09:20 +0200
Message-ID: <CACRpkdYZj69yVitTGV9h5ytec5pFKKQwGbhPu1Ahc2HBfsqp1Q@mail.gmail.com>
Subject: Re: [PATCH v3 12/18] dt-bindings: pinctrl: qcom,pmic-gpio: add
 compatible for pmm8654au-gpio
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Rob Herring <robh@kernel.org>
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

On Thu, Apr 6, 2023 at 4:09=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
> On Tue, Mar 28, 2023 at 3:24=E2=80=AFPM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
> > On Mon, Mar 27, 2023 at 2:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev=
.pl> wrote:
> >
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Add a new compatible for the GPIO controller on the pm8654au PMIC. It
> > > has 12 pins with no holes.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > Acked-by: Rob Herring <robh@kernel.org>
> >
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Counting on Bjorn to pick this up.
> >
> > Yours,
> > Linus Walleij
>
> Linus,
>
> Bjorn picked up the arm64 patches but these two were skipped. Can you
> take it through the pinctrl tree?

OK patches 12 and 13 applied to the pinctrl tree!

Yours,
Linus Walleij
