Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D433C4FE4A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Apr 2022 17:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357032AbiDLPX7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 11:23:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357046AbiDLPXs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 11:23:48 -0400
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73F1C1C936
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 08:21:29 -0700 (PDT)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-de3ca1efbaso21092367fac.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 08:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Qu3x8sdL450TLQDqbPVZSB+mpayh/+CyyZ7ypbjcaSU=;
        b=r6cizZbLbT+19O9rXJANpT82cGCsvqn2fYt+NJUHZ8fWAx5bqrlJO1ag9v+NDtvUQF
         dgcyRF7V4pQ6a7huSydcAB2zpQZk8DNUK/w6mGMoFUUeotYHOYeGBOucp9BP+KopXz7r
         O2xrj9ulrpRv7XGAdFDjVmdcUgtCQQcxy92strzrfd68YVAGjofGmylhBoURLQjuD1D/
         K7QretzqMAeumMbaAmOMG+age3q4DNJBSPh2Bu6J5lH3ChfrXR4DOZ+++4Pe2na04YJH
         dBjXX23PBn5/Kn3szYQOVTT+nCDJDBhpcIY4LO/cj9sRSW2GeCTIVQK95Qb2s8YHhm4i
         7Tpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Qu3x8sdL450TLQDqbPVZSB+mpayh/+CyyZ7ypbjcaSU=;
        b=xFWeMqRtYlc5tdACswpmGAvLex1v0N7HRZVw/e+eMgONsW3ECt3vz/9o8DEMOvJn5G
         QTxWeN3nKfjzkGHXQBUlIRoyZ2K+DUjp/LrgVxLBWJHKZPYt+/8zidloyuvMvnojZXGV
         sHMNkJ5oBNPZKWBMvaFogR7q5Zwt846qa0nVadFgUszFXoyDLw3h3tSTpLrRI8WyAXhn
         HkXG77nfiypbr41uRMHmLCQjSHlQJTUBniOBLKkraySq+w48ihDxLyLTWNu3mKf3QmBd
         evg6caPM8IUg8tlUekT25b6VcC0EH7uU9zX2O8uJi1WMtBNpWs8ssRtYxJIbH+EKtxUW
         cF6A==
X-Gm-Message-State: AOAM531PCmmk6S2eaGhdPMSGyPZS0XqCwJJ5ZFxIa7CJDusBij+Z+kZ3
        6NfOo2KtLZk0dKT4Ph2ONVhrfw==
X-Google-Smtp-Source: ABdhPJwSMU6rLdoiFiE1YWIqEnAgFX38AXPmGE4lImEOYvnaGOANJ32c//Fqg3miUjWLSjDcu6Zvjw==
X-Received: by 2002:a05:6870:e893:b0:e2:ecbc:e581 with SMTP id q19-20020a056870e89300b000e2ecbce581mr2203328oan.193.1649776888814;
        Tue, 12 Apr 2022 08:21:28 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id n6-20020a9d6f06000000b005b266e43c92sm13460871otq.73.2022.04.12.08.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 08:21:27 -0700 (PDT)
Date:   Tue, 12 Apr 2022 08:23:42 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [RFC PATCH v2 2/6] dt-bindings: opp: accept array of frequencies
Message-ID: <YlWZfioKrHO9tqQv@ripper>
References: <20220411154347.491396-1-krzysztof.kozlowski@linaro.org>
 <20220411154347.491396-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411154347.491396-3-krzysztof.kozlowski@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 11 Apr 08:43 PDT 2022, Krzysztof Kozlowski wrote:

> Devices might need to control several clocks when scaling the frequency
> and voltage.  Allow passing array of clock frequencies, similarly to the
> voltages.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  Documentation/devicetree/bindings/opp/opp-v2-base.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/opp/opp-v2-base.yaml b/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
> index 76c8acd981b3..1d7216008f95 100644
> --- a/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
> +++ b/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
> @@ -50,6 +50,14 @@ patternProperties:
>            property to uniquely identify the OPP nodes exists. Devices like power
>            domains must have another (implementation dependent) property.
>  
> +          This can be also an array of frequencies for each clock provided to the
> +          device.  In such case value of 0 means the clock frequency should not
> +          be configured for given clock.
> +        minItems: 1
> +        maxItems: 16
> +        items:
> +          maxItems: 1
> +
>        opp-microvolt:
>          description: |
>            Voltage for the OPP
> -- 
> 2.32.0
> 
