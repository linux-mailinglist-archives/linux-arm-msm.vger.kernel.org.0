Return-Path: <linux-arm-msm+bounces-85549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B77CC8AEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 17:09:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1280D306EF2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 15:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C73D34678C;
	Wed, 17 Dec 2025 15:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h4yE/bl1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SqU4ColK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A48346791
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 15:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765987016; cv=none; b=WGsVUwOEyvv7H6OXrugN5rQBRZ+u/TMuDAfn/I+PZPsaCB7UuYgER0US0vMq7ljDY5x6x5mUFNniKk7aVDzL58j3drQ3DHq1JJ3vRoY+Sc/TMm7PFSlIdbrAQHgLl5Ve5ZT8b2+DSP6puBJgfR0ipDiMzUbZRuaKIYWT3SddlLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765987016; c=relaxed/simple;
	bh=JIDJccGK6VCXUI5GwQl1csj/I7WBbeD2m5Vc289HB7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fjo4UOk0n8vnWRsrsdGYdLoQgCH2enHxzNd2vKW2r+0EPnddVWhXNrers1PQB4627HNudn5tpaSx7y8a14k7t1+QBGozmxlEX+69SohFDF3cSE1YUpA6HhS1+VV7aQvQVGe8uIgLA6+J6mCOW29WPhvF+Mh16L3+Gr/k/iaBLaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h4yE/bl1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SqU4ColK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCL8gQ2043020
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 15:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q1kYYrCUUghjJloQmbk2m2RGCwULA9YSBVRKtbqC1nc=; b=h4yE/bl1N/LPEksw
	HizaVroIknINHY8wHfurBWlsbT/XpSiW3pRfxsTKfMwkd838i83AZk9DF6HeAL0t
	ESwRrEwWpNJEyRa2KEqy84NAE3D5Zx51TZP06GIERVj6HFqrmfUBfEuO8Y2eM0mR
	byUTKU0Hc9RRjvzSerNXtFX01xhXNOpHCDKR0ljW2jAp5EwCd5P1x++VtiMGvaec
	Uz8OmnQqa4fQXVLUuo69H/Gn8rg/DfWmi5MRpd8N0qCaTN58ztAGjQbp8Q+6q1pg
	X95TVQKmO8GMe08Cngvxjp8R/+8pdOCurMPmT3KPyZ4YAnhYaJi0mE/xlY4DMiy5
	OQQPUg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fj1u33q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 15:56:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee27e24711so105210131cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 07:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765987010; x=1766591810; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q1kYYrCUUghjJloQmbk2m2RGCwULA9YSBVRKtbqC1nc=;
        b=SqU4ColKr1kxPwJa3It3LXepBR0Y0isyhzc18978nRzwOA3ErUkHvKnB7AQdo6I3Ku
         XE4M/L965MNSWH+PtjQz99PViBb9OTKHSCMCQEsV7f80RQmzYABTV3DLO1fl88lPRcFf
         VmGyvQQovp6hRfsecuQzscx3a/TbJh5J5USd3POaK7KINkWy0NdfLEF8TdDvDB0wtanT
         lIyMkEcWQHDSpUsxNQuakB8516wPPhYySC9KpuhiU3cbzAb0xovEtEwXXpe3/Qa0Bygw
         Aw4c9Rq1Mdh0OKrL26COiYmJ4Trkpns/GkaU1xxbbeL8WbV2HsDnL32KLMmQFItbqd+7
         uAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765987010; x=1766591810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q1kYYrCUUghjJloQmbk2m2RGCwULA9YSBVRKtbqC1nc=;
        b=c59Ri3YCnNO9/saF5fAfVBumwWRQXsg/SGpYqspNQs7KfRvbOE4WyHGCWYlXpebx+4
         tNne9c1X1edaKXN1bKQZpWw14K8mPJamTpN5MmioaEURTDQJ8N0QEA15TaFyK99fbw3g
         SEwl4QtimI24uDuCiW0AkNc5UkBVBPEKuVB7rSJrT89oM1jkYRvEgpE66lr1Z2DY688x
         UBNjVILSpCl2WYS6aqaCtqeuF5NW/OII03LEOd9lXStadzWXW/LN5gc6vvcQRRRWNziK
         tqwfwbECWNqQROcGItohIeddI/gP+94k+tppjmpiFiNlDBSIeE8g2Kued2xbHn1ere02
         IuHA==
X-Forwarded-Encrypted: i=1; AJvYcCU1JdBIia6C9nfxKBPH5P6fIvBoX9Ql7c59hDoKaWAMOBK4ssINdPj/nOS8CojfAqcwsJzDssUe/5j4kY42@vger.kernel.org
X-Gm-Message-State: AOJu0YzNfKFZZriW4ObqnGIlWrudy5KdDrWc4Q0gknP+0f+5GoEH3wZa
	09BbnnBdRhA1BVOM88LBZlU8QFxLyhnabTTJZW8SjGF20t3o7vtc9OZa/LuC9NKeXCvEZRB7Q8N
	X+nB8EFn4ARnyxeVBjEURrd0e4zQ4cEL4uu0xjV03qMStdoi+AIPIZGQ3mhwXmbMmxmpH
X-Gm-Gg: AY/fxX6rMqHW2F5TA+2pb+X+DroOVIQeNEtphO8e+iABsq8cZrbE17YQZfbiSYo+84o
	VP/VPQdQz2ZN6Tfbp9Zc1lV2cvzgNvk5jLE45SaH4Z29ve3Gja9+C6tw91eq3mDdDkl9OKJhLqh
	qs3zdKuNtCDrUybgkVr3zc7u47LPmHnZ+SoyMTyMItUje4Sx8A/LXcPT9kbdNu3cX70gyS36QAC
	12Xi9Q9Kz8JF7QzSDmVGFmVG/y0zAs4IASxP/kQhzjOL0HkflSS1s9oonEv6FCZ/Ll6OOSKc/pY
	qjmz+4yvmlKqWyzlvtNbnJBivODccEn2hyKA9Ofpw4xHnsihB9ckI56xBhODolxGOIuvI5tLuJG
	1w/TScYTUph/NTh3bm9Arh7hhapsk9aDb
X-Received: by 2002:ac8:5d14:0:b0:4ee:17e9:999a with SMTP id d75a77b69052e-4f1d0531327mr259702791cf.33.1765987009777;
        Wed, 17 Dec 2025 07:56:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLoeU1gpIJQUUEfmAJcHe4P7WfDl6vPIxClIJPvXIFT/alseoCsuFa2MVXOhdCcCPGy4HOYQ==
X-Received: by 2002:ac8:5d14:0:b0:4ee:17e9:999a with SMTP id d75a77b69052e-4f1d0531327mr259702271cf.33.1765987009230;
        Wed, 17 Dec 2025 07:56:49 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4310adeeef6sm5439800f8f.32.2025.12.17.07.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 07:56:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 16:56:23 +0100
Subject: [PATCH v3 05/11] dt-bindings: bluetooth: qcom,wcn3990-bt: Split to
 separate schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-dt-bindings-qcom-bluetooth-v3-5-ced8c85f5e21@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5226;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JIDJccGK6VCXUI5GwQl1csj/I7WBbeD2m5Vc289HB7I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpQtKxtPV3nZVGaLjdVSwXCCzuZbzNnRfwL+MlK
 1nlJ33rnS+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaULSsQAKCRDBN2bmhouD
 10CID/9m25qiPqGaoRVekfUEli6Ao5/PmxkhY+xKaAAnJRtL5mNxt1ECPNiZMCLMubRu4tiqUPA
 KgkRk5DJJmSnafxCGPLciwVGVRLRKIyRPXahronKGMd+RDUHXT1gGvAW+4dh4BYCG8w5yjk3XIV
 mhmLz9RAd2bvKqBZjVvaz4VA+ZmXGtNKkUGXhFMOazUBsAMipwhOHizKDqMojGEna+VlN5aWvax
 g/dOhzvx36Zauji4SoauwGiP/MaJkhnTEtef0CV0byz7QJYoENaDRJu7xyUuTaz49ejTN1UI5/8
 uT25kdcmT3DMkiHarZj0gezX4PKWoVCZO0VFpAVTAVJTKxfu58772KnoIjyhRCzuT0Guh+8KBra
 mrCH30NznlQ19+cKntH0ae5kyZc74T8RhtrsILGaibdzygnWXNqqzUU5TXLQ8lo9aWZnf18Disn
 2iDV7LoFrc+Q4TgEMdaujLDGqEd5WTm6FFucGVsobbuww3hyQXMXU8KMFA1fNBvsa1ccFhr0A89
 caa5zbr1HKS9xdJVdJ7f3b5rJwSwakIXQY8bdT1FSx6rWqnlhm8e54r5+wiQgbtvn31zf+7s3UJ
 UC/akWFYwc+JKRiZQJUcMaVfrxbQLWNJ+ejgkdWOXlkZVx3U90cVnsEpTaSp+7e2HyxSZq5Wcdu
 IIxYgVdGnLohTRQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEyNiBTYWx0ZWRfX2Gf+/kdvTkbZ
 SWaFvjWD/n7KGbLxZZQbEfCfHn5rmFnojOkKOqBCXVQeSZEvfgOE21OKcM8P3H39WBGcmwcwwIv
 pSyBxX3trGyDs+TIzDtAqdjSqGhM+Rwb7v2e7U4N/wD3jJ+KIh7sWeYgWt7UGETx+35zALhD+34
 S0y0DKfET3yTIo6XP2TmHvaSh66q85BLJhwge4ZclTjgSzYpVzQQbX9WKtjwg6W5DANDNMZYqJR
 Tvs+nUoZZ7Adp1u6Di2ztPS1YcHHHEQvb0xbUhEOOZWi2ydlD9ElLqmJML46Dd1YPQRNyJWxzku
 V3mx61qmX4c7E9BZMoKLa91ixVvlV6AUNhfAvUot/RdVqbtA/u1rU8d9ZQ52rbAXL+h3Prsyy8M
 Y7HcFqKB2tgGpY5/3DREETkKbkJzVg==
X-Proofpoint-ORIG-GUID: w0QU6lSx8onNVNpWHbxk38XmO7XuJdlc
X-Proofpoint-GUID: w0QU6lSx8onNVNpWHbxk38XmO7XuJdlc
X-Authority-Analysis: v=2.4 cv=edgwvrEH c=1 sm=1 tr=0 ts=6942d2c2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=TJdhL1X_YdA7ouKO9xEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170126

One big Qualcomm Bluetooth schema is hardly manageable: it lists all
possible properties (19 supplies).  Split qcom,wcn3990-bt to separate
bindings, so device schema will be easier to read/maintain and list only
relevant properties.

This binding is very similar to qcom,wcn3950-bt, however devices have
additional VDD_CH1 supply.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Changes in v2:
1. Drop few supplies from qualcomm-bluetooth.yaml which are not used by
   devices left there.
---
 .../bindings/net/bluetooth/qcom,wcn3990-bt.yaml    | 66 ++++++++++++++++++++++
 .../bindings/net/bluetooth/qualcomm-bluetooth.yaml | 47 ---------------
 2 files changed, 66 insertions(+), 47 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn3990-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn3990-bt.yaml
new file mode 100644
index 000000000000..89ceb1f7def0
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn3990-bt.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/bluetooth/qcom,wcn3990-bt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm WCN3990/WCN3991/WCN3998 Bluetooth
+
+maintainers:
+  - Balakrishna Godavarthi <quic_bgodavar@quicinc.com>
+  - Rocky Liao <quic_rjliao@quicinc.com>
+
+properties:
+  compatible:
+    enum:
+      - qcom,wcn3990-bt
+      - qcom,wcn3991-bt
+      - qcom,wcn3998-bt
+
+  clocks:
+    items:
+      - description: External low-power 32.768 kHz clock input
+
+  vddch0-supply:
+    description: VDD_CH0 supply regulator handle
+
+  vddch1-supply:
+    description: VDD_CH1 supply regulator handle
+
+  vddio-supply:
+    description: VDD_IO supply regulator handle
+
+  vddrf-supply:
+    description: VDD_RF supply regulator handle
+
+  vddxo-supply:
+    description: VDD_XO supply regulator handle
+
+required:
+  - compatible
+  - vddch0-supply
+  - vddio-supply
+  - vddrf-supply
+  - vddxo-supply
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
+    serial {
+        bluetooth {
+            compatible = "qcom,wcn3990-bt";
+            firmware-name = "crnv21.bin";
+            max-speed = <3200000>;
+            vddio-supply = <&vreg_s4a_1p8>;
+            vddch0-supply = <&vreg_l25a_3p3>;
+            vddch1-supply = <&vreg_l23a_3p3>;
+            vddrf-supply = <&vreg_l17a_1p3>;
+            vddxo-supply = <&vreg_l7a_1p8>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
index 82cce508e295..5581e810f08e 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
@@ -16,9 +16,6 @@ description:
 properties:
   compatible:
     enum:
-      - qcom,wcn3990-bt
-      - qcom,wcn3991-bt
-      - qcom,wcn3998-bt
       - qcom,wcn6750-bt
       - qcom,wcn6855-bt
       - qcom,wcn7850-bt
@@ -32,25 +29,9 @@ properties:
     description: gpio specifier is used to find status
                  of clock supply to SoC
 
-  clocks:
-    maxItems: 1
-    description: clock provided to the controller (SUSCLK_32KHZ)
-
   vddio-supply:
     description: VDD_IO supply regulator handle
 
-  vddxo-supply:
-    description: VDD_XO supply regulator handle
-
-  vddrf-supply:
-    description: VDD_RF supply regulator handle
-
-  vddch0-supply:
-    description: VDD_CH0 supply regulator handle
-
-  vddch1-supply:
-    description: VDD_CH1 supply regulator handle
-
   vddaon-supply:
     description: VDD_AON supply regulator handle
 
@@ -117,21 +98,6 @@ allOf:
   - $ref: bluetooth-controller.yaml#
   - $ref: /schemas/serial/serial-peripheral-props.yaml#
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,wcn3990-bt
-              - qcom,wcn3991-bt
-              - qcom,wcn3998-bt
-    then:
-      required:
-        - vddio-supply
-        - vddxo-supply
-        - vddrf-supply
-        - vddch0-supply
-
   - if:
       properties:
         compatible:
@@ -178,19 +144,6 @@ allOf:
         - vddrfa1p8-supply
 
 examples:
-  - |
-    serial {
-
-        bluetooth {
-            compatible = "qcom,wcn3990-bt";
-            vddio-supply = <&vreg_s4a_1p8>;
-            vddxo-supply = <&vreg_l7a_1p8>;
-            vddrf-supply = <&vreg_l17a_1p3>;
-            vddch0-supply = <&vreg_l25a_3p3>;
-            max-speed = <3200000>;
-            firmware-name = "crnv21.bin";
-        };
-    };
   - |
     #include <dt-bindings/gpio/gpio.h>
     serial {

-- 
2.51.0


