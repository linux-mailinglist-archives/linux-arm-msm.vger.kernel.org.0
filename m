Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 355CD2072A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2019 14:45:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727198AbfEPMor (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 May 2019 08:44:47 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34347 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727456AbfEPMoo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 May 2019 08:44:44 -0400
Received: by mail-lj1-f196.google.com with SMTP id j24so3006422ljg.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 May 2019 05:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WAcJqFUogOC+q5kPPB4TqPaHzS2NFJ0eM8JptnvXwCY=;
        b=lSbRP38AQ6SFgZe7kefhpxx8/TDZSnH2lvUSx43pHjMx7U+pNW/gkPtChmN1XxMZQF
         aG2GYCNFQE+Js4XFSeeF7MJ/tiTkjkFTJRM70xPIljpD2HgNUhuqx8SA46t1GmT6Rdl8
         3RLaQ2GRTITuwusHV0tg0yumSCSrJF5QL1iHC65CT/k8XNcW8NDZ/jRf4dZGVELvQS4s
         s0DL/WgyqYOS3VbeBY3JXWXLvY2aEWcwuTp77vIRTQs9uxgH3+45Fo/vPNGdEM15QrZ0
         b5P0PZA8CP9nS+kTyJv9NupA/e7XY8Px9gHOg0Ite/fQTuPpCEO2N4o1Y+5S5IEtTBBw
         9EfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WAcJqFUogOC+q5kPPB4TqPaHzS2NFJ0eM8JptnvXwCY=;
        b=Mu/iyITrcPaYNppbWxM5HPnoOn7+LYbHsAeHRN5BK3fQWKvzxzPokcbRaWbYaGRucC
         sgMYp+aAtTgZ5yy2xVp6Uyi86W7lnNlKGauesGLnmnAcH5DThxLoMXqXJqVhPzctI56I
         3eTA1kncq/IBAR6wj2AfjnN4MNBVyUyKdjJb3aQP37nNCavxeuy1KTekbg4kxvhE4Wz7
         SbkXPmScClPV0o03/Fyyw/Ugel0OGn+COucUvH4LeBSZkc1ujpM+bs0vgrIIMczImulV
         0sca1ZJO0A77ZK0b8R7D21GOHIlSwFsByM28P3K1oD1lt8AuzF8yJ+B04FPjOaLfexto
         ew7w==
X-Gm-Message-State: APjAAAUCZkMetUtnP/HHaqD+ubXctitHRPxza9J59tQJQvA8GywwOHcD
        9YU8+9/FaRelna3yNTwxFfzMcJo7KA5U0EfoYl+G18Gw
X-Google-Smtp-Source: APXvYqz1nKgkBL8f+HFCe7nXbFNOicCiF9Au3HD3bQcJw9TF68xCQ8lq2AMz/ruba3dbZXK+AF6xyEkmAFuQTpMWTEI=
X-Received: by 2002:a2e:301a:: with SMTP id w26mr8899681ljw.153.1558010681900;
 Thu, 16 May 2019 05:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190428150822.13935-1-j.neuschaefer@gmx.net>
In-Reply-To: <20190428150822.13935-1-j.neuschaefer@gmx.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 May 2019 14:44:30 +0200
Message-ID: <CACRpkdZcP3gEsudT0rpzNuBe=4Mz0s=KLPd_y-38E4oxVeQD0A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Fix spelling of bias-pull-up
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Apr 28, 2019 at 5:08 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> The property is spelled 'bias-pull-up', as documented in
> pinctrl-bindings.txt.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

It appears from Rob's comment that he's applying it,
tell me if I need to apply it to the pinctrl tree.

Yours,
Linus Walleij
