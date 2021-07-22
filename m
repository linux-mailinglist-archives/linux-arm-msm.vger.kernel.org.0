Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE00F3D2CC4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 21:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbhGVSvR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 14:51:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbhGVSvQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 14:51:16 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6466CC061757
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 12:31:51 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id o17-20020a9d76510000b02903eabfc221a9so6417822otl.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 12:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=3DPSLi1ybTov0O3fVuhOjatTS2Xdr450c8Bfvi+v/u0=;
        b=GqohWEvgFPJC3JRlNzTRsN23DE727KvCgqmYzDx9xP2zTrTlCe2yEmDIMYGRLKzcTj
         GKW94djcAqQ0Ad3gH1ni6cdXVomMkQkXdR+WpuRFETT/StZvuTroYsQWZDMyyJy5Unn6
         Y1vAA4AeLgB7qZRtvOiM1F/LMgvfi2JdPuX+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=3DPSLi1ybTov0O3fVuhOjatTS2Xdr450c8Bfvi+v/u0=;
        b=WfN6YwOSDoqLNtuf3JEzfM5JMGbKe3N9/urtlpnTEvGQxphWU/tA5arFI0GQm+leYt
         +kcNIwVZ56qRnyLbRzQ3zSE1e0Aa//bwAp402S7PVh/s2JW/VMSNfV4jioJSlTpUKcti
         Mo/DkN0i0uCZaNZE3+ypdQG7b7P0H6xYHYeGuNHrlmPVR22ic18JKXchvRSBoF2D7U+M
         m2vu76F9rksRpxTpUvMqh6K8bEWqg9+Y4+Dg57zYKnyWMblX+Yo85VQlY2tdZGFkvvDE
         uw0t8rThFPd2QTjFs3v4RUWlbec5C8vlC2ZvCH+W9lQ3MHFUpskOCbU4AKbObMAkQokF
         /7Pw==
X-Gm-Message-State: AOAM533Puvi9lu7pWcD8uHs//pdrk6swpXekJqXnh8t/I2kJqGU/IbwC
        QIMqqout6PDcVLFNMS/qAZ9nRRtplrpLBtJyhVW+4g==
X-Google-Smtp-Source: ABdhPJw9ktILTFVqvmgK8/4f/ODg5WVoOdDcD7oHmbTkk7H7ihrgo6bxEqQNWbmdgqFDdtUm/MTGlBvbs8tOcVDnNms=
X-Received: by 2002:a9d:8c7:: with SMTP id 65mr906170otf.25.1626982310796;
 Thu, 22 Jul 2021 12:31:50 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 19:31:50 +0000
MIME-Version: 1.0
In-Reply-To: <20210722030738.3385821-1-bjorn.andersson@linaro.org>
References: <20210722030738.3385821-1-bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 22 Jul 2021 19:31:50 +0000
Message-ID: <CAE-0n52n=ci=k-1Q64L8_pjpjmmxZ74fHUQ4i8rBiOSFS0o_mg@mail.gmail.com>
Subject: Re: [PATCH] phy: qmp: Provide unique clock names for DP clocks
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-07-21 20:07:38)
> The USB/DP combo PHY exposes the "qmp_dp_phy_pll_link_clk" and
> "qmp_dp_phy_pll_vco_div_clk" clocks, that are consumed by the display
> clock controller. But for boards with multiple enabled QMP USB/DP combo
> instances the hard coded names collides - and hence only the first
> probed device is allowed to register.
>
> Given that clocks are no longer reference globally by name and it's
> possible to replace the hard coded names by something unique, but still
> user friendly.
>
> The two new clock names are based on dev_name() and results in names
> such as "88ee000.phy::link_clk" and "88ee000.phy::vco_div_clk".
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Maybe we should make this a clk flag like CLK_NAME_PREFIX_DEVNAME so
that clk_init_data::name is prefixed with dev_name() so the caller
doesn't have to do the concatenation themselves.
