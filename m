Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDDBB5080A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Apr 2022 07:34:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359424AbiDTFhK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Apr 2022 01:37:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349601AbiDTFhJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Apr 2022 01:37:09 -0400
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 715DC36B6A;
        Tue, 19 Apr 2022 22:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1650432860;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=O9G1Q2+J3KNCj/ZEpFYYTbRYRRxKHbIJvHMuyERepSQ=;
    b=qzOJ2tCBjaRUdTx08KBtZzlREgMyaw1RupqptzsLuXmkQ9tufh5VfjmgtHbTuSbNny
    NklNCwCfpq3ZMF+mMQZi8K5MzcUGkgEtqAGaG5SrvbJa3PH8J5VPGfy9r+val3c72w+o
    RXWStOCQ3RjITPqIfeHso3nRC0WoQvoJowN4viEz+4aEd9KgTX5rcRuwMYH8GHuwHG4H
    oyYYmmV6oAHs1wNMcAI7zGWRpqX9OzR4BL0KTzErnDOUyPY4zO3ELIHGRJ3f0P1PkKIS
    XGzX/ryl50e2h2N6qnVqwPg+IXF7VWVYpCOABaXAQf33WewO8V0tCZyiA+3iHI/ML55n
    0Uyw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLVrK88/6Y="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.42.2 AUTH)
    with ESMTPSA id u05e50y3K5YJveK
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Wed, 20 Apr 2022 07:34:19 +0200 (CEST)
Date:   Wed, 20 Apr 2022 07:34:12 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        shawn.guo@linaro.org, jun.nie@linaro.org, benl@squareup.com,
        jwillcox@squareup.com, jgates@squareup.com, mchen@squareup.com,
        zac@squareup.com, Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCH v1 2/4] arm64: dts: Add msm8939 SoC
Message-ID: <Yl+bVNptu4hopExO@gerhold.net>
References: <20220419010903.3109514-1-bryan.odonoghue@linaro.org>
 <20220419010903.3109514-3-bryan.odonoghue@linaro.org>
 <Yl8lf6/eQ1hrcIKd@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yl8lf6/eQ1hrcIKd@builder.lan>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 19, 2022 at 04:11:27PM -0500, Bjorn Andersson wrote:
> On Mon 18 Apr 20:09 CDT 2022, Bryan O'Donoghue wrote:
> [..]
> > +
> > +#include "msm8916-pins.dtsi"
> 
> I thought we got rid of the separate *-pins.dtsi file. I'm also worried
> about sharing this between 8916 and 8939. Can you please inline this in
> line with one of the newer platform.

Why is this worrying? AFAIK MSM8939 is pin-compatible with MSM8916, it
uses the same pinctrl driver and compatible = "qcom,msm8916-pinctrl".
You definitely need the same definitions when setting up device trees
for 8939 devices.

In fact most of the MSM8939 device trees that I have seen in the
postmarketOS kernel fork look pretty much like the existing MSM8916
ones, just with the msm8916.dtsi include replaced with msm8939.dtsi.
And I think that's a good thing for consistency and maintenance. :)

I guess if we don't want separate -pins.dtsi anymore this just brings up
the question again if parts of msm8916.dtsi and msm8939.dtsi should be
shared in a .dtsi...
