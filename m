Return-Path: <linux-arm-msm+bounces-95603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEP9KrViqWmB6gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 12:02:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A962103AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 12:02:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A9AD309009E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 10:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D119437B018;
	Thu,  5 Mar 2026 10:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kXeYi7V8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD84930B509;
	Thu,  5 Mar 2026 10:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772708174; cv=none; b=SCfT2+7AecU4AKUKE1EmoP8zoe/Wi6Z8bGX7atg0vrIIFfm3755DjpTu1zgG534MXSsG01p8LCdX3oAhJ++PwThBvhhtOIjF1e55tuWZM8dnsKuCIhYDXQsFAReM6NMR07nQzJ7rA9JxqQY5dF6XsS6KBkpKySdavUIxJySHthg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772708174; c=relaxed/simple;
	bh=Z2YN4XpRRC5ruNqz0fS0uzT8FCNMvVc45F5zGUfmG9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cQGWo8g/B4xzg7RkdvNsl3IeH/FCvc3df0p6ixpKbq3xv5rxe1ZUYSzFO/nwoxT4UGFcsuFAmgBWeAu1Xgj26oxJ/mtdBX8SmkkDo0Cir/lo50ogmlUwQg3a/7Ec13hEW4P9p3O2ZtGIfB5c4Ff13+gT1u/aElWhicaHMOsYz4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kXeYi7V8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA20CC19423;
	Thu,  5 Mar 2026 10:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772708174;
	bh=Z2YN4XpRRC5ruNqz0fS0uzT8FCNMvVc45F5zGUfmG9g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kXeYi7V8ljJx2oYeCSHhNLYxmWKpPl7LbCfhHpPRQv0lON86tiOJE2B/4Y2sAfmFB
	 L4gTbH4COD/Wmb/7jzI9unq7KBjkQP/Avh9gXlPXg/mM3xe212xmIf8sKiWVBBPeZo
	 akoTmnWUBIKDzvxt2/6Ak9fUH0tn6QulHIPv2y8A097twXaThqq8U5qostTifmQQrb
	 fp5CmwCyEBiNlEiR+4y2fz1xMhncVlxbF+rKyVo33/vnOemtauynl2ePu4fbl6kUYG
	 4vx+7YEgFUkYC9n0+8H4azhTat0gNBHzlKknRKKEhMPHJegd3VPFvKXTGFAJykmBFi
	 aG0nvIYHmcxLw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 05 Mar 2026 11:55:44 +0100
Subject: [PATCH v2 5/7] arm64: dts: qcom: sm8350: Explicitly describe the
 IPA IMEM slice
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-topic-ipa_mem_dts-v2-5-5cb5b90902bf@oss.qualcomm.com>
References: <20260305-topic-ipa_mem_dts-v2-0-5cb5b90902bf@oss.qualcomm.com>
In-Reply-To: <20260305-topic-ipa_mem_dts-v2-0-5cb5b90902bf@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772708147; l=1322;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=IANFPYAlPC3j2hbLx5A5gbXXFevp6LPq1aDUcmlJULQ=;
 b=wI0q6mNr0chchGpWotdKrFr6tIYJz/QqnIVJ4s0DqVCLFWML96nlhK6G39/mFUWACTOCXNZ3/
 CcN95n9OB+CD0oeZyO26kmdCWTH/XwyHza1u5uBbfx2j4vAuk4HAU7g
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Queue-Id: 25A962103AF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95603-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,3d000:email,0.228.225.192:email,qualcomm.com:email,1e40000:email,0.223.255.192:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

As part of stepping away from crazy hardcoding in the driver, move
define the slice explicitly and pass it to the IPA node.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 5c8fe213f5e4..2e61ff43e8ba 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1866,6 +1866,8 @@ ipa: ipa@1e40000 {
 			qcom,smem-state-names = "ipa-clock-enabled-valid",
 						"ipa-clock-enabled";
 
+			sram = <&ipa_modem_tables>;
+
 			status = "disabled";
 		};
 
@@ -3440,6 +3442,20 @@ qup_i2c19_default: qup-i2c19-default-state {
 			};
 		};
 
+		sram@14680000 {
+			compatible = "qcom,sm8350-imem", "syscon", "simple-mfd";
+			reg = <0 0x14680000 0 0x40000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0 0 0x14680000 0x40000>;
+
+			ipa_modem_tables: modem-tables@3d000 {
+				reg = <0x3d000 0x2000>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sm8350-smmu-500", "arm,mmu-500";
 			reg = <0 0x15000000 0 0x100000>;

-- 
2.53.0


