Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3DEC2CEAC3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Dec 2020 10:22:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726471AbgLDJWS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Dec 2020 04:22:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725969AbgLDJWR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Dec 2020 04:22:17 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD0B7C061A51
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Dec 2020 01:21:36 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id f24so5764195ljk.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Dec 2020 01:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+7c7BU0JWGvw/1iU2RP3wYOxQ5mghF++V/hmPW08QIk=;
        b=ZbKrTvYpmd9CcLWv1GktzFzlYT4Te8gGA+ExBEAb34qKQIC2WOzuaM6ytUttKN/7Zu
         hheA1wlZZjHqQG52/dRy6/yRRBRfANtKCMoUJLBu9p35WCEpblNc85ssiBfCpXE+qvy0
         mkUq24G/oAacjihOIKrueJ/rlShi04hO+AekLTSoSUywxzqcy2BT593O9A9lohkMobQY
         +scJZsUeUmEGTR8GL74MRd3Ey3X4cr4PltAKVRZ0yyDB34jhW6oNRX2LgLGECee2XiYk
         594TL/cRFtDJLUmny/gL0Q4EoRocFSjXN8wPV+oVTdOjE7e7X/DOTV62NNLccA50wVTK
         xPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+7c7BU0JWGvw/1iU2RP3wYOxQ5mghF++V/hmPW08QIk=;
        b=bFTpaiO1C7UIneHVkyVM6Rt44HlAAFu21D/CLC5jMe8LvSNZ83KE1gq1Tpy3uNV0JM
         HGMtFXQ7MgIei1CBQzUk/qwrpVLoXvXRSvkl/M59WFNUXxyBz+s66xqKI5FDzE5IRJwQ
         13FYxX8CDgX86AUaUgiLj+Bb37Lv0nvTJZH6vZOdmvYQTo6f616RyDkBQdFwpTxXjaIp
         lqv8j7D2yG4m4Mcg7wPW9puwxKpZa1EP7GXUnOgI7BBiOUHjNAxzlYxeAxN9fkZRq0C8
         w0PB/vMxVXqiIA4fPrOihd3THZeAvegxFp6buNgIrzwcxPoMVMuVwDlUu117tWAVcoxx
         MeIQ==
X-Gm-Message-State: AOAM533M3bwWwQfcdZ5FIQ8l8XY72U2isqfj24J4vHM0T+a8AfT5MFZk
        WneXTG85yn6zpAzmTbjgoBC+AdTnJb0pSc7PKUszgg==
X-Google-Smtp-Source: ABdhPJyC6+2xnmMqO0QAl+UYRME0EsLO05pXC1RTr6pP0keKZPXy9cYYa9MVYwFQ/NoezSQzsOpVSAZo7OqY+i6WGj0=
X-Received: by 2002:a05:651c:111:: with SMTP id a17mr2910564ljb.286.1607073695266;
 Fri, 04 Dec 2020 01:21:35 -0800 (PST)
MIME-Version: 1.0
References: <20201126092151.1082697-1-vkoul@kernel.org>
In-Reply-To: <20201126092151.1082697-1-vkoul@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Dec 2020 10:21:23 +0100
Message-ID: <CACRpkdasQ-5dqhG_KMgjTiUcCp_=A0TH7QyA3E_EgVci_TUM=w@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom-pmic-gpio: Add pmx55 support
To:     Vinod Koul <vkoul@kernel.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 26, 2020 at 10:22 AM Vinod Koul <vkoul@kernel.org> wrote:

> Add support for the PMX55 GPIO support to the Qualcomm PMIC GPIO
> binding.
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Patch applied!

Yours,
Linus Walleij
