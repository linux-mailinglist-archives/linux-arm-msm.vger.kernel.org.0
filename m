Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4FD36C6982
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Mar 2023 14:30:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231713AbjCWNat (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 09:30:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231643AbjCWNas (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 09:30:48 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2266619113
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 06:30:46 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id p204so13677205ybc.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 06:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679578245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=POEuRTDfD76yVtPjpz6e7Zpqb1wE30JgXP8hEso3HTc=;
        b=HH4+ndnzdvlY3JhCmtdsmp/90t5m9pcor6aLegfw4O4KZmF546FjXyvROi59nAUCcT
         9CUPAsnUIfDww5tW0IQQtjokKMSOilHYJgSTQG/zqDSTrWYxfq891Pv1FONfybGrSX3v
         n4rQ0CC1tdQl6FAXDKihm+vMXte0WnU/qgeBK34WRO1CvVKMHQ2WknGMaedpVDtjjot9
         6n1HffX1hTKqEHApEQ2+yYXTtlmZonqleGh49r8mWf1qMy9gfwhy41ZZCN/gyAIvMRXC
         1r71+xhErz8AQew6JNXWPYB4p5igCBzHehqaJzL5TL7N/f8RCx4+ZUNqnvdIy+kTKHXl
         mSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679578245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=POEuRTDfD76yVtPjpz6e7Zpqb1wE30JgXP8hEso3HTc=;
        b=jpcXMyb4ZxrZoNJLK6PIuYZopSLs/cBrQF6JPIMgRNF2t37fduPZqqlDa/60Z81IGk
         G95BsgRGqL3WSymWSdd4IzdJuXt+ZExnvUkG2JiuSJB5+JQIFiBVlc3iepBi4i3VqYmu
         nmgpSipsvyg3lsO58sXqNT4HnSa7dDuERblZEwpevDIsDqpYddXU5OqndwdvgUbjmSDK
         STqQRlejNQmEh2BLXrlehFOeC3xq1ragV4KzZ0J3oKhXxLxC3PJDaYmXlgMj4yxk9oJw
         ife95OP0HlIY7o9VocmPiQpDx7KoNSfYYwJfNgRHoEtMf3AAu8WYJTJU7DGFIKPicp+t
         0ruw==
X-Gm-Message-State: AAQBX9eLP5iBHQjaNhHJ/JrmH2JebdGHFpG/XwXTI5qIMUJA2VCwCU9k
        L/yCcnEgIcatIKIyqTb7H078fho2zuu8gxJT2M7BWw==
X-Google-Smtp-Source: AKy350bW7YryWmNV10nIYpSf2fDZPBo7gtCJkSo2GQsrHdPOV1g+wopBCzngtDtNEyL3V/yqOc1fy4lJJrO8gRDaW/8=
X-Received: by 2002:a05:6902:1896:b0:a02:a3a6:78fa with SMTP id
 cj22-20020a056902189600b00a02a3a678famr1929129ybb.12.1679578245315; Thu, 23
 Mar 2023 06:30:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230314183043.619997-1-brgl@bgdev.pl> <20230314183043.619997-13-brgl@bgdev.pl>
 <CACRpkdanAd8J2b4Ky=2jmwchVi9_yojnUQoM1OrzW79_inFV4A@mail.gmail.com>
In-Reply-To: <CACRpkdanAd8J2b4Ky=2jmwchVi9_yojnUQoM1OrzW79_inFV4A@mail.gmail.com>
From:   Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date:   Thu, 23 Mar 2023 14:30:34 +0100
Message-ID: <CACMJSeuJm1qA4dc1fftq9JNe_a0dvRnAZvDeG9C5FEXQsqNABg@mail.gmail.com>
Subject: Re: [PATCH 12/14] dt-bindings: pinctrl: qcom,pmic-gpio: add
 compatible for pmm8654au-gpio
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
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

On Thu, 23 Mar 2023 at 09:23, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
>
> On Tue, Mar 14, 2023 at 7:31=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Add a new compatible for the GPIO controller on the pm8654au PMIC. It
> > has 12 pins with no holes.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
>
> Bartosz are these two something I should apply to the pinctrl
> tree or will you queue them?
> Either way:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>

I think it's better if Bjorn takes it through the arm-msm tree if you
don't mind.

Bart
