Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD9A4C3A93
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Feb 2022 01:55:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233523AbiBYAze (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Feb 2022 19:55:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231524AbiBYAzd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Feb 2022 19:55:33 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 014DA1DFDDE;
        Thu, 24 Feb 2022 16:55:02 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9879A61D2A;
        Fri, 25 Feb 2022 00:55:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E83EFC340E9;
        Fri, 25 Feb 2022 00:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645750502;
        bh=m2a9gv/y1JadmYnquzrpWqHyqdS8KQdTGa1Zi5eG/bE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=dAzGlRvuMUyQPpRy3MwW/nhkky5D9Tk5wLVzwa7hg+BS0xDU3N/KTX21n9DYcyBg0
         q+qyCIA7KUiMgxAxIVNuTjpJ9lYMbouTMUCYa5r+wIVpXvd2hifJlTbh6Yzl10ijlt
         esQXgOAD4jjNnBi4T17gPcx2fvC9YENmjnSQJOgD/2imhUxnUuWhOV7dOzg55jS7M9
         AshIX0de+1zYqLAISvwZ/YVPh759t23V3D8ttGiWqFd6OSJWrXgGduF0/k3Q1nF3q7
         FH5b8dwFohaeI6g/u+z/0CSoHRNpfeczzn/ErcC1BhVtVkdigdqHdvpWVxDDpdjAKU
         5CfcxisMELUlQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220220212034.9152-2-michael.srba@seznam.cz>
References: <20220220212034.9152-1-michael.srba@seznam.cz> <20220220212034.9152-2-michael.srba@seznam.cz>
Subject: Re: [PATCH v8 2/5] clk: qcom: gcc-msm8998: add SSC-related clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Michael Srba <Michael.Srba@seznam.cz>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, michael.srba@seznam.cz
Date:   Thu, 24 Feb 2022 16:55:00 -0800
User-Agent: alot/0.10
Message-Id: <20220225005501.E83EFC340E9@smtp.kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting michael.srba@seznam.cz (2022-02-20 13:20:31)
> From: Michael Srba <Michael.Srba@seznam.cz>
>=20
> Add four clocks which need to be manipulated in order to initialize the A=
HB
> bus which exposes the SCC block in the global address space.
>=20
> If a device is known to be configured such that writing to these
> registers from Linux is not permitted, the 'protected-clocks'
> device tree property must be used to denote that fact.
>=20
> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
