Return-Path: <linux-arm-msm+bounces-85546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB929CC89EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 16:57:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B5A24302F915
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 15:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 055BE346ACC;
	Wed, 17 Dec 2025 15:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UyRM4917";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hb83Hd9p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83ABA342C9E
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 15:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765987013; cv=none; b=EioOXcoJCtN/rSh2jjPkgd7YClOdN1CYYijvU7hQBCf1HfK3r4h4d++/1BXZCa9a0zTAY1A+JXL77XQqJtyyM/GsYlLMhRIwaWfJF3yGbfeMa73uWr7ZGalDX2sUo0LA1urlmQOWRqr712ppBtbfltfyhxrnz++DoSbq3AnmiGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765987013; c=relaxed/simple;
	bh=mHst1xBgwj9bMH/OqbKZWAP/xstAnsimC+MNikWEiXw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E6mirsuG4WfPhRcddl2Y0X499u5KYpbjYXWKsaXnEBHI4ike5qhExUtrpV4o2QBeg0ptjUHSfT9Nh9jZ+miQjN0R4sd+EWHyOEeUZ8pNG6pE1wMmqz1nGLxu/HlU6iKQCi74W/SlvW7kvJxpunL76B2WZHPPHvBeVXXwqAX1Ie4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UyRM4917; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hb83Hd9p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKows2683497
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 15:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zMBABCfjZZdy8kTHYUiqUA1B/gN5Te+ej1QV+yVBeC0=; b=UyRM4917Jbtsxh6x
	4VJ/f1fEo5imIOhhwlYGkgGUKTIf1EJXZbWyppnkFAwdUF7Vj4rC4Q5HvvWAToU5
	th8vNGw1TMCnSZ9uDTMWtiwzb8hiAGacqnOkLzn49RpyewlzfcpRu3A5jpWQGozj
	O0Rt8BPSJjtNRUj+po6D6yOSyjQHmXgW4xPWslzGJ0C0SRBHzGgcvPsceYr4c2PG
	RZ79ZkAlPfh9sY1t7uuLN6UBhz10P1GkH36AINWSnre4+5qu0T2Bb8GP8GuVnHFj
	P//Da9RglbOnSZZbsWmPMS6gL5zCpmiC9WQ196xe0CsSkHS+2EzaxZ9B0wm8qorf
	K/8xpQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3kketfhb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 15:56:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee04f4c632so106684101cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 07:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765987004; x=1766591804; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zMBABCfjZZdy8kTHYUiqUA1B/gN5Te+ej1QV+yVBeC0=;
        b=hb83Hd9pmTODVGpIAQHST4qA29JNneg4dgljYEt7ZiTcskkLzAduC9E+OfardNJ0xW
         hFAYR5aKTnVFs/FqTgKs/EKXhcyx01KF7GoDhcbdrGBEOEtEQBBfl1sHhUzcDK8NBtg9
         K1ccoTKShbgWonXQVpVNSu/nQFwszslicMRhfU2LNzFSpeawYtVUW80r5nOpbwtOpOTj
         Q/GueF/lCjMzb3Bf+Wi2gmop0EpCbtMjHPWRCHcVw4QnAZBF03K+LAsdDSipYVA9XqYm
         Ic6jM3+NslaT+Iun7eo8p5wd4D6VLawYH8IjYyjwbPTE1BlSp3ve+nHKMyxlxHkSF1mU
         qzzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765987004; x=1766591804;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zMBABCfjZZdy8kTHYUiqUA1B/gN5Te+ej1QV+yVBeC0=;
        b=vRc4akCCT4VqoJqhKjkCXu6+x2exMe/CnMUrXusFDZBKP4uMli4ITSFg7qAixilXEz
         dgtNX94UHFbjYY0loY/ICmeZ2t161z8+7rTjYcYZ9RexTBy3FH9OnRAX3Ghb9CABjHLY
         GuBteISag/mikxezYNhjyoFYxCuHhEmp/Ct2MAwUFWGwbjl6rkfRsT7Azst3mG8K00aY
         XEBRsJ00p6SPWfbtxyx6haxr5S6saR7ESYRNCjSA/0kt/dZHaLunEHcuFx/ucBxRTof3
         0HQ9hNx5YnackLSBZ9WpAyrFvjtdISGdQ7ljYyUvws91WH0Ztdj738YLHxWLaL3Vtovb
         SsVw==
X-Forwarded-Encrypted: i=1; AJvYcCVuUeetTsG3GpPxkoNJI/dNFJDEgJkj2oVPhL5W/ec0GILSK4Z0U6YKwQK4P7vn8bPTpy9VMShsg89n1k6Z@vger.kernel.org
X-Gm-Message-State: AOJu0YwDKBtrkMJR3t7b+B2ItiihO0Opr/uFQmTG4wo2mpJ1canUzKQM
	hG3t0VjmxLt9X22ofdfskp2BjbRlRt/oqskSX47lNl/W/fhUxZ/sjObnklseaoGk67SDdEm/6P4
	BXcZlLN4sPtZE35IKy3GVM27oXcP8DOTVe0ngsah70BMBbJxnRZlXlrhA4I5dkLpro5l4
X-Gm-Gg: AY/fxX7TYffzc8UVUts3J3bisoGH35ptwIW9u/VL2N6jw7Ioeuxgr7rAIWNO5Tnkatc
	VnbQ/YemagEmc6cXmM7cR9ZcOhmlvOOm3JBkk/AVeDdqjDAtkrXbHfxnkubwxZ2yCADYM8Nqxtj
	BNIV+lvK4iJAq70GSnAAgO0wiQSOcwWz1Bo8osAENOhfZUP7t5UuzNZCC0AAs47u3yaSH/CojS+
	PCS13K4/NB4RtnXoomxnWk+W09Fj0eZTzE1RyjlR4mlbIGfTVnl+66jNglPFw9AFPozR1ycwmEC
	WxJi3iOYJFLDJCA2Of90MFof1T5DFvjUIV6L7RsINNdFZGdvUB4hyALwXCMnbFaEd4pEGKxjch6
	E4cwjbclZjHO7uLHcKVClydoF6/VFDsr7
X-Received: by 2002:ac8:5705:0:b0:4f1:b9e8:1d34 with SMTP id d75a77b69052e-4f1d0622c8dmr240083511cf.61.1765987004595;
        Wed, 17 Dec 2025 07:56:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAOFg5xuo2wEMlgjaSsVubevoYVRp5fu+jg4tbrEK3WP1LCRuuBTvFH3/Jd0CteSRDAij1lA==
X-Received: by 2002:ac8:5705:0:b0:4f1:b9e8:1d34 with SMTP id d75a77b69052e-4f1d0622c8dmr240083151cf.61.1765987004123;
        Wed, 17 Dec 2025 07:56:44 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4310adeeef6sm5439800f8f.32.2025.12.17.07.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 07:56:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 16:56:20 +0100
Subject: [PATCH v3 02/11] dt-bindings: bluetooth: qcom,qca9377-bt: Split to
 separate schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-dt-bindings-qcom-bluetooth-v3-2-ced8c85f5e21@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3138;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mHst1xBgwj9bMH/OqbKZWAP/xstAnsimC+MNikWEiXw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpQtKu9RD/1kcN5cK2ECWzWj5NtqLsO9fteg5bv
 hqJXFTLsnKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaULSrgAKCRDBN2bmhouD
 10pzD/0QzlVMW6pndzQd8lUzum4m6AsIA+Fj/yuq8KDFKGIYaAFll6DLryzmUrIwupYoK5bcci4
 0kKaGm9SIXKFwaM7JZKz3n1zUOSrVLIqq1YtfTTqmQJoflnHo9jJersUslG+F6dNoWqWiMlzi2q
 uiUcuges1q3gyaYwdLwL4L15dI+DMqC4uhXksTE4NVQY/tnc0b7s4pMaUtfVyIKpNymT7tvz3lC
 U4Wq2k1X2iXsJ8Mr9So3PQ/49dEyDloGkrEA/urEZtzgas/J2PmzF+EnXc3QrxZTuaJHNMkShfz
 JNSYG6E5QO5hAUGa7WYbmZyJEWx/SpEFfa0SnIbvEshFbL4eqQjW8m/j4lMn9Ch4+sMcn5asQ+4
 dFnfzhy/g7IY79cig/qxx+cDeYwdVjZp+coiaOxddecdW6wRNLrE68KSQrPz5sg3tocunq0vsCx
 RT4HJ9O+KfX/jYhIPOdN4MnC4onyJ4wQbvHtgMp/w7GDy0HCQ71/LTgdjmkTk4pwxdeqcyxbECB
 hB85Xgy7ERSP9TtokjdwCMkv3RIokSp3b0yTDWv4M+dqRPF2OetJCfph+9i4tDrDuIkQGXeegcq
 GWM5D7yQCKCE6fo9zHT2yQVlxMKEc0HMy+fudBYvQdwn+ZLDKA3dsxjVoAK+GfSTwwWQddJE09z
 fXB0SEA6zcWRn7g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEyNiBTYWx0ZWRfX80oT2rR5j3o3
 w8Shxk6JPTNKR3T6Hc7qFm8Hp+4pR6NNEVWM412xmujbVIbQLXBi82b+FpGZ67yrvx+moAD6n6s
 hd7h9OjGljkUgaQNkK89pwWbSb9Xu/h42tf8f5bXjz3lvlBnMXoonAj+pf6NidRlhy62RgkMdoz
 GVFyvxuMTVChBwYBC4gwcWsFioe6n91r9TIOQ/1yTPBOd9oDrClD6k5D9ZiSrhh6LWiDQi5q4lS
 asRqj3lT3Lrr8I+uv6UOhDeutBoTdvqU1Xmaibqdib/SJiBeQFNaSfqIfAbbioSdZE1GcuYWNLS
 96Hp1nkaEAh2IS7FCcnfnNPHjUpm+H+OXRIulPOBp5TsYk0Tp90fPaIVekYyicKFvvaiai1bi4k
 DnV+CCsw33ntPMZ0X6FlLSSmMyd0ng==
X-Proofpoint-GUID: 8zTZkpjgz0q4Q-sdNAUcdD6rMZJzDGfl
X-Authority-Analysis: v=2.4 cv=Fcw6BZ+6 c=1 sm=1 tr=0 ts=6942d2bd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=NmeI-4ZN_4R3alAclVcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 8zTZkpjgz0q4Q-sdNAUcdD6rMZJzDGfl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170126

One big Qualcomm Bluetooth schema is hardly manageable: it lists all
possible properties (19 supplies).  Split qcom,qca9377-bt to separate
bindings, so device schema will be easier to read/maintain and list only
relevant properties.

Existing binding has incomplete and incorrect list of supplies (e.g.
there is no VDD_XO) and Linux driver does not ask for any, thus keep
this state unchanged.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/net/bluetooth/qcom,qca9377-bt.yaml    | 58 ++++++++++++++++++++++
 .../bindings/net/bluetooth/qualcomm-bluetooth.yaml |  1 -
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,qca9377-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,qca9377-bt.yaml
new file mode 100644
index 000000000000..3fe9476c1d74
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,qca9377-bt.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/bluetooth/qcom,qca9377-bt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCA9377 Bluetooth
+
+maintainers:
+  - Balakrishna Godavarthi <quic_bgodavar@quicinc.com>
+  - Rocky Liao <quic_rjliao@quicinc.com>
+
+properties:
+  compatible:
+    enum:
+      - qcom,qca9377-bt
+
+  clocks:
+    items:
+      - description: External low-power 32.768 kHz clock input
+
+  enable-gpios:
+    maxItems: 1
+
+  vddio-supply:
+    description: VDD_IO supply regulator handle
+
+  vddxo-supply:
+    description: VDD_XO supply regulator handle
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
+            compatible = "qcom,qca9377-bt";
+            clocks = <&rk809 1>;
+            enable-gpios = <&gpio3 5 GPIO_ACTIVE_HIGH>;
+            max-speed = <2000000>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&bt_enable>;
+            vddio-supply = <&vcc_1v8>;
+            vddxo-supply = <&vcc3v3_sys>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
index 85d10d94700f..dba867ef3d06 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
@@ -16,7 +16,6 @@ description:
 properties:
   compatible:
     enum:
-      - qcom,qca9377-bt
       - qcom,wcn3950-bt
       - qcom,wcn3988-bt
       - qcom,wcn3990-bt

-- 
2.51.0


