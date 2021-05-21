Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2519538CF51
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 22:47:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbhEUUsy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 16:48:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230018AbhEUUsv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 16:48:51 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE90CC0613CE
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 13:47:27 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id u25-20020a0568302319b02902ac3d54c25eso19246201ote.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 13:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=dYhHh2N5/BbBDzRScwyDT6UGP42NCelTyfQOlKbNWa8=;
        b=S66NPmA5hXpPQJrbhlMt6rPjOccvyf+YXO6JPVv56ruBBJ17JtSY0raGmbyqACW3gQ
         gDJMwA4ApfKdh//eEfk7BHcDLsW2bZqTIN/OZUKZWjoJNuZnykFwEMuf6EDpDKqENRlr
         4xg5bfSiioKwSxl42LUcMavE/OA8djWui3960=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=dYhHh2N5/BbBDzRScwyDT6UGP42NCelTyfQOlKbNWa8=;
        b=Kow01RzHnNAHc15amHKGEGvGLUOxl8dIKHpqsXtHj/uDo9OHQIsrjRUblwcRI2lplf
         rnCPotN/uuPhm4NomPv6ef7tQznEwoWGhzFLvkA8SE+7onWeo/fdTFuIuUFlmojtcYWL
         4koefopYCr2PnOXrqgEKYvMV2aDVp5xvuvEC5vOaPlN+7IAd10edK1Dfm440MEFpHaeH
         pJScK9ddSKEkEkOanmtquDootX6iKvma9JjtGbSsevy+xSRwVyXb2ROnH83Cb62sW+k/
         ujEdupICo5dKYaFyUHH7V80e0lNr11Llp/00fmCOeIjmGk+AqoBo2S0xphqQWsiHY6sE
         4d7w==
X-Gm-Message-State: AOAM533jNvmBUIcWDyOhSmd3FwvJiWS9GWBMq3c659joz1hxvfiKMN1D
        f07VrJIiM2/Ue4t+uFuTwz3pEZKZ/f2CkE0plaKsXQ==
X-Google-Smtp-Source: ABdhPJz+JJOIpV6RZGO/eMKZRAblLrt35dmkVW4AwlTQKTX4/fVtOr8x4eA6TlVIEmbCop6phgIUkgO5I2bbahLV1S8=
X-Received: by 2002:a9d:1ea9:: with SMTP id n38mr10150209otn.233.1621630047237;
 Fri, 21 May 2021 13:47:27 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 May 2021 13:47:26 -0700
MIME-Version: 1.0
In-Reply-To: <1621592844-6414-2-git-send-email-mkrishn@codeaurora.org>
References: <1621592844-6414-1-git-send-email-mkrishn@codeaurora.org> <1621592844-6414-2-git-send-email-mkrishn@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 21 May 2021 13:47:26 -0700
Message-ID: <CAE-0n52BO3VoDHvwENWQdcbWDeVjNgApdd+_i96FPVFhzeHA=g@mail.gmail.com>
Subject: Re: [PATCH v17 2/4] dt-bindings: msm: dsi: add yaml schemas for DSI bindings
To:     Krishna Manikandan <mkrishn@codeaurora.org>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     kalyan_t@codeaurora.org, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        dianders@chromium.org, khsieh@codeaurora.org, robh+dt@kernel.org,
        sean@poorly.run, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krishna Manikandan (2021-05-21 03:27:22)
> Add YAML schema for the device tree bindings for DSI
>
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
>
> Changes in v1:
>     - Separate dsi controller bindings to a separate patch (Stephen Boyd)
>     - Merge dsi-common-controller.yaml and dsi-controller-main.yaml to
>       a single file (Stephen Boyd)
>     - Drop supply entries and definitions from properties (Stephen Boyd)
>     - Modify phy-names property for dsi controller (Stephen Boyd)
>     - Remove boolean from description (Stephen Boyd)
>     - Drop pinctrl properties as they are standard entries (Stephen Boyd)
>     - Modify the description for ports property and keep the reference
>       to the generic binding where this is defined (Stephen Boyd)
>     - Add description to clock names (Stephen Boyd)
>     - Correct the indendation (Stephen Boyd)
>     - Drop the label for display dt nodes and correct the node
>       name (Stephen Boyd)
>
> Changes in v2:
>     - Drop maxItems for clock (Stephen Boyd)
>     - Drop qcom,mdss-mdp-transfer-time-us as it is not used in upstream
>       dt file (Stephen Boyd)
>     - Keep child node directly under soc node (Stephen Boyd)
>     - Drop qcom,sync-dual-dsi as it is not used in upstream dt
>
> Changes in v3:
>     - Add description for register property (Stephen Boyd)
>
> Changes in v4:
>     - Add maxItems for phys property (Stephen Boyd)
>     - Add maxItems for reg property (Stephen Boyd)
>     - Add reference for data-lanes property (Stephen Boyd)
>     - Remove soc from example (Stephen Boyd)
>
> Changes in v5:
>     - Modify title and description (Stephen Boyd)
>     - Add required properties for ports node (Stephen Boyd)
>     - Add data-lanes in the example (Stephen Boyd)
>     - Drop qcom,master-dsi property (Stephen Boyd)
>
> Changes in v6:
>     - Add required properties for port@0, port@1 and corresponding
>       endpoints (Stephen Boyd)
>     - Add address-cells and size-cells for ports (Stephen Boyd)
>     - Use additionalProperties instead of unevaluatedProperties (Stephen Boyd)
>
> Changes in v7:
>     - Add reference for ports and data-lanes (Rob Herring)
>     - Add maxItems and minItems for data-lanes (Rob Herring)
>
> Changes in v8:
>     - Drop common properties and description from ports (Rob Herring)
>     - Add reference for endpoint (Rob Herring)
>     - Add correct reference for data-lanes (Rob Herring)
>     - Drop common properties from required list for ports (Rob Herring)
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
