Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70CA56F9905
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 May 2023 16:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231771AbjEGOsl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 7 May 2023 10:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbjEGOsi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 7 May 2023 10:48:38 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E569D18146
        for <linux-arm-msm@vger.kernel.org>; Sun,  7 May 2023 07:48:30 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-50bcb4a81ceso6539522a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 May 2023 07:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683470909; x=1686062909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iE134vQgSNzS2DPVaEM0R6ddInwhWIrVu0oDCzxV75I=;
        b=oc8MiStl06k/dS1OmX4XwZmneuPwM9xkdk/v/DWnQryg+EHWd9nQEPt6B9G4JPhpvd
         v3hxksfYChR46tSlPjY0BRKChVLa3V5JA6a6Pq/0DLrbCS0GnFGRTzjwi5VwKv11T/uY
         j6KdoCiXqvqVoG+PwZnYUi4I2Saq3o66vdVhPwnWeLosFgg3RFvEfAR4Xmu7ttS4+McD
         24ru3EKOORhzFOloHFhEgYpJyc3qS4BcC8P92PWv0+wIgYR9d0OPoWq84lbcUjgWwuOo
         wd5iiMBZuiSV8IqKuh5av12YrwWiv8/C80Jm5kuq8uWUuq4FJWlrBXMg4Vejo1hisjea
         iuug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683470909; x=1686062909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iE134vQgSNzS2DPVaEM0R6ddInwhWIrVu0oDCzxV75I=;
        b=Mk4Su3/lnCW8sPm+x52Zie+oQtZi4+8Vb0bUtgycF2+QgembBovxofxp78x6bfkhRT
         9Ajp/T+8qfJqmSdQIIjJnfZV548q20SMv9gm5HcoO6FrK7x0wVXb6ox3hz3Z0i05XVQJ
         4FwG1NPO7bN740k5Lq61z5wGII4Re95eN1PV6FFad70/APUrz+1CqjXylTIaTCPN+VRj
         XyjDzzqoxwk5toFr5sZvPuHTPXsE0EB3pTijJZFwztRLI2AYjTtxi6d+bXbe4jlN+f0t
         js3PrruqUV/ao2X6KZxXJhnpaF4N766KiT2AscKEWCe8EcdgMLnCkFc3O9FHi2yaryVI
         4oXw==
X-Gm-Message-State: AC+VfDzKDnchHuZY/SjjthEAoT6gc/SQ6voB6qTWFhEx8exGS94JIyec
        0HNwo+PSKoIO8I6bibPCLoTt7A==
X-Google-Smtp-Source: ACHHUZ5M1OGztQCDtLZh/GfKvH6ydIeXxG/nBJmYT6/rF+K1SzlcLOJA7bMvZU4TElE6N4xdoghrAg==
X-Received: by 2002:a17:907:724e:b0:961:8fcd:53c9 with SMTP id ds14-20020a170907724e00b009618fcd53c9mr6823568ejc.39.1683470909289;
        Sun, 07 May 2023 07:48:29 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:1757:b51a:9965:e81])
        by smtp.gmail.com with ESMTPSA id fh8-20020a1709073a8800b0095ef7268ba9sm3710023ejc.41.2023.05.07.07.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 07:48:28 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] remoteproc: qcom_q6v5_pas: staticize adsp_segment_dump()
Date:   Sun,  7 May 2023 16:48:26 +0200
Message-Id: <20230507144826.193067-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

adsp_segment_dump() is not used outside of this unit, so add missing
static to fix:

  drivers/remoteproc/qcom_q6v5_pas.c:108:6: warning: no previous prototype for ‘adsp_segment_dump’ [-Wmissing-prototypes]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index e34d82b18a67..f77d11c91a75 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -105,7 +105,7 @@ struct qcom_adsp {
 	struct qcom_scm_pas_metadata dtb_pas_metadata;
 };
 
-void adsp_segment_dump(struct rproc *rproc, struct rproc_dump_segment *segment,
+static void adsp_segment_dump(struct rproc *rproc, struct rproc_dump_segment *segment,
 		       void *dest, size_t offset, size_t size)
 {
 	struct qcom_adsp *adsp = rproc->priv;
-- 
2.34.1

