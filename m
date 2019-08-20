Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E09DD96768
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2019 19:25:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729991AbfHTRZQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Aug 2019 13:25:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:48226 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725971AbfHTRZQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Aug 2019 13:25:16 -0400
Received: from localhost.localdomain (unknown [106.201.62.126])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CF8F52064A;
        Tue, 20 Aug 2019 17:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566321915;
        bh=7csH4o0Kcx8nsUPXomlrW9Z+9Ik9lSUKPmo4vp1qme0=;
        h=From:To:Cc:Subject:Date:From;
        b=02X3X/oJC4zqX9XpL+TqwHlJwttJa1okYnhvHDrrYPVbzhcJT3OvdGGYindTsLwpx
         xGw7QXOpXcGQNEPhMzpqC+iLV84jZOLxidnSqdplfr1rSiPurWk1F3HLlavoGzTaqm
         NbS9uWawGJCt/WCF1ZgWrNZ2l3lO5WL2dBDGFj1U=
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/8] arm64: dts: qcom: sm8150: Add SM8150 DTS
Date:   Tue, 20 Aug 2019 22:53:42 +0530
Message-Id: <20190820172351.24145-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds DTS for SM8150, PMIC PM8150, PM8150B, PM8150L and
the MTP for SM8150.

Changes in v3:
 - Fix copyright comment style to Linux kernel style
 - Make property values all hex or decimal
 - Fix patch titles and logs and make them consistent
 - Fix line breaks

Changes in v2:
 - Squash patches
 - Fix comments given by Stephen namely, lowercase for hext numbers,
   making rpmhcc have xo_board as parent, rename pon controller to
   power-on controller, make pmic nodes as disabled etc.
 - removed the dependency on clk defines and use raw numbers


Vinod Koul (8):
  arm64: dts: qcom: sm8150: Add base dts file
  arm64: dts: qcom: pm8150: Add base dts file
  arm64: dts: qcom: pm8150b: Add base dts file
  arm64: dts: qcom: pm8150l: Add base dts file
  arm64: dts: qcom: sm8150-mtp: Add base dts file
  arm64: dts: qcom: sm8150-mtp: Add regulators
  arm64: dts: qcom: sm8150: Add reserved-memory regions
  arm64: dts: qcom: sm8150: Add apps shared nodes

 arch/arm64/boot/dts/qcom/Makefile       |   1 +
 arch/arm64/boot/dts/qcom/pm8150.dtsi    |  97 +++++
 arch/arm64/boot/dts/qcom/pm8150b.dtsi   |  86 +++++
 arch/arm64/boot/dts/qcom/pm8150l.dtsi   |  80 ++++
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 378 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8150.dtsi    | 481 ++++++++++++++++++++++++
 6 files changed, 1123 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm8150.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8150b.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8150l.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm8150-mtp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8150.dtsi

-- 
2.20.1

