Return-Path: <linux-arm-msm+bounces-46948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65106A28F51
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 15:24:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24BAB188A2AB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 14:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A95166F06;
	Wed,  5 Feb 2025 14:23:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EB8155CB3
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Feb 2025 14:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738765388; cv=none; b=r+SYGOaEvunHrfOkSDcTkTgUfliZN6+GQEXy16j8MW3D5yJ9lNCl2AFBbxgfQA72SoMuwfDmul4cbGDZjq7641XrHLAYbOsOqLiBktPIW35Qf4osRkfox9EXJUzDTItiXJ2UAPWalTmp706eMp9nqEfClZfLLQd6U9+ieW/hJQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738765388; c=relaxed/simple;
	bh=pYXgZHe/oKWOjdZSRZOrEvpK9jXW8SUBiB8CdVACYGY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AyV3Rgn5oh3WGh/O1GpEhpY3JZJj8Yo7RCClnSGeO1EwAEXP/5Zva14978dQTpVf7DD/6hMFjYnD9Nk8tFRgoWwgPiSl++82UsUgn2BT+dkSL3/ka9GJrNP4Dh5a/EZ3Pa8dG9Le7MuGzeXkx0yoYDKaLAW41hAA8Khigb+pHec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:fa11:c14e:2df5:5273])
	by andre.telenet-ops.be with cmsmtp
	id 9qNz2E0013f221S01qNzia; Wed, 05 Feb 2025 15:23:03 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tfgIg-0000000FvzO-3MeQ;
	Wed, 05 Feb 2025 15:22:58 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tfgIs-00000006bFa-3Ylm;
	Wed, 05 Feb 2025 15:22:58 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	David Wang <00107082@163.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH resend] genirq: Remove leading space from .irq_print_chip() callbacks
Date: Wed,  5 Feb 2025 15:22:56 +0100
Message-ID: <893f7e9646d8933cd6786d5a1ef3eb076d263768.1738764803.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The space separator was factored out from the multiple chip name prints,
but several irq_chip.irq_print_chip() callbacks still print a leading
space.  Remove the superfluous double spaces.

Fixes: 9d9f204bdf7243bf ("genirq/proc: Add missing space separator back")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/powerpc/sysdev/fsl_msi.c          | 2 +-
 drivers/bus/moxtet.c                   | 2 +-
 drivers/irqchip/irq-partition-percpu.c | 2 +-
 drivers/soc/qcom/smp2p.c               | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/sysdev/fsl_msi.c b/arch/powerpc/sysdev/fsl_msi.c
index 1aa0cb097c9c9d7c..7b9a5ea9cad9d3c7 100644
--- a/arch/powerpc/sysdev/fsl_msi.c
+++ b/arch/powerpc/sysdev/fsl_msi.c
@@ -75,7 +75,7 @@ static void fsl_msi_print_chip(struct irq_data *irqd, struct seq_file *p)
 	srs = (hwirq >> msi_data->srs_shift) & MSI_SRS_MASK;
 	cascade_virq = msi_data->cascade_array[srs]->virq;
 
-	seq_printf(p, " fsl-msi-%d", cascade_virq);
+	seq_printf(p, "fsl-msi-%d", cascade_virq);
 }
 
 
diff --git a/drivers/bus/moxtet.c b/drivers/bus/moxtet.c
index 6276551d79680e85..1e57ebfb76229aa0 100644
--- a/drivers/bus/moxtet.c
+++ b/drivers/bus/moxtet.c
@@ -657,7 +657,7 @@ static void moxtet_irq_print_chip(struct irq_data *d, struct seq_file *p)
 
 	id = moxtet->modules[pos->idx];
 
-	seq_printf(p, " moxtet-%s.%i#%i", mox_module_name(id), pos->idx,
+	seq_printf(p, "moxtet-%s.%i#%i", mox_module_name(id), pos->idx,
 		   pos->bit);
 }
 
diff --git a/drivers/irqchip/irq-partition-percpu.c b/drivers/irqchip/irq-partition-percpu.c
index 8e76d2913e6bebbf..4441ffe149ea0d96 100644
--- a/drivers/irqchip/irq-partition-percpu.c
+++ b/drivers/irqchip/irq-partition-percpu.c
@@ -98,7 +98,7 @@ static void partition_irq_print_chip(struct irq_data *d, struct seq_file *p)
 	struct irq_chip *chip = irq_desc_get_chip(part->chained_desc);
 	struct irq_data *data = irq_desc_get_irq_data(part->chained_desc);
 
-	seq_printf(p, " %5s-%lu", chip->name, data->hwirq);
+	seq_printf(p, "%5s-%lu", chip->name, data->hwirq);
 }
 
 static struct irq_chip partition_irq_chip = {
diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index 4783ab1adb8d953b..a3e88ced328a91f1 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -365,7 +365,7 @@ static void smp2p_irq_print_chip(struct irq_data *irqd, struct seq_file *p)
 {
 	struct smp2p_entry *entry = irq_data_get_irq_chip_data(irqd);
 
-	seq_printf(p, " %8s", dev_name(entry->smp2p->dev));
+	seq_printf(p, "%8s", dev_name(entry->smp2p->dev));
 }
 
 static struct irq_chip smp2p_irq_chip = {
-- 
2.43.0


