Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9A8B37AD0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 May 2021 19:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231304AbhEKRZO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 May 2021 13:25:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231230AbhEKRZN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 May 2021 13:25:13 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45BFBC06175F
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 May 2021 10:24:07 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id j75so19679561oih.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 May 2021 10:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=XmrHR0LeLKDOvGPgiLH+kJ5EvGhX8fXlpAVkIlJfG5Y=;
        b=ATUh//YBW0Kw74D+sxRJrzheCmYrLCvVYSnudw0MzUBiWvifsoq65X0GohbI/FJmLc
         wHZlQB62/PKMGGjmqnh0EqEhctNqpE+hapeWnE4mZtFedRZAlgC1lsUoA0i5ZFcOJGtI
         QaJv6IHglbHVjBIDlTl58pUY6Tj3IYxDac1W0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=XmrHR0LeLKDOvGPgiLH+kJ5EvGhX8fXlpAVkIlJfG5Y=;
        b=sF9lWQ1sYzxjb3Zk5J0OKkyz9cbPYszXUsoqSGWW5tB3Uo+QGmLguvUWXEbQVn2548
         ijnEe986GJ8CD+Ei8Y+VePT9YbjmRy4r7i4aogG9KajTh35Q4vtXtXdjKWHbIKq6icT8
         4g8RvlrkPwriIE34HkiE0Wa9THgXXeW24xp6GU1eMEgbvX1eQn/ng9cGk7/MUrRkv2RE
         BIXnFRcpn+yhq1iNiJM0JWGMgfwVK+v9vjxhVx06fM6Ggn99QfxfzmkCYs+pbTOx5koP
         dN0BW1VFRtDHDoPw9X7YsS/wEoRHYUdQ0u42fBDtYLoPeLJ02mG/TIZjoJ1hk2s0eQtO
         HCcA==
X-Gm-Message-State: AOAM532RHwXxjcrnNwnLfLYM6SOuprg8QxuyrQJpVbwAjTTa5CUCYmxB
        CCi8Pz08R9wAqsrnmuMxYx3SuDDWb0EVmZ+2gzyqng==
X-Google-Smtp-Source: ABdhPJxusffkMJZCUwfXdGeGXpS0u/Ku8ZMHDBE3M2DepCZjKd6VqVmO6mnhU1hB5cse8s5416ajbmCkrUpyE24HNPk=
X-Received: by 2002:aca:654d:: with SMTP id j13mr4398347oiw.125.1620753846715;
 Tue, 11 May 2021 10:24:06 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 May 2021 10:24:06 -0700
MIME-Version: 1.0
In-Reply-To: <20210511041930.592483-1-bjorn.andersson@linaro.org>
References: <20210511041930.592483-1-bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 11 May 2021 10:24:06 -0700
Message-ID: <CAE-0n53CxUfHerU68ShKiDPGRSfB-2Cwbt+aHrQsyF6XSMc=CA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: phy: Introduce Qualcomm eDP/DP PHY binding
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, sbillaka@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-05-10 21:19:29)
> diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> new file mode 100644
> index 000000000000..c258e4f7e332
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm DP/eDP PHY
> +
> +maintainers:
> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> +
> +description:
> +  The Qualcomm DP/eDP PHY is found in a number of Qualcomm platform and
> +  provides the physical interface for DisplayPort and Embedded Display Port.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sc8180x-dp-phy
> +      - qcom,sc8180x-edp-phy
> +
> +  reg:
> +    items:
> +      - description: PHY base register block
> +      - description: tx0 register block
> +      - description: tx1 register block
> +      - description: PLL register block
> +
> +  clocks:
> +    maxItems: 2

Can this be items: - const: again? I think having maxItems means you can
have one or two items, which wouldn't match the number of clock-names
then.

> +
> +  clock-names:
> +    items:
> +      - const: aux
> +      - const: cfg_ahb
> +
