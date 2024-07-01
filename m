Return-Path: <linux-arm-msm+bounces-24794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD4791DC5D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 12:25:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6BE11B212EF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 10:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 990A712BEBE;
	Mon,  1 Jul 2024 10:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="F2JAIHJp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD914381D9;
	Mon,  1 Jul 2024 10:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719829516; cv=none; b=JZRRUWZFQkK6pNa+rDhsvALintcD1yBR675oqP3v34UVgOZug5R8M5s/LRuedsfHsX/QcfV1oxy4xuCtZDbN8aVldyEdqa9jqWY+S04aR+/D++E+9IseKouZKEYYi6WnMSz/lBXGUC0l3jabtIj7yghaEATzQG3i5Ja/CJvZ1+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719829516; c=relaxed/simple;
	bh=mlb70k49gE58Gm8n+ygNOCLV0HCSd9r+gI3Aw80eKVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=V711tWAAXlRE2B9tqucQ8VZpObgIl/5IoqsLQoRPKeD0rehGI+pfKkyXVi9zfmVXFWBMOn/ECNIptCCmdOegSyG6oamoERwvMwZipz1wVaeqOEsu3RPEsVTv97DnXF6qCKyJGuv6pFyVvMhQwfrIQc1ndQf1hYai5xITP1USC+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=F2JAIHJp; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4WCMcT6cZqzDqVw;
	Mon,  1 Jul 2024 10:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1719829514; bh=mlb70k49gE58Gm8n+ygNOCLV0HCSd9r+gI3Aw80eKVg=;
	h=From:Date:Subject:To:Cc:From;
	b=F2JAIHJpK4uQONftgmhukfs6dBiNkpGkLljTuYsV9l+FrboyNc5ox6rsyuczptW1T
	 tdXbL6BVPgiqks3kMBFVv0CMIWWrLD9FMIgXHR+TWc5pudNyODVvUAxcMp+20GZh8I
	 qvVAfRT5/rx191WlqSTEYa0RT3FIjWtmzOJH6osg=
X-Riseup-User-ID: 8D6BE43A718B906C928C50D09DE8CB4E792BE55DD41C2F5D69CC61EAC71526D7
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WCMcD1tDCzJrPW;
	Mon,  1 Jul 2024 10:25:00 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Date: Mon, 01 Jul 2024 17:24:39 +0700
Subject: [PATCH v2] arm64: dts: qcom: qrb4210-rb2: Correct PMI632 VBUS
 ampere
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240701-qrd4210rb2-vbus-volt-v2-1-b7bcd2a78c8b@riseup.net>
X-B4-Tracking: v=1; b=H4sIAOaDgmYC/4WNTQ6CMBBGr0Jm7Zh2KD9x5T0MCyiDTGIAp9BoD
 He3cgGX7yXf+z4QWIUDXLIPKEcJMk8J6JSBH9vpzih9YiBDzlTG4lN7R9ZoRxi7LWCcHyvWRFX
 pfOUH30KaLsqDvI7srUk8SlhnfR8v0f7sn2C0aLHwphzqvKhdXl5VAm/LeeIVmn3fv7JsQd25A
 AAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dang Huynh <danct12@riseup.net>

According to downstream sources, PMI632 maximum VBUS ampere is
1A.

Taken from msm-4.19 (631561973a034e46ccacd0e53ef65d13a40d87a4)
Line 685-687 in drivers/power/supply/qcom/qpnp-smb5.c

Signed-off-by: Dang Huynh <danct12@riseup.net>
---
In previous patch series, there's a suggestion to correct
PMI632's VBUS ampere.

Unfortunately it didn't make it and probably forgotten.

----
Changes in v2:
- Fixed typo (voltage -> ampere)
- Link to v1: https://lore.kernel.org/r/20240701-qrd4210rb2-vbus-volt-v1-1-5c06f8358436@riseup.net
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 1c7de7f2db79..1888d99d398b 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -305,7 +305,7 @@ pmi632_ss_in: endpoint {
 
 &pmi632_vbus {
 	regulator-min-microamp = <500000>;
-	regulator-max-microamp = <3000000>;
+	regulator-max-microamp = <1000000>;
 	status = "okay";
 };
 

---
base-commit: 642a16ca7994a50d7de85715996a8ce171a5bdfb
change-id: 20240701-qrd4210rb2-vbus-volt-822764c7cfca

Best regards,
-- 
Dang Huynh <danct12@riseup.net>


