Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E86B3A839F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jun 2021 17:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbhFOPIa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Jun 2021 11:08:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230452AbhFOPIa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Jun 2021 11:08:30 -0400
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E02CC0617AF
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 08:06:26 -0700 (PDT)
Received: by mail-ua1-x936.google.com with SMTP id p9so6795738uar.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 08:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g6ccgATn5J7iu5AD+WjcCm3W6RvKZU4zwOSyY17Ugqo=;
        b=VMgwN6I5rM2ZzwlseZMckLT3Mq6mCu2sqjyLreObQwBJl2xO1JFJ3KrSGgtV8elyMX
         e33Mq0nMBfJo+VWoDsuWJ/OQhPo/6hCjkU3PUcv86c6bh3WsCwyTLW779KqqeJxNs2N1
         bcVS5CG3eY+iSWhjr5uoTKFRAL2QvE41iULH9uhbTJI+33T5vZZQdjTN0T76I2ijXnJ3
         mA9SHp+3dF2Htwd9o6p/2E8J7Tlv3NUNPxFdFaXQIvmPbcpjUvX5x/RXCgIdwJZFVe3v
         OMQwMaPWMBL4rOzueRuy7ZbtwoQTLkXvNrLjXq5sYiPDjhgVnSS8QzNVxcElkoRSH6Z+
         mY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g6ccgATn5J7iu5AD+WjcCm3W6RvKZU4zwOSyY17Ugqo=;
        b=M87daoxeWU0t3EhQLmYhf7bC2dIyorFcjhIxUZfB/IGLsaH1bavyfA5XVYy2dnPHjm
         Za42ohgm34RtIOIg/P6BkJBOFTdoRWsCxaY2+M8ihTJOcFGQL2R6PVXRLAAYL3OM/jKe
         a5noMx5/bLy10M4wBnZfw+xF4tB02/LDzbSZEs+rKLOscqvAtk9/JjZAHF0joWhEbbMA
         vLzJZI7j40xYNuVK8UtAFu/Mogz90UvoqFPh4Nq1fRTaIxfith0DL8YrGFGlkz0seJoT
         TtN9wYqez7lixjKr0FwUuJ8UsWzMQR2mZYPzASf0q4CV2+F6kck1dZbZ6NHEo4oEC2Pw
         Y0Ag==
X-Gm-Message-State: AOAM530SEGIAgiAN9aJGvDacFlLSfYnt+2oTtK9YAYGKt2Kf8rCpaJS5
        Z2v8A3vHDZup1lkNwtgIXp6nVzBPYirh+pXRAE/V5Q==
X-Google-Smtp-Source: ABdhPJwifxZlIC2ycNIdNlntzCYwWlEJJuNQ0hwJz82zBzFvKR5y27inbr8Cfln1EGIPgiyx/G2yZ93oXa16qSAzWsc=
X-Received: by 2002:ab0:4d49:: with SMTP id k9mr3219610uag.129.1623769585148;
 Tue, 15 Jun 2021 08:06:25 -0700 (PDT)
MIME-Version: 1.0
References: <1622095949-2014-1-git-send-email-rnayak@codeaurora.org> <1622095949-2014-2-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1622095949-2014-2-git-send-email-rnayak@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 15 Jun 2021 17:05:48 +0200
Message-ID: <CAPDyKFpc2Kh8y-=2F6kBmw74wReVP5QcYOfu1y9AguOvzTQtPg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: power: Introduce 'assigned-performance-states'
 property
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 27 May 2021 at 08:13, Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> While most devices within power-domains which support performance states,
> scale the performance state dynamically, some devices might want to
> set a static/default performance state while the device is active.
> These devices typically would also run off a fixed clock and not support
> dynamically scaling the device's performance, also known as DVFS techniques.
> Add a property 'assigned-performance-states' which client devices can
> use to set this default performance state on their power-domains.
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>

Rajendra, I think this is ready to be re-spinned on top of the latest
changes for genpd that Rafael recently queued [1].

If you would prefer me to do it, then please let me know. Otherwise I
will be awaiting a new version from you.

Kind regards
Uffe

[1]
https://lore.kernel.org/linux-pm/CAJZ5v0i0FD-F7tN=AJNEY5HVVTCNuciLT4hCqdoS5bgF5WdmaA@mail.gmail.com/

> ---
>  .../devicetree/bindings/power/power-domain.yaml    | 50 ++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/power/power-domain.yaml b/Documentation/devicetree/bindings/power/power-domain.yaml
> index aed51e9..88cebf2 100644
> --- a/Documentation/devicetree/bindings/power/power-domain.yaml
> +++ b/Documentation/devicetree/bindings/power/power-domain.yaml
> @@ -66,6 +66,19 @@ properties:
>        by the given provider should be subdomains of the domain specified
>        by this binding.
>
> +  assigned-performance-states:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +       Some devices might need to configure their power domains in a default
> +       performance state while the device is active. These devices typically
> +       would also run off a fixed clock and not support dynamically scaling the
> +       device's performance, also known as DVFS techniques. The list of performance
> +       state values should correspond to the list of power domains specified as part
> +       of the power-domains property. Each cell corresponds to one power-domain.
> +       A value of 0 can be used for power-domains with no performance state
> +       requirement. In case the power-domains have OPP tables associated, the values
> +       here would typically match with one of the entries in the OPP table.
> +
>  required:
>    - "#power-domain-cells"
>
> @@ -131,3 +144,40 @@ examples:
>              min-residency-us = <7000>;
>          };
>      };
> +
> +  - |
> +    parent4: power-controller@12340000 {
> +        compatible = "foo,power-controller";
> +        reg = <0x12340000 0x1000>;
> +        #power-domain-cells = <0>;
> +    };
> +
> +    parent5: power-controller@43210000 {
> +        compatible = "foo,power-controller";
> +        reg = <0x43210000 0x1000>;
> +        #power-domain-cells = <0>;
> +        operating-points-v2 = <&power_opp_table>;
> +
> +        power_opp_table: opp-table {
> +            compatible = "operating-points-v2";
> +
> +            power_opp_low: opp1 {
> +                opp-level = <16>;
> +            };
> +
> +            rpmpd_opp_ret: opp2 {
> +                opp-level = <64>;
> +            };
> +
> +            rpmpd_opp_svs: opp3 {
> +                opp-level = <256>;
> +            };
> +        };
> +    };
> +
> +    child4: consumer@12341000 {
> +        compatible = "foo,consumer";
> +        reg = <0x12341000 0x1000>;
> +        power-domains = <&parent4>, <&parent5>;
> +        assigned-performance-states = <0>, <256>;
> +    };
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
