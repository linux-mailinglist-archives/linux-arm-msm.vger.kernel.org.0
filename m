Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6368F430C5B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Oct 2021 23:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238397AbhJQViF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Oct 2021 17:38:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235598AbhJQViF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Oct 2021 17:38:05 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E70AC06161C
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Oct 2021 14:35:55 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id g8so5225276ljn.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Oct 2021 14:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8XHO07CjfAiTXPl758twudtVcw2vHwNkceOH/ry/8xw=;
        b=guYeVmWXzDbgRUAHIqydQ1HPqOt9+ayfTiWOPrnO4himbg2lwQVeWQJmvM2V+5IL5O
         Sqsn+CIzEYDk+fFZzCDYhqj0Ie7z6p3Yc64/jMldGYEh7a3D0z5Fzjn0Jmpqlf6eHUSz
         GtEtBhByBNHr7gyaqkVqkqrKDBZIEWcEaV599BInyWQHHEPaYNdH3YVvq2nGsKSnicKz
         9D+q1MnvvGrE1oBMxIrCPnJ1wqqvxQQ3RhDDAMCcZeMT7BNwtW/+1gq+GZSKA62EDZdZ
         vffq02QkUL4oINr1iHkkQYENu8NQGjm/b7WJLz4lpClrqwyRzvfzpReaOJVJjH9QtiPH
         SINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8XHO07CjfAiTXPl758twudtVcw2vHwNkceOH/ry/8xw=;
        b=QyFvwmTjqVoYtkTN43tFytm/doWLCBSxRJ8T2WcUJ64AYnmRcLG342WQvWcVHG+/Tf
         0y7J1JZv10A8ZI+oKtlx+p1GljcI2tRHbKy8iCgcGwLQWoxWP4faxB/A6KLGKL0Yavqj
         WUQk/e+6xbdEyU2K14j0gXYhlieXNYOkLUsbf/psR38/12GeARfRTxJAu54FEdLPh/L+
         jHK8rxKDAIt3R06FFDXsRYjZuZus3ZxSI42/hgSjWtMJcKGhewBxZj4EztfNsvbdH25X
         49FjIW9dvWA5uY47GyCd/b4dYkdtSZ6w21HQoVZHflGl82zzoZGasWEG+sO09ZQJXksE
         kNvw==
X-Gm-Message-State: AOAM533Cz0WK8qsuaumELrPykxfF+qTSxjN7GDtO5MZBDTsRH1LSovDw
        cjIE11LqXZaCqc05nticemmDTF+3EbVJ8nmPHmf0Uw==
X-Google-Smtp-Source: ABdhPJxnealbYRqpGVxJqqNmVYfGtFJz7kFs75zSNWhK+f6ZtZcG2rQCYhHLVT/ikteFpTreTMXZpzpCbsps0uX3ltM=
X-Received: by 2002:a2e:7f05:: with SMTP id a5mr27633482ljd.261.1634506553490;
 Sun, 17 Oct 2021 14:35:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 17 Oct 2021 23:35:42 +0200
Message-ID: <CACRpkdbuJmrnPUtOvchqS+h3upuwnKPUkFqWyW7bh-PFBanW+Q@mail.gmail.com>
Subject: Re:
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I queued thes patches in the pinctrl tree for v5.16:

On Fri, Oct 8, 2021 at 3:25 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:

>       dt-bindings: pinctrl: qcom,pmic-mpp: Convert qcom pmic mpp bindings to YAML
>       pinctrl: qcom: ssbi-mpp: hardcode IRQ counts
>       pinctrl: qcom: ssbi-mpp: add support for hierarchical IRQ chip
>       pinctrl: qcom: spmi-mpp: hardcode IRQ counts
>       pinctrl: qcom: spmi-mpp: add support for hierarchical IRQ chip
>       dt-bindings: pinctrl: qcom,pmic-mpp: switch to #interrupt-cells

Any breakages will be fixed when Bjorn applies the DTS changes to his
tree.

I wonder about the MFD patch, maybe Lee can expedite merging that too
or ACK it for Bjorn to merge with the remainders.

Yours,
Linus Walleij
