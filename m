Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F5305504F3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jun 2022 15:02:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236574AbiFRNCS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Jun 2022 09:02:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234351AbiFRNCR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Jun 2022 09:02:17 -0400
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0AA41A056;
        Sat, 18 Jun 2022 06:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1655557333;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=Wt2x8ZQ997/kuqWQRZZZv5j/3VzD5EfVi38V6rhji9I=;
    b=WQ4FmCOsQm/4afJ+H9lY1EHzE0bjVICu1cmlQp6zo+v/LVCQZzAgd602/FD9+VQW1f
    VL9KqKaBDFBNbHZGLFvkzF+f2/+8yXckFquz45rSPBjjk1AM+iTqux3z1OBX/nzeMKHh
    EUfn5eDICwsBVO3QS6AQsC6vq+5jQVQ4Q0PEcrv/Zj0cVNnLLNT4FUuaScnmrDJDPWjq
    28AbpPgydHI7nWporEI9lC+Kq49bOexXOzKw8JI4H5FUgVTvJt4H8O8feLsmjfg47bya
    rsP4JXKG6aNABCbXzPXzniDT3nlZCNJbzXTSyTUX1RK9eLO1SlGODNlbFwLzjikpYpLg
    v/bQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLUrKw8+6Y="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.46.0 AUTH)
    with ESMTPSA id g32597y5ID2CAa6
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Sat, 18 Jun 2022 15:02:12 +0200 (CEST)
Date:   Sat, 18 Jun 2022 15:02:04 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: msm8916: add clocks to the GCC
 device node
Message-ID: <Yq3MzJ58d0fbsb3L@gerhold.net>
References: <20220617144714.817765-1-dmitry.baryshkov@linaro.org>
 <20220617144714.817765-8-dmitry.baryshkov@linaro.org>
 <Yqy2YHpl93kEQRYU@gerhold.net>
 <CAA8EJpozu6PoWC-kOpFB9OSZLVZaZt6ZkUpYo=bOr0zhErkWqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpozu6PoWC-kOpFB9OSZLVZaZt6ZkUpYo=bOr0zhErkWqA@mail.gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 17, 2022 at 11:34:24PM +0300, Dmitry Baryshkov wrote:
> On Fri, 17 Jun 2022 at 20:14, Stephan Gerhold <stephan@gerhold.net> wrote:
> >
> > If we want to change this to the actual votable clock later this should
> > probably be <&rpmcc RPM_SMD_XO_CLK_SRC>. AFAIK that clock exists in RPM
> > on MSM8916 but was never added to the clk-smd-rpm driver (for MSM8916).
> >
> > Not sure where the pin-controlled BB_CLK1 is coming from here. :)
> 
> It came from the schematics I had at hand (db410c). It uses the
> BB_CLK1 together with the enable pin. I'll probably use xo_board for
> now and postpone changing this to rpmcc clock until the next attempt
> to read msm-3.x code.
> 

Hmm, you're right - BB_CLK1 goes to CXO on most MSM8916+PM8916 devices.
I think the msm-3.10 kernel still controls it via the RPM_SMD_XO_CLK_SRC
though. Quite confusing. :)

Thanks,
Stephan
