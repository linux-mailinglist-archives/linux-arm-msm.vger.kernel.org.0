Return-Path: <linux-arm-msm+bounces-105771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WN0aGbDJ+Gls0wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 18:30:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D811E4C15FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 18:30:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 656273036EC1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 16:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 885D83E3C45;
	Mon,  4 May 2026 16:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uLj+zuSl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EF93E3176
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 16:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777912202; cv=none; b=rBAyfk+noTXRzdgYnmPL4x8xBG+r0HRnXf0uyfo61efBLScUxLdr0X2aS4WRUBI6La42rWLsBuTW5YHGRSnQGDWfzzi0KkMyCRPVrObMAQngCWZZ7/gkpQMVshgTzsCZGO6CvApsK3ZPGtdvhrOApywfdGNnyw6sjrHOxx6XaOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777912202; c=relaxed/simple;
	bh=zQPnmLqFrFXjyZHDa1Pk823AqDYDK0kMLO58Q2tjToQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dgoc02FYmxhyRmhPw3VINFXril9KfnP5CuHnXCFAIALyso6oZmiOtEMN3+DtI7VJljVY6q1oiezkDGBuq5FUQao+QeM3XG7NGl3sBERblVMaIBFgsGKgVtXjuRJnqhKyXSCLQf8SIMMBhRQPsLgR8ATbnx4cFjLMkHhInYP4qjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uLj+zuSl; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488d2079582so46497825e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 09:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777912197; x=1778516997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/HBe6/RKQNP31V5r+MzBqvaSoTBZDkASk3JvxbQczeU=;
        b=uLj+zuSl5/V/r+09uBx+hk04EElQag4VP68QagMKfowYOHJffrontI2cq9RiK2NxSh
         7tXgQFoxr6czguMsXu4wtHpLWJy/uSQgICjRRCcuWJS6hCLWubWXHffPlnOcEmSLFm3N
         flZw7E6ga1HnjwBQg/NuwKHNplQPZ/dC3iOySSUcQU55GOxMIXN88nL4tNNVTGTcJln5
         01oOdp0IvyyK4jE/mu8VHr/IeUjid7zm/E7BElh0Jqo/0T6IlDwVFJyXU4FW3fiU3ew9
         qHKZWEwivbD5hxULmLLK1EkbO1kd2flde80q2ZGDHARxbXX5M/YC0hqRFIeDS2gyQOFQ
         3sCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777912197; x=1778516997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/HBe6/RKQNP31V5r+MzBqvaSoTBZDkASk3JvxbQczeU=;
        b=brwv7GJ8unLAenMC5KwDI/9udQssOfgeEYvi1M4kM39HBhLCeMLcypP6JFAa5hrTmw
         NaogDrbQjMRFeSAUPVRBxm5YTVf/od3Ul6gxU0DuPqBr9AbaE9T8EEwmfrszGQxlf9PM
         q/jmo2HJkmoLrWGzk6PWyf8QPi25w8EQqk2/nSzhJEEDeYvlb0zXrKehmMt2pKXyGLxA
         lUnPa49h+pih3FwqtcYE/LiteuqWWwIUPtN+/n6Pz4g2966bGIMnh++4e+r31+50t1fy
         tf7prib0GBImHVR23zNYTxFw5/czbmWP3TsgLml6quoSFWCEFP8cs1otXt36foC8pFf+
         vhZA==
X-Gm-Message-State: AOJu0YwcKhZ+Qv91ZYLGe8W+HIBwZ8uVmxq67fXkMT6cJ1Wh/vO+E+LP
	/ciI+7C0SRb8aRE6eBUY0MlbD5oD0Qa8F/iLy+XSnPM7Ne8SQnUeWms6Eh3HaVLDNO0=
X-Gm-Gg: AeBDiesC022womOPjUaNQoTwTQSrK7An/esw6ZEU4ek+URQzEbl01hBKAwe8RxO/ioy
	RZRl+fsusr7HBZeJE0/t58HMargPSfhr78pI8mWjts9oSM/kuX3VTGwuhUtJZ/wXM8NVtgNYOf+
	CH6swIdAz6+O+KrOKHtbnscWcb4m6H4K++eY9iONEg3EbslxJjQhSc0cX0GX46aKs2nuQqdIteX
	VZFehdfVMKFpO/irmgwcVibGZy5KoxgJD3Z3U4V4I7z50pWW8e92DYII60+QWGdFZGnzzwZw6f0
	HYZnHe+VyzkeVDDlNzWpKoNMm2jyTc/whyG/2Rp/qg9K10wS4eFSUlBZ/jRFqw5Zs7QiFkr8kkX
	x9Xfqp936D/5C8acXxJPrOjUklDm1cQgaybSAjZUPI+AYWvpXGaQvGjTaaG8Oln5yTRkou9EZ0f
	irlbUpN1teEQe8OHZYsjCaHciRG3BozeGiywVl3n08rya2Sc7DkNXjy8A=
X-Received: by 2002:a05:600c:45d5:b0:488:a2ac:a334 with SMTP id 5b1f17b1804b1-48a9853c933mr166504675e9.3.1777912196820;
        Mon, 04 May 2026 09:29:56 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301b7bsm405071055e9.11.2026.05.04.09.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 09:29:56 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 04 May 2026 18:29:49 +0200
Subject: [PATCH RFC v2 1/6] arm64: dts: qcom: add PMIC5 Gen3 macros for
 channel numbers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-topic-sm8x50-adc5-gen3-v2-1-5cc04d6ecda0@linaro.org>
References: <20260504-topic-sm8x50-adc5-gen3-v2-0-5cc04d6ecda0@linaro.org>
In-Reply-To: <20260504-topic-sm8x50-adc5-gen3-v2-0-5cc04d6ecda0@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=18612;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=zQPnmLqFrFXjyZHDa1Pk823AqDYDK0kMLO58Q2tjToQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp+MmAndPDN/Y85TGnzzRV4RFOyjdmaP3OcXzQ0fN+
 Cc/sU9iJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafjJgAAKCRB33NvayMhJ0dGeD/
 4ppT/Hn5iS5ENjnWwGDJA0RRvajyn3dCxOX9SMYedIxzLAupbyB2t5OgZuJTZv1ZKzLCKVEaEUVZYh
 QTs495uGk6qF7gMchgcz8niDZ/IFWwVzVLTu0goWJ+D/0goyW5//jYdjxgr/irsbKOo4biDhSLgoYd
 E0Y+WHgwwWaft+zWEru4wT1ymVuecNgFP6oodVHu5CSHnwLnmNFK+s6jhPa0C4zRbBLsBoYmX+KdrQ
 RabG/h0Fff2+HyC6o8T73yvF7Z/15AncJy4BRpq8YmbQH0ZfgB6Bwpsy4WzQBfRbgZ+d6LA2LUeuvj
 IwEqeu/0cqQ6c0czkJMFeQqJEgNpnEuIUMpa8k+Un1xV68lAYt+dnqZvuC+yyk2CCB0xEZBrv1zimE
 FMvKx1gLEP9AMvZzmTEp9ePxI0ViwwPpFKndgZMw3mfs207cZJiuaGr3lwRkZ7aMNzwbv+cXM/c26W
 p3yLrv7ZO17eh/eeLaUQTnGk7kja1Ja6CXJOhqRof/Cjwoao40oB4jPPNiq5qXIC5k73xzbV4QxLRP
 JK2xYacF7YAL6YYjBsBS4Rbg18tD5HgBWqrbw5URFd7+WiikeiLnclV+daayBrjjl4oepBWP5OBwNo
 VQ0n3Lq9zz31rWFwQGvMGKGuit2x6d0NZWegIwcnc+rSUKdiL72wuRNQr2zA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Queue-Id: D811E4C15FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105771-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Add the PMIC5 Gen3 macros to calculate the channel numbers which
is a combination of SPMI bus number and a constant for the sensor
type and configuration.

The macros definitions were taken out of [1] where it was initially
in the dt-bindings include directory but since those are not hardware
bindings but logical numbers, they can be moved to local includes
instead to make the DT source more readable.

[1] https://lore.kernel.org/all/20250826083657.4005727-4-jishnu.prakash@oss.qualcomm.com/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcom,adc5-gen3-channels.h | 88 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcom,pm8550-adc5-gen3.h   | 46 +++++++++++
 arch/arm64/boot/dts/qcom/qcom,pm8550b-adc5-gen3.h  | 85 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcom,pm8550vx-adc5-gen3.h | 22 ++++++
 arch/arm64/boot/dts/qcom/qcom,pmk8550-adc5-gen3.h  | 52 +++++++++++++
 5 files changed, 293 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcom,adc5-gen3-channels.h b/arch/arm64/boot/dts/qcom/qcom,adc5-gen3-channels.h
new file mode 100644
index 000000000000..a8aac9ae6f40
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcom,adc5-gen3-channels.h
@@ -0,0 +1,88 @@
+ /* SPDX-License-Identifier: GPL-2.0 */
+ /*
+  * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
+  */
+
+#ifndef _QCOM_ADC5_GEN3_CHANNELS_H
+#define _QCOM_ADC5_GEN3_CHANNELS_H
+
+/* ADC channels for PMIC5 Gen3 */
+
+#define ADC5_GEN3_REF_GND			0x00
+#define ADC5_GEN3_1P25VREF			0x01
+#define ADC5_GEN3_VREF_VADC			0x02
+#define ADC5_GEN3_DIE_TEMP			0x03
+
+#define ADC5_GEN3_AMUX1_THM			0x04
+#define ADC5_GEN3_AMUX2_THM			0x05
+#define ADC5_GEN3_AMUX3_THM			0x06
+#define ADC5_GEN3_AMUX4_THM			0x07
+#define ADC5_GEN3_AMUX5_THM			0x08
+#define ADC5_GEN3_AMUX6_THM			0x09
+#define ADC5_GEN3_AMUX1_GPIO			0x0a
+#define ADC5_GEN3_AMUX2_GPIO			0x0b
+#define ADC5_GEN3_AMUX3_GPIO			0x0c
+#define ADC5_GEN3_AMUX4_GPIO			0x0d
+
+#define ADC5_GEN3_CHG_TEMP			0x10
+#define ADC5_GEN3_USB_SNS_V_16			0x11
+#define ADC5_GEN3_VIN_DIV16_MUX			0x12
+#define ADC5_GEN3_VREF_BAT_THERM		0x15
+#define ADC5_GEN3_IIN_FB			0x17
+#define ADC5_GEN3_TEMP_ALARM_LITE		0x18
+#define ADC5_GEN3_IIN_SMB			0x19
+#define ADC5_GEN3_ICHG_SMB			0x1b
+#define ADC5_GEN3_ICHG_FB			0xa1
+
+/* 30k pull-up1 */
+#define ADC5_GEN3_AMUX1_THM_30K_PU		0x24
+#define ADC5_GEN3_AMUX2_THM_30K_PU		0x25
+#define ADC5_GEN3_AMUX3_THM_30K_PU		0x26
+#define ADC5_GEN3_AMUX4_THM_30K_PU		0x27
+#define ADC5_GEN3_AMUX5_THM_30K_PU		0x28
+#define ADC5_GEN3_AMUX6_THM_30K_PU		0x29
+#define ADC5_GEN3_AMUX1_GPIO_30K_PU		0x2a
+#define ADC5_GEN3_AMUX2_GPIO_30K_PU		0x2b
+#define ADC5_GEN3_AMUX3_GPIO_30K_PU		0x2c
+#define ADC5_GEN3_AMUX4_GPIO_30K_PU		0x2d
+
+/* 100k pull-up2 */
+#define ADC5_GEN3_AMUX1_THM_100K_PU		0x44
+#define ADC5_GEN3_AMUX2_THM_100K_PU		0x45
+#define ADC5_GEN3_AMUX3_THM_100K_PU		0x46
+#define ADC5_GEN3_AMUX4_THM_100K_PU		0x47
+#define ADC5_GEN3_AMUX5_THM_100K_PU		0x48
+#define ADC5_GEN3_AMUX6_THM_100K_PU		0x49
+#define ADC5_GEN3_AMUX1_GPIO_100K_PU		0x4a
+#define ADC5_GEN3_AMUX2_GPIO_100K_PU		0x4b
+#define ADC5_GEN3_AMUX3_GPIO_100K_PU		0x4c
+#define ADC5_GEN3_AMUX4_GPIO_100K_PU		0x4d
+
+/* 400k pull-up3 */
+#define ADC5_GEN3_AMUX1_THM_400K_PU		0x64
+#define ADC5_GEN3_AMUX2_THM_400K_PU		0x65
+#define ADC5_GEN3_AMUX3_THM_400K_PU		0x66
+#define ADC5_GEN3_AMUX4_THM_400K_PU		0x67
+#define ADC5_GEN3_AMUX5_THM_400K_PU		0x68
+#define ADC5_GEN3_AMUX6_THM_400K_PU		0x69
+#define ADC5_GEN3_AMUX1_GPIO_400K_PU		0x6a
+#define ADC5_GEN3_AMUX2_GPIO_400K_PU		0x6b
+#define ADC5_GEN3_AMUX3_GPIO_400K_PU		0x6c
+#define ADC5_GEN3_AMUX4_GPIO_400K_PU		0x6d
+
+/* 1/3 Divider */
+#define ADC5_GEN3_AMUX1_GPIO_DIV3		0x8a
+#define ADC5_GEN3_AMUX2_GPIO_DIV3		0x8b
+#define ADC5_GEN3_AMUX3_GPIO_DIV3		0x8c
+#define ADC5_GEN3_AMUX4_GPIO_DIV3		0x8d
+
+#define ADC5_GEN3_VPH_PWR			0x8e
+#define ADC5_GEN3_VBAT_SNS_QBG			0x8f
+
+#define ADC5_GEN3_VBAT_SNS_CHGR			0x94
+#define ADC5_GEN3_VBAT_2S_MID_QBG		0x96
+#define ADC5_GEN3_VBAT_2S_MID_CHGR		0x9d
+
+#define ADC5_GEN3_OFFSET_EXT2			0xf8
+
+#endif /* _QCOM_ADC5_GEN3_CHANNELS_H */
diff --git a/arch/arm64/boot/dts/qcom/qcom,pm8550-adc5-gen3.h b/arch/arm64/boot/dts/qcom/qcom,pm8550-adc5-gen3.h
new file mode 100644
index 000000000000..2a6338812d4e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcom,pm8550-adc5-gen3.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _QCOM_PM8550_ACD5_GEN3_H
+#define _QCOM_PM8550_ACD5_GEN3_H
+
+#include "qcom,adc5-gen3-channels.h"
+
+/* ADC channels for PM8550_ADC for PMIC5 Gen3 */
+#define PM8550_ADC5_GEN3_REF_GND(sid)			((sid) << 8 | ADC5_GEN3_REF_GND)
+#define PM8550_ADC5_GEN3_1P25VREF(sid)			((sid) << 8 | ADC5_GEN3_1P25VREF)
+#define PM8550_ADC5_GEN3_VREF_VADC(sid)			((sid) << 8 | ADC5_GEN3_VREF_VADC)
+#define PM8550_ADC5_GEN3_DIE_TEMP(sid)			((sid) << 8 | ADC5_GEN3_DIE_TEMP)
+
+#define PM8550_ADC5_GEN3_AMUX_THM1(sid)			((sid) << 8 | ADC5_GEN3_AMUX1_THM)
+#define PM8550_ADC5_GEN3_AMUX_THM2(sid)			((sid) << 8 | ADC5_GEN3_AMUX2_THM)
+#define PM8550_ADC5_GEN3_AMUX_THM3(sid)			((sid) << 8 | ADC5_GEN3_AMUX3_THM)
+#define PM8550_ADC5_GEN3_AMUX_THM4(sid)			((sid) << 8 | ADC5_GEN3_AMUX4_THM)
+#define PM8550_ADC5_GEN3_AMUX_THM5(sid)			((sid) << 8 | ADC5_GEN3_AMUX5_THM)
+#define PM8550_ADC5_GEN3_AMUX_THM6_GPIO2(sid)		((sid) << 8 | ADC5_GEN3_AMUX6_THM)
+#define PM8550_ADC5_GEN3_AMUX1_GPIO3(sid)		((sid) << 8 | ADC5_GEN3_AMUX1_GPIO)
+#define PM8550_ADC5_GEN3_AMUX2_GPIO4(sid)		((sid) << 8 | ADC5_GEN3_AMUX2_GPIO)
+#define PM8550_ADC5_GEN3_AMUX3_GPIO7(sid)		((sid) << 8 | ADC5_GEN3_AMUX3_GPIO)
+#define PM8550_ADC5_GEN3_AMUX4_GPIO12(sid)		((sid) << 8 | ADC5_GEN3_AMUX4_GPIO)
+
+/* 100k pull-up */
+#define PM8550_ADC5_GEN3_AMUX_THM1_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX1_THM_100K_PU)
+#define PM8550_ADC5_GEN3_AMUX_THM2_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX2_THM_100K_PU)
+#define PM8550_ADC5_GEN3_AMUX_THM3_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX3_THM_100K_PU)
+#define PM8550_ADC5_GEN3_AMUX_THM4_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX4_THM_100K_PU)
+#define PM8550_ADC5_GEN3_AMUX_THM5_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX5_THM_100K_PU)
+#define PM8550_ADC5_GEN3_AMUX_THM6_GPIO2_100K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX6_THM_100K_PU)
+#define PM8550_ADC5_GEN3_AMUX1_GPIO3_100K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX1_GPIO_100K_PU)
+#define PM8550_ADC5_GEN3_AMUX2_GPIO4_100K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX2_GPIO_100K_PU)
+#define PM8550_ADC5_GEN3_AMUX3_GPIO7_100K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX3_GPIO_100K_PU)
+#define PM8550_ADC5_GEN3_AMUX4_GPIO12_100K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX4_GPIO_100K_PU)
+
+/* 1/3 Divider */
+#define PM8550_ADC5_GEN3_AMUX3_GPIO7_DIV3(sid)		((sid) << 8 | ADC5_GEN3_AMUX3_GPIO_DIV3)
+#define PM8550_ADC5_GEN3_AMUX4_GPIO12_DIV3(sid)		((sid) << 8 | ADC5_GEN3_AMUX4_GPIO_DIV3)
+
+#define PM8550_ADC5_GEN3_VPH_PWR(sid)			((sid) << 8 | ADC5_GEN3_VPH_PWR)
+
+#endif /* _QCOM_PM8550_ACD5_GEN3_H */
diff --git a/arch/arm64/boot/dts/qcom/qcom,pm8550b-adc5-gen3.h b/arch/arm64/boot/dts/qcom/qcom,pm8550b-adc5-gen3.h
new file mode 100644
index 000000000000..312daa846f79
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcom,pm8550b-adc5-gen3.h
@@ -0,0 +1,85 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _QCOM_PM8550B_ACD5_GEN3_H
+#define _QCOM_PM8550B_ACD5_GEN3_H
+
+#include "qcom,adc5-gen3-channels.h"
+
+/* ADC channels for PM8550B_ADC for PMIC5 Gen3 */
+#define PM8550B_ADC5_GEN3_REF_GND(sid)			((sid) << 8 | ADC5_GEN3_REF_GND)
+#define PM8550B_ADC5_GEN3_1P25VREF(sid)			((sid) << 8 | ADC5_GEN3_1P25VREF)
+#define PM8550B_ADC5_GEN3_VREF_VADC(sid)		((sid) << 8 | ADC5_GEN3_VREF_VADC)
+#define PM8550B_ADC5_GEN3_DIE_TEMP(sid)			((sid) << 8 | ADC5_GEN3_DIE_TEMP)
+
+#define PM8550B_ADC5_GEN3_AMUX_THM1_BATT_THERM(sid)	((sid) << 8 | ADC5_GEN3_AMUX1_THM)
+#define PM8550B_ADC5_GEN3_AMUX_THM2_BATT_ID(sid)	((sid) << 8 | ADC5_GEN3_AMUX2_THM)
+#define PM8550B_ADC5_GEN3_AMUX_THM3_SMB_TEMP_V(sid)	((sid) << 8 | ADC5_GEN3_AMUX3_THM)
+#define PM8550B_ADC5_GEN3_AMUX_THM4_USB_THERM(sid)	((sid) << 8 | ADC5_GEN3_AMUX4_THM)
+#define PM8550B_ADC5_GEN3_AMUX_THM5_OPTION(sid)		((sid) << 8 | ADC5_GEN3_AMUX5_THM)
+#define PM8550B_ADC5_GEN3_AMUX_THM6_GPIO10(sid)		((sid) << 8 | ADC5_GEN3_AMUX6_THM)
+#define PM8550B_ADC5_GEN3_AMUX1_GPIO1(sid)		((sid) << 8 | ADC5_GEN3_AMUX1_GPIO)
+#define PM8550B_ADC5_GEN3_AMUX2_GPIO5(sid)		((sid) << 8 | ADC5_GEN3_AMUX2_GPIO)
+#define PM8550B_ADC5_GEN3_AMUX3_GPIO6(sid)		((sid) << 8 | ADC5_GEN3_AMUX3_GPIO)
+#define PM8550B_ADC5_GEN3_AMUX4_GPIO12(sid)		((sid) << 8 | ADC5_GEN3_AMUX4_GPIO)
+
+#define PM8550B_ADC5_GEN3_CHG_TEMP(sid)			((sid) << 8 | ADC5_GEN3_CHG_TEMP)
+#define PM8550B_ADC5_GEN3_USB_SNS_V_16(sid)		((sid) << 8 | ADC5_GEN3_USB_SNS_V_16)
+#define PM8550B_ADC5_GEN3_VIN_DIV16_MUX(sid)		((sid) << 8 | ADC5_GEN3_VIN_DIV16_MUX)
+#define PM8550B_ADC5_GEN3_VREF_BAT_THERM(sid)		((sid) << 8 | ADC5_GEN3_VREF_BAT_THERM)
+#define PM8550B_ADC5_GEN3_IIN_FB(sid)			((sid) << 8 | ADC5_GEN3_IIN_FB)
+#define PM8550B_ADC5_GEN3_TEMP_ALARM_LITE(sid)		((sid) << 8 | ADC5_GEN3_TEMP_ALARM_LITE)
+#define PM8550B_ADC5_GEN3_SMB_IIN(sid)			((sid) << 8 | ADC5_GEN3_IIN_SMB)
+#define PM8550B_ADC5_GEN3_SMB_ICHG(sid)			((sid) << 8 | ADC5_GEN3_ICHG_SMB)
+#define PM8550B_ADC5_GEN3_ICHG_FB(sid)			((sid) << 8 | ADC5_GEN3_ICHG_FB)
+
+/* 30k pull-up */
+#define PM8550B_ADC5_GEN3_AMUX_THM1_BATT_THERM_30K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX1_THM_30K_PU)
+#define PM8550B_ADC5_GEN3_AMUX_THM2_BATT_ID_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX2_THM_30K_PU)
+#define PM8550B_ADC5_GEN3_AMUX_THM3_SMB_TEMP_V_30K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX3_THM_30K_PU)
+#define PM8550B_ADC5_GEN3_AMUX_THM4_USB_THERM_30K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX4_THM_30K_PU)
+#define PM8550B_ADC5_GEN3_AMUX_THM5_OPTION_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX5_THM_30K_PU)
+#define PM8550B_ADC5_GEN3_AMUX_THM6_GPIO10_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX6_THM_30K_PU)
+#define PM8550B_ADC5_GEN3_AMUX1_GPIO1_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX1_GPIO_30K_PU)
+#define PM8550B_ADC5_GEN3_AMUX2_GPIO5_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX2_GPIO_30K_PU)
+#define PM8550B_ADC5_GEN3_AMUX3_GPIO6_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX3_GPIO_30K_PU)
+#define PM8550B_ADC5_GEN3_AMUX4_GPIO12_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX4_GPIO_30K_PU)
+
+/* 100k pull-up */
+#define PM8550B_ADC5_GEN3_AMUX_THM1_BATT_THERM_100K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX1_THM_100K_PU)
+#define PM8550B_ADC5_GEN3_AMUX_THM2_BATT_ID_100K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX2_THM_100K_PU)
+#define PM8550B_ADC5_GEN3_AMUX_THM3_SMB_TEMP_V_100K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX3_THM_100K_PU)
+#define PM8550B_ADC5_GEN3_AMUX_THM4_USB_THERM_100K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX4_THM_100K_PU)
+#define PM8550B_ADC5_GEN3_AMUX_THM5_OPTION_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX5_THM_100K_PU)
+#define PM8550B_ADC5_GEN3_AMUX_THM6_GPIO10_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX6_THM_100K_PU)
+#define PM8550B_ADC5_GEN3_AMUX1_GPIO1_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX1_GPIO_100K_PU)
+#define PM8550B_ADC5_GEN3_AMUX2_GPIO5_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX2_GPIO_100K_PU)
+#define PM8550B_ADC5_GEN3_AMUX3_GPIO6_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX3_GPIO_100K_PU)
+#define PM8550B_ADC5_GEN3_AMUX4_GPIO12_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX4_GPIO_100K_PU)
+
+/* 400k pull-up */
+#define PM8550B_ADC5_GEN3_AMUX_THM1_BATT_THERM_400K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX1_THM_400K_PU)
+#define PM8550B_ADC5_GEN3_AMUX_THM2_BATT_ID_400K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX2_THM_400K_PU)
+#define PM8550B_ADC5_GEN3_AMUX_THM3_SMB_TEMP_V_400K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX3_THM_400K_PU)
+#define PM8550B_ADC5_GEN3_AMUX_THM4_USB_THERM_400K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX4_THM_400K_PU)
+#define PM8550B_ADC5_GEN3_AMUX_THM5_OPTION_400K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX5_THM_400K_PU)
+#define PM8550B_ADC5_GEN3_AMUX_THM6_GPIO10_400K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX6_THM_400K_PU)
+#define PM8550B_ADC5_GEN3_AMUX1_GPIO1_400K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX1_GPIO_400K_PU)
+#define PM8550B_ADC5_GEN3_AMUX2_GPIO5_400K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX2_GPIO_400K_PU)
+#define PM8550B_ADC5_GEN3_AMUX3_GPIO6_400K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX3_GPIO_400K_PU)
+#define PM8550B_ADC5_GEN3_AMUX4_GPIO12_400K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX4_GPIO_400K_PU)
+
+/* 1/3 Divider */
+#define PM8550B_ADC5_GEN3_AMUX1_GPIO1_DIV3(sid)		((sid) << 8 | ADC5_GEN3_AMUX1_GPIO_DIV3)
+#define PM8550B_ADC5_GEN3_AMUX2_GPIO5_DIV3(sid)		((sid) << 8 | ADC5_GEN3_AMUX2_GPIO_DIV3)
+#define PM8550B_ADC5_GEN3_AMUX3_GPIO6_DIV3(sid)		((sid) << 8 | ADC5_GEN3_AMUX3_GPIO_DIV3)
+
+#define PM8550B_ADC5_GEN3_VPH_PWR(sid)			((sid) << 8 | ADC5_GEN3_VPH_PWR)
+#define PM8550B_ADC5_GEN3_VBAT_SNS_QBG(sid)		((sid) << 8 | ADC5_GEN3_VBAT_SNS_QBG)
+#define PM8550B_ADC5_GEN3_VBAT_SNS_CHGR(sid)		((sid) << 8 | ADC5_GEN3_VBAT_SNS_CHGR)
+#define PM8550B_ADC5_GEN3_VBAT_2S_MID_QBG(sid)		((sid) << 8 | ADC5_GEN3_VBAT_2S_MID_QBG)
+#define PM8550B_ADC5_GEN3_VBAT_2S_MID_CHGR(sid)		((sid) << 8 | ADC5_GEN3_VBAT_2S_MID_CHGR)
+
+#endif /* _QCOM_PM8550B_ACD5_GEN3_H */
diff --git a/arch/arm64/boot/dts/qcom/qcom,pm8550vx-adc5-gen3.h b/arch/arm64/boot/dts/qcom/qcom,pm8550vx-adc5-gen3.h
new file mode 100644
index 000000000000..7a261a7a9cb0
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcom,pm8550vx-adc5-gen3.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _QCOM_PM8550VX_ACD5_GEN3_H
+#define _QCOM_PM8550VX_ACD5_GEN3_H
+
+#include "qcom,adc5-gen3-channels.h"
+
+/* ADC channels for PM8550VX_ADC for PMIC5 Gen3 */
+#define PM8550VS_ADC5_GEN3_REF_GND(sid)			((sid) << 8 | ADC5_GEN3_REF_GND)
+#define PM8550VS_ADC5_GEN3_1P25VREF(sid)			((sid) << 8 | ADC5_GEN3_1P25VREF)
+#define PM8550VS_ADC5_GEN3_VREF_VADC(sid)			((sid) << 8 | ADC5_GEN3_VREF_VADC)
+#define PM8550VS_ADC5_GEN3_DIE_TEMP(sid)			((sid) << 8 | ADC5_GEN3_DIE_TEMP)
+
+#define PM8550VE_ADC5_GEN3_OFFSET_REF(sid)			((sid) << 8 | ADC5_GEN3_REF_GND)
+#define PM8550VE_ADC5_GEN3_1P25VREF(sid)			((sid) << 8 | ADC5_GEN3_1P25VREF)
+#define PM8550VE_ADC5_GEN3_VREF_VADC(sid)			((sid) << 8 | ADC5_GEN3_VREF_VADC)
+#define PM8550VE_ADC5_GEN3_DIE_TEMP(sid)		((sid) << 8 | ADC5_GEN3_DIE_TEMP)
+
+#endif /* _QCOM_PM8550VX_ACD5_GEN3_H */
diff --git a/arch/arm64/boot/dts/qcom/qcom,pmk8550-adc5-gen3.h b/arch/arm64/boot/dts/qcom/qcom,pmk8550-adc5-gen3.h
new file mode 100644
index 000000000000..60b3b9c60d4e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcom,pmk8550-adc5-gen3.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _QCOM_PMK8550_ACD5_GEN3_H
+#define _QCOM_PMK8550_ACD5_GEN3_H
+
+#include "qcom,adc5-gen3-channels.h"
+
+/* ADC channels for PMK8550_ADC for PMIC5 Gen3 */
+#define PMK8550_ADC5_GEN3_REF_GND(sid)			((sid) << 8 | ADC5_GEN3_REF_GND)
+#define PMK8550_ADC5_GEN3_1P25VREF(sid)			((sid) << 8 | ADC5_GEN3_1P25VREF)
+#define PMK8550_ADC5_GEN3_VREF_VADC(sid)		((sid) << 8 | ADC5_GEN3_VREF_VADC)
+#define PMK8550_ADC5_GEN3_DIE_TEMP(sid)			((sid) << 8 | ADC5_GEN3_DIE_TEMP)
+
+#define PMK8550_ADC5_GEN3_AMUX_THM1_XO_THERM(sid)	((sid) << 8 | ADC5_GEN3_AMUX1_THM)
+#define PMK8550_ADC5_GEN3_AMUX_THM2_GPIO1(sid)		((sid) << 8 | ADC5_GEN3_AMUX2_THM)
+#define PMK8550_ADC5_GEN3_AMUX_THM3_GPIO2(sid)		((sid) << 8 | ADC5_GEN3_AMUX3_THM)
+#define PMK8550_ADC5_GEN3_AMUX_THM4_GPIO3(sid)		((sid) << 8 | ADC5_GEN3_AMUX4_THM)
+#define PMK8550_ADC5_GEN3_AMUX_THM5_GPIO4(sid)		((sid) << 8 | ADC5_GEN3_AMUX5_THM)
+#define PMK8550_ADC5_GEN3_AMUX_THM6_GPIO5(sid)		((sid) << 8 | ADC5_GEN3_AMUX6_THM)
+#define PMK8550_ADC5_GEN3_AMUX1_GPIO6(sid)		((sid) << 8 | ADC5_GEN3_AMUX1_GPIO)
+
+/* 30k pull-up */
+#define PMK8550_ADC5_GEN3_AMUX_THM1_XO_THERM_30K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX1_THM_30K_PU)
+#define PMK8550_ADC5_GEN3_AMUX_THM2_GPIO1_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX2_THM_30K_PU)
+#define PMK8550_ADC5_GEN3_AMUX_THM3_GPIO2_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX3_THM_30K_PU)
+#define PMK8550_ADC5_GEN3_AMUX_THM4_GPIO3_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX4_THM_30K_PU)
+#define PMK8550_ADC5_GEN3_AMUX_THM5_GPIO4_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX5_THM_30K_PU)
+#define PMK8550_ADC5_GEN3_AMUX_THM6_GPIO5_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX6_THM_30K_PU)
+#define PMK8550_ADC5_GEN3_AMUX1_GPIO6_30K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX1_GPIO_30K_PU)
+
+/* 100k pull-up */
+#define PMK8550_ADC5_GEN3_AMUX_THM1_XO_THERM_100K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX1_THM_100K_PU)
+#define PMK8550_ADC5_GEN3_AMUX_THM2_GPIO1_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX2_THM_100K_PU)
+#define PMK8550_ADC5_GEN3_AMUX_THM3_GPIO2_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX3_THM_100K_PU)
+#define PMK8550_ADC5_GEN3_AMUX_THM4_GPIO3_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX4_THM_100K_PU)
+#define PMK8550_ADC5_GEN3_AMUX_THM5_GPIO4_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX5_THM_100K_PU)
+#define PMK8550_ADC5_GEN3_AMUX_THM6_GPIO5_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX6_THM_100K_PU)
+#define PMK8550_ADC5_GEN3_AMUX1_GPIO6_100K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX1_GPIO_100K_PU)
+
+/* 400k pull-up */
+#define PMK8550_ADC5_GEN3_AMUX_THM1_XO_THERM_400K_PU(sid)	((sid) << 8 | ADC5_GEN3_AMUX1_THM_400K_PU)
+#define PMK8550_ADC5_GEN3_AMUX_THM2_GPIO1_400K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX2_THM_400K_PU)
+#define PMK8550_ADC5_GEN3_AMUX_THM3_GPIO2_400K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX3_THM_400K_PU)
+#define PMK8550_ADC5_GEN3_AMUX_THM4_GPIO3_400K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX4_THM_400K_PU)
+#define PMK8550_ADC5_GEN3_AMUX_THM5_GPIO4_400K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX5_THM_400K_PU)
+#define PMK8550_ADC5_GEN3_AMUX_THM6_GPIO5_400K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX6_THM_400K_PU)
+#define PMK8550_ADC5_GEN3_AMUX1_GPIO6_400K_PU(sid)		((sid) << 8 | ADC5_GEN3_AMUX1_GPIO_400K_PU)
+
+#endif /* _QCOM_PMK8550_ACD5_GEN3_H */

-- 
2.34.1


