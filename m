Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 515475E6FA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Sep 2022 00:21:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231474AbiIVWVX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 18:21:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbiIVWVN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 18:21:13 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2843910CA42
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 15:21:12 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id j7so4882880ilu.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 15:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=yoUX0GhCusB6CNDn4OYWjlHzOJOv1pFoq/cJVsEvPYM=;
        b=I54/mvygyIGdqu6c4LWKn1jWV8BxXPuVkcj0rY4vEe9Qm8Uh2RY1xqOe1H/x04ah6A
         7zEk6rsprt3x6AjcbQ+4ttgho0IwacwbF8ttSZrq3jxINCXcWCIzO9zLRtgsMI37adpd
         9oz15a66qblhpQBP/Eq8X60/cjx+oWyn/HlHsrHi/qfZqNvCjSZ5SVMCP/rtzbN2j418
         ri6wAmyDv/4BjTfHr92GUMN6gBHD+GC7rWq/VcPaGNkxWgQTpgMfrw/ZV2QuC4N2xKfy
         nNQ2eRq7RmIlC9Tu3a0U0mf9YuzFjgkjVhTF2HahNQZsHeEwtY8zGREoASodn1/BkHbL
         Wf0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=yoUX0GhCusB6CNDn4OYWjlHzOJOv1pFoq/cJVsEvPYM=;
        b=afTdaEctwq+do7wCZnjY2y3iBPaq7hBAF04pu+up/fxITkSJvjBGNTMRDy79Vksr4A
         RqM1mM4oFkWPEx0rKWeXdEfSoU6PF8iZVVN7Hs7n7Ui/JSX9ZfF45ywjdn4/UEXrXT0U
         +RxuIGOaQ6ASXUkfYuC7wQzIKJ7P3nuVKe4WLbmLw8U8cYFDi/FZwgQ6NjJap6fBQ9kV
         /EtA2OO383Gr0wJM5XuSjdsiCjzulZKa99oCPPBm4+L6gp3c7Xelw7eV4eIclOo7qg19
         TeRK4W2jvVFohJD/FfxeDO1QhXNhvmnAQqnbOd8kDbyxUMdOxbfzeniJNHRtnM/qOB0v
         NS7Q==
X-Gm-Message-State: ACrzQf1Hgo/uwBmyR2sqW50OG+9YVVNAuM5xvMjISqebQVVYtKig9hmu
        47p+mS+enHe7pbmqtxuVpLeA6g==
X-Google-Smtp-Source: AMsMyM6ZT6nXW8d75G+vfBKw4P5MlCoHEVtM6ZW3CBaJwFZKFsiju3RuTVkwsb2SX1590aMH1kA7lA==
X-Received: by 2002:a05:6e02:1909:b0:2f6:acd5:7e9b with SMTP id w9-20020a056e02190900b002f6acd57e9bmr2257844ilu.190.1663885270890;
        Thu, 22 Sep 2022 15:21:10 -0700 (PDT)
Received: from localhost.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id g12-20020a92d7cc000000b002f592936fbfsm2483332ilq.41.2022.09.22.15.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 15:21:10 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, andersson@kernel.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 6/8] net: ipa: encapsulate setting the FILT_ROUT_HASH_EN register
Date:   Thu, 22 Sep 2022 17:20:58 -0500
Message-Id: <20220922222100.2543621-7-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922222100.2543621-1-elder@linaro.org>
References: <20220922222100.2543621-1-elder@linaro.org>
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

Create a new function that encapsulates setting the register flag
that disables filter and routing table hashing for IPA v4.2.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_main.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index 9dfa7f58a207f..cca270d2d9a68 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -306,6 +306,18 @@ static void ipa_qtime_config(struct ipa *ipa)
 	iowrite32(val, ipa->reg_virt + IPA_REG_TIMERS_XO_CLK_DIV_CFG_OFFSET);
 }
 
+static void ipa_hardware_config_hashing(struct ipa *ipa)
+{
+	u32 offset;
+
+	if (ipa->version != IPA_VERSION_4_2)
+		return;
+
+	/* IPA v4.2 does not support hashed tables, so disable them */
+	offset = ipa_reg_filt_rout_hash_en_offset(IPA_VERSION_4_2);
+	iowrite32(0, ipa->reg_virt + offset);
+}
+
 static void ipa_idle_indication_cfg(struct ipa *ipa,
 				    u32 enter_idle_debounce_thresh,
 				    bool const_non_idle_enable)
@@ -390,14 +402,7 @@ static void ipa_hardware_config(struct ipa *ipa, const struct ipa_data *data)
 		ipa_qtime_config(ipa);
 	}
 
-	/* IPA v4.2 does not support hashed tables, so disable them */
-	if (version == IPA_VERSION_4_2) {
-		u32 offset = ipa_reg_filt_rout_hash_en_offset(version);
-
-		iowrite32(0, ipa->reg_virt + offset);
-	}
-
-	/* Enable dynamic clock division */
+	ipa_hardware_config_hashing(ipa);
 	ipa_hardware_dcd_config(ipa);
 }
 
-- 
2.34.1

