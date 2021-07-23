Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE1DD3D3CAE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jul 2021 17:44:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235524AbhGWPEV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jul 2021 11:04:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235472AbhGWPEU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jul 2021 11:04:20 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01303C061757
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jul 2021 08:44:54 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id z2so2841866lft.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jul 2021 08:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HOiaAVrGjDtQAMZ/pqI5jg+/dJsFOJs35LXrLz/v398=;
        b=Ui6Cgxcvq5elBFIoCX0IM80f9Ve53umtK6rup811IiH5eOn3Bv3B4dHBW0RlPbLM7h
         jpwq9bg/b31wexVUXj3CVQPwpEcBg/W3z6hO2wyTDcKHC2Pf3BxTw9TLjZmP/P+Ox1uK
         twcMLDKO6nP2BGVevCJvRosjn6YnyjTpz6i/Tk/qBBVRpOOr7gAR1Fhc7G1NC/+1Y0rk
         B457gxgaTaph9+6wU46u+Yd2zygAF8LScdoIO6kPnFMbAbiBDNja900K9k4bcs+E6xrU
         51MnnTgSIfNupwfpA9oPGK20nkxSopZVft268z7Xjcd27SRsBPPX8vFVo5h4Lo0JEdWs
         i/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HOiaAVrGjDtQAMZ/pqI5jg+/dJsFOJs35LXrLz/v398=;
        b=DdQnzb4X6PIO1PdU/SpT9lrqlBczWMOxzeEWku4ovQYTqZXq2ROQwqfmPRG3BcS/PX
         5kCiiRiXR1wrMFOXQ9E4HTusltH7/xcz5DOUM6QisixaD3jRZGgVJzghfVx3mz2bIA4o
         eWSX6mfKziqr6BsuJS/eDQec9t0KzE/5k5IJIPX07BIFWPBJgiNbUQ8ysD8oSRI/cV8m
         Z2JJ4oUE/pF8D/DhW3rzZpSKqR7BNcmPWXeeBq7d5RlpAH2iCIKaKruzUz+Z5fbtyStN
         Q3BsXk2EUxw181aDlVQGSeQx0/fDdSJSPyqiIhnjlZXEgWL1f1+MISpLTxVMjh78e0OT
         Tk6Q==
X-Gm-Message-State: AOAM533IORu51qgEZjA3nPvpb9nc8QUqcIgnnaotoNrO3l3xM+01Jop0
        QeSl1MAOylocuFzQ//5Yrtgp0bM6UDnIrC+AytHIVA==
X-Google-Smtp-Source: ABdhPJzyCAH/RW1JEpMxjPu1dGHg4MHXLQ9m9GcbcQ9vAesOrb2vqGsqAdrxCITJFq8clS6wDHNCmrY2ONc4FgBzkCU=
X-Received: by 2002:a05:6512:2603:: with SMTP id bt3mr3522104lfb.529.1627055092344;
 Fri, 23 Jul 2021 08:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210624191743.617073-1-konrad.dybcio@somainline.org>
In-Reply-To: <20210624191743.617073-1-konrad.dybcio@somainline.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Jul 2021 17:44:41 +0200
Message-ID: <CACRpkdaEZMo+_VU8QBxv6PFxn5G0wDvtJ4r2YhdhjHwKmrEDpA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: Add bindings for MDM9607
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

On Thu, Jun 24, 2021 at 9:17 PM Konrad Dybcio
<konrad.dybcio@somainline.org> wrote:

> Document the newly added MDM9607 pinctrl driver.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Patch applied!

Yours,
Linus Walleij
