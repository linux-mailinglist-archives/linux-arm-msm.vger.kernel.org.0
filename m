Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81067409CBE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Sep 2021 21:14:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235622AbhIMTPd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Sep 2021 15:15:33 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:45366 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229460AbhIMTPd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Sep 2021 15:15:33 -0400
Received: from g550jk.localnet (ip-213-127-63-121.ip.prioritytelecom.net [213.127.63.121])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 92CB3C96D2;
        Mon, 13 Sep 2021 19:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1631560455; bh=xXK4qoM6eeH56dLOIWdlOIkpkBiaBDzS80YDoQgblCM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=sOxjwAvB+CdsxphN08jjTBXJtvxWx0TaKSLPNYCcEWqn7eiHdbKiLjw3rPhQRujfC
         2habQZaD2P7AKdGOU9NmXb7Su+qKXQqCeIdVKCyargtNuicz8gAST9EKEJbZkpz/S2
         NQjrn7PyFN70Lax5VePEEfKB6BONXg2J9Bi8UQrw=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, bartosz.dudziak@snejp.pl,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Max Merchel <Max.Merchel@tq-group.com>,
        Hao Fang <fanghao11@huawei.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] dt-bindings: vendor-prefixes: add LG Electronics
Date:   Mon, 13 Sep 2021 21:14:14 +0200
Message-ID: <5220943.AHGTne7y6d@g550jk>
In-Reply-To: <9942f964-442e-e782-3926-6d7d1123418a@canonical.com>
References: <20210911232707.259615-1-luca@z3ntu.xyz> <20210911232707.259615-7-luca@z3ntu.xyz> <9942f964-442e-e782-3926-6d7d1123418a@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Krzysztof,

On Montag, 13. September 2021 10:49:43 CEST Krzysztof Kozlowski wrote:
> On 12/09/2021 01:27, Luca Weiss wrote:
> > LG Electronics is a part of the LG Corporation and produces, amongst
> > other things, consumer electronics such as phones and smartwatches.
> 
> Hi,
> 
> Thanks for the patches.
> 
> I think "lge" it's the same prefix as "lg". There is no sense in having
> multiple vendor prefixes just because company splits inside business
> units or subsidiaries. The same as with other conglomerates, e.g.
> Samsung - if we wanted to be specific, there will be 4-5 Samsung
> vendors... Not mentioning that company organisation is not always
> disclosed and can change.
> 

I was mostly following qcom-msm8974-lge-nexus5-hammerhead as it's the other LG 
device tree I am aware of so I've picked lge instead of lg. Also worth noting 
that Google uses "LGE" in the Android device tree[1] or in the model name in 
the LG G Watch R kernel sources ("LGE APQ 8026v2 LENOK rev-1.0").

I don't have a strong opinion either way so I'm fine with either.

If we decide to go with "lg" do we want to change the Nexus 5 devicetree 
(hammerhead) also, that one has the lge name in at least compatible and 
filename (I don't know how much of a breaking change that would be considered 
as).

> We already have lg for several components, also made by LG Electronics.
> What about these?
> 
> There is only one device with "lge", added back in 2016 without adding
> vendor prefix. I would propose to fix that one, instead of keeping
> duplicated "lg".
> 
> Best regards,
> Krzysztof

Regards
Luca

[1] https://android.googlesource.com/device/lge/hammerhead/



