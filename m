Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1E68567137
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 16:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232245AbiGEOfz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 10:35:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232493AbiGEOfy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 10:35:54 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56EC85F50;
        Tue,  5 Jul 2022 07:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:References
        :In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=JUn1jSaPZbSkjB9N0EbRyM0eRkdA0xCVqZoLF19COAg=; b=Uv+bfRko00Z8s5j6zP95+k5ish
        KiDLtQh6soEkDGe02Vg4Av8stMc3N/6NnW1Za55ENYa3cs35gR0lWA225+aUJ0Qv9QSW5UGWc7/Vq
        fB+IuLckZSYt6DYq6l6+cPltNA6a68IsidqS6cvwPsDNU3s2LngPXAYN859FdChZa5HhE1lSiD7Nm
        Qir/Qii0d5dgsI5q+jk3jIUez6D+DEJr/kRzIZcT7uFITNb4fbd1G8Z5TPOechESyTFEoS8+sd/ub
        Ipdin2MWEZ1/4sOIn9fLVLfrUG34afZykd55KFBt/eEfDHe5PziavTu4MmwvCr+d6QT+HR3TwFadW
        f0stohQg==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1o8jeX-007EB6-7h; Tue, 05 Jul 2022 16:35:49 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [PATCH 8/8] ARM: mach-qcom: Add support for MSM8909
Date:   Tue,  5 Jul 2022 16:35:23 +0200
Message-Id: <20220705143523.3390944-9-stephan.gerhold@kernkonzept.com>
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

Add a Kconfig entry for MSM8909 and the "qcom,msm8909-smp" CPU
enable-method. The ARM Cortex-A7 cores are booted just like on MSM8226.

Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
---
 arch/arm/mach-qcom/Kconfig   | 4 ++++
 arch/arm/mach-qcom/platsmp.c | 1 +
 2 files changed, 5 insertions(+)

diff --git a/arch/arm/mach-qcom/Kconfig b/arch/arm/mach-qcom/Kconfig
index 109e126f7271..12a812e61c16 100644
--- a/arch/arm/mach-qcom/Kconfig
+++ b/arch/arm/mach-qcom/Kconfig
@@ -20,6 +20,10 @@ config ARCH_MSM8X60
 	bool "Enable support for MSM8X60"
 	select CLKSRC_QCOM
 
+config ARCH_MSM8909
+	bool "Enable support for MSM8909"
+	select HAVE_ARM_ARCH_TIMER
+
 config ARCH_MSM8916
 	bool "Enable support for MSM8916"
 	select HAVE_ARM_ARCH_TIMER
diff --git a/arch/arm/mach-qcom/platsmp.c b/arch/arm/mach-qcom/platsmp.c
index 65a0d5ce2bb3..5d2f386a46d8 100644
--- a/arch/arm/mach-qcom/platsmp.c
+++ b/arch/arm/mach-qcom/platsmp.c
@@ -384,6 +384,7 @@ static const struct smp_operations qcom_smp_cortex_a7_ops __initconst = {
 #endif
 };
 CPU_METHOD_OF_DECLARE(qcom_smp_msm8226, "qcom,msm8226-smp", &qcom_smp_cortex_a7_ops);
+CPU_METHOD_OF_DECLARE(qcom_smp_msm8909, "qcom,msm8909-smp", &qcom_smp_cortex_a7_ops);
 CPU_METHOD_OF_DECLARE(qcom_smp_msm8916, "qcom,msm8916-smp", &qcom_smp_cortex_a7_ops);
 
 static const struct smp_operations qcom_smp_kpssv1_ops __initconst = {
-- 
2.30.2

