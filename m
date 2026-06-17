Return-Path: <linux-arm-msm+bounces-113634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bp2lFQaZMmpQ2gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 14:54:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DF563699DFF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 14:54:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=Oon9yAzZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113634-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113634-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 896813041795
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E50743F5BC0;
	Wed, 17 Jun 2026 12:53:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC54D3F54AE
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 12:53:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781700835; cv=none; b=UQEHR8FBdRKgZa4Aooae0RYfTuWR+JPEa72WtUo5qMW/X2ysjSEZBJxBzC4uapMSh3ZHCJAGRse9fL13oj4pPka5nzDGhLbCv7Gc7b16Czfvy0q4cCGiZ8bPsXG24W/GYI51yYwQFYvuMkCQ3U6rBwDdLDvUdhwroAJ41gaVuIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781700835; c=relaxed/simple;
	bh=9LjIdqxAzGA8nyRxHZsNelWOHdlFc7h4Fc4vaHKP3W0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LFiYOorRb5fRjwcjd7Rfk0Fcxw9abGn2ObkwyO3IxqmbYdf7J/gmuZo9cQx5lwPi4JRe9MScivLVUDFBK+kqyVq8oOl4X0Kkhq0F5nXPBRNEKvbRiVXE+WD0Zmst5lUWREPx8KTqO8zOM4/0RZINcFhDZsJEFqQBQfquq6dOOLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Oon9yAzZ; arc=none smtp.client-ip=209.85.221.51
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4619990ca5fso2166882f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 05:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781700832; x=1782305632; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9MYvgWHAkHUaG7o3YOGCvdHosSAjO5JAruEtY+ONrXQ=;
        b=Oon9yAzZADmIVPCHRaC1aw2ZPg1FosYq15e0kb8Z6YztSY5pZbb75z0BpuhU1F8YK7
         Zt1XRA0GwG5xvfLPWMjt4oi2H15HFaHmalbSsfxKa0oB3Vv4rWzo/5q9qsGHQdFNbrHQ
         lPH89QIz1PvS7PjnkKI4FMh/dFFTVXT/pHEoAymfEp0yHp4Yv3ydxcZaT5JoAucEk03E
         qpOiA/2HHeKROUPB3nBfCBYr6RxtH2FgVlKQx+FKibXERxSANXEhUA88p+4Gn2ZtvGm8
         Qu5KiNsjq0rQeUnFuxBSRX/r11HCEr4vxkl0LpR7ChHeqd+BUVM0ObTBmtZKpbOaAgVS
         ZEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781700832; x=1782305632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9MYvgWHAkHUaG7o3YOGCvdHosSAjO5JAruEtY+ONrXQ=;
        b=HIdyWpKLPw8CdloE11phQd3NI2XzGexXgc1yQzE7qUe3ewCZmpVGVWgj+p2K3T0e1T
         7gyAVWzZftumiBOsdB3P8c3zkLUBdDNVCJ7iOX+8jIqcfUApIF2A/HpNx0r3yz5hPph2
         P0GhXpGLzjYqY3dgDu7DPtjA5CHnJt742rOgsTFCXEyEI8YE3k7Dg+KO4xJaS1BgMCCK
         dkhlE9UY5Ernaa8I4bSYVOWRCHxy2cs6EIDsnKuC8D4t3jC5e6XpMrMcwVLe+ZYSI1zX
         5jrR9TIaxIlAYmKF7m0q99Img1McN46a5y2B3pbAN0ikfJ0UvLC75ie+qmRwcOyOgyQO
         rJFQ==
X-Gm-Message-State: AOJu0YyWUhUekXnezBsBjifUoAsWcM9wZZr7xslj1vwhsylrquPAlBRw
	tz9Wn7YMO6Xfa2Y51OY16f2yGgBInPaia7NEjdBH4tbqxriwMf+zcg2Rkay2PI9MYxw=
X-Gm-Gg: AfdE7ckxIfEmjRWJwV1aj1NdFb4BLBusu8OxUlp/CB8e1hsch27TK4f23OFMzC4ZpHa
	ieQzLoFYSF56qBKY9gDVERy7j4jVLIJRTs7rZxPdAbN1KF6ekH3YlXhloWWb4MxrkCZmE4zN72z
	PeuIv4tHnf3Gf9H9Rw7mSy3mZEZatY1v5AQ5V1QdEPvl7nSocH2dRmg4J4doAVU/xXxCXgDBlIP
	Yiz0R6vy11ym0TdRjHHRJkMXjPonRYQenE/MonB2Jvc/ux3A49O0C1D96fOiXb/I5NbkoZfKKYh
	IOMTgVBr7F7v4KBWqSk/2R4Pr3O7v00SA5wHDv/kby3XJMr22Gt37Pz54S4xNmCjxy559FX6k5c
	tj1eFcRC2Iufgg3qwoWdUtEYPGMnu3vsr1jAbW95x7V0H8sMqjQ6WjPVh96Dfxr0rcv8TZR5CoO
	AJoim/aSrNJTWgsrafDT+C8z7ms4PeCe1zXg==
X-Received: by 2002:a5d:6ac8:0:b0:45e:e1a4:c4c3 with SMTP id ffacd0b85a97d-46236462012mr5351485f8f.15.1781700831949;
        Wed, 17 Jun 2026 05:53:51 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-462236047c8sm9130562f8f.10.2026.06.17.05.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 05:53:50 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 17 Jun 2026 14:53:45 +0200
Subject: [PATCH v4 1/5] arm64: dts: qcom: pmk8550: add VADC node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-topic-sm8x50-adc5-gen3-v4-1-4af9251731f1@linaro.org>
References: <20260617-topic-sm8x50-adc5-gen3-v4-0-4af9251731f1@linaro.org>
In-Reply-To: <20260617-topic-sm8x50-adc5-gen3-v4-0-4af9251731f1@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1565;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=9LjIdqxAzGA8nyRxHZsNelWOHdlFc7h4Fc4vaHKP3W0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMpjb/AYQqnbXL/+ebEyFlDs/Sb6NOySe7vVL/8YO
 kEKuZ6+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajKY2wAKCRB33NvayMhJ0dUzEA
 C9F8bEdrJxUF+YKQR7KkMoogmOeBImh642IteRv6opb1FkXRW2RpCjtgiV8pMdjnFIVt1+HoRC0HFu
 zoAL6u+HUy/lVLMZP7gpQfJYbyRz7iTWmR+TZPgWg4AQtOFTa7ZQDLFF+uP4mge/R2yObJM/LnwQtz
 NsmucAbX+XdUhpK06by9lhTVIgYbK+hTaliB8X8k+v5En+o1QJv0Tc9s2VDIKuZq0TsdSjy3NUJs2x
 bPlQ1g+kUjmGEl5Qj7FHBJ6XJHT0wuFFj+zj9Aq3oV5cZSPSbp02KtZz35c4Bx9+YdkaYewJWpR97Q
 BTM5hM7ilLh/+U8xn4fvv6Xnxo5mEpXoklgk0IymXnxB87c+bG6WBcVjqbgVrydcyCHmWh7HOGoBPo
 wo45Y1RSWQqZA7mHranEzK0SVt3v3WGNgeSG99NiPr7f/bFe4V7w6Bg0qb7YHEcBMhepUvIe6f57bo
 eg7/8oIYa4WrSvYhfo8OqbyEM/pnr57S9jft79gqdnY2niWITvi3Rz14GRMKeJfmnMgY4QvFmlCjql
 db302AAWMjo3KCEVfdr97W+afCc4dt4jFt2vgOFqFuP65UGp8QqqQam0DCJfJzv8a0BP7HKHiFMBxs
 bTigj78hg+QtntHFYmkxsg3Ftmm8JoYV1tHuhnCvZ40GFTe299UJKuo0y8FA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113634-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:neil.armstrong@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF563699DFF

Add the VADC node and the initial pmk8550 adc channels.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmk8550.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmk8550.dtsi b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
index 3049eb6b46d7..639c0b1e0c33 100644
--- a/arch/arm64/boot/dts/qcom/pmk8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
+#include "qcom-adc5-gen3.h"
 
 / {
 	reboot-mode {
@@ -44,6 +45,35 @@ pon_resin: resin {
 			};
 		};
 
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
 		pmk8550_rtc: rtc@6100 {
 			compatible = "qcom,pmk8350-rtc";
 			reg = <0x6100>, <0x6200>;

-- 
2.34.1


