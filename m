Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74F4669F614
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Feb 2023 15:04:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbjBVOEE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Feb 2023 09:04:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231268AbjBVOED (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Feb 2023 09:04:03 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0ADF34F7C
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 06:03:49 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id 6so7431537wrb.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 06:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g5UJMcZWkv0Duw8v6BzxymiOTt/dWj5iraOc3PiPg+w=;
        b=CrArXo1e9kBrDozaImqVOs6XagCQmqDxyhZ0UG/P9YUyxojo5L7Q9op8Cre5bY3evD
         9zgVBqb60t1BECkEf+cWMuB2gxXv3iWWetdi0Q5SA6V2hqCNFdO3xKmjjdIW2OWoon9l
         KOVl/+JoOq02FTFXhwwE/ULn8JScIyhfOBsUNpH3MF8bEBPDs5AdOuZ3N37joRhXClfV
         CNE87vf5v+dQIfwbA7SWsU4wghpzR9Q9r7PHAhiKDH0ntLAMl3yee1Rl/vZShESQdHZu
         nXoCSGj1XjDoK7Q1LGgin0vaeTRRnaWhEBt5Y59j2Q4flB0pQPRaek3fJD0zH9QP6e7x
         QB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g5UJMcZWkv0Duw8v6BzxymiOTt/dWj5iraOc3PiPg+w=;
        b=z1kSO1q1343HCp1Dw5mmDx7d0PGQsjOErvT7D/Ue6bQSSGYc1d49d7rexlwGoyobL1
         t1NrNL5KgNw0rGms0YxJDFjU4bKSIT7VWNXZyrWe39gp9cqKQ5Tk2pPzmDFB/XxdO+iD
         kmefU90r6FWJKgPDOiCUIOL8StqwjuPWcy0SCcfSpkYZCTU+Xxe/VPsXb6O2xsTyUEkx
         7m1RiIY+rwy6AlYbBv1HoML2T9hvDhpSGMA9TADR1hiT7lU5PngvAbnfqm82SEhPpXR7
         smRwR3ZHzPcOF3xnmdF9htTfLmkc+mlprevRjX/yF1vADxnbfW/fIiFmLq/r5EAYO5Ps
         bHMg==
X-Gm-Message-State: AO0yUKW/xkxQeAdtacPAyyI/+cW4J1FoboVsBkmoVrcwRVyXmzrmEMOV
        s6YfDAN1qVZIaOPVHBFVetW84f7sWSFRVfFa
X-Google-Smtp-Source: AK7set/blT1rphmk6H2VLUJH4NhHkF6T5WNogs23YUXttsGptBpOTkdlvryr8YWMf71d7zV62TafbA==
X-Received: by 2002:a5d:684c:0:b0:2c6:3d2a:435b with SMTP id o12-20020a5d684c000000b002c63d2a435bmr7946597wrw.67.1677074628089;
        Wed, 22 Feb 2023 06:03:48 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id d1-20020a5d4f81000000b002c5526234d2sm6991346wru.8.2023.02.22.06.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 06:03:46 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH] soundwire: qcom: correct setting ignore bit on v1.5.1
Date:   Wed, 22 Feb 2023 15:03:43 +0100
Message-Id: <20230222140343.188691-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

According to the comment and to downstream sources, the
SWRM_CONTINUE_EXEC_ON_CMD_IGNORE in SWRM_CMD_FIFO_CFG_ADDR register
should be set for v1.5.1 and newer, so fix the >= operator.

Fixes: 542d3491cdd7 ("soundwire: qcom: set continue execution flag for ignored commands")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soundwire/qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index d5b73b7f98bf..29035cf15407 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -733,7 +733,7 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	}
 
 	/* Configure number of retries of a read/write cmd */
-	if (ctrl->version > 0x01050001) {
+	if (ctrl->version >= 0x01050001) {
 		/* Only for versions >= 1.5.1 */
 		ctrl->reg_write(ctrl, SWRM_CMD_FIFO_CFG_ADDR,
 				SWRM_RD_WR_CMD_RETRIES |
-- 
2.34.1

