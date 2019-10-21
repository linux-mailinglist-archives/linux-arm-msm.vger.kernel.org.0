Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 622C0DE4E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 08:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727047AbfJUG4F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 02:56:05 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:34602 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbfJUG4E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 02:56:04 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 1A2B3602F3; Mon, 21 Oct 2019 06:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571640964;
        bh=HbZcuc2feCuqswNNsgAUONfmCbfjCOfKRylYSKs6h9s=;
        h=From:To:Cc:Subject:Date:From;
        b=U3D5zsCN+bN77/X+/4HN1BFmIlvKnn+NoR3nx0Bferq2FwiaeH2A1LnISWqbSFiSk
         j5PRq+1PEU/H+4KGXZ6iZLdHQm6zrKc0+VjlQ35IPovnke/peSmgs+IuN9IkHYYP4r
         64Gu9ZR8BPmkq9f7NZi4Jz53IuUhODqcsHxbouFQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 012C960240;
        Mon, 21 Oct 2019 06:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571640963;
        bh=HbZcuc2feCuqswNNsgAUONfmCbfjCOfKRylYSKs6h9s=;
        h=From:To:Cc:Subject:Date:From;
        b=HE4ka2nOQFSGiYJNieupJTmi6DpQnDtOA1bimQfKX+qeqUuH0UUL2BkqzdRzQsn/3
         4g07alnJUC0fWOBxAeEbuq6xg25g60kUSN0tqOiXzMVOixr9QsyYZHRAi8gaaUR1Wj
         SEqZ3Dz7HD1SuCbHu7f+GdOe8odZGUQPbhOI4UBs=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 012C960240
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v2 00/13] Add device tree support for sc7180
Date:   Mon, 21 Oct 2019 12:25:09 +0530
Message-Id: <20191021065522.24511-1-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a collection of a few floating DT patches, and a few new
ones, adding support for basic peripherals on qualcomm's sc7180 SoC,
drivers for which are already upstream.

I have marked all as v2 to be consistent.
Each patch captures the delta if any from v1:

All the dts files have a dependency on gcc clock driver patches [1]
to merge first

[1] https://www.spinics.net/lists/linux-clk/msg41851.html

Kiran Gunda (3):
  arm64: dts: qcom: sc7180: Add SPMI PMIC arbiter device
  arm64: dts: qcom: pm6150: Add PM6150/PM6150L PMIC peripherals
  arm64: dts: qcom: sc7180-idp: Add RPMh regulators

Maulik Shah (4):
  arm64: dts: qcom: sc7180: Add cmd_db reserved area
  arm64: dts: qcom: sc7180: Add rpmh-rsc node
  drivers: irqchip: qcom-pdc: Add irqchip for sc7180
  arm64: dts: qcom: sc7180: Add pdc interrupt controller

Rajendra Nayak (4):
  dt-bindings: qcom: Add SC7180 bindings
  arm64: dts: sc7180: Add minimal dts/dtsi files for SC7180 soc
  dt-bindings: arm-smmu: update binding for qcom sc7180 SoC
  dt-bindings: qcom,pdc: Add compatible for sc7180

Taniya Das (1):
  arm64: dts: qcom: SC7180: Add node for rpmhcc clock driver

Vivek Gautam (1):
  arm64: dts: sc7180: Add device node for apps_smmu

 .../devicetree/bindings/arm/qcom.yaml         |   2 +
 .../interrupt-controller/qcom,pdc.txt         |   1 +
 .../devicetree/bindings/iommu/arm,smmu.txt    |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/pm6150.dtsi          |  85 ++++
 arch/arm64/boot/dts/qcom/pm6150l.dtsi         |  47 ++
 arch/arm64/boot/dts/qcom/sc7180-idp.dts       | 256 ++++++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi          | 459 ++++++++++++++++++
 drivers/irqchip/qcom-pdc.c                    |   1 +
 9 files changed, 853 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm6150.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm6150l.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-idp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180.dtsi

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

