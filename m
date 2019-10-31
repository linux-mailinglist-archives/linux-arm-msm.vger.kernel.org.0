Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8381EAE93
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 12:16:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727277AbfJaLQy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 07:16:54 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53812 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727021AbfJaLQx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 07:16:53 -0400
Received: by mail-wm1-f65.google.com with SMTP id n7so5488644wmc.3;
        Thu, 31 Oct 2019 04:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HO9O/trmPz5jaJTIM+EKo9GXaFEizkYtRsjEdro7UN4=;
        b=uwC3mgpRnYQGgv+iA3yufLDb3pazp6PFJ7HrvX1rZHVtXb9SGcNgbTCp5b2ADvz6Ti
         RJPWTBY+Wt/p48KZN/NslmMP+v7GipGrKxQ3NfxRQkT+HaLbmT95rnZivKRA+gt11W4T
         DmjzUnyCRDJS46rDjG3oiNlSOl4AKBXQXjyyL1UrPKSdhbyVjRRCljbePebPaH6JhfE0
         +FyrujxJFivYjQg0eYA8pZNImC9shxkyjqezel5vr2VHoNj0clWBB3fOe3PBziKHdo69
         7dWdlBTomcsiNplIzwBbHC82W4ijRLhBhlmKpHoJcaz7eMl2rw4kb8X8g2lkwfSbFn+8
         N90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HO9O/trmPz5jaJTIM+EKo9GXaFEizkYtRsjEdro7UN4=;
        b=M/dpJ9k81+di+wHWrd+RsLjUNXI149ITPhvo/csp6/NmgHUW/19gZ3r1/UpHacZVmr
         p+XWrFVJX7ip6tqUXek99xWE8dX4Y16xQjthz2gg4FtkGMRAAJs9/sHdZFBkRLvHI4ow
         TyeKgZe7esYxlvpmu273km7cOkE63fkzqBigKw81Oza4ZZfxKvs7syO2hm3IRtTna3/v
         NCvMqohXT+DCYoejfj3wMYnjPdSyN6l/I/5GvhpQU4+sgm1thj+4znDl5NM+HycE1VAW
         qlYkLDuNGQ4JgTGLtZWYQgrbGhlCWe2tXBAqAqsrNNyF7RJOx5U8B7up3PnG4i+Cp7Ry
         UXeA==
X-Gm-Message-State: APjAAAUoDvpWfRw9zkhykLQrpMdGCj1NJ7+8q3t0bq63+8ALRnvuV254
        FZVVM+I228OPWmkfBnhynHpIn5RkI88=
X-Google-Smtp-Source: APXvYqyNrvpP/uPDtgXT6IXRCV4YQASucVHUi0q6i2bwirmgSO3FGI07fpzcT6qJ1Osvl/Y5hHZ+wA==
X-Received: by 2002:a7b:c748:: with SMTP id w8mr773494wmk.114.1572520611157;
        Thu, 31 Oct 2019 04:16:51 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id s17sm3009306wmh.3.2019.10.31.04.16.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2019 04:16:50 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     devicetree@vger.kernel.org, ccross@android.com,
        mark.rutland@arm.com, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, marijns95@gmail.com, kholk11@gmail.com
Subject: [PATCH v2 2/5] arm64: dts: pm8004: Add SPMI regulator and add phandles to lsids
Date:   Thu, 31 Oct 2019 12:16:42 +0100
Message-Id: <20191031111645.34777-3-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191031111645.34777-1-kholk11@gmail.com>
References: <20191031111645.34777-1-kholk11@gmail.com>
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
DT to allow configuration in specific board dts in a more human
readable fashion.

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

