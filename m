Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51E01F0F3B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 07:51:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731304AbfKFGv0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 01:51:26 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:45754 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731295AbfKFGvZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 01:51:25 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 4D91361342; Wed,  6 Nov 2019 06:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573023085;
        bh=w0bSN3Dvg7NQq1Hf6xo9XqFEqdQaiQtERxcdP/PYQqA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bJUYWbFY6zA62pDoOV08lzlDOWrbwL3lWkaQt5ew4us/I8g/yQVkGq7q8Byx0otEM
         Fj5Mk0vfBVXxVbFSzqitDgeAz1C0oNpBvAO6auHF0VXrYFx4qJ44t4RteRHXgq1I4e
         js6PNFanc99BnZAc8e3y3dUiBpWZ3eLcedl4ZfxY=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 618C461321;
        Wed,  6 Nov 2019 06:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573023084;
        bh=w0bSN3Dvg7NQq1Hf6xo9XqFEqdQaiQtERxcdP/PYQqA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ot56MWD+k+Aq6pVxDlDVdM1r8rfzOgt87YHdPXp2RcPQhb0qz4Ybk3Y8lHJv9CfMZ
         UiyoG0GWbsT2NN26kPPGc4FiRJEFjhvDNxZ4VbIzF40K7MLOGtwTCRpKv1OHoH9jym
         9nW8VGz5HN2p4y9EyWZm26Q992nZMMx7KEeZou0w=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 618C461321
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        swboyd@chromium.org, Maulik Shah <mkshah@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v4 09/14] arm64: dts: qcom: sc7180: Add pdc interrupt controller
Date:   Wed,  6 Nov 2019 12:20:12 +0530
Message-Id: <20191106065017.22144-10-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191106065017.22144-1-rnayak@codeaurora.org>
References: <20191106065017.22144-1-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Maulik Shah <mkshah@codeaurora.org>

Add pdc interrupt controller for sc7180

Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
v4: Updated compatible string

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 98c8ab7d613c..14b8986c8a5f 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -202,6 +202,16 @@
 			};
 		};
 
+		pdc: interrupt-controller@b220000 {
+			compatible = "qcom,sc7180-pdc", "qcom,pdc";
+			reg = <0 0xb220000 0 0x30000>;
+			qcom,pdc-ranges = <0 480 15>, <17 497 98>,
+					  <119 634 4>, <124 639 1>;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&intc>;
+			interrupt-controller;
+		};
+
 		tlmm: pinctrl@3500000 {
 			compatible = "qcom,sc7180-pinctrl";
 			reg = <0 0x03500000 0 0x300000>,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

