Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA8E6E8FE0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 12:18:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234328AbjDTKSG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 06:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234469AbjDTKRm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 06:17:42 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ED6E4C31
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 03:16:29 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id u3so5028820ejj.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 03:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681985788; x=1684577788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VpQ/uiByxTl/QsWgu3jLMFo8/XrWsnc9Emr/ALFnhD8=;
        b=juzJCbCax+ZR55BV6ouJGNxhZQJBPU711okungZ3pQNmrEoyR931ePxvgdve2wtYmq
         Jo5yCuc760ZT0EihcZnOIQnIn3t5owUZbfZlJQvJ800CK8ZC8LgUFBpb7r64R9csuHyE
         47001kvZkfIJ65ZMSPl3gZ6yt9wUk3el6rMgTE9m+u3TbK3BPfozq/QsmkrWWGrwLR6i
         M4527XvDh3F7Xg2XNVSTDm4k3vyt478WcvpP7rVYUjZqTRacJ9b6O+lOW6x4AQDWIt7w
         /ufw/IvoZ3WEhYODyW4+IpRx+3EuZaHv4yPAUx2uQlg7SE+LNLdfiLgpGO05csGzezRR
         4a7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681985788; x=1684577788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VpQ/uiByxTl/QsWgu3jLMFo8/XrWsnc9Emr/ALFnhD8=;
        b=D7BhDjI+K4HAVY2QN+nQTJhadjqz1z6NbB8xkI0mwgxw4tCTnvVbkftON2uForl+UJ
         9ssadvK9ZqdLWPiOHs/gye0krH1huSerwhWUKOMVLwmeBPBNnHpUcuZDnHN/ePHOloys
         ag8KBxQPY1L98M+g+/bY6dVsEkZ7ve4jQfoIVSXzXFmmePN9ylFbkrKR+/ObZVZsRJmg
         umbD87k2Z4+1nQZGh3Ecy/awpbA2+BSTPDaUv5aNAAxiVFqpiVmXoI0o9IMEjj7sZO1J
         Z0fNhHwUOTnD9cWso7mpITz5qqQ4bjVfiDsOpInxK6k/nKCyVa5FJR0qb5xHu4WPGfSD
         77Lg==
X-Gm-Message-State: AAQBX9cKciw1aM6esnHO3fT276lD1DpZqmM+glnGS6lIoqf+lYXv4vy1
        Fkhvl5SjDMEnr3zrhi6OcIrkkg==
X-Google-Smtp-Source: AKy350aJoXHpvCCTWt/My96Kx7KquB21h2WQBonG6sOA+uTsE5mM4HqBnVFra41oLy4Ah/SCA9aJ4A==
X-Received: by 2002:a17:906:4f17:b0:933:3a22:8513 with SMTP id t23-20020a1709064f1700b009333a228513mr1129561eju.53.1681985787930;
        Thu, 20 Apr 2023 03:16:27 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:bcb8:77e6:8f45:4771])
        by smtp.gmail.com with ESMTPSA id l22-20020aa7c3d6000000b00506be898998sm588954edr.29.2023.04.20.03.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 03:16:27 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Patrick Lai <quic_plai@quicinc.com>
Subject: [PATCH 4/6] soundwire: qcom: drop unused struct qcom_swrm_ctrl members
Date:   Thu, 20 Apr 2023 12:16:15 +0200
Message-Id: <20230420101617.142225-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420101617.142225-1-krzysztof.kozlowski@linaro.org>
References: <20230420101617.142225-1-krzysztof.kozlowski@linaro.org>
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

Drop unused members from the driver state container: struct qcom_swrm_ctrl.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Patrick Lai <quic_plai@quicinc.com>
---
 drivers/soundwire/qcom.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index fae8640b142b..679990dc3cc4 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -187,12 +187,9 @@ struct qcom_swrm_ctrl {
 #endif
 	struct completion broadcast;
 	struct completion enumeration;
-	struct work_struct slave_work;
 	/* Port alloc/free lock */
 	struct mutex port_lock;
 	struct clk *hclk;
-	u8 wr_cmd_id;
-	u8 rd_cmd_id;
 	int irq;
 	unsigned int version;
 	int wake_irq;
-- 
2.34.1

