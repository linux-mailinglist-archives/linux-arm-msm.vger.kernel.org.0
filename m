Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7430649083
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Dec 2022 21:04:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbiLJUEP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Dec 2022 15:04:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229841AbiLJUEM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Dec 2022 15:04:12 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19AF513F87
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 12:04:09 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id q6so2170509lfm.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 12:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDt+cVjkMFpQCr4WbA0njzIJ8/m0OvNyfOzyjmNYhSc=;
        b=cbdwYWpTVw/hWlTtSfZCil7N39WfC6Re7YQhOq8oVz4Wgsdfk1RJ+g/mY+MmANfWFM
         q4tzxHGHwDwr14gOPiMZ871Upc/blWpRVMZtOLHEpeo2h7lbqkl2tUwZepD/OB06f5dV
         k7cB8jMOMdh5pqEqmplIEYVWKCqTCUHTrOKfa2wwxIbvTKUO5R8TAhGf2shaMiG0wOZg
         OvybJUYi7HcIZUOE+qA0VVr+VwFf5Up49lY+4QyfSy/sWOet7OmynllwyYwtgSoUg3zx
         6xubhTJmuQ7+Pj5OIrM0ar9FBGTMzBPLQtk31sp1HChXFvrM1qRl9pr2QaqXTmry9fuh
         fc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xDt+cVjkMFpQCr4WbA0njzIJ8/m0OvNyfOzyjmNYhSc=;
        b=o9BkWSn1tDFNskCoYT7MTZvK5JENJEAQ+r348wmnryZROIl0vLicJxq9k3dgJmeI/J
         KsuAHHL2yUe57usJ56faSHCStKSD8HqaKCaFEjkHCWyO9IuJVep0N7a5Px0VzrOTBUlb
         sbjKqGuiF4fGyIRu+GC4DwhwM2/6AqtGwx9dj1V+2wWTV4XgI/seopv4aagGCF1jDqOe
         gsZWpes473YxGjoAxj+EB8GlHjdtp43VigaDrWSk9NbV5aAAVr0/9DFLq1L1rnFpyVLM
         l7w72yysWhvfbSVVGsCfzSY8yYJPhYqMyjz/UsCT6A22UHkFwuB/Okfu87fqYRxe2qeK
         YE/w==
X-Gm-Message-State: ANoB5pnAhRj5Uo1UpuHYKS9+D/V3ceS/pCbO4s2U2mcPIoeN4ycU9Uca
        pzHnxhnBLwTMIUcENVDWtqHJgEqMK2H+JqDS
X-Google-Smtp-Source: AA0mqf5BUQoh8b2MIwiE5BPUaBEMPZLOJBADts9iy8539ZTFXtXwgTMR9dRsdxcdtCSN2rk/z/XGBQ==
X-Received: by 2002:ac2:5a1d:0:b0:4a7:9e45:4cd0 with SMTP id q29-20020ac25a1d000000b004a79e454cd0mr2801113lfn.13.1670702647248;
        Sat, 10 Dec 2022 12:04:07 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id h28-20020ac2597c000000b004b4f1ea713csm839628lfp.73.2022.12.10.12.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Dec 2022 12:04:06 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] interconnect: qcom: msm8996: Provide UFS clocks to A2NoC
Date:   Sat, 10 Dec 2022 21:03:50 +0100
Message-Id: <20221210200353.418391-3-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221210200353.418391-1-konrad.dybcio@linaro.org>
References: <20221210200353.418391-1-konrad.dybcio@linaro.org>
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

On eMMC devices the bootloader has no business enabling UFS clocks.
That results in a platform hang and hard reboot when trying to vote
on paths including MASTER_UFS and since sync_state guarantees that
it's done at boot time, this effectively prevents such devices from
booting. Fix that.

Fixes: 7add937f5222 ("interconnect: qcom: Add MSM8996 interconnect provider driver")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/msm8996.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/interconnect/qcom/msm8996.c b/drivers/interconnect/qcom/msm8996.c
index c2903ae3b3bc..7ddb1f23fb2a 100644
--- a/drivers/interconnect/qcom/msm8996.c
+++ b/drivers/interconnect/qcom/msm8996.c
@@ -33,6 +33,13 @@ static const char * const bus_a0noc_clocks[] = {
 	"aggre0_noc_mpu_cfg"
 };
 
+static const char * const bus_a2noc_clocks[] = {
+	"bus",
+	"bus_a",
+	"aggre2_ufs_axi",
+	"ufs_axi"
+};
+
 static const u16 mas_a0noc_common_links[] = {
 	MSM8996_SLAVE_A0NOC_SNOC
 };
@@ -1859,6 +1866,8 @@ static const struct qcom_icc_desc msm8996_a2noc = {
 	.type = QCOM_ICC_NOC,
 	.nodes = a2noc_nodes,
 	.num_nodes = ARRAY_SIZE(a2noc_nodes),
+	.clocks = bus_a2noc_clocks,
+	.num_clocks = ARRAY_SIZE(bus_a2noc_clocks),
 	.regmap_cfg = &msm8996_a2noc_regmap_config
 };
 
-- 
2.38.1

