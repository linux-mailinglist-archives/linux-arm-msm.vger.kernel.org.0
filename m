Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 429063EA2C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 12:07:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235448AbhHLKIG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 06:08:06 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:62795 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236326AbhHLKIF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 06:08:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628762860; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=wdaxsBR9xQeb6HPivB6lxbv8kWfzzrkr1wBuLd+Yoks=; b=V6jYAbzvaRe1aNZgm1SukWMWpGuonMvq3fWTMI0OFfEDh5Mlqhx5aerYClaf1gvJ8s7xL9fB
 xu0bMsjlHGo+/dGMW9BF8x+kXfEnJ2WLjDE7r3kzn917RXeBeoJlen82k0Fod/qodPrf/Zrf
 NHAiiN2IHBeYc6XV/kOMAXgR6hg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6114f2c4b14e7e2ecb7b8354 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 12 Aug 2021 10:07:00
 GMT
Sender: luoj=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2DA64C43146; Thu, 12 Aug 2021 10:07:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from akronite-sh-dev02.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: luoj)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 24789C433F1;
        Thu, 12 Aug 2021 10:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 24789C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=luoj@codeaurora.org
From:   Luo Jie <luoj@codeaurora.org>
To:     andrew@lunn.ch, agross@kernel.org, bjorn.andersson@linaro.org,
        davem@davemloft.net, kuba@kernel.org, robh+dt@kernel.org,
        hkallweit1@gmail.com, linux@armlinux.org.uk,
        robert.marko@sartura.hr
Cc:     linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sricharan@codeaurora.org, Luo Jie <luoj@codeaurora.org>
Subject: [PATCH v3 0/3] net: mdio: Add IPQ MDIO reset related function
Date:   Thu, 12 Aug 2021 18:06:39 +0800
Message-Id: <20210812100642.1800-1-luoj@codeaurora.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series add the MDIO reset features, which includes
configuring MDIO clock source frequency and indicating CMN_PLL that
ethernet LDO has been ready, this ethernet LDO is dedicated in the
IPQ5018 platform.

Specify more chipset IPQ40xx, IPQ807x, IPQ60xx and IPQ50xx supported by
this MDIO driver.

Changes in v3:
	* simplify the function ipq_mdio_reset.

Changes in v2:
	* Addressed review comments (Andrew Lunn).
	* Remove the IS_ERR().
	* make binding patch part of series.
	* document the property 'reg' and 'clock'.

Changes in v1:
	* make MDIO_IPQ4019 unchanged for backwards compatibility.
	* remove the PHY reset functions

Luo Jie (3):
  net: mdio: Add the reset function for IPQ MDIO driver
  MDIO: Kconfig: Specify more IPQ chipset supported
  dt-bindings: net: Add the properties for ipq4019 MDIO

 .../bindings/net/qcom,ipq4019-mdio.yaml       | 15 ++++++-
 drivers/net/mdio/Kconfig                      |  3 +-
 drivers/net/mdio/mdio-ipq4019.c               | 44 +++++++++++++++++++
 3 files changed, 60 insertions(+), 2 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

