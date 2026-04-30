Return-Path: <linux-arm-msm+bounces-105294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AeoLiAB82lswgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 09:13:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 566B849E75F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 09:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B06EB305DB85
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 07:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7D1B39EF15;
	Thu, 30 Apr 2026 07:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="4kIU7Are"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E374F3988E5
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 07:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777533059; cv=none; b=IRYAW1B2vkKg5iyX0aWq9ApBEtGYvWM0M0671fXj9xYaWsTWjBYQhDhDbUHBpVqwJ2ZqeQIUZf34RYGnsm66ek6BeX7C0N1N0rSkUS7UR0coWwDN0xSpcdH0eEMwF5JteXMR5cO+Rxkrlf1quHyunb8vapTcCbo7CDdE9PYf3P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777533059; c=relaxed/simple;
	bh=xA+JyyhoD+6cuOWQwY5YNIB4x5Pz3Kxm/8/MqUktfKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qp3mOYFsc685wgYrXybB/FNG5TyzdGAsR2IIQoLMVBXj1dsKKgXieozyaAHqTIpZglf9fgmjPV9FLBabCjRIfNxpRXdGhSxpxpfa2WF/X6npo9yywWALz+Z4GbqligyDIuHiAVw7S1R1zArVMt646pxvRdaTYU3b5e8rRNGj9gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=4kIU7Are; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so5082155e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 00:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777533055; x=1778137855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s/a28fcWAgOrJO1VSx976gpf9GAOotGbvaSHKVCrmZw=;
        b=4kIU7AreGm6O1JzvvJM63qjYgVePyADXOXeTWwy9RAKOT81adXsQpEy7aVFpczBH+q
         asEBPpbiLBKksjH9JzfKwP3EQIaB9ZxeN0qvm/sjX87N6kqKUfM3M8Yue6dV/rv4NmHq
         lyHhhOmvx+6aEBzHl7PYfrYmgBFKrvOfBNvYxcDVN5nucel2+JH7ZvHFPAJMChswACcX
         a455WdBCZocStJ94f4BiUjxyRygP4c4mw4HwQ++fVFcOXENEj50/tQq4CaB0Z/rsn/Sv
         xleTKgmA4XQRGdfbG8i1+VcNLOVoOHSqGgVOZJv7pYMoLdfrvizsgPIMDYIkIIIPLbP3
         uGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777533055; x=1778137855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s/a28fcWAgOrJO1VSx976gpf9GAOotGbvaSHKVCrmZw=;
        b=Cyo1npr99B+dkea1ExJzctbdJBUPaf04MTPLhpQ5Pd01C7f2XKV2FRnn4j1Gmox7wn
         pIUEJMS1Y7gvEOplitUKQ30ZhuUll6Qe6/O9gHYDZDZ88amzDlbkW3X+pA9IFrrWezkP
         Te6sMti9BJddxi2uiaLLUly4naQ7Ludl3ssZAAHujqESWYHU/GBDt8JCSsbyp/KeWJ6I
         9/P91H+LHX9hvP8QwLCzCIXOkcb4/eyo5v/XidiCAehUwJ5MbIvfj4TPUzJPwxbkC32L
         eSToOnP3wgVtOHpTM2qfGucfbAK3bF6bFHVyjrNf135uUQ5d14748/dQm61XFNPj0y48
         bDOw==
X-Forwarded-Encrypted: i=1; AFNElJ+DJiWukJzO6MQ5LkQlyPNYTVy88PBMoRFb7nDuZzdrzX7c/rThgfYLgHSEHfn/XRLx50auppOIjjERcZKQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzsvreGJUYFvLgh5AL8srOJJ2Qixl4/WjqZVIxmthtGxuUSFYgx
	X6pdVIfjtQWcsBSEJxXKVaYN6qk1ZNZtsVxNuUJWw4hqzRzWi8jI2IpGrOU2vGlXhqE=
X-Gm-Gg: AeBDietyKicp40/DNyRXGlTgTZyRtBxqJrQtuj2moGT/X169FVcmSE6azkke1z7vudF
	cuho+vsoWQ5hpzLE83POd+L0pEWf3qeZk4FfNexZqfNF4zmxxru3hhw5g00JYB9xctOecKEsAtr
	AEuXXNVRbkYGzWRMi8E5EAFty4TZ+t31KGy7POrvx5HmmTgZGHT3jkebBRomDlZyGJAhfiqX9ZL
	bvpnyKMQAyn3GuqrNMsw6kXSQlhNca6eKJDCfVIt4B//rogg6UhcClxGVKSrrieg6YpYVWJe8jx
	itNIpSdWq1mxWaRft2hvPh6NBCiKEdxb9YR0ZouVCXsKhGgM/mjzpJsFBDCAeEDgqOAWIylWvH3
	SLOFhw1na6h6iPel+F3Wlixchr7cy5bkRYxP4zvkmQlkRwgbdKrhYZj3njBDo4+hRQWpWs2Xq+V
	lMmf4JuAoRE9RtAq5lz5fwRd4BOkcaWI7MVzXCVXNFg1ApYMOhtuPfLxhsNco+gw0/UB5TT+2F/
	gaX/xEl
X-Received: by 2002:a05:600c:a00e:b0:489:a4:e555 with SMTP id 5b1f17b1804b1-48a84471b86mr27140065e9.21.1777533055237;
        Thu, 30 Apr 2026 00:10:55 -0700 (PDT)
Received: from [192.168.178.36] (046124200255.public.t-mobile.at. [46.124.200.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6b89sm46080825e9.1.2026.04.30.00.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:10:54 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 30 Apr 2026 09:10:44 +0200
Subject: [PATCH v2 4/5] arm64: dts: qcom: sm6350: add LPASS LPI pin
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-sm6350-lpi-tlmm-v2-4-81d068025b97@fairphone.com>
References: <20260430-sm6350-lpi-tlmm-v2-0-81d068025b97@fairphone.com>
In-Reply-To: <20260430-sm6350-lpi-tlmm-v2-0-81d068025b97@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777533047; l=2211;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=xA+JyyhoD+6cuOWQwY5YNIB4x5Pz3Kxm/8/MqUktfKk=;
 b=o47mlBib4+72w4KeKq52GDFNeG46iqvF8whC4buxAu3HdKwKgINEBOpYn5vs8NBfDwkL2uj4N
 y8i1wxSd+I7Db+UWVHa8rVux1DtoPMRNGFdI+uCJlPu1z3JWTXLjZzU
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: 566B849E75F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105294-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,33c0000:email,fairphone.com:email,fairphone.com:dkim,fairphone.com:mid,0.0.0.5:email,3d00000:email]

Add LPASS LPI pinctrl node required for audio functionality on SM6350.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 66 ++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 034545d2af2d..d6adf68563cb 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1450,6 +1450,72 @@ compute-cb@5 {
 			};
 		};
 
+		lpass_tlmm: pinctrl@33c0000 {
+			compatible = "qcom,sm6350-lpass-lpi-pinctrl";
+			reg = <0x0 0x033c0000 0x0 0x20000>,
+			      <0x0 0x03550000 0x0 0x10000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpass_tlmm 0 0 15>;
+
+			clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "core",
+				      "audio";
+
+			i2s1_active: i2s1-active-state {
+				clk-pins {
+					pins = "gpio6";
+					function = "i2s1_clk";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				ws-pins {
+					pins = "gpio7";
+					function = "i2s1_ws";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio8", "gpio9";
+					function = "i2s1_data";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+			};
+
+			i2s1_sleep: i2s1-sleep-state {
+				clk-pins {
+					pins = "gpio6";
+					function = "i2s1_clk";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+
+				ws-pins {
+					pins = "gpio7";
+					function = "i2s1_ws";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+
+				data-pins {
+					pins = "gpio8", "gpio9";
+					function = "i2s1_data";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+			};
+		};
+
 		gpu: gpu@3d00000 {
 			compatible = "qcom,adreno-619.0", "qcom,adreno";
 			reg = <0x0 0x03d00000 0x0 0x40000>,

-- 
2.54.0


