Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 143163E9214
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 15:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbhHKNDE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 09:03:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbhHKNDE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 09:03:04 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D656C061765
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 06:02:40 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id u13so4441128lje.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 06:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oqknCsbFpsHTcdIkxTiepqaukGt+0UkYz6s7BEcJxW0=;
        b=zETW/RQQHABCPBWuPA21hB380a9P/ufFTxArOH3AaD1VokQTofGE/ANxcRxgoNULmQ
         ipqIJsQMqFLEoW9XU4E3x506DWqChTc44adnhPxP7z+Y8EoXBeqiDdzKLrbAAvHfiinn
         VprQ+jUDCJOBSqYmiykbr+ZwlS8aSuce7cgTxZr+h5hgdVPUjPcuU/iECulFJQU4u6F4
         2yq8GatDqLQXM8e/5sW10Y2eJBsggfyKjvwZMsJc8E8sJ0Dn4MHjpU8HSJZPbFnWjQfr
         YUwBb39mM6Pt78gMM6jhMRTwlS9X5riSOFdusr/5lzS/0ga2yejBkbKMHT7r+VEG96eH
         581Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oqknCsbFpsHTcdIkxTiepqaukGt+0UkYz6s7BEcJxW0=;
        b=HyyIx/35FLE89pgbvNdkTsvLG1o32KqvfUcun3hdMc7enip8de9zPrqWap1SwjdKUn
         sSGMJ562zOxiDeQzEzJbmoIwCIidgifmsR0dbTRBOsSV1/0BJAQXh4aurt+JgEqZDPTn
         2CwA1CYCLpo+mqbfLWRiTWp2rS5Rp1Qoi1eAdxamF+oXAVePOX0PLxFYrR98ZU8mNbG7
         DIzGBpuZGtjImvFS5AetQgmG55swAtMGsoKChfgIol9hRTxpEuS0+pAubtNIgvRh1eMY
         Zij8V6GyT/unSKsPw4y8AYnbtOTKdkjpwa8CbyjiNXoQDNjOAneDzZL+kvEN7U7R1Dag
         u1kw==
X-Gm-Message-State: AOAM530fyOaVPUTpKMooaBYnPGMG0gW9Mlf7j6nsHmIbHbee3LwTeGk9
        LKsHxMIJNSewbRsXQTmlygJD21jGN1FpVNrSeKC73w==
X-Google-Smtp-Source: ABdhPJy/Dd1dNZKjIqWmvk3JaALAdtf1mDPqUYu8w58dq7IJd2Vi8KCQzgqnXLjDFA87tT2tRnXVOB9p0MHdi165UhQ=
X-Received: by 2002:a2e:b819:: with SMTP id u25mr22997754ljo.438.1628686957962;
 Wed, 11 Aug 2021 06:02:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210805222625.40236-1-konrad.dybcio@somainline.org>
In-Reply-To: <20210805222625.40236-1-konrad.dybcio@somainline.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 15:02:26 +0200
Message-ID: <CACRpkdYkoETS02DZWyXR_CzR_m4H=E6NyBa==8vH6A5+My2KYA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom-pmic-gpio: Add pm8019 support
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
        <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy
        Shevchenko <andy.shevchenko@gmail.com>," 
        <~postmarketos/upstreaming@lists.sr.ht>,
        Martin Botka <martin.botka@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
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

On Fri, Aug 6, 2021 at 12:26 AM Konrad Dybcio
<konrad.dybcio@somainline.org> wrote:

> Add compatible string for pm8019 pmic GPIO support to the
> Qualcomm PMIC GPIO binding.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Sadly I just merged a patch converting this file to YAML.

Please respin this on top of the "devel" branch in the pinctrl
tree:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=devel

Yours,
Linus Walleij
