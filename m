Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38511EFAD4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 11:20:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388060AbfKEKU0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Nov 2019 05:20:26 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39488 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388148AbfKEKU0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Nov 2019 05:20:26 -0500
Received: by mail-lf1-f68.google.com with SMTP id 195so14652316lfj.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Nov 2019 02:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aZMf5UsxxKr/Wzx6N1R8Xh0rwHg9hnGGrM17K2ji2r8=;
        b=CSwXlIEVYFc4Jctxr671wke5+uqVmz24yO6wRzXgG+4vZ7rvFttrEj/9E6HsPyQV8M
         EoSyJag5yVbn8kNLau6PekW5igDWul/0EXxncc1HjYD/1OjPpiACC+XBydn76WMXQiQK
         4HTN9P0oL/PPddzQshafUT+FTu+xGABlicRwXcJSRV4FUtv7RE1Wa5godHAFovRQN+MO
         Bgyu8A9oVwdRqlQQgPJpNQNgKcv55yQJ8RsCuEX7R2pPtNCacZ0a8OnwHEExH41wXTbC
         ug8gNTrO3lWZDWA0V7EIA7fAProsFxma33LNONVDVwA0RqmgUyuKRE+mEbnKHffMhHe0
         P4dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aZMf5UsxxKr/Wzx6N1R8Xh0rwHg9hnGGrM17K2ji2r8=;
        b=tzkaBuInYQSF+elL3VOzXZVgj6M9u2LzWf4JC2Vyms2I+90ZJLeDAdI5wwJ+t56P6B
         ib41VQk32+ZCm8raeNenN9KHJBvsq+eOj/2Df3jaYAaTXm8kGrONXCiovqOm42MnDsuz
         vPOPtiHACPy5nbpf073aBtgjHJfeM+jBgKeGnpUX8Ra4wmQirxIHGOuR0vKVRoc9x0z1
         MJLRO71SokiTZQgCL6ERjA535vDPSFxrdSjNLFSzsN4HSYxYML25cHVtSZckzcl5splX
         3AovIcTkvIQiTulY1hfJy3T+EmWEdGX5qsq9tUvJD2ZH/6Qxrv/X83AebaoGzxxgH9Li
         2o6Q==
X-Gm-Message-State: APjAAAVSEmrGI/vDGQ41FBnePpOLh9bJ3rWfR72whFHF/EBStk/o2gPK
        p7wbqEBSoqJmXD+ccht2WZYp/sAvHvxvY0wZYAHHPg==
X-Google-Smtp-Source: APXvYqwVNTHw3ygMtRaDzq57iB9dmmzq5+vBktDimwhk4AmcqmBogMn1KZypFP+bmEoAIN4Hp5tPdytiZS8mIWKxeuU=
X-Received: by 2002:ac2:51dd:: with SMTP id u29mr20271705lfm.135.1572949224408;
 Tue, 05 Nov 2019 02:20:24 -0800 (PST)
MIME-Version: 1.0
References: <20191031103507.30678-1-kholk11@gmail.com>
In-Reply-To: <20191031103507.30678-1-kholk11@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 5 Nov 2019 11:20:12 +0100
Message-ID: <CACRpkdY19=yp+yZT+=7DwGUipu-5YSkCKzbLfO=6=HLUeDj_Og@mail.gmail.com>
Subject: Re: [PATCH 0/4] SPMI GPIOs and MPPs on PM/PMI8950
To:     kholk11@gmail.com
Cc:     MSM <linux-arm-msm@vger.kernel.org>, marijns95@gmail.com,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 31, 2019 at 11:35 AM <kholk11@gmail.com> wrote:

> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
>
> This patch series enables support for GPIOs and MPPs found on the
> PM8950 and PMI8950 ICs, usually found on boards using the MSM8956,
> MSM8976, MSM8952, MSM8953 (and APQ variants) SoC.
>
> These are important to get the PA_THERM, QUIET_THERM MPPs enabled
> on PM8950 for standard thermals (and other board specific ones,
> where applicable) and GPIOs usually used to enable the audio mclk
> path, the wlan sleep clock and sometimes the eLDO for the WCD codec,
> plus other board specific paths, where applicable.
> For example, on the MSM8956 Sony Xperia Loire platform, this also
> includes a GPIO for the USB switch and one for the simple GPIO
> controlled vibrator included in all devices for this series of
> boards.
>
> This has been tested on Sony Xperia Loire phones, including the
> Xperia X Compact (Kugo) and Xperia X (Suzu).
>
> AngeloGioacchino Del Regno (4):
>   pinctrl: qcom: spmi-gpio: Add PM/PMI8950 compatibility
>   dt-bindings: pinctrl: qcom-pmic-gpio: Add support for PM/PMI8950
>   pinctrl: qcom: spmi-mpp: Add PM/PMI8950 compatible strings
>   dt-bindings: pinctrl: qcom-pmic-mpp: Add support for PM/PMI8950

These patches seem very simple and straight-forward and
noncontroversial so I just applied them.

Stakeholders can complain if they think otherwise.

Yours,
Linus Walleij
