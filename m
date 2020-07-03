Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D6ED2136AA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2020 10:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbgGCIoh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jul 2020 04:44:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbgGCIoh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jul 2020 04:44:37 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 082AAC08C5DD
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2020 01:44:37 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id s10so31758560wrw.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2020 01:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=heZQEJKtev2CQI/n8g2TDagbZY/W2wQcpaekNIFJuUs=;
        b=oXKO0um9JGJucUuqoRrg1eckGzmk9EiJkX406TycN89Cj+gQhG6pZ9pP008sY7A8t1
         v/qojMVeotxZeuYJEQFstqjC/OvSmt407kNmr/da5QgTyD3rwmTmrd8FADbEhoe+/UOY
         dNHBuUKODs3pLDUGY4Vp48ZfVPLPkQVSEGj6IGPlHb5kP8hVqA2fNh+jP/YqMHejb3XL
         bbzwrD9gO9OA7BEIB3xVQbzFNRZKurenj8rcroOt8WqBQQQ9/X4C0mkygLptNJDpbEf8
         A+MQ4EfNe/kiwYm53RMxJwc7C0+gsPJpuZkU7xTVvp1L9qneb/DYktjEsEG6sAMlijzN
         Y9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=heZQEJKtev2CQI/n8g2TDagbZY/W2wQcpaekNIFJuUs=;
        b=VRy/pTCphRNSBubbKWQDjD5huJgGxtpLX8QFMp5u6C5L3qxXpyPkNzyrJ0OAzuSULC
         yNcvfPQG1w6B4fKq08HIG9nk3DMYLP8rQkO93jp2tdIN0JMRlNDmGtCNqm5lurzleWQS
         I6nK/wqIZOk9E7Y/tHBILS3/bQx5U34OwEe801jf54IcZlUQ3ylf7fANO2CKB9iWqYag
         dNM0sJPGRv3s6VaFwhFS25e38Fb/PgXUdwDn/Ka08Zi00thxg8EPYjzlD/Gn+QXAvJW7
         D6UwE4UkUBaa+4rL6qtqOOPWlb/jeCEzQkilKGaTTorbspJ/Xqow3J5ka4ZhZ7Gdhxth
         //Og==
X-Gm-Message-State: AOAM531hDbKiU1IMX471pPeVvpJ9wo6hQqHTpFad63K1slDyn79tpka9
        0iSY1xl4XHWgSrQlcU0TMNPPCA==
X-Google-Smtp-Source: ABdhPJxUXl2heKO9gxro45V92Au16BctO9pymyBSwFNBucpMC8BSlU0pNeEX8JvgNI2nQJV2Hp9g3g==
X-Received: by 2002:adf:9524:: with SMTP id 33mr34155726wrs.156.1593765875740;
        Fri, 03 Jul 2020 01:44:35 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id b18sm4213116wrs.46.2020.07.03.01.44.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Jul 2020 01:44:35 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     sboyd@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        amit.kucheria@linaro.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v5 4/5] arch: arm64: dts: msm8996: Rename speedbin node
Date:   Fri,  3 Jul 2020 10:49:44 +0200
Message-Id: <1593766185-16346-5-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593766185-16346-1-git-send-email-loic.poulain@linaro.org>
References: <1593766185-16346-1-git-send-email-loic.poulain@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The speedbin value blown in the efuse is used to determine is used to
determine the voltage and frequency value for different IPs, including
GPU, CPUs... So it's really not a gpu specific information.

This patch simply renames 'gpu_speed_bin' node to 'speedbin'.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 9951286..2811b8c1 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -424,7 +424,7 @@
 				bits = <1 4>;
 			};
 
-			gpu_speed_bin: gpu_speed_bin@133 {
+			speedbin_efuse: speedbin@133 {
 				reg = <0x133 0x1>;
 				bits = <5 3>;
 			};
@@ -642,7 +642,7 @@
 			power-domains = <&mmcc GPU_GX_GDSC>;
 			iommus = <&adreno_smmu 0>;
 
-			nvmem-cells = <&gpu_speed_bin>;
+			nvmem-cells = <&speedbin_efuse>;
 			nvmem-cell-names = "speed_bin";
 
 			qcom,gpu-quirk-two-pass-use-wfi;
-- 
2.7.4

