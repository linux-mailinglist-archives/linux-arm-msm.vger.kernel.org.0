Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB0D5644DC0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Dec 2022 22:06:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbiLFVF7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 16:05:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbiLFVF5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 16:05:57 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F33114664F
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 13:05:52 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id kw15so5953193ejc.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 13:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=APf10OLY3mtfkubRJpUpc31SrBMFn3lxX7iZQ4xQ0uY=;
        b=uJxN7aR8O0reHgZqy5XrHVCw+sJmg6R+/LQxbxKqFqbQSP8UQ2b4/gOyrMCGfqn6IQ
         c+BWInM1Z/XSvIdUG94juJMGpfsuXm6rUqu0aAV59xrZ2qBE4VxINCYJxAChyNdQB3Zm
         mQA9FVnz20Gkt6jraTOsHWEgtlF9M201ZlvMzvZbu/DVKyyOdRJkQNz9iKrP3dtWMglN
         /VPP4BkAkunhMhELA3vPLrG1nI5Ki3H9q1gHN+baWObClFN0r9Py4MRCFBHabRIPr4s9
         vfcDhn6IWoocW9iDuB8NHTiTJ8VAqo4QA66fA/+ig6LUMfZkFVULUNRsUoW6DSVo8DTF
         OP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APf10OLY3mtfkubRJpUpc31SrBMFn3lxX7iZQ4xQ0uY=;
        b=AfxvfLuINKFMtJLM4Xa6zhu+l6MrB+RVg2jDiLPV/dF7ilI9nNvhpLpfb9Kd13UGG4
         +oyQ2dKrO1PNwfhkQltIO5zVtNp5suZOLw16qSCkfULUCLqlM7eJcKTjTim6Tw2B874a
         VMPg58QrGSAkiw271ZZyTS9KzpgqxeVkM5XRO6Ld7LMiHWz2RYfWxjOepY+cNJRoewY9
         ALpQkyTbbG9fQISSwS4IxCcRh+XAtJo3JvcKSbPgsiEM3UGVAoer0HAPhm77jfz7u1wg
         LzJ1Yp0JyAZOWhhgFBptXHhpm5iUQeQv/ZYwLV9TJLfzdaZX6XQrbPPDjx+VXmOcKZqu
         wN4A==
X-Gm-Message-State: ANoB5plyRoFWd5kFRlb7v2GdMZlWGtEHHxLnEsBpcctx+ltVLI4hO8SN
        gANGx3eB4VB961Iy/w2ZBoLtWg==
X-Google-Smtp-Source: AA0mqf79uoBOQY684/QmNa2+BoMpjxGm4zltJT+RZlCgB1c74qUxAPgSy30cjKv8BUL5p3Qu7hErYw==
X-Received: by 2002:a17:906:9c89:b0:7c1:1e5b:1db8 with SMTP id fj9-20020a1709069c8900b007c11e5b1db8mr56558ejc.39.1670360751543;
        Tue, 06 Dec 2022 13:05:51 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id g1-20020a17090604c100b0073dc5bb7c32sm7762462eja.64.2022.12.06.13.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 13:05:51 -0800 (PST)
Date:   Tue, 6 Dec 2022 23:05:49 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 1/5] dt-bindings: clock: Add SM8550 TCSR CC clocks
Message-ID: <Y4+urc4ZM42zflkk@linaro.org>
References: <20221206125635.952114-1-abel.vesa@linaro.org>
 <20221206125635.952114-2-abel.vesa@linaro.org>
 <33d261f6-ab3d-7470-8e3d-6943c3fa9297@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33d261f6-ab3d-7470-8e3d-6943c3fa9297@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22-12-06 16:35:16, Krzysztof Kozlowski wrote:
> On 06/12/2022 13:56, Abel Vesa wrote:
> > Add bindings documentation for clock TCSR driver on SM8550.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >  .../bindings/clock/qcom,sm8550-tcsr.yaml      | 53 +++++++++++++++++++
> >  include/dt-bindings/clock/qcom,sm8550-tcsr.h  | 18 +++++++
> >  2 files changed, 71 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> >  create mode 100644 include/dt-bindings/clock/qcom,sm8550-tcsr.h
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> > new file mode 100644
> > index 000000000000..15176b0457d1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> > @@ -0,0 +1,53 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm TCSR Clock Controller on SM8550
> > +
> > +maintainers:
> > +  - Bjorn Andersson <andersson@kernel.org>
> > +
> > +description: |
> > +  Qualcomm TCSR clock control module provides the clocks, resets and
> > +  power domains on SM8550
> > +
> > +  See also:: include/dt-bindings/clock/qcom,sm8550-tcsr.h
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,sm8550-tcsr
> 
> This still misses syscon. Did you send it before we talk on IRC?

Oups, I forgot to squash that part in.

Will send a new version.

> 
> Best regards,
> Krzysztof
> 
