Return-Path: <linux-arm-msm+bounces-112925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FwZLB/DlK2pUHQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 12:56:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF12678D26
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 12:56:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=fairphone.com header.s=fair header.b=bSSBHPbS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112925-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112925-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=fairphone.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 801E23016DB7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 10:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A909738B14C;
	Fri, 12 Jun 2026 10:56:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0933B38B140
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 10:56:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781261767; cv=none; b=Ik3Y9ahDBOUb6RNyskl3pWH2mNIctBRsoZsOmGxeFYCnrpTevIcIrQgSGP+UtTSz5K22H+LGXSgeoNQvQW3r8L7uFzrehTN420bVUrcW/7/8mBDBzdkmbdsRCbNrY1g+8Wz1YkkR9vWBLUafV0+ChrdcMEBdWrkITi/ypyFDU9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781261767; c=relaxed/simple;
	bh=S/OHGyWk5LV2U9rbhDbzhVoexTBv/UEfi50dRxV4F04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u9piEUMZoJW8N39KkJMDklSebEwjxoE71EbbDUhpEtJe9LH0pCoEn01k91OMVRIqNyo8PYfZ2Ar2XPOWdM+k6fFXqn71zhyM3Gg+b2k2tvP4Mr/IoDKVNPAZJpaC9KtYWz+TrEea0Z4HHsnGQotAErb5utqW+p0I//N8eRhudhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=bSSBHPbS; arc=none smtp.client-ip=209.85.218.47
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bec3f69d343so127120066b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 03:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1781261763; x=1781866563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3GED/bZKxrj+cOmGbidsM9t/QHR2Y/ZoMvrWHOWRa/Y=;
        b=bSSBHPbSJtlhxc1qw5Y5n4x7cGddhIslOBngyC7729CTQR8j7XAJOXYhgszsM4O94N
         XGZggM8FQxtFicLRhX6+gmhhhziym+jNwsJsDhyz7y1VhmWXcB+s7iUai3r1otj8UuuK
         hUqhxtw0pmp+RfZzV15b7Y1XrrTjWLE+vLgwEgCEebErXiu4SsoXAP9gTKVG11YPSyH+
         vrWO+2SdhWJjSTC5xUSCJAOSUJntef7Fpqh4CFaFiZyl5GQGYyBLscOkISfAsqx1pVbH
         dk2JPq5f3tZysQtGLxMYVKzZ4e5qM7xPhrB3SreI+rc3LvfW5w5U7SNuAItIfXVPssic
         xm4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781261763; x=1781866563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3GED/bZKxrj+cOmGbidsM9t/QHR2Y/ZoMvrWHOWRa/Y=;
        b=nU4QQkuBXtZBcJIuxsCXIWK8UH9Fmd51QMK7oEhjw7D+2BIgViGRNhN1of2Dqf9kt3
         nlC8BrfXORZx2EnJEzMz0rB5m30j+4bBJ6ixuJ8usBAG4u+wkuIqqF6KToJSgznm8kvQ
         ixDFy48v2yOn+MK9KNkAy0TWFjr6dxP2PNbKUnvICa/6qoKDXlKgMbdYkQ8J96d0bdTO
         Mz4+RoLoOVNEGqON6PJO7AICyM/PfUL3vYie3qZHE4NNBQCzukKm1teougKBPKr1M92r
         +0WcbaF7mRKKx51l/8K54A8d3mArYXvJman/b7mQZtkOOxzM+dXeYQZlNoYUyJePUT2r
         cVvg==
X-Forwarded-Encrypted: i=1; AFNElJ/R8/PaisF0Kw1NiKlAVF3ZnDnV0hJDVaDw4g/vDjGyc8ucAdNoc0NaPT6G073iCBG4XWjz/8gBYktspuNw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2HsO0qMVrymj9PImwda4kMw4gWs4C5pRrKMq04bqwxW94Lcxr
	5c/BWtpg/BS+hX4nAkaI0SchRnwqxvSt38yuL/S0tIYHOuzJDItD2NjkSzlvMzReB0E=
X-Gm-Gg: Acq92OFFmkAa67XPi2e+ui3f0ex+cZc5sPBfp8BXesZyju2c8kufIDeqqusvFmLMDjJ
	Y+BS88zXLzorBozMdUIS12dJP8oT0qbuFPnNXere6hXdWhTb08zIKHHjOcqBXv3i58aUZRZzAYM
	vliXBf3/yoy3KG9TG9GxmQPlE4DqTxbw1A0mpciLmGAe2bcZJBZXMZ6kHDH1nW3LaQ6nbqwvxBu
	dFnv8B3rMihvL/3eKC7/rIvilVl5UuIK2Cw2JzXOwl+QEf9C/1uyo9unpw41LcSyWMXNCcZaJ3v
	LaJGmudhXZkyll1tb3Ute3tjwslVthfyH1/oeo2vi0VtxB7SaAZWa0ELD9GqzZA29smvFU/idcu
	j1ZdAGUyc2z5ipE5+FICEh7XOnRZ5YV+unc76Ifw6mILDyIZ+OnrFFitFdGcMJxjae40WUE5Xsx
	bwXS4xdmahcqNM+3d2sEFb6D/wkOA9+Sy2k48lCYiyMV5aDuUiNyjDB8E4a5EPoTOp0Lc/ptha5
	9nkLGti8deIzvbE37qh0PBrng+sFrkcTDGe4TnchA/zcojI
X-Received: by 2002:a17:907:2666:b0:bec:fd3d:4072 with SMTP id a640c23a62f3a-bfe2aa00d74mr64211766b.35.1781261763397;
        Fri, 12 Jun 2026 03:56:03 -0700 (PDT)
Received: from [192.168.178.182] (2001-1c00-3b89-c600-b4d0-bc9f-f60e-913a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:b4d0:bc9f:f60e:913a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb8b23f8fsm91583266b.53.2026.06.12.03.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 03:56:03 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 12 Jun 2026 12:55:52 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: kodiak: Add camera mclk pinctrl
 definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-kodiak-cam-mclk-v1-2-fd294ff003a2@fairphone.com>
References: <20260612-kodiak-cam-mclk-v1-0-fd294ff003a2@fairphone.com>
In-Reply-To: <20260612-kodiak-cam-mclk-v1-0-fd294ff003a2@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781261761; l=1957;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=S/OHGyWk5LV2U9rbhDbzhVoexTBv/UEfi50dRxV4F04=;
 b=FdrlD65Tt+jQROey8o9bfFEL+Xrzd4VXeXPMORyYvZw1uA6y16rBv7K1/M3qepAm6F6n5WgYQ
 B31+8R+lEdyA2f3DOrsHLDGMCHb61spniDoyjLIUdnEgCYGV7XHSw4E
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112925-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luca.weiss@fairphone.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,fairphone.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2EF12678D26

On different boards the cameras are connected to different pins with the
cam_mclk function. Add the definitions so that mclk0-5 are covered.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 62daef726d32..903937947811 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -6505,6 +6505,27 @@ qup_uart15_rx: qup-uart15-rx-state {
 				function = "qup17";
 			};
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio64";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio65";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio66";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cam_mclk3_default: cam-mclk3-default-state {
 				pins = "gpio67";
 				function = "cam_mclk";
@@ -6512,6 +6533,13 @@ cam_mclk3_default: cam-mclk3-default-state {
 				bias-disable;
 			};
 
+			cam_mclk4_default: cam-mclk4-default-state {
+				pins = "gpio68";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_default: cci0-default-state {
 				pins = "gpio69", "gpio70";
 				function = "cci_i2c";
@@ -6578,6 +6606,13 @@ pcie0_clkreq_n: pcie0-clkreq-n-state {
 				function = "pcie0_clkreqn";
 			};
 
+			cam_mclk5_default: cam-mclk5-default-state {
+				pins = "gpio93";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			mi2s0_mclk: mi2s0-mclk-state {
 				pins = "gpio96";
 				function = "pri_mi2s";

-- 
2.54.0


