Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB1A15AF228
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Sep 2022 19:16:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231873AbiIFROB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Sep 2022 13:14:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239556AbiIFRND (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Sep 2022 13:13:03 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9856C8E4FC
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Sep 2022 10:02:44 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id k6-20020a05600c1c8600b003a54ecc62f6so7830107wms.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 10:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=pUJmbtWvtPwGRy1+LOJw2XaXtrhOpybks4Z6SCIljf4=;
        b=QHiV59qFluFmc2X4aluSb3cI8UBx/AvQ+3qoFk4pdJSOca0Pf+UwsjydWWNNy+qaTk
         +XF/XyHjDNitJ72UxSrOXjTo4qMk0hNSt8ERShfBL0fcv0Q0KcpBHZNeLSL6vrooYy8Q
         zdjECuThHt+98Mw8rMCcJqVPKe2ZnbZbhsN6YnlF/tZmDWzc4ovdFeXN8FqMJAiCH1Xm
         wSAyIZsF+0XTlaqfl4CFtoeVvQOCQSh0tRvs9Fhg2E/fIoNQwk0WgKo47AyPqcpCrde1
         coiFBaYo2JpZRtLar7U3mrZXlOPGmQ5yLXBTvVWD5yTPFBCdI0aF44a/HdAJnfAtxunU
         hpdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=pUJmbtWvtPwGRy1+LOJw2XaXtrhOpybks4Z6SCIljf4=;
        b=wTaQJJwxLn1negfmdeJEfZdGNT9Lnd9zOVkb/k6wxpPQl5KNLHh2kpJb/sspjcT6Hk
         YBZvwjetFFBhOG94Ycvc4/2IPvoarLbqAA+Y9x3I2R+nULNgF5Zeg7uKF7wZG/CmMHXn
         4tf+Se0iEBhe9dOJpBC2Il53lVt9OBjeKzkz8t1bG7wAJz4uOG4hM7uem02XtHNco4FJ
         vf+4GYfU7MxQo2800zdaPsgL5t8OoRPJrEsLzV0pKRs5uEtqImviO+RfBMgfvjlOh2Vt
         CErmSJnRDki1mMFGBVZRi/9UNZh03v3WTu5hGUU5N6CIgSpfetCWL9g3od5WD50821N/
         JKYg==
X-Gm-Message-State: ACgBeo2iwBpXhk5SxHknxhxKxvRhsd1o+SdnsWxQAJrGqO2idvSNwCt4
        8DBV9nYYrIMSHW5mtdZyS173DQ==
X-Google-Smtp-Source: AA6agR60Q2Q355yXzSKnWe9Bc2WKpC+8ck642yuall8GTusB9e4f1IY3T+xuDCrcw6+igOiiVe0niw==
X-Received: by 2002:a05:600c:a4c:b0:39c:6517:1136 with SMTP id c12-20020a05600c0a4c00b0039c65171136mr14382172wmq.12.1662483736228;
        Tue, 06 Sep 2022 10:02:16 -0700 (PDT)
Received: from srini-hackbox.lan (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.gmail.com with ESMTPSA id x13-20020a1c7c0d000000b003a5ca627333sm21085967wmc.8.2022.09.06.10.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 10:02:15 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     broonie@kernel.org
Cc:     lgirdwood@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bgoswami@quicinc.com,
        perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 09/12] ASoC: codecs: tx-macro: add support for sm8450 and sc8280xp
Date:   Tue,  6 Sep 2022 18:01:09 +0100
Message-Id: <20220906170112.1984-10-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220906170112.1984-1-srinivas.kandagatla@linaro.org>
References: <20220906170112.1984-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible for sm8450 and sc8280xp.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-tx-macro.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 7f9370ed126f..ee15cf6b98bb 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -1994,6 +1994,8 @@ static const struct dev_pm_ops tx_macro_pm_ops = {
 static const struct of_device_id tx_macro_dt_match[] = {
 	{ .compatible = "qcom,sc7280-lpass-tx-macro" },
 	{ .compatible = "qcom,sm8250-lpass-tx-macro" },
+	{ .compatible = "qcom,sm8450-lpass-tx-macro" },
+	{ .compatible = "qcom,sc8280xp-lpass-tx-macro" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, tx_macro_dt_match);
-- 
2.21.0

