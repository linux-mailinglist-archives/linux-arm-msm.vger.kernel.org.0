Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31F1B7C882B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Oct 2023 16:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232248AbjJMO7p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Oct 2023 10:59:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232215AbjJMO7n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Oct 2023 10:59:43 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C744EC2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Oct 2023 07:59:41 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4060b623e64so14520355e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Oct 2023 07:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697209180; x=1697813980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6XixNF8rcGeT14/86b+PK/uBZUvKiNOeydeAMM5h+qM=;
        b=Lsi3e3LGJnfI/w5D3y8+oG85IYXqdA7QV5Yc662qKbFs6tbGpGMj51Ai+JNrvxYoLy
         Ur/bqy/Wlw2/B+8XkCOBACG51kwuOd25UfBThoJBjlupbgRFI2cmHdO/EJBbU0IFk3T0
         OY+T3zRP5IBFVYgBJVsXjxESVuLiNPoDn6EgC83950Ys5PiVAaO041DlaixhKYxlhq2Q
         LscH0K+3x4YeEU3uTZiTBYgSxCy09aREGkIGdqdGerxjpqK4l2ZZG82eyC3dMFFi0F5H
         a77MEftT56uQzn+fePmggD6ojY9B9bZPrhCofp9YSMus4mLgYr5I3ZQdt1zSHpbWu7kz
         TPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697209180; x=1697813980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6XixNF8rcGeT14/86b+PK/uBZUvKiNOeydeAMM5h+qM=;
        b=jCuczYPU38zziqAgYFwqsMVO6NKmm5/iMIqiug1rBviYTlP3mcdyQIjxFfhdys32uB
         /Wfae++lrkkDEjPFRW6wCaIGAGpet2E7z+7ckvIjlVZyKgOQZKmUdnAEXRMQLnFzwn2s
         2IsntPeXVZZm9DW2YuukuI49yVS+wDo0L8ujkjxYBR1jeOR7ygZMSEHO7irjOMvMjCDE
         kegLeYee2gdNOWecV9/P1IkCf6h+E5yuwneWJUTmkZutd+P5T1Dblpgx/kQoQMR9uHyc
         4dfIagvYPHznombLmOwPpJTv9U+RhNd8TdqwFOVRRoWSo3ZDJbjxNaMibwxQbIeVY9VK
         lkiA==
X-Gm-Message-State: AOJu0Yxq0+SxAx52zvlspvPdzvCR9P34PdmRzdppDGcF53qV8VbIIdp9
        nDDP9OD/WEc6HH799UT/QXgcyQ==
X-Google-Smtp-Source: AGHT+IEPQNQrI0nwaQkzVKmF+/qzLrm2eHCyV21p+KfzM81DrT5slU2YLvJSulhh31z+gRCVN4Fj7Q==
X-Received: by 2002:a05:600c:3c83:b0:403:aced:f7f4 with SMTP id bg3-20020a05600c3c8300b00403acedf7f4mr308030wmb.12.1697209180272;
        Fri, 13 Oct 2023 07:59:40 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id dh13-20020a0560000a8d00b00327cd5e5ac1sm6428267wrb.1.2023.10.13.07.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 07:59:39 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] pinctrl: qcom: lpass-lpi: split slew rate set to separate function
Date:   Fri, 13 Oct 2023 16:59:34 +0200
Message-Id: <20231013145935.220945-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231013145935.220945-1-krzysztof.kozlowski@linaro.org>
References: <20231013145935.220945-1-krzysztof.kozlowski@linaro.org>
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

Setting slew rate for each pin will grow with upcoming Qualcomm SoCs,
so split the code responsible for this into separate function for easier
readability and maintenance.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. None
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 53 +++++++++++++++---------
 1 file changed, 33 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 9651aed048cf..4fb808545f7f 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -186,6 +186,35 @@ static int lpi_config_get(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
+static int lpi_config_set_slew_rate(struct lpi_pinctrl *pctrl,
+				    const struct lpi_pingroup *g,
+				    unsigned int group, unsigned int slew)
+{
+	unsigned long sval;
+	int slew_offset;
+
+	if (slew > LPI_SLEW_RATE_MAX) {
+		dev_err(pctrl->dev, "invalid slew rate %u for pin: %d\n",
+			slew, group);
+		return -EINVAL;
+	}
+
+	slew_offset = g->slew_offset;
+	if (slew_offset == LPI_NO_SLEW)
+		return 0;
+
+	mutex_lock(&pctrl->lock);
+
+	sval = ioread32(pctrl->slew_base + LPI_SLEW_RATE_CTL_REG);
+	sval &= ~(LPI_SLEW_RATE_MASK << slew_offset);
+	sval |= slew << slew_offset;
+	iowrite32(sval, pctrl->slew_base + LPI_SLEW_RATE_CTL_REG);
+
+	mutex_unlock(&pctrl->lock);
+
+	return 0;
+}
+
 static int lpi_config_set(struct pinctrl_dev *pctldev, unsigned int group,
 			  unsigned long *configs, unsigned int nconfs)
 {
@@ -193,8 +222,7 @@ static int lpi_config_set(struct pinctrl_dev *pctldev, unsigned int group,
 	unsigned int param, arg, pullup = LPI_GPIO_BIAS_DISABLE, strength = 2;
 	bool value, output_enabled = false;
 	const struct lpi_pingroup *g;
-	unsigned long sval;
-	int i, slew_offset;
+	int i, ret;
 	u32 val;
 
 	g = &pctrl->data->groups[group];
@@ -226,24 +254,9 @@ static int lpi_config_set(struct pinctrl_dev *pctldev, unsigned int group,
 			strength = arg;
 			break;
 		case PIN_CONFIG_SLEW_RATE:
-			if (arg > LPI_SLEW_RATE_MAX) {
-				dev_err(pctldev->dev, "invalid slew rate %u for pin: %d\n",
-					arg, group);
-				return -EINVAL;
-			}
-
-			slew_offset = g->slew_offset;
-			if (slew_offset == LPI_NO_SLEW)
-				break;
-
-			mutex_lock(&pctrl->lock);
-
-			sval = ioread32(pctrl->slew_base + LPI_SLEW_RATE_CTL_REG);
-			sval &= ~(LPI_SLEW_RATE_MASK << slew_offset);
-			sval |= arg << slew_offset;
-			iowrite32(sval, pctrl->slew_base + LPI_SLEW_RATE_CTL_REG);
-
-			mutex_unlock(&pctrl->lock);
+			ret = lpi_config_set_slew_rate(pctrl, g, group, arg);
+			if (ret)
+				return ret;
 			break;
 		default:
 			return -EINVAL;
-- 
2.34.1

