Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DFD757D47D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jul 2022 22:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233114AbiGUUCy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jul 2022 16:02:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233075AbiGUUCy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jul 2022 16:02:54 -0400
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E5736D9DF;
        Thu, 21 Jul 2022 13:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1658433770;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=Owkp8ktceAI2U5/duGJt4dKf9HIoey0z8t5W7UFe7eo=;
    b=BLxrN2S+YWx0HdNI2q7oAFlQ2WmDx7BXapbRJITFzGr3CVzlPle8bxQ0WUuLMyvT7/
    42ttEv5fnyJmOexK3Q1qd9utSb9Ik4gWvxMbFinqn4eKvmijNONIBxtuRQul4bn7rKcj
    mKipm1pCV8RQUST7UndcS8AT6kWNrUEMLuYZhrFKITC4clMc7cOf/t8hRmyXSJF4khn6
    R1kKfay+dTgQyMFgA5DEvFy/TkrqgJbJnzsb+SmmgeUh3DY0TYYMc0bhg/+Vpd4/sf4d
    o3iJ6+AoR/0s063znjaukuKqOkqX0GE2N6y1HVntt03adNa82HOl8EKO2LUT0lsIErfl
    Z88g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLUrK86+6Y="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.47.0 AUTH)
    with ESMTPSA id efdacay6LK2n61F
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 21 Jul 2022 22:02:49 +0200 (CEST)
Date:   Thu, 21 Jul 2022 22:02:43 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Rob Herring <robh@kernel.org>
Cc:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: remoteproc: qcom,q6v5: Move MSM8916
 to schema
Message-ID: <Ytmw41giZ/4S+Pp0@gerhold.net>
References: <20220718140344.1831731-1-stephan.gerhold@kernkonzept.com>
 <20220718140344.1831731-3-stephan.gerhold@kernkonzept.com>
 <20220720224608.GA4107504-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220720224608.GA4107504-robh@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 20, 2022 at 04:46:08PM -0600, Rob Herring wrote:
> On Mon, Jul 18, 2022 at 04:03:41PM +0200, Stephan Gerhold wrote:
> > qcom,q6v5.txt covers multiple SoCs with quite different binding
> > requirements. Converting this into one DT schema would require
> > several if statements, making the DT schema overall harder to
> > read and understand.
> > 
> > To avoid this, follow the example of SC7180/SC7280 and split
> > "qcom,msm8916-mss-pil" (and the equivalent deprecated "qcom,q6v5-pil"
> > compatible) into a separate DT schema. The schema is somewhat based
> > on the one for SC7180/SC7280 but adjusted for the old platforms.
> > 
> > Compared to the old plain text bindings, add missing documentation for
> > the "bam-dmux" subnode and recommend one particular approach to specify
> > the MBA/MPSS "memory-region" (the other one is marked as deprecated).
> > 
> > Cc: Sireesh Kodali <sireeshkodali1@gmail.com>
> > Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
> > ---
> > Changes in v2:
> >   - Add blank lines between top-level properties
> >   - Drop "deprecated" in "oneOf" list, it is not clear if this is valid
> >     and it should be redundant since the properties itself are already
> >     marked as "deprecated"
> > ---
> > Like Sibi's patch series for SC7180/SC7820 [1] this is somewhat related
> > to Sireesh's series that converts all of qcom,q6v5.txt [2] (with a lot
> > of if statements). However, this series focuses on MSM8916/MSM8974 (or
> > actually MSM8909) only.
> > 
> > [1]: https://lore.kernel.org/linux-arm-msm/1657020721-24939-1-git-send-email-quic_sibis@quicinc.com/
> > [2]: https://lore.kernel.org/linux-arm-msm/20220511161602.117772-7-sireeshkodali1@gmail.com/
> 
> Is that one abandoned or do we just get to review both approaches 
> without coordination?
> 

I assumed the decision to make separate schemas rather than a big one
was already made, since Sibi's series was applied and has already moved
parts of qcom,q6v5.txt into separate schemas.

Still, I did coordinate with Sireesh before submitting this patch and
suggested that he can likely just add the new "qcom,msm8953-mss-pil"
compatible from his series to the DT schema in this patch (the setup is
also very similar).

> I think you need a common q6v5 schema here with all the common 
> properties. Having the same property name with the type defined multiple 
> times is not great. In fact, I'm working on a check for finding those.

Which properties would you move to a common schema? Most of the schema
is just listing items for generic properties (interrupts, clocks, power
domains, supplies, resets, memory-region, ...) and having them separated
is intended to avoid lots of if statements in a common schema.

What remains is maybe:

  - "qcom,smem-states", which is already used in several other schemas
    and could be possibly defined together with #qcom,smem-state-cells
    in some generic schema(?)

  - "qcom,halt-regs", "firmware-name", "smd-edge" are used by different
    Qualcomm remoteproc drivers, so they could possibly be defined in
    some common "qcom-remoteproc.yaml" schema(?)

Thanks,
Stephan
