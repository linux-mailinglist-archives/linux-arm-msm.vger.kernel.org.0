Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81FB149A832
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jan 2022 05:08:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237686AbiAYDAB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jan 2022 22:00:01 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:56112 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2372985AbiAYAMv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jan 2022 19:12:51 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 882A6B81229;
        Tue, 25 Jan 2022 00:12:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A017C340E4;
        Tue, 25 Jan 2022 00:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643069568;
        bh=z69MEX0YnqkKhduK9w2qxFrlsTohb/2sILozX7OHEiA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Y2s/sHJ/0jRujTZ3iBH3yj6/ZYTKf2k8yxJMX2J5X+LdOfsSBCCtzbLoH7DG4l42C
         wFsGVZsWJSzIQKs8fCAGejB6KvBsBDxGeL+ecsCubYN8ylbhQeGCD1H37cLHvuKTec
         ZwubvcpzfxpTBp6rX0zvrctDjwMwyr+t7rdXIbPWG9hSadANfuL6Vi9yEMj/JZ5yNE
         /fojrT/lRFy+aU97djgUn+VRb6P1TS0THtheqtA8VrOMJXWDDGQl1hux9vLMvNXjNw
         xl3OxlXC0TYWYzNOgAfo0SL2tg/xO4wF3JNHupNMnNnIQkWcUrieEZrS+8q5Xp8JSe
         YlBwyZcPux4dw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220123183547.15830-1-michael.srba@seznam.cz>
References: <20220123183547.15830-1-michael.srba@seznam.cz>
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: gcc-msm8998: Add definitions of SSC-related clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Michael Srba <Michael.Srba@seznam.cz>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, michael.srba@seznam.cz
Date:   Mon, 24 Jan 2022 16:12:46 -0800
User-Agent: alot/0.10
Message-Id: <20220125001248.2A017C340E4@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting michael.srba@seznam.cz (2022-01-23 10:35:43)
> From: Michael Srba <Michael.Srba@seznam.cz>
>=20
>  This patch adds definitions of four clocks which need to be manipulated
>  in order to initialize the AHB bus which exposes the SCC block in the
>  global address space.
>=20
> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>

PLease Cc linux-clk@vger.kernel.org on clk related patches.
