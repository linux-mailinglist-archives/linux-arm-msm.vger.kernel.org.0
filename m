Return-Path: <linux-arm-msm+bounces-95842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHbdK9rjqmkTYAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:25:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A462229DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:25:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9C3CE309009B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 14:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B5903ACF0B;
	Fri,  6 Mar 2026 14:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="WHNDsM3+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FF73AE6FE
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 14:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772806951; cv=none; b=Q1c1YsHXRlYx/nFjbtyDIByaQT5thr6LrsA35csWYJ3TAZs0KPwlXY0CdgCO+VuT/IURCt3kYedEBX2ZU39rlDR0/He5Vt98yJ0IDBCePP4fxHlutxvETBxOlW9JaHbkmPhLge+PzDnCaajLIB97IVNdOWmGLo4LFK+URQAfnJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772806951; c=relaxed/simple;
	bh=ceaAYHgyAOISMMGiY+fNNjyu+n4n2FiUVw5y5npeShc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jGLMnxX+Lf10cWYWFM6xhHf40biRnGdJ9SrIPwkqeqD/wajT/hu/0VBBCmLX+ZmkLlSB983lKMl/TwHPwLrrymiBjcCNEGaGODdkEyatOltbWbepIDL6rx2bNEz8VMIIus/slLAzKjIdN0/CIq+9gefaS3nDgy17r5auo/nBxiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=WHNDsM3+; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-66174cf4549so893928a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 06:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1772806944; x=1773411744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+uGmjUwMwFnjrFzi7s2tWi4x0D5mNfrprS2P1mjJOIk=;
        b=WHNDsM3+QmKHSbTDx0Gyh7iSjnMW1ZDCaCQnV+FWwU3rqvxsWJxDpdBt2ryqaGMaKl
         RUuNY1Ee3L1snaoAA6Sy9LEXS68zDQMVa69JPkTNg4CUxSMIwNMgLAiShmUbg1sXKVxJ
         06iyUqGvtPvYLL5u8WZ2knvvfEYcnFXAB4+Toj91mvuAMSiITRZNKj//koILnYvhT8LV
         Yp7xNZ+4cS3LJ+E21kjDZtHjUQ318Z5xPgPithD4hW0MNHF4jXs8V7+WJCSc8uiLQttl
         vs0TpqaC8O3gNv6E/RoJN/gQZKpXGf0O64Nl0Ud24LNjy8rc0irW/nglYgXVl8FHZrh5
         uDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772806944; x=1773411744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+uGmjUwMwFnjrFzi7s2tWi4x0D5mNfrprS2P1mjJOIk=;
        b=cS3Xvr7Gum4mBXXxV4WopL5DazpGnQs/FGEr5BHO7fAQ5tofS72+KODsKEwO8HK6Ma
         rUN5GlPvtmdhSgfBguNCfQhdG0sKa5Jqa8z44UChtHmcMBLBtaJ7d05vwc0iut20iOdY
         5ccsSi1Az8jPwzSuC0og+QO3XNzVGT7TMDxfspDLnFb3BA92q+kcr7AyhAyamEPW8G45
         YfVzn3ISf85HCN+EKcf0LQvFaIUiv4nfZOmAsbtM69ChiV39OknNTvn2suh0CGgiBeIl
         69nNnREnPVqSb/zIauKKLZZYTI/+DpIihGarFH+d8J6qIn93PCYtzxybtLIzzpL48MVV
         tQHw==
X-Forwarded-Encrypted: i=1; AJvYcCUYCNATtgGBsIKD9L7R3XC9VbI6KXyhwwzmNJFejwSqppK8ZNbGJBGYSygAVZmw7w6Bo4RapcFNUupCRrsU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7oPrnkMZlsWFWNb1UGHE/E9D4EjyLpins5n5CgdXT1st4hXAi
	45PHrdLWHeuRyosESRkNtZna28KtgSPQSCa0u1bL9yRfE6En5QSaITRapkKXypDR2eQ=
X-Gm-Gg: ATEYQzynE0POBEzk5grObsfP0EXs3mp0Nj1GGkEmnKBw1kSAE/dWrrHD5pRpMrCNBo1
	BEsx+2vcuPMWdw4ZfLHOmkKNjZ2bUuzPZ6zlk9BP/i1eezh5Ppnsrj1R4umgRJa+NFZuLbxXsYP
	c0QIJc6LRvA6AzjHmoleqTz+uf3dwULnH4onh1BSuI4S4+EdTN2Z6G0251hi2kTIYFtEohT4S/C
	HfNiUBniZQhWPpPfOgjtETKTJ3BHxVGbbVlz5Udj+P7HBp77ctzfuPyzjapaJi3q2KmqETLmpka
	QkgYP+txqKhrMIRPPjeoB4WzsfxMtc3g88XOmJl+serxHXRcFpJbFxjtGJ01JWY0lsVuqcTj1cY
	qdhaO4j5BSncP9PfntarspdZV1s9bpH1UPqicQvj+4TmNmUcH8Kud5LoFoxpt7tyK7HwqhuU/ua
	etjPhSSwy0OkPgwoPLFxETvDCtq6R8wqUGl/velkBm1v7hVhCHnt2lLsOa3aZwKbgetM81UcnMH
	XRj
X-Received: by 2002:aa7:d350:0:b0:659:9068:9786 with SMTP id 4fb4d7f45d1cf-66143049299mr2529371a12.10.1772806944337;
        Fri, 06 Mar 2026 06:22:24 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a3c66d3fsm517251a12.2.2026.03.06.06.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:22:23 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 06 Mar 2026 15:22:18 +0100
Subject: [PATCH 4/4] arm64: dts: qcom: milos: Add LPASS LPI pinctrl node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-milos-pinctrl-lpi-v1-4-086946dbb855@fairphone.com>
References: <20260306-milos-pinctrl-lpi-v1-0-086946dbb855@fairphone.com>
In-Reply-To: <20260306-milos-pinctrl-lpi-v1-0-086946dbb855@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772806937; l=3258;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ceaAYHgyAOISMMGiY+fNNjyu+n4n2FiUVw5y5npeShc=;
 b=GKmNcNAkRbQfG9aIk8UKVimfr43zZminilltWJfAq60uRDyaLQCYTurQFUFAZ/rd1Zn5kpKRx
 ZKw1JGCcpTQCprIzBCXF+ID3isfIfFpuM+JN4GEenepgDNXXo3kK3Gx
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: 26A462229DF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95842-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,0.52.125.128:email,3c40000:email]
X-Rspamd-Action: no action

Add a node for the LPASS LPI pinctrl found on the Milos SoC and define a
few pinctrl states that will be used in the future.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 103 ++++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 5691eb2dcfd0..ccacf8d14ae8 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -20,6 +20,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -1307,6 +1308,108 @@ q6prmcc: clock-controller {
 			};
 		};
 
+		lpass_tlmm: pinctrl@3440000 {
+			compatible = "qcom,milos-lpass-lpi-pinctrl";
+			reg = <0x0 0x03440000 0x0 0x20000>,
+			      <0x0 0x034d0000 0x0 0x10000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpass_tlmm 0 0 23>;
+
+			clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "core",
+				      "audio";
+
+			tx_swr_active: tx-swr-active-state {
+				clk-pins {
+					pins = "gpio0";
+					function = "swr_tx_clk";
+					drive-strength = <4>;
+					slew-rate = <1>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio1", "gpio2", "gpio14";
+					function = "swr_tx_data";
+					drive-strength = <4>;
+					slew-rate = <1>;
+					bias-bus-hold;
+				};
+			};
+
+			rx_swr_active: rx-swr-active-state {
+				clk-pins {
+					pins = "gpio3";
+					function = "swr_rx_clk";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio4", "gpio5";
+					function = "swr_rx_data";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-bus-hold;
+				};
+			};
+
+			lpi_i2s2_active: lpi-i2s2-active-state {
+				clk-pins {
+					pins = "gpio10";
+					function = "i2s2_clk";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				ws-pins {
+					pins = "gpio11";
+					function = "i2s2_ws";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio12", "gpio13";
+					function = "i2s2_data";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+			};
+
+			lpi_i2s2_sleep: lpi-i2s2-sleep-state {
+				clk-pins {
+					pins = "gpio10";
+					function = "i2s2_clk";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+
+				ws-pins {
+					pins = "gpio11";
+					function = "i2s2_ws";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+
+				data-pins {
+					pins = "gpio12", "gpio13";
+					function = "i2s2_data";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+			};
+		};
+
 		lpass_ag_noc: interconnect@3c40000 {
 			compatible = "qcom,milos-lpass-ag-noc";
 			reg = <0x0 0x03c40000 0x0 0x17200>;

-- 
2.53.0


