Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AD9262B405
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 08:33:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233014AbiKPHdy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 02:33:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232912AbiKPHdc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 02:33:32 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AE20CE3A
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 23:33:10 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id ja4-20020a05600c556400b003cf6e77f89cso2534016wmb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 23:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umpLk1dbP5jy5ZPV4Q21UM7cr1nZKFjsXDStFsdzpxA=;
        b=bUEFiyV6kZIbszj2+ZIoMR3VTFJn6PlTsF7tRLl0wEQxGtgtif3Y2dDkmsoG1FumFw
         JMIFFU92pNjKKcVCF2rJaWSO54zy4tt6BjgnERylWwYu0aBDo1wwX4NKhablIM1r0WRD
         QneZc8D4GylnFjzHyC0m9IC/xwKZ8K1zBTIyqJdVRzxFP5/X9mHOutth5ynK/jY88dvD
         4U+KCK/qE5wFDEEn4FAz7jESpw707XHSacO0QWhyCFHVeWGuVky0qV14WG1NWghbIBi5
         0B33Z2c1FpTHhd1h8qTaAQ4aLw1raMYtHH0+VuF4l8x0SCi09v8Yi/rnW07WBAs7Kg8o
         4eaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=umpLk1dbP5jy5ZPV4Q21UM7cr1nZKFjsXDStFsdzpxA=;
        b=0gT8PWga+w6w7bIkLTzwVmHV4D3TysFBI52uTgKxebZcgF0+5Y6hn4bRfWwCozj6Ew
         mJ3YJPjcJL9uAkknNRlgdmFn3/af/kTuYbrf8GipGK4/eFciocQBWRS22uGmKtSvUrT8
         O5bJKZftFBEivrdC0mxYdtEdn6c32TKjMne6xgrlAxUiiZ5b/i+BUrwQviKXaQCJWrn9
         vJ3bcAfF3ZzWeJlCKyO8nmEG3A4kSgjWU0wJEokZFMtBnIrddUKY1EoFCSVuaFZNkntQ
         Inm9KMX1xK1ZbzpjkniBc6uCQ0PgQQe89ZoiDazcy92ZsIF656xnwNkbkGJrBK3+KAMf
         I/Dw==
X-Gm-Message-State: ANoB5pkzKYF60C3nPkX5xASz1Ij6EgMdM5QDQuxEzu83cVgf2pn1Jf9H
        cLoySd3RsQavHhQvKm42p0ydFw==
X-Google-Smtp-Source: AA0mqf6IF32dqwD+h34rZGFcpHBXR0x2Q6uB7IJvbcW/F7hh0WTEMrqady8f2Nmk/V07Y7wtvY7O5Q==
X-Received: by 2002:a7b:c00a:0:b0:3cf:e8f0:ad11 with SMTP id c10-20020a7bc00a000000b003cfe8f0ad11mr1215370wmb.65.1668583988521;
        Tue, 15 Nov 2022 23:33:08 -0800 (PST)
Received: from zoltan.localdomain ([167.98.215.174])
        by smtp.gmail.com with ESMTPSA id g34-20020a05600c4ca200b003cfd4e6400csm1058823wmp.19.2022.11.15.23.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 23:33:07 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     andersson@kernel.org, konrad.dybcio@linaro.org, agross@kernel.org,
        elder@kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 5/5] net: ipa: permit GSI firmware loading to be skipped
Date:   Wed, 16 Nov 2022 01:32:56 -0600
Message-Id: <20221116073257.34010-6-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221116073257.34010-1-elder@linaro.org>
References: <20221116073257.34010-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Define a new value "skip" for the "qcom,gsi-loader" Device Tree
property.  If used, it indicates that neither the AP nor the modem
need to load GSI firmware (because it has already been loaded--for
example by the boot loader).

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_main.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index 214e524dce795..8f20825675a1a 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -87,12 +87,14 @@
  * @IPA_LOADER_DEFER:		System not ready; try again later
  * @IPA_LOADER_SELF:		AP loads GSI firmware
  * @IPA_LOADER_MODEM:		Modem loads GSI firmware, signals when done
+ * @IPA_LOADER_SKIP:		Neither AP nor modem need to load GSI firmware
  * @IPA_LOADER_INVALID:	GSI firmware loader specification is invalid
  */
 enum ipa_firmware_loader {
 	IPA_LOADER_DEFER,
 	IPA_LOADER_SELF,
 	IPA_LOADER_MODEM,
+	IPA_LOADER_SKIP,
 	IPA_LOADER_INVALID,
 };
 
@@ -740,6 +742,10 @@ static enum ipa_firmware_loader ipa_firmware_loader(struct device *dev)
 	if (!strcmp(str, "modem"))
 		return IPA_LOADER_MODEM;
 
+	/* No GSI firmware load is needed for "skip" */
+	if (!strcmp(str, "skip"))
+		return IPA_LOADER_SKIP;
+
 	/* Any value other than "self" is an error */
 	if (strcmp(str, "self"))
 		return IPA_LOADER_INVALID;
@@ -872,10 +878,12 @@ static int ipa_probe(struct platform_device *pdev)
 	if (loader == IPA_LOADER_MODEM)
 		goto done;
 
-	/* The AP is loading GSI firmware; do so now */
-	ret = ipa_firmware_load(dev);
-	if (ret)
-		goto err_deconfig;
+	if (loader == IPA_LOADER_SELF) {
+		/* The AP is loading GSI firmware; do so now */
+		ret = ipa_firmware_load(dev);
+		if (ret)
+			goto err_deconfig;
+	} /* Otherwise loader == IPA_LOADER_SKIP */
 
 	/* GSI firmware is loaded; proceed to setup */
 	ret = ipa_setup(ipa);
-- 
2.34.1

