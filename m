Return-Path: <linux-arm-msm+bounces-97569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIo3JXk1tGn4igAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:04:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCBA2869BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:04:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 44C9430ED7B8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E08C3C3459;
	Fri, 13 Mar 2026 16:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="N4x7VirN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434013B6342
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773417647; cv=none; b=VYxaf7WdTnxtDEW5mMECP9UxU2isWMCLGq18789Bb9DjJzV5r5WOTT+ddBerd7fM2PFaQRtBfVJY4UY8+ia04+YLE0ax5MGSuBIMAkR8KPIpDSWcWmoM8pMhf2bgrdYHAyC3p0OU9dljO3Id5KLoOX7U/FU5xzA7Rc+W8bOuvtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773417647; c=relaxed/simple;
	bh=kU3UxSV+thy88CWdYS8ajqS2HsdwARkWF8FHIB7M0vg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qENANdYMm88LpWqjkBbWibTttj9rZipxa23KqMCeANFYCi/cslZU0B5M6Ild/ZJk3E29OyU/sc3n4PqbqBnPNeNEVqsbCTccuHju93rwm7OPYJl06j8iBuVD/MCfBpZp9EqXEiOmTV6heSHL4ni+Y1b+2rwet39WYoX1qQREU4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=N4x7VirN; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-661b16ac011so4169561a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773417642; x=1774022442; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R2kPp/p9iZu44Vzh1qojKHtTrTqRdtYbnN73SyFGMzA=;
        b=N4x7VirN8G348DO1TRK3fvYVlZmiKJMkkRTv4DKptZV/jozeD/9vDLYRDgaJCeB9Bu
         kDHcxTINrNW7VI230UGduKF1wlbU8gxcTcJcm0jpWdxCumte1Hl/47M/jvD08jr0u4TS
         4TDQnhFfUAc49GuJRLaidBybKkspRCklxCzMfU3xhRYEBwj3u3MaAr4iz83SSum6+3EY
         Cfo/4xe0+osxMyRR7QhuNOJL8HzwdqsEZoFHtqN4f8sXob+4ksC20BzlXZ86/62g9GAX
         hDvAtgau4tjK2hyfmCk5vZiXf5WUn4ZzWZLBGWcjL8hS81dEjUDbTr73wP6KYNvASHIW
         zO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773417642; x=1774022442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R2kPp/p9iZu44Vzh1qojKHtTrTqRdtYbnN73SyFGMzA=;
        b=XH8/o+RmaVQAab9MD26UhpAOkOcihCiTGuBVZ0zbn2xTy7na8YX1yc9MscVX3GgzMB
         Zn671RWwV1qKeCVyDBa/RF/jlQ1cbbX3lp3WX8RmIdG7rdmWjEIapI3N1RUYwlP8Ch+T
         vczTg3q5cwOSBCgx3+NCbm9tJCDhW/mf++n1FonYpDMNTVFvuawvnvQUIxVBz0W9QoWr
         qzTd6V4auyrb/Fk/npd0wS02ROhtp58NgacYSjsre8andcPt0t8gWVuQK8q+nDgJflpQ
         BiHOLkuf8wNtn/q/mb4IihiLNvJJyfvTYmlrLOluCApXoPIF3JjoCn0VwkUJKM0iM48w
         BtKw==
X-Forwarded-Encrypted: i=1; AJvYcCW9wOxx+KKum9zR03rqS/+DchSOlJlLUBxE6l4YMIz01y2QZl0cJdEWBjTDP7pz14KPq2+RGsb5vQwwSPpT@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzyg7KDwEIeyZoZ5uLJ1enTkmALNl/MYXOITIbkz/Ggmal/OYh
	JYoncSDA5ByOIT7wEvLNEBEE98YIJqIY3/1lSZ2yGSP5L0Gu40LZYDTztKZbjsFm6/s=
X-Gm-Gg: ATEYQzwTo5tDlhgMFr08vua8Qnb0LX/3jBHhqYAJOx24gjNgR3d761GVm5+X//0rye0
	MhvRzyC5ZUukJaEex0FGMcgswUMDI5yZkat7k43VECqrckdABAf2pV/tuScSDjpcpPHFqrT7QEO
	sRXFmwYl25tRHbUK4qJH9f5yezZ6Bu3z6AMGXSJI9yXv/9SPEIG1qjr1fYjEn2pCaJ1bACy77wb
	OcZf/5xpTQQJI4JVfSNuuOZhDPvp6do3ELdG6wIr8VUbWO6qWBSdaBQjBhBIeeznGSXKey4ykPP
	1UY9QVcqhLHrqZsxAxejy3vrx9+GfR4deNcTFk+sinq9jlhcfMq0N2Sa89kgxcEqvIPrP45phFk
	L9V3ZqZqGsyVDidaTN1epg2N07EcZBfiyTMmonle1CvadnXYkaloM39sG5sRG2pi8U1VNsQWSNd
	339FJnEiry3wN0ScQ0hGM1RyUC5fI7ohlEtIa4N2ueq4JFBKGMZPgbVzqw2U81e9XWmSdY7+cLa
	+uzKA==
X-Received: by 2002:a05:6402:35cd:b0:65f:830b:1034 with SMTP id 4fb4d7f45d1cf-663ba101109mr2296343a12.6.1773417642212;
        Fri, 13 Mar 2026 09:00:42 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6634fbb94afsm1397100a12.4.2026.03.13.09.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:00:41 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Mar 2026 17:00:38 +0100
Subject: [PATCH 1/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Sort pinctrl
 nodes by pins
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-fp5-s5kjn1-v1-1-fa4f1c727318@fairphone.com>
References: <20260313-fp5-s5kjn1-v1-0-fa4f1c727318@fairphone.com>
In-Reply-To: <20260313-fp5-s5kjn1-v1-0-fa4f1c727318@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773417640; l=2814;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=kU3UxSV+thy88CWdYS8ajqS2HsdwARkWF8FHIB7M0vg=;
 b=8ths/u7f4S7gPNmFszVyhlCsdnOU+Bf+PStFeIBt6nuBralUzmznUoFlN8osvDGhrPhsMMGy5
 QradTLd9VE/CttINqtrVxGuZiWRNLGCTCII6uId/YjPbhfU9vfsYyhh
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97569-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4BCBA2869BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As per DTS Coding Style, sort pinctrl subnodes by the "pins" property,
in preparation to add more pinctrl states.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 74 +++++++++++-----------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 455e5c9bb072..c9c24c36ba7e 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -1257,41 +1257,6 @@ &tlmm {
 	 */
 	gpio-reserved-ranges = <32 2>, <56 4>;
 
-	bluetooth_enable_default: bluetooth-enable-default-state {
-		pins = "gpio85";
-		function = "gpio";
-		output-low;
-		bias-disable;
-	};
-
-	disp_reset_n_active: disp-reset-n-active-state {
-		pins = "gpio44";
-		function = "gpio";
-		drive-strength = <8>;
-		bias-disable;
-	};
-
-	disp_reset_n_suspend: disp-reset-n-suspend-state {
-		pins = "gpio44";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-pull-down;
-	};
-
-	hall_sensor_default: hall-sensor-default-state {
-		pins = "gpio155";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-pull-up;
-	};
-
-	mdp_vsync: mdp-vsync-state {
-		pins = "gpio80";
-		function = "mdp_vsync";
-		drive-strength = <2>;
-		bias-pull-down;
-	};
-
 	pm8008_int_default: pm8008-int-default-state {
 		pins = "gpio25";
 		function = "gpio";
@@ -1345,9 +1310,17 @@ qup_uart7_sleep_rx: qup-uart7-sleep-rx-state {
 		bias-pull-up;
 	};
 
-	sw_ctrl_default: sw-ctrl-default-state {
-		pins = "gpio86";
+	disp_reset_n_active: disp-reset-n-active-state {
+		pins = "gpio44";
 		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp_reset_n_suspend: disp-reset-n-suspend-state {
+		pins = "gpio44";
+		function = "gpio";
+		drive-strength = <2>;
 		bias-pull-down;
 	};
 
@@ -1359,12 +1332,39 @@ usb_redrive_1v8_en_default: usb-redrive-1v8-en-default-state {
 		output-high;
 	};
 
+	mdp_vsync: mdp-vsync-state {
+		pins = "gpio80";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	bluetooth_enable_default: bluetooth-enable-default-state {
+		pins = "gpio85";
+		function = "gpio";
+		output-low;
+		bias-disable;
+	};
+
+	sw_ctrl_default: sw-ctrl-default-state {
+		pins = "gpio86";
+		function = "gpio";
+		bias-pull-down;
+	};
+
 	aw86927_int_default: aw86927-int-default-state {
 		pins = "gpio101";
 		function = "gpio";
 		drive-strength = <2>;
 		bias-pull-up;
 	};
+
+	hall_sensor_default: hall-sensor-default-state {
+		pins = "gpio155";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
 };
 
 &uart5 {

-- 
2.53.0


