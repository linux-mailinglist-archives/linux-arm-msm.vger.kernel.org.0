Return-Path: <linux-arm-msm+bounces-108288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIQbLQh2C2oZIAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 22:26:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DCE5735EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 22:26:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66B9C3072D7C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 20:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 328C5392837;
	Mon, 18 May 2026 20:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DhHbnNes"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4AB3932CE
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 20:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779135797; cv=none; b=CIbDk32s59Hs7d6Vf8pRuhhew4cov0S7b0+7nlO2uaCu7XJgd7CuICJF0oEEutmcPmqevlcp7WRtQMiTSmueBC649o0eel0M8GzfSxthyJEaHg0xfXSUBt3dkDuwXzUiEnas0sFNtmVsdfEkgCDDLnMDfxAu9v/NbfbuFgxW9GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779135797; c=relaxed/simple;
	bh=TYdy6nuGg2H6DLqJvqnXf3NKbUg3XykFU/TUZ5CEuWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BdvwwD3tRdAOLDOUDrHigYWljyaJpqNMAU3c1evV/isT51iZQEGnz9CY6QOMV2dACozzZMRferHTIREoE7TBsd9PXy8u9I6IuBEnwf0PkwI3bqrtS3V5LORxDfeSfk7R/kDMUpGp6z+z09VkSZWTME2WctIRE9Q9pAJYGmrtkrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DhHbnNes; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38e84ed22bdso34752351fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779135794; x=1779740594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7MgMydFIuv/r1d4/vML1sQi26pQ+VbIk3AiQmKgmmE=;
        b=DhHbnNesJe2+EWPYUwyEinfP/Kg5FxHd6NLWVezExRXTBICvlq8xhfcts/6OUdR7fo
         mXo/TsfgiWmX/z9bivqz7LiKH9Xjv1dyHqJ0zHNXt5pJ7+QvdP2UskWeMxnCgdYFKjEU
         rSXn9xDp1i1zxJ7E0AZd+DgLraEqrh/GOFZ8Zc0rHCD+a0ual9Mt54U6ZfTlu9g7lQUZ
         iQ3znw2kp1rSCDIrtmjOKB9EtWuxi6v329Fi/f54fF0oWX1Ut5PVluBZY0s22aOB1gWd
         bPKbDg7gxsSDXJL2NMb8QlwyColEUmZhu03YqFmZTazKJ96L8RfDCt3P7dLJDwCwVls6
         FMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779135794; x=1779740594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V7MgMydFIuv/r1d4/vML1sQi26pQ+VbIk3AiQmKgmmE=;
        b=V71Fgwpv8uL+k6rEXhMael/VQxkVB3Cwnw2u2jsJkdgeKpDsv8Fbz0eFCn9G5/vs5H
         mjowcVSFiJ66LmxGwUWyE5Ow8hrqgXGU8Xnfe9h1sjI9LwHXDeSS+IxE5Y+hqs6O4IOK
         TbLokWROwS2myPNQo4assjfXNT8SiFTP/bqjwJIT8dyUob01qb5Hq2PSFo/C7ctE1Rlw
         UftqYFncH/2hu785RpnEgruQcYYC8OfiqRbIyuTfmyv21Wgq/TF0nNE2txZwYpeowmke
         kcDNHKvlfUEswHuZ4Tsr7L4/47BixEDeYjgSN6xB99xM7ELc7dgHHF327UKwgTeOaH9t
         Qu5Q==
X-Gm-Message-State: AOJu0YwX4HS2Z9ep9aMAQ4RNnNY4AHlW3XAEAyy6LFIKevidg+HGgqYj
	MI3UoO4EsBcLjIGhAYSRllE7QAFGNTUaZvfowKiSHXTL92WTRFCKz1iZIooxm0TQzTGerw==
X-Gm-Gg: Acq92OEGNCOKDFhs8VQzCtT3JC+gZyahkfCFwUk5H/NMgvxGQyraP7fKv0wTDB+84C6
	AkYrxAkPKtOOZ4AC5rwbuk8QTqRcaggtbD6T9GSo9b6kBYTTHWYLRDGdw5f8gC64pp3gyVuxIC/
	By0CfCSsktufA8R64lnBCYLy8ZGmuDDNnyPGBGtRkt7cZ9ZFC5yW4b2tHAJz1890SDpE1h5UN5g
	oF+G3vRxPe3K9kgnMTcKRDqzF/tAI2bh+dDy234OZV+oaXEp9EZ9r6nrezEYmk3ZK+CeDcdAbp5
	goil3pPhTkgegOtRRBQdfS7uNcJ+AamD00GhMVa4pX9vcwEzVNq88DPJicgDxHw/q5IqgAfDhjD
	eHPs0WW9PG7+R8Y5maM7IE/3sVdeN+vtPj5tUu13RXc/8v/K8I5i4k2/BfBpmCDeBmd81a4p+jz
	QvVveoV3LUTqRxAEdkBcnYjDTI51l/IxH4GFgmn5Wk
X-Received: by 2002:a2e:3318:0:b0:393:a145:54f3 with SMTP id 38308e7fff4ca-39561d62df2mr40726251fa.15.1779135793502;
        Mon, 18 May 2026 13:23:13 -0700 (PDT)
Received: from localhost.localdomain ([90.157.113.57])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395887b42f8sm15225061fa.36.2026.05.18.13.23.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 May 2026 13:23:12 -0700 (PDT)
From: taygoth <taygoth@gmail.com>
To: linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Casey Connolly <casey.connolly@linaro.org>
Subject: [PATCH 5/6] arm64: dts: qcom: sdm845-oneplus-common: enable USB Type-C role switching
Date: Tue, 19 May 2026 01:22:50 +0500
Message-ID: <ba3804796cc651aa281deab49234ca52cfdd3696.1779127507.git.taygoth@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1779127507.git.taygoth@gmail.com>
References: <cover.1779127507.git.taygoth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,quicinc.com,linuxfoundation.org,linux.intel.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-108288-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taygoth@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.0:email]
X-Rspamd-Queue-Id: B1DCE5735EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable the PMI8998 Type-C controller and USB OTG VBUS regulator so the
OnePlus 6 and OnePlus 6T can dynamically switch between USB peripheral
and host roles depending on the connected cable, instead of being
locked to peripheral mode at boot.

The dwc3 controller is moved from dr_mode = "peripheral" to "otg" and
gains a usb-role-switch property. The existing usb_1_dwc3_hs endpoint
declared in sdm845.dtsi has its remote-endpoint pointed at the new
pmi8998 Type-C connector subnode. The maximum-speed override is no
longer required because role switching infrastructure handles speed
negotiation through the usb-c-connector.

The VBUS regulator current limits (500 mA - 1.5 A) match the boost
converter capability noted in the downstream qpnp-smb2 charger config.

Signed-off-by: taygoth <taygoth@gmail.com>
---
 .../boot/dts/qcom/sdm845-oneplus-common.dtsi  | 43 ++++++++++++++++---
 1 file changed, 36 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 6b7378cf4d49..42badc71ba6a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -606,6 +606,36 @@ &pmi8998_charger {
 	status = "okay";
 };
 
+&pmi8998_vbus {
+	regulator-min-microamp = <500000>;
+	regulator-max-microamp = <1500000>;
+	status = "okay";
+};
+
+&pmi8998_typec {
+	status = "okay";
+
+	connector {
+		compatible = "usb-c-connector";
+		label = "USB-C";
+		power-role = "dual";
+		data-role = "dual";
+		try-power-role = "sink";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				pmi8998_hs_in: endpoint {
+					remote-endpoint = <&usb_1_dwc3_hs>;
+				};
+			};
+		};
+	};
+};
+
 &pmi8998_flash {
 	status = "okay";
 
@@ -890,19 +920,18 @@ &usb_1 {
 };
 
 &usb_1_dwc3 {
-	/*
-	 * We don't have the capability to switch modes yet.
-	 */
-	dr_mode = "peripheral";
-
-	/* fastest mode for USB 2 */
-	maximum-speed = "high-speed";
+	dr_mode = "otg";
+	usb-role-switch;
 
 	/* Remove USB3 phy as it's unused on this device. */
 	phys = <&usb_1_hsphy>;
 	phy-names = "usb2-phy";
 };
 
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmi8998_hs_in>;
+};
+
 &usb_1_hsphy {
 	status = "okay";
 
-- 
2.47.3


