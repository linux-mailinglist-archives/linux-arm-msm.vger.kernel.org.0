Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77ED5645018
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 01:15:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbiLGAPI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 19:15:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbiLGAPH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 19:15:07 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 747A04AF11
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 16:15:06 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id q7so19082628ljp.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 16:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0EduR0xpzdlfEb/KiEf2wXv/qnABxojAe9ELTL5B40=;
        b=osefMl4ALcsRfGOKfcfwyUM+wLLmj7CSDvNH/83WZeycxgwo5cN22/qo+yyZc/2gLS
         XqxxLoKjGoTmWVakR96MspRwpWuM8Ja5KUUULYtVZsOG6rjSdJZEstN9K5sNYmp3OCPc
         cRQ5xUMdlm0wJNpr059A+9ap0bSiqYTySFNELGwF9VZbfusbP2DDfrnJA+6uDQ/xitba
         0rOjK9V4OaXPaFdrks+nAYtyblOVdSFNHIUoumQx5fLphJSx6KVq61eAvoWzLnTCK79o
         VEQoBPS8KDyb4UskUMsHOfDO4EV/xqUf5UZINf1isxgheUPoQ2yNf6XvrOCjVrGHPMxm
         Y6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b0EduR0xpzdlfEb/KiEf2wXv/qnABxojAe9ELTL5B40=;
        b=5pqGZSBkAZ1cHlfxlhaI/Ui02/iGpJ6agfuLj8xktZgQOrUfKNVfMiWaaVDJpdqo0i
         QOrWTH8VRryb61OqbhEbyyUej8vuLQ4OsRJ+EQzgJbd27ks4G6WCe8aaJLvoP7lLUo0E
         Rz32RjQaQ0xLVpH5lF61/S1PYvIZTmrmvQu9OfYBmq836xhvybr7e/m2Og+SqPhm5+Ka
         OMqv5kZEI28lgBf57XapkPuqVrOum57WyubJ4m3/ASYHGgymcC1BVnvSprLb8/c+Ky6L
         7ebMBCoyiYbmFxMPIU+1PqRJhaxcpzKw7myr0L9P2iiWlj6RMEMDkTprynjD64J2vhb1
         JDTg==
X-Gm-Message-State: ANoB5pnAJzEBQW2S3T2TxsROnAu4C+UZyQr8067VeTEC0DxzaeTNhlpH
        HhkB1KYtq6aLnrGaV3NLCGiy3Mcoqp+wwW29+c15SRpV
X-Google-Smtp-Source: AA0mqf4+4hOiD6FmO8fdMuw6LlbrwVoLmkgNkuzZ9UUjfb6rAk1VF0ChRZY+tL4RBk+nsqOQxrVcbg==
X-Received: by 2002:a05:651c:2388:b0:279:d60:ee7f with SMTP id bk8-20020a05651c238800b002790d60ee7fmr30013099ljb.404.1670372104846;
        Tue, 06 Dec 2022 16:15:04 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id 16-20020ac25f50000000b004b53eb60e3csm2308555lfz.256.2022.12.06.16.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 16:15:04 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 01/18] clk: qcom: smd-rpm: remove duplication between MMXI and MMAXI defines
Date:   Wed,  7 Dec 2022 02:14:46 +0200
Message-Id: <20221207001503.93790-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
References: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The commit 644c42295592 ("clk: qcom: smd: Add SM6375 clocks") added a
duplicate of the existing define QCOM_SMD_RPM_MMAXI_CLK, drop it now.

Fixes: 644c42295592 ("clk: qcom: smd: Add SM6375 clocks")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c   | 4 ++--
 include/linux/soc/qcom/smd-rpm.h | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index fea505876855..4947d5eab591 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -1120,8 +1120,8 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6115 = {
 };
 
 /* SM6375 */
-DEFINE_CLK_SMD_RPM(sm6375, mmnrt_clk, mmnrt_a_clk, QCOM_SMD_RPM_MMXI_CLK, 0);
-DEFINE_CLK_SMD_RPM(sm6375, mmrt_clk, mmrt_a_clk, QCOM_SMD_RPM_MMXI_CLK, 1);
+DEFINE_CLK_SMD_RPM(sm6375, mmnrt_clk, mmnrt_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 0);
+DEFINE_CLK_SMD_RPM(sm6375, mmrt_clk, mmrt_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 1);
 DEFINE_CLK_SMD_RPM(qcm2290, hwkm_clk, hwkm_a_clk, QCOM_SMD_RPM_HWKM_CLK, 0);
 DEFINE_CLK_SMD_RPM(qcm2290, pka_clk, pka_a_clk, QCOM_SMD_RPM_PKA_CLK, 0);
 DEFINE_CLK_SMD_RPM_BRANCH(sm6375, bimc_freq_log, bimc_freq_log_a, QCOM_SMD_RPM_MISC_CLK, 4, 1);
diff --git a/include/linux/soc/qcom/smd-rpm.h b/include/linux/soc/qcom/smd-rpm.h
index 3ab8c07f71c0..82c9d489833a 100644
--- a/include/linux/soc/qcom/smd-rpm.h
+++ b/include/linux/soc/qcom/smd-rpm.h
@@ -41,7 +41,6 @@ struct qcom_smd_rpm;
 #define QCOM_SMD_RPM_HWKM_CLK	0x6d6b7768
 #define QCOM_SMD_RPM_PKA_CLK	0x616b70
 #define QCOM_SMD_RPM_MCFG_CLK	0x6766636d
-#define QCOM_SMD_RPM_MMXI_CLK	0x69786d6d
 
 int qcom_rpm_smd_write(struct qcom_smd_rpm *rpm,
 		       int state,
-- 
2.35.1

