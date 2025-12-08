Return-Path: <linux-arm-msm+bounces-84618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABD3CABF1D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 04:16:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7327F30413E7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 03:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E52BA2D2481;
	Mon,  8 Dec 2025 03:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b="OOPDvsqx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com [136.143.188.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6609C20B80B;
	Mon,  8 Dec 2025 03:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765163741; cv=pass; b=dNG6glaCVo40oQ1c3o5TMnTDgVohEbGubDNvbfDI5dMbmqwwtpGC/1byz5dplph0SPlDveZ7mP/d531QZpbjPDpkKfYEO9j0ewxucpOm9JVjJSJJZSqX0HJPJEaJQj1t4uOQetNTM52aeoN4jGs4RStQ2LVWonBcnZ9iXjeBxxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765163741; c=relaxed/simple;
	bh=NCt3XlhbZuVJsjaaDddibAOi3Eu9nmADS1Jwhsr1myI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Eta4URqQXSFCGvxFPKnfXiovN0gq0NXFCvPxkYXSlkPu4x4wSIvBT+XWFXbdqSasYvRZt6aXSA5lUjcEpq398d3MQld+xn0WnxHr2a5Geye5tfy7/xQMOTntzzh1ANq0qxTZXF9c4Lf5JbSLUMiw5iGcS92s2mGOwDbWQtdUFdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b=OOPDvsqx; arc=pass smtp.client-ip=136.143.188.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
ARC-Seal: i=1; a=rsa-sha256; t=1765163727; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ft1+K/8cQ2OYdVIKCcwWMUgIviq/aYYlSJ0uVvUSL2dah9jCBP98AiEf90uXfknCBOmMmcd2x2kbCnY/bQ5mGiG5vbGMlguOTeHhnsffk5+1PwoBGBzSg4A0x724XA7Gn8uzp1s3wbiw8/N+zHdSNSOB8aJAZzATBCCuMpFDl84=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765163727; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JzrUKNnFQLRLU0DAaAPatSy8DRZN5ppE0v2b4ItJlnU=; 
	b=MvqQQKZzUaLaE/xlPgUX3oh//XsPUw+7aGL3z+gCkN6FPyW4kZl7JdVnwn4MNhhVpa8ffqOmujKXlw1h6lYaar7HkSPgsgIxzBJtdJAemkXRTI06S0bCHK0zFBFzKcAlHwJvrYbPbl9/EpZMxhckH25DXd4MCKjA+VcOSiAYfas=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=newwheatzjz@zohomail.com;
	dmarc=pass header.from=<newwheatzjz@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765163727;
	s=zm2022; d=zohomail.com; i=newwheatzjz@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=JzrUKNnFQLRLU0DAaAPatSy8DRZN5ppE0v2b4ItJlnU=;
	b=OOPDvsqxkHmj5c2YI6ltSNGxF1JVHYEVT2yEmSaIv3tEzidgl/5ukSP+zfq1Irx3
	+6zv4Hsk1V0w7wmQs64Qx9uo0rMCOt0+NI7WANGAkPq9qwZFJLAgNQtPI6qb/zZfH7v
	rY/qmSKG+bniZmaX3C/RmP5YVNY60v0GvNyg+Wzc=
Received: by mx.zohomail.com with SMTPS id 1765163724749716.6088120005342;
	Sun, 7 Dec 2025 19:15:24 -0800 (PST)
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
Subject: [PATCH 2/2] arm64: dts: qcom: sdm850-huawei-matebook-e-2019: Correct ipa_fw_mem for the driver to load successfully
Date: Mon,  8 Dec 2025 11:15:11 +0800
Message-ID: <20251208031511.3284-3-newwheatzjz@zohomail.com>
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
Feedback-ID: rr080112277987d134709aa1050035c978000081b59520b9289fdd7d26caa74f44d625e7961d128eb78c40bc:zu080112279787c3f5bf7eecbe9d9d449e0000a0202d453d5ed5717fbbe427de330fe02783f9332d00252562:rf0801122cd98c96ee4698df82d186a31e0000195485d00640d848c4c8432440c8a6a0f309d54bd52ac906b6ab3baf35e2:ZohoMail
X-ZohoMailClient: External

The ipa driver refuses to load with the old ipa_fw_mem in newer kernels.
Shrinking its size to 0x5a000 fixes the problem.

Fixes: aab69794b55d ("arm64: dts: qcom: Add support for Huawei MateBook E 2019")

Signed-off-by: Jingzhou Zhu <newwheatzjz@zohomail.com>
---
 arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts b/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts
index a5f025ae7dbe..f04865381870 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts
@@ -144,12 +144,12 @@ wlan_msa_mem: wlan-msa@8c400000 {
 		};
 
 		ipa_fw_mem: ipa-fw@8df00000 {
-			reg = <0 0x8df00000 0 0x100000>;
+			reg = <0 0x8df00000 0 0x5a000>;
 			no-map;
 		};
 
-		gpu_mem: gpu@97900000 {
-			reg = <0 0x97900000 0 0x5000>;
+		gpu_mem: gpu@8df5a000 {
+			reg = <0 0x8df5a000 0 0x5000>;
 			no-map;
 		};
 
-- 
2.47.3


