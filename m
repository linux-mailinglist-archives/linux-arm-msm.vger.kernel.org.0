Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DACB63D4D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Nov 2022 12:44:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230367AbiK3LoO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Nov 2022 06:44:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230024AbiK3LoM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Nov 2022 06:44:12 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC72921819
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 03:44:11 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id r12so26566447lfp.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 03:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y9yJDw7jQa8FtfXxgIb0JYkVeCEXPLGYIKCFkGrSREw=;
        b=UGpjEPZ97Pu9DJeOe1hWCjuFR9Eu6eOGgWFHe4iUl3+7gtVjtaz9a83FJSYevpzhwb
         Dq5rPpuwcBV9zdhEPMCTEwNUK2I4lite69lwRJr+mXvBbqdliiRXHrGrPpIQiCDLqyWQ
         4t6B6uXz1gS5LUObli78nSxxxAaJsiTsHOwvFAQ7iI44/R7Tpe9oe7GUvzZthXxXMPFw
         mQ4FSyjF9n6ljlkvVntgC7WTEyPWxTT0bNn0aDR+17BPqot6iY6wbRVpYLsZMUr9eswZ
         ELMg9+S0nmMSGkMzIKqPqeXiSn5071KW4YsoiHnh0X348f1UX7MQ6K/RqvgAVCLO7wj7
         AiHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y9yJDw7jQa8FtfXxgIb0JYkVeCEXPLGYIKCFkGrSREw=;
        b=QqWKiZAqmPWvN8OKvqe3ICImBDWNwz+IGO1EcINA0JCPXdanGx1ljocJS59YCqgORm
         t3XbVu6PKk+laKS8M0RpmsSUVjpTSI9UEn4+pZM2uVgqfvFakfi2x/jyuDkoIV4IROlo
         RdauH26gTjIpfHZXt6x2rdnVddROcfN6DZ7iGTh+/DDCYjydXnmxTMCFneCDaRAk2s+X
         Wvt82LmIZ+n+olrbprH87v2EyOQGB4R00Dbtf5Fq6Zq1MROZ6hTAs9ZJ8jZpuu8BO1d2
         gzCGEDLto3K+FzK0/wvzW2sXCHO/YDzDXdtQDnMJ3MAX3czM0MgLQgXNzpr2sKDiXaiO
         Dc0A==
X-Gm-Message-State: ANoB5pmaIOuvYVOipJ9sKjCNXi/7whEq+lQf1c14Rf+G8thxz9c8LJBD
        bigsdIXW35mnqhIduJiyzc6DZtXpi9FSXAuncXQ31w==
X-Google-Smtp-Source: AA0mqf58D+L4fEiQFB+gcsf9n3lYXA6WARc2EHecI4ek/hmYzjo0O4aJaD+C1iV5vQ3P1wO97XMdokJUY9WhE4orCVY=
X-Received: by 2002:a05:6512:34d0:b0:4a8:ebec:7140 with SMTP id
 w16-20020a05651234d000b004a8ebec7140mr20448925lfr.150.1669808649915; Wed, 30
 Nov 2022 03:44:09 -0800 (PST)
MIME-Version: 1.0
References: <20221130103841.2266464-1-bhupesh.sharma@linaro.org>
 <20221130103841.2266464-3-bhupesh.sharma@linaro.org> <5d3ff57a-cb51-5dbf-7d38-7cc40aeea59c@linaro.org>
In-Reply-To: <5d3ff57a-cb51-5dbf-7d38-7cc40aeea59c@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Wed, 30 Nov 2022 17:13:58 +0530
Message-ID: <CAH=2NtzOdYS1K4Qt6nje=Yo1g5mxp1p6k6MMisAyV-wUnZWkPA@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: interconnect: Add SM6115 DT bindings
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        djakov@kernel.org, konrad.dybcio@linaro.org, a39.skl@gmail.com,
        andersson@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Krzysztof,

Thanks for your review.

On Wed, 30 Nov 2022 at 17:11, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 30/11/2022 11:38, Bhupesh Sharma wrote:
> > The Qualcomm SM6115 SoC has several bus fabrics that could be
> > controlled and tuned dynamically according to the bandwidth demand.
> >
> > Add the support for the same.
> >
> > Cc: Bjorn Andersson <andersson@kernel.org>
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
>
> Thank you for your patch. There is something to discuss/improve.
>
> We could create common properties for these bindings, but it's fine now.
>
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/qcom,rpmcc.h>
> > +
> > +    snoc: interconnect@1880000 {
> > +        compatible = "qcom,sm6115-snoc";
> > +        reg = <0x01880000 0x60200>;
> > +        #interconnect-cells = <1>;
> > +        clock-names = "bus", "bus_a";
> > +        clocks = <&rpmcc RPM_SMD_SNOC_CLK>,
> > +                 <&rpmcc RPM_SMD_SNOC_A_CLK>;
> > +
> > +        clk_virt: interconnect-clk {
> > +            compatible = "qcom,sm6115-clk-virt";
> > +            #interconnect-cells = <1>;
> > +            clock-names = "bus", "bus_a";
> > +            clocks = <&rpmcc RPM_SMD_QUP_CLK>,
> > +                     <&rpmcc RPM_SMD_QUP_A_CLK>;
> > +        };
> > +
> > +        mmnrt_virt: interconnect-mmnrt {
> > +            compatible = "qcom,sm6115-mmnrt-virt";
> > +            #interconnect-cells = <1>;
> > +            clock-names = "bus", "bus_a";
> > +            clocks = <&rpmcc RPM_SMD_MMNRT_CLK>,
> > +                     <&rpmcc RPM_SMD_MMNRT_A_CLK>;
> > +        };
> > +
> > +        mmrt_virt: interconnect-mmrt {
> > +            compatible = "qcom,sm6115-mmrt-virt";
> > +            #interconnect-cells = <1>;
> > +            clock-names = "bus", "bus_a";
> > +            clocks = <&rpmcc RPM_SMD_MMRT_CLK>,
> > +                     <&rpmcc RPM_SMD_MMRT_A_CLK>;
> > +        };
>
> Drop last two nodes - they are the same as first.
>
> > +    };
> > +
> > +    cnoc: interconnect@1900000 {
> > +        compatible = "qcom,sm6115-cnoc";
> > +        reg = <0x01900000 0x8200>;
> > +        #interconnect-cells = <1>;
> > +        clock-names = "bus", "bus_a";
> > +        clocks = <&rpmcc RPM_SMD_CNOC_CLK>,
> > +                 <&rpmcc RPM_SMD_CNOC_A_CLK>;
> > +    };
> > +
> > +    bimc: interconnect@4480000 {
> > +        compatible = "qcom,sm6115-bimc";
> > +        reg = <0x04480000 0x80000>;
> > +        #interconnect-cells = <1>;
> > +        clock-names = "bus", "bus_a";
> > +        clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
> > +                 <&rpmcc RPM_SMD_BIMC_A_CLK>;
> > +    };
>
> Drop these two as well, they do not bring anything new here.

Ack for both the suggestions. I will fix and send a v2 shortly.

Regards,
Bhupesh
