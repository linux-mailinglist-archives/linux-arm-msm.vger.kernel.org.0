Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3A6567131
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 16:35:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232768AbiGEOfw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 10:35:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232245AbiGEOfv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 10:35:51 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D94D55AE;
        Tue,  5 Jul 2022 07:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:References
        :In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=NuYA56EIuKvoVgMIrItRfIY+Paz5l6bpoqP6hV8E0f4=; b=auKt518BPqCXqUTaw+GO/nFv1r
        mWWLNl1K4vwzAhBmlNS39KEnHLO6nkXxhXnN62tRcg9me3ujfcDjeyN7lFRfqM1VY9SJkNzq+DGa5
        EWVCUTARPVoBulou5zxK58PGS6r/qmtPCMDl+Obr0YbWzpIXIbcaVlUyPximu3X/sYtSP9nu9gufd
        psuVAt/DYHYdYnySYCfDde+kbA/BVtSrA324qtZMpHaJ7bB8pkDVywc+KUOFUVmSWD+ar4fWT8RJh
        WpuPqm976o2EBkshAe0OJcSA+GYtNQk0Y1dmsmg3SdYA53VujClTYF6cjUwSXj3R1dHlBZTtg8+Yo
        OSv8mPRQ==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1o8jeU-007EB6-LS; Tue, 05 Jul 2022 16:35:46 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [PATCH 6/8] soc: qcom: spm: Add CPU data for MSM8909
Date:   Tue,  5 Jul 2022 16:35:21 +0200
Message-Id: <20220705143523.3390944-7-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220705143523.3390944-1-stephan.gerhold@kernkonzept.com>
References: <20220705143523.3390944-1-stephan.gerhold@kernkonzept.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Given the lack of public documentation for the SPM, the configuration
data is taken without modification from Qualcomm's msm-3.10 release [1].
It is pretty much identical to the one for MSM8916, except that 0x3B is
missing in the sequence for standalone power collapse for some reason.

[1]: https://git.codelinaro.org/clo/la/kernel/msm-3.10/-/blob/LA.BR.1.2.3-00910-8x09.0/arch/arm/boot/dts/qcom/msm8909-pm8909-pm.dtsi

Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
---
 drivers/soc/qcom/spm.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/soc/qcom/spm.c b/drivers/soc/qcom/spm.c
index f831420b7fd4..484b42b7454e 100644
--- a/drivers/soc/qcom/spm.c
+++ b/drivers/soc/qcom/spm.c
@@ -74,6 +74,18 @@ static const u16 spm_reg_offset_v3_0[SPM_REG_NR] = {
 	[SPM_REG_SEQ_ENTRY]	= 0x400,
 };
 
+/* SPM register data for 8909 */
+static const struct spm_reg_data spm_reg_8909_cpu = {
+	.reg_offset = spm_reg_offset_v3_0,
+	.spm_cfg = 0x1,
+	.spm_dly = 0x3C102800,
+	.seq = { 0x60, 0x03, 0x60, 0x0B, 0x0F, 0x20, 0x10, 0x80, 0x30, 0x90,
+		0x5B, 0x60, 0x03, 0x60, 0x76, 0x76, 0x0B, 0x94, 0x5B, 0x80,
+		0x10, 0x26, 0x30, 0x0F },
+	.start_index[PM_SLEEP_MODE_STBY] = 0,
+	.start_index[PM_SLEEP_MODE_SPC] = 5,
+};
+
 /* SPM register data for 8916 */
 static const struct spm_reg_data spm_reg_8916_cpu = {
 	.reg_offset = spm_reg_offset_v3_0,
@@ -195,6 +207,8 @@ static const struct of_device_id spm_match_table[] = {
 	  .data = &spm_reg_660_silver_l2 },
 	{ .compatible = "qcom,msm8226-saw2-v2.1-cpu",
 	  .data = &spm_reg_8226_cpu },
+	{ .compatible = "qcom,msm8909-saw2-v3.0-cpu",
+	  .data = &spm_reg_8909_cpu },
 	{ .compatible = "qcom,msm8916-saw2-v3.0-cpu",
 	  .data = &spm_reg_8916_cpu },
 	{ .compatible = "qcom,msm8974-saw2-v2.1-cpu",
-- 
2.30.2

