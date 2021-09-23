Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B82A241672C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Sep 2021 23:11:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243278AbhIWVM4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Sep 2021 17:12:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243209AbhIWVMy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Sep 2021 17:12:54 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C275C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Sep 2021 14:11:22 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id u18so30332831lfd.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Sep 2021 14:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j2kl8h+4ATUGvv+z4Ez87ArKkPHKBbbEw0WTQVzieXs=;
        b=jOWtkKpqc7S5Kn1C3py8QN/jT0FuGCpokXxnWw98ZKH4rLwU57UPGk0+slHElmjqBE
         hGu63FF+1bDgx13Lrhy96S60ckNSOs2CYRLWbx7E0Ir0HBIFBVNIor1IPtUE1xiA9CGo
         VY8YDBkiLa6jJSDmH1ipdcmqxXtZFQKvTC+lm90OwligXVJ4/u1iNV5AILz5sTYOI2op
         ZSM7mmXtSj2JKvGgmsXnfsU1oc+pSmQwuvjdWhuUsp9YIz6EZNZbPfkGCjXUH2GP/aLu
         ZnTFq9D0hvW/u31qafRGq/+yuKcsSW2dw5gOkr+LEZdjPI5SI6AQpx25XKr0XYiqufhP
         qSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j2kl8h+4ATUGvv+z4Ez87ArKkPHKBbbEw0WTQVzieXs=;
        b=QiRYSsNkr66vtFmehYD71VU96ERGR8ujQCkMST0Oi6IZoa4B8Ii7R9NQepupQNchig
         Wrz701zvzhU6onty8fSuJdrJfvJeGFvheQ0oLj7CcEuG4yF46N3btYxGRCjah2IQbjmt
         BFYP37QgqHVrkaVCW/2ApkmHV4aoFmrjQVZyMjjgfDSCE8TbPMdigeZZWJ1s0C2oFjXu
         iFQ7j7qQlzO3zk53j47jkKvLaE2nlylERzSGAzwIJuXca7D2r5Ox+QXDbNCwwZ0MbBpN
         Gw7OYejTBw01M3SG1eV+HwdtY/MHoo69W4F3+WtpS7cMrvjYN+b9bMhaQM9yTIQ/H0nh
         jBIg==
X-Gm-Message-State: AOAM531kzhglPhF2/7xtgR1GEmB+/T6gDz7yq32mLjWTEjVW17+S4Sd+
        ELzkJyS+JSoFeIuOzNFywRxJYICyDq31MFOYRj3cCg==
X-Google-Smtp-Source: ABdhPJy9hTS9GoHoGmMxbglABqy5TnI8Hc6XNBF5d2W/i3muZBAgBEGKdj5ik2uZqliBCGCi/EaM1fHMnx+/0ay0elE=
X-Received: by 2002:ac2:4d03:: with SMTP id r3mr6421581lfi.339.1632431480892;
 Thu, 23 Sep 2021 14:11:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210923161450.15278-1-konrad.dybcio@somainline.org>
In-Reply-To: <20210923161450.15278-1-konrad.dybcio@somainline.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Sep 2021 23:11:09 +0200
Message-ID: <CACRpkdYugrxY3z08tv=_yBb3+h4RggUSWjEakuM6W=kLsbx=QQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: Add SM6350 pinctrl bindings
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
        <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy
        Shevchenko <andy.shevchenko@gmail.com>," 
        <~postmarketos/upstreaming@lists.sr.ht>,
        Martin Botka <martin.botka@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 23, 2021 at 6:15 PM Konrad Dybcio
<konrad.dybcio@somainline.org> wrote:

> Add device tree binding Documentation details for Qualcomm SM6350
> pinctrl driver.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Patch applied for v5.16!

Yours,
Linus Walleij
