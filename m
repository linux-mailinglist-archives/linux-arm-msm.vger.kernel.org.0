Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBD114BAE29
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Feb 2022 01:13:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbiBRAJt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Feb 2022 19:09:49 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:38746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbiBRAJs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Feb 2022 19:09:48 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BA9F53734;
        Thu, 17 Feb 2022 16:09:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ED7A161A5C;
        Fri, 18 Feb 2022 00:09:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B55AC340E8;
        Fri, 18 Feb 2022 00:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645142972;
        bh=BH9DXFFaHu78iFMg2R2zX1drdgxMPStM36KuqbVE+Wg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=VF+MEwuWw7UxpjHxB5DsxJ+3+5Al1c6MXfm2hREpenKqR7L5VSYziZ3K0q2o315dK
         lf2gllB17kgK/P2qL6zd2ekIzBUSVhNhnvZJKPPSOjwscpiMEDxuQXdmAZ3kZ/ovBw
         bqvflNZJWoJ+on6qz9k0Uyd21xFaPgtMdqLcEEFBg9lIJ+259UaNgfkTFCjadKrukc
         53LeGo6sWKpixrz5edFmtufEl9fHMROQxEiRSpf7HC8kNbh1a1zOsdfQrUhEgNdYsj
         24s9HH7hgYX3edIpDGcDc5jRH+0d/YrTfCUhmzH9xF1jNrAGnk7d1mrB462sLWAp5D
         Y7VDsyQl5q24g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220217113004.22757-1-michael.srba@seznam.cz>
References: <20220217113004.22757-1-michael.srba@seznam.cz>
Subject: Re: [PATCH v6 1/5] dt-bindings: clock: gcc-msm8998: Add definitions of SSC-related clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Michael Srba <Michael.Srba@seznam.cz>,
        Rob Herring <robh@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, michael.srba@seznam.cz
Date:   Thu, 17 Feb 2022 16:09:29 -0800
User-Agent: alot/0.10
Message-Id: <20220218000932.4B55AC340E8@smtp.kernel.org>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting michael.srba@seznam.cz (2022-02-17 03:30:00)
> From: Michael Srba <Michael.Srba@seznam.cz>
>=20
> This patch adds definitions of four clocks which need to be manipulated

(I need a macro for this)

 $ git grep "This patch" -- Documentation/process/

> in order to initialize the AHB bus which exposes the SCC block in the
> global address space.
>=20
> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
