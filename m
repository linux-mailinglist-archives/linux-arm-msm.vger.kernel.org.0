Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33C3D52F381
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 20:58:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238570AbiETS57 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 14:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353107AbiETSzz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 14:55:55 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 869861E9
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 11:55:44 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id z20so1108442iof.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 11:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vSHRCF1zLoP2q/+UJGoTXeLZBLEijQ7Yq4ob+ptO93g=;
        b=use2A+KKg9Sv5uQTeKKXHg+JPg9IR+ucBAucOwKMSclHUiyx9Y12Qu4htGnlv5tHEa
         a9jlfDtihpR34uljS689Gc1MI+tqS9sF3Hz9qWVDExxcK/QpFn6YId7K7rD3Z7iTKwaj
         TeRUOunB00uXXogG+KG4fhd0P2eCKoJ3O/wZc4QJSbJAshSav3IfZhZGP/OILKSfZapw
         tq6t5lyMvDXjr6vLf2vByxjsCQTGqq1cOgFaEzGHUT/vf0nU8W9EqfrAWr7T4j0q1idQ
         UlpqD9TjWfKmE7dXSND98LoX1FIyOsPZomglOEmvXGA/1czV6308ek5qQHwsivkyOHHQ
         KPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vSHRCF1zLoP2q/+UJGoTXeLZBLEijQ7Yq4ob+ptO93g=;
        b=U+AhClWLzMYh6Af4mla3HXGMdbY7sJL4JIkWEwt0XLyMMuspNI3QLlU9jGan0T81/j
         9WfNMeC93Ng/QDmBcokYqJUpOenRWMeB1Gfsqx4xQOWXU90abeHyf3wruGyjMB08g3+3
         XnQQf5K6bjBaR/aeml9HUUkEDLWGf9u9dXxFkijPdQQhN+tz2WFigyGz5mrgLzOKwJWj
         lSObh0YF5sL8m/A2r7vAXEeofl+Ik5Jw9JyOLtuvsPJOQsNIeYXSBD1X3TGSQVyihFLK
         yQQy2jpsmV3fp4jaVxWt9ouqawVooFjQMDJ8yUyQvfV/hzfhwRBBDSjAKOIvndHFOQuI
         FOew==
X-Gm-Message-State: AOAM532BrndQvoes58OW6uYnb0hAUgIN2I+IfZcWJj6+2VHbc1i8o/K1
        39MY/hkzDp3bBCEYONN6MZgQNw==
X-Google-Smtp-Source: ABdhPJyryWagy5ATXvZy4DFcPeeA/wDNrlNcnw2qKZFlArLd1CpHNVhjH0Fdsc2y/AQRLsQHXvQ+pg==
X-Received: by 2002:a05:6638:1509:b0:32e:5c10:29ab with SMTP id b9-20020a056638150900b0032e5c1029abmr6157084jat.223.1653072943749;
        Fri, 20 May 2022 11:55:43 -0700 (PDT)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id a6-20020a056638058600b0032b3a7817acsm871958jar.112.2022.05.20.11.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 11:55:43 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, bjorn.andersson@linaro.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 5/8] net: ipa: get rid of ipa_cmd_info->direction
Date:   Fri, 20 May 2022 13:55:30 -0500
Message-Id: <20220520185533.877920-6-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220520185533.877920-1-elder@linaro.org>
References: <20220520185533.877920-1-elder@linaro.org>
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

The direction field of the ipa_cmd_info structure is set, but never
used.  It seems it might have been used for the DMA_SHARED_MEM
immediate command, but the DIRECTION flag is set based on the value
of the passed-in direction flag there.

Anyway, remove this unused field from the ipa_cmd_info structure.
This is done as a separate patch to make it very obvious that it's
not required.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/gsi_trans.c | 5 +----
 drivers/net/ipa/ipa_cmd.h   | 2 --
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/ipa/gsi_trans.c b/drivers/net/ipa/gsi_trans.c
index bf31ef3d56adc..cf8ee42373547 100644
--- a/drivers/net/ipa/gsi_trans.c
+++ b/drivers/net/ipa/gsi_trans.c
@@ -413,7 +413,6 @@ void gsi_trans_cmd_add(struct gsi_trans *trans, void *buf, u32 size,
 		       dma_addr_t addr, enum dma_data_direction direction,
 		       enum ipa_cmd_opcode opcode)
 {
-	struct ipa_cmd_info *info;
 	u32 which = trans->used++;
 	struct scatterlist *sg;
 
@@ -438,9 +437,7 @@ void gsi_trans_cmd_add(struct gsi_trans *trans, void *buf, u32 size,
 	sg_dma_address(sg) = addr;
 	sg_dma_len(sg) = size;
 
-	info = &trans->info[which];
-	info->opcode = opcode;
-	info->direction = direction;
+	trans->info[which].opcode = opcode;
 }
 
 /* Add a page transfer to a transaction.  It will fill the only TRE. */
diff --git a/drivers/net/ipa/ipa_cmd.h b/drivers/net/ipa/ipa_cmd.h
index 05ed7e42e1842..d4dbe2ce96dcd 100644
--- a/drivers/net/ipa/ipa_cmd.h
+++ b/drivers/net/ipa/ipa_cmd.h
@@ -50,11 +50,9 @@ enum ipa_cmd_opcode {
  * struct ipa_cmd_info - information needed for an IPA immediate command
  *
  * @opcode:	The command opcode.
- * @direction:	Direction of data transfer for DMA commands
  */
 struct ipa_cmd_info {
 	enum ipa_cmd_opcode opcode;
-	enum dma_data_direction direction;
 };
 
 /**
-- 
2.32.0

