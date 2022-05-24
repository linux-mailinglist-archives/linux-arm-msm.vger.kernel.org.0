Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4927453209B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 May 2022 04:05:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233023AbiEXCEy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 May 2022 22:04:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231326AbiEXCEx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 May 2022 22:04:53 -0400
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5ABA986CF;
        Mon, 23 May 2022 19:04:52 -0700 (PDT)
Received: by mail-oi1-f171.google.com with SMTP id w130so19974014oig.0;
        Mon, 23 May 2022 19:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vmmjhxRYn3NE3b5jfw8VfnnrkCiUVhOKLxzKMNvq1N0=;
        b=bVISsRmAr67T3YfehNcrx1QVJ2vRaT2a5jJBddl9GkY4WH6anXtmMEUYHO2E8D3z5e
         sIvPq+2EXuMUhh0KzbNAsQhr7LBYeTwoz032NsF0QaSvfKddNfv/ZmF70Flz3IdKwyHJ
         hgF8Se0XhR+GOUm/4kJQszQ31vbsCisSJcThm1RIHFxzidKhYwtY238nVd6b92jDqXbo
         1bZO8eZVqSLtegjeFAenm9RTI1trPH4mCboZK9i+uqRJfN9QV0qjgeE5fUSBsv7LaGnd
         URahX/wLoU2qOAKQZOHNHMULedt4laRZz6mJg3xK2KfMbaS1zd4uX9NbqVJ2ZxV2jD7I
         nK9A==
X-Gm-Message-State: AOAM5301RZfmPTHdTdwQ8V2vd7r0Zo4zJ7x7+HkM4qKLxBVIHzCCZDsg
        JuWf3AZ+7ipjB4GoIaNGag==
X-Google-Smtp-Source: ABdhPJwfRKBvjfI8EBTg8Td1U85383uxtnx4krnSmBmak3g12YxPar0L58FpkpJ463TYWXG1UIXK3w==
X-Received: by 2002:a05:6808:1202:b0:322:dc37:2c3b with SMTP id a2-20020a056808120200b00322dc372c3bmr1164376oil.298.1653357892257;
        Mon, 23 May 2022 19:04:52 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b129-20020aca3487000000b0032af475f733sm4630449oia.28.2022.05.23.19.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 19:04:51 -0700 (PDT)
Received: (nullmailer pid 2604285 invoked by uid 1000);
        Tue, 24 May 2022 02:04:50 -0000
Date:   Mon, 23 May 2022 21:04:50 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH v7 10/11] dt-bindings: arm: qcom: document sda660 SoC and
 ifc6560 board
Message-ID: <20220524020450.GA2604251-robh@kernel.org>
References: <20220521202708.1509308-1-dmitry.baryshkov@linaro.org>
 <20220521202708.1509308-11-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220521202708.1509308-11-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 21 May 2022 23:27:07 +0300, Dmitry Baryshkov wrote:
> Add binding documentation for the Inforce IFC6560 board which uses
> Snapdragon SDA660.
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
