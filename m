Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E3FB32679B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Feb 2021 20:59:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbhBZTzY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Feb 2021 14:55:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230083AbhBZTzV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Feb 2021 14:55:21 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4269CC061788
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Feb 2021 11:54:41 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id o63so6853545pgo.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Feb 2021 11:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=eAEBqCOJkxJ1r1F8GhCGJ0TIz6UVggh6SIZaIVvLlPE=;
        b=ljJ2Fuy7+hY05J2HY4PheVlwKxZ4hwOhsJ4ThJZ+cBMA0mtKtzlfCW/QCoJVz+CufQ
         rkiJELrxJaxvp5GUEFQOUX01lErTgBFZOishaWk8PL+LV2u6PKJRwfPCxyFdjD5WkVOf
         4Nl9aQ4RGoFAhTrIfvEStC3L9/G+GfOjIr7Ek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=eAEBqCOJkxJ1r1F8GhCGJ0TIz6UVggh6SIZaIVvLlPE=;
        b=SpN7DuaTA+w42mlnmAIz3tbJUu+NxN151H2OsU7PEMQ6vFpuRZ4qDfhgKhKFh09vjU
         UZndPr/FfBZeCkCyqQg9qxT/h6+seOAXLc9lY9jKWPb1ZWLPg3azdztaElnrshOOeHyP
         0US16/ICQHOTnGSBWNhRiXvMc3nRgYGrK9jyeqCKYRm/QQ6INuu1hIzFlDi6SBH7pqF0
         p9Rs8+Cfx5VH8YOW4IVupmsbWgk+tnCKQ+YqiBtpS4xvXxFMji6V1bkX7OQAsPne0V4u
         /kUaYVl4JgtgHswqLLE9Vpfzp5X8HLkLFi3TM0A2HU1zVkZJprUmON/kKnkpHPGqtOPK
         FwSQ==
X-Gm-Message-State: AOAM532pos/rlNMc1GokkBi6RGMxDNVhl9EzASAhvi1YkFKOgsopb7mo
        kTTf8wpExOwe0ajkRnRPYEZWvw==
X-Google-Smtp-Source: ABdhPJx/iwqYnKdkJ8ZTifEcGMD50vYTwI/+zx3Z1QESFaLFTJKemPk4WhkwNFXpnj5ttDyMgSbk2Q==
X-Received: by 2002:a62:194f:0:b029:1ee:5078:23a8 with SMTP id 76-20020a62194f0000b02901ee507823a8mr665462pfz.70.1614369280793;
        Fri, 26 Feb 2021 11:54:40 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:e8bb:5726:f58b:4e37])
        by smtp.gmail.com with ESMTPSA id 14sm10503282pfy.55.2021.02.26.11.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 11:54:40 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1613127000-3015-4-git-send-email-mkrishn@codeaurora.org>
References: <1613127000-3015-1-git-send-email-mkrishn@codeaurora.org> <1613127000-3015-4-git-send-email-mkrishn@codeaurora.org>
Subject: Re: [PATCH v12 4/4] dt-bindings: msm/dp: Add bindings of MSM DisplayPort controller
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        kalyan_t@codeaurora.org, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        rnayak@codeaurora.org, dianders@chromium.org, sibis@codeaurora.org,
        khsieh@codeaurora.org, Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>
To:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Date:   Fri, 26 Feb 2021 11:54:38 -0800
Message-ID: <161436927893.1254594.14208287911778577764@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krishna Manikandan (2021-02-12 02:50:00)
> Add bindings for Snapdragon DisplayPort controller driver.
>=20
> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> Signed-off-by: Vara Reddy <varar@codeaurora.org>
> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
>=20
> Changes in V2:
> -Provide details about sel-gpio
>=20
> Changes in V4:
> -Provide details about max dp lanes
> -Change the commit text
>=20
> Changes in V5:
> -moved dp.txt to yaml file
>=20
> Changes in v6:
> - Squash all AUX LUT properties into one pattern Property
> - Make aux-cfg[0-9]-settings properties optional
> - Remove PLL/PHY bindings from DP controller dts
> - Add DP clocks description
> - Remove _clk suffix from clock names
> - Rename pixel clock to stream_pixel
> - Remove redundant bindings (GPIO, PHY, HDCP clock, etc..)
> - Fix indentation
> - Add Display Port as interface of DPU in DPU bindings
>   and add port mapping accordingly.
>=20
> Chages in v7:
> - Add dp-controller.yaml file common between multiple SOC
> - Rename dp-sc7180.yaml to dp-controller-sc7180.yaml
> - change compatible string and add SOC name to it.
> - Remove Root clock generator for pixel clock
> - Add assigned-clocks and assigned-clock-parents bindings
> - Remove redundant properties, descriptions and blank lines
> - Add DP port in DPU bindings
> - Update depends-on tag in commit message and rebase change accordingly
>=20
> Changes in v8:
> - Add MDSS AHB clock in bindings
>=20
> Changes in v9:
> - Remove redundant reg-name property
> - Change assigned-clocks and assigned-clocks-parents counts to 2
> - Use IRQ flags in example dts
>=20
> Changes in v10:
> - Change title of this patch as it does not contain PLL bindings anymore
> - Remove redundant properties
> - Remove use of IRQ flag
> - Fix ports property
>=20
> Changes in v11:
> - add ports required of both #address-cells and  #size-cells
> - add required operating-points-v2
> - add required #sound-dai-cells
> - add required power-domains
> - update maintainer list
> ---
>  .../bindings/display/msm/dp-controller.yaml        | 152 +++++++++++++++=
++++++
>  .../bindings/display/msm/dpu-sc7180.yaml           |  10 ++

Can this dpu-sc7180.yaml update be split away from this patch and put
into the patch that introduces that yaml file?

>  2 files changed, 162 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dp-cont=
roller.yaml
>=20

Otherwise

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
