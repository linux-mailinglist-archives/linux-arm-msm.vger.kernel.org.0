Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43F8778C6F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Aug 2023 16:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233879AbjH2OJ2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Aug 2023 10:09:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236926AbjH2OJV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Aug 2023 10:09:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBC19114;
        Tue, 29 Aug 2023 07:09:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 00DA665A6C;
        Tue, 29 Aug 2023 14:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBA54C433C7;
        Tue, 29 Aug 2023 14:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693318155;
        bh=h8cfi2Mh1OhVzbl+CNjIEmhwkyrXf53KkQGLSBB6wsA=;
        h=From:Date:Subject:To:Cc:From;
        b=N3/GQ3X7y44HVD+8aWwz23+1T+Lkd8kDl3LPguUf+jOXkkHwNIj/VSz+0mRcFqkhi
         yw562Y+zSi5C3/1mbzoezYfT1Z7wkCn9G48InL/YMbiAzOCkj7lOC7ZphD8fVjTWZ0
         98XXzw4FtUG6kiQ7lbInZWoEXc6lwyWjwnGfVYUxWVB0MWIEGRDIw1b9j+4cRsctPV
         qiPFPPmfRL4nv94RNcxXyvXI94s5oEBQ9QQ7lfyib7F7xZAxnWzDPkiadneUtJDKfq
         cMTCEuC1pVsjignGWXKzFQp0sewPMYqJhIZaav3h18MwbCotHU4ECS6koXZGDZgUhS
         cGMaUpAuWP0VA==
From:   Nathan Chancellor <nathan@kernel.org>
Date:   Tue, 29 Aug 2023 07:08:47 -0700
Subject: [PATCH] clk: qcom: Fix SM_GPUCC_8450 dependencies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230829-fix-sm_gpucc_8550-deps-v1-1-d751f6cd35b2@kernel.org>
X-B4-Tracking: v=1; b=H4sIAO777WQC/x2M0QpAQBAAf0X7bOvsIfyKpOss9gHXbaTk310ep
 2bmAeUorNBlD0S+ROXYExR5Bn51+8IoU2IgQ9Y01OIsN+o2LuH0fmyqyuDEQbGtrXOmtGRnghS
 HyMn8x/3wvh+MRlagaAAAAA==
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1636; i=nathan@kernel.org;
 h=from:subject:message-id; bh=h8cfi2Mh1OhVzbl+CNjIEmhwkyrXf53KkQGLSBB6wsA=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDClv/3CVnpnkJPL4XqLm8VObE+NUFma778wp/Gb9TOfBD
 RPvi1MudZSyMIhxMMiKKbJUP1Y9bmg45yzjjVOTYOawMoEMYeDiFICJ7Gln+J9wJ+KM92fuXs+i
 /vL0PVf/3HzLt0/z/Wn+wkt2YtqFp58z/Hf9kO7vcTL9y7Pf32Nl74XJi/YYmditWTQlrsdrcfn
 1BfwA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

CONFIG_SM_GCC_8450 depends on ARM64 but it is selected by
CONFIG_SM_GPUCC_8450, which can be selected on ARM, resulting in a
Kconfig warning.

WARNING: unmet direct dependencies detected for SM_GCC_8450
  Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=y] && (ARM64 || COMPILE_TEST [=n])
  Selected by [y]:
  - SM_GPUCC_8450 [=y] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]

Add the same dependencies to CONFIG_SM_GPUCC_8450 to resolve the
warning.

Fixes: 728692d49edc ("clk: qcom: Add support for SM8450 GPUCC")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
I think this is more of a silent conflict between commit ab7f00379fe9
("clk: qcom: restrict drivers per ARM/ARM64") and commit 728692d49edc
("clk: qcom: Add support for SM8450 GPUCC"), rather than just a fault of
728692d49edc but ab7f00379fe9 was merged first so I just chose
728692d49edc as the problematic commit for the message, feel free to
adjust it as necessary.
---
 drivers/clk/qcom/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index bd9bfb11b328..865db5202e4c 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -986,6 +986,7 @@ config SM_GPUCC_8350
 
 config SM_GPUCC_8450
 	tristate "SM8450 Graphics Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8450
 	help
 	  Support for the graphics clock controller on SM8450 devices.

---
base-commit: e1cd74b6dccb98ca09e4612ff29c7658db7a487b
change-id: 20230829-fix-sm_gpucc_8550-deps-963aa04323f2

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

