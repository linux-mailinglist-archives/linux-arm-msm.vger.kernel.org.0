Return-Path: <linux-arm-msm+bounces-82144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 25590C657E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 18:30:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 11A934F731C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 17:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B49132548D;
	Mon, 17 Nov 2025 17:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="e3M9itpm";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="d+9BBTLo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B9F32ABD0;
	Mon, 17 Nov 2025 17:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763399886; cv=none; b=etUHwuNaOdJUmSV2sYdkdRlL5RvJ2NO1KuX8N+9BOZDrNS3ZP52jeWX+Z5wpeUYpX2Wu8p6/2z1Iy6LRjTOwCYMxn0avg/unradY6lw+8dYw9I83GNtJ4kep8Xi6hrieudSawpSG9E7W7xhJIB8kGxddTultxa8kihc6aKoClNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763399886; c=relaxed/simple;
	bh=DwU8xmE8fnDnLJrwHBqWMO3H0UmHYjaJf5pOq/SZlm4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SegQ1uJlUCBlfwxyLdvEsyTS/dOKWo7MGu/rzTsXR1bNHnr4RS9VCoEJ54az1klhhju0xTFAksgZCfjZBnWVXka7tJGFw9qGAEKcmi718RgI8CvFPHNkDjvHimjuXL6Gj8P3DaL5GALHJy/KFuHL+W4mk+f8nLbZaT8JYDNZFtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=e3M9itpm; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=d+9BBTLo; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1763399876; bh=Ba+iBzT9nytvBVNltmmGAZh
	GvCdcPk+aKxnOb12hNNo=; b=e3M9itpmRdtVobAifC2INbMKTzmjWuS973nZ8P0nrYONEe476H
	obvvvBfyZ8iRRxHRbCaig2EKFPyxyuW9JYdCyRjHxok6w8pKprdUa0iSMlDQY1o2cJphGrX4MqP
	JY/gTkXlqb09erOW/CYzQOlFX9OEsFg4qTnHC4HEmcK1BQmEmVUxgEcmu25ee0696zJIo3j7zs1
	WV995ZgqA0P/J4CRxG3WiDlTiUqg85AhQQQbFstxkmtx8sq913DkLH572tLFitmuUltKdqxGO0s
	JUouy3LSRlcrzetDpQltgDw/OuymgHFX8COKcSsAboXcFz15jB9Q826ESNniQunI2Vw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1763399876; bh=Ba+iBzT9nytvBVNltmmGAZh
	GvCdcPk+aKxnOb12hNNo=; b=d+9BBTLoTE1xjfFVO90j5AL1a7cdvCIlugVSbV5kGyJudh6HGC
	OlQXko+lBOtAGrvGF5eFCFsatkL42MfhJdAg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Mon, 17 Nov 2025 18:17:52 +0100
Subject: [PATCH v2 1/4] dt-bindings: clock: gcc-msm8917: Add missing MDSS
 reset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251117-mdss-resets-msm8917-msm8937-v2-1-a7e9bbdaac96@mainlining.org>
References: <20251117-mdss-resets-msm8917-msm8937-v2-0-a7e9bbdaac96@mainlining.org>
In-Reply-To: <20251117-mdss-resets-msm8917-msm8937-v2-0-a7e9bbdaac96@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763399874; l=687;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=DwU8xmE8fnDnLJrwHBqWMO3H0UmHYjaJf5pOq/SZlm4=;
 b=igZfHRIfDv6BkfegZ+RQAPXjo120D/dGD0mQx0fBxhhkaVwPDOVd5IqyxYuGpamR1dl+Ki6mD
 657HgvQjfa9A3T9AgK3jQGYtXQahVJz6hO9TL++04BXqEHe5TV+4xBE
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add definition for MDSS reset can be found on MSM8917 and MSM8937.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 include/dt-bindings/clock/qcom,gcc-msm8917.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-msm8917.h b/include/dt-bindings/clock/qcom,gcc-msm8917.h
index 4e3897b3669d..4265460bfb30 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8917.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8917.h
@@ -194,6 +194,7 @@
 #define GCC_QUSB2_PHY_BCR			2
 #define GCC_USB_HS_BCR				3
 #define GCC_USB2_HS_PHY_ONLY_BCR		4
+#define GCC_MDSS_BCR				5
 
 /* GDSCs */
 #define CPP_GDSC				0

-- 
2.51.2


