Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E578D2647B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2019 15:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729126AbfEVNTX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 May 2019 09:19:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:56770 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729003AbfEVNTX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 May 2019 09:19:23 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C7AC52187F;
        Wed, 22 May 2019 13:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558531162;
        bh=xZL000OlxXJ3Olb6ufE2AzjLi7N4hMQu+kQzQcbFNCE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=0mYeaIOisZLB0e2XA+n2+3BIXH94kWanrOCk0grtqaLO+lZvxY3UI7XggEwxwuQqh
         vq/62sb27M9TkomToLDrAOJEMM7ci1rjoij0f3S6+ILn1ARCEMG0aZLvAXz4U57nd3
         Bsy2TjvX8AeZkQy1Oa+uXn9+h2LRBrcSTjcCeEdI=
Received: by mail-qt1-f174.google.com with SMTP id y42so2243463qtk.6;
        Wed, 22 May 2019 06:19:22 -0700 (PDT)
X-Gm-Message-State: APjAAAVdCVFds0Fnq6jTA+xS8dQbFcl39IMXD0oq4ZXUVTQJCCCGcGPs
        g4ixs+6wButiDXtvq3O1ACJkXJv0FgWQYbwyzQ==
X-Google-Smtp-Source: APXvYqyvYTuRn9kxbS1Z4NqODKeovcHPYdzWdAvI9bwxOBcedkYyTwND/I5vtUvsg9uaG6kVGsaTqAdvJBL/eqFqgL8=
X-Received: by 2002:a0c:929a:: with SMTP id b26mr70772394qvb.148.1558531161859;
 Wed, 22 May 2019 06:19:21 -0700 (PDT)
MIME-Version: 1.0
References: <1558466890-45471-1-git-send-email-kdasu.kdev@gmail.com>
In-Reply-To: <1558466890-45471-1-git-send-email-kdasu.kdev@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 22 May 2019 08:19:09 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKd53W1E33YdtJwagi4=7DrVQ5+N3rSY=Rxo5J0RiW46g@mail.gmail.com>
Message-ID: <CAL_JsqKd53W1E33YdtJwagi4=7DrVQ5+N3rSY=Rxo5J0RiW46g@mail.gmail.com>
Subject: Re: [PATCH] dt: bindings: mtd: replace references to nand.txt with nand-controller.yaml
To:     Kamal Dasu <kdasu.kdev@gmail.com>
Cc:     MTD Maling List <linux-mtd@lists.infradead.org>,
        "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Liang Yang <liang.yang@amlogic.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Mans Rullgard <mans@mansr.com>, devicetree@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-amlogic@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-oxnas@groups.io,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 21, 2019 at 2:28 PM Kamal Dasu <kdasu.kdev@gmail.com> wrote:
>
> nand-controller.yaml replaced nand.txt however the references to it were
> not updated. This change updates these references wherever it appears in
> bindings documentation.
>
> Fixes: 212e49693592 ("dt-bindings: mtd: Add YAML schemas for the generic NAND options")
>
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>

Mauro already sent a similar patch.

Rob
