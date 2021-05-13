Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD4C937FADF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 May 2021 17:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234955AbhEMPiA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 May 2021 11:38:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234920AbhEMPhj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 May 2021 11:37:39 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11DC3C061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 May 2021 08:36:24 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id t15so3776244edr.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 May 2021 08:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=I1jcRoiTwZROLEGK3W13nn0z7cF0FHWZcsDuLrXIOJo=;
        b=V4amHLQIiQwPZ7mdIoVOdaBLuHN/l/9A6qc/a+VKzXvOm7BmZj3KoPOb6mM+b3YIsV
         C9SNJ5NB6Yk3WOiV+3biktSAp8C9FyeFk6Hnc3zRlvhM8+ns1OBVZr0ErxrFNjf0Lykz
         UXD8klcen6ZX3YK9sM19sl1IjlzdKUaBEFdikZYRGYyQCpF2nUIqnEKLKKUDuE8ri/WL
         2nReZpm+sBnFZ1lEeRkV7JT+oXfrxKhPzrnWzS87OLmFP6BJ0ttZ3oF9utpVuN4czAwX
         vpam0BxROCT4bZX57bBD3HPaWZFdRnB57J7xPPf4/Roo/dETDXMLzQDygDhV8nyE3dPg
         Wn6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I1jcRoiTwZROLEGK3W13nn0z7cF0FHWZcsDuLrXIOJo=;
        b=WYYYgxPcQyTJ+YWPWU5HJb6cv7ESfFslp+M0mnLp6Aw6gbmxAAhwH0+S2xL+QTTjTt
         7Tp/NG//v2I46kU6scabNbyeNSYK8ixUDVuhY0CSaHSWH/dsviScxgdIPh3n3woQFyIW
         eUkpH8rNwLKh90j0sKWstnlSzijA451H/cADnyK9oKuCA89LiVsMFfoQ5lJNZEix9cWY
         5yqNrMIM7HosTZxH/az2OjEwtFCQHcqXguYfeBgG6lSncXYuSJEbkg6i5qheOffJEwOF
         Op9z++uM6ZV1+ao+odTGqCjALaGb/GVUTd+lcOhgt4b+kfXWeLuLhee2ywAdeVou3sZF
         o3hw==
X-Gm-Message-State: AOAM533cFIfs0IV94QZlTkj/9qemt6HbGAzWBSdSh/TbNF/WlQoxcGyE
        eROZg72xKAXL9ay4tWTG9l2E+A==
X-Google-Smtp-Source: ABdhPJztK9wj1Z3IOAtL4fptZucOx8vwrzydF45R+1QkUTxsZj+AGhGZL9ImYJcq4iUljsDnYZx2Ag==
X-Received: by 2002:a05:6402:341:: with SMTP id r1mr50979929edw.113.1620920182857;
        Thu, 13 May 2021 08:36:22 -0700 (PDT)
Received: from PackardBell (192038133011.mbb.telenor.dk. [192.38.133.11])
        by smtp.googlemail.com with ESMTPSA id p5sm2001723ejm.115.2021.05.13.08.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 08:36:22 -0700 (PDT)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id acc32ad6;
        Thu, 13 May 2021 15:35:48 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        David Sterba <dsterba@suse.com>, Jens Axboe <axboe@kernel.dk>,
        Bartosz Dudziak <bartosz.dudziak@snejp.pl>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] arm: qcom: Add SMP support for Cortex-A7
Date:   Thu, 13 May 2021 17:34:42 +0200
Message-Id: <20210513153442.52941-3-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210513153442.52941-1-bartosz.dudziak@snejp.pl>
References: <20210513153442.52941-1-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Implement support for Cortex-A7 CPU release sequence.

Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
---
 arch/arm/mach-qcom/platsmp.c | 72 ++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm/mach-qcom/platsmp.c b/arch/arm/mach-qcom/platsmp.c
index 630a038f45..10780bf14a 100644
--- a/arch/arm/mach-qcom/platsmp.c
+++ b/arch/arm/mach-qcom/platsmp.c
@@ -29,6 +29,7 @@
 #define COREPOR_RST		BIT(5)
 #define CORE_RST		BIT(4)
 #define L2DT_SLP		BIT(3)
+#define CORE_MEM_CLAMP		BIT(1)
 #define CLAMP			BIT(0)
 
 #define APC_PWR_GATE_CTL	0x14
@@ -75,6 +76,63 @@ static int scss_release_secondary(unsigned int cpu)
 	return 0;
 }
 
+static int cortex_a7_release_secondary(unsigned int cpu)
+{
+	int ret = 0;
+	void __iomem *reg;
+	struct device_node *cpu_node, *acc_node;
+	u32 reg_val;
+
+	cpu_node = of_get_cpu_node(cpu, NULL);
+	if (!cpu_node)
+		return -ENODEV;
+
+	acc_node = of_parse_phandle(cpu_node, "qcom,acc", 0);
+	if (!acc_node) {
+		ret = -ENODEV;
+		goto out_acc;
+	}
+
+	reg = of_iomap(acc_node, 0);
+	if (!reg) {
+		ret = -ENOMEM;
+		goto out_acc_map;
+	}
+
+	/* Put the CPU into reset. */
+	reg_val = CORE_RST | COREPOR_RST | CLAMP | CORE_MEM_CLAMP;
+	writel(reg_val, reg + APCS_CPU_PWR_CTL);
+
+	/* Turn on the BHS, set the BHS_CNT to 16 XO clock cycles */
+	writel(BHS_EN | (0x10 << BHS_CNT_SHIFT), reg + APC_PWR_GATE_CTL);
+	/* Wait for the BHS to settle */
+	udelay(2);
+
+	reg_val &= ~CORE_MEM_CLAMP;
+	writel(reg_val, reg + APCS_CPU_PWR_CTL);
+
+	reg_val |= L2DT_SLP;
+	writel(reg_val, reg + APCS_CPU_PWR_CTL);
+	udelay(2);
+
+	reg_val = (reg_val | BIT(17)) & ~CLAMP;
+	writel(reg_val, reg + APCS_CPU_PWR_CTL);
+	udelay(2);
+
+	/* Release CPU out of reset and bring it to life. */
+	reg_val &= ~(CORE_RST | COREPOR_RST);
+	writel(reg_val, reg + APCS_CPU_PWR_CTL);
+	reg_val |= CORE_PWRD_UP;
+	writel(reg_val, reg + APCS_CPU_PWR_CTL);
+
+out_acc_map:
+	of_node_put(acc_node);
+out_acc:
+	of_node_put(cpu_node);
+
+	return ret;
+}
+
 static int kpssv1_release_secondary(unsigned int cpu)
 {
 	int ret = 0;
@@ -281,6 +339,11 @@ static int msm8660_boot_secondary(unsigned int cpu, struct task_struct *idle)
 	return qcom_boot_secondary(cpu, scss_release_secondary);
 }
 
+static int cortex_a7_boot_secondary(unsigned int cpu, struct task_struct *idle)
+{
+	return qcom_boot_secondary(cpu, cortex_a7_release_secondary);
+}
+
 static int kpssv1_boot_secondary(unsigned int cpu, struct task_struct *idle)
 {
 	return qcom_boot_secondary(cpu, kpssv1_release_secondary);
@@ -315,6 +378,15 @@ static const struct smp_operations smp_msm8660_ops __initconst = {
 };
 CPU_METHOD_OF_DECLARE(qcom_smp, "qcom,gcc-msm8660", &smp_msm8660_ops);
 
+static const struct smp_operations qcom_smp_cortex_a7_ops __initconst = {
+	.smp_prepare_cpus	= qcom_smp_prepare_cpus,
+	.smp_boot_secondary	= cortex_a7_boot_secondary,
+#ifdef CONFIG_HOTPLUG_CPU
+	.cpu_die		= qcom_cpu_die,
+#endif
+};
+CPU_METHOD_OF_DECLARE(qcom_smp_cortex_a7, "qcom,cpss-acc", &qcom_smp_cortex_a7_ops);
+
 static const struct smp_operations qcom_smp_kpssv1_ops __initconst = {
 	.smp_prepare_cpus	= qcom_smp_prepare_cpus,
 	.smp_boot_secondary	= kpssv1_boot_secondary,
-- 
2.25.1

