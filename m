Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 567D3251662
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Aug 2020 12:14:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729784AbgHYKON (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Aug 2020 06:14:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729695AbgHYKOL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Aug 2020 06:14:11 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5741C061755
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2020 03:14:10 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id p37so6503726pgl.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2020 03:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=NK/rGdFzl/ZJ0ikUSNHqbk5FsBpl+Htmp3bLWdAh3jY=;
        b=SCvq4FUNygb0mPDOTL9HsmV1XyflsHOwL6MGLFxggA22jrk3r0cUnTgiCypWwgft1T
         yZx8mVaFF/HA1b+iKbCRANmRux23s0+GG3gfMuBKEX/JZLD2VjmzCXc2/PTSFamz0VKQ
         w/f24Tt+ZBLC1s0+2dt24P5IOI3cswYZh/3XI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=NK/rGdFzl/ZJ0ikUSNHqbk5FsBpl+Htmp3bLWdAh3jY=;
        b=oweN4HkusAsEDagknGmD/jS5aQBNP5TI/ZbH+BgXSm1HpAoeEKJ8jW53QfcwyueqKT
         YGajz/TxbtVdke94HMGKoJ1X7ImnGcxGL8i5+rSVbyKV9xk/IcGj+wKOG1nEj8kb+25v
         /MJhA4U3scX6NdXz5LfPyyHj3Pw2IN42LtkKco1n4uVWxXmh5Q75RJqknia2nFcfP7uz
         LQz1ub4VLjYpeOad9QuLmPfPnqKC6pIcVtNJNjJZBbxKkyxeSbU1z5hl4TSBUloPKAen
         DZvLX5czmI37cORW3f9Re8NIB53THSqhvDx1FXtx3pEefOl74x8vHJmkUYgGPavbYjRt
         M2Qw==
X-Gm-Message-State: AOAM532ipu9r08JQ98PA6ajK3hLl+cB3SJnwh6yq2m9efqqCHGOTH228
        fs0qd3VnZJ0jsucoUTUKdXGL8g==
X-Google-Smtp-Source: ABdhPJxRam8z3NFVm74MYbnfL8FAHtSGolerCZEMwDw8/bzH96h2YpXlmD1E8BATCSSWhjkeXP8j8w==
X-Received: by 2002:a65:498f:: with SMTP id r15mr6392116pgs.410.1598350450231;
        Tue, 25 Aug 2020 03:14:10 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id x13sm6165505pfr.69.2020.08.25.03.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 03:14:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1598113021-4149-7-git-send-email-mkshah@codeaurora.org>
References: <1598113021-4149-1-git-send-email-mkshah@codeaurora.org> <1598113021-4149-7-git-send-email-mkshah@codeaurora.org>
Subject: Re: [PATCH v5 6/6] irqchip: qcom-pdc: Reset PDC interrupts during init
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, linus.walleij@linaro.org, maz@kernel.org,
        mka@chromium.org
Date:   Tue, 25 Aug 2020 03:14:08 -0700
Message-ID: <159835044855.334488.7962570422326622972@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2020-08-22 09:17:01)
> Kexec can directly boot into a new kernel without going to complete
> reboot. This can leave the previous kernel's configuration for PDC
> interrupts as is.
>=20
> Clear previous kernel's configuration during init by setting interrupts
> in enable bank to zero. The IRQs specified in qcom,pdc-ranges property
> are the only ones that can be used by the new kernel so clear only those
> IRQs. The remaining ones may be in use by a different kernel and should
> not be set by new kernel.

Presumably they're not in use anymore if the kernel has been kexeced and
replaced this one?

>=20
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
