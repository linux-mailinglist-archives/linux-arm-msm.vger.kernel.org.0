Return-Path: <linux-arm-msm+bounces-115902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oonEEkw4Rmo4MAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:07:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F28066F5A2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:07:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=zvQBA9+K;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115902-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115902-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A771B31C8865
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 09:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F097D47F2F2;
	Thu,  2 Jul 2026 09:48:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5B747ECFF
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:48:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985721; cv=none; b=srCh19XvbFPWptM1xCrWJnYwEjFZpx/0tcUCSYPYIwEy0E32g8AD9F2zY0TeqUfro/tmpCAHcjCxqWV1y6FZLdimEph1reZKHUtVUewJ8iuuesQZN8kB4bbtUhm1BK1FnkufoxB08TZX7DazL5x1IQSR8dE1Q+iYw+3FQHRhnTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985721; c=relaxed/simple;
	bh=DRcyK1Ists7LuW0qy2Nd7sDzgb/rxnBt67K668JzGgw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aLWl0JvHDq8jzajFgUxHAgktRokhKsZHGKIx5BViCkN2yzJcVrgXu8EeIfGF9x5fCA+/0zu1xcQL6qYzggoKiRWyE9oanNs2yW8UmfcMf9pHjXwED9bMmt/ndhRQnaQ2IU7Q57kQVxyaWAaVH8a8Aatwmex5RzkchQIsOTZrA7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zvQBA9+K; arc=none smtp.client-ip=209.85.221.44
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47248615e4dso1620375f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782985718; x=1783590518; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3VK/id3xDnYoG4iGuWnhU+rvfM11chuqqRcmhfRmmpk=;
        b=zvQBA9+KHwSkCCn9EZmZLCSiijJphlVFSTP0T3/gFsgR4L/kF1NLEnnbhtYrF9w5Lc
         LaoDB5ALlzRqW1kh3aLQ62DXsG8Sx3Oy5GGhKxpHSM/oVjozaccdn8XzrkP5LpSGhJQ6
         6Oa9mZ1ntvsmvUcRr28Ca7pw4/dTtAs1sCRYiXzHAztrvhcyU9Ezq4NB9ylRun13QRzw
         eHkI0xDL3Sp1ZjED8wsxJbp85OUG02tjSMnTJn9pxcwLF/9yCZPWSu9iJg5hw/owj/ro
         93ptp/DdQh7Vz3lnIEnYlF1WHwUHDYtySWN72N/dw1/SWTqdIdxoNReGP7UHcODZbzfN
         r06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985718; x=1783590518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3VK/id3xDnYoG4iGuWnhU+rvfM11chuqqRcmhfRmmpk=;
        b=msF51meGRqn5ATyPG4SwxN8+LJfxgJeYPXxBPtDVEiUYj1zcLbiqiVEZ2fdAiemE5v
         GNKQjvDz23t2Zs6DgDuI+EG2f0/0FEtT6Y02XElpO1wMlID6xktVvwACkRyByAkNZQ4V
         0KVYwUHFsVsvDLkgc1CjYGUpVt+CWEbvmwfaWeRf0kdQno+Z9XdTuKN+ixCJtA5L/nWj
         up6t1T4bIKoJuiaubD6mPIlYrQylfnzQl8cTt/XyXbso0VpRb9TGuNlJIXftjqI8ZXZQ
         oro/GbAjODpThqBDG8Vjd1NGHBSJuAu6Iiwrc4vj2UJfOoMc2oBsOfR8osqv5Ob5t9Ch
         lHsA==
X-Gm-Message-State: AOJu0YzPMRXqADTiCB/8vEEBm27dbXQ7r+5qoCesOVATo9fqCvGYPmP2
	1DunZWmbeOokYDliwPWa7kz4Q6VnYlTM5lRxUOQ9pYxEEoaTX3wIpyNtyo1krlrsBVc=
X-Gm-Gg: AfdE7ckdSb+sI2S7P69NqMpRid/6Oibdx7impETgpbBdR9vKP4vWQ24Ub6urE+hs1Iz
	wULWxWFx+/OfQpZssI/EyUEmnUsdsRglIrP33OqNnFHt1FW0H3Kq+cPJIDjdUd7Ug44d3VuO02j
	tXsIkmfi6Me0d7vgaOq4cNAnlf+ib4SeXhIQ7spQVz+Z0Q3ovBGTvOCKemGl+84k+qAwr3iBWik
	Uknw/okoeNDjScXBIsRhOl7lsSax4UdbrgaEgDHpuhh2ZWI7OOSjN8vFQFwX1gbVEZunkY0qleB
	UHw/5DwArN4kBjbxoOL8BVYkSidlLsTPGqQC+vqkbASmvxeig+HyzruC9ztZJhAIZuxamKzFpUv
	aV0t7Jd9aNtWEA0l5/C6kXMgQBOINmXab2F1/O/i3XY9AxucJ0dfR53FLkA2eDYdhX89u8x1oI5
	67rak3bsqCj/0DLINUwD3iFbXAB53Mvl/X4Q==
X-Received: by 2002:a5d:5d09:0:b0:478:3f4b:348b with SMTP id ffacd0b85a97d-4783f4b365fmr2962717f8f.7.1782985717870;
        Thu, 02 Jul 2026 02:48:37 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a4a09sm7656816f8f.13.2026.07.02.02.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:48:37 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 02 Jul 2026 11:48:31 +0200
Subject: [PATCH v5 1/5] arm64: dts: qcom: pmk8550: add VADC node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-topic-sm8x50-adc5-gen3-v5-1-8169953634ad@linaro.org>
References: <20260702-topic-sm8x50-adc5-gen3-v5-0-8169953634ad@linaro.org>
In-Reply-To: <20260702-topic-sm8x50-adc5-gen3-v5-0-8169953634ad@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1684;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=DRcyK1Ists7LuW0qy2Nd7sDzgb/rxnBt67K668JzGgw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqRjPxrLl+2y/YhpE14fa83jz+U1xKkplrS/FLk46p
 N4w7FL6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCakYz8QAKCRB33NvayMhJ0Vg4EA
 ClIQuzY6rk9v07bZp9VUMVjRjDdINn6+4vVeNY2pnWDFZO2GuTGrC6NIPeW+BQdNdlS1SN95CnjV2C
 VpSJG58Jr98qRiF+CaeHV0aVnPuU+3w2x2Xbx51UP6vDwDuhZlLRy7Jf9zjThDBhqdFbyDmhBV3gGP
 joUEaJxtYt55yGxwmpqOXrP/4MeqFGDwj/WQcAE5TfRuWcyyMDbYOVmsskpuDu9t8WAPJN2cYghMNM
 dhqH2Ya3AOJ1beBQoUWCVhThzAp4weHjTF+cIUwO/f32EDF+GQMqi0DaAe90INJaRlwmut7yjOehUN
 awl4Da9WuwNqPsogKujkLIR/gkxMaIO8WXJukwYWdufEys9gbAo6yTrgNj/oLtgUCHRsPI+VMhANHJ
 OvaiapbZTtPvCmuu0mvFUfcGDQ/w3zppO/psSc/U0sJAB2ddH+Ik/d8rbhMbQdYDz3R6WsI2MYdUs8
 pDWTe7QbEh0jof1hiXbiauvBkFgzBTVUmUhQkFRPA7wV7Gof19NpZR39KPn6m+mBGVozc3w5lsCfoH
 2JqBigi/7R3tSeZhhco9+0q4ClxYxqigzmNOB2NuwPH2JzF7rV72FufIsmba54NKBlnBvx8zNuiUOX
 92amUAWi0tMnMV3W4SuaO8G8DFjRas0pat9A2N5Gd5TiN5iPWJbKwZFP6nzg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115902-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:neil.armstrong@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F28066F5A2C

Add the VADC node and the initial pmk8550 adc channels.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmk8550.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmk8550.dtsi b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
index 3049eb6b46d7..3a9d9f7c3742 100644
--- a/arch/arm64/boot/dts/qcom/pmk8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
+#include "qcom-adc5-gen3.h"
 
 / {
 	reboot-mode {
@@ -64,6 +65,35 @@ reboot_reason: reboot-reason@48 {
 			};
 		};
 
+		pmk8550_vadc: adc@9000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x9000>, <0x9100>;
+			interrupts-extended = <&spmi_bus 0x0 0x90 0x1 IRQ_TYPE_EDGE_RISING>,
+					      <&spmi_bus 0x0 0x91 0x1 IRQ_TYPE_EDGE_RISING>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
+
+			channel@0 {
+				reg = <ADC5_GEN3_REF_GND(0)>;
+				label = "pmk8550_offset_ref";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@1 {
+				reg = <ADC5_GEN3_1P25VREF(0)>;
+				label = "pmk8550_vref_1p25";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@3 {
+				reg = <ADC5_GEN3_DIE_TEMP(0)>;
+				label = "pmk8550_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+		};
+
 		pmk8550_gpios: gpio@b800 {
 			compatible = "qcom,pmk8550-gpio", "qcom,spmi-gpio";
 			reg = <0xb800>;

-- 
2.34.1


