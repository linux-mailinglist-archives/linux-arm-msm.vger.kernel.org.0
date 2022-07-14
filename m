Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF29575555
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 20:49:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240837AbiGNStV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 14:49:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232223AbiGNStD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 14:49:03 -0400
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3331A1C135;
        Thu, 14 Jul 2022 11:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1657824538;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=Sz6/VwSd6Iv2+H61RsdetR+q72wGE3EyN979iXWsddA=;
    b=Zrdak9v7HF4nMMW8247LdaCvzgGs/F66WDrOL6v6wQSySNj/X0c8IOUFIvufFq3yrj
    36NgX51NO74qN6zpn4P/1VQiMligifaobZfHxX7b2CK+nw7DC/D0XaNIhJHJTLVCy92n
    iHkMKgHmMYImv1zYISNkSjTAeKqJ0JyKW1iQixH479DBDldxLXSaSdMqZ8x3PPsB85W0
    fErCly6hEEPqmBZ0MoFvaUJpIcLbm88wHa7OkhwtGoPWhubHtan+g/I/OItWDS0cro4s
    9DH74g/QtixQjdR/OISKP7Ul9XlX7+PwwfmVGwLagCu2s/ypz+wwKGx0EM2cNaa7djYT
    uc+w==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLVrKw8+6Y="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.47.0 AUTH)
    with ESMTPSA id he04d0y6EImv8BF
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 14 Jul 2022 20:48:57 +0200 (CEST)
Date:   Thu, 14 Jul 2022 20:48:56 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/6] dt-bindings: remoteproc: qcom,q6v5: Move MSM8916 to
 schema
Message-ID: <YtBlGJ+lQFQg+l+I@gerhold.net>
References: <20220712124421.3129206-1-stephan.gerhold@kernkonzept.com>
 <20220712124421.3129206-3-stephan.gerhold@kernkonzept.com>
 <434cbf73-c62d-7d5c-fe60-7d98a84bc7fe@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <434cbf73-c62d-7d5c-fe60-7d98a84bc7fe@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 14, 2022 at 11:50:30AM +0200, Krzysztof Kozlowski wrote:
> On 12/07/2022 14:44, Stephan Gerhold wrote:
> > [...]
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - enum:
> > +          - qcom,msm8916-mss-pil
> > +
> > +      - const: qcom,q6v5-pil
> > +        description: Deprecated, prefer using qcom,msm8916-mss-pil
> > +        deprecated: true
> 
> The last compatible does not seem applicable here. Aren't you moving
> only MSM8916 to new schema?
> 

"qcom,q6v5-pil" is exactly the same as "qcom,msm8916-mss-pil". It's just
a deprecated quite unfortunately chosen old name for the same thing. :)

See these lines in the driver:

	{ .compatible = "qcom,q6v5-pil", .data = &msm8916_mss},
	{ .compatible = "qcom,msm8916-mss-pil", .data = &msm8916_mss},

> > [...]
> > +  # Deprecated properties
> > +  cx-supply:
> > +    description: CX power domain regulator supply (prefer using power-domains)
> > +    deprecated: true
> 
> Blank line, here and in other places between top-level properties.
> 

Ack, will change this in v2.

> > [...]
> > +# Fallbacks for deprecated properties
> > +allOf:
> > +  - oneOf:
> > +      - required:
> > +          - memory-region
> > +      - required:
> > +          - mba
> > +          - mpss
> > +        deprecated: true
> 
> Not sure if this is correct syntax.
> 

Yeah I was not sure either but at least dt_binding_check does not
complain about this. :-)

Maybe Rob has an opinion if this makes sense or not?

Thanks,
Stephan
