Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7116E20F6C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 16:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388632AbgF3OJg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Jun 2020 10:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730339AbgF3OJe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Jun 2020 10:09:34 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3A16C061755;
        Tue, 30 Jun 2020 07:09:33 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id a1so20775947ejg.12;
        Tue, 30 Jun 2020 07:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oEIesOIh2eEPyGIcocRpHywZ3RCRJufVPViTP+ZtDmQ=;
        b=oUfUydbJvn80XfAt4xB0253AhcIFR0rzDDHBHnGqNgSJJeCNp8utgIbixVou1AnICx
         Ao7UjLmjeCdrIlucwmpUmVIkAXOgWn4jeM4pH+683Ud90e6+Ps0VEqYJGb3rGBGdVi7E
         Ld+56O46f6DuEY1lcHGqN9pz1XHzRyj1PCR1LKGXnunSeArQ9jDNbhLI8FsMBQw+OwIJ
         DtfmvNEBADn1HE7jrr0TAZHJeI66rDThQmigSpV6Hgo3Z6eJHpOtEXlBokERutYnEFnY
         jHKnCeKwKhe4Bwgy8UiHZwUaWt/GmJSLtiwQCJMEpbOQ9fVHkEWHjw38biqC/cz9ZcEo
         Srmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oEIesOIh2eEPyGIcocRpHywZ3RCRJufVPViTP+ZtDmQ=;
        b=A3C1ANijYobTNP/JvVA81jqX2fWeSJJVvD1MwDsBkxJW4D5JpJbExLZoOH5uJBRXXe
         /8tPtlW+Mkib7ORJv2DctIy8rT1JBBeM1Ch6GwusyGh1A1L2SxuQ7n/xPwe0yYcfvNlr
         fP4ioAP5+9ndQud3M91r9VVPFQo9JGNdSgDhKxaSCZWt43OSEiuPnq0OFN04HoTBKsqo
         bdGM/nCyqNKdL6aaCnWtZxrHHroS6dgMLo+DaaFwAPDiFKfhmagr7ChgMLBgKZb3Psov
         UXOFPNacM0WwveHi2SUi+kpWnWaHtvR959uW1c+ISB52QkG5LqKt+IxJVRWSN4oZQHJr
         kCWQ==
X-Gm-Message-State: AOAM533IvivXhSaKgYxzGcl9nzcfbjeMW6suenbJ8ypjEKuzTgejYx/L
        a9DsR56GPhbKoRcTr3KHdKg=
X-Google-Smtp-Source: ABdhPJyrcx0lP72w+PUYC/gRd9qIp40weTnteBiasf0hsJwZdonmgfDC04OEt+smFoWFC1HL6uYxTQ==
X-Received: by 2002:a17:906:194b:: with SMTP id b11mr12484199eje.28.1593526172627;
        Tue, 30 Jun 2020 07:09:32 -0700 (PDT)
Received: from localhost ([213.191.183.145])
        by smtp.gmail.com with ESMTPSA id lv17sm2146098ejb.56.2020.06.30.07.09.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2020 07:09:32 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH 1/7] ARM: dts: qcom: msm8974-klte: Merge pinctrl nodes
Date:   Tue, 30 Jun 2020 17:09:06 +0300
Message-Id: <20200630140912.260294-2-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200630140912.260294-1-iskren.chernev@gmail.com>
References: <20200630140912.260294-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

commit cd13c72c1853 ("ARM: dts: qcom: msm8974-klte: Add max77826 pmic
node") and commit 8bf7a360a92c ("ARM: dts: qcom: msm8974-klte: Add sdhci1
node") both added pinctrl node. This patch merges the two nodes.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 .../boot/dts/qcom-msm8974-samsung-klte.dts    | 22 +++++++++----------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index d4dc98214225a..9520c6e7910ce 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -258,6 +258,16 @@ cmd-data {
 				bias-pull-up;
 			};
 		};
+
+		i2c6_pins: i2c6 {
+			mux {
+				pins = "gpio29", "gpio30";
+				function = "blsp_i2c6";
+
+				drive-strength = <2>;
+				bias-disable;
+			};
+		};
 	};

 	sdhci@f9824900 {
@@ -298,18 +308,6 @@ phy@a {
 		};
 	};

-	pinctrl@fd510000 {
-		i2c6_pins: i2c6 {
-			mux {
-				pins = "gpio29", "gpio30";
-				function = "blsp_i2c6";
-
-				drive-strength = <2>;
-				bias-disable;
-			};
-		};
-	};
-
 	i2c@f9928000 {
 		status = "okay";

--
2.27.0

