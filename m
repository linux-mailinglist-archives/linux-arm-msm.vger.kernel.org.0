Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BFE2FE567
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 20:05:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbfKOTFe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 14:05:34 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37882 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726704AbfKOTFe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 14:05:34 -0500
Received: by mail-pg1-f193.google.com with SMTP id z24so6436929pgu.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2019 11:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:subject:from:user-agent:date;
        bh=0Pnb0NA7Tx6DFC7PbIhovx3K0Sfnn+qJAuCVQTaXi9E=;
        b=PfeZNk7CeSmSNfnT9CHk6vAQBgtY5rGXBFZlP4L/f06RLPDYqNLo9u+vZ6mhxHVUK1
         NYRPiOvOXBluZ2yE9vJAIFstlLd0kSXJhmSR/KvFL2+PK61CjWZhEtTqiggZHLVfXRYH
         gEUcUCGvD/v79z5GC4uhQae132EfISMl3NHgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:date;
        bh=0Pnb0NA7Tx6DFC7PbIhovx3K0Sfnn+qJAuCVQTaXi9E=;
        b=WWhn5yYn84rZzwDglXSwUg4VCYNDWMcNapTCHdvWWtX6yTejZ7MXpkTVU+MULjXII1
         SaHDyCad4b+/m+ZcQZY9nbQaRVTdLyH0kN2VoiL3RROdj+MV6ljH52Hy8wwhhs8nUczu
         gYfT3jEvRiipdYHKYO8f0AF4fP48DTCzLa2VeQcNxSinZHxHGwtmIiAySq4cFkiXfcwi
         qyfWCR0ps3s5ZqpRrTjlCKfSKk+aejeieWdgdPdmBYCGBvr/hbDpjUEflPPGcfaVRk+5
         /7rCpGHsk3rnwAQuKEeOMc6tV7SO+3io9+/KHDUlMqaWWAdnzRR339gDPzkWsxG57UzV
         fiaA==
X-Gm-Message-State: APjAAAUZfJ+SEUf02KdOun/3/6E70W7aS+aJPpG1Zz5zldrBccMQXc+O
        rCE/xdw/EVv7HsatiNl0srFpJQ==
X-Google-Smtp-Source: APXvYqy5atNmDpoOOLCF9LPSi3uw0uAw5QforyNzU4sX7IAFe9ofjoq19R5TNbvQFLHgD/rB84Otgw==
X-Received: by 2002:a62:7b09:: with SMTP id w9mr19431377pfc.8.1573844733401;
        Fri, 15 Nov 2019 11:05:33 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id y3sm10938282pgl.78.2019.11.15.11.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 11:05:32 -0800 (PST)
Message-ID: <5dcef6fc.1c69fb81.27c1a.ee1e@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573756521-27373-8-git-send-email-ilina@codeaurora.org>
References: <1573756521-27373-1-git-send-email-ilina@codeaurora.org> <1573756521-27373-8-git-send-email-ilina@codeaurora.org>
Cc:     evgreen@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
To:     Lina Iyer <ilina@codeaurora.org>, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, maz@kernel.org
Subject: Re: [PATCH 07/12] drivers: irqchip: pdc: Add irqchip set/get state calls
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 15 Nov 2019 11:05:31 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Lina Iyer (2019-11-14 10:35:16)
> From: Maulik Shah <mkshah@codeaurora.org>
>=20
> Add irqchip calls to set/get interrupt state from the parent interrupt
> controller. When GPIOs are renabled as interrupt lines, it is desirable
> to clear the interrupt state at the GIC. This avoids any unwanted
> interrupt as a result of stale pending state recorded when the line was
> used as a GPIO.
>=20
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> [updated commit text, rearranged code]
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

