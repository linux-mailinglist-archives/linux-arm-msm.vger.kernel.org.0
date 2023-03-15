Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A58C6BB8D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Mar 2023 16:58:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232713AbjCOP63 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 11:58:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232715AbjCOP6R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 11:58:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C57F856BC
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 08:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678895800;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=CJaCLAjqxLo9SAqmZ/ZPxPuIYyAicDla8mBV+t3lBL8=;
        b=MqGuIU8aGur8T6kH/k+QZlIwDxYLJhjhforGDgMBeGdk8k/52qSm0v5bpcNnCjx9rcPwjk
        K3IMBz2vklzAgbY8DfnTD7csfWSKEp+UvJa3j5T0+iMfePg66YtbrH3d18m1VFl2Ap+YBb
        +dXHGZA6M9QQenVn7rQ5WpxisD8Io1M=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-lG_IBwlkOWiVGP5ZWhqbVA-1; Wed, 15 Mar 2023 11:56:38 -0400
X-MC-Unique: lG_IBwlkOWiVGP5ZWhqbVA-1
Received: by mail-qk1-f197.google.com with SMTP id eb13-20020a05620a480d00b00742be8a1a17so11485297qkb.18
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 08:56:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678895798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CJaCLAjqxLo9SAqmZ/ZPxPuIYyAicDla8mBV+t3lBL8=;
        b=NKywntBcEBxmZMLgrGrgnjVEDjLZBFIuUcw2hzawx5xWbSM0JMm5ggM/yH6h5jvf3p
         ZcQyLtO1c56iFmWcvQs7qnLKjki9HXS1Swiyy2hCbZPZRaabtpoaeFY7kWeFwbmmllfe
         uHDfyUOOFcVK5+riTRG7Y28lRtVlnqE2qCP+j9OkpL9FeXzzFaX2O00woIqGWgrEqMme
         AxIK0jm9IUi9o+asScmjAQgYvdoEUyEVUCBpXBWaEMdM+9bLdhGOWp7+clWWHt0TEuUs
         SD2mSoRa/cYmvYXykw1AfZssqVD6L6el7gvdtgSgVNjdI/TZTe+jtO8DDpJCSqWQoxAd
         YayA==
X-Gm-Message-State: AO0yUKUpr8GOwhQn4+Gel1HECabZPFeegwqTiiypcTr2Pb3Dcw7Ii9Bk
        AJvXoWC1EDR2Yi+vOFf1O36FS69yrwbLRi/cXRTb2ZgFFBLlhwXPpyranIgiuabJPvrUOtUOmWg
        H22nYXGWsKKzfikKffsblaLwjaw==
X-Received: by 2002:ac8:5b95:0:b0:3bf:bff0:841d with SMTP id a21-20020ac85b95000000b003bfbff0841dmr644408qta.21.1678895798123;
        Wed, 15 Mar 2023 08:56:38 -0700 (PDT)
X-Google-Smtp-Source: AK7set/MjGuH4d1AxU+OLSdm6oom5h3vCnE3goYeC+g5OzZF63DemuqYGQ2rvDXJ3heg1B3xbb48ZA==
X-Received: by 2002:ac8:5b95:0:b0:3bf:bff0:841d with SMTP id a21-20020ac85b95000000b003bfbff0841dmr644356qta.21.1678895797686;
        Wed, 15 Mar 2023 08:56:37 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id 201-20020a3705d2000000b00745a78b0b3asm3873312qkf.130.2023.03.15.08.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 08:56:37 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     andersson@kernel.org, agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [PATCH] clk: qcom: remove unused variables gpucc_parent_data,map_2
Date:   Wed, 15 Mar 2023 11:56:30 -0400
Message-Id: <20230315155630.1740065-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

gcc with W=1 reports these errors
drivers/clk/qcom/gpucc-sm6375.c:145:37: error:
  ‘gpucc_parent_data_2’ defined but not used [-Werror=unused-const-variable=]
  145 | static const struct clk_parent_data gpucc_parent_data_2[] = {
      |                                     ^~~~~~~~~~~~~~~~~~~
drivers/clk/qcom/gpucc-sm6375.c:139:32: error:
  ‘gpucc_parent_map_2’ defined but not used [-Werror=unused-const-variable=]
  139 | static const struct parent_map gpucc_parent_map_2[] = {
      |                                ^~~~~~~~~~~~~~~~~~

These variables are not used, so remove them.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/clk/qcom/gpucc-sm6375.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sm6375.c b/drivers/clk/qcom/gpucc-sm6375.c
index eb9ffa956950..d8f4c4b59f1b 100644
--- a/drivers/clk/qcom/gpucc-sm6375.c
+++ b/drivers/clk/qcom/gpucc-sm6375.c
@@ -136,18 +136,6 @@ static const struct clk_parent_data gpucc_parent_data_1[] = {
 	{ .index = DT_GCC_GPU_GPLL0_CLK_SRC },
 };
 
-static const struct parent_map gpucc_parent_map_2[] = {
-	{ P_BI_TCXO, 0 },
-	{ P_GCC_GPU_GPLL0_CLK_SRC, 5 },
-	{ P_GCC_GPU_GPLL0_DIV_CLK_SRC, 6 },
-};
-
-static const struct clk_parent_data gpucc_parent_data_2[] = {
-	{ .index = P_BI_TCXO },
-	{ .index = DT_GCC_GPU_GPLL0_CLK_SRC },
-	{ .index = DT_GCC_GPU_GPLL0_DIV_CLK_SRC },
-};
-
 static const struct freq_tbl ftbl_gpucc_gmu_clk_src[] = {
 	F(200000000, P_GCC_GPU_GPLL0_DIV_CLK_SRC, 1.5, 0, 0),
 	{ }
-- 
2.27.0

