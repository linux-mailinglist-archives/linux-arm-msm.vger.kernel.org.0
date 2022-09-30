Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03A2F5F1115
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 19:45:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229594AbiI3RpW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 13:45:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbiI3RpV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 13:45:21 -0400
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0993FA5C0;
        Fri, 30 Sep 2022 10:45:19 -0700 (PDT)
Received: by mail-oi1-f180.google.com with SMTP id m130so5428668oif.6;
        Fri, 30 Sep 2022 10:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=oA8vjf+oEK7/6CmiiKkGDsr2L2BO0kznifjtJdNNi7M=;
        b=GlXOByoDUbYgXHA2FXPJcK0zhAZklfhtv7tH/NwHL7q45P4tqxXP1FQuaba5udB7Vm
         bODU814FkZxosqih9KU+WRP35GaE/kolqf5mgeQ8kZqr4hU8RnKm8FkXJbql2J1+ajqJ
         bu8rQf9ltYRbtcx2Z79mWE0szNXu5RIXvyBFD46FajJOG3Js//KjjQf/GjJcVvR7s3Gr
         Z7Vv4ZyRafLx0aHuftwxE+bfcg3rHoCqdMKNB6vWTsa4LxbyV6SCaC3lgQOM0UGThe6J
         AX5pAz3VpEHOgfj46fGtlwJcw1lFtokx2cndGT61Hf7o+bpo/mlzfwPErgCO6pqe2CWS
         BFUw==
X-Gm-Message-State: ACrzQf0xqMxuLISgVz+vRySS+gHoa2ZA4QqGH6hKlESKqmVZxL5TD3JJ
        5bUthGhJUqwLXNKGLbl+G+KcFjDhJg==
X-Google-Smtp-Source: AMsMyM6TAbFxGS4TndhN4N8aHuZF+Iz3Y4Rwch27qWsHMv3QuZnmkGXEOvRqNM7LcI6Ty/xZz7igdg==
X-Received: by 2002:a05:6808:6cd:b0:34b:73b3:416b with SMTP id m13-20020a05680806cd00b0034b73b3416bmr4263255oih.196.1664559919167;
        Fri, 30 Sep 2022 10:45:19 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q19-20020a9d6313000000b0065c3bb3c72esm695038otk.14.2022.09.30.10.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 10:45:18 -0700 (PDT)
Received: (nullmailer pid 567099 invoked by uid 1000);
        Fri, 30 Sep 2022 17:45:17 -0000
Date:   Fri, 30 Sep 2022 12:45:17 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH v2 01/11] dt-bindings: clock: split
 qcom,gcc-msm8974,-msm8226 to the separate file
Message-ID: <166455991729.567045.15845722857981778415.robh@kernel.org>
References: <20220929092145.473009-1-dmitry.baryshkov@linaro.org>
 <20220929092145.473009-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220929092145.473009-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 29 Sep 2022 12:21:35 +0300, Dmitry Baryshkov wrote:
> Move schema for the GCC on MSM8974 and MSM8226 platforms to a separate
> file to be able to define device-specific clock properties.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/clock/qcom,gcc-msm8974.yaml      | 64 +++++++++++++++++++
>  .../bindings/clock/qcom,gcc-other.yaml        |  9 +--
>  2 files changed, 65 insertions(+), 8 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8974.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
