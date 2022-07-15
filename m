Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC1C0575CE4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jul 2022 10:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232438AbiGOIAn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jul 2022 04:00:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbiGOIAm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jul 2022 04:00:42 -0400
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 601D87E00E;
        Fri, 15 Jul 2022 01:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1657872039;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=OqjGwFmaNWkrx1u1GRDpZGcyuPpD51t2IUwteZ5MuqY=;
    b=mSi3fmHDSI2ZViyITi6N7Ro1zg5ewmjI66nvjtknQwldVUyqOJ0e5V3LNaArAM9cLx
    04eWGT95H5sj5Ok3hodAwTFbHovM7k42voW4xJ0Wk325y3oQhY1t35zpSNPIpRUgC5wm
    /Klhw2M0Dcnm4oH5UoXKX/RRCWzQHLmYMwOmueDBKqUpfJHamiLVO5JL+l0SdZ+qOd6W
    SVevAhwYHozWHEgw+RQDkT3fefs21xKakwh56Y/NrJgkyioqowLvWKDzJUhY7llqX6J5
    aH50nCeyQi2T155idHa9V34uoqfc3GwWjinCSQBeDPJ5g3MslXOgvIjlM7FWCxolkZSq
    aZww==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLUrKw5+aY="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.47.0 SBL|AUTH)
    with ESMTPSA id he04d0y6F80c9Jp
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 15 Jul 2022 10:00:38 +0200 (CEST)
Date:   Fri, 15 Jul 2022 10:00:20 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
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
Message-ID: <YtEeay9JCaG2NMdT@gerhold.net>
References: <20220712124421.3129206-1-stephan.gerhold@kernkonzept.com>
 <20220712124421.3129206-3-stephan.gerhold@kernkonzept.com>
 <434cbf73-c62d-7d5c-fe60-7d98a84bc7fe@linaro.org>
 <YtBlGJ+lQFQg+l+I@gerhold.net>
 <cd8a2b66-ba7c-768c-f5b0-2728f0a8be99@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd8a2b66-ba7c-768c-f5b0-2728f0a8be99@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 15, 2022 at 08:33:53AM +0200, Krzysztof Kozlowski wrote:
> On 14/07/2022 20:48, Stephan Gerhold wrote:
> > On Thu, Jul 14, 2022 at 11:50:30AM +0200, Krzysztof Kozlowski wrote:
> >> On 12/07/2022 14:44, Stephan Gerhold wrote:
> >>> [...]
> >>> +properties:
> >>> +  compatible:
> >>> +    oneOf:
> >>> +      - enum:
> >>> +          - qcom,msm8916-mss-pil
> >>> +
> >>> +      - const: qcom,q6v5-pil
> >>> +        description: Deprecated, prefer using qcom,msm8916-mss-pil
> >>> +        deprecated: true
> >>
> >> The last compatible does not seem applicable here. Aren't you moving
> >> only MSM8916 to new schema?
> >>
> > 
> > "qcom,q6v5-pil" is exactly the same as "qcom,msm8916-mss-pil". It's just
> > a deprecated quite unfortunately chosen old name for the same thing. :)
> > 
> > See these lines in the driver:
> > 
> > 	{ .compatible = "qcom,q6v5-pil", .data = &msm8916_mss},
> > 	{ .compatible = "qcom,msm8916-mss-pil", .data = &msm8916_mss},
> 
> Yeah, but previous bindings were not mentioning it alone, so this would
> not be a direct conversion.
> 

Sorry, I'm not sure I understand you correctly: What do you mean with
"the previous bindings were not mentioning it alone"? "qcom,q6v5-pil"
was listed as standalone compatible just like all the other compatibles:

- compatible:
	Usage: required
	Value type: <string>
	Definition: must be one of:
		    "qcom,q6v5-pil",         <----
		    "qcom,ipq8074-wcss-pil"
		    "qcom,qcs404-wcss-pil"
		    "qcom,msm8916-mss-pil",  <----
		    "qcom,msm8974-mss-pil"
		    "qcom,msm8996-mss-pil"
		    "qcom,msm8998-mss-pil"
		    "qcom,sc7180-mss-pil"
		    "qcom,sc7280-mss-pil"
		    "qcom,sdm845-mss-pil"

The only non-conversion steps I did was to mark some of the redundant
bindings as deprecated (e.g. "memory-region" with 2 items vs "mba" and
"mpss" subnode, "qcom,msm8916-mss-pil" vs "qcom,q6v5-pil"). I can put
the deprecations in a separate patch if that clarifies the situation.

Thanks,
Stephan
