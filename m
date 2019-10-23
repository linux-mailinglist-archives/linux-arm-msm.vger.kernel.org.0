Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB07E150D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2019 11:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390658AbfJWJCm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Oct 2019 05:02:42 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:41594 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390590AbfJWJCl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Oct 2019 05:02:41 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id B943E60159; Wed, 23 Oct 2019 09:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571821360;
        bh=a2i8iNnZEdkEkPcOqlJ7kkR15XF8PuCT8aN7gkvDOkE=;
        h=From:To:Cc:Subject:Date:From;
        b=Ue4NIj6GzhcUzHsA+Jah0A/LQhAH8zRBxRL+haOQ3EILIOuXJpe2pIz0qubiDj+hF
         wC7vBsWkztF4JpezCQm7x1mi9GUMxE14qm7Qw2Xspx07tbWP2SabDSMjspmhBwEirN
         bgifl0mc9BOYZ4QSaJyHA1sIt8Y5iiJtU/3nSD38=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E2E886087F;
        Wed, 23 Oct 2019 09:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571821359;
        bh=a2i8iNnZEdkEkPcOqlJ7kkR15XF8PuCT8aN7gkvDOkE=;
        h=From:To:Cc:Subject:Date:From;
        b=LJQ6hs+uPb1ZaKeqrf8hqIPrU52JtU2UOqnApQnarWxIAIY+U597Mtt6YAjksxCwS
         GV+4Fg7Wk0U8kIKnM+O7EhjXwCZ/YILfBIWP8Vax9N3I/wjbwyIJiYxUOYmSddo+iV
         E1xxYDHVLcqw/gBPZBmK4IzhD3nKfwPSV8P/gyPA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E2E886087F
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v3 00/11] Add device tree support for sc7180
Date:   Wed, 23 Oct 2019 14:32:08 +0530
Message-Id: <20191023090219.15603-1-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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

Rajendra Nayak (3):
  dt-bindings: qcom: Add SC7180 bindings
  arm64: dts: sc7180: Add minimal dts/dtsi files for SC7180 soc
  dt-bindings: arm-smmu: update binding for qcom sc7180 SoC

Taniya Das (1):
  arm64: dts: qcom: SC7180: Add node for rpmhcc clock driver

Vivek Gautam (1):
  arm64: dts: sc7180: Add device node for apps_smmu

 .../devicetree/bindings/arm/qcom.yaml         |   2 +
 .../devicetree/bindings/iommu/arm,smmu.txt    |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/pm6150.dtsi          |  85 ++++
 arch/arm64/boot/dts/qcom/pm6150l.dtsi         |  47 ++
 arch/arm64/boot/dts/qcom/sc7180-idp.dts       | 256 ++++++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi          | 459 ++++++++++++++++++
 7 files changed, 851 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm6150.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm6150l.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-idp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180.dtsi

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

