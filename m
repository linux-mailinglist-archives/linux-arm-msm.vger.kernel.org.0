Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 373A4510092
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 16:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235589AbiDZOjj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 10:39:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351742AbiDZOjR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 10:39:17 -0400
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DD1113A2C9;
        Tue, 26 Apr 2022 07:36:09 -0700 (PDT)
Received: by mail-oi1-f175.google.com with SMTP id v65so16155060oig.10;
        Tue, 26 Apr 2022 07:36:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BKz27xjENn2dqQwcuHoytM2LiUIHNQx317aKGLFn1nA=;
        b=sKwPNNWbUXiWwcEDKPLPrsSWL2SK8EEf2SZC4EK5alIQEJydL4boqVm+O8BaZnEvXg
         3XnRHRTZpOHiFgBPOPtQm1bjpz/LNN0eQ7xpLPzYz2ihQZtyk9EIEs1lPGlumywmWROz
         Txtihf+DooiX6X5yTKl/hfmPQHgoNJvZVd4ldL6RCYyn1s28/dtiPiifEWcXd+Us4YnO
         QmCVcDeSNWOVvXJJlxqazbR0ulwRDjRCQ2FrYwsKIAowEA/6hfabfYH73vlz0V+zzS93
         GfpXMN4kaXJRCNaW5nS+bZeXTn0lT2V8yN1j+M9FJloGZQ+Nj51VKpmoE5iZfMFttXNu
         LqiQ==
X-Gm-Message-State: AOAM530W1wgl+6AaiegsGHsuwaQg+a4kWQnbxO7jMT1BvWglOxoQE95T
        gd4RPXfmLF5S92d7cQcHBQ==
X-Google-Smtp-Source: ABdhPJzZ6umTB6cveiNT/3a6G9nFAAAkglX0p2BOuAq+o5kBRE6eba6sXuaqa5J24T4St9aSTTd/uw==
X-Received: by 2002:a05:6808:1709:b0:2f9:30ec:c95b with SMTP id bc9-20020a056808170900b002f930ecc95bmr14452302oib.240.1650983768539;
        Tue, 26 Apr 2022 07:36:08 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d3-20020a9d2903000000b005cda765f578sm4934662otb.0.2022.04.26.07.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 07:36:07 -0700 (PDT)
Received: (nullmailer pid 1948504 invoked by uid 1000);
        Tue, 26 Apr 2022 14:36:07 -0000
Date:   Tue, 26 Apr 2022 09:36:07 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: clock/qcom,gcc-apq8064: move msm8960
 compat from gcc-other.yaml
Message-ID: <YmgDVzRMELjQIrb5@robh.at.kernel.org>
References: <20220426093608.2957210-1-dmitry.baryshkov@linaro.org>
 <20220426093608.2957210-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426093608.2957210-3-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 26 Apr 2022 12:36:08 +0300, Dmitry Baryshkov wrote:
> MSM8960 shares the design (and the driver) of the global clock
> controller. Move it from clock/qcom,gcc-other.yaml to
> clock/qcom,gcc-apq8064.yaml.
> 
> As the eaxmple in gcc-other.yaml was using the msm8960 compat string,
> change it to qcom,gcc-msm8660.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc-apq8064.yaml         | 6 ++++--
>  Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml | 5 ++---
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
