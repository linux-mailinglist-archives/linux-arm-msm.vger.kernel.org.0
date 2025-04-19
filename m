Return-Path: <linux-arm-msm+bounces-54798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B52DBA9427E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 11:04:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAACE3BBE98
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 09:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDE071C84CF;
	Sat, 19 Apr 2025 09:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="gqilW5JI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A091C3F0C;
	Sat, 19 Apr 2025 09:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745053459; cv=none; b=VBit0W/FKUgnzPRALjeOSfIQVQyqMGUCmkSC2iMzEw3cGevF3QTDpNoKCuq0rytP9OW674Xof5oaVPOBRj7LnCFm1oMJoniYjFVE/7qbTDsgBfeFvhDaRAfOTLxjZjtiZhrLnZzWijSkyWdk5+RipOUWgT0n1Jsh1RE48GBfxR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745053459; c=relaxed/simple;
	bh=FnERG1gp9YLMvh1MNw0xDOIjTlYnvEaxTqifrJNSowM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UM0EcQVTI4tUB/KaTrqvyd9iC1VN10WPfm6OZMOH9U7lV9lXNCULB6G222OxtKN0D47JglMyKKU1Y5l3cEl0W2oggfcAsdEJ5wvpJgLfmIIsZ3vvIP004mMToSyghphru5GfYhgx8CGPS+Xb/Msb8+OLQ5fue9/mfKR8FDzMKt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=gqilW5JI; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1745053456; bh=FnERG1gp9YLMvh1MNw0xDOIjTlYnvEaxTqifrJNSowM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gqilW5JIHgtQynIN4gdCf4h+Vmn0mUFK7Kf7DCyx9HN8IRsUS/zsd1LZiXL9CuOXe
	 0VrdlJI7u+pccrD68tVPor6BHFykQekIn0dZIh1OyJbuViP4tbflhpkoina7ofO1Em
	 kfh+MbzfVRiZlqYJs6Rt4kBHvzA10sCQqlH8h5oo=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sat, 19 Apr 2025 11:03:58 +0200
Subject: [PATCH 2/3] ARM: dts: qcom: msm8974-hammerhead: Add alias for mmc0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250419-msm8974-mmc-alias-v1-2-82aa131224b6@lucaweiss.eu>
References: <20250419-msm8974-mmc-alias-v1-0-82aa131224b6@lucaweiss.eu>
In-Reply-To: <20250419-msm8974-mmc-alias-v1-0-82aa131224b6@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=768; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=FnERG1gp9YLMvh1MNw0xDOIjTlYnvEaxTqifrJNSowM=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBoA2cKNzfcKxOOtg6I9UEqi1fa//CCvDXyhU9I9
 XA1S8jvb/SJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaANnCgAKCRBy2EO4nU3X
 VvJPD/97Eg6s9zdFJCCiRlHfXJjXI6Y2YeHYFHT2VDSHsnK+GxrIDuFZbP9SFm0i7Ce/lNhnnxI
 KGNt5GYUwuwiOZiGTghgoSLzQJo+mksLg/ulzbonm21tehrQRazNu1cql1qXbxW42MbYvEbMYI1
 nR+wB0fYI0veC51uVnvCunTaGmZ5+X4Q6m8fFMjWhaBgNeJvFHLAK2rny3M52wBEDX/vYg+6cP6
 LWBeTgrmjotihnqybyW1CjYXt924TGXgI1G+cT+TOs/AlUH/y3jJ9hyk8u9pGw4vRNBc7mETAv1
 DTOmBiqJ2zoDeYeIneIwE0LoDnWfIzm3ijYswETMBV1cP3eQfUnVFDgZ4fD4YWNSukjEaq7QJBI
 Nkqi24EuH67ak2odSb//S83/56+OJpeViZ/aodBIqRkAqCBU46B/GRTYAQotVrW6KJDKCAoFmcp
 eKi8XFGWco7ml5CzNJ2DvOyki8s3FZ2uOR8j0jis1ximU6A3C04+SzCY4iC7MW86Ju5TL2mWrm1
 TeA8Ifmoq9h3IV5gahK8LcYqNjFIKvlHnnwZMIiRILB8wxrkyJqsaqzPCnVvHHc/MGSBkjhoPkI
 /GaUyKq3HpA5Bo1TKQKSsRYz5mwOnIKTCgRQyUJJG0dnEJmwsQiZEhl5T7ayLDyKFSSPL3LL9lf
 r82Gt3HvUbmijUA==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add an alias for the internal storage so it always becomes mmcblk0.

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


