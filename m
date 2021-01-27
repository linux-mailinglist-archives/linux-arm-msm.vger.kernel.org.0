Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D49D0305BAD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 13:41:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237038AbhA0Mec (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 07:34:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:48378 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237971AbhA0Mbm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 07:31:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94D1920739;
        Wed, 27 Jan 2021 12:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611750662;
        bh=kfPWuMiJgpAL7RluS7ayXnMgIu7E8eRHIeDT+ADuoFE=;
        h=From:To:Cc:Subject:Date:From;
        b=jzeoAYfuKS7XXmCKfwYw+jb0uFJReYDxA5lHU5PnW2BVvm/Y5e7a3KUBmZ4+bwHPZ
         wyhaw1+6VuxhfoITL53j1L40IZAq2ElRHk5ziOEqbuAzpbVBFoj3FJJuqm05j5zpk8
         6OTfK9d1ydEIyxB26PWXFETiifozMHnxs9P6/hj5n9SjcHjgg4bdP6kWReOsAmHrCV
         PSNzkbnyhGtBP6rxewXhUNLdXbbTgHmjKMW7NMy6R+quuKUEiqpqiKpaC//A9PApo+
         WpWlfwELW9GaXd6/7oy0i4NBXcNlYOVIlCW6iHgC6XfdaEnSs+4LjxLtg/Xv/Akuca
         BD9u+FiV6KM5g==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] Add binding and dts for Qualcomm SM8350 SoC
Date:   Wed, 27 Jan 2021 18:00:48 +0530
Message-Id: <20210127123054.263231-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

This series adds the compatible for SM8350 SoC, boardi, cpu, scm and aoss
compatible.  Then the base DTS for SM8350 SoC which contains clock (gcc,
rpmh), pinctrl, uart, reserved memory and cpu nodes. The board file for MTP
enables uart and adds the rpmh regulators

Changes in v2:
 - Add ack by Rob recieved for v1
 - Document cpu and scm compatible and use soc specific scm compatible
 - Fix errors pointed by Rob and make dtbs_check as well as W=1 compilation

Vinod Koul (6):
  dt-bindings: arm: qcom: Document SM8350 SoC and boards
  soc: qcom: aoss: Add SM8350 compatible
  dt-bindings: arm: cpus: Add kryo685 compatible
  dt-bindings: firmware: scm: Add SM8250 and SM8350 compatible
  arm64: dts: qcom: Add basic devicetree support for SM8350 SoC
  arm64: dts: qcom: Add basic devicetree support for SM8350-MTP board

 .../devicetree/bindings/arm/cpus.yaml         |   1 +
 .../devicetree/bindings/arm/qcom.yaml         |   6 +
 .../devicetree/bindings/firmware/qcom,scm.txt |   2 +
 .../bindings/soc/qcom/qcom,aoss-qmp.txt       |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts       | 250 +++++++++
 arch/arm64/boot/dts/qcom/sm8350.dtsi          | 499 ++++++++++++++++++
 drivers/soc/qcom/qcom_aoss.c                  |   1 +
 8 files changed, 761 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8350-mtp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8350.dtsi

-- 
2.26.2

