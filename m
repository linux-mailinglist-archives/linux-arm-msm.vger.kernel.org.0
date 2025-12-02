Return-Path: <linux-arm-msm+bounces-84070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B960CC9B517
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 12:31:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 699163A35A5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 11:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECF78284662;
	Tue,  2 Dec 2025 11:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZay2D6G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE45A1EC018;
	Tue,  2 Dec 2025 11:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764675075; cv=none; b=mMoILAV2IKlCFcIxf7lgbUaW6IyTnxn+3omgOn3fqOHx+pfZvSMPUxCfNf8/6xXigaRVIAU4CB7t0dqotIjzzjbufwDXWulX3uyfHl+dOKquoR3VUFkfW1k7mwS8e+OwPFM6bB4vxlu6buRDi8lkdL1yaEQ3tGMHFmBzGfgjUH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764675075; c=relaxed/simple;
	bh=GugALyXhHRVsxVUThs6L155hc1IleqDRTwe3Rrmvz7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cDijMdbW+8Rrput0rxCSy/Iv6QtOAr5TM3fQRS5XYNDC3Jc0zxqCnQ3sMBbIZ60AJ78RtwIdCCnXoHrXMSCriUcr1C30HqhBD2eHB2eMv6mHT2u/QYMMnfhstzl4QrXPybayBGDNSc7Z/2BeLEzCLHYsNngI44Fpj6mp8rQ97KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QZay2D6G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93CE0C116D0;
	Tue,  2 Dec 2025 11:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764675075;
	bh=GugALyXhHRVsxVUThs6L155hc1IleqDRTwe3Rrmvz7Y=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=QZay2D6GWRVUpsCy0W9drbygV4Bq8RhQe0VUmMhjzIEwG9jBjZAfEk9WOkllge+0d
	 zszI1ZbLgd/l3d/Ekd2gLdTXCT8OSuog83+iBFlK3apDNfaosEgKAbJ36VcMdTRuqP
	 QZSZ9blILjocj1PI8OMQtTTAMaz/TfxQpZOBqA/dTd+T0PGD4q3td+z4JLkxNjmyu6
	 glKKeh/LhOLEoIq/MacE3LN8mX4iimWvdZ7olqX3ROqgX8qX4yP4/tDeaMBVvlm58L
	 NICYsQ32qD93KaBjjH2HXwb40X9KBigv4Z31U4T76grofjjQOMmIgZ0FPv1Tvjm8Zs
	 AZ3ErITlQ115g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8916BD116F6;
	Tue,  2 Dec 2025 11:31:15 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 02 Dec 2025 12:31:11 +0100
Subject: [PATCH] arm64: dts: qcom: sdm845-tama: Keep labibb on, so kernel
 can disable it
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-tama-labibb-v1-1-f8f3fda53d1d@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAP7NLmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIKFbkpibqJuTmJSZlKRrbGqUYpBqnGRqbJqoBNRRUJSallkBNi06trY
 WAJK5FcNdAAAA
X-Change-ID: 20251202-tama-labibb-352d0e3b535a
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1307; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=0UAAE/GYUfDSMLAMoQz/OVDB+waaDiiqt3ufPTsWZ7c=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpLs4Cxo4sEgA4auX8qDQVu1C0Ys5Z92vxDo5nR
 oWfeNHX+06JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaS7OAgAKCRBgAj/E00kg
 ctZ9D/4ph94Vj16a0ibUs8T7RMZ/uzH3ySwLHRXRnxEGxoS/zqT52pPpT8j7w9ArSLdreFh44d5
 9UyzpaZydzVssH4rV8ylCObkwBNuPdkt4WkCnz17nHMzj3IT9EYJweC8owuA+8LopalvRDJtoWZ
 GKbXICzbLd4QjakbRK3VpVsiMb8kPgd2A03hSECWLSX+NXMnBqA1bBAf3i2khjpkhFgGHifRnm6
 5lz1SXgurUKEa9grvASL4cHBTg1G+UnyFl+ccttkLVGdipdmaEx2O1gQ5NesyJoLitUEVsgijBm
 8gIDgSUkl1sO9klZjnjod/IXe5FpOwSabAlT8gtdXAAsv2EwGO9UTfxjr/1wTKGevcqCdS8WWte
 59r7+ojFjrFUkYxGyDO+BKyEU+9qFufLd7tKsfQ9hvYjCzOy3IVPxcbZjOT++gmrbw0QG+ZqOG8
 6M798CgG0R7LdVH9SVKOrsi2V5dWkyI1dNPAOU4h0bgTPPYGfohII5MlSvZ4bwExQC6JSXDyP6D
 /6TQ4s5pKZySmG/Arc4aTuqbv5sasQgeoOZuBpTUqxknt43Io2mZeYoASshThDXPWU2Q+WcMlSP
 YwHF90Y31GWyaTkMOPqfdIEuGz5U99LElQyDpbpVGrt/tZ26UhZVaTdg/YgMeKm3NEFyImFaDP5
 s33dy6dL/j/J51Q==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

In case if they were enabled by the bootloader as part of some
reference/common routine and left hanging. Linux will switch them off if
they're never used.

Discussion about it can be found here:
  https://lore.kernel.org/all/20251130-oneplus-labibb-v1-1-bb3653e43120@ixit.cz/

Fixes: 5dcc6587fde2 ("arm64: dts: qcom: sdm845-tama: Add display nodes")
Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts
index 82e59e4533549..c2b38ecb2e9cf 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts
@@ -28,14 +28,6 @@ ts_vddio_supply: ts-vddio-regulator {
 	};
 };
 
-&ibb {
-	status = "disabled";
-};
-
-&lab {
-	status = "disabled";
-};
-
 &panel {
 	/* Akatsuki uses an OLED panel. */
 	/delete-property/ backlight;

---
base-commit: 95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
change-id: 20251202-tama-labibb-352d0e3b535a

Best regards,
-- 
David Heidelberg <david@ixit.cz>



