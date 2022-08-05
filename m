Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5257358A8D7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Aug 2022 11:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236859AbiHEJcw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Aug 2022 05:32:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235839AbiHEJcv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Aug 2022 05:32:51 -0400
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94106101CA;
        Fri,  5 Aug 2022 02:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1659691967;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=Gek2ApRASV6t/JsLkbPetk9rIIshaj3vueYp6pv94oo=;
    b=soPEJ9X+3yQHY7NbKoeM+laRqEsPFguU+2ARJND3uJX90HGRE+TIV7zDH6jG4GqEho
    uiEGQXWfNGUb6yjSlubmJVdU2iv/6pa9YHdICk0ThTOAdgm85GeJs0HSquBExjs0sb7P
    KRHomvyRy83rkqwzEGYNhkJqybewsXHWkCLumLEJIJ87UgvjbYYgEgGXUUARJnOxMGg1
    aEoZhePF2n/IXzH+ePnIubLHgS8o8eppIivYcOaOnj3LgUbWEN/Z3z55GKQpr0O53jDp
    FGCNhnNK8NH1xdDOgzNrfm1hUA4wKj0LJ5D9MYeWWeKsNOwsdEojJcFsaTyU0dDeqlf3
    6nvw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLVrKw7/aY="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.47.0 AUTH)
    with ESMTPSA id u1045ey759WkZA8
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 5 Aug 2022 11:32:46 +0200 (CEST)
Date:   Fri, 5 Aug 2022 11:32:38 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Jun Nie <jun.nie@linaro.org>
Cc:     abel.vesa@linaro.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, agross@kernel.org,
        shawn.guo@linaro.org, bryan.odonoghue@linaro.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 0/4] Support dynamic voltage frequency scaling inside
 clock controller
Message-ID: <YuzimmCqk2pA5sFZ@gerhold.net>
References: <20220805074935.1158098-1-jun.nie@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220805074935.1158098-1-jun.nie@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 05, 2022 at 03:49:31PM +0800, Jun Nie wrote:
> Support dynamic voltage frequency scaling inside clock controller with
> changes in clock framework. And added msm8916 as the first SoC to
> support this feature.
> 

As far as I understand it was decided to handle this on the consumer
driver side in mainline, together with OPP tables and "required-opps" in
the device tree. If you look at e.g. sc7180.dtsi you can see that this
is heavily used there. Also see e.g. [1] for some links to related
discussions.

For MSM8916 at least the SDHCI and DSI driver should support this 
already. Some other older drivers (e.g. QUP, USB) would need some change
similar to [2] (just like they still need changes for interconnects).

I'm not entirely sure why it was decided to not do this as part of the
clock core (maybe someone can explain or link a relevant mailing list
post?), but we should try to keep it consistent in any case. :)

Thanks,
Stephan

[1]: https://lore.kernel.org/linux-arm-msm/20200910162610.GA7008@gerhold.net/
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0472f8d3c054a0ff58122fc9d2dbf84f197a284f
