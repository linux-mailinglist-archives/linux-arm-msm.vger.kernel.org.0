Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 369E8F00BC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 16:06:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731032AbfKEPGh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Nov 2019 10:06:37 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38822 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731040AbfKEPGh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Nov 2019 10:06:37 -0500
Received: by mail-lj1-f193.google.com with SMTP id v8so6584848ljh.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Nov 2019 07:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XeLKSI0KpVKh7U51GFQKhu41G/kKMM6hiwNkiVQAYno=;
        b=vmLGemzHKaxLBgLOj8ysaBgUxFMaOKKjcTIanlNzhYP69lx4N1ogVqivjUM37D2rJU
         mqZpFLjzo/ZL8PcdliQcdNt45so0lInDzm5XPZpxb1dEXl776kPWKrmh47wo2KHWKBiS
         OihVcAcKa7ILvYycaHoOqrGsb/Xv569qGfL5cyivyxmpqWoV70XY2FaTfZ4Nn4xQiBsv
         7FcYcUKl5Yun5MQhkq6/S3MoubixSgNFspwkPZUoQQxzpKOqlkR4hn9SmDQqQpgZpaP4
         ea/FaQ/9Ig6WlPkVHuj6Fj2xBUe3a5dMC/UZ3Z/D2iXjk3U6bGdWAoxHw5RPFdN0or70
         1pFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XeLKSI0KpVKh7U51GFQKhu41G/kKMM6hiwNkiVQAYno=;
        b=Fy7BkQyY+thNwmhDKXpIkd+XeaSjlYlwkTn/z3Y0cQd+QYIgESFYjC9UOW8Kpo1gIE
         6ZUXOxCR0qejogsc1Ic8Rx1tIo1d3kJkVLKaqvxo8lAEsJU+K96kbHKCExLmuH6VWvZT
         2PxU3wzKWXfnLe63IGXueZ4l2J2b1ZJ/vz6KaACs08PSIbIE7mZ+En55npiiVkWXr5eg
         USyMpvt/E5K9eCe2CEs4H0EGjFNtZb4ojQKfffDa+IAFTbSx4oFgxM+/t9eXO6RCi5ru
         Un+SfcppZv2/miboQrsz/93Vb/fXbSS9KrSB/xq3vi0Ihhyo0t7d9e9m6BOYeYdg92op
         fxXg==
X-Gm-Message-State: APjAAAWxBaVC50xoH2fYwcF1Yb3bCJe8L43tsNIGamzu/QSF93VW6x6d
        PAcTtDotyFKo/4QZlUxLMf0Ol7MNHSqPJbPBDVhvDg==
X-Google-Smtp-Source: APXvYqwnwnosIbALQWhH9iE66VbRevpNKoo2+AlOIGbO/YK+JvXEq7xF97GQzxccFEeM+dwg//oNT6x78p7b0HM0Jk0=
X-Received: by 2002:a2e:9a12:: with SMTP id o18mr16050255lji.191.1572966395420;
 Tue, 05 Nov 2019 07:06:35 -0800 (PST)
MIME-Version: 1.0
References: <20191104163834.8932-1-andrew.murray@arm.com> <20191104163834.8932-4-andrew.murray@arm.com>
In-Reply-To: <20191104163834.8932-4-andrew.murray@arm.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 5 Nov 2019 16:06:24 +0100
Message-ID: <CACRpkdYcUFkUUG8jQ=9i9LDpKbrzqNR0o_eLObijXn4YiBHOJw@mail.gmail.com>
Subject: Re: [PATCH v1 3/7] arm: dts: Use IRQ flags for legacy PCI IRQ interrupts
To:     Andrew Murray <andrew.murray@arm.com>
Cc:     Tsahee Zidenberg <tsahee@annapurnalabs.com>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jesper Nilsson <jesper.nilsson@axis.com>,
        Lars Persson <lars.persson@axis.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-arm-kernel@axis.com,
        MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 4, 2019 at 5:39 PM Andrew Murray <andrew.murray@arm.com> wrote:

> Replace magic numbers used to describe legacy PCI IRQ interrupts
> with #define.
>
> Signed-off-by: Andrew Murray <andrew.murray@arm.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for just changing them all in one patch, it is swift and elegant
patching.

Yours,
Linus Walleij
