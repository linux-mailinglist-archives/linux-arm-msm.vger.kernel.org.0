Return-Path: <linux-arm-msm+bounces-102858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPCFJt3J22nzGgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 18:35:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5FD3E4D85
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 18:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51BB83013D6C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 16:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE2B61A3164;
	Sun, 12 Apr 2026 16:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aRFm5Fay"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995D5469D;
	Sun, 12 Apr 2026 16:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776011737; cv=none; b=Cg4BelWbMFwH1k0/9wJ9eSGiRiKp3hvZrHB9sFaSvnDQnSD80KddEvzv7W/g7ApDweDsI9V1ZmO29UTCpF48CZNloRy+lJbZQAFrxSu/l7XTXXGidhrK8xoQYYSxApYSsfA0wVZMX2rySAqRVOeK9EwxzectqFzf6L0/Vip0Zik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776011737; c=relaxed/simple;
	bh=BEm9UqjfbfI+MdhBcBdMI6LDwrMJWzpzjgmq/qWyEro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X5qYJnVAW/mGwxMJih7mqJbdIAzX/EhXVFTitTxytpHFJHXcHRVRYYB4MsoIPvEjzffj1Xy/5BPxFBvPnjrT0ddHdwDG+b3si2WV8MAX8jrqkJc+L0IsNI3gWB9iiJ+OzLfgAcphPW//aOsmhFP1zpKyG1aC/ZeooyvXdl6V4BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aRFm5Fay; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6E43CC2BCB0;
	Sun, 12 Apr 2026 16:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776011737;
	bh=BEm9UqjfbfI+MdhBcBdMI6LDwrMJWzpzjgmq/qWyEro=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aRFm5FayZJgedSKOwFX8LU0DXVtjMhtaXYlDhmpOHyKvwyHOiywkTQhspz6yEju7z
	 ThcMFa1oHJbAArLyt9gPzPA0lOfYuOc4lVy7WHvmqBWfvr2omzj4clqDAdEPLZPt7a
	 o4+QmCqOANk2u7CGXzleZxKW9qoVD9cWz4aT3BM3DNlQaUsjbBglM81IDvV5X+G4yO
	 DaXlWz4+SbqBZuTQrcInRCABJsPWSbc3nwW/SzuSbeSZp12fYFh/xwq9UGj4Avg72c
	 31kO/jzd+LiuNS//3wPOV34lgtUddNx9RxCoplSWsObQMUuL9Jz8hNUTEj49paN2C4
	 UW48eL0iha2Ow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 668DFE937ED;
	Sun, 12 Apr 2026 16:35:37 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 12 Apr 2026 18:35:37 +0200
Subject: [PATCH v3 2/2] arm64: dts: qcom: sdm845-google: Enable PMI8998
 camera flash LED
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-pixel3-camera-v3-2-e26b090a6110@ixit.cz>
References: <20260412-pixel3-camera-v3-0-e26b090a6110@ixit.cz>
In-Reply-To: <20260412-pixel3-camera-v3-0-e26b090a6110@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, 
 Richard Acayan <mailingradian@gmail.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1445; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=7WqIva9DadD3+mE9XaAACC/Zf/TxomU1o2iRVVPNDnE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp28nYNrbKrzoa5xsx6fbxZcVifQuIoxyLbLirx
 pOgU0xEEhOJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCadvJ2AAKCRBgAj/E00kg
 cmOJEACyFZ69DC7UXyxsYpnMuY1nIm1/9c8/mYNEDQ1AkBJKmfFRIZgIYkv3TShdAwkL2uHwehi
 M16tUxEqjIE36S3tVTd0G1aWsIOxo4wNPuyM9Br0mHldpVPj9eLBu5zl8DS5IRHtfGfBHP/GSFa
 Mwe9K4XpHf4jBLtxE4LuhHLdF4Sr8OSvGp91iCbpIleVQKnm7TwjY9kmi8kQl7ZTJ0b28EpRNl6
 sK0nHuhyozWK6OM+wv8WsM9K7gLJwzdMasdNA8+9UDGRYK07LsOQessFluVsfwTyvkLdWI0OErf
 dQ20knknHluMRW8I07k8ksa2Ssw3BPn5idX1VChcpKKsbmWFtVkEH1QFHmrrDnY+Q3w1f1Vtvys
 DMdw3oCOjg17Y0oXq0YHKSo+cfgC5BTdm/hX+mzvmZrMBkR5P0PketaPi60DhTjrDIzDQsP6YTt
 hCE99NKTAcXo3bSKznBu7QOK8YJ8IFN3/ZsLKqG77zvyDB1lBzRiagwMFHfG5ZSjmv+qGq44SLl
 iZGNvWWGKakOw0OHvtsCJlLT1zzGJEmg2W0y2uT1/Pg34vXFkWc0wGBNBwSlNhiik5QJh4nRVtJ
 zTXcqumg9hpSIMcnOAAJMC8zbKO9tW6DzxX/+KTbOZoFXzStC1IBFbXSTcoCwx1uV199yxKgtbT
 Y4AweDRGP7KdAKA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102858-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[protonmail.com,gmail.com,vger.kernel.org,ixit.cz,oss.qualcomm.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: EE5FD3E4D85
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

Enable the PMI8998 flash LED block and describe the white flash LED
used for the rear camera.

Configure the LED in flash mode with hardware limits matching the
original device configuration, including maximum current and timeout.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
index 070023a9813ce..e9d9842cb8674 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -596,6 +597,19 @@ &pmi8998_charger {
 	status = "okay";
 };
 
+&pmi8998_flash {
+	status = "okay";
+
+	led-1 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_WHITE>;
+		led-sources = <2>;
+		led-max-microamp = <500000>;
+		flash-max-microamp = <750000>;
+		flash-max-timeout-us = <1280000>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.53.0



