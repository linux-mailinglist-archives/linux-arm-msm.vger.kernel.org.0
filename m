Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9EAC2A0134
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 10:23:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbgJ3JXW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 05:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbgJ3JXW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 05:23:22 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AB52C0613D2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 02:23:22 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id b15so6751007iod.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 02:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CBA+zo6LaSoFeL0OA7IbUTdbUJNI/GOykxoTxkhm2nk=;
        b=UO5IfL8R5QFcwjro3zMCatag08rvnj7MG+rIfVf8CZY1PLx4Z0SoVQtu3DvG/0uf2N
         YIRVCW8AOfZZVXKBcMTqoLCPZMQ5Kdr+w2h4Jyf/fzhu6jZud64aAlrfyOQbqcC7FZig
         6RxtRmtJurOtE9CKuMpk1+tU/vGvKGRNHkDxmw8yP7WTwOpd+GVyHY20Brqmw6oBEwuq
         QvZM45AWJDmHUwcapmaYrBa+pQ32oebVFliheC058EYqeCLz6IBmN6i+RIW2LIsORGah
         PPcv4Mf1Xo6nq/dRGbcCEpsqtymMwkMc30l3lLgjDsRtVNql2yXNOini1QEbK9TJHv/h
         xoFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CBA+zo6LaSoFeL0OA7IbUTdbUJNI/GOykxoTxkhm2nk=;
        b=Aon72i07+2C9pRn9P9BtAinNMY2rmkjfCamkkxXaV7vfmXtfS0+Gk641RXu6usXVdU
         +kUdVet8NbHAR7sqBJuYcE42WzylVYbiaxXu6CtNsm0g1BvoYhH5hHJqgmFYXbrkFRHJ
         2Epyq2cofQiPs0q2TitMnRhb9pHfhqsvYPzqRREqaVTZlVXcdUFSmNVNe9Zrh8JbGe5M
         M1Pz+kCtSUtQ0zZUhoHSnfXuow9hY/LAFUaeI+ddhwlB3G4jr6ufktJ/UmF/Mm+ZqF92
         5+4SGLmYgzE1VE/5oztDIQDE7LeqbcFj+IirT0e02Ws4Qdftuf3qSt4dgUOvGcy+NAGI
         OeVw==
X-Gm-Message-State: AOAM531STGKwd6D+aM5gTQpsH8NinBVeND8foo9BItvV/R3ypy0XYKc1
        QKNexDy8hxX/ZFn3DzcKqbFic1tPRL/nWYIupLxHMg==
X-Google-Smtp-Source: ABdhPJyH+9c8dw1FcU0h83mbgXToEcZDNuIgSVvIgnpkYquj90LicUxQtsuxCBKhNY9sYkw8F9Rt7qhEa3t2HuwKEyA=
X-Received: by 2002:a6b:c8c1:: with SMTP id y184mr1050821iof.109.1604049801372;
 Fri, 30 Oct 2020 02:23:21 -0700 (PDT)
MIME-Version: 1.0
References: <20201030075724.1616766-1-ajye_huang@compal.corp-partner.google.com>
 <20201030075724.1616766-3-ajye_huang@compal.corp-partner.google.com>
In-Reply-To: <20201030075724.1616766-3-ajye_huang@compal.corp-partner.google.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Fri, 30 Oct 2020 17:23:10 +0800
Message-ID: <CA+Px+wXPRg7aDU5+vr6R_BxuFfhuDeG3iEQeAUKWNtX8YmVC1Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: qcom: sc7180: Modify machine driver for 2mic
To:     Ajye Huang <ajye.huang@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        ALSA development <alsa-devel@alsa-project.org>,
        Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 30, 2020 at 3:57 PM Ajye Huang <ajye.huang@gmail.com> wrote:
> +static struct gpio_desc *dmic_sel;
> +static int dmic_switch;

If you really need them, you should put them in struct sc7180_snd_data.

> +static int dmic_set(struct snd_kcontrol *kcontrol,
> +                   struct snd_ctl_elem_value *ucontrol)
> +{
> +       if (dmic_sel) {

if (IS_ERR(dmic_sel))
But I think you don't need to check dmic_sel.  Suppose your _probe()
already returned error, the code here shouldn't be called.

> +               dmic_switch = ucontrol->value.integer.value[0];

Looks like it can be a local variable.  You don't need to save dmic_switch.
