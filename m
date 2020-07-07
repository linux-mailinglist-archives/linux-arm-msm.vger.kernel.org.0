Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7645A216C75
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2020 14:03:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728047AbgGGMDH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jul 2020 08:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728029AbgGGMDG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jul 2020 08:03:06 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34F2EC08C5E0
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2020 05:03:06 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id f5so33717631ljj.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2020 05:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YH/VxHJ3AGs6CZr/wDufvaXGnXEL37As4napaZvmJwI=;
        b=Bgh1b8lny6xvbW6+ct6t0vaU1Jiuk1+UbOS0d8piluPPBGIXBoT6fW7BVBSL7RHC63
         fEwHuYtJRRgTOHhbS2rN6Tjv4NtcokJr8Fuoa7BvDxlhthTf17pY3yOCrhuNLV3gkrYG
         Q4R3d+gPzj9akoo0jD0im55k7lI7uXK4QpdEzdJsmEJxDe4Nb2ojQJhKD+UQ+YtvdV8H
         ZTjUu6RzuTMzq6LAahoT55UVyxUCAbEEUhKJ/VvC7TrN4hv/IrpXz4dTMVhhSmFMYZNM
         xcw1PbLOYtWC79erbC2q965s5SZDvI1mznoOTC7Wo6tcIWKecnXnph1xJwDHHTVaozHM
         aPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YH/VxHJ3AGs6CZr/wDufvaXGnXEL37As4napaZvmJwI=;
        b=TQdQI9p6H/NHMB2AUkYK4sfDLDc6REah7P9p5cr4BX9strgO7oMDpQfCK87C/Gg1Vh
         O+Y8w7aQs1t8X9eR4gO2+7u+u6LYG4YjccyC/LcBo0Jn5iHiEWy/yHrvXTMsRRnvCVgY
         gQhPXobNIXhMM33fmiWWy1DP+G7UUghOmV4EoVLwCTU0x+Ntwh9IR+m44ev5IeTU9J8X
         39KmQg1CH7rOPBykH50u6R3kgW4xari7OMEK8WrBxKdrL7hSBw6WQfeG5Gj8Y/uf7cbE
         VZV2M56aWFYxc9Qcdld7tr3s+WH/RHnzh0YFNJ29uSEMfx3ujO90exYS6RK2ZHNSUomU
         a58w==
X-Gm-Message-State: AOAM5332VrZ34/SIsAzbkIK4sTmNuiVBkyNoQcOyJywcL6liJjffuvog
        qvi9jQO0OVF52z+4vANT8Gvwx9TCko9r3DKG05R0Zg==
X-Google-Smtp-Source: ABdhPJyR5v0EwI80g1kmy1SXVGsVqQpkid61MlRrKwlnDjYgLnU+qYwazQ3V+EyiCn9ABxFKleq7Kr5Bjuu2lykaDYY=
X-Received: by 2002:a2e:8597:: with SMTP id b23mr14035216lji.338.1594123384691;
 Tue, 07 Jul 2020 05:03:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200622192558.152828-1-konradybcio@gmail.com> <20200622192558.152828-3-konradybcio@gmail.com>
In-Reply-To: <20200622192558.152828-3-konradybcio@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jul 2020 14:02:54 +0200
Message-ID: <CACRpkda7b5a95ZpLmZ07awzSHenfxyzxFR46s0cUa_5JzYQ3tw@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] Documentation: Document pm660(l) SPMI GPIOs compatible
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 22, 2020 at 9:26 PM Konrad Dybcio <konradybcio@gmail.com> wrote:

> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>

Patch applied.

Yours,
Linus Walleij
