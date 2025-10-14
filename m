Return-Path: <linux-arm-msm+bounces-77116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D135BD8450
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 10:48:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66B3B42500E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 08:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D0152D6620;
	Tue, 14 Oct 2025 08:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Vj1j9JNp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1DD27FD52;
	Tue, 14 Oct 2025 08:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760431715; cv=none; b=qsTz6Hw/voCQIIrzCQVmsvi8m1ofabUrT9vZ95Ut9FtrcBH+jc/iNigJbtp52cTQ7Vnw0+WcXJ3y3tbPoXILN9r0C15Y6Uz8IK3o1xXvPjwnwvDfTrIvXxeH6H3vpVs2DCk5pZX6LSLZVjM4meN4+AGxq3kXRyItnfgmoatZ0IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760431715; c=relaxed/simple;
	bh=mIaAPYFEkpI1yvIArr5qTyEaUT7//BfrWmPLlYvp4r4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FESQwWjs0y421BGaeBQu/3rRShg4NoQ6Mq2oXh0sjyYU+GT49KT4m3sa6AubJEap27LM7shfPTbOM5IoFswPVYuk5HfcuDVxeKaTk0UqLzjzWRGb9ChG4Ww3HkiPgdzhoh1TwpMw5uYmUIrdDvfA9Z8tuVaZ2u9M+gE2Sa6RgO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Vj1j9JNp; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760431703;
	bh=mIaAPYFEkpI1yvIArr5qTyEaUT7//BfrWmPLlYvp4r4=;
	h=From:To:Cc:Subject:Date:From;
	b=Vj1j9JNpTxxO46m6970rElMZnLlpk9he6pzYIdVadrEFF977YTWsWG4aDt6W+mtTX
	 R4uIJr7eFSad+cCz5Oc0pcZIEAHrP8GonT2uwzHR4JSeSrOlZr+q4nx3PPj6ONUbk+
	 bSqnJbYqtAyDgxEVgAT1O6ZaztHibjTPNZiTCkzcsysjorjkGdwd9omJAOHeyyIHLg
	 QnKbhCDfRL5ynK75HUgaUFz6cJaOfqKjTKeEvreYTTmXlqUqEmKOKAyteHdbpfIjyn
	 Dm7jYED+AwxegeUlt4ZKstcgMF2IDhcmWr8YMEYgjACZcYr9vB2ORNLsGC64NVODyi
	 evcY/CQt1cqNQ==
Received: from localhost.localdomain (20014C4E279D1F00313432113AAAAFDB.dsl.pool.telekom.hu [IPv6:2001:4c4e:279d:1f00:3134:3211:3aaa:afdb])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: valentine)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 25C7117E055D;
	Tue, 14 Oct 2025 10:48:23 +0200 (CEST)
From: Valentine Burley <valentine.burley@collabora.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH 1/1] arm64: dts: qcom: apq8096-db820c: Specify zap shader location
Date: Tue, 14 Oct 2025 10:48:07 +0200
Message-ID: <20251014084808.112097-1-valentine.burley@collabora.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The zap shader was previously loaded from "qcom/a530_zap.mdt", which is a
symlink to "qcom/apq8096/a530_zap.mbn". Update the DTS to reference the
actual firmware file in linux-firmware directly.

This avoids relying on the symlink and ensures a more robust firmware load
path.

Signed-off-by: Valentine Burley <valentine.burley@collabora.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
index e74c9fb8f559..c79704fdb31e 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
@@ -201,6 +201,10 @@ &camss {
 
 &gpu {
 	status = "okay";
+
+	zap-shader {
+		firmware-name = "qcom/apq8096/a530_zap.mbn";
+	};
 };
 
 &hsusb_phy1 {
-- 
2.48.1


