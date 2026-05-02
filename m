Return-Path: <linux-arm-msm+bounces-105563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id LSNfEU+b9WlyNAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 02 May 2026 08:35:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE794B128A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 02 May 2026 08:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C78FA3020024
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 May 2026 06:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00CAC285CB3;
	Sat,  2 May 2026 06:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="qzWjWPv5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0753BA34
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 May 2026 06:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777703755; cv=none; b=PzVy3fXMXZ17zRV9uUJbBR2Yr1MNMpsw/c9TdMC/yZ7q+yC4auuvJnsM3ne870RpN/GSiayttexOSn4iporSAzCd00oAc5b0jyTPGM9SDMtuckx+P5rfddBmwpKlQAl6X0ZGN4drkDr02mK2MttMbX0k7cf5JZmVl2rWvp+Qs9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777703755; c=relaxed/simple;
	bh=deSn5Xt5tw22V/d31H1pgAVTJOwNWODnuOnfe+76xvE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u7hecG+FWeLJ9CPaS++kY4rlp+kLY5fCMQQxyi/qzO77JR/BKN0JMylmLNS2Z3aInSCWmA4fuR/ZrJJJxKY74d57sIhGC8btDar/CENMPPjBpQHUu8FZP7NFSHrQB/CSX0XtRuT0MJBZTenIXtjVtJ9X3YOBWYvfOjyU2Y6My+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=qzWjWPv5; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35dac556bb2so2031643a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 23:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1777703754; x=1778308554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3eiLhT2Xek0PquJfvL2goLYfKOInax72e42XoBPjztE=;
        b=qzWjWPv5If6zkBM1z3KqEnlckI98W30hnjSESRNbLlS8R0DUqIjl4/4huw1HiCso/0
         vFib8Tl884cSavjKU+XOiI/YBR/O7m3Ih9OYYmhXJNdJKQjc0T8AhARwPpsmHsvHAKx0
         EngZ3eX5X3wXTh0aJr812Kn3++/yelI+TRJcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777703754; x=1778308554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3eiLhT2Xek0PquJfvL2goLYfKOInax72e42XoBPjztE=;
        b=dqIWw/e0GZ4Rhqw7qmyfTGvhHAyev7XakZfZeBFufLNMBg4olQDIApF38Vwxf7QbJt
         W5ewLdwWnHe8Iw73JnWYNwU2pnLgEqsQUhtqTcQnWr9mrVccUK78+JtqOgLZZjQfSbe4
         KLQu2zkqpMU6eKDgGTMsgdFzOORbKAUms2SiYcbpkr4wIWGWgHFVOYYMm3JDA7oAyhHI
         p0k6QKFAnc7N4KkRI8FZ64NDLztBst6W5yQOA1b39J5cbnqmYnh0hWIqRLqxQW5o0ZGl
         kA33X4HOsmUZSSHqexOE260Fi8kQ0An6FQWt1DXEoTAuoQD5vzdhXb8pLdK6fG/UkDZx
         PFzA==
X-Gm-Message-State: AOJu0YzHxdPe8qLXTkVY8RdCTZ23+RogI2ZKKsZFmGBWMn27tOoXp8v3
	a62ZzzIc3ll8AQc7b/2VdMOVsTf/jxjjooVEKOJfYCaV4j1LrgMx5b9jmUflVdpFHZE=
X-Gm-Gg: AeBDievRLi5FdmivcmjdULmwDWKseSObwM+x4u5Y+N7Wsv8DMlR+yqFpX/zVwfzMb3t
	aMChKsZFpKhdBKW+EdCPd7VUDdn4GepW68cxrkVK5XK+Hv/jGBzZ/xIkGWSRQiYoyQr0A8XO47q
	SshjGQOtDF5ZQyplsPu3V8aHcgv0QH7+gC3qFVFFn1ejWPfR5CAIrjYWb/sq1IewySNknqiHjTd
	pJWl6H3+kBLSuB4i9eon6H2tYp02NBDKpFHJWmHhnLLSDfMS/s03yUX2T2Enej9vBQIIlJQvmOn
	nByLMB2PtywYHYWCy3+L8W/TZIbWoiomr4zdK47hRsPPtZC1+meRiz0xAzUAZb19j7uVHB8V+zO
	GIVQUjIFNq7hW2K9fsRkk3EUOym3Z4pUnC1PYgpRJQsXsuEaxzKlfTbufhq+4r5l9aBW3dW7eVD
	mCu8nH2dS5ybqGJlSGBTcO1iiaDwlfDt+VTvNOP6EHMZftrv2pwVevYeVRC4BpV+0ly8dm93rxg
	VxKfrjonTw8i4hhGV5JPu+JEr8Q1v6a3hSKy5xX+7pukoW2v+tlVhV+1W4YLrmqaLwZ2OrK0j0T
	p0Uw5mvATQfUtWeig8cgzs+aKKeEtZHiVuTdWNJT+KD3wxk8zMczZIsu9vHh88chhY2iFyVa65A
	=
X-Received: by 2002:a17:903:2a8d:b0:2b0:60db:7927 with SMTP id d9443c01a7336-2b9f25fad82mr16490825ad.28.1777703754179;
        Fri, 01 May 2026 23:35:54 -0700 (PDT)
Received: from aegis ([2001:fd8:4d00:5302:f723:328c:6ae4:ddd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caa7e827sm36859575ad.1.2026.05.01.23.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 23:35:53 -0700 (PDT)
From: Daniel J Blueman <daniel@quora.org>
To: "Sibi Sankar" <sibi.sankar@oss.qualcomm.com>,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Hans de Goede" <hansg@kernel.org>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	"Bjorn Andersson" <andersson@kernel.org>,
	"Konrad Dybcio" <konradybcio@kernel.org>,
	"Randy Dunlap" <rdunlap@infradead.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
	Maya Matuszczyk <maccraft123mc@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
	Daniel J Blueman <daniel@quora.org>
Subject: [PATCH v2] arm64: dts: qcom: slim7x: Add Embedded Controller node
Date: Sat,  2 May 2026 14:35:17 +0800
Message-ID: <20260502063518.15153-1-daniel@quora.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AAE794B128A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[quora.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,gmail.com,quora.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105563-lists,linux-arm-msm=lfdr.de];
	DMARC_NA(0.00)[quora.org];
	DKIM_TRACE(0.00)[quora.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_PROHIBIT(0.00)[0.0.0.76:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quora.org:email,quora.org:dkim,quora.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

The Lenovo Slim7x uses the same Embedded Controller as the Qualcomm
Hamoa Customer Reference Device (X1). Wire it up for fan control,
thermal sensor and suspend behaviour.

Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
Changes in v2:
- corrected DT compatible node
- v1 link: https://lore.kernel.org/all/20260429103301.17449-1-daniel@quora.org/

Dependencies:
https://lore.kernel.org/all/20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com/

 .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index beb1475d7fa0..1ee2a2296129 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -951,6 +951,22 @@ retimer_ss0_con_sbu_out: endpoint {
 	};
 };
 
+&i2c5 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	embedded-controller@76 {
+		compatible = "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
+};
+
 &i2c7 {
 	clock-frequency = <400000>;
 
@@ -1352,6 +1368,12 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";
-- 
2.53.0


