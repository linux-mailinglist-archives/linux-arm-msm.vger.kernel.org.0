Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A2F814D384
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2020 00:20:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbgA2XUl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jan 2020 18:20:41 -0500
Received: from onstation.org ([52.200.56.107]:33822 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726648AbgA2XUl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jan 2020 18:20:41 -0500
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id E7C733EA37;
        Wed, 29 Jan 2020 23:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1580340040;
        bh=AVfrxq/bgHG2VL086oSFDsW9fAAX7ROC572hdaXl2pI=;
        h=From:To:Cc:Subject:Date:From;
        b=RdNNTJQudExUtFRDO/mT6K/R2rD1pjC3LwpLnGT8grutPfakjNePjuK4PJidLkiW1
         UStyO2KDJvYgnLYKbgojB1rlf1cJwRDBdaO6U3Ku0/kPwE8XU86+Remgzal0+FWzkp
         vHfG6KW+TGl0PuGbQf3BGBQ6hTIi2TsQ1DVvXSk8=
From:   Brian Masney <masneyb@onstation.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jonathan@marek.ca
Subject: [PATCH 0/3] ARM: qcom: add Nexus 5 bluetooth support
Date:   Wed, 29 Jan 2020 18:20:28 -0500
Message-Id: <20200129232031.34538-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Here's a small patch series that gets the bluetooth working on the Nexus
5 phone.

For a summary of what currently works upstream on the Nexus 5, see my
status page at https://masneyb.github.io/nexus-5-upstream/.

Brian Masney (1):
  ARM: qcom_defconfig: add Broadcom bluetooth options

Jonathan Marek (2):
  ARM: dts: qcom: msm8974: add blsp2_uart10
  ARM: dts: qcom: msm8974-hammerhead: add support for bluetooth

 .../qcom-msm8974-lge-nexus5-hammerhead.dts    | 71 +++++++++++++++++++
 arch/arm/boot/dts/qcom-msm8974.dtsi           |  9 +++
 arch/arm/configs/qcom_defconfig               |  4 ++
 3 files changed, 84 insertions(+)

-- 
2.24.1

