Return-Path: <linux-arm-msm+bounces-24856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCCD91EEB2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 08:02:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B114E1C21905
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 06:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74D336120;
	Tue,  2 Jul 2024 06:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="L7vC1fK5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4AF747F;
	Tue,  2 Jul 2024 06:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719900114; cv=none; b=gW3UKREedViabUV/sWKWY+Vf448TWWijtwW2KtTUHvfZJJBC8fltG7lquc+jst2USBiV3yMnGHuuLKseCkcpP65m4wrMjzeE8ohN3eZ0Zt4wsaBRY+BoytfKdldykg2lcfdc0m7HvvVKrjZl35ewqCEeVf+NVdOs27AqDmeuIoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719900114; c=relaxed/simple;
	bh=xcSQiVNOMATEXEpewV4rKAkfpC7Es+uQVI1OXvCfdSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lmcHoAesSpgHqH4HcCvRAuWpwC2ooDf653LiGmxc2usL27pFngnb3YCfBROY4sHYKVubDQpB1c+xIVxS1dBH1lLgQ6EDYgx81zlzhBM+kAv6PS+ouhqyi/742jfUUfoAql2f01oJnDuDyeO3bm5i07yldtSiw0P6IYFyLtrNdAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=L7vC1fK5; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4WCsk800Mwz9tCm;
	Tue,  2 Jul 2024 06:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1719900112; bh=xcSQiVNOMATEXEpewV4rKAkfpC7Es+uQVI1OXvCfdSs=;
	h=From:Date:Subject:To:Cc:From;
	b=L7vC1fK5z/bNPFDADUtNi/2HsHiRSXQ5l/nCXi1INv5MxJQTTwIvOmtCwCGG/s74L
	 CtLAmzcX2U2xtn59L4Y263H0uececU0eG+9MeJljSXZ2z+OmoqDkuz9cZGb3NGVewD
	 HdWbuC9XbBRtNW/+GS7qySGh5lUzUzDttL1EfdQA=
X-Riseup-User-ID: 03BF26FFB56FD71EFBC1F986A0C6E788064EFC6FD312FAC9CB199716DF497863
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WCsjt025dzJrSk;
	Tue,  2 Jul 2024 06:01:37 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Date: Tue, 02 Jul 2024 13:01:19 +0700
Subject: [PATCH v3] arm64: dts: qcom: qrb4210-rb2: Correct max current draw
 for VBUS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240702-qrd4210rb2-vbus-volt-v3-1-fbd24661eec4@riseup.net>
X-B4-Tracking: v=1; b=H4sIAK6Xg2YC/43NQQ6CMBCF4auQrh3TDoU2rryHcUFLkUkM6BQaD
 eHuFnaudPm/ZL5ZRAxMIYpTsQgOiSKNQ47yUAjfN8MtALW5BUrU0kgFT241KskOIbk5QhrvE1h
 EU2tvfOcbkU8fHDp67ezlmrunOI383r8kta0/wKRAQeVl3dmysrqsz0wxzI/jECaxiQn/UTArz
 jjfYmOst+5LWdf1A1oRinX/AAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dang Huynh <danct12@riseup.net>

According to downstream sources, maximum current for PMI632 VBUS
is 1A.

Taken from msm-4.19 (631561973a034e46ccacd0e53ef65d13a40d87a4)
Line 685-687 in drivers/power/supply/qcom/qpnp-smb5.c

Fixes: a06a2f12f9e2 ("arm64: dts: qcom: qrb4210-rb2: enable USB-C port handling")
Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: Dang Huynh <danct12@riseup.net>
---
In previous patch series, there's a suggestion to correct maximum
current for PMI632 VBUS.

Unfortunately it didn't make it and probably forgotten.

Link to the suggestion mentioned:
https://lore.kernel.org/linux-arm-msm/CYMDEAJZ0TJK.K31XZB3E9QOG@fairphone.com/

Signed-off-by: Dang Huynh <danct12@riseup.net>
----
Changes in v3:
- Fixed wrong usage of electrical units.
- Link to v2: https://lore.kernel.org/r/20240701-qrd4210rb2-vbus-volt-v2-1-b7bcd2a78c8b@riseup.net

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


