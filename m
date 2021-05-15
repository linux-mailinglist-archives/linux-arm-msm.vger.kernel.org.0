Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5A2F381A1E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 May 2021 19:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234098AbhEORXW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 May 2021 13:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234082AbhEORXT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 May 2021 13:23:19 -0400
Received: from the.earth.li (the.earth.li [IPv6:2a00:1098:86:4d:c0ff:ee:15:900d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30713C061573;
        Sat, 15 May 2021 10:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=earth.li;
         s=the; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender:
        Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=+mKLe/4OElUdDV+bpqfDIHZ1Ca/pDNLytCsMnCklxVo=; b=DmbWxEOhAqspmr2oAzA9S/h/ai
        +4yLxy3Cx+Z1qV74JI37/99rMlofMJyXFxp6u8kn3eemsuqSaNpNmPfmbMqodxdGbrZXS08BD0bjl
        HIt6JLFsrzoQGumBfAvYUfNQBxhDXatABzohbJ9NDdRvFHcQKlQB6kacJ38yqWCTXdciDf5rY7n5s
        cFR3tPFtgp8og3Skoe323Oa9vUsFu1zaFf7HAvI7r56kICgnEZTiDg9EFVGoYip75SXB/btcWj01E
        EfIucQmGfAE078d0/UyixQMzMswWvrNXboMldF6w5tgKAZv60oX5qWg+sgrHj5ACia6jyZvU/F6kH
        eSLXJL4g==;
Received: from [2001:4d48:ad59:1409:4::2] (helo=youmian.o362.us)
        by the.earth.li with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <noodles@earth.li>)
        id 1lhxWM-0004QT-0M; Sat, 15 May 2021 17:52:10 +0100
Date:   Sat, 15 May 2021 17:52:02 +0100
From:   Jonathan McDowell <noodles@earth.li>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] ARM: dts: qcom: Enable various devices for IPQ806x /
 RB3011
Message-ID: <cover.1621097174.git.noodles@earth.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Jonathan McDowell (5):
  ARM: dts: qcom: Add ADM DMA + NAND definitions to ipq806x
  ARM: dts: qcom: Add tsens details to ipq806x
  ARM: dts: qcom: Add USB port definitions to ipq806x
  ARM: dts: qcom: add L2CC and RPM for IPQ8064
  ARM: dts: qcom: Enable NAND + USB for RB3011

 arch/arm/boot/dts/qcom-ipq8064-rb3011.dts |  58 +++
 arch/arm/boot/dts/qcom-ipq8064.dtsi       | 427 +++++++++++++++++++++-
 2 files changed, 484 insertions(+), 1 deletion(-)

-- 
2.20.1

