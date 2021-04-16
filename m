Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 166C6362089
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Apr 2021 15:09:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243487AbhDPNJW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 09:09:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243441AbhDPNJU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 09:09:20 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDE95C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 06:08:55 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id e186so27612785iof.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 06:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uIsY7rTiA+VYMrCL0Fk+IRPmeXg2RKOGnKhn6jk88kE=;
        b=tFyHUHgdMoZuhKobVdbX2vg8qAX7TnojQWkhHz9Ak0pCsoCpXT12YGpXihZIDn6cHY
         76bIRnoSoxcU9vlHDlv5LO540YctIM9vnF6ehSra3UAiJmV5/oMtoxD+vAeJFwUi8A76
         SieIzgCha1dTrT/oBzi2Vn86SFQY/icxVndiVcjkFmrhOwtNSxX0pLZsM+BRHFjZFutl
         32e4NvSs9rrSOSTP1eM5EFP32EMV3WDZybHcWen/vCsFxcDqF050TA1b86DwzrFjkRBQ
         SEzn9j6xvzV+k0hKCinhT9DGl33HAOY7VAQY7jHee5JnmEkKYsuA/hLHRs9H3bFv/eTf
         MylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uIsY7rTiA+VYMrCL0Fk+IRPmeXg2RKOGnKhn6jk88kE=;
        b=n7UtNyDbqcS8TGqnMYELVOCW/Y6aRSeaLY5SodDybmHXlzgXP7us3pvR0AZrITKPBt
         flnAWVWE31n6DoYgGHeoz5KIQyrs49r9QMMeHQ3pwq05/SCrQRPwzbZN4D4X8OMVZwnZ
         BS6cAs5Ff8RiviA4AiSL5y4KlM7XvY4ifH9WD/VmKKb5LUbY+pKBduQsFHPdy3Op89nG
         F1Ehn8TKstYkdR8zSkh+ItMqH9Xmp0LLnJCCgQS7Hv1pOiEv4uh54Z9qLYMHfF29L3Sk
         ndBOjHKRcECkx+zb4w4QFuRQj19hU7r2EWPAS7PhF51ZQCDYoCo5DMw6nTzW3KuAGad/
         CxzQ==
X-Gm-Message-State: AOAM533ul5eKs59Digs77DygHwOqk9Ep2YZl0x6lhD2O1iVKyf2TXJrR
        zJ3i5C7+tx4bxlL2BlWmxcPKF3WtgqjsvQ==
X-Google-Smtp-Source: ABdhPJyO/6DXTD88pvOp8rSOlXVJJ35Xta+9suI4ouLqEEhZDpNAUjVHC5RN3PwkZ+QI33qsrrtoOw==
X-Received: by 2002:a6b:7601:: with SMTP id g1mr2792815iom.37.1618578535272;
        Fri, 16 Apr 2021 06:08:55 -0700 (PDT)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id e6sm2713535ilr.81.2021.04.16.06.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 06:08:55 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org, robh+dt@kernel.org,
        elder@kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 2/2] net: ipa: optionally define firmware name via DT
Date:   Fri, 16 Apr 2021 08:08:50 -0500
Message-Id: <20210416130850.1970247-3-elder@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416130850.1970247-1-elder@linaro.org>
References: <20210416130850.1970247-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IPA initialization includes loading some firmware.  This step is
done either by the modem or by the AP under Trust Zone.  If the
AP loads firmware, the name of the firmware file is currently
hard-coded ("ipa_fws.mdt").

Add the ability to specify the relative path of the firmware file to
use in a property in the Device Tree IPA node.  If the property is
not found (or if any other error occurs attempting to get it), fall
back to using a default relative path.

Use the "old" fixed name as the default.  Rename the symbol that
represents this default to emphasize its purpose.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_main.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index aad915e2ce523..9915603ed10ba 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -67,7 +67,7 @@
  */
 
 /* The name of the GSI firmware file relative to /lib/firmware */
-#define IPA_FWS_PATH		"ipa_fws.mdt"
+#define IPA_FW_PATH_DEFAULT	"ipa_fws.mdt"
 #define IPA_PAS_ID		15
 
 /* Shift of 19.2 MHz timestamp to achieve lower resolution timestamps */
@@ -517,6 +517,7 @@ static int ipa_firmware_load(struct device *dev)
 	struct device_node *node;
 	struct resource res;
 	phys_addr_t phys;
+	const char *path;
 	ssize_t size;
 	void *virt;
 	int ret;
@@ -534,9 +535,17 @@ static int ipa_firmware_load(struct device *dev)
 		return ret;
 	}
 
-	ret = request_firmware(&fw, IPA_FWS_PATH, dev);
+	/* Use name from DTB if specified; use default for *any* error */
+	ret = of_property_read_string(dev->of_node, "firmware-name", &path);
 	if (ret) {
-		dev_err(dev, "error %d requesting \"%s\"\n", ret, IPA_FWS_PATH);
+		dev_dbg(dev, "error %d getting \"firmware-name\" resource\n",
+			ret);
+		path = IPA_FW_PATH_DEFAULT;
+	}
+
+	ret = request_firmware(&fw, path, dev);
+	if (ret) {
+		dev_err(dev, "error %d requesting \"%s\"\n", ret, path);
 		return ret;
 	}
 
@@ -549,13 +558,11 @@ static int ipa_firmware_load(struct device *dev)
 		goto out_release_firmware;
 	}
 
-	ret = qcom_mdt_load(dev, fw, IPA_FWS_PATH, IPA_PAS_ID,
-			    virt, phys, size, NULL);
+	ret = qcom_mdt_load(dev, fw, path, IPA_PAS_ID, virt, phys, size, NULL);
 	if (ret)
-		dev_err(dev, "error %d loading \"%s\"\n", ret, IPA_FWS_PATH);
+		dev_err(dev, "error %d loading \"%s\"\n", ret, path);
 	else if ((ret = qcom_scm_pas_auth_and_reset(IPA_PAS_ID)))
-		dev_err(dev, "error %d authenticating \"%s\"\n", ret,
-			IPA_FWS_PATH);
+		dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
 
 	memunmap(virt);
 out_release_firmware:
-- 
2.27.0

