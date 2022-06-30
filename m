Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A189C56240C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 22:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231290AbiF3USw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 16:18:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237239AbiF3USr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 16:18:47 -0400
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 951494883A;
        Thu, 30 Jun 2022 13:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1656620309;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=jTBh8tpUX4wS523jclqgriqIEwT1It3h9ZxxUKd4K3w=;
    b=Ubkd7PR1Ml9pFUB48ByHTQBPaguLqxqeSK12bVHkWL2V9we8Jt5qg2tlBtN3Qj+iA5
    uj0IBBU6CIvZ3wLV3XTF7IbLPmzLCkC1HtBRggADtkVPxkEEXnIiDjXCfav8Nbgc2bVj
    UsWplxEZeXbc8sQHefmniQzlrBeO9pbO8VP6jyBMK5C28sQCZabngGbKNS28WCyXaYBk
    2dm3Utv2GjXq/22ZVHzx5RLnYjna6G6P+6BfS4DRjWQg0jud45UHneKV56zsVQtLjxkW
    9Nt/lkjjXTTF1jl4MZ5oX7ok1LUttsTZQnQpG2di36RkyvNobO/Fl5ZJfp8ovbcAnRCO
    VMhg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLUrK8+86Y="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.46.1 AUTH)
    with ESMTPSA id yfdd30y5UKIS4u1
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 30 Jun 2022 22:18:28 +0200 (CEST)
Date:   Thu, 30 Jun 2022 22:18:13 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        bjorn.andersson@linaro.org, quic_mkrishn@quicinc.com,
        swboyd@chromium.org, freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH 3/7] dt-bindings: msm: dsi: Fix power-domains
 constraint
Message-ID: <Yr4E+AsXRBZuYCpx@gerhold.net>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
 <20220630120845.3356144-4-bryan.odonoghue@linaro.org>
 <225e70ec-553d-4d44-fc61-543128b2ad67@linaro.org>
 <054043a5-3643-aa5b-4204-8cacb7b3ae9a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <054043a5-3643-aa5b-4204-8cacb7b3ae9a@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 30, 2022 at 08:49:03PM +0100, Bryan O'Donoghue wrote:
> On 30/06/2022 20:01, Krzysztof Kozlowski wrote:
> > On 30/06/2022 14:08, Bryan O'Donoghue wrote:
> > > The existing msm8916.dtsi does not depend on nor require power-domains.
> > > Drop from the list of required.
> > 
> > That's not good reason. The bindings are about hardware so the question
> > is whether being a part of power domain or toggling power domain on/off
> > is considered required for the DSI.
> 
> AFAIK no but, I will check this again and if it is definitely not required,
> I'll churn the commit log to describe it better.
> 

The power domain in the DSI node is used together with the OPP table to
vote for performance states depending on the clock frequency of the byte
clock. In the downstream kernel this is part of the clock driver.
In mainline this needs to be done in the consumer driver.

The MSM8916 port was never really optimized for power usage. With
incomplete interconnect support etc the power domains tend to be at
maximum state most of the time, so it does not cause any issues if you
forget to vote for performance states in some places.

In general, the situation on MSM8916/MSM8939 is not really any different
from newer SoCs. The downstream MSM8916 gcc driver contains:

static struct rcg_clk byte0_clk_src = {
	/* ... */
	.c = {
		/* ... */
		VDD_DIG_FMAX_MAP2(LOW, 94400000, NOMINAL, 188500000),
	},
};

which should be ideally translated into an OPP table with
power-domains = <&rpmpd MSM8916_VDDCX>; similar to newer SoCs.

(I'm not saying that "power-domains" should be required, just that it
 could be added for MSM8916/MSM8939 if someone wants to properly
 power-optimize them...)

Thanks,
Stephan
