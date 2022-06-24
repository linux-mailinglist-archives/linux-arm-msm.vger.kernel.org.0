Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E38B1559F51
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jun 2022 19:26:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232212AbiFXRYu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jun 2022 13:24:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232224AbiFXRYd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jun 2022 13:24:33 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D74D140AB
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 10:23:00 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-101ec2d6087so4662399fac.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 10:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=L1LsHWFKG+99YZtTVfbZXke7/Fw4nSx0rDnGuVjotKk=;
        b=GkZ3LIEaKHWfF8ytJkF4Mrlr6+RDIaitMljk54b47mw8ul6p92zvtqi+xQBIacQEt+
         u/tvl33HFDzxpwNTXN33W/oCxmlBm5AeigeFNRSzSaEuzRMQOR+cwlAoYJQWvDyk52Zb
         7F2i9YYM/6dQ9zYGPTdhBugSPgsQhwDSTEY7Wwq1wC6MfJEYGUNCuTqA7t0CfGiZNbu7
         svIV17dSTY0oEiXrDvpcVcrzZByNsKTzaYmQcRIv5x81I0q9dMGJGe5V+9t66m8EMY8S
         23nnteJQ9uELdnWI89VrHE7MA9ul0RwytytUgBRb3vGquVBqB5HWeiX0paFHYymm/ntQ
         K5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=L1LsHWFKG+99YZtTVfbZXke7/Fw4nSx0rDnGuVjotKk=;
        b=Eq0pkuvAzN82TSo782+mhQzAdpNkJ/0qMBXOvC+OGXjyk3gOihW4/vyI9h1fArDem1
         abNoQN91HRC0p3ifs/nzPsoURrwQhN6FZ4heGwNwOjfFYs/H7sKfjJuyQimAc2MTPgvp
         jyDmHjr2Uv0zqlsIZ0YfwDxAjFjpYvb3IzrrRdzCRkZQnG1Dn8y3fc9M2LywGSw6qg1I
         R9vS4E4Tot8/8q9xOqYq4b7XLkmKPqmbtVfeQcU8hc0dEog4pjKlFYd/JZ1NFTCZBclu
         fjx0jkyh6r6Uv+M7GGTABheK8FhsTYKXUNTi68TYEzK+kZNSgyG9KRUjHSFNQWTq+AFM
         6jig==
X-Gm-Message-State: AJIora+WqLGW3wMzmB7xqaB7Hs9+oNcwtvTGU2ObqRgS3nz4sTC/Dv5j
        NPNnP8KN8a/GYw5Pj8qHYFIvHg==
X-Google-Smtp-Source: AGRyM1ucIUqODgba9WnMdqPTLnQQHUmgA+7AYLAwY36RlBgRBLiafTzPlKwMPpBZuzNiDyRcYWE8Dw==
X-Received: by 2002:a05:6870:17a9:b0:fb:4e7d:5b95 with SMTP id r41-20020a05687017a900b000fb4e7d5b95mr2736602oae.286.1656091370937;
        Fri, 24 Jun 2022 10:22:50 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a28-20020a0568301ddc00b00616b06d520dsm651264otj.5.2022.06.24.10.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 10:22:50 -0700 (PDT)
Date:   Fri, 24 Jun 2022 12:22:48 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v8 1/7] dt-bindings: clock: add QCOM SM8450 camera clock
 bindings
Message-ID: <YrXy6H+GZ0jhM3R/@builder.lan>
References: <20220624115917.2524868-1-vladimir.zapolskiy@linaro.org>
 <20220624115917.2524868-2-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220624115917.2524868-2-vladimir.zapolskiy@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 24 Jun 06:59 CDT 2022, Vladimir Zapolskiy wrote:
[..]
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> new file mode 100644
> index 000000000000..e3503e322ffa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Camera Clock & Reset Controller Binding for SM8450
> +
> +maintainers:
> +  - Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> +
> +description: |
> +  Qualcomm camera clock control module which supports the clocks, resets and
> +  power domains on SM8450.
> +
> +  See also dt-bindings/clock/qcom,camcc-sm8450.h

Please prefix this path with include/

Regards,
Bjorn
