Return-Path: <linux-arm-msm+bounces-104762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yG1YCEqM72l4CwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 18:18:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B178B476341
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 18:18:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DE521300DF6A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 16:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B3BE35836E;
	Mon, 27 Apr 2026 16:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GQfxqP9/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1AD35028C
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 16:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777306516; cv=none; b=dtysWkp8xmfyoykPUZd/Hghj4GgBqrb4gWLSrF09OO2T3Srrg/sYJKP4sGwuBnhPf+BiWFuRzBLmIwJFkrSq/ZPuuJ0p8HXxKVX2XyMQyDjFf5TbpijYG7e0R5nq41lvb7en6Syls+mu50Y+Rt+APk7UaFOt0BAx208V4g5r7ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777306516; c=relaxed/simple;
	bh=ja52A81219p0ePqreXtVMW+SLCQcQR7+LrrsEvke3mU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ILLCvNbu5r0Snn3DzSO72hkTkn/RT06hneCXe2XJU2beekzECctX4//KRGaB0IQAFj8n3Wxaco7/8M4iKqqmAxdZstM4qdCfOkYPC7QkPAFTg4YL+dzSoEKyeibCWqEkIg268ZCzbpdS7N4xkZ6YLjAdrh9dzYMFwALoLrszy+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GQfxqP9/; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso86452685e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 09:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777306513; x=1777911313; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EEGCvJMMGZUGWRRutNitBQD1FIXZV4buFivR+bBW190=;
        b=GQfxqP9/1tKU5sCwXQv2s9hWdphUhVJ8iWU7qSj92kpC1WaIpjyFggOo8+QwceoJcU
         gmAD+3fy+kJcJnG7YyLnYAU8+nRwQm4353xiVMx0hFdLP5MsNyANcTnmiHiAgMGYxDRI
         Syc7xtC2SFycWV3pyydTtZyQSOxtgbDK5yx0YlLvnvsLwsEgENXJ08la1CybGUSyihzn
         GaoqO4abUxv8d7bmzCkBCx4mjSNFbOxnZXJRHgKgesVNKLEWk2VPdxl6Vb2cYh5UH+2+
         +x5J4YPsDTiup2nQavVhQGHn0ZXBRKdD9tdyNbnzWwSS8V1XxNmGprxnMQQuNLSjw0Io
         nHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777306513; x=1777911313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EEGCvJMMGZUGWRRutNitBQD1FIXZV4buFivR+bBW190=;
        b=maQSCasNb09oqeERiiyuc4rmeCXZWvfc5lbVpsr6BpdU9v5yBW7WUBR2LFnKAnY32W
         9MDUhnbHTQ7RCkqdWllwgepHposv1q28xW3IMbXmMrStiJ+yPKyiHJ/fx5euyN0RZ4L5
         p8hRR6gvI5Kv713bfbkLh6rbaW6UBFiPAcoG8uRYceMBQ90S3Tb1BlCcB5q8lG5mfv/N
         Q1aUjfbe1Jb+rRkqfZK9onOYlODVDS1iXsgPOh1ihrjzO+Eraf/Qni/4aR2EFxgD1kes
         Hr6x6c19Y17DJ55GT48KZeaYtaSahBQAv1Ga7QMSM+KFXOcSLBLugIRvaTBWUaUYy3vj
         DPBw==
X-Gm-Message-State: AOJu0YzJBYDxLBvAbfRTVV8E0VVxjVWynlX/djeEFE05FI9PSsOWs2X/
	6K0U8NET4Q7E10cZpKlqy96SmxmZlxTOEntRYs32SmOsZU4wwS9z57rC+7vPYHQ/7pE=
X-Gm-Gg: AeBDies8EMnigdmLzqyrRLoyxuS+fxmPTZzkuWVz8ozHpJd0l2xbhvdozWVOk0mn+n1
	3egBWpvkM1YUyUbEkvu9RFkywgnU6XChMKurVTX3aReYohDlWTxjThqC6rbt0MWke4D9pY7cYtd
	tzsosDEB+TNsSJAzbiP7wcxmplTYIJ79NuVMnFyVL3z1MfwKPzYetPmYHrLUSWMj0k0pmtTyqQg
	hW/vA6Y/TL0CpzhpHs2pkHsVfw7aa31vSQVnXM9xqKtXFsOYWU7tnH4AHEL4fXi61o8njlXcskZ
	3Oh6KqlL9/Csx63IBW5QO/YrQXS9mXd6SWj3ISwM4qClk6VWoI31g6LMeXxoOfzHxDjVaaG/7PD
	ypRP24sjDop2No4EHzAyRQFyZD4Y4yHHAf1aPlUzEAdUpmKmmHz18OFyO4WEcmwiB05novaloTd
	m5yFRXakHC4OV6VTcxEw/hJg0Bg8D7Vy8QpEDJD899DE14yJ+dph22n8c=
X-Received: by 2002:a05:600c:348d:b0:48a:6798:52e9 with SMTP id 5b1f17b1804b1-48a76e00c19mr1628115e9.0.1777306513158;
        Mon, 27 Apr 2026 09:15:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a5aa3ae83sm831407275e9.12.2026.04.27.09.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 09:15:12 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 27 Apr 2026 18:15:06 +0200
Subject: [PATCH RFC 2/6] arm64: dts: qcom: pmk8550: add VADC node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-topic-sm8x50-adc5-gen3-v1-2-8a70f7b90a75@linaro.org>
References: <20260427-topic-sm8x50-adc5-gen3-v1-0-8a70f7b90a75@linaro.org>
In-Reply-To: <20260427-topic-sm8x50-adc5-gen3-v1-0-8a70f7b90a75@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1601;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ja52A81219p0ePqreXtVMW+SLCQcQR7+LrrsEvke3mU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp74uMHV9IkV+hAR6m8z5+XvyiJ8jBWig2Dko94AkI
 vk7W6dGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCae+LjAAKCRB33NvayMhJ0TGLD/
 9z0OPMlS+b6Ksh5+XnUkoro3vILp1uAs96hRYPdXBiBG8pKSoKj3ulu9x3TwCaUUBMmF6EqPJsXEZF
 K8Wq+LvpGE8a/U8i3Yu8cU9K2xbHD2l7GVSm/lKUTsPH5HbNE+CSnL9TqfLi/zckY24MK95j7PuE2X
 jVbotqxHmw4tjBIrN2Ti1cf2zg2GNXkllVe4sV5Cjl7DpJD3XMl6VYZoG7XS3BVf+AY2Z2SRLi//Qz
 /6O6zbeytvuJcMGWtvcEQUULJ2uKtXKIXEGWXb9Lj/g1dh8YhMti0YmEY63c4uPCk1l7e8RXPmws4S
 MqhnU8FULGejy6yiKeX02/geDP17gTVrnmwTExPjWUsI0HadzRFFja6h+6o+P5e4Kdy6jE0ROgKAAI
 HzluxwWWnVSlgxbLT5z4XUyrX7JHmWYy/1Neh9aOfKgD9b/wYfJsboHLu3g9ZQJ7enPXjaPn+Bkty8
 srziYf6JdtmrHZy6MGSldaXgZXJnEFZI2KroyQgyz1NTAb3ken//0ZKIpbBToGrVfyH5Nv63dHX0Gz
 IU9OPpFQvzI3BZNmwOtZw1uUbIfp96i9JR68ZH+6tBBqAJ2TUx7voSdIfZf1qnhR+64lD721M6XFJp
 +oK6ZxWjqPnJZXzZvr4idbdNai1mo6fOqBc6+wM2qF942ci+G6EfoI2twZfg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Queue-Id: B178B476341
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104762-lists,linux-arm-msm=lfdr.de];
	NEURAL_SPAM(0.00)[0.260];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_ALLOW(0.00)[linaro.org:s=google];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[0.0.23.212:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c09:e001:a7::/64:c];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.0:email,0.0.0.1:email,0.0.0.3:email,0.0.35.40:email]

Add the VADC node and the initial pmk8550 adc channels.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmk8550.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmk8550.dtsi b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
index 3049eb6b46d7..92d57d101c7c 100644
--- a/arch/arm64/boot/dts/qcom/pmk8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
+#include "qcom,pmk8550-adc5-gen3.h"
 
 / {
 	reboot-mode {
@@ -44,6 +45,36 @@ pon_resin: resin {
 			};
 		};
 
+
+		pmk8550_vadc: adc@9000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x9000>, <0x9100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <0x0 0x90 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x0 0x91 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
+
+			channel@0 {
+				reg = <PMK8550_ADC5_GEN3_REF_GND(0)>;
+				label = "pmk8550_offset_ref";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@1 {
+				reg = <PMK8550_ADC5_GEN3_1P25VREF(0)>;
+				label = "pmk8550_vref_1p25";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@3 {
+				reg = <PMK8550_ADC5_GEN3_DIE_TEMP(0)>;
+				label = "pmk8550_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+		};
+
 		pmk8550_rtc: rtc@6100 {
 			compatible = "qcom,pmk8350-rtc";
 			reg = <0x6100>, <0x6200>;

-- 
2.34.1


