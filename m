Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C37A36553FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Dec 2022 20:41:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232712AbiLWTl5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Dec 2022 14:41:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232495AbiLWTlx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Dec 2022 14:41:53 -0500
X-Greylist: delayed 416 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 23 Dec 2022 11:41:52 PST
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 550DF20981
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Dec 2022 11:41:51 -0800 (PST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ansari.sh; s=key1;
        t=1671824093;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=LlnX2/93CbquLXEIC32I+1zkNEjXNymSrbmF+hi/9oY=;
        b=OC4CX/ELS7ihIRPk8tyIJXQ8mBFu1axHHRaGFDqSCrKT5ULh6asbCQN+CVRTSKew43dKyf
        27TliT4jJc9OfrK9cNgzDMAZlf0Xs2pRF5fiOpPFjAcAoHzkt7uGW1SnQ9P1XX9p/ArXNr
        MBg2RsakqxsXjoBf2z5fVwr9CHEj+Vw=
From:   Rayyan Ansari <rayyan@ansari.sh>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Rayyan Ansari <rayyan@ansari.sh>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] ARM: dts: qcom: pm8226: style fixes and new nodes
Date:   Fri, 23 Dec 2022 19:34:00 +0000
Message-Id: <20221223193403.781355-1-rayyan@ansari.sh>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

The following patches sort the nodes and includes in PM8226's
device tree file, and add new nodes for PON (with the resin sub-node)
and IADC.

Rayyan Ansari (3):
  ARM: dts: qcom: pm8226: sort includes alphabetically and nodes by
    address
  ARM: dts: qcom: pm8226: add PON device node along with resin sub-node
  ARM: dts: qcom: pm8226: add IADC node

 arch/arm/boot/dts/qcom-pm8226.dtsi | 46 +++++++++++++++++++++---------
 1 file changed, 33 insertions(+), 13 deletions(-)

-- 
2.39.0

