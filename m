Return-Path: <linux-arm-msm+bounces-98897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENAQCvYBvWkO5gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 09:14:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B832D705D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 09:14:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 132843032D38
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 08:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA2F37F723;
	Fri, 20 Mar 2026 08:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="4fLtUZSh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC3137474C
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 08:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773994222; cv=none; b=uzU3uRQ1UscnjEB1cGCMPFVLdFjP8yWzKxTgKz9cDtbiHHdfJfpfVdOfoKcdUNYmuZI6WEcLrBUelu7TbAIUval9sa2AIeVHESzSMdpxr+wyGhlaRSs6HfdRrTIIjOTpNe6prqc8fV/j0tl9r0ky3jTwRzVMda1Iqt5YauA0AvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773994222; c=relaxed/simple;
	bh=OOBMl6N+6wWq4VI/kMem7gKFfbgc3xAME32xiW5QX+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uHwAwIhDoDVNDlRALG4auis+79lMPZ5NJZYbFPX6z2579iLiYJ6D2nZRsfoVdQOIhII4hws/2alPW6cO8ahbAq8QsH3nx0lPPKz2JqsihAXJlQW32kmBtGrybVbexIhs0U59UbaaOepR5j7accSiWwTfTUyXOHLZl3uiwaUhCgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=4fLtUZSh; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b98069e41b0so313664766b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 01:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773994218; x=1774599018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xz0m8rU9A280bToU8IuILL5Mw5gJnGqIrAD0/ydeaXM=;
        b=4fLtUZShdAuIn9+mW2e/IYierHJgZA97eTd/3tmFFEmhLgZSfTYDHArmzx1JBZdzi9
         cKrXgmNwG/muGDMFYKeecZXsP9a9yjBvvLbIQOdv/sEqFpesqwcoGPDm7HwonxNF+bpg
         cLDZMR+tZ/bT2fdUQx1Jjiyk3nsl2pCT3YbAWVL9mKO7uFeokS3ShmA10TK0aGs2pskH
         e00BtKk74/gv6c+Z8p1xJj8x/oU80MhUH+anagd62XdHvodaDN8s/2NO26q8XOPy63BP
         zl2qdDzkSoBI+sKPzsKTX95dun5JZeXfDBiN+Sy6/5V42m8HjUoaFzJh4dKsX3gE+qJ9
         oZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773994218; x=1774599018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xz0m8rU9A280bToU8IuILL5Mw5gJnGqIrAD0/ydeaXM=;
        b=QA5Vsu0lgE79SSdM+8d2f96ZVod+8eW65af7oZ8kYvy/Qu82HtCX+KQg76kaauNnoy
         lT1kO2QeRlYT4IFACukqwbIXQZr/kiXouu2MDKX7c6cpKXYSj5/OJATPItP7c3pxT9yJ
         7VEuzngMgNBBQnUNfdG2vnNv6FPEwDs53cnAF55XFpezM4mv1lx/rPfVNGdaLiOvIi7s
         jomi/+VeW/GY9t2v7zYeZgcgZ3G4mYoKHxTif+zs4o32FelRkUD3FtRJpfvCdECObJQe
         Gxymkx0HZr7qn5re7hSCUuG8OXLskAaQlYQTOOoS0Rd/lwPBcu505VjX7ouTIsLgbmTc
         6g2A==
X-Forwarded-Encrypted: i=1; AJvYcCWXuVzo2Gw4p4+3zx7QbOkG4v11mcGYlulOiuiN4wMC8FkANzcLN1fh1J/VnV16SOWhARaUqhS7aTDyVe9+@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl09ZyVscKjmwhflVmF/L2VVMgAHRgqdmThYcJKBet0HhxneES
	3gEKNL2KRQa7ozILKyLJ1nfdofmBi1jWZ5PxO40ME2zQFIaF79DrCvGxBsH2hdM/KQI=
X-Gm-Gg: ATEYQzzs1/GZBC6B6Z0QtaqzVRZDgNqxyqSCYcffB7jYqOqNAwferwqAh/nNiz8Dy2q
	E/hSySbrdBtSPCz8wKcptLCNG6Hwys2fYBAL8IBGXIRuYLtt68ATmNn6WFY4/aPWFKJdt2pnS5m
	5RpK57t7bqKginrAxPIo231HB2xomqGJyTr6VPbiCUphUym0TS6ybGD7a2Z6JO1jvPZuRg3ZGE8
	Hb6vHO+SGf+vO4S6Lsj+E7UhbLf6HjpGhjYXZXqyLxLbdrhZ9+thQpeXcO//78aXhXZB+38U5we
	hMMWoHExjfCgzA/4Yg9LVGwW19Ro5IIxPChuWy89JuumBq6F9uE5SFwxMYUlwL5CrFBF3ru0Muu
	uQSzoyhMxX8HDCmLJ4Vvr9HPa3hLeunj174HAfYXKSc91yi9DvPGk6MvAjSP9kjiH2aKlFKMXiD
	Tak9kyAGYpx7YyI442gU8F7Ts4V2Ry1lcx5LZid1SJzD9D5UGkTKftQsRvag/7o8gTFgeZoinzs
	XWOgw==
X-Received: by 2002:a17:906:37cb:b0:b97:f2cc:8c3e with SMTP id a640c23a62f3a-b982f39b197mr103173666b.10.1773994218017;
        Fri, 20 Mar 2026 01:10:18 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f43b5csm121016466b.1.2026.03.20.01.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:10:17 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 20 Mar 2026 09:09:51 +0100
Subject: [PATCH v2 3/3] arm64: dts: qcom: milos-fairphone-fp6: Add camera
 EEPROMs on CCI busses
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-milos-cci-v2-3-1947fc83f756@fairphone.com>
References: <20260320-milos-cci-v2-0-1947fc83f756@fairphone.com>
In-Reply-To: <20260320-milos-cci-v2-0-1947fc83f756@fairphone.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773994215; l=1724;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=OOBMl6N+6wWq4VI/kMem7gKFfbgc3xAME32xiW5QX+Q=;
 b=PtK07MSBbaUBbhPt07Jp3YhUm43bkaj9J/cjajCZxkqEJDLGAMbgkavtMBPQ1xvpFsBgidmXv
 HN6LoKa4+BNDhiBU8v5dt3YQbHIyzADJhP4OPy9KuTy9VDJdlU4XbqT
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98897-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B7B832D705D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable the CCI I2C busses and add nodes for the EEPROMs found on the
camera that are connected there.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 50 ++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index bba327cc7a38..3e65f5deb5a6 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -541,6 +541,56 @@ vreg_l11f: ldo11 {
 	};
 };
 
+&cci0 {
+	status = "okay";
+};
+
+&cci0_i2c0 {
+	/* Main cam: Sony IMX896 @ 0x1a */
+
+	eeprom@50 {
+		compatible = "puya,p24c128f", "atmel,24c128";
+		reg = <0x50>;
+		vcc-supply = <&vreg_l6p>;
+		read-only;
+	};
+
+	/* Dongwoon DW9784 VCM/OIS @ 0x72 */
+};
+
+
+&cci0_i2c1 {
+	/* Awinic AW86017 VCM @ 0x0c */
+	/* UW cam: OmniVision OV13B10 @ 0x36 */
+
+	eeprom@52 {
+		compatible = "puya,p24c128f", "atmel,24c128";
+		reg = <0x52>;
+		vcc-supply = <&vreg_l6p>;
+		read-only;
+	};
+};
+
+&cci1 {
+	/* cci1_i2c0 is not used for CCI */
+	pinctrl-0 = <&cci1_1_default>;
+	pinctrl-1 = <&cci1_1_sleep>;
+
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	/* Awinic AW86016 VCM @ 0x0c */
+	/* Front cam: Samsung S5KKD1 @ 0x3d */
+
+	eeprom@51 {
+		compatible = "puya,p24c128f", "atmel,24c128";
+		reg = <0x51>;
+		vcc-supply = <&vreg_l6p>;
+		read-only;
+	};
+};
+
 &gcc {
 	protected-clocks = <GCC_PCIE_1_AUX_CLK>, <GCC_PCIE_1_AUX_CLK_SRC>,
 			   <GCC_PCIE_1_CFG_AHB_CLK>, <GCC_PCIE_1_MSTR_AXI_CLK>,

-- 
2.53.0


