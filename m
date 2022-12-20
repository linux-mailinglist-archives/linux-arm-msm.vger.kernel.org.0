Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98121651911
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Dec 2022 03:47:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232937AbiLTCrf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Dec 2022 21:47:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232938AbiLTCrc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Dec 2022 21:47:32 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C89E13D1E
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 18:47:31 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id cf42so16618734lfb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 18:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/H0yxXW6RgWftpBKitAql7qSanuSsAwSOD+LFdUdSn4=;
        b=kPiQarbHb4eqCHh2OXuhbnVw/IeVDMkAL96eW5Hi4nAxR54yZ4EO/mCYJeqtl13d1v
         Ud/0Ry7u7v+XMzshEt7d0tJO5f9bdb/BYGno8h0Jdi0s1TLrgcyRYvxnH1kKsrlEcWoe
         v+426eZrMKz6Hl1poOIRlaPVwy6NrPEWY/M02zS83y/W8qh+9K5BXhU18STSnwWalvTG
         7opGrgI8OWexpiuM7r0UGjqx/wXKGRVb5VoHVVV13dxMMk0NUq7l/zBy3lKUnaN2tnJc
         UW9UvSi+FZeqEZ3kh2IbAMTB9SPZExlTuTmYg9vTXFb07Y6Oqcht2xBpQHSdVyauwWYS
         NSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/H0yxXW6RgWftpBKitAql7qSanuSsAwSOD+LFdUdSn4=;
        b=xRegb97fLM6csCgw7rBKBQehrIhotJjQYBLHqHa6ElDG3rJm0UIf4z+DKnU8aLotEx
         YixjH1lree6ol7fhEyCk+0aarsi08c9/f3z0gPGNBzI9OQpbLj/o3+1po02hj7GqCatE
         fW5yrlFJnsSk6Zgi1eZR64TJLuTMRoPHUV2+8s83mhXq6CSNW/rVO9KRjzW8VSli0fSX
         4qenlPJnh49V8RcqL7/nwR8FrNp6tASlkgNPaq1pVg7uglc6JzOeqrmf6teTtIIT1jUu
         WhiIPiNov1n/X1SUrXa34+D0jLDnphUMWF3hFgFrWaGkcD5W5Mgy3Hr89pZzLd38S9rV
         UG3A==
X-Gm-Message-State: ANoB5pmAC0zR23ogVgiDJW9Nfndt3XPhz8AJoAdO4juZD9g6+mFTvYn1
        EvYj70HiCg/zDQ6rOSheKY8urg==
X-Google-Smtp-Source: AA0mqf57rxjLZQXdPVve9ewPZEfnYw31odsKlljBKIjbxbr3HMzr8zLnAtn4bThLAORVc6iwxyjLCA==
X-Received: by 2002:ac2:52a6:0:b0:4b5:5caf:9d62 with SMTP id r6-20020ac252a6000000b004b55caf9d62mr10817966lfm.61.1671504450676;
        Mon, 19 Dec 2022 18:47:30 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id e13-20020a05651236cd00b004b5a85e369asm1274866lfs.252.2022.12.19.18.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 18:47:30 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 09/15] thermal/drivers/tsens: Drop single-cell code for mdm9607
Date:   Tue, 20 Dec 2022 04:47:15 +0200
Message-Id: <20221220024721.947147-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221220024721.947147-1-dmitry.baryshkov@linaro.org>
References: <20221220024721.947147-1-dmitry.baryshkov@linaro.org>
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

There is no dtsi file for mdm9607 in the kernel sources. Drop the
compatibility with unofficial dtsi and remove support for handling the
single-cell calibration data on mdm9607.

Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/thermal/qcom/tsens-v0_1.c | 95 +------------------------------
 1 file changed, 1 insertion(+), 94 deletions(-)

diff --git a/drivers/thermal/qcom/tsens-v0_1.c b/drivers/thermal/qcom/tsens-v0_1.c
index 8f1ea7075354..caffcf9905b9 100644
--- a/drivers/thermal/qcom/tsens-v0_1.c
+++ b/drivers/thermal/qcom/tsens-v0_1.c
@@ -133,39 +133,6 @@
 
 #define BIT_APPEND		0x3
 
-/* eeprom layout data for mdm9607 */
-#define MDM9607_BASE0_MASK	0x000000ff
-#define MDM9607_BASE1_MASK	0x000ff000
-#define MDM9607_BASE0_SHIFT	0
-#define MDM9607_BASE1_SHIFT	12
-
-#define MDM9607_S0_P1_MASK	0x00003f00
-#define MDM9607_S1_P1_MASK	0x03f00000
-#define MDM9607_S2_P1_MASK	0x0000003f
-#define MDM9607_S3_P1_MASK	0x0003f000
-#define MDM9607_S4_P1_MASK	0x0000003f
-
-#define MDM9607_S0_P2_MASK	0x000fc000
-#define MDM9607_S1_P2_MASK	0xfc000000
-#define MDM9607_S2_P2_MASK	0x00000fc0
-#define MDM9607_S3_P2_MASK	0x00fc0000
-#define MDM9607_S4_P2_MASK	0x00000fc0
-
-#define MDM9607_S0_P1_SHIFT	8
-#define MDM9607_S1_P1_SHIFT	20
-#define MDM9607_S2_P1_SHIFT	0
-#define MDM9607_S3_P1_SHIFT	12
-#define MDM9607_S4_P1_SHIFT	0
-
-#define MDM9607_S0_P2_SHIFT	14
-#define MDM9607_S1_P2_SHIFT	26
-#define MDM9607_S2_P2_SHIFT	6
-#define MDM9607_S3_P2_SHIFT	18
-#define MDM9607_S4_P2_SHIFT	6
-
-#define MDM9607_CAL_SEL_MASK	0x00700000
-#define MDM9607_CAL_SEL_SHIFT	20
-
 static int calibrate_8916(struct tsens_priv *priv)
 {
 	int base0 = 0, base1 = 0, i;
@@ -363,60 +330,6 @@ static int calibrate_8974(struct tsens_priv *priv)
 	return 0;
 }
 
-static int calibrate_9607(struct tsens_priv *priv)
-{
-	int base, i;
-	u32 p1[5], p2[5];
-	int mode = 0;
-	u32 *qfprom_cdata;
-	int ret;
-
-	ret = tsens_calibrate_common(priv);
-	if (!ret)
-		return 0;
-
-	qfprom_cdata = (u32 *)qfprom_read(priv->dev, "calib");
-	if (IS_ERR(qfprom_cdata))
-		return PTR_ERR(qfprom_cdata);
-
-	mode = (qfprom_cdata[2] & MDM9607_CAL_SEL_MASK) >> MDM9607_CAL_SEL_SHIFT;
-	dev_dbg(priv->dev, "calibration mode is %d\n", mode);
-
-	switch (mode) {
-	case TWO_PT_CALIB:
-		base = (qfprom_cdata[2] & MDM9607_BASE1_MASK) >> MDM9607_BASE1_SHIFT;
-		p2[0] = (qfprom_cdata[0] & MDM9607_S0_P2_MASK) >> MDM9607_S0_P2_SHIFT;
-		p2[1] = (qfprom_cdata[0] & MDM9607_S1_P2_MASK) >> MDM9607_S1_P2_SHIFT;
-		p2[2] = (qfprom_cdata[1] & MDM9607_S2_P2_MASK) >> MDM9607_S2_P2_SHIFT;
-		p2[3] = (qfprom_cdata[1] & MDM9607_S3_P2_MASK) >> MDM9607_S3_P2_SHIFT;
-		p2[4] = (qfprom_cdata[2] & MDM9607_S4_P2_MASK) >> MDM9607_S4_P2_SHIFT;
-		for (i = 0; i < priv->num_sensors; i++)
-			p2[i] = ((base + p2[i]) << 2);
-		fallthrough;
-	case ONE_PT_CALIB2:
-		base = (qfprom_cdata[0] & MDM9607_BASE0_MASK);
-		p1[0] = (qfprom_cdata[0] & MDM9607_S0_P1_MASK) >> MDM9607_S0_P1_SHIFT;
-		p1[1] = (qfprom_cdata[0] & MDM9607_S1_P1_MASK) >> MDM9607_S1_P1_SHIFT;
-		p1[2] = (qfprom_cdata[1] & MDM9607_S2_P1_MASK) >> MDM9607_S2_P1_SHIFT;
-		p1[3] = (qfprom_cdata[1] & MDM9607_S3_P1_MASK) >> MDM9607_S3_P1_SHIFT;
-		p1[4] = (qfprom_cdata[2] & MDM9607_S4_P1_MASK) >> MDM9607_S4_P1_SHIFT;
-		for (i = 0; i < priv->num_sensors; i++)
-			p1[i] = ((base + p1[i]) << 2);
-		break;
-	default:
-		for (i = 0; i < priv->num_sensors; i++) {
-			p1[i] = 500;
-			p2[i] = 780;
-		}
-		break;
-	}
-
-	compute_intercept_slope(priv, p1, p2, mode);
-	kfree(qfprom_cdata);
-
-	return 0;
-}
-
 /* v0.1: 8916, 8939, 8974, 9607 */
 
 static struct tsens_features tsens_v0_1_feat = {
@@ -509,15 +422,9 @@ struct tsens_plat_data data_8974 = {
 	.fields	= tsens_v0_1_regfields,
 };
 
-static const struct tsens_ops ops_9607 = {
-	.init		= init_common,
-	.calibrate	= calibrate_9607,
-	.get_temp	= get_temp_common,
-};
-
 struct tsens_plat_data data_9607 = {
 	.num_sensors	= 5,
-	.ops		= &ops_9607,
+	.ops		= &ops_v0_1,
 	.feat		= &tsens_v0_1_feat,
 	.fields	= tsens_v0_1_regfields,
 };
-- 
2.35.1

