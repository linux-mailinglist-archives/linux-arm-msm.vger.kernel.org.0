Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F155466D41
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Dec 2021 23:51:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346039AbhLBWzE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 17:55:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244087AbhLBWzC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 17:55:02 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD9A1C06174A
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Dec 2021 14:51:39 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id h19-20020a9d3e53000000b0056547b797b2so1682161otg.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Dec 2021 14:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=G+McyWCYbmpjpANc0iPYcABDaPO85Ld/wlLRZjD5kLg=;
        b=JVh5EP5UyHHaNRAtHYGVi+rhzICB7i9jWA1Llw5vFsL30ZWFm5dov/5HgQ7PrjfyMF
         cdhIvN66DELXflYZC8l/t0rdBc4UZyRKrrPs4OCNOpZN3vFxTYthGshbxe6zu3eLVXoC
         mCRNLamhog6hLB5zEO+t7mg5RBtZFQhYanQsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=G+McyWCYbmpjpANc0iPYcABDaPO85Ld/wlLRZjD5kLg=;
        b=J3US/5bsxCLtnAT0WUCwf1MoXuD1F+qF6QU16T5wgmsz3EkfZcOGX/rI22supZEFDI
         uyjUNAXgx/AxFMKoLnnfD16K9Ig+ib0wDXcIY+MK4+SPxskDeh7+4QElGZiwttF8hts0
         iJ+pV9aisi1NfACgzh5EkJUi8d7E1PBhjUbWqoDAjeLOzOnu4MiOdOVDKimT3XGkRbAG
         Zcaq/OZvzw7VtpkP7mmriYLkzvCbkuPjLsSP1gO7AApZQLG3XbSZjiV314bx1es4Ajoh
         oEJqQKdxM7AITVcJjAiVSPDhMjQZeAykELbIjkQC1orXuV/oTGoOebHA8FD9G3JJuXQD
         Zwmw==
X-Gm-Message-State: AOAM531eOpbHPRBfCC6vOZJ2IibnEDBK0tLfRuEGxMSQCy3Fo+MWRAr5
        j1zFlNXJ+Iy6N+A4zbXhTZRw2irKtP3kk4yFyfH6Pw==
X-Google-Smtp-Source: ABdhPJzS29+LQ903PdAUxA5kWhCkKjLGFY2Fq0VTw8nEaBMpva7LdDAsgQrfNLDEHcVCbXgEfKRtiUEhJh5gZE/o+P0=
X-Received: by 2002:a9d:2243:: with SMTP id o61mr13366960ota.126.1638485499138;
 Thu, 02 Dec 2021 14:51:39 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 2 Dec 2021 14:51:38 -0800
MIME-Version: 1.0
In-Reply-To: <CAE-0n50R1wfw=V7o19N20YOqSrRZKR7Zd4QLcRcjYQNsdf3QHg@mail.gmail.com>
References: <1631637901-11603-1-git-send-email-khsieh@codeaurora.org> <CAE-0n50R1wfw=V7o19N20YOqSrRZKR7Zd4QLcRcjYQNsdf3QHg@mail.gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 2 Dec 2021 14:51:38 -0800
Message-ID: <CAE-0n51OA3c_hcnpJ-k5ZQvCN3kv8PcjLMRw4BLx9OKZPjGLcA@mail.gmail.com>
Subject: Re: [PATCH v4] phy: qcom-qmp: add support for display port voltage
 and pre-emphasis swing
To:     Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        robdclark@gmail.com, robh+dt@kernel.org, sean@poorly.run,
        vkoul@kernel.org
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kishon@ti.com, p.zabel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Stephen Boyd (2021-09-14 12:49:13)
> Quoting Kuogee Hsieh (2021-09-14 09:45:01)
> > Both voltage and pre-emphasis swing level are set during link training
> > negotiation between host and sink. There are totally four tables added.
> > A voltage swing table for both hbr and hbr1, a voltage table for both
> > hbr2 and hbr3, a pre-emphasis table for both hbr and hbr1 and a pre-emphasis
> > table for both hbr2 and hbr3. In addition, write 0x0a to TX_TX_POL_INV is
> > added to complete the sequence of configure dp phy base on HPG.
> >
> > Chnages in v2:
> > -- revise commit test
> > -- add Fixes tag
> > -- replaced voltage_swing_cfg with voltage
> > -- replaced pre_emphasis_cfg with emphasis
> > -- delete drv_lvl_reg and emp_post_reg parameters from qcom_qmp_v4_phy_configure_dp_swing()
> > -- delete drv_lvl_reg and emp_post_reg parameters from qcom_qmp_phy_configure_dp_swing()
> >
> > Changes in V3:
> > -- add __qcom_qmp_phy_configure_dp_swing() to commit swing/pre-emphasis level
> >
> > Changes in V4:
> > -- pass 2D array to __qcom_qmp_phy_configure_dp_swing()
> >
> > Fixes: aff188feb5e1 ("phy: qcom-qmp: add support for sm8250-usb3-dp phy")
> > Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> > ---
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Can this patch be picked up?
