Return-Path: <linux-arm-msm+bounces-101395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CmWEr+EzWnveQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 22:49:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E46B3805FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 22:49:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD7BA30712DC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 20:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 930C637DE96;
	Wed,  1 Apr 2026 20:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4D+sppb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9644F37B3FE;
	Wed,  1 Apr 2026 20:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775076017; cv=none; b=P04PWYtgGGjNkAt4A3a0WFgoOUwoARWxtjTth8OfE8DG2CNVoKBu3lwXgCvg8VHrblCGKXSp+rADNCi1zUgJPlDdNZmojFB0SXuQZGxLm300TxDCbzKcC+ucvCu7U+lFOSLmYCnaqmAE6P9ytWp8URF3SnjLpV0t5RhUlRq8Vjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775076017; c=relaxed/simple;
	bh=SukhKZ9+f2HwLYvQ8WbY2/mfioRlbGDMDXaymSuHNT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qsoHkxSAVDtTwPCCiH6OTYj6m9xZW14OFE/QLzPVymDFVLG4zS7g5WM3CA1Ua80R0h+h4ybu+RabGD+RTgEhYq/7DjiIfesxbI8eNMianD+yTMldmHylCmyCfCjdg4kt0FUw7F+dGH7tQ+ZUeytw1AZip32Bbf08kpfYTAjesG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4D+sppb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30FA6C2BCB2;
	Wed,  1 Apr 2026 20:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775076017;
	bh=SukhKZ9+f2HwLYvQ8WbY2/mfioRlbGDMDXaymSuHNT4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=U4D+sppbH+sNm56EgUYFDJKFQL6i1F3sybuQB588lY0/z0vYUzUZlePglgDXRZj+z
	 JAI+bvjScM5fzZOnmW/bxio8dizdHaRfgVYB7uPU4SMPw8xm4lhnH86SlwIZGqhQsD
	 zJrJbN8rBOsbqHk/9FVVsUJU+3EuwCCUwBAZwEjqgUhwV25XE6t0Me8Z/vTUel/Ztf
	 2qb0AQj2pyAxL/8l8KDFdMiSdj3PSkO3Rw4o4FbTriayhF1HwawuIWtVrAJN6MZ2rc
	 408qaB+vGfYDPM0e4v37q8RoBX001iWwd7jaPYq7SX8UlulHzWkSFSu2deAyl5as23
	 wVCWP8cmH9+Kw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2585F10FCADE;
	Wed,  1 Apr 2026 20:40:17 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 01 Apr 2026 22:40:17 +0200
Subject: [PATCH v3 4/4] arm64: dts: qcom: sdm845-samsung-starqltechn:
 Convert fb to use memory-region
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-beryllium-fb-v3-4-ec7d443402ab@ixit.cz>
References: <20260401-beryllium-fb-v3-0-ec7d443402ab@ixit.cz>
In-Reply-To: <20260401-beryllium-fb-v3-0-ec7d443402ab@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>, 
 Sam Day <me@samcday.com>, Dzmitry Sankouski <dsankouski@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Petr Hodina <petr.hodina@protonmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1183; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=gN5kieASmpmvG+WEYJe1SGEYovf2d/d661pl9qIjP0k=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpzYKvNtolsKMdRe+ofmju3FGMEBlacb1FH7vwM
 xjeBQhho+uJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac2CrwAKCRBgAj/E00kg
 cqlZD/0VYN3MA1hQxNm+8ykNZljgC0t3axnfW3nBo1S8PCRI00XJ+lHXosoTdoD2Z6Hr86PQG8g
 YFwX5q3rozOQPa2KQUKcH35VdCjgAzbJaKD6rMK9mmz4dG6ECFoNv/UmQCbxS7TWOE4OqDAnEfA
 Tc117RAc8SKOIsaZywO7r3+agXQzbAAincNHaok27ft9uSLO3z97PuFG4JAIEvnjNna62vJUEZ0
 tTZTV8ogbhl/MY9MMn/J1JnwhpAGVKu4Kwp4vgN/SrzVP2R0MdPxICcHfc5Sj6VCWfd4NegGEPH
 +aJpgIeobsRrKRLqc2lCpg4TTK9dxESJIWpRHiC5cq1FQBvKf+g5MNwyjYX7+0jBHWNg1FrFmG+
 dZmyPsZofjvtICKpghaNFKZwuAQv9NjHdEfEY/o7knuAXHNfvol6lbp4721pJ0V9B3FGVa4Y9VC
 f+fJV3MA3SMNZ3CHvSggQKdo0bVJl/wAQQW6l+R/IBk8KAnISJWNN5mPR7OzngbTnmxbWeTTs0/
 ZvpqJ0Dr8nEBeJQjswwK1TUn40DPdn1OndmzjrKFy2tqJynDb1fyULAvUYWKw8GBnw3Du5Vc6K2
 u/V5codYBkzjqkHeBo6h8JBzOE51ajrJuyG9XuiJNwCL3tE+JoAkZQBUy3RQCKy6mWydMbhozwk
 8ySES7h75YJ8ECQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101395-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,ixit.cz,samcday.com,gmail.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,protonmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,ixit.cz:replyto,ixit.cz:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,9d400000:email]
X-Rspamd-Queue-Id: 9E46B3805FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

Instead of manually specifying reg, reuse the memory region.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 77f5872de6f19..0d915ecb0444f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -43,9 +43,10 @@ chosen {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
-		framebuffer: framebuffer@9d400000 {
+
+		framebuffer {
 			compatible = "simple-framebuffer";
-			reg = <0 0x9d400000 0 (2960 * 1440 * 4)>;//2400000
+			memory-region = <&framebuffer_mem>;
 			width = <1440>;
 			height = <2960>;
 			stride = <(1440 * 4)>;
@@ -109,7 +110,7 @@ vreg_s4a_1p8: pm8998-smps4 {
 	};
 
 	reserved-memory {
-		memory@9d400000 {
+		framebuffer_mem: memory@9d400000 {
 			reg = <0x0 0x9d400000 0x0 0x02400000>;
 			no-map;
 		};

-- 
2.53.0



