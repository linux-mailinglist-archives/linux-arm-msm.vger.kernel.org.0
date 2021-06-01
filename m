Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A07D3397186
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jun 2021 12:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232246AbhFAKfu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Jun 2021 06:35:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbhFAKft (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Jun 2021 06:35:49 -0400
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD18EC061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jun 2021 03:34:08 -0700 (PDT)
Received: by mail-vs1-xe32.google.com with SMTP id z15so2426985vsn.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jun 2021 03:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K57YqakeMlmXTnxAf+W2Ub8EZWhnyq1GipQeukL/j9Q=;
        b=SIWk7sKq05dNmHj0cBNp9EnrSZc9XaiEDsHvkAFhIs4Oyo7JCVHa+imw1r+2fwmLUm
         pPOdcNj+OeHdi3RSEN/nypmZcjYWO0XC7t+Y3Yc7jRh/DlkD7kecoGfbwW6iq+IXvQqh
         0gNJN5nW7JnuKCcz+Qq4QJsZYvUhEtpZpj1TMCjEK3Spt167Rph4TWfsdj17RSCJrmm3
         bSXLGkgrWxz15BPbfPl0yXqvE0iLnWZbk3Nyrck59H0Qx/pVuh7sHd0dmaK9lRb7/LAG
         +T1aozxFesbAeQniL8zB/YkvbVbUGZeZV5TDnl50t2kq4+9eKlqUZ7dCG4KlRbBMIo7V
         r+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K57YqakeMlmXTnxAf+W2Ub8EZWhnyq1GipQeukL/j9Q=;
        b=UiI7Hp6lgRqhX+dRGKsFnnZwyMSVJUkgW0s6pez3BsmV3FbzlPjX4r/aKYW6ZQ+S7c
         C+yie2FGSXwPJA51cy6i6XN+pL8ZXlzVzpoG5lMNn2L7fhDyrKf/19gIS3ghg6OG1UGV
         tc/wwAt7XO7Kd2ML/PJ718LPw/463xOVSOWZUIxJb7+tzFOGBvPakPHrrqNTF+yLfewU
         AF3/kFkhWHiMfdHiJJb30UWIhXMeUPbvJWCspH32VRHgDw/sRlgouufD7LNhblptY9bK
         DVTiq6F818IJG97/ww/shcqY++Imf/FswfSmwAjQNCnNcLwb869HYNoBT3J6/QMNODhV
         BWZg==
X-Gm-Message-State: AOAM531ILkRkPmXY/gb+7KyCq5OwaWv8IivxhpEHneCHt9+kFQkefn3c
        opaFipZnf19gUFPJs0/PH9c+GLyi20RvQciduNSSnQ==
X-Google-Smtp-Source: ABdhPJxNQUczDFy7+X9laWNw8HAiSAl8diMPy3LtKv4U3uWIE7CFniKpvhHwll3xsreB7iQhBeAQ/hOY8lGcQt4mIz4=
X-Received: by 2002:a67:e915:: with SMTP id c21mr6805876vso.19.1622543647735;
 Tue, 01 Jun 2021 03:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <1622095949-2014-1-git-send-email-rnayak@codeaurora.org> <1622095949-2014-2-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1622095949-2014-2-git-send-email-rnayak@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 1 Jun 2021 12:33:31 +0200
Message-ID: <CAPDyKFprcA3DJW4bxef88oekpB5cNCkgy73_=mr40YWjNphvOw@mail.gmail.com>
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

I don't have a strong opinion about using "default-performance-state"
or "assigned-performance-state". Although, perhaps people can relate
to the existing "assigned-clock-rates" DT binding?
In any case, please add:

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

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
