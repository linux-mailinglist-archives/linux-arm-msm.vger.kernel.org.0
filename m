Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B0AA649081
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Dec 2022 21:04:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbiLJUEM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Dec 2022 15:04:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbiLJUEL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Dec 2022 15:04:11 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79DEE13F7E
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 12:04:10 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id b3so12253124lfv.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 12:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F70X0h1gEhZbNZjzSbofbLgELtxej/JOcL3nmVN4Az4=;
        b=VnlJ64RRCWzDKIto7yzRZOPNx02NENlNPq+D7IcdtNHcHY6i9XFs003Bpn5i8F/q+0
         TBcBTDmPgKBgwHNMs7oZrwj2VWOwecYuinfcarY8ODviqBW/O8NrGC7i96YZ9iUEr0uX
         DDcSpxRSdoailKGYOr8RckqaPjr52R6BJnk2PL2M2LW7mqTBtusEAHxIRda99LNVMDlk
         UjOf2eWMxp2RzvGobCtt1Rox78AFINvtPTP3Mj7rb+GOmjXRHR/84b123FWRV0aohhKu
         qHkRusMEJSHtYRAl57u28hImiZlolPs9ZN6MATKNQLnEHn+mZunLZUTgs7cmv6n5kcPn
         nbig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F70X0h1gEhZbNZjzSbofbLgELtxej/JOcL3nmVN4Az4=;
        b=mpyj4nKsjVcqgnLy5A7TLf2Cro+7efsqlqHsNgP2k7+dDCDxkLYwt+12tTL/t8eCAu
         xNU3Q2SkqXocye/MpkxDmJtmmqJInTkvhgw7zL8HEdyf7h4TJ/clFpWOFt3onZnheAky
         jX61VZPZrbwPJCtvr0c1qIWwZ3r9A2VfaeOBaCYl41oPekB3P1Y0cYEV2rr5B9349VcO
         zBtae3RBX/+YUBRK+Uf+i4EEM5uj0h94yQE28MkCXXBnWELVDhRdMqD5CUJKg9xG/VA4
         SLtW7SBQ2Pn27FdmxXpxEpe5VTwU0Ks7Nv5gGiOy+0+ml7gl/lhPRH8wU2aRg+Emr/4j
         8L7A==
X-Gm-Message-State: ANoB5plT690Ea960EgG5QNuDm39HOHhpNxall9ahVyDAP4GDkkIorqVM
        m2nF3OHdV82xQz7/CZnfVa0E1ZmLodDbdCqK
X-Google-Smtp-Source: AA0mqf5mAtCFFr/GyhSpnySoX+FDSDVDj5vpOdKDW367vkMF/OGGYBjTaogxp2x56jTmWRYlFm/r0g==
X-Received: by 2002:a05:6512:32ce:b0:4a4:8044:9b8 with SMTP id f14-20020a05651232ce00b004a4804409b8mr3063830lfg.9.1670702649853;
        Sat, 10 Dec 2022 12:04:09 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id h28-20020ac2597c000000b004b4f1ea713csm839628lfp.73.2022.12.10.12.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Dec 2022 12:04:09 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] interconnect: qcom: msm8996: Fix regmap max_register values
Date:   Sat, 10 Dec 2022 21:03:51 +0100
Message-Id: <20221210200353.418391-4-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221210200353.418391-1-konrad.dybcio@linaro.org>
References: <20221210200353.418391-1-konrad.dybcio@linaro.org>
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

The device tree reg starts at BUS_BASE + QoS_OFFSET, but the regmap
configs in the ICC driver had values suggesting the reg started at
BUS_BASE. Shrink them down (where they haven't been already, so for
providers where QoS_OFFSET = 0) to make sure they stay within their
window.

Fixes: 7add937f5222 ("interconnect: qcom: Add MSM8996 interconnect provider driver")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/msm8996.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/interconnect/qcom/msm8996.c b/drivers/interconnect/qcom/msm8996.c
index 7ddb1f23fb2a..25a1a32bc611 100644
--- a/drivers/interconnect/qcom/msm8996.c
+++ b/drivers/interconnect/qcom/msm8996.c
@@ -1813,7 +1813,7 @@ static const struct regmap_config msm8996_a0noc_regmap_config = {
 	.reg_bits	= 32,
 	.reg_stride	= 4,
 	.val_bits	= 32,
-	.max_register	= 0x9000,
+	.max_register	= 0x6000,
 	.fast_io	= true
 };
 
@@ -1837,7 +1837,7 @@ static const struct regmap_config msm8996_a1noc_regmap_config = {
 	.reg_bits	= 32,
 	.reg_stride	= 4,
 	.val_bits	= 32,
-	.max_register	= 0x7000,
+	.max_register	= 0x5000,
 	.fast_io	= true
 };
 
@@ -1858,7 +1858,7 @@ static const struct regmap_config msm8996_a2noc_regmap_config = {
 	.reg_bits	= 32,
 	.reg_stride	= 4,
 	.val_bits	= 32,
-	.max_register	= 0xa000,
+	.max_register	= 0x7000,
 	.fast_io	= true
 };
 
@@ -1886,7 +1886,7 @@ static const struct regmap_config msm8996_bimc_regmap_config = {
 	.reg_bits	= 32,
 	.reg_stride	= 4,
 	.val_bits	= 32,
-	.max_register	= 0x62000,
+	.max_register	= 0x5a000,
 	.fast_io	= true
 };
 
@@ -1997,7 +1997,7 @@ static const struct regmap_config msm8996_mnoc_regmap_config = {
 	.reg_bits	= 32,
 	.reg_stride	= 4,
 	.val_bits	= 32,
-	.max_register	= 0x20000,
+	.max_register	= 0x1c000,
 	.fast_io	= true
 };
 
-- 
2.38.1

