Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2669F5B14A4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 08:34:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbiIHGe4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 02:34:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230071AbiIHGez (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 02:34:55 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D86B3FA2D
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Sep 2022 23:34:54 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id n23-20020a7bc5d7000000b003a62f19b453so911873wmk.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Sep 2022 23:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=xh82u4mQI0vpD+SPbAbOTF4IJW7gl/lNmljBUcHdhrA=;
        b=xLNd7PAOu8tw22FWlOq7W1CbMzEwFQTlM/Y6iTUXUA1f0f+6q+p+EXeWc2ovc3pjJm
         krGpZ47MTG/bc3AfpbPK8Mo72JYFtgm190uLTM3hm0+miLzqQnnf1UAYe35IvfW2x3mM
         4+LeyZyjj/aM7ICocdv29ZJ+ngiWmEk0EFAvEFOWR7JXfZJkQIUC2Qt6E7M1Dw6PC0Jm
         ddGV9d/TYt2gevjRddtHflLilayIC4CWDGYLBIyOMM8z/9NfWdr2tXfYDo6Ujm93Al5l
         G3nztXGSD1GHDUObY9LJoqFL1B4zxfDMS/HI84U+yL21sVpW7/USDJg0aew5jqhRV/Vh
         1uYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=xh82u4mQI0vpD+SPbAbOTF4IJW7gl/lNmljBUcHdhrA=;
        b=xPqnChVB2hqC5hNTf7HYCCpOwoL/eY4N8NwD1U6a/nF85OWIIuSScXK7BGPXUs8tFo
         NlqdzZjU5ReGRws0M/MrtbNg9LAdLpK0rqnPdEL6Ew7cDaE5I0F6MSqIt1O+H/jCO5os
         yxwwVbqRbv/38VyD0I7jbNspLWBQ50LOwxPdhajN2Ig17XmLM6Ycc8vnFVp4OTF3/NUP
         4jiDJ6sZKEJbfmYG31rORyAD8P9T4h3kHiO8qBoajPQtNWshbjwSQSiKOXrMGWOu1PES
         6N85NDuMzZe4BYBCmmZsTXYs/dli3nvvi8dUZWIkTcwnj9dyN9nTqq9E7hW9nPQYLsH1
         7iDg==
X-Gm-Message-State: ACgBeo2LpvH/1kX4WAF/7no0oBb2t6mTOzVB0367dnNA3I+rx28Zuf0F
        S40/DvjuIf5TVqIhSDJvH7lTSw==
X-Google-Smtp-Source: AA6agR6IMmOXsPMzfpADNeN9ao+vWfmfFcp4o0e+Qsx7ABFiigv2viqQnbR6ecjvNDayeYCAzK3SIg==
X-Received: by 2002:a05:600c:310b:b0:3a6:8970:27fc with SMTP id g11-20020a05600c310b00b003a6897027fcmr1079891wmo.98.1662618892783;
        Wed, 07 Sep 2022 23:34:52 -0700 (PDT)
Received: from srini-hackbox.lan (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.gmail.com with ESMTPSA id m3-20020a05600c4f4300b003a2e92edeccsm1549598wmq.46.2022.09.07.23.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 23:34:52 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     broonie@kernel.org
Cc:     lgirdwood@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bgoswami@quicinc.com,
        perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 1/4] ASoC: qcom: common: use EXPORT_SYMBOL_GPL instead of EXPORT_SYMBOL
Date:   Thu,  8 Sep 2022 07:34:45 +0100
Message-Id: <20220908063448.27102-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220908063448.27102-1-srinivas.kandagatla@linaro.org>
References: <20220908063448.27102-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

qcom_snd_parse_of depends on ASoC EXPORT_SYMBOL_GPL functions,
so make qcom_snd_parse_of and EXPORT_SYMBOL_GPL.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index c407684ce1a2..e53ad84f8ff5 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -175,6 +175,6 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 	of_node_put(np);
 	return ret;
 }
-EXPORT_SYMBOL(qcom_snd_parse_of);
+EXPORT_SYMBOL_GPL(qcom_snd_parse_of);
 
 MODULE_LICENSE("GPL v2");
-- 
2.21.0

