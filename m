Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A762671A0E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 12:09:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbjARLJu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 06:09:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230253AbjARLIy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 06:08:54 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D81C95768
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 02:15:50 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id f25-20020a1c6a19000000b003da221fbf48so1114967wmc.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 02:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=djuiJl7bx5DRHNGTITj28NZCN8UBHbOpoHymK5Xy668=;
        b=mZq+wCBjWMn4ys2DKQ0xXZVF8e3MLqZsuhe6LIZqmNvtZVqNdlnFOXwye+qFyKabNR
         0eNJ3k+q/L1cobWT0KiCY692QLHmm6GDt9Z0VLiBMFrljI1gGieMZjlQ2Q/HVagCCMlt
         lsa4GP/fwmnoRl14bppiNU4yXZpm7G+ohNT/iQfrW54D0N/zAiYv1lE7GtwM80lK93+u
         WuXszjFi6zHUt+QsLbBmef9gdJJthddTMAwawOeawoHBpXl4J/YfTuJWaHIFKNxFNSuG
         iZue6hpChPgsvVbaRxTB+uS/8JSOK+T4LJH3g3TgU2jb1KvdUHOhA5KDdYOTmheGfMLw
         QQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=djuiJl7bx5DRHNGTITj28NZCN8UBHbOpoHymK5Xy668=;
        b=ReNzm5BEe6ag0S2ZOMHpvfBT+ZHIqQMHf5qjVhQLZpyqtfCk/bjefdpBiDTZ5sNbxg
         B4YobJa4FiN/RTT/PWFXDNVMC4ASiUtoTGxVjow5Cl39RSk3XxVaqEo42/1yoeaDcePI
         P7vht2QoLCy47QXnlXr6QnGEVJfRKnxb4FwKzLkoZ3qzpc6uALjC3+thG7O7Ku3aQ/x+
         PlnnIRTWExe19L1CHDYilnRf84qwj0OOjM0qKJ8CkkVg9zfJ6AvzaNUqUm8oOhVMBnPK
         Qg+NQtih9RafwsF2wNiAcOtr+AR2vaFAHP1H0Q/PIBeWfPduw6zxSHqUbqUPPn5wATna
         OQvw==
X-Gm-Message-State: AFqh2krsm/PDsNvhgUNGeQcAOpfP41XAIi+OcKRQ/GjwF7EE/f4qLJTE
        jq/v7CZf00u5rs1xfaAaXX/mKg==
X-Google-Smtp-Source: AMrXdXuSuwUkqc5Qgfm+fecSkhvRSa+4v0bwmM8Aw/gpqS1HjI0hteb1WBpPIkYpvlfGlqcbh3aNVg==
X-Received: by 2002:a05:600c:1713:b0:3da:fd90:19dd with SMTP id c19-20020a05600c171300b003dafd9019ddmr6139660wmn.26.1674036948962;
        Wed, 18 Jan 2023 02:15:48 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id w10-20020a05600c474a00b003db00747fdesm1529838wmo.15.2023.01.18.02.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 02:15:48 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ASoC: qcom: sdm845: add remark about unneeded compatibles
Date:   Wed, 18 Jan 2023 11:15:42 +0100
Message-Id: <20230118101542.96705-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230118101542.96705-1-krzysztof.kozlowski@linaro.org>
References: <20230118101542.96705-1-krzysztof.kozlowski@linaro.org>
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

If all devices are the same or compatible, there is no single need to
keep growing of_device_id list with new entries.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Patches are independent and backwards compatible. DTS fixup will be sent
separately.
---
 sound/soc/qcom/sdm845.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index d8d35563af00..02612af714a8 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -588,6 +588,7 @@ static int sdm845_snd_platform_probe(struct platform_device *pdev)
 
 static const struct of_device_id sdm845_snd_device_id[]  = {
 	{ .compatible = "qcom,sdm845-sndcard" },
+	/* Do not grow the list for compatible devices */
 	{ .compatible = "qcom,db845c-sndcard" },
 	{ .compatible = "lenovo,yoga-c630-sndcard" },
 	{},
-- 
2.34.1

