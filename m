Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26123422FC0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 20:10:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234144AbhJESMq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 14:12:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235005AbhJESMl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 14:12:41 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52CA7C061760
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 11:10:50 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id r43-20020a05683044ab00b0054716b40005so26951607otv.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 11:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=PmGzQuIqk2k4kzsoKeBKvFVdnEBiz+RKXSuRjoeZURM=;
        b=B0mBiHAsN8I7BNS/mU4QppQq4xPSJV3whZyZvOYVXy07yim5yqBpDFH0m9G11EeiuC
         I+zhgIBakhE9uiJrK5pMepAaCUUaBvbcVLWKldqhoPO8hW4DjWfzHT8QQp7xjLnP4kBB
         +1evPf4JRJfCPzB4fh6k8lS3Js8Ys//I8stWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=PmGzQuIqk2k4kzsoKeBKvFVdnEBiz+RKXSuRjoeZURM=;
        b=iV/ZmUNCdLPnRfsOx4Mkla+TyRuLP6aXT/t6CUGafi9T8dTnZiaoHUocbaNgjBk9BF
         aI67hnR4XhHuzfKv5dVioon0Jn+ZVuDWm2mRINdTIDSGbLzH0ruLywkIc2AXjry1yPQ0
         EtTWMHntVQoY4nf9zymIMTwGejNeF1QKaNEhSGois7HZqdaZWsuLoR3mOfcRreIFNVG8
         6BQJ+SQdT/bH8awv/+cKT8GZnRtnfNcJ32OXNyD0lq+oKEtBgM4Zqoow3jnGuPQtoAPE
         ek5HDxzYwLlRNtQsGs208kbzCmQtvU5Kcj4CnXLOaPty3pZ/rUmeAQcbSlbqO6xHPF1c
         Iq2A==
X-Gm-Message-State: AOAM531mnWr940MxRdViyHGp8Qe/b4LEqrotaGT3gT5O6JNo4Vz+sYp2
        zOGMwBdsZ4BI9O/BJvGTHZ32bGLXdHTEpPmuUXIDFg==
X-Google-Smtp-Source: ABdhPJwEEYUyuAtHy0el1QmjpZCJ0OjboZgnL5mSaQ5E0Rrbqy4svm1Ycwg7yYumXkdwlxQqYdw4gbsY9g/XLo/ffjw=
X-Received: by 2002:a9d:1f4:: with SMTP id e107mr15358336ote.77.1633457449530;
 Tue, 05 Oct 2021 11:10:49 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Oct 2021 11:10:49 -0700
MIME-Version: 1.0
In-Reply-To: <1633060859-22969-3-git-send-email-skakit@codeaurora.org>
References: <1633060859-22969-1-git-send-email-skakit@codeaurora.org> <1633060859-22969-3-git-send-email-skakit@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 5 Oct 2021 11:10:49 -0700
Message-ID: <CAE-0n51pCkrdOSJFf3V4HGB5PcUcRa2y6zRQbQ30i-hQVhjC=Q@mail.gmail.com>
Subject: Re: [PATCH V2 2/4] dt-bindings: mfd: pm8008: Add pm8008 regulator node
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Satya Priya <skakit@codeaurora.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        collinsd@codeurora.org, subbaram@codeaurora.org,
        kgunda@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya (2021-09-30 21:00:57)
> Add pm8008-regulator node and example.
>
> Signed-off-by: Satya Priya <skakit@codeaurora.org>
> ---
> Changes in V2:
>  - As per Rob's comments changed "pm8008[a-z]?-regulator" to
>    "^pm8008[a-z]?-regulators".
>
>  .../devicetree/bindings/mfd/qcom,pm8008.yaml       | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
> index ec3138c..0c9665e 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
> +++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
> @@ -45,6 +45,10 @@ properties:
>      const: 0
>
>  patternProperties:
> +  "^pm8008[a-z]?-regulators$":

Please just call it 'regulators'

> +    type: object
> +    $ref: "../regulator/qcom,pm8008-regulator.yaml#"
> +
>    "^gpio@[0-9a-f]+$":
>      type: object
>
> @@ -122,6 +126,26 @@ examples:
>            interrupt-controller;
>            #interrupt-cells = <2>;
>          };
> +
> +        pm8008-regulators {

Please just call it 'regulators'

> +          compatible = "qcom,pm8008-regulator";
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          vdd_l1_l2-supply = <&vreg_s8b_1p2>;
> +          vdd_l3_l4-supply = <&vreg_s1b_1p8>;
> +          vdd_l5-supply = <&vreg_bob>;
> +          vdd_l6-supply = <&vreg_bob>;
> +          vdd_l7-supply = <&vreg_bob>;
> +
> +          pm8008_l1: regulator@4000 {
> +            reg = <0x4000>;
> +            regulator-name = "pm8008_l1";
> +            regulator-min-microvolt = <950000>;
> +            regulator-max-microvolt = <1300000>;
> +            qcom,min-dropout-voltage = <96000>;
> +          };
> +        };
