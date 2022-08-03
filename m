Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65BD458922A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Aug 2022 20:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237942AbiHCSV4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Aug 2022 14:21:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237855AbiHCSVz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Aug 2022 14:21:55 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39D981A38B
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Aug 2022 11:21:51 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a7so19959304ejp.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Aug 2022 11:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=altzbewDE/Wwwgxa1r3vizNyU1k5iQam4KRzm34xggw=;
        b=KV0eLWruUwaMIjIN+TLkEejbtz4M25VvPf+mMKE/qdUUQAMgh0ImEPVq4lO0UI5LQp
         H+rj8qGzlImNhA/w++um3Vsfebu0uNGKpdSjnkYWbOE5fSGDutzvpnWVhfzGxrD5szdd
         bPJAqVhUqF8QXR4rkudQ7Fqr7K09F8z+dZCJeDsnlTWCrKRxd/ZeEiw+ONW1erZ5gmaZ
         FQdcG53MqxjTcrQe2rhdDg4rEQOWVM8UtgTitVJ2YHfPMkdLVPr5o9jWADi2Cj+3wkGl
         xDL/iKcxoSDIEwH/+usTHQEJPH6Sj4WaoO9WVGZdPpV/RQp8JI65eShqNwzTvYWHhgr4
         Qd5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=altzbewDE/Wwwgxa1r3vizNyU1k5iQam4KRzm34xggw=;
        b=MohdmZZWHGj3wBuYGVq5H5tdQ69ZBCO9INhpJ5PNjgLO1EvgzwfgFtVB/3WaIBaBUO
         Hb93ZMMMLUB838T35YmXNTREJmxm5dsYIbQ48Kxp5opGvJfr3V45dUZGkGoRxHl2PggA
         bc1PMIQeQVx1wPEO51aX7UW0MpK3xvljIL543zAMxYkj4ptKnCQi0XOr20heiUqJKfND
         TJH+TroewxwH4kqHkz1L0rsCnLNbRgCsp4vTooyMXtTPrWqq8aTMMvNpUU6nlX/GuMv7
         M/GyGkV1hp56M5DYvZDrTFyon0mALmtY0uqc9j5hF2A4Aw8kCuUojh9bLsrg39hYnS2b
         G8ww==
X-Gm-Message-State: AJIora+Oc9f+wm3lGLDeY9o05MW86EGPqbOdlTrEYVEKJVrSVlickazG
        jPXK5Pb7aeYiQRR9No4oZ9BDA+n+NVXzkRctBxc4Pw==
X-Google-Smtp-Source: AGRyM1ttga43cTYdEGBr+E0O1w9eKgXTrUP1AahWa0gawLTIeHHKdh/aMaZ7BE4vxr7VjbsHG0yboWsmwhtICvtHyTc=
X-Received: by 2002:a17:906:2ed7:b0:72f:d080:411 with SMTP id
 s23-20020a1709062ed700b0072fd0800411mr20905120eji.203.1659550909766; Wed, 03
 Aug 2022 11:21:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220803015645.22388-1-lujianhua000@gmail.com>
In-Reply-To: <20220803015645.22388-1-lujianhua000@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 3 Aug 2022 20:21:38 +0200
Message-ID: <CACRpkdYVLeAU5L0yGQqBsqk5TiQnoSGwbBBums=uNiX8r5JDww@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: qcom: sm8250: Fix PDC map
To:     Jianhua Lu <lujianhua000@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 3, 2022 at 3:57 AM Jianhua Lu <lujianhua000@gmail.com> wrote:

> Fix the PDC mapping for SM8250, gpio39 is mapped to irq73(not irq37).
>
> Fixes: b41efeed507a("pinctrl: qcom: sm8250: Specify PDC map.")
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
>
> Changes in v1:
> - fixes typo error(mapped target is irq, not gpio).

This v2 version named v1 applied!

Thanks for a quick fixup.

Yours,
Linus Walleij
