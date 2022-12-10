Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84DA9648EEA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Dec 2022 14:41:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbiLJNl6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Dec 2022 08:41:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbiLJNl5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Dec 2022 08:41:57 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE7D61A225;
        Sat, 10 Dec 2022 05:41:55 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id b13so11319007lfo.3;
        Sat, 10 Dec 2022 05:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d3026CInMv/X9IxEb6fMACQvykdUgowadkbDhjvAPNI=;
        b=AC/12F4e1cV44IoFqSh9zdKOf2/BBEln4gHj7B6NwSJzQcvXTuAJfroJ+LQGpJIS/J
         8K+SQ2gQuWVGcdR0zhC3yk1iW9xqV51K6m+uj85W2L/5UBLl6MwgXAtvWSsZG7oMUPhX
         FCVFmt0xkmnp8LnJ9kdI2qLdIpb++d9o+1DAaQF/wjQfF8cQeTns3AdWDaJ9+wxY7nMO
         JmXqwSMkMCkX17GhIuI6goSjaT4MawVLcSzBoC5CQ7NM+tkYRIzuVFg5ULzAtFfF40VA
         22O11F5gNo2tPtrP/doLTj14Ii+MNtsuJiJByXcgLF0f5bMgRixencbsVZ/wS5XXTSFS
         gxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d3026CInMv/X9IxEb6fMACQvykdUgowadkbDhjvAPNI=;
        b=QN5onYszGNbmr/uteNQH0FTUGemHJMPcp17CHgQc6wov8ikJ6/snSKK/XRDJH54+rO
         Hgs2pPbbLl38ER58e4MkTY41I/ZIdVuVMz2ov/NfWWRdG3MxB7nhUgSDcdkUR2jCo9pT
         O5ujOz1rIkdEW4ehpIZacLxhmROd9KRs67jOzB+sHJA2x7ZzNO0tT4XUtsrP3O1JgaDr
         SNVQtgwQzLUoRF2O5vMamlCScocrZLuXbIADD+jBOftyvqqAG3XLRGa1qblGqsZpM4Qg
         8ng8JG/6ibqL9P20P1AQ4wf89upNdhJ/HUvl0taPGrunR7asUH5B7d8Nbp6Sd42+uFr8
         ftiA==
X-Gm-Message-State: ANoB5plucOvYnl8c2p5OkJo2eeLB3nhVubUvGAsEbbl9Cc1URIa7Pro8
        wcpt7Vbv7BKZml0jPA03xhKCX1tBA9+C3A==
X-Google-Smtp-Source: AA0mqf4NctNeNxDGL7qUQ7GKAvuXOEx6BXS+F4wrogi6D0sbZ6oiI2076fabDFTtI2NXxR9+b5XjBw==
X-Received: by 2002:ac2:5a4e:0:b0:4a4:68b8:c2ee with SMTP id r14-20020ac25a4e000000b004a468b8c2eemr2588530lfn.69.1670679713876;
        Sat, 10 Dec 2022 05:41:53 -0800 (PST)
Received: from localhost.localdomain ([176.106.35.163])
        by smtp.gmail.com with ESMTPSA id x27-20020a19e01b000000b0048b365176d9sm727982lfg.286.2022.12.10.05.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Dec 2022 05:41:53 -0800 (PST)
From:   Dominik Kobinski <dominikkobinski314@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     pevik@seznam.cz, agross@kernel.org, alexeymin@postmarketos.org,
        quic_bjorande@quicinc.com, bribbers@disroot.org,
        devicetree@vger.kernel.org, konrad.dybcio@linaro.org,
        petr.vorel@gmail.com,
        Dominik Kobinski <dominikkobinski314@gmail.com>
Subject: [PATCH] arm64: dts: bullhead: add memory hole region
Date:   Sat, 10 Dec 2022 14:40:59 +0100
Message-Id: <20221210134059.342423-1-dominikkobinski314@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add region for memory hole present on bullhead in order to
fix a reboot issue on recent kernels

Reported-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Dominik Kobinski <dominikkobinski314@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
index 71e373b11de9d8..3cf40d8cfdf6eb 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
@@ -2,6 +2,7 @@
 /* Copyright (c) 2015, LGE Inc. All rights reserved.
  * Copyright (c) 2016, The Linux Foundation. All rights reserved.
  * Copyright (c) 2021, Petr Vorel <petr.vorel@gmail.com>
+ * Copyright (c) 2022, Dominik Kobinski <dominikkobinski314@gmail.com>
  */
 
 /dts-v1/;
@@ -50,6 +51,11 @@
 			reg = <0 0x03400000 0 0x1200000>;
 			no-map;
 		};
+
+		removed_region: memory@5000000 {
+			reg = <0 0x05000000 0 0x2200000>;
+			no-map;
+		};
 	};
 };
