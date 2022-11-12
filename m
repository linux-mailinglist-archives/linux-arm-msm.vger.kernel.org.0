Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE28A626B6D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Nov 2022 21:07:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235048AbiKLUHc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Nov 2022 15:07:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234964AbiKLUH1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Nov 2022 15:07:27 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D80BE15A2A
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Nov 2022 12:07:26 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id z3so5733268iof.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Nov 2022 12:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QmJK2z6YewxghveqGIb9UQBF6OMvTjY+OevUyUnH0xk=;
        b=qvii5+YfRDQV27AwF5yXB+bnAxlzBNOOdUYYa7xFW6WdfwigOKyjOcCHQsCgakTjDL
         CNqJRFb5amTb6a2JWTIc9XauQSvZ7IkVA+8sRVfu7WUax+6QvchktbNfBl1F2qaErOxh
         Ey51lKVbJINQ/MsI7Ex7U5qcdqNO0tWea6LlikYU+YAzhaW0JHnCMT8hVNErVCDwlW0y
         BtFulbBZGuMu6ZeP3EpBgxLuL3DHUZM3bMR+0TRlP/MFhYotrKkRPqeJw8SbNOYFXU71
         et2euDBzpAx4Ld1pFNXvjCGdyGB02RMqSpuad9qMblCDto8WyZFm2UB4sljofOTulyKM
         Af+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QmJK2z6YewxghveqGIb9UQBF6OMvTjY+OevUyUnH0xk=;
        b=pMJ1FAK5DBRICXUbRC/n3lwuJKExY1OdY1RbSycXDSh9ibeNKWIbClmGVxlGPK6sEJ
         N77fHs/Q08Nps/h9IbQBRT9hjS3YVsYvkE8BIcnUShAF+4sohaBQlYfMVx9GX4rAXUyD
         jKJeJ7iau6ashEnoj9fpd2qBbjohRHcxzq1LD2HvoYhCD3X6ih5do7oWUJS+Tgttj1jf
         FQ/evQ6B4V6mNCV4u+CM1636xVaJ4EetH5FIO8bevOsmFgnub74Ze86+hQwZrBB3M4yG
         mmClkn4sCBEZoGHZwHi9ncq9eBgFO/96iqqQrCu54uTUiyOIYRJ5HGS4NKiDi8tyzhgY
         zL9g==
X-Gm-Message-State: ANoB5pnZnUDND2k2lhnGoXOkEqYmHJUxCS42cwxmyuwZLOUW6H4raIY7
        HcTTOUeXy9q1Dsxt2lZM165bWA==
X-Google-Smtp-Source: AA0mqf6+8pKCS6vAuM96tHZdyW588YSQAUx4YXAwXL4i6TE107C0kcbMKvSqcJuUlIukNPTpWlrqVw==
X-Received: by 2002:a02:cd34:0:b0:363:c1cc:ce75 with SMTP id h20-20020a02cd34000000b00363c1ccce75mr3164137jaq.125.1668283646526;
        Sat, 12 Nov 2022 12:07:26 -0800 (PST)
Received: from presto.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id j28-20020a02cb1c000000b00363dee286edsm2036870jap.60.2022.11.12.12.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 12:07:25 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     andersson@kernel.org, konrad.dybcio@linaro.org, agross@kernel.org,
        elder@kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 3/5] net: ipa: introduce "qcom,gsi-loader" property
Date:   Sat, 12 Nov 2022 14:07:15 -0600
Message-Id: <20221112200717.1533622-4-elder@linaro.org>
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

Introduce a new way of specifying how the GSI firmware gets loaded
for IPA.  Currently, this is indicated by the presence or absence of
the Boolean "modem-init" Device Tree property.  The new property
must have a value--either "self" or "modem"--which indicates whether
the AP or modem is the GSI firmware loader, respectively.

For legacy systems, the new property will not exist, and the
"modem-init" property will be used.  For newer systems, the
"qcom,gsi-loader" property *must* exist, and must have one of the
two prescribed values.  It is an error to have both properties
defined, and it is an error for the new property to have an
unrecognized value.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_main.c | 44 ++++++++++++++++++++++++++++++++------
 1 file changed, 37 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index 9e43b79d233e9..214e524dce795 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -87,11 +87,13 @@
  * @IPA_LOADER_DEFER:		System not ready; try again later
  * @IPA_LOADER_SELF:		AP loads GSI firmware
  * @IPA_LOADER_MODEM:		Modem loads GSI firmware, signals when done
+ * @IPA_LOADER_INVALID:	GSI firmware loader specification is invalid
  */
 enum ipa_firmware_loader {
 	IPA_LOADER_DEFER,
 	IPA_LOADER_SELF,
 	IPA_LOADER_MODEM,
+	IPA_LOADER_INVALID,
 };
 
 /**
@@ -711,9 +713,37 @@ static void ipa_validate_build(void)
 
 static enum ipa_firmware_loader ipa_firmware_loader(struct device *dev)
 {
-	if (of_property_read_bool(dev->of_node, "modem-init"))
+	bool modem_init;
+	const char *str;
+	int ret;
+
+	/* Look up the old and new properties by name */
+	modem_init = of_property_read_bool(dev->of_node, "modem-init");
+	ret = of_property_read_string(dev->of_node, "qcom,gsi-loader", &str);
+
+	/* If the new property doesn't exist, it's legacy behavior */
+	if (ret == -EINVAL) {
+		if (modem_init)
+			return IPA_LOADER_MODEM;
+		goto out_self;
+	}
+
+	/* Any other error on the new property means it's poorly defined */
+	if (ret)
+		return IPA_LOADER_INVALID;
+
+	/* New property value exists; if old one does too, that's invalid */
+	if (modem_init)
+		return IPA_LOADER_INVALID;
+
+	/* Modem loads GSI firmware for "modem" */
+	if (!strcmp(str, "modem"))
 		return IPA_LOADER_MODEM;
 
+	/* Any value other than "self" is an error */
+	if (strcmp(str, "self"))
+		return IPA_LOADER_INVALID;
+out_self:
 	/* We need Trust Zone to load firmware; make sure it's available */
 	if (qcom_scm_is_available())
 		return IPA_LOADER_SELF;
@@ -773,6 +803,8 @@ static int ipa_probe(struct platform_device *pdev)
 	}
 
 	loader = ipa_firmware_loader(dev);
+	if (loader == IPA_LOADER_INVALID)
+		return -EINVAL;
 	if (loader == IPA_LOADER_DEFER)
 		return -EPROBE_DEFER;
 
@@ -834,20 +866,18 @@ static int ipa_probe(struct platform_device *pdev)
 
 	dev_info(dev, "IPA driver initialized");
 
-	/* If the modem is doing early initialization, it will trigger a
-	 * call to ipa_setup() when it has finished.  In that case we're
-	 * done here.
+	/* If the modem is loading GSI firmware, it will trigger a call to
+	 * ipa_setup() when it has finished.  In that case we're done here.
 	 */
 	if (loader == IPA_LOADER_MODEM)
 		goto done;
 
-	/* Otherwise we need to load the firmware and have Trust Zone validate
-	 * and install it.  If that succeeds we can proceed with setup.
-	 */
+	/* The AP is loading GSI firmware; do so now */
 	ret = ipa_firmware_load(dev);
 	if (ret)
 		goto err_deconfig;
 
+	/* GSI firmware is loaded; proceed to setup */
 	ret = ipa_setup(ipa);
 	if (ret)
 		goto err_deconfig;
-- 
2.34.1

