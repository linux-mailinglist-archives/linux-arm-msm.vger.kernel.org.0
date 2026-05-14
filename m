Return-Path: <linux-arm-msm+bounces-107539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id RbDPA+VzBWpuXQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 09:04:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E44DE53EA83
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 09:04:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 53A753017E7D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 07:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C3953D16ED;
	Thu, 14 May 2026 07:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ge4k9A9B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239B33AC0DD;
	Thu, 14 May 2026 07:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778742242; cv=none; b=lhCeitHfGLGhg8izRMnE5zyD2/FQEAwDH7AQJZU6U0nJmV0YTJux5oGD+xeP8ztreeH5BYkvB40D433JOQfXi6t9Rgm1nKrtXLPe8d54Ve+VKeGMK0xwbnxasKxnY55NugJE2jZREp0g/mVZGkT5weN4irsV3CFE7AvrC8rDvug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778742242; c=relaxed/simple;
	bh=MiMD2MLAknKqm/C40NQmjCA1v02tDQb4pWIBMZ/KaVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ijkX9icdj63E3eUot60Un/qVh8OyRC8BAKMxgPmRit65WP2uUNCdQS/y+W2x1fNKwT4YkJIrlQPv+sF8FOV/xEUZ/qomkWNAOqn/JoZnWtLZslMESRQC4BfV8wvdIKa/qfz42DyuUYptmSueglD3jFJOgYsY9Ksd3uW6mAqrs28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ge4k9A9B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4BDAC2BCF6;
	Thu, 14 May 2026 07:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778742242;
	bh=MiMD2MLAknKqm/C40NQmjCA1v02tDQb4pWIBMZ/KaVo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Ge4k9A9B9R5QMxz2dIRstH8sFQVphDZztDABPN8AMDyuGSTJK78Y5sYcTJHpOrkox
	 g4RHWb6DI/nVu7BeJZBKmY6u7Rzm0zEnT5pIobwTOdstQifbICOGagn+3XFLouSsMl
	 rn25m11OOiboJg+U9M3cQI1vQyMsCICT1Sq4sfNS69DUm5Uw60F+htRfjDw2yFLHOS
	 8yVy13sxeHdzPk8eTXFjekJJBei5LKaX5XLqWrXb2RIhnn1LXhrIGSqnhhQ7UcxFLg
	 F4pu70bIxVZbtlvtDn6S8Ju8z0ASqE4vvGJENAqh2Vvtf1G9UWrxqXgfwQ8e/jft4h
	 Kmu7YkXDorDUg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6CA6CD4F3E;
	Thu, 14 May 2026 07:04:01 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Thu, 14 May 2026 00:04:01 -0700
Subject: [PATCH 2/3] soc: qcom: spm: Add MSM8960 SAW2 CPU support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-expressatt_cpufreq-v1-2-487fd2d78859@gmail.com>
References: <20260514-expressatt_cpufreq-v1-0-487fd2d78859@gmail.com>
In-Reply-To: <20260514-expressatt_cpufreq-v1-0-487fd2d78859@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778742241; l=2299;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=nrLplu9+cKSqhALRTglWbMzBGC3bon3VtGeZsCT7sGQ=;
 b=UIKrGrwHTX76SeWIsGzDcTrzwRTiJPsh3jweNO+73SQm4NCLT+K87OiaDN45ldZp/Z1rBhkd9
 RzmFjmz8/sPBCpO0h7hUObP/pr30DMtR9rWXN0sO95ox/k5Vlkf+E9Z
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com
X-Rspamd-Queue-Id: E44DE53EA83
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107539-lists,linux-arm-msm=lfdr.de,guptarud.gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[guptarud@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Rudraksha Gupta <guptarud@gmail.com>

The MSM8960 uses SAW2 v1.1, the same hardware version as the APQ8064.
Add SPM register data so that the SAW2 driver can program the correct
SPM sequences and PMIC parameters for MSM8960 CPUs.

The register layout, SPM sequences, voltage range, and regulator
parameters are shared with APQ8064. The only difference is pmic_dly:
0x03020004 on MSM8960 vs 0x02020004 on APQ8064.

Link: https://github.com/CyanogenMod/android_kernel_samsung_d2/blob/0dbe2b56847b304d30b809dfd08ba3b4a61d9af8/arch/arm/mach-msm/board-express.c#L3353-L3381
Assisted-by: Claude:claude-opus-4.6
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 drivers/soc/qcom/spm.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/spm.c b/drivers/soc/qcom/spm.c
index f75659fff287..596431b00a03 100644
--- a/drivers/soc/qcom/spm.c
+++ b/drivers/soc/qcom/spm.c
@@ -233,7 +233,7 @@ static const u16 spm_reg_offset_v1_1[SPM_REG_NR] = {
 
 static void smp_set_vdd_v1_1(void *data);
 
-/* SPM register data for 8064 */
+/* SPM register data for 8064, 8960 */
 static struct linear_range spm_v1_1_regulator_range =
 	REGULATOR_LINEAR_RANGE(700000, 0, 56, 12500);
 
@@ -253,6 +253,22 @@ static const struct spm_reg_data spm_reg_8064_cpu = {
 	.ramp_delay = 1250,
 };
 
+static const struct spm_reg_data spm_reg_8960_cpu = {
+	.reg_offset = spm_reg_offset_v1_1,
+	.spm_cfg = 0x1F,
+	.pmic_dly = 0x03020004,
+	.pmic_data[0] = 0x0084009C,
+	.pmic_data[1] = 0x00A4001C,
+	.seq = { 0x03, 0x0F, 0x00, 0x24, 0x54, 0x10, 0x09, 0x03, 0x01,
+		0x10, 0x54, 0x30, 0x0C, 0x24, 0x30, 0x0F },
+	.start_index[PM_SLEEP_MODE_STBY] = 0,
+	.start_index[PM_SLEEP_MODE_SPC] = 2,
+	.set_vdd = smp_set_vdd_v1_1,
+	.range = &spm_v1_1_regulator_range,
+	.init_uV = 1300000,
+	.ramp_delay = 1250,
+};
+
 static inline void spm_register_write(struct spm_driver_data *drv,
 					enum spm_reg reg, u32 val)
 {
@@ -501,6 +517,8 @@ static const struct of_device_id spm_match_table[] = {
 	  .data = &spm_reg_8974_8084_cpu },
 	{ .compatible = "qcom,apq8064-saw2-v1.1-cpu",
 	  .data = &spm_reg_8064_cpu },
+	{ .compatible = "qcom,msm8960-saw2-v1.1-cpu",
+	  .data = &spm_reg_8960_cpu },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, spm_match_table);

-- 
2.54.0



