Return-Path: <linux-arm-msm+bounces-105410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDwZKuGa82kQ5QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 20:09:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8A94A6B81
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 20:09:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7A65B3007203
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 18:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0819947A0AE;
	Thu, 30 Apr 2026 18:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RGoDkEnj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36E44657DA
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 18:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777572569; cv=none; b=XXdyHivGqmzOBMsTf/vh3zbt5GC0spvo/x1xMMbLicyWGxyMubujnZgWJ6zWQofpqGe5jDW6Tx/DlZbE4xJ2X6ktBnybgXKB0oTXheQzW4+UYnC9mVDboL81NQkrrNCXLUStnMDHmLwXtt69zNE/MudBmDD6DcdzntMjUMtOyVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777572569; c=relaxed/simple;
	bh=ahOXd49CvxGz9ZeJi/DF+g0yvx3WazJQtMUYBMCZeCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jr9BgD+H93SjBsY4ikMI35CTIqz8w2N0BnjsRF9Nl9SIhxfUMOWCqUQb4MUDg1El4VOxPPUy7+5e1fExTS4GCRP1Yzzu66bgzrzRVmH8Gibhp6ZSUIbXAF+Q+45Jc15NekEHJQLaH0iv3+w9xE54/e8hG7/cvfIW5tlQBgihm+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RGoDkEnj; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8a4b8c3a30bso12118346d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 11:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777572567; x=1778177367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzDYNSmj+UyxcyQfn/KDw8OdpCfyjj2E+yxdJS6VrfQ=;
        b=RGoDkEnjBdFZIcHUuZhg5ex/5Hy9T5y9eiMSkLMTATpCFcxXhPQ69XvR3APU67aY9B
         ix8fE2zgUBfyVhm8IB5IyDOGSCN95JpPyXNUPl0j7xmqZmI/AwjjTvzY2AP/HJLMz+Zi
         6J6ipRFOjaEePO5ThSXtjsJyb1/Kbef3GjBWnb9mq8M0VPVqIscgfhaQKppPXXv9Mcod
         K7F66COj/CJoQwUrVHbV2mine+IGn/u/iDmu57dGhOhDyVRPP/yQ1jwg6I+wEMnXqtMs
         7OTZWl/UXEsAeigyBR3es74c5W0KD2bhtx8+8XX+nUEl9+4u4/AR8O8SoqJubkYYHQhu
         5mWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777572567; x=1778177367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nzDYNSmj+UyxcyQfn/KDw8OdpCfyjj2E+yxdJS6VrfQ=;
        b=EPO3pUZjLcmGccCdsag1LxPYKcFH1vCcMx9pvhrWA2ZyZRBlfgpG7jebnjpp7UdrB9
         H56G57S1OXX4v9s+sbhzaUnQkp9ws+8NgC/zuvvUQ5eGQk+of2wWvqT/au5Z3YMUVLUD
         xhKREz25H97kIqD8p+sf+QHS1zqvLn6sVp/bQrF0Sqcpa7uL53iJ7j3QbwW47GWMf1RQ
         juS2B46ARXLad/q2dcdDkl16XUT9/tXnTWfK8fOJsSgy1jahdcu8VgPkpJjqNk9pJ7Te
         t5/+Ir6DLZctOWJtwl+H7n8BlUIRkt7Vb9pR1ekfG978fidXcWFGQrZwFLGRkAYN2Tg+
         vh0Q==
X-Forwarded-Encrypted: i=1; AFNElJ+hP0NAd9EQRXVPMsPojrwv2dgldeMN3xYBANl1Ig2QTPipRalY/sHH8rXYA9UGF1pZJBEDYzVEu613gtYI@vger.kernel.org
X-Gm-Message-State: AOJu0YzaqyhL0ludZJJtR8pbcyJjFSDimhGLR8DogkvQnhM6Rj28q4nL
	dvamgInJ2e+NYyQRbYETx2WStbADzes4Pt2U1vvzPeINcLqsWlgwdBWQ
X-Gm-Gg: AeBDiet2dos6JnoBWeoJRML+JSw0PVxHN12wNUIOgp0S99EkiySR+Q2T/vPgWeW1ICI
	GwYab5I0w/0qbJthPCTdjVMjispllOwc010vrEuBDvpe3KuIxxyx463v0Iy+agMKpRtqIp5BNbF
	Cm5EaFMrvxuaFttrpImrtVa+bcECKzGDdlc3/+7K/RWKHXaU6Blx4Xuod5mzQA8khsHKaIrUX/8
	990bFzSOUq5IN6zO3uIJTejHdFcREzqo+E5vyB25BkVaV4fObw9wgRl2fOkruW/yVsP9jbm1RKw
	S0dLOty1sgR1y4BpXO316ChWz98fZNMnC5VtpTERw9XitFkIcsD+nNOhtf1R9w6Q2cY8YfaKJdT
	uS1jsei50DsDDA1b1PvbD9ixhBosYzrKjvuZ9vhKuaKbcb0qDK1sDUnwmQCeye+6p1WfE407bqG
	F0y4ycpSqep2mPlvRinbfJIw29T9v9jqXI9ETq
X-Received: by 2002:a05:6214:b6e:b0:8ac:a4f2:69d7 with SMTP id 6a1803df08f44-8b3fe733bd2mr65212836d6.14.1777572567556;
        Thu, 30 Apr 2026 11:09:27 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ff301ba6sm24911646d6.1.2026.04.30.11.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 11:09:27 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v13 2/3] arm64: dts: qcom: sdm670: add camera mclk pins
Date: Thu, 30 Apr 2026 14:10:00 -0400
Message-ID: <20260430181001.9256-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430181001.9256-1-mailingradian@gmail.com>
References: <20260430181001.9256-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AC8A94A6B81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org,collabora.com,ixit.cz];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-105410-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_PROHIBIT(0.00)[0.51.225.64:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ixit.cz:email,linaro.org:email]

The camera subsystem is added for the SoC common devicetree, but the
mclk pins should also be common across the SoC. Add the mclk pins for
the cameras.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Link: https://lore.kernel.org/r/5135823c-f2e4-4873-9e3a-9d190cac0113@oss.qualcomm.com
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Reviewed-by: David Heidelberg <david@ixit.cz>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 1613c66f92b3..e13ced9479b7 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1207,6 +1207,34 @@ tlmm: pinctrl@3400000 {
 			gpio-ranges = <&tlmm 0 0 151>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio13";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio14";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio15";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio16";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_default: cci0-default-state {
 				pins = "gpio17", "gpio18";
 				function = "cci_i2c";
-- 
2.54.0


