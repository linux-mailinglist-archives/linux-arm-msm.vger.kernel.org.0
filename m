Return-Path: <linux-arm-msm+bounces-101650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qP26MM/Hz2lH0QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 15:59:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6061F394D1C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 15:59:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3584330A86BF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 13:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03F683B8948;
	Fri,  3 Apr 2026 13:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="uiiEeTs5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0B62E54BD
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 13:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224528; cv=none; b=EL1+xo77O1HYX/X/nLNt7/QPpPvMeWneGJ1E4PyioUUOMq5IeUI33TXWzgBM7POJg4kRtgZCywgW6MfAPCM9W9r6tbKqr+tixi2MnosQMqaCJNl0nKtfSozHt2ef7/lolO4c+8W1TVbEbOwI1ZxE24uOYONRPuEKY0zkW/tabVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224528; c=relaxed/simple;
	bh=Laagl1WvmKQiKODwRM094nhY7LnQG8oBc9UyZ9+RHgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WWdH/d7W4baNkkKa42dHEYrEWRTA/0gPOP7WjXy15JrGsMuEoDgQsCI6uOlm6kNbY+etv+/Sp07H5K0OSLVnuYo4UUHSItscwLURa37fr+o27o19ceVBY25F4ykuB+DvHqUUUXHq2Vrx5Io9CBwtMRG/dGVjWbEJWVoV1ifvZXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=uiiEeTs5; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-66bd4e0560fso4124040a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 06:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775224521; x=1775829321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q1YCa6QIo9PeY+05m/sjhH3PUg81ljbhDyFPKMlTXyw=;
        b=uiiEeTs5YPL1xzsMNn93RhdNKRlOdfSlZ0vc6opd3J2dqbPonRHAIR5CM9UlaE0Coy
         sPlG7rRiH5D+2dTFKSMo47XZskYHG3xa1EGWBv9rA2bE6+jwzwWcxOZOtSJgAuR36ROC
         ta0RejydEDLcpusmRSgJjATdWM88lKfEvdh/z0ilj+RZ/oRMM1dSyGs/u/Ev9RezXjou
         6SPG+BStWNAhW1zE/ulOoRiLXnIKTq0PdSuUtIOFBnWlg/qybwwkP5qgphoCpquKCv7q
         fKaWoww1GxHA37HyDknA6E6A5iQ/BfipLpgfuR++bf7lJ9TviLDAo740pNtewoIDbvBu
         sCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775224521; x=1775829321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q1YCa6QIo9PeY+05m/sjhH3PUg81ljbhDyFPKMlTXyw=;
        b=U8yy0G8/i/H21lLpJ3aVlG54ibOy6o8U+CLBG6NnJWvYX5gvvPJ0xlcd3CXI3NKLXD
         /D+Wy+N68Uu/B5maQ85ctNqHj0SOE/jhzf3Wg9rEh2xKUZfxP0uNfys7orslhA24wfeH
         FBWCIl50V5h2EnwXDfRN0tsYdxlOicNM+CeHhJKYg7PPH0CB5dB3E0XAwZGjc4sZUdLP
         ykh2OHJ8vj4YTEDHKZAJNKkoRgsWHiER3f7UM1e5Pkl0be+HZInJmMz77f97jzRl1zjx
         jdRRRre+VE7K2pzZuGRn4wM1sEutsNET30Uepl4SjtwS8QIAt7DFYSMUS22NGfAwpU1/
         ijDg==
X-Forwarded-Encrypted: i=1; AJvYcCXRuIgPc8KLmPU7XUxe9JZ+q1YgQHQuSZWfd64jB5ung2nZGfjwakEFbQZEnc3/gIucQoAP9NU5Lse8Gqxt@vger.kernel.org
X-Gm-Message-State: AOJu0YyBE/Ws8V23i9Rtd+PAPPtXpUk5cDWSto5dqRWIDygOogJtHR4C
	ZfH0uIeO6yB+ebSMmRzl4PRl16DqplOAi8mr22uHT4Tec95xVjbJ7WCTzqw/ZXdaxWLnfKgxxUq
	x9Hy462o=
X-Gm-Gg: AeBDieviUwjyMG8N20IlFh4g8t+yyvVamNX3GIMOgnQ85g7cBB+kEaAcqorQfqMnzUt
	KT3bfibTCZS6X19bsnMHHoJ/fxY5JEy9s5HSfgc6r0PnN5DWYJYWlsHKA9UeYqm3n7MIs3daSda
	4nRuHAmW6ErknDGEEHcR2aOdK6J2qpAEkZHUqPKdDGwsiohyb72hVWpNTKAsqUKPXR4p/LiUXTP
	0dX6/U4btywwl+OzHSHkzQM3o1Mw+sygDlXUxhUSmWnpl7syTsMsKEKUunbFgukyuNXFNWpZrxX
	xrVRATHyPOLwVbUrVc6T3koBPM6+e6S1KT5CSLn6We1eWfFqwBieFMOISBE//CH1yACgfJUyBOH
	eud5Oq/B1CiA8BTmcTkKi/nrambQopXKAPplEMlvRVO8OlEnVM+f3/kA7rqbseZGItuykKH5lvA
	pGeiVC9FZR3TgzkhdGPfa7s6g+H8jXBijciOhafUZcFGBOPHJCozYHJVupETTz5EU0UaLj7XTdR
	mO457cxBb+9/MZ6MMPbQ4syppJrKelxgxIabIa5MuuJDHpk
X-Received: by 2002:a17:906:ee83:b0:b99:86b6:85fd with SMTP id a640c23a62f3a-b9c65596fdbmr158557066b.9.1775224521403;
        Fri, 03 Apr 2026 06:55:21 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c972e28sm198057266b.1.2026.04.03.06.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:55:20 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 15:52:51 +0200
Subject: [PATCH v2 5/7] arm64: dts: qcom: milos: Add WCN6755 WiFi node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-fp6-bt-wifi-v2-5-393322b27c5f@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775224512; l=2562;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Laagl1WvmKQiKODwRM094nhY7LnQG8oBc9UyZ9+RHgI=;
 b=5dJnjoMOmNyoMHrWYuV+T1fDHL+fKjWcd2iksZsGpFY5KgrcxW85fMrGe1suXpl/g2g53QTu/
 2BtMLr3WqRnAYp8oduhNM5XgqDpI+uMmoQqYThDMSgKypx2bIP832X6
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,pm.me,gmail.com,holtmann.org,quicinc.com,sipsolutions.net];
	TAGGED_FROM(0.00)[bounces-101650-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 6061F394D1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a node for the WCN6755 WiFi found with the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 46 +++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 71292dfd6e08..3a3d7f2134e8 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -2438,6 +2438,52 @@ gic_its: msi-controller@17140000 {
 			};
 		};
 
+		wifi: wifi@17110040 {
+			compatible = "qcom,wcn6755-wifi", "qcom,wcn6750-wifi";
+			reg = <0x0 0x17110040 0x0 0x0>;
+
+			iommus = <&apps_smmu 0x1400 0x1>;
+
+			interrupts = <GIC_SPI 768 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 769 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 770 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 771 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 772 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 773 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 774 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 775 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 776 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 777 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 778 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 779 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 780 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 781 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 782 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 783 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 784 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 785 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 786 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 787 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 788 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 789 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 790 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 791 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 792 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 793 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 794 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 795 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 796 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 797 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 798 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 799 IRQ_TYPE_EDGE_RISING 0>;
+
+			qcom,rproc = <&remoteproc_wpss>;
+			qcom,smem-states = <&smp2p_wlan_out 0>;
+			qcom,smem-state-names = "wlan-smp2p-out";
+
+			status = "disabled";
+		};
+
 		timer@17420000 {
 			compatible = "arm,armv7-timer-mem";
 			reg = <0x0 0x17420000 0x0 0x1000>;

-- 
2.53.0


