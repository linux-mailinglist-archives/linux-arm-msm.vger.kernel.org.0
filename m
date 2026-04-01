Return-Path: <linux-arm-msm+bounces-101208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SD2dCiKQzGnXTwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 05:25:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCDD37450E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 05:25:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36A1A313E522
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 03:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 909CC35AC36;
	Wed,  1 Apr 2026 03:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="kFE7mbMO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BFC37FF56
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 03:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775013381; cv=none; b=h/f//JDTcTS8+rKQBDkG+8MMtFjH1lvuEqSkA0t8G/sX0B8LTjOa2b67uVMhqvJEjGEFKzOHuaax9UfxZIpVFlbrSr40XvJx2CmY5P+262Jl0czNVYB/CBhEsQah/CetuDDvtXSQSlJKP0eT97euZ2rr7PnDRvTQANPEczM+jNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775013381; c=relaxed/simple;
	bh=2OZZUVrxmCnuiImJ91NAO4ZXnGPXGDfivM1k6ood+Do=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oZNNfO4VG1eCqua78qaHJv6lC2TORAcGBzvRTokUMsRKPo8sJvoD2cK1ZZGnuFXPfBGvHlW7iowgEi83kHLenJk/u78jvJ6NJ3t69j9tQsGKGcw1rSWdkmeAssBq8MmRmvWfu3GzJ8+ZdxtNTSJWlxSvW7ptICpr3B5Hm/Z9WcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=kFE7mbMO; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775013378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PzExXl/EHRF/VL3fZKD3Wfza2ZqXaYA4mFIw7BUnBQI=;
	b=kFE7mbMO6DrBN+wo6ZU7/nVvE0JCi8PGGlRaZ4oO6dkSLSJK/3LYIWIwUOWcsce0CZ2z2N
	zR4kdHhyCi+OH7ieQkn8STaJfSI9jTuF6LBZui2S2VwzR7Wr32qocmftrTIBer97P6n8EZ
	1BrFNK7HOAR/G/QkDb6f3AaYW7PjXHqLFmOBuIG9hYFfTQFfuzbw13HTQlv1zP32TSIoS9
	OFiWPYCwdDv29xS2yeExvR9dfsLfrYccjksD1ij0eWoxiUNHM7cVNrHh8a9X1PsMO4kuBC
	IiiiEErRPFgaxOD1OIv2rCYuWinWBWvcdBJXI4mevjMPfOYsTV6m/UkXazuKEA==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Tue, 31 Mar 2026 20:15:13 -0700
Subject: [PATCH v7 08/15] arm64: dts: qcom: sdm845-lg-common: Add LEDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-judyln-dts-v7-8-87217b15fefb@postmarketos.org>
References: <20260331-judyln-dts-v7-0-87217b15fefb@postmarketos.org>
In-Reply-To: <20260331-judyln-dts-v7-0-87217b15fefb@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Amir Dahan <system64fumo@tuta.io>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>, Pavel Machek <pavel@ucw.cz>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775013347; l=1385;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=34eT61AAHtgeebYRAnh4RtcK/L2H9WQuYQajrBpPHng=;
 b=Di7J3bkYj9QYrO6IC3UyyHEFwaB3c6ETk4CN4zaO+p/k+7OfdAUUknLLUwquWhYahJ6MS7Bd0
 JWaQvANHHgdA/h3IacbKCmAztzxzTRj2VivMy0KWb+pgim7Z+DZSWAk
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[postmarketos.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[postmarketos.org:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101208-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,tuta.io,gmail.com,postmarketos.org,ucw.cz,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.4:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sajattack@postmarketos.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[postmarketos.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,postmarketos.org:dkim,postmarketos.org:email,postmarketos.org:mid,tuta.io:email,ucw.cz:email,0.0.0.5:email,0.0.0.3:email]
X-Rspamd-Queue-Id: 5FCDD37450E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Amir Dahan <system64fumo@tuta.io>

Add the multicolor status LED in the phone's notch.

Signed-off-by: Amir Dahan <system64fumo@tuta.io>
Reviewed-by: Pavel Machek <pavel@ucw.cz>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 28 ++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 27221b3afb30..51cd930488a9 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -6,6 +6,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -497,6 +498,33 @@ &pm8998_resin {
 	status = "okay";
 };
 
+&pmi8998_lpg {
+	status = "okay";
+
+	multi-led {
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_STATUS;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@3 {
+			reg = <3>;
+			color = <LED_COLOR_ID_BLUE>;
+		};
+
+		led@4 {
+			reg = <4>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led@5 {
+			reg = <5>;
+			color = <LED_COLOR_ID_RED>;
+		};
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.53.0


