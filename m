Return-Path: <linux-arm-msm+bounces-101648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBdhAKDHz2kS0gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 15:58:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F21A394CCB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 15:58:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B8873080D5F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 13:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D79233ACF18;
	Fri,  3 Apr 2026 13:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="KrQYnLGJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AAE38BF7A
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 13:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224526; cv=none; b=in3c4Y/qIxQgL9bsZB1/VFnuRQiSWXBkmPaQ6kwGLs8sTzVATtlhqO3b+U+jnwMHQskRB6Yf5jBqQwlQBZJL9mzbr+1ITF65EV+BI3wtra8CinEmyyLQE32AacFAxwYoWA4WK9FIpHVsJdDD89/e+qjdg5jKNzYTcU5G4Ab/+7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224526; c=relaxed/simple;
	bh=0tNxjU9iZ5aS9yMEJ2ytUcRE8/Wq0mJ0XVTDTTRdWIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mhbvgx4yVyTSos4Dgl0Lf+dHQEv1C2aZLyJLD5AlZ57AgsoLqaaJgSJDwUaCUpyf20LHgogdtIC/7bS+KIgmssz32oPJJdHpAnw/hrFIIWkzTaHqwPyToxdzHnMBJUPfNYB3Ic5ldg8Sw+JoLeerSNvwWT/hxGnGnXCfYUi3btI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=KrQYnLGJ; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b9c04152730so292108266b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 06:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775224520; x=1775829320; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JUIw5PfzjSbRelAWl0scbWA1aw6NDc9ZPR21LqC1P6U=;
        b=KrQYnLGJl8pxYlKkbPv9GaBQcgH7Y7ofkMb1Pw3P+0GjxqB5fvtUWPGvcZwiAFnCs0
         DuLXU+rRbGOsMHYMSnNB6rrP5f3ztFFAl3iLLx6oSj8/1O9h8eGTIEdHl0B5C4W/Uhm3
         6I27KiVMYAjLJMGvJhYYXHdbw75LlDzYO/zeMbFylWp/9lCJm7owH97i7ZqzFfEPwIPH
         gBa4Z0c30OoUTPGg0ZP0kd5pvVulkGg+lEF26Tfu0ZrPyoCrr9iSCS9oh4DYN01eC77H
         hxDPbYoH0BI0fWsdLzyxKvvugvkw61/i90HJFzPa/Xj527crC33BOwt1A+slwaxsLiE/
         COVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775224520; x=1775829320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JUIw5PfzjSbRelAWl0scbWA1aw6NDc9ZPR21LqC1P6U=;
        b=d6RQ3zvjFcPO0ZcEljvlaVkFZVUDHQgksrULGbiao64vgO96LJY7DaqPUSTeIfC5Cg
         hxYaYJ5CWhoXEgRpDNvsyXJGiSeqI0g4iqGcF6BIT+LeFidXalDoOdQgA7xGZ2WquJo+
         44gNmdpEXKoCgrvzSwQDijuK1QCyEgFyKjAdNS6o3rQwqym8NOwbCmic+jUG9NxQvZXA
         M1Q5vRaOJjaUVQnT9tt+l/Vg7fZNV486xcjvUIajnBtvS8INm6NTvvNsWaVyrSXz0nsG
         pGN7DRtPfsouAtF8SpX1b6QgqZf/OAQwva4XqnQMRouWm2Cx8s347Mn1AO2xx008qgEo
         esEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQYLPgj+Jj6V0Wjj5vnPcvC8JfAwC1NHjJKUUGDJclbLn9CWOj7SFoqVsK8FXBWlT06rguFFk9+n4U+Cso@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5jGUJ3dI3wGyHqN5gcIeP3qv5zVPX+EBNKT+MB5Uhzagp9hxt
	KiWWAwU6AKKCTc1Uq9ERNp2Z3+/lrgbj8ywUgB67X6ADnAU9mMCsTYCgk4ypjyMwvZw=
X-Gm-Gg: AeBDiet6PBxFTmnUIcJdxnS/eLwfwtbfPKVGpOZ6K8QXUYZjWAOe9ha+5Rx/jP3KZnI
	62pQupH3FdphGSi02Y/HspO9pIVE7Rh8I1yVDnQIn7SgasIZDZNdOKTS3Rg/7jRhNG+eoKgHrIw
	z7jzrV7koS9yfhiecqdfFL7QzFcbpb/KzHNwi2yPayhK0trf7pa4TifNMwnjQedrp1N91fI4OnE
	AiSqypmYSxbyndKvSwMFZcVRwNgASIK9umghj3t4PgWJ4BEudE5XY8rQ/4Ed6oBc0JZFsW8+VmF
	PJ2LXfvwvLIcXiO4kPJ4EwZLfHGVZjisV/m857sUEn8CE7UlkeSR3m+OZwPiU/THcCaUqeh/+mW
	da7ezVht1NGG9qxlinKjGC9nq2oIa522jEdCcnKbZvRIUg3/nIjpmAbNXha7gu0NG/ePHNpv6Z0
	UsV8ej5eD5ojM/FClJTuSY5Mavuu1MUUGdOek1myK9RfP1xy/wQuZ1X82VW8G+O0xZtDNpE8tOc
	f8qJFtlcVwaNpD6vXNuIPAhAWuhrIiCNe1E0A==
X-Received: by 2002:a17:907:9711:b0:b96:e593:fd1e with SMTP id a640c23a62f3a-b9c66e5e2cemr156799566b.0.1775224520390;
        Fri, 03 Apr 2026 06:55:20 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c972e28sm198057266b.1.2026.04.03.06.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:55:20 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 15:52:50 +0200
Subject: [PATCH v2 4/7] arm64: dts: qcom: milos: Split up uart11 pinctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-fp6-bt-wifi-v2-4-393322b27c5f@fairphone.com>
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <AKoskovich@pm.me>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Jeff Johnson <jjohnson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775224512; l=1487;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=0tNxjU9iZ5aS9yMEJ2ytUcRE8/Wq0mJ0XVTDTTRdWIM=;
 b=/YToNUqYXJRAKqxJIRr0r/cZTobsLFymsg/TVbH46bVWMTHSJdm7XRvdUpgk256TWrcMjxZzR
 nOrivC7LfVFCc3S9aQe2Xi11CK1Ror8u934bOVKDYcB1HNT8BXOHYGt
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,pm.me,gmail.com,holtmann.org,quicinc.com,sipsolutions.net];
	TAGGED_FROM(0.00)[bounces-101648-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 4F21A394CCB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In order to set the pinctrl for the individual CTS, RTS, TX and RX pins,
split up the pinctrl configuration into 4 nodes so that boards can set
some properties separately.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 4a64a98a434b..71292dfd6e08 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -2099,19 +2099,27 @@ qup_i2c7_data_clk: qup-i2c7-data-clk-state {
 			};
 
 			qup_uart11_cts_rts: qup-uart11-cts-rts-state {
-				/* CTS, RTS */
-				pins = "gpio48", "gpio49";
-				function = "qup1_se4";
-				drive-strength = <2>;
-				bias-pull-down;
+				qup_uart11_cts: cts-pins {
+					pins = "gpio48";
+					function = "qup1_se4";
+				};
+
+				qup_uart11_rts: rts-pins {
+					pins = "gpio49";
+					function = "qup1_se4";
+				};
 			};
 
 			qup_uart11_default: qup-uart11-default-state {
-				/* TX, RX */
-				pins = "gpio50", "gpio51";
-				function = "qup1_se4";
-				drive-strength = <2>;
-				bias-pull-up;
+				qup_uart11_tx: tx-pins {
+					pins = "gpio50";
+					function = "qup1_se4";
+				};
+
+				qup_uart11_rx: rx-pins {
+					pins = "gpio51";
+					function = "qup1_se4";
+				};
 			};
 
 			sdc2_default: sdc2-default-state {

-- 
2.53.0


