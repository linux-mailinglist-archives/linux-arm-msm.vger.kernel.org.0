Return-Path: <linux-arm-msm+bounces-105770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDgKAZfJ+Gls0wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 18:30:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C23C4C15C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 18:30:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9707302A52A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 16:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04E733E3C69;
	Mon,  4 May 2026 16:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f8BZMc7u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BDA3E316E
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 16:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777912200; cv=none; b=hH5dsiBvgxlM3qCek8WEYoUCQIkHDVM0VI+kydm3klvmwdi3ntI8NjJphQOYFSnQ+EoC1POQKF8bNHl1YTA2tEHIOHPJpJ+2+k1Ig3H9mvyguCCHxv4v5PVwjpiHehqs/YarTbhRKZZ765kvWTyAoWGCUSuOUsLegRlCT1+EwGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777912200; c=relaxed/simple;
	bh=7a4mitWB+CP8nQNV9k3Hn5b6MfzrVl6jjOTLFj2jUWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uZDQcDHTrLHlKtpXMoIwaIkZjtU8nMtM5fCBPP2lRAFr2IgUEpa9POJUDeaMmNBjqyT3Jm37OHakAUosBeplbWB+mqvefkSXHmwbp687GYV9a9N/+Ao9AwVOcbK2D4UHYAaiwbtBakkRkLpvlmp1e05RhZ3D+AVD1Qy1RxPRBlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f8BZMc7u; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so34705445e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 09:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777912198; x=1778516998; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5+VdzbAXe/Rlb0p/Xi6bXIiDc5JUDQVJT5OnBZINtDw=;
        b=f8BZMc7u8Br8te45osA2JWJo0lGCFLK9XFmAZUDTZ4yxKlhFFGUN2HL19nvXKiVgTY
         4UrF5QRZ4ZPREkD4OwpM3+u5x5S/gjBJPkVDzwFhlczkMzfSxZBS16PC5ZaJHeUHmgor
         asPo3gr8aY0nvLA1zO/hYSu4LTuVqOC/K1wAacS69/wArYne4jWKs33Gcp6e67gkIyua
         M4Bh6/3Vr1ro0ugwGAaXP0H5dOOzC2okKFP40sxI12htVFbY3VOqvvJpq/EABWeLqup3
         3AWvJrJgtUWa6TV8PaDLpNXJ3PZ3W817D1IYOEmzW3y0dl1uUxq4rTmfQRff8rF7KZPJ
         jBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777912198; x=1778516998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5+VdzbAXe/Rlb0p/Xi6bXIiDc5JUDQVJT5OnBZINtDw=;
        b=rkA0pFoQqdGSTfNrordhfvJMLfY7PsQjQUHYKrSsl+27TWebNaKf/cy5Bl8U3auCkU
         o7zl6PCk8PU2yLjrgjuXCOczQpoSJiu+hbu7jSlELmOaEXyiW7mON8WdnQsPCZW33aiR
         0FYyz1pGv1bFIvg8Bw1CutlIhiGbVpqPSAUiL65QZJZgdmDeAMgpWu8GhKYeIKE4t1FK
         m1mQrlMnEOYiAzSmB41az65p0fSLC9Z9IzpUGTKz7MO1LQoFAEl4SoabA39uvjZhNqnB
         xwNudgMeunSu/hesRURpUZKTNZCq1+AlN426wl2qiXnNuoA+z02gcfwSZuB84aY+YqQ9
         qETw==
X-Gm-Message-State: AOJu0YzA9xZQdJs3UCWxZB+NDSGF5a14oUKAPR87ACu0KCFWao2H7bi+
	4WqSrTXuhJf+SXImoUyXzowJCFBQxqvWAsyffHPs9NVxJWCDrse3YcOpVIHLrrPCHTo=
X-Gm-Gg: AeBDietov53H/YaDCVvrlSJNODSnGrvYlT719PLPYAfuionWCy6y4IWApyczZZebPKV
	NYKIA68la9wp3+uIM7K3dNO5f8lYgu5cRcMzq0XDJVA/Pa6U8RoeGVTCrYnUyadigDm2y39y2D1
	27Bj0OIvjhF8dD3NHMxFYkd4qDM4WIxTEUia1Bt1T1K3WHMBISKJ63GqAevZOI1CVff6V+aCzOS
	lUvvbrR086RTG1EvjJsl2Jzb9d4PiRDd6uPEGpEaOFOECZH2kFivXQdIjZPhP3KxDRGjaupj+KW
	0cLJ4koMy+9gN8l1K9DY2jRql0cidxp4u6omQTolNNpJDGaY1mrzBOPAPdGv+KQFw6BXglHnjlW
	KFiUrR+p9aojXAjBj6rXQ6AFHFuTt055eJnNUvwiFdIPap9AEnaLBSREiJ5QAWroC+1MSwe1/TF
	k49dAuLMmcm8pmqO33iOp1RSTgfU+5PBd5uqw1I/MjcAllAWkf+twVd6dXw0JMYA0cJQ==
X-Received: by 2002:a05:600c:3e07:b0:489:201c:dc46 with SMTP id 5b1f17b1804b1-48a98640536mr168020275e9.12.1777912197519;
        Mon, 04 May 2026 09:29:57 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301b7bsm405071055e9.11.2026.05.04.09.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 09:29:57 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 04 May 2026 18:29:50 +0200
Subject: [PATCH RFC v2 2/6] arm64: dts: qcom: pmk8550: add VADC node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-topic-sm8x50-adc5-gen3-v2-2-5cc04d6ecda0@linaro.org>
References: <20260504-topic-sm8x50-adc5-gen3-v2-0-5cc04d6ecda0@linaro.org>
In-Reply-To: <20260504-topic-sm8x50-adc5-gen3-v2-0-5cc04d6ecda0@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1597;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=7a4mitWB+CP8nQNV9k3Hn5b6MfzrVl6jjOTLFj2jUWk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp+MmA2HAoftt8ljk1CUAVolLq3pN2NCRdXTJL8H9C
 jo1jMpuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafjJgAAKCRB33NvayMhJ0fqmD/
 9LC03AW8uj+0Hpr/XqW10Uuk7oLHVtzWJXQt2H6BKeUNi2JUbMIv/+aHRudIP4Vq+ol7a9+T8R/Xv0
 uDMOH8ewkfpe+OWUXWz6lh/W2Im9T0bi8goGVcnGQInuR0L8Kn7S3WWcnrknNaB2E8qbXqJ7/y+DBG
 rhzW2AIPqLbWx1ahXMycQqt0BrVF+JHS5TJxHRGthxoGaSCSlP4zbWQdE+7V1B0d7sAhUItn9CrNRK
 UbVuox21wwOxfiKvLqCAXERSO18351WBFz82ZkJBDMns2YUJSVE4UC4lClOvgHICoMfrFKxYJqgzPd
 JCvNZ3UswP5DuM3iZkUj0o0//41YeEE0s8YSJCnicwWBv2m8WU0XZ/VU/IYURynYa93B7XdEvfcLl4
 a2DWXEZhIexwuIx529EiZSU7mZWukdBXHVwuOts6N6CRnBasaZb5tDT1F5HfNIfKEDTwH/eNNwqrNv
 T8iy+j9QNYgCs8JvI3zIxWmQdekJZBqduOahOGvtCRq0xDIapyDavNbVyxl2GddMoR+6yIBASoFM31
 wBAA2ajFQ0gnQ6OXdEsPltncmmvdXIrzEMevmxrNHgr1wdhbMkjoUXqOCNPyjR8Fwtt/BBMHcdY08M
 KRTQAt6nVxC5btASySUh5SfPk5JBLAlEOIF/+qU1W3z20B1K85FffahGur2A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Queue-Id: 5C23C4C15C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-105770-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_ALLOW(0.00)[linaro.org:s=google];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.23.212:email,0.0.35.40:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.200];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,linaro.org:email,linaro.org:dkim,linaro.org:mid,0.0.0.3:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email]

Add the VADC node and the initial pmk8550 adc channels.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmk8550.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmk8550.dtsi b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
index 3049eb6b46d7..515cae060f27 100644
--- a/arch/arm64/boot/dts/qcom/pmk8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
+#include "qcom,pmk8550-adc5-gen3.h"
 
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


