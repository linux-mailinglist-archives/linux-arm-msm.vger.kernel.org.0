Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7823BF0F22
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 07:50:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727905AbfKFGuw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 01:50:52 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:44738 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbfKFGuv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 01:50:51 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id CF7C361180; Wed,  6 Nov 2019 06:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573023050;
        bh=U4eaKrxV4bYoOxl1bDFa3xlc7LyElFv6Hc81HMZ9mP4=;
        h=From:To:Cc:Subject:Date:From;
        b=abCcUhsPW8bWUFFKNSjyYi4BA6QH9XEIhGwEdEWbjrG0WPie8kUVfw5uLzIolcDuq
         NtLh0oSMHDlAKc1ti982ivxjpzir1TCSfF9zEI6YzLgB5EyRpPDAg5QWtTsGqqcPZj
         GVSO1xP0GkQsZljm5oJcD8lGoGE3hOKz80Dc8muM=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1D4B561060;
        Wed,  6 Nov 2019 06:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573023050;
        bh=U4eaKrxV4bYoOxl1bDFa3xlc7LyElFv6Hc81HMZ9mP4=;
        h=From:To:Cc:Subject:Date:From;
        b=abCcUhsPW8bWUFFKNSjyYi4BA6QH9XEIhGwEdEWbjrG0WPie8kUVfw5uLzIolcDuq
         NtLh0oSMHDlAKc1ti982ivxjpzir1TCSfF9zEI6YzLgB5EyRpPDAg5QWtTsGqqcPZj
         GVSO1xP0GkQsZljm5oJcD8lGoGE3hOKz80Dc8muM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1D4B561060
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        swboyd@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v4 00/14] Add device tree support for sc7180
Date:   Wed,  6 Nov 2019 12:20:03 +0530
Message-Id: <20191106065017.22144-1-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes in v4:
* Rebased on top of Rob;s for-next
* reorderd patches to take care of pdc dependency
* Updated pdc binding to use a soc specific and soc independent compatible
* Other updates based on v3 feedback, changes listed in each patch 

Changes in v3:
* PATCH 2/11: Updated the qup and uart lables to be consistent
with the naming convention followed in sdm845 as suggested
by Matthias
* Dropped 2 patches from v2 which added the new compatible and
binding updates for sc7180 pdc and reused sdm845 compatible instead
as suggested by Marc Z

This series adds DT support for basic peripherals on qualcomm's sc7180 SoC,
drivers for which are already upstream.

The series has a dependency on gcc clock driver patches [1]
to merge first

[1] https://www.spinics.net/lists/linux-clk/msg41851.html

Kiran Gunda (3):
  arm64: dts: qcom: sc7180: Add SPMI PMIC arbiter device
  arm64: dts: qcom: pm6150: Add PM6150/PM6150L PMIC peripherals
  arm64: dts: qcom: sc7180-idp: Add RPMh regulators

Maulik Shah (3):
  arm64: dts: qcom: sc7180: Add cmd_db reserved area
  arm64: dts: qcom: sc7180: Add rpmh-rsc node
  arm64: dts: qcom: sc7180: Add pdc interrupt controller

Rajendra Nayak (5):
  dt-bindings: qcom: Add SC7180 bindings
  arm64: dts: sc7180: Add minimal dts/dtsi files for SC7180 soc
  dt-bindings: arm-smmu: update binding for qcom sc7180 SoC
  drivers: irqchip: qcom-pdc: Move to an SoC independent compatible
  dt-bindings: qcom,pdc: Add compatible for sc7180

Roja Rani Yarubandi (1):
  arm64: dts: sc7180: Add qupv3_0 and qupv3_1

Taniya Das (1):
  arm64: dts: qcom: SC7180: Add node for rpmhcc clock driver

Vivek Gautam (1):
  arm64: dts: sc7180: Add device node for apps_smmu

 .../devicetree/bindings/arm/qcom.yaml         |    6 +
 .../interrupt-controller/qcom,pdc.txt         |    3 +-
 .../devicetree/bindings/iommu/arm,smmu.yaml   |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 arch/arm64/boot/dts/qcom/pm6150.dtsi          |   72 ++
 arch/arm64/boot/dts/qcom/pm6150l.dtsi         |   31 +
 arch/arm64/boot/dts/qcom/sc7180-idp.dts       |  402 ++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi          | 1133 +++++++++++++++++
 drivers/irqchip/qcom-pdc.c                    |    2 +-
 9 files changed, 1649 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/pm6150.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm6150l.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-idp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180.dtsi

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

