Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8E0DDDF0B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2019 17:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbfJTPIE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Oct 2019 11:08:04 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34644 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726539AbfJTPIE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Oct 2019 11:08:04 -0400
Received: by mail-wm1-f67.google.com with SMTP id y135so12764786wmc.1;
        Sun, 20 Oct 2019 08:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9tcwGK+h3aNhLhSTM8lPhLAsY2lnjZUmehK0FORRoys=;
        b=tzzkK7c1TFJ6gAQSidlRvRYjpBBRrSYtJd0kVjcHScwaSXtnrCPKzATuhlIunyH4pe
         JqFP9ZdW8bYPLyXgmM9iUJskRa7fOEXNPWDc58gUi/SUhj08OIPmj6iUVnGSQfThC04V
         wZ2wbwESUJg1dlWo22XO14C50ApTPD+uhav6Q1dh8NmV2Ou+VCRdrEjY78iS2LdOfrI1
         0vR+5LiwylLrN5LRLXX6Zr6fpZ7IgGUjZATdMa+iW4grpNZTzmF3DZeHQKlpVoET65Wn
         seBb1Pt9Hvjw1iUGSuTLgaOeaW4bR9hoA7P0ZNwQ3dy5yc7+q8LvTfc+QlIwqRTCaP8P
         ERkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9tcwGK+h3aNhLhSTM8lPhLAsY2lnjZUmehK0FORRoys=;
        b=cQvTUQSa6f/1K6V3rywfajCko4LoDbMFUKvrzU8QHvrt7PnzLzPgwIxLpt/Zj4dfKA
         yLbbFIXLg+ZeR4HVdAM2BrGq95xaKJdM+Y2s694WKtXcQV536v+oRpXjGRrJ+xFiSn4u
         wFSdPwJjJTn9un1WZf4TskSAJN4fz86FgglR+U0XaNspEIoWUSnTiA4hvYkNSkPTHEhW
         9eD9+D9ck37+k5CCaPYZfat116dSvFkc/FeDBfyfLNkV35tB8zwsew4X8pynK4KrqLZ9
         Sh5RiGWBlBHwsEgM2XBwE/v9bKe0FD4ilNd0D2AVjEO0vKA3aWG40m3JpC1PyISOdyV7
         /NXw==
X-Gm-Message-State: APjAAAVbGK1U60KXP8rxWOXDxavfEl2pKNl4uSmQcOcVqt1xsoiAP4YI
        Kd6wYG7AceIt0qulhV52BfCsJiSa6OMRpw==
X-Google-Smtp-Source: APXvYqzBJc99F9nbQPWLCC7sADsOGkvzaQyOdW1scSoM/1gOkkTewAF+5ZDRekc5zN/bXkQpYbLgow==
X-Received: by 2002:a05:600c:225a:: with SMTP id a26mr2365078wmm.73.1571584080441;
        Sun, 20 Oct 2019 08:08:00 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id z9sm11921172wrv.1.2019.10.20.08.07.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 20 Oct 2019 08:07:59 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     devicetree@vger.kernel.org, ccross@android.com,
        mark.rutland@arm.com, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, marijns95@gmail.com, kholk11@gmail.com
Subject: [PATCH 2/5] arm64: dts: pm8004: Add SPMI regulator and add phandles to lsids
Date:   Sun, 20 Oct 2019 17:07:43 +0200
Message-Id: <20191020150746.64114-3-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191020150746.64114-1-kholk11@gmail.com>
References: <20191020150746.64114-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Add the SPMI regulator node in the PM8004 LSID5 (as there is where
it resides basically 99% of the times) and set the nodes to be
disabled by default, as not all boards have both or one of the
lsids specified in this generic pm8004 DT.

While at it, also add nice phandles to the lsids specified in this
DT, so that we can modify their configuration or add nodes to them
from other DTs in a nicer and more human readable fashion.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 arch/arm64/boot/dts/qcom/pm8004.dtsi | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8004.dtsi b/arch/arm64/boot/dts/qcom/pm8004.dtsi
index 297b57bfa87a..0abd1abe12fc 100644
--- a/arch/arm64/boot/dts/qcom/pm8004.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8004.dtsi
@@ -4,17 +4,23 @@
 
 &spmi_bus {
 
-	pmic@4 {
+	pm8004_lsid4: pmic@4 {
 		compatible = "qcom,pm8004", "qcom,spmi-pmic";
 		reg = <0x4 SPMI_USID>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		status = "disabled";
 	};
 
-	pmic@5 {
+	pm8004_lsid5: pmic@5 {
 		compatible = "qcom,pm8004", "qcom,spmi-pmic";
 		reg = <0x5 SPMI_USID>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		status = "disabled";
+
+		pm8004_spmi_regulators: regulators {
+			compatible = "qcom,pm8004-regulators";
+		};
 	};
 };
-- 
2.21.0

