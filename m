Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C02A24205A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 21:32:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726258AbgHKTcG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 15:32:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726164AbgHKTcG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 15:32:06 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16BE4C061787
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 12:32:06 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id 74so8142882pfx.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 12:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=tA1M4j2w8ikxzsm8TqiavbfeCWghKEktBcvPRuyYdeI=;
        b=As8qfrI4fsdQlw1YluH7CQP9RPdnbLLarMDBpBfPLtdJM6Zz9+5A7xoQef2NTzfUE/
         +C1+3eziTtpdJnqzivpXYwXCBLOe3YSljJNFih8WyxQrvWp6asRkc6RZ6Bw0jOsnQh2g
         pMc19VgG5f7Jp9oK3lDGsOeZmBremTkgYbNvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=tA1M4j2w8ikxzsm8TqiavbfeCWghKEktBcvPRuyYdeI=;
        b=KyQW1exVe1JFrGzIIP2KoHrqMCAlZ6XXHGGiGR8/QmUPPPiE7F1BBlXr3GfA1KXCxH
         Kvc+lNKqDAEgBVCVuKv0gmn3R8Iuwm27syxVEKNH1Y68WsQP6Y0n1BRjVg5tshr/AZgp
         ag918tlHOpwyBloKjEJ/Pc8rOhsfQPxjpsheCOo2FkyM/P63SpIW3c3cSNTJuypFeZOU
         y34HRPR99xa0m8aurON7Gr1tOhZxbUBNRMt56n9eAkWRQny+ykIXvJhvbBOvN4iKYl4N
         P6FLaq8hlPh4VtD+RsG6i8J0PbPNoEiy6dxEyIFb78O53tlnl7VDIFMY7X/h993kur1M
         Yr4w==
X-Gm-Message-State: AOAM531gy9B49FM3vI7ebKrM62hJc0ilF6iNzCYijKjgeDfD63+Bjqz6
        wA8bA81FsaoBMM3U7/2E4L8mRQ==
X-Google-Smtp-Source: ABdhPJxLgsyPl3Dbi+HYEp5MXKHxD/EOIrbVN3IARmbEfeFc7gN7kF/USAK2IJ9ZzHp+dLVfg9OamA==
X-Received: by 2002:a63:a50e:: with SMTP id n14mr2037903pgf.234.1597174325609;
        Tue, 11 Aug 2020 12:32:05 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id j8sm18852860pfh.90.2020.08.11.12.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 12:32:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1597058460-16211-2-git-send-email-mkshah@codeaurora.org>
References: <1597058460-16211-1-git-send-email-mkshah@codeaurora.org> <1597058460-16211-2-git-send-email-mkshah@codeaurora.org>
Subject: Re: [PATCH v4 1/7] pinctrl: qcom: Add msmgpio irqchip flags
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, linus.walleij@linaro.org, maz@kernel.org,
        mka@chromium.org
Date:   Tue, 11 Aug 2020 12:32:03 -0700
Message-ID: <159717432398.1360974.1005323166939228511@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Can the subject be more specific? "pinctrl: qcom: Set IRQCHIP_SET_TYPE_MASK=
ED flag"?

Quoting Maulik Shah (2020-08-10 04:20:54)
> Add irqchip specific flags for msmgpio irqchip to mask non wakeirqs
> during suspend and mask before setting irq type.
>=20
> Masking before changing type should make sure any spurious interrupt
> is not detected during this operation.
>=20
> Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
