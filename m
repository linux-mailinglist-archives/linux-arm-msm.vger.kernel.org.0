Return-Path: <linux-arm-msm+bounces-85545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED09BCC8AF7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 17:09:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B598A3051D25
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 15:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A9D8345CD5;
	Wed, 17 Dec 2025 15:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WYhHfWrw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DDwGf7ln"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76014214A8B
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 15:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765987010; cv=none; b=ZzxvXM5JkUIBJiBRrCUXny8cmoZjf3B+uFaASzRafwDBkp5ncBCUg/AbmDDMgGlL8YS6R8FVrt+a5JtgDNBAr6hCfIM5pGto8WAF3kHapnYLACttyDKaPVRx8F5MxsYas3Qxmmj72YADKL1j9l8FHRDDJ6PSD7Gc4b4JvKSCFo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765987010; c=relaxed/simple;
	bh=zuRPk2/Afzgk7PvKtFu8N+ICcQbTqBU2rCeXot3Hjuk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=noZWkt5dpMQ7IMXzG5Hr0/7/BUG8DYwAZHvUsUtrpypjHDoodMfHU03iOrcsQUU57Z5FhHXraehSa6V6mqOY+XQmLxFw3ouA90aVdqHbRB9agpMKWt3zcpB9NX8Aek9TJTOxhCrJ6oNFlDpJ9E+I2kn+EJF4T46qUX1o7IfvH4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WYhHfWrw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DDwGf7ln; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHEvZUO2720773
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 15:56:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Gv1+vPEhCcBI9MayNNvbV28CW8IEjt8w3tTHVfkNkM=; b=WYhHfWrw6Gdq+JRM
	irZXCoKVwrYI8ML9sImEnhN4SZHQ7vpK3tX3utMkNPBUqiLq2qFZIitaxj/dnbR4
	3VKtFKPXkDJTI2YNDRnLZZ5qAEd0RY5w9YvlsoaqqWVDUbgU1X0KN+izSjeSrerM
	QRB58B0CtkfM/idB3naS9jZLsFL7kgJXvyk/eGa9vPrnwkvRhlvxUAHnIYotBIcm
	XcOXdcixeHxSAyI46q7uiJVrebBnn7XK2S4FsuZbbVc4cxIuXu3dxTWKuMNUcy/n
	LLyMm4lAdRXCtkAdY10SI2meUCZorKPQPZ5GpNVbnLi3HB+/tNwYw5vs6oPKgbAV
	iZHYWA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3xr5879k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 15:56:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f183e4cc7bso113103901cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 07:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765987003; x=1766591803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Gv1+vPEhCcBI9MayNNvbV28CW8IEjt8w3tTHVfkNkM=;
        b=DDwGf7lnNB9zU2lzRaQk338uCimjlqsl214E+abUy6Q9AwXWYzXwnHTFJgzMoVkzVy
         ujF/pJWpM0oZnyZiGnD6YX2q3NZ3xZs56fTmPTNAyaicSJwzFQmAoyDmsnxFr4BwoTpt
         SmDeD1ay9AdSw19iET6st0AbVViHIfxHsH7KwzNuJhuhfx9ZyyxTng99o5Sc/zpd43Ee
         tEzbU48hTfFtpwHGxdolfjffTSYaZBs3nNGNzxyPZQ0ZHh/moPfkX/v46TA+N+SDfUX9
         /1VeXKZCT8BRFzBQo49hD/VoMIevxS5NdhJ+g4KNnb+5nYSWJgdIslSYB5gP8icJiil+
         8peQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765987003; x=1766591803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/Gv1+vPEhCcBI9MayNNvbV28CW8IEjt8w3tTHVfkNkM=;
        b=lyxg/DNa5EM7pILXThfPw4kW2AkX8juBBC3wyRrfhEZJHZZvttqijxhdsEnUMyvduH
         XH8/oY6juZuyHpQQukXZyBY+soRw+6FFhE8TUiP0s2kot6FaeiYSiJ43QPCXcXjNAH60
         z3N8KVQzBkt9Ze8sOMZjtOrEobEs3+yHXDhKU3HcJiLHZ/pvIZdtWMl0xqxRl7u6vESK
         j+VJ4LbyCfRMHGTGoOeLsfokAG/jrasURh5Q0ik1gWyz5u2DIPQSiK0AJ9gP53ooI21P
         /e4yR9SI7sTIcOAtTCQymE7bQbN5qOha7fcKeuZ3nZ3MKCdhm/I2qiHXg/z2BHUcpoZE
         7ERg==
X-Forwarded-Encrypted: i=1; AJvYcCX99l3VG6t78P/dIIHQgUYYWCDmHq3hishOd91OpMhKXXkIzYLlVXqkahgsxZsA7Cuojt2caP0hunYf8gYc@vger.kernel.org
X-Gm-Message-State: AOJu0YwgOLzesNpayHkGM2NDNG5x8MIKjiqr4mNQj7VkHrYuaDayhx4K
	dQiidk7ZWIuo+Dzt72aPgYujYzjHuJoDFbnmhRAaAgM1WAInzMmnfAG/FRqkmNSKO9giMZyOzFC
	i86sOtBXvRziWHE3bNSp4YJoEu+28beAhJw2dxReBLbN2teqC1ibq5OzT/QRkE/Q0yiIt
X-Gm-Gg: AY/fxX7VoDhPuh15D2Cw/f522LmHGbMmAIn6/h9SEeZn8JfyupTB8pN8cx/KmPa2slh
	f0niimjhSiE0KQd23mKkSsZEzxBz+QSkhSKdTTIA9aeosT+rEx9RWUnK7krIGLJt+V9DrN0fL6g
	Jvnnr2/oOIZvchIkGghx0wtUXSiiE1hIsgzXX3DW6IPyGGncOC/J10CkrNFTrJmEnZ3LnSCf2gE
	jdVO5o3goyKultuU7Ae/P4SmIzIsVbOS96xltTfs2uDlYzj8V/GNuMMVdO3OWnUUW/YXB1zll5z
	sfUl7OUectlOWi0DOpxsWy0PkwrEDj0lT17V7H6HH698LBOp85yJXjk7NEbjDfDzbV8eE3nNPx4
	K6OLzyi9+NILs/+yT6TP5+GPbzTI0h10J
X-Received: by 2002:ac8:7fc8:0:b0:4ed:ae8e:cc73 with SMTP id d75a77b69052e-4f1d0625feamr262098081cf.65.1765987002932;
        Wed, 17 Dec 2025 07:56:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFszvOAqwJZdZwL6lHqBOW+JIMIiR1CcEXZkVgGrYioTclkhe/j+yesXBDLYDIul/as1U8kA==
X-Received: by 2002:ac8:7fc8:0:b0:4ed:ae8e:cc73 with SMTP id d75a77b69052e-4f1d0625feamr262097641cf.65.1765987002405;
        Wed, 17 Dec 2025 07:56:42 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4310adeeef6sm5439800f8f.32.2025.12.17.07.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 07:56:41 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 16:56:19 +0100
Subject: [PATCH v3 01/11] dt-bindings: bluetooth: qcom,qca2066-bt: Split to
 separate schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-dt-bindings-qcom-bluetooth-v3-1-ced8c85f5e21@oss.qualcomm.com>
References: <20251217-dt-bindings-qcom-bluetooth-v3-0-ced8c85f5e21@oss.qualcomm.com>
In-Reply-To: <20251217-dt-bindings-qcom-bluetooth-v3-0-ced8c85f5e21@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5907;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zuRPk2/Afzgk7PvKtFu8N+ICcQbTqBU2rCeXot3Hjuk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpQtKtW/AN9ZGPilomM6/n6U1xuuK5oxdHumUfr
 RGQZn1vGs+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaULSrQAKCRDBN2bmhouD
 14XiEACbhesC4614UebeM8B0VWbitp/QDoRYLqVlVAEKsUxuNMwnJBcIkOWOnNpySiB34tTa0qD
 EzTHI4fazvYDCCCq3n2Goro6PD2VkAbiDP0hM+grR+uKBG4aiaLKzeXOtlcAIT0MrL6HH1hcabQ
 Fk7gt3rzBcGICJ0rvu9/Vuq5pPGvRG4gq5dYU7zboILVpITghcuVWnLa9rc4Cc5zCW6FPJsNcdZ
 PrCdfPFkOTzwaYkAPeom2RgIujKrTXHKbBKrC+ItzCecvPRzWk4NpXgWD/+zeWndimdnY1Y4syQ
 t7SvG4bLfgje+yY6qORntpHsdqNaRVX3J/05k0KQywa9xm80omCSXWkBay49wIvTlv4jLzRUtZ+
 hyMMlJyCYIlVKnSf1zpcvF5Pq3DdfYWFGg/h1yamU0SufqMVxvMVlzPv4g6g1xlBwLUJp90EYtT
 V6bphjSsfkccauMTavp8zBObVQfmV1Z2JcFmqCm2tw1CaHA1pqjaSKdHWDMeOnsrXhFZW7PctP6
 aMNtHpn4QBoSPo+lTefvtXkn/smkyv9mTsZiUOc4MCcc1VZtCwBhYT2lnz6pDpHwfY4SLaaRzq/
 b2E/7r97mSeeIu7hocewk6j2c4pXw6PAgfXiBm5ULxa8cJkgDg4h4DiF9j3EqpepB327kIWPJAX
 CjC7Q0/Yd5cRzgA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: Xwzde2bknWmDa3IGOxMzgI4W7OVqpox0
X-Authority-Analysis: v=2.4 cv=DsBbOW/+ c=1 sm=1 tr=0 ts=6942d2bb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=HeiVX4xZO4SkypZjF6sA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEyNiBTYWx0ZWRfX75qwiiN29fpT
 jfBSZuBaMqcaynHLqTQuTZ2iLa7qqDYuWlBw7H2x+F8FlHSyAZ6urUhKYQSU3Qp+sUIv3D/AvUu
 TBDdY3RO5N6VSRYzv1pjN6QmkAfRVfIgT+wgvd2Z90lfiJkMR4RVD5bII7rr/jsjobpRotv8IaM
 7S7jXwumeSk0bnh4izSp+qUcvX/C6PZ07kE5W3qCDAQu8Ttla5w+BH4JaqRIcNe/ZEWNZRlYIWO
 I99sXUrihj13jEymyWWdKerzvtAXtrpvxoodiPYiJnmEM5+avE0vUs4uMiEcKZqAWIB5eD+vdRA
 fB2Lmba1BoV+Ldb10exe5tqgNgCq395iA0Ph6aypWWZW1xwuyTai5aqPXjxT9Jyory7echt5bZm
 1ZerQpDP+qJI6r+m9F7Q+YUGsW0zQQ==
X-Proofpoint-ORIG-GUID: Xwzde2bknWmDa3IGOxMzgI4W7OVqpox0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170126

One big Qualcomm Bluetooth schema is hardly manageable: it lists all
possible properties (19 supplies).  Split common part and
qcom,qca2066-bt to separate bindings, so each schema will be easier to
read/maintain and list only relevant properties.

The existing bindings do not mention interrupts, but
am335x-sancloud-bbe-extended-wifi.dts already defines such.  This issue
is not being fixed here.

Existing binding also did not mention any supplies (which do exist as
confirmed in datasheet) and Linux driver does not ask for any, thus keep
this state unchanged.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Expected warnings:
arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts

Changes in v2:
1. Keep gpio.h header include for rest of the examples (fix build
   failure)
---
 .../net/bluetooth/qcom,bluetooth-common.yaml       | 25 +++++++++++
 .../bindings/net/bluetooth/qcom,qca2066-bt.yaml    | 49 ++++++++++++++++++++++
 .../bindings/net/bluetooth/qualcomm-bluetooth.yaml | 25 +----------
 MAINTAINERS                                        |  1 +
 4 files changed, 76 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
new file mode 100644
index 000000000000..c8e9c55c1afb
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/bluetooth/qcom,bluetooth-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Bluetooth Common Properties
+
+maintainers:
+  - Balakrishna Godavarthi <quic_bgodavar@quicinc.com>
+  - Rocky Liao <quic_rjliao@quicinc.com>
+
+properties:
+  firmware-name:
+    minItems: 1
+    items:
+      - description: specify the name of nvm firmware to load
+      - description: specify the name of rampatch firmware to load
+
+  qcom,local-bd-address-broken:
+    type: boolean
+    description:
+      boot firmware is incorrectly passing the address in big-endian order
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,qca2066-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,qca2066-bt.yaml
new file mode 100644
index 000000000000..d4f167c9b7e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,qca2066-bt.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/bluetooth/qcom,qca2066-bt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCA2006 Bluetooth
+
+maintainers:
+  - Balakrishna Godavarthi <quic_bgodavar@quicinc.com>
+  - Rocky Liao <quic_rjliao@quicinc.com>
+
+properties:
+  compatible:
+    enum:
+      - qcom,qca2066-bt
+      - qcom,qca6174-bt
+
+  clocks:
+    items:
+      - description: External low-power 32.768 kHz clock input
+
+  enable-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - enable-gpios
+
+allOf:
+  - $ref: bluetooth-controller.yaml#
+  - $ref: qcom,bluetooth-common.yaml
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    serial {
+        bluetooth {
+            compatible = "qcom,qca6174-bt";
+            clocks = <&divclk4>;
+            enable-gpios = <&pm8994_gpios 19 GPIO_ACTIVE_HIGH>;
+            firmware-name = "nvm_00440302.bin";
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
index 6353a336f382..85d10d94700f 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
@@ -16,8 +16,6 @@ description:
 properties:
   compatible:
     enum:
-      - qcom,qca2066-bt
-      - qcom,qca6174-bt
       - qcom,qca9377-bt
       - qcom,wcn3950-bt
       - qcom,wcn3988-bt
@@ -122,17 +120,6 @@ additionalProperties: false
 allOf:
   - $ref: bluetooth-controller.yaml#
   - $ref: /schemas/serial/serial-peripheral-props.yaml#
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,qca2066-bt
-              - qcom,qca6174-bt
-    then:
-      required:
-        - enable-gpios
-        - clocks
 
   - if:
       properties:
@@ -211,17 +198,6 @@ allOf:
         - vddrfa1p7-supply
 
 examples:
-  - |
-    #include <dt-bindings/gpio/gpio.h>
-    serial {
-
-        bluetooth {
-            compatible = "qcom,qca6174-bt";
-            enable-gpios = <&pm8994_gpios 19 GPIO_ACTIVE_HIGH>;
-            clocks = <&divclk4>;
-            firmware-name = "nvm_00440302.bin";
-        };
-    };
   - |
     serial {
 
@@ -236,6 +212,7 @@ examples:
         };
     };
   - |
+    #include <dt-bindings/gpio/gpio.h>
     serial {
 
         bluetooth {
diff --git a/MAINTAINERS b/MAINTAINERS
index 3dd2ce39e43a..9fa447e1645d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21364,6 +21364,7 @@ QUALCOMM BLUETOOTH DRIVER
 M:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/net/bluetooth/qcom,*
 F:	drivers/bluetooth/btqca.[ch]
 F:	drivers/bluetooth/btqcomsmd.c
 F:	drivers/bluetooth/hci_qca.c

-- 
2.51.0


