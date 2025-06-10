Return-Path: <linux-arm-msm+bounces-60843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BF0AD3FEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 19:04:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD2F6188D4BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 17:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60061243364;
	Tue, 10 Jun 2025 17:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="FbW9ubCi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C44236424;
	Tue, 10 Jun 2025 17:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749575046; cv=none; b=o3ufSzgvanWqHNJrI7Tm01XJmIsfNrg2CqP8KlI+pbJMMmuT6NF4Dswog63NiWau1ohJ6HOCNdypGj0JYtBjMuaaosJscx2lJmNo/L9OQzR5M+L6VzhCrRzq0HbBJenY6Rcs+4zsXxEhdQQAy++AS/Ep3LSjjCwAQX82FLsuT+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749575046; c=relaxed/simple;
	bh=CLiWGSRhSmupypRmANXUwi7Hn6MCXIuzA9KVhpLTmWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hG90cYBS47DsYvzLekClRJLtkkfLzi3w6GjG6z8ojaZC84Z/u23PXH+LCOJmz8/YKr/2doBcvMsXk/BJEUMbvUbXQYff5gvWStXuno2Mch0DVNEhF9cZ+0tAI/l6WorYKI1fY7eJjfhvbXAur/xeQYpckZpdcCRnajWtTMG1wMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=FbW9ubCi; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1749575043; bh=CLiWGSRhSmupypRmANXUwi7Hn6MCXIuzA9KVhpLTmWc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FbW9ubCiedqwT8gXVFn+x0C/9xUzT20jOIl4Us1qdEfiRJ4B+mrNy2LGCniKWxmpY
	 eHmsv7/13dSfMNX3oB7LKzmC07bUayvkzpDrreD4pZ1llWa5cYia/EKBdhqPJW8FMp
	 hywWQX5l2HTG1uNERxvrnBrHDFaHgf2TRXHD3F4Q=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Tue, 10 Jun 2025 19:03:50 +0200
Subject: [PATCH v2 2/3] ARM: dts: qcom: msm8974-hammerhead: Add alias for
 mmc0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-msm8974-mmc-alias-v2-2-1d8808478fba@lucaweiss.eu>
References: <20250610-msm8974-mmc-alias-v2-0-1d8808478fba@lucaweiss.eu>
In-Reply-To: <20250610-msm8974-mmc-alias-v2-0-1d8808478fba@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=905; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=CLiWGSRhSmupypRmANXUwi7Hn6MCXIuzA9KVhpLTmWc=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBoSGWAknp+gw89mFP4VnfUig42WCUvSVGj6BJVA
 To5Qr4MT8eJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaEhlgAAKCRBy2EO4nU3X
 Vt20D/9fu8yeOZZZUBLNU78l+KSAfHArDwEy/NAxwalfMz1p2FkV5A4ygyidUzFa+B0Uhz1riGn
 h8UsxyJsrwlUINYE2o9v6ZNbkgrylp+PYs+MVMW3KAJxcH/MWZ0ftZHeSCrKFjHNac26QIb15KC
 C4dP/d4yu9YVq0EDl9X8nvlAIeikCSvHARV7fZHmlR6XUh0LhhgLn5n3ub3hyny+JZzW14bSomN
 1X5xccSu181KOOXOBdZQZsncMAJbKXEt+ME/Qvk9t9UQ8jUsxv+icHP3wtW90uG/LGuCTU4zM7U
 ZMEdhUXFbs4B2sbwlceDgXjGv2KtskwmdTmGlFEbXmSUPOkcHgDBHMN5ZqnympuLqJLuisPLklg
 cbIZhZg/aRaVETeqsFfN49DpCRy3XEg/akz6w/qaHGNMUUfMBdQJ56qrBpdLtU0s55zyGPQUu7n
 HhjtHgWZeKuR5Q9+u0nh5SQW9F2ahrwMRzhD/HO1QZP5UksOL/dQWKNAa31otNQucQ2rljsn3N0
 vGZbw1xCVRI8tOgNgBRUvN7kjU+U5SgkIqnhlJg8gfOqJPWxV+hNoLS3oovhp4b5d2RPJUjSPmY
 gV+KQgyZwm54EGBEvBm3iJaBUxADyzkrnIyU0Ap8oGm8QCYfbf38125d46YrkDYXCGpOnSCMVyq
 afYs8LwM/8Tfodw==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add an alias for the internal storage so it always becomes mmcblk0.

This avoids issues with internal storage becoming mmcblk1 unexpectedly
and aligns this board with other boards that use MMC storage.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
index 261044fdfee866449e9d9d62cef5aea10d88e874..0f4ff87d80234d1e1389ae9b6c3c84112ff34799 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -12,6 +12,7 @@ / {
 	chassis-type = "handset";
 
 	aliases {
+		mmc0 = &sdhc_1;
 		serial0 = &blsp1_uart1;
 		serial1 = &blsp2_uart4;
 	};

-- 
2.49.0


