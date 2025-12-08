Return-Path: <linux-arm-msm+bounces-84617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABECCABF14
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 04:16:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A9B430341EB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 03:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61E62D6E62;
	Mon,  8 Dec 2025 03:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b="SjcFCzqi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com [136.143.188.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9608B231827;
	Mon,  8 Dec 2025 03:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765163734; cv=pass; b=IJ7JQKjsxbJLhWVE4uPunKjcHBtKtXEsH7T033nLuPht2RXPPOFApKLUPLtCUdJDb56x5BzpxlV2k7g2J5N0Y7bk2PN1ai60JAt3qgeBHZkzWjBY9BvpQbRnjdBUHMoKOB+ulCN1yrnCqysQfnxgE29UuW88/k8DXxUs4H79osY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765163734; c=relaxed/simple;
	bh=Kzx4p1QQ3lExB2IJ0Y+0aWUjXo6kAcxn+gng5S+QYVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AZSm5QFpwchchMs+0uoJo2WuUlchfJgtfq0I3a316BCzFHuvG6N0TTeiCJ7i+Aa7C5yMGjJSoChT5MjKsRpOzTYNtmGr33+Bzq2ot0R3Lo8aC5vvuXtRInQBVBVezIUn8zyZ/Zzo2jRjF255AR633L0wEKxHdulcl9caxDCQmQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b=SjcFCzqi; arc=pass smtp.client-ip=136.143.188.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
ARC-Seal: i=1; a=rsa-sha256; t=1765163725; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jmGhTvvlCXjYMIW9Df4aKbleRjDsEn2oMbEYssQ0gHcuAQQ2dUCVvG1b0UOkfldLahIHoxURq1pC9AtKFwE3PC4NYtQRVL3hQxQCAqCKhnbuleQ4QaLlqLDEyEK9R/ds25sf8sPKqt8rfSijQb0dt80U4nj60IL3H0MVvUBpCME=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765163725; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Npsn8KA7obts4X08gIIT8Xe87EfVgHOjaWXN9OgfLlM=; 
	b=nbsHA9uaetE0KYDyrlEB4Vb0PsMJXUMV+p7goKR/vLSU9fXh1gQRlOamavUpxdau3MGvQPhMmo/PcHJ851TmYN0stFC5wuDBfR4oFIpgxLd7AUutR88Azudoffgm2EDfmjnQ0DBWo1OGN0wmUSTadD/DuJrOSRB0oV0z4tqSB5s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=newwheatzjz@zohomail.com;
	dmarc=pass header.from=<newwheatzjz@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765163725;
	s=zm2022; d=zohomail.com; i=newwheatzjz@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=Npsn8KA7obts4X08gIIT8Xe87EfVgHOjaWXN9OgfLlM=;
	b=SjcFCzqieHIOt8WAr79yPek60gaQjSm0SFHUJ39swDKvHgKjZjcJWaBUCaqSP2Rl
	f33PV7O8jFNbY5XpK7v+U+7X4CpYwgqSb/hDgNEAGqUvrh2WTYDVRTUSE0kMYvkSCY6
	ZdhaK2d3N3w2MzLRLoQxwdtBgZjL/WK8nD4m4/XU=
Received: by mx.zohomail.com with SMTPS id 176516372236471.88145972002917;
	Sun, 7 Dec 2025 19:15:22 -0800 (PST)
From: Jingzhou Zhu <newwheatzjz@zohomail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jingzhou Zhu <newwheatzjz@zohomail.com>
Subject: [PATCH 1/2] arm64: dts: qcom: sdm850-huawei-matebook-e-2019: Remove duplicate reserved-memroy nodes
Date: Mon,  8 Dec 2025 11:15:10 +0800
Message-ID: <20251208031511.3284-2-newwheatzjz@zohomail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251208031511.3284-1-newwheatzjz@zohomail.com>
References: <20251208031511.3284-1-newwheatzjz@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: rr08011227fa5cc01711a7eed499d09fb500003d09fa39edaa8b94d53b0e1a3dc5a8235b37f7e8b6bf351cb2:zu08011227b7626f35ae9fcc3a58f47b2300003aaad51fd4f622e8be8c01bc7fdfb8d18d28fdc0aac10fe508:rf0801122c1461b3bab1626114584d686a000051fbe65f11379f4529d1076533d755e68f7137fb507b15cfc521e424d36c:ZohoMail
X-ZohoMailClient: External

The adsp_mem and slpi_mem defined in sdm845.dtsi work well. Remove these
nodes here to avoid redefinition.

Signed-off-by: Jingzhou Zhu <newwheatzjz@zohomail.com>
---
 .../boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts   | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts b/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts
index 0ef9ea38a424..a5f025ae7dbe 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts
@@ -30,9 +30,7 @@
 /delete-node/ &ipa_fw_mem;
 /delete-node/ &ipa_gsi_mem;
 /delete-node/ &gpu_mem;
-/delete-node/ &adsp_mem;
 /delete-node/ &wlan_msa_mem;
-/delete-node/ &slpi_mem;
 
 / {
 	model = "Huawei MateBook E 2019";
@@ -145,20 +143,11 @@ wlan_msa_mem: wlan-msa@8c400000 {
 			no-map;
 		};
 
-		adsp_mem: adsp@8c500000 {
-			reg = <0 0x8c500000 0 0x1a00000>;
-			no-map;
-		};
-
 		ipa_fw_mem: ipa-fw@8df00000 {
 			reg = <0 0x8df00000 0 0x100000>;
 			no-map;
 		};
 
-		slpi_mem: slpi@96700000 {
-			reg = <0 0x96700000 0 0x1200000>;
-		};
-
 		gpu_mem: gpu@97900000 {
 			reg = <0 0x97900000 0 0x5000>;
 			no-map;
-- 
2.47.3


