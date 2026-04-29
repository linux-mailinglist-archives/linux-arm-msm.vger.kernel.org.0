Return-Path: <linux-arm-msm+bounces-105179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJDVDY7e8Wn3kwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 12:33:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9919493000
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 12:33:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0AB4D30300C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 10:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C15BF3E639A;
	Wed, 29 Apr 2026 10:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="bb5egrAt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726793EB7F0
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 10:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777458819; cv=none; b=lm6ukL2h823ZjGcuO0dsWPyv5aAPuSXgRs0wHM1N3xVaQC6XVoU1tGG5RfoVDnQwhfP7EuqiLz5bNcwO5VK3EGKXpl5/YRdT+pG9YboZ8z9mqMdv9F5t9lbe3kMk14Xrig76L3Tzo/QqhBvGHPSA9CjpI2bNVrxEiPTBOHvifjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777458819; c=relaxed/simple;
	bh=i2NtLLLhNCL83g0ecLJOBZbfQ33HYTTevueS7EHO/Vc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G3TB4DZsAHQLhXOrKjQxlDPo9CUgnTbPZ8rmZy7XKsgguN3fc2MU2xxgTn6WWXiZY2kZ7miEMJyzx5UDAfBAqpcyewVKlJRTtjibljS/u6qELvTw+SSqt9MMYmqIgCEvPyABkrhWR8uPslfU91GVG6okoxD4u73SP3W0o44z6ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=bb5egrAt; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35da2d35eccso8605439a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 03:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1777458818; x=1778063618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8RTUgu04LfMLANwSoXjWoPf/4vksRgEvuPnPFzRPOsg=;
        b=bb5egrAtSdlBmRUphTKddFPKFrDn+JTyUzfRDqq3oo7gBks9F7j7A3KNKngLOs5hWq
         VNsmyy91BmjcbxipAf9JIUIp2AetgJMwBOm+0wlIdHuoAQmH3g2nyYfP4LTM63iMBfTr
         PyuYNq+UWOPVpX1dYWaFiOs9oShDGLmMAVF80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777458818; x=1778063618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RTUgu04LfMLANwSoXjWoPf/4vksRgEvuPnPFzRPOsg=;
        b=N2gXnzgDP4qosUWYwcwUNyGXwjJA/44DpUS97Ag+vF/+7ZY/jbYjDeJmIqu1gYuzP+
         Nd6+kl6szGhNQypZIVC2ZLov6UFH5X9Ko9jEgxDRybiHLiByua2BjhdM7Ys+dwC5M84X
         m+bZrq1T049kskLRgeCkq4hs5Dp7R/SmTYZaMGgx+j9GaUYObUjGFC2vsPp/kVL9UC3C
         DCpl5f+3q/4vCKmEGq7zw8jCSHUU8jRSbBZS4fMme5ibualJ/DUpGk+Wot9WOQnb6EkX
         xTDsEi3hfbRMGokBbW4ApkQ6PYO9f5G+Qx5QwfdXACIszBvfAcc08lbbV0b3Lw+7FoPL
         FYTQ==
X-Gm-Message-State: AOJu0YzWW62ZYcLfNpG11qrWuM00LVW8bK3OYFBoHl6eyOB4DDkUrXAI
	Bra5tLWw6A8vP3YU39Hv97LwEwnAgm7dURhKDCPZO+yKFXYVg+MsOawTagl1YM/DOf74i0XYmq2
	In+a5oI7nfA==
X-Gm-Gg: AeBDieuSN6LfU74tjY9UDJMmZOy9rDYarNca8OJ4r2lw9cyqm6l8/P/SAKLIqsR1H7V
	qB8s41/RzaMVpv3SXwu2MowIR8Dm+7Kc+rUvxy6Liy2ZKfyUZ6Po6HHEB2Ar3yho4kNHj0iwwVd
	MlShLXZ9BJrXttWkVhW9EEh46E6JzDacauP5AZD+kK/4HBeMv4RDg62yQVTXkWhWUzny8K31Dyo
	d7f/Xk5ttQFDUd+4R2iEhBzrVDT6PGt01kSkut6x8Uh+pwQxrclxHiTDvdkXe3MifHpZ/hJoihY
	EgSpALjZKaCDB40vTdUp1UrEfZffFqtZ8xxlZvjBuGX2m8afSUD7S5Kz+puM1ahDylILog0Hket
	JTlC/ToNSR/7OiL0nmyR/z566OmL3AYr1zTUVDb9ttP6FKjFEqD8rqHzauP1yu4SDsQhp9fZdsX
	maNeK1eVC8nXqIx+nXE8qNPf/rnNsPK4E26zgrFlJcfLPPbzathV2spaPlB0sgq9w6BNS18BBOk
	0+CnuM+QPMIQqBirknk/yti90vpHoD4yf+i5bxIhU1ynvkT2EyxZEbj7WXQkhUt5LVHtdEV0WGU
	DZncWkDX00lz5qqESnUkb9PxjiRXtl2OJamgbKGjS/4hCcpEB2hD0i7udqiN8gjHLkSoAnRt9LD
	BSPg=
X-Received: by 2002:a17:90b:2548:b0:35b:e52a:6fe5 with SMTP id 98e67ed59e1d1-36491f89c0cmr6867110a91.5.1777458817863;
        Wed, 29 Apr 2026 03:33:37 -0700 (PDT)
Received: from aegis ([138.84.66.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a41a230bsm1955948a91.8.2026.04.29.03.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 03:33:37 -0700 (PDT)
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
Subject: [PATCH] arm64: dts: qcom: slim7x: Add Embedded Controller node
Date: Wed, 29 Apr 2026 18:32:58 +0800
Message-ID: <20260429103301.17449-1-daniel@quora.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C9919493000
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[quora.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,gmail.com,quora.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105179-lists,linux-arm-msm=lfdr.de];
	DMARC_NA(0.00)[quora.org];
	DKIM_TRACE(0.00)[quora.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.969];
	DBL_PROHIBIT(0.00)[0.0.0.76:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

The Lenovo Slim7x uses the same Embedded Controller as the Qualcomm
Hamoa Customer Reference Device (X1). Wire it up for fan control,
thermal sensor and suspend behaviour.

Dependencies:
https://lore.kernel.org/all/20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com/

Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
 .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index beb1475d7fa0..22c4ad34a2a4 100644
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
+		compatible = "qcom,glymur-crd-ec", "qcom,hamoa-crd-ec";
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


