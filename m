Return-Path: <linux-arm-msm+bounces-96614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLrqLtz/r2mmdwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 12:26:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD2B24AB06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 12:26:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AD5FA3057D4A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2177838A2BE;
	Tue, 10 Mar 2026 11:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zf8QWLRV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EDD389113
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773141851; cv=none; b=iCn1Q70ua7rD18cRlcFZzGlR55ePpSy88p5cTi1bk467iL5+Sv93TUWFCAI0iFfBIQyszwG3gvdy/iUPwGrn6JQkCjhjN4IMdGBvWv3nJ4Z4qh3XT4GuZF6a4tlHwGqYrN9MTdLj5h1lSuLjTe1TnhGVbXoEWcvtvosN9/61CvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773141851; c=relaxed/simple;
	bh=o/uqIjeuUzOOdf1q1N1+cQPwX7j5NTyoms2N9zoaY98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iE+W1XF6uq+XX4MNNy2wZb+x0Bm17VUaqJan7qBMNNARvqeCq3MY1X3tgcls90QQDlkZf5dKS4VDo4+Ww0SeWCyyFv2tKJzb1FTq5jnVp5t5b5F9dNZY7nMdxoYWZNoM8pd/Yyi/rDXZ5Z+NnUHqmm3VJd8c2vLSdr5VDva1Xz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zf8QWLRV; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4853aec185aso18913425e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773141848; x=1773746648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwm5kS48yTdTQ1D8tWJC+uRL7HDVBPU6IqwJ3u69y1E=;
        b=Zf8QWLRVNTuEIVpyaW080ywpJGB+2vtg+MVVrT413Bea3LfydSSQ1m9D4Xf2HmDbov
         q47DIX8xXrj098qMSN6FRNAN7D/wyEx87Mum3LK8JCIBsaDIaPUvTll5OfDm8pgMk0BI
         9IpnHLAzDawuOduKXgfFWaexDlIj6yvV7QpabpDq8vfcDfMWLrJfFeif4xrj6oYKN9m+
         m4u7V+qRPZTNPzFFMPzIYWYq2UEm4TOg+a1sTm7JupRvYH1dR2GpusvPeKmPX/vm4T5h
         G4fdH/qsdeRr7zQFPDwLBhSw8ejoej2n2C8BC55DWmfdNpeMk47EPBo+iMgPv06e7o0/
         kCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773141848; x=1773746648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zwm5kS48yTdTQ1D8tWJC+uRL7HDVBPU6IqwJ3u69y1E=;
        b=QlOBVDHLttIn7v4yJKcJguuFr8k7Xl46ARu6+ix0h2OGGvQUGl/mbBkSB9rEeb1YHq
         jnrYxnQcQAYbg67dM0wzCNdqWIJkjlPQXTBJabBjV/2/1S5a0/waEJah/AaOoZ7gVY6x
         FSeDw67l3KFP4uawu2QkKkeaxdxKey9LhMPtb2cLR+myPoXqrZ3P1nP/Mb6shCMNqwnh
         svmHZSs9WoPGu7msRP+Z90v15E/0Ji3y13ReHD//iFugx7lHWYfTXpWOOIuVqRSbbeQp
         2k1P0rsrr5ugNYDaWYb+jss/90diwN982/1InSXmbBnuISYVx0z5pPWHZNH1fpVRnUR8
         9oqw==
X-Gm-Message-State: AOJu0YwD7e83T02vXfEPC1j0b4YOufbrZXAyaEJQMmjaCJIa04qAO3t0
	hbRatXYY/FOuh15qf1uV0oDgg+rVE740jktWYzRT+DLGt8w1nvKJewU5
X-Gm-Gg: ATEYQzwZhPd3LPEdAK2t9er4dfxu/aRyDgwFu3Kiihpr/T6ZSiMaotVsA59x8b9/fkV
	g9jbWDcSauetGkd5di4Y0W5mtXb+I4y3KhTmNSRjPFYQdFqq6MC/NO+hcECKwCEwjn/Wx6PXe7o
	E38auaP441emztfUiYGtPai4nMMi7kkaRY1t+NoxJMrQtcRuEFaF5kUu4Zia3G/k/VGh2B2ApuK
	yDk+GTyyX6eAe/l7WeJiC90fvfXhGP/V2TLOR6kTc7YYAVVJFvhcq5f1MTa1u97Z/d4XY4SzSZy
	uO4Tw5bxb5CeQMF/jeLSnQkVWcWQ+x5PDfjQbSpYB9nMYLrJGdxUXpBpqRVQ8wyXIChvjzvoiZI
	uF/2qJ9n0C9rODqwKUuCbSP/3oysxWlG8z//O1ehkMtDgzuFJPKdIXZQHpxtwZRrkmqA0FwWxTK
	4uPydIAkcYt8KqGqYg4vQR+8udwsUCFmIhRg==
X-Received: by 2002:a05:600c:4445:b0:483:a27e:6706 with SMTP id 5b1f17b1804b1-48526922533mr263095895e9.9.1773141847742;
        Tue, 10 Mar 2026 04:24:07 -0700 (PDT)
Received: from T15.. ([46.175.113.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad97abasm32238560f8f.10.2026.03.10.04.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 04:24:07 -0700 (PDT)
From: Wojciech Slenska <wojciech.slenska@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Wojciech Slenska <wojciech.slenska@gmail.com>
Subject: [PATCH v2 2/2] arm64: dts: qcom: agatti: Add IPA nodes
Date: Tue, 10 Mar 2026 12:22:31 +0100
Message-ID: <20260310112309.79261-3-wojciech.slenska@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310112309.79261-1-wojciech.slenska@gmail.com>
References: <20260310112309.79261-1-wojciech.slenska@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9DD2B24AB06
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-96614-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wojciechslenska@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

Added IPA nodes and definitions.

Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 53 ++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 76b93b7bd50f..dbaae258f3e7 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -433,6 +433,18 @@ wlan_smp2p_in: wlan-wpss-to-ap {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
+
+		ipa_smp2p_out: ipa-ap-to-modem {
+			qcom,entry-name = "ipa";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		ipa_smp2p_in: ipa-modem-to-ap {
+			qcom,entry-name = "ipa";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
 	};
 
 	soc: soc@0 {
@@ -1641,6 +1653,47 @@ usb_dwc3_ss: endpoint {
 			};
 		};
 
+		ipa: ipa@5840000 {
+			compatible = "qcom,qcm2290-ipa", "qcom,sc7180-ipa";
+
+			iommus = <&apps_smmu 0x140 0x0>;
+			reg = <0x0 0x05840000 0x0 0x7000>,
+			      <0x0 0x05847000 0x0 0x2000>,
+			      <0x0 0x05804000 0x0 0x2c000>;
+			reg-names = "ipa-reg",
+				    "ipa-shared",
+				    "gsi";
+
+			interrupts-extended = <&intc GIC_SPI 257 IRQ_TYPE_EDGE_RISING>,
+					      <&intc GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH>,
+					      <&ipa_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&ipa_smp2p_in 1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "ipa",
+					  "gsi",
+					  "ipa-clock-query",
+					  "ipa-setup-ready";
+
+			clocks = <&rpmcc RPM_SMD_IPA_CLK>;
+			clock-names = "core";
+
+			interconnects = <&system_noc MASTER_IPA RPM_ALWAYS_TAG
+					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
+					<&system_noc MASTER_IPA RPM_ALWAYS_TAG
+					 &system_noc SLAVE_IMEM RPM_ALWAYS_TAG>,
+					<&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+					 &config_noc SLAVE_IPA_CFG RPM_ACTIVE_TAG>;
+			interconnect-names = "memory",
+					     "imem",
+					     "config";
+
+			qcom,smem-states = <&ipa_smp2p_out 0>,
+					   <&ipa_smp2p_out 1>;
+			qcom,smem-state-names = "ipa-clock-enabled-valid",
+						"ipa-clock-enabled";
+
+			status = "disabled";
+		};
+
 		gpu: gpu@5900000 {
 			compatible = "qcom,adreno-07000200", "qcom,adreno";
 			reg = <0x0 0x05900000 0x0 0x40000>,
-- 
2.43.0


