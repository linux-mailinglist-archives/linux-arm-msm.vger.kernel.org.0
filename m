Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03FBE55DE67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:29:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343582AbiF1Hy2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jun 2022 03:54:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244707AbiF1Hy1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jun 2022 03:54:27 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E0BC15FED
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 00:54:26 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id c4so10343089plc.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 00:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dJVjS7qYT4J+PCsZ1K9d6LpywBxG8RhHWz9gmOPpvc8=;
        b=Pb9keaFWPqhTpaGk4Ozd5H5wRVaOpFoz0S6sfpV563YeaE7Fngg12DkzTrO4W1yV57
         ZEPd1+fmb3O/IX8spyIfTyore5aZb+tg/d9OWVOtMj0kt19nj0A9Jmorz/kp9GWOPX8/
         maC4kJX0pRlEjRRDpxsa6+ZME3zmS4oCt2M+1qiqdXjxEuive6BRW4rwP3edRWcgLB6p
         mqSmBOHcJFOfkyp3HK16bVhs2ulDEG/vegXIehu+VZshF8aNC6xjEgL6R/5e+Uj1idhn
         7CbwuLzefFBVOVpHxYYrfFkKOgXfLsoLYVpXdEsqf965wsgLP24aRLh+L0nWGyAFfmvJ
         4t3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dJVjS7qYT4J+PCsZ1K9d6LpywBxG8RhHWz9gmOPpvc8=;
        b=uzdKtFANtPHq0mrLWgFhVQx9cdi1aXWYNEUG2EtMnSCaM+/z3M2t+HP7I2JWJBs+eo
         aPmmz0b3AlVamw5Eqo7vQOTTDhBlFkxGsuMpapjH5xViT399Kc8x8Uqpa0tkxrKTvcEj
         yJLyoSI1tM8WGwbjn7b/B0B0FVeSXsptfEpdHzdvLiC2e1xnaiFq0RayUTTloQt1r27K
         IhUCY2YLUYiGCJKlBmb3BwJruCb6Z3ErXGqKENdZVoxA482taSDBYpKSU66VvWFDAHxj
         tzjELEZefV0yclxxbJPGkJXD4egf3txX9kiUWau5osOvxhLMd6v7Gh9nzQ3bY11ZhzR4
         t4Jg==
X-Gm-Message-State: AJIora9SnBnTMnYKTtuIhObH6UmfdNKi61lX89+G3ZPToQmnwxc0K4XJ
        1Wb6ToAKnZINGyhG49Geuk0vLw==
X-Google-Smtp-Source: AGRyM1vxUjAzpsckKYJF3Fg9hdQarUvha/sDXLBNFq8F8AU7cwCEX1vB3EetZrWM23wuCYDGdcYTxQ==
X-Received: by 2002:a17:90a:ff0d:b0:1ec:902b:e46e with SMTP id ce13-20020a17090aff0d00b001ec902be46emr25969847pjb.167.1656402865597;
        Tue, 28 Jun 2022 00:54:25 -0700 (PDT)
Received: from localhost ([122.172.201.58])
        by smtp.gmail.com with ESMTPSA id mh8-20020a17090b4ac800b001df264610c4sm1345782pjb.0.2022.06.28.00.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 00:54:25 -0700 (PDT)
Date:   Tue, 28 Jun 2022 13:24:23 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Ilia Lin <ilia.lin@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: cpufreq: qcom-cpufreq-nvmem: fix board
 compatible in example
Message-ID: <20220628075423.nfce27jj5lpibyju@vireshk-i7>
References: <20220627143340.477120-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220627143340.477120-1-krzysztof.kozlowski@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27-06-22, 16:33, Krzysztof Kozlowski wrote:
> In the example, alone compatible "qcom,qcs404" is not correct.  Add
> proper board compatibles for QCS404 Evaluation Board.
> 
> Reported-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Can be picked up independently, although the issue reported by Rob was
> caused by:
> https://lore.kernel.org/all/CAL_JsqKXDs=QHKob2Xy6vAFZfnkM9ggfmqf9TNA1hv8TScTmgQ@mail.gmail.com/
> ---
>  .../devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml       | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
> index a9a776da5505..10b3a7a4af36 100644
> --- a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
> +++ b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
> @@ -63,8 +63,8 @@ additionalProperties: true
>  examples:
>    - |
>      / {
> -        model = "Qualcomm Technologies, Inc. QCS404";
> -        compatible = "qcom,qcs404";
> +        model = "Qualcomm Technologies, Inc. QCS404 EVB 1000";
> +        compatible = "qcom,qcs404-evb-1000", "qcom,qcs404-evb", "qcom,qcs404";
>          #address-cells = <2>;
>          #size-cells = <2>;

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
