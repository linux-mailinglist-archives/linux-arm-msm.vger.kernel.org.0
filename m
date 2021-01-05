Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB4312EAABC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 13:28:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730130AbhAEM1p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 07:27:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728053AbhAEM1o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 07:27:44 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9ABFC061796
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 04:27:03 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id f14so1577963pju.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 04:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jYJjVEdJXcwBJxA+GXTjlWCuGOgAc5YnZyOc1A9H7aI=;
        b=q4lV5nILcW+ywKKPX6ThQbRc7UbBlOt0j/L8p8tgUgUNoKHzq0f0cD2BKWoGj04fGL
         vpmDusrNs8WEbRRbw6ZduDQFQCpffJUvMxUKpMQqLxucltX790Gj1gOvFTXTfemHz1Iz
         HoyDdONW9+UxlP2kXhbKZk+g7GVy9txg6IkLonnQkVvTdGnQJ+gX3KpFVdKKOGNZc2R9
         gyoTCVlUVkPAW9NNk+v/s/FijaMsBT2UvAxmWPuj2bbbOxAHrQGhrJITn9gV0KKCApnH
         jDOefS0WZ9ZDcn9pAzp00YDvkty/C3mrUU0EknOctyi9zt7KBeN0NJh+Cb8yM1B3+V5s
         uVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jYJjVEdJXcwBJxA+GXTjlWCuGOgAc5YnZyOc1A9H7aI=;
        b=YTQhF2GM/rHcJydb98dAVNxTrCRk/j6aFkDbUcGpRtSdiODiYq+F2nKSPaSlv+uNUk
         64lJy+FHMEq9n8nut+WdSFMIqnqgfX3A8OsmFQKqlMfX59BMuGkths6OAkVn010cwYZA
         cEToU5haDQJliu+OfHBy2HN+grdUKRLVVDXcZPZXi35EMAdf3CY8MT1MoccfsRtlbJUh
         4Y0isaaPMLxz+598jnIPlgcLpa07oy7Ck+0NT9dPGbl0l9Rkes8vdpYJebMooRqydJn2
         SSEkXONOcnexyDQoqnnzzCaUBAOKbsktGgsZjlhsncApApQV4iikaoIkg8kudcWpX8oj
         IKPA==
X-Gm-Message-State: AOAM532ZI0ClAdX/dk3KTufAbgb/GTVW0vkt2HQ6Y/zoexfTj5XqNuM9
        6UvLIvlQFIVAtQGDc2o8Bev/
X-Google-Smtp-Source: ABdhPJz8rsniJleCP5sBMpeerUa4kHCNJLcGNG8b3tsc8eHLs758XfHZKLYANPleoeed8VUPe4pF9g==
X-Received: by 2002:a17:90a:b114:: with SMTP id z20mr3803297pjq.14.1609849623337;
        Tue, 05 Jan 2021 04:27:03 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.191])
        by smtp.gmail.com with ESMTPSA id t22sm64745402pgm.18.2021.01.05.04.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 04:27:02 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 02/18] ARM: dts: qcom: sdx55: Add reserved memory nodes
Date:   Tue,  5 Jan 2021 17:56:33 +0530
Message-Id: <20210105122649.13581-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
References: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vinod Koul <vkoul@kernel.org>

This adds reserved memory nodes to the SDX55 dtsi as defined by v8 of
the memory map

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55.dtsi | 67 +++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
index 08b4a40338fa..eeb6bf392f93 100644
--- a/arch/arm/boot/dts/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -60,6 +60,73 @@ psci {
 		method = "smc";
 	};
 
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		mpss_debug_mem: memory@8ef00000 {
+			no-map;
+			reg = <0x8ef00000 0x800000>;
+		};
+
+		hyp_mem: memory@8fc00000 {
+			no-map;
+			reg = <0x8fc00000 0x80000>;
+		};
+
+		ac_db_mem: memory@8fc80000 {
+			no-map;
+			reg = <0x8fc80000 0x40000>;
+		};
+
+		secdata_mem: memory@8fcfd000 {
+			no-map;
+			reg = <0x8fcfd000 0x1000>;
+		};
+
+		ipa_fw_mem: memory@8fced000 {
+			no-map;
+			reg = <0x8fced000 0x10000>;
+		};
+
+		sbl_mem: memory@8fd00000 {
+			no-map;
+			reg = <0x8fd00000 0x100000>;
+		};
+
+		aop_image: memory@8fe00000 {
+			no-map;
+			reg = <0x8fe00000 0x20000>;
+		};
+
+		aop_cmd_db: memory@8fe20000 {
+			compatible = "qcom,cmd-db";
+			reg = <0x8fe20000 0x20000>;
+			no-map;
+		};
+
+		smem_mem: memory@8fe40000 {
+			no-map;
+			reg = <0x8fe40000 0xc0000>;
+		};
+
+		tz_mem: memory@8ff00000 {
+			no-map;
+			reg = <0x8ff00000 0x100000>;
+		};
+
+		tz_apps_mem: memory@0x90000000 {
+			no-map;
+			reg = <0x90000000 0x500000>;
+		};
+
+		mpss_adsp_mem: memory@90800000 {
+			no-map;
+			reg = <0x90800000 0xf800000>;
+		};
+	};
+
 	soc: soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.25.1

