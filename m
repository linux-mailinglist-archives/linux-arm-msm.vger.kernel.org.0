Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A59E626B6A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Nov 2022 21:07:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235017AbiKLUHb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Nov 2022 15:07:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234941AbiKLUH1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Nov 2022 15:07:27 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A49A15A3B
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Nov 2022 12:07:25 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id p141so5725125iod.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Nov 2022 12:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbFCvRl1cs7XC6NWdvqbuTmw/rqE6VsOAXoQYLExO5Q=;
        b=kQdrYZsuJaVebDpUK1qll7fwMnM+JhAIDP0wsHb48mI9g/xXQwhDQ58vxgd8IOZmAn
         jREThxZltYYSej0l4guj6s7C0OLAbh4hiXfVjLgcIvkER/xnaGciGUWRh2in+9r7Tvaa
         LH8pJX0cLpnzOD/AD87PHklH+eKyUlyCV3JmeBKTUPyg67uQ+7Z1qMOBBaQCqtNs/jGW
         dkS45ArZEfQmsd66/or6Y6Ni9LfrjTg//FXAeJlnErIctxlPMyX5bLG5oVRvaCSSIKjA
         AqKZMRfn2AN5Ef942CZDRi80FYpxtpKuiDY9mo1yG+8PQ93wdgV1yd3gVHID7Ksaa5Md
         uLBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IbFCvRl1cs7XC6NWdvqbuTmw/rqE6VsOAXoQYLExO5Q=;
        b=JVUsTpOpVsVJrFlFSuvgrAYX0pkLcP1Cpn1YL9WpHhYW4jwVLBxL5dgY5q8/T7KBlP
         aZgOFglEa1Z29OrNP28md4D2ATTYj4ChH5xvx2WEM6iCcOImD/XfIf+oKVpAG9LWAGcf
         4Xh0UfBo97C6PUI6Ht4Q4XjgXfglsqwP0wq+XlY0csXX+sPusxSnt3g2zyrFOu8CW7rE
         K6PpHXbRn4QnhCUwUnKBpxZtPZDVJDSTGb76YRcEWRWPMdHjGiPZswUBBkd3vfxEK7c9
         2SFEBLuUk9HNVvFVGwrQYKdrhP8rCYQNbtNpwjjpJypm2MELUxfLZ/QIp97nyJMTbMhi
         bn4g==
X-Gm-Message-State: ANoB5pnHSg/cwwxj6RMWl6wPBARaWKvCjDmVZdI9VqTt25qNO5hL58IQ
        Wu00x/Rr9quC1ebTtJDReSE47Q==
X-Google-Smtp-Source: AA0mqf6R0GUoI4fYcCYVQy/EPRS+AP31ATtSDojFt2O0IpT8OSa/+EuBfAagtWkM8a4JldgurLIzFA==
X-Received: by 2002:a6b:6c19:0:b0:6bc:4a3a:4de2 with SMTP id a25-20020a6b6c19000000b006bc4a3a4de2mr3097956ioh.207.1668283644942;
        Sat, 12 Nov 2022 12:07:24 -0800 (PST)
Received: from presto.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id j28-20020a02cb1c000000b00363dee286edsm2036870jap.60.2022.11.12.12.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 12:07:24 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     andersson@kernel.org, konrad.dybcio@linaro.org, agross@kernel.org,
        elder@kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 2/5] net: ipa: encapsulate decision about firmware load
Date:   Sat, 12 Nov 2022 14:07:14 -0600
Message-Id: <20221112200717.1533622-3-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221112200717.1533622-1-elder@linaro.org>
References: <20221112200717.1533622-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The GSI layer used for IPA requires firmware to be loaded.

Currently either the AP or the modem loads the firmware,
distinguished by whether the "modem-init" Device Tree
property is defined.

Some newer systems implement a third option.  In preparation for
that, encapsulate the code that determines how the GSI firmware
gets loaded in a new function, ipa_firmware_loader().

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_main.c | 39 ++++++++++++++++++++++++++++++--------
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index ebb6c9b311eb9..9e43b79d233e9 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -81,6 +81,19 @@
 /* Divider for 19.2 MHz crystal oscillator clock to get common timer clock */
 #define IPA_XO_CLOCK_DIVIDER	192	/* 1 is subtracted where used */
 
+/**
+ * enum ipa_firmware_loader: How GSI firmware gets loaded
+ *
+ * @IPA_LOADER_DEFER:		System not ready; try again later
+ * @IPA_LOADER_SELF:		AP loads GSI firmware
+ * @IPA_LOADER_MODEM:		Modem loads GSI firmware, signals when done
+ */
+enum ipa_firmware_loader {
+	IPA_LOADER_DEFER,
+	IPA_LOADER_SELF,
+	IPA_LOADER_MODEM,
+};
+
 /**
  * ipa_setup() - Set up IPA hardware
  * @ipa:	IPA pointer
@@ -696,6 +709,18 @@ static void ipa_validate_build(void)
 	BUILD_BUG_ON(!ipa_aggr_granularity_val(IPA_AGGR_GRANULARITY));
 }
 
+static enum ipa_firmware_loader ipa_firmware_loader(struct device *dev)
+{
+	if (of_property_read_bool(dev->of_node, "modem-init"))
+		return IPA_LOADER_MODEM;
+
+	/* We need Trust Zone to load firmware; make sure it's available */
+	if (qcom_scm_is_available())
+		return IPA_LOADER_SELF;
+
+	return IPA_LOADER_DEFER;
+}
+
 /**
  * ipa_probe() - IPA platform driver probe function
  * @pdev:	Platform device pointer
@@ -722,9 +747,9 @@ static void ipa_validate_build(void)
 static int ipa_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	enum ipa_firmware_loader loader;
 	const struct ipa_data *data;
 	struct ipa_power *power;
-	bool modem_init;
 	struct ipa *ipa;
 	int ret;
 
@@ -747,11 +772,9 @@ static int ipa_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	/* If we need Trust Zone, make sure it's available */
-	modem_init = of_property_read_bool(dev->of_node, "modem-init");
-	if (!modem_init)
-		if (!qcom_scm_is_available())
-			return -EPROBE_DEFER;
+	loader = ipa_firmware_loader(dev);
+	if (loader == IPA_LOADER_DEFER)
+		return -EPROBE_DEFER;
 
 	/* The clock and interconnects might not be ready when we're
 	 * probed, so might return -EPROBE_DEFER.
@@ -796,7 +819,7 @@ static int ipa_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_endpoint_exit;
 
-	ret = ipa_smp2p_init(ipa, modem_init);
+	ret = ipa_smp2p_init(ipa, loader == IPA_LOADER_MODEM);
 	if (ret)
 		goto err_table_exit;
 
@@ -815,7 +838,7 @@ static int ipa_probe(struct platform_device *pdev)
 	 * call to ipa_setup() when it has finished.  In that case we're
 	 * done here.
 	 */
-	if (modem_init)
+	if (loader == IPA_LOADER_MODEM)
 		goto done;
 
 	/* Otherwise we need to load the firmware and have Trust Zone validate
-- 
2.34.1

