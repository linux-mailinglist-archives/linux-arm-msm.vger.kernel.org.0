Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 765A038B52D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 May 2021 19:29:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233162AbhETRay (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 May 2021 13:30:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231680AbhETRax (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 May 2021 13:30:53 -0400
Received: from the.earth.li (the.earth.li [IPv6:2a00:1098:86:4d:c0ff:ee:15:900d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0D51C061574;
        Thu, 20 May 2021 10:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=earth.li;
         s=the; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject
        :To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=mMEfjWXMu5RnzNk39JglHJcBoTbUJzKRcpQGIP+KGe8=; b=oEzLz7cTpV89g1ZcaKbpdYgdB8
        +LVc19tWMtzS7UoQXmeqjZKoG1jfeQAT2sZOZT1qkeCRWl6rnb8sCU4Tdx/qrOgGyIwuregVNf6tu
        Gb6LjUYs77TBd5Snu/OQEB4wfSBNVevPcr3iJOuZQ4tj3WXbCx8siMrWT1kB+deSPfpSCKGxTNnuU
        sAKy6IDUf565Y/tBWPy9Q1Jk6aj6AAdxZkp8mBhEvcpJgb0cZESeEoo79tvDgLJoAgnK/DjIhKIgK
        ydj2UWoW8YvT3vin16Q1EZ9U/PBwVypm8xrxi7Qz10g1pBrxndt9+argJvccfIF31qdpIvfoo2xAw
        sNRJeyCQ==;
Received: from noodles by the.earth.li with local (Exim 4.92)
        (envelope-from <noodles@earth.li>)
        id 1ljmUC-0003qw-Kg; Thu, 20 May 2021 18:29:28 +0100
Date:   Thu, 20 May 2021 18:29:28 +0100
From:   Jonathan McDowell <noodles@earth.li>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] ARM: dts: qcom: Enable various devices for IPQ806x /
 RB3011
Message-ID: <cover.1621531633.git.noodles@earth.li>
References: <cover.1621097174.git.noodles@earth.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1621097174.git.noodles@earth.li>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds various devices (NAND, USB, tsens, L2CC, RPM) which
have either recently gained mainline drivers, or just failed to be
previously added, to the DTS for the IPQ806x platform. It then enables
them for the MikroTik RB3011 platform, where they have all been tested.

I've done the additions to the main IPQ806x DTS as separate commits for
each logical set, and then a single wholesale set of changes for the
RB3011 to turn everything on. Happy to squash to 1/2 commits or split
out further if desired.

v2:
  Fix ADM label to "dma-controller"
  Drop spurious "syscon" on GCC for tsens changes

Jonathan McDowell (5):
  ARM: dts: qcom: Add ADM DMA + NAND definitions to ipq806x
  ARM: dts: qcom: Add tsens details to ipq806x
  ARM: dts: qcom: Add USB port definitions to ipq806x
  ARM: dts: qcom: add L2CC and RPM for IPQ8064
  ARM: dts: qcom: Enable NAND + USB for RB3011

 arch/arm/boot/dts/qcom-ipq8064-rb3011.dts |  58 +++
 arch/arm/boot/dts/qcom-ipq8064.dtsi       | 425 ++++++++++++++++++++++
 2 files changed, 483 insertions(+)

-- 
2.20.1

