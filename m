Return-Path: <linux-arm-msm+bounces-54481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB292A8B4E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 11:14:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F8211900174
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 09:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEAED233150;
	Wed, 16 Apr 2025 09:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j7USmwKg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10CD22FF39;
	Wed, 16 Apr 2025 09:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744794834; cv=none; b=VKPQ4CzHhhbP84dMAhSBZmbZXJ2C/iPAQSV/KB6kTeN0GgWpivyxyHjyqCajXAddNfuv4ZdnavUf5n1i0mkhh4lFMxWNyolkTyNWP5nEUGqAjVwowWSsNx86uScm3oTmeDZ/c2oWIuKrgxy08bmVp74reSBRT38GLDQbPSI4geU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744794834; c=relaxed/simple;
	bh=G0pJXcxyvKvuX1LUdA5knQfDY/cT7eAL7Lg5VL7BCpY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VIQsjTKxdY7MCNh064nhvRaw5o8NESMLFr681SSnPU5lgUdwC1ERv/YkxOvC6iJpbr68R7CXQbRr8bbjBpJ/U4wf0Egna8TIjtb1ou8RAs6R4Hsy1G7/LaBrbD9/0AC9qaFsNQ1lOXtlVOJSe95nvgXJkpTQMCKAxMvcd1PwWvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j7USmwKg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 32B50C4CEE2;
	Wed, 16 Apr 2025 09:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744794834;
	bh=G0pJXcxyvKvuX1LUdA5knQfDY/cT7eAL7Lg5VL7BCpY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=j7USmwKgRYbK8H92Ld8zTuevoFMrCS0yz4Geut3KXUftvEo9AnyJ/TbSdjq4yTnhu
	 XxVbYJQu63DxuOFbBJJabADV6qaJTCZIGzHgrvrlROG9O676JV8l6Isrv4JCejbkhY
	 TnoQx2NZlzybzoNxntJfJM1zS5zSXC7ZcgsXjPRVqlpNcDDH/eI39Tn3J4v8t4G/8a
	 VBF0lP8aO/5Q490rqV+2Lll/gw7exkolbzZ1265UkE6w9gvxGOtC4xM6qzfrY9MP4J
	 Pm43/S+m9m9l3v+V6jRlVlBmGlhlEWSac12AqtQw8U8ckEnE1qi6dDaMr3jR7l2djH
	 At31ei5dsJAow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 276BBC369B1;
	Wed, 16 Apr 2025 09:13:54 +0000 (UTC)
From: Juerg Haefliger via B4 Relay <devnull+juerg.haefliger.canonical.com@kernel.org>
Date: Wed, 16 Apr 2025 11:13:35 +0200
Subject: [PATCH] arm64: dts: qcom: x1e80100-hp-omnibook-x14: Remove invalid
 bt-en-sleep node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-fix-omnibook-dts-v1-1-2409220a7c6f@canonical.com>
X-B4-Tracking: v=1; b=H4sIAL50/2cC/x2MQQqAIBAAvyJ7bkHFpPpKdLDaaok0NCII/550H
 JiZFxJFpgSdeCHSzYmDL6AqAdPm/ErIc2HQUtfSKIsLPxgOz2MIO85XwtZM2rXamsbWULIzUnH
 +ZT/k/AFPOfxUYgAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Juerg Haefliger <juerg.haefliger@canonical.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1564;
 i=juerg.haefliger@canonical.com; h=from:subject:message-id;
 bh=ghuP4WA9I34RJPerKbhGPvLIaYpn+6TGHXDyTAaAGtI=;
 b=owEBbQKS/ZANAwAKAQ/TiwkLpkK3AcsmYgBn/3TQMO+HEhY/5tu1QCR/ulQ3RWR1SmWv5FAFy
 8RdKsTNzJyJAjMEAAEKAB0WIQSFl9T3oi6mu+It14sP04sJC6ZCtwUCZ/900AAKCRAP04sJC6ZC
 tyZnEACvj5pe+h/WGp0qT12bYG9YMSWrjbdU8Jx1AGK1ZbbVmyqpDlE15/R1zvZLskuliMowKv2
 Zv76nCWn7UML5e0miuYKwe+dhyreHi3ufBpuMdJAKkBSYyMQhpr96dg0oVnQGJs1j8mDiAY/Ujs
 uv6+TbqiSqrB0xumlfj9UdICUsquVcdL/t2VtgmHpD/Jg/DLXI00wFJlbmpTDs2ltyDaHffqMTv
 LYErbOQjHaQmfwhwAzd4e/2rX/x6YWOyfiv4UbTVfXMjEOVsdwPXM9dZPohirqzmmjfWCU36cv9
 AfXkvor0OyyvPcySMtwmWy2HHElwTENgc8LMNNDZk+AcpQTGQ2Pf8FRqTzTe1HkXo5qZ3pbLekA
 2O+PE0l6Ut/Ugb2gDGlWRTdKF2YNXVDkq0wmC2OYvkDxy4/Vm1okVQJsczAJ4A7O28Iw1c2tybu
 Ld8R2nFT4zdryKb0wNRZdUJcwvNR9POnDXnNo5oX4GWhri4YlVMKcaOL2e2PHFpbRsVrV4uedet
 hseWMNQIbz0w+d/sQ1ZtNGeqx8Utb71G6fU1QvMCqD9v1VxLctCa5Fdo3xAo58qj3phDVwz42L5
 0rN9HVNcBYCoHnkl7agsKX6jX6qs1FTwukrSVBbYivX9fYP5fB7B7Tm3jAjvU4zNwlUgYbIR12A
 KIG9ELv5CIUh/5g==
X-Developer-Key: i=juerg.haefliger@canonical.com; a=openpgp;
 fpr=52B5BDD2A6EDC76A0FE0AB4A754C3A96F9F8B48C
X-Endpoint-Received: by B4 Relay for juerg.haefliger@canonical.com/default
 with auth_id=381
X-Original-From: Juerg Haefliger <juerg.haefliger@canonical.com>
Reply-To: juerg.haefliger@canonical.com

From: Juerg Haefliger <juerg.haefliger@canonical.com>

Remove the invalid bt-en-sleep node. Not sure how it came into existence
but it seems the functionality is covered by the wcn-wlan-bt-en-state node:

	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
		pins = "gpio116", "gpio117";
		function = "gpio";
		drive-strength = <2>;
		bias-disable;
	};

This fixes the following warning:

arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: pinctrl@f100000: Unevaluated properties are not allowed ('bt-en-sleep' was unexpected)
        from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tlmm.yaml#

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
index cd860a246c45..2203abef36b5 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
@@ -1425,14 +1425,6 @@ &tlmm {
 			       <72 2>, /* Secure EC I2C connection (?) */
 			       <238 1>; /* UFS Reset */
 
-	bt_en_default: bt-en-sleep {
-		pins = "gpio116";
-		function = "gpio";
-		output-low;
-		bias-disable;
-		drive-strength = <16>;
-	};
-
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

---
base-commit: 1a1d569a75f3ab2923cb62daf356d102e4df2b86
change-id: 20250416-fix-omnibook-dts-94c2a9264865

Best regards,
-- 
Juerg Haefliger <juerg.haefliger@canonical.com>



