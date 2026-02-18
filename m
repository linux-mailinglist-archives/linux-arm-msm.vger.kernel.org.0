Return-Path: <linux-arm-msm+bounces-93271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OpdM4qnlWlVTAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 12:50:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F18F515617A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 12:50:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F14DA300A24F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 11:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D0652EF64F;
	Wed, 18 Feb 2026 11:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n0abLZVi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c8vPo9Up"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EDF306487
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 11:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771415413; cv=none; b=f/D/0yywlvoKV+bWgPIYhutAXnLwiKzJSMPnR/cGqI+4IJSGV5yIrKwODg6gsH4m937gm6/hLlqYumUNquE4yqD8XsdC5swX2Qfa5EicGQolDXuAXVJ/IY6Rmly2g9obBxYkWdoQib6tlFcoFcyogxy5Xx7HJdFD/zniFSUpo00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771415413; c=relaxed/simple;
	bh=pfnWtCP2SqzSh5qaOJ8CDGEV9I8xwYdhCVnMofQVpfQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kdJYU9eTuk75DdgPLqBhqn8+eWW6ryI6Z/wASLc4u6ulZAVkE+VPZaTUVTE0FSZ1I//Chsa3Hah8ysk/MwtJ5UQ+qcceUcY7sK9PIqjLe0Ji2jDjyN7weXgoVBTZygXeT7Jw7kFVPlZWFctJ9fxqqkjbDLYdsNBGSx6Kq6aBWRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n0abLZVi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c8vPo9Up; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IBbuJj4062186
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 11:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=byRIuO7+4qA
	T7Vljc7NYIoqed3IcWmvzJYq+ybzKxwM=; b=n0abLZViAjWRtOWkU92bzni0A8/
	YUQtspLyPNVUVYBE/gHhuqNHMf/ZWMCTQbQrE/yfmQUCt0aB+hSNCmq7l9kjDDU4
	/LcEjU1Blua6HykhSgEbqbnSybr712MW2fzCH21nkY2dyMUbfLuWw9zu+iCjTAzG
	XiVEmFn2bEU8SujdxF+EzCc8R5wOS/KtGWiTsDl2snRS9YAbHHS2l5IfiPnNmkTs
	tm+nte/3piWVS2lTqaW6YwsaDh9GNaf4mARQ2Hfui5arLeezIUTeRPDkhbJl5frt
	JkxI5t57W6wEv2x8E6HPx9kBlneIDCaWEbXjVcRdM91VpLQsqfWgkDzWAFg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd1qx1md3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 11:50:10 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c6e1dab2235so3470202a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 03:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771415410; x=1772020210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byRIuO7+4qAT7Vljc7NYIoqed3IcWmvzJYq+ybzKxwM=;
        b=c8vPo9UpxSYL2ZJhoQeg+0DNrw2Stjxst83xVAe9ZW7icS5O755XPjOvwo2FHFZ1Go
         veaJ84TPlj14XhsGRPeON/8R6WVgPBIJHSRTvwL5nYZqUlk8JYrDRuIMrL9pV1ly/uKn
         6XeqY7ia8KlLN9s9gWJ1bjCe0ufd50dgy7+aIqACYRNSspuDCp0s/iD3v4L8ylhNaCpn
         w+078B37k9ufuLyiO5725xHY6IZCBeWq9G7aOXCiVoZaCGUCijxXS+N1s9S6+Xircw+G
         y1CdDtfoGhcj7qKvHXtyk6ll8qIqnfasobsejDEBIviGkVxVGiBL0qcB6L7ky8lQIV8H
         knGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771415410; x=1772020210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=byRIuO7+4qAT7Vljc7NYIoqed3IcWmvzJYq+ybzKxwM=;
        b=nVW07ivgEH3twj63eBOiJguIDUY4Ec9lJV52RZCEDUYG3XyVZioBuhU8nRmzRqwWdR
         1qOW0r/xzFg8I56kTZxKVYLV82v2A0ruVOVdj0vlCdzx45CQTX1xQq4saPq0uLRX8Zw4
         Cbjjp6LW87jf8x3i4KuQ58dDLPjCpVYQ8vqmcS3FfwZKXrdop7EksdGR40X5tmEPLjx9
         T/v4GaIxRDb6s2iVRhRbHrV+EuTxK4smBJLog5tvl3rSjjbZcqr46Q2+A1OPJuKC2Ldx
         bbQQJ2p74Eb69pHj2gNlCrrvB976KJiDi2OFA1pdSgOSZqabkA+7Krcf7U5I1kd9hysE
         773Q==
X-Forwarded-Encrypted: i=1; AJvYcCXyo461HYwSyIsFh63e8PaV8gFCeDlIOR048DaK6o9u0GvGeClpx30rWJB7i+4f5KDxrRHfWIpx9v8c7UhJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzCYLTWStOuxfs98CCcxtBiI1GAGAU0Ac1BZVgCD6C45DNjGx7b
	KxRDbqgvaIRekWdMxiE55JDAit+Swd91m9Ig/kWsY4L2+X9dtL3+QCAPbiIWKuyY2Bbwal+S/FJ
	Vn5OVeUtnxBHlAdWcEmX9/gr4X5h41ZgnmrP9YkQJVbA5Ht6e+UhJ/atYklhdUSa9R1mW
X-Gm-Gg: AZuq6aJot5i/zDb6yuwn+G5dTlp7bURHjrjAdt9WxdQDVJYQjh9OIG8uo7AEuwj5QIZ
	WgDDxNxVoR/dvPhXinK4vmNRUUZ3Acjg6OZYkZulREqQ5V7s3VGnR9IxvFGPkTMyb2exQayGwsi
	uTvjhq60rN6o6rNEz08syGRp9sq/e6NJPcKesrT9cyRBH++enK9PUDIqHAXsLUN5ec54LyWIdpU
	8kzIV6QjYRIHVr1V5Q1P4/Ra+/jVyspTtsLKB+bBq+FB1WxMX8qFKF3AWKyEde4tOZ3tN5PD9Kv
	l+A2x4VA9oN+xMd6juT7cm+f6WGRVLP2CgTi7mEgRVrshqnmSdjjF4I2ZjP1b+WNSJU0CDQ6cHU
	U1e1y7s0evPzKjgU+fRBJsU8Mnojx/l3eQQdLgld4XOiY8tNzK4Q=
X-Received: by 2002:a05:6a20:2587:b0:38d:f405:709e with SMTP id adf61e73a8af0-394fc2f2adamr1408014637.48.1771415410016;
        Wed, 18 Feb 2026 03:50:10 -0800 (PST)
X-Received: by 2002:a05:6a20:2587:b0:38d:f405:709e with SMTP id adf61e73a8af0-394fc2f2adamr1407998637.48.1771415409576;
        Wed, 18 Feb 2026 03:50:09 -0800 (PST)
Received: from hu-vivesahu-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e52fd08fdsm12459222a12.6.2026.02.18.03.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 03:50:09 -0800 (PST)
From: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
Cc: quic_mohamull@quicinc.com, quic_hbandi@quicinc.com,
        janaki.thota@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vivek Sahu <vivek.sahu@oss.qualcomm.com>
Subject: [PATCH v5 1/2] dt-bindings: bluetooth: qcom,qcc2072-bt: add bindings for QCC2072
Date: Wed, 18 Feb 2026 17:19:54 +0530
Message-Id: <20260218114955.3970974-2-vivek.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218114955.3970974-1-vivek.sahu@oss.qualcomm.com>
References: <20260218114955.3970974-1-vivek.sahu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4noBsENO3Z2sMd7IMETepK_HuXoU1AFO
X-Authority-Analysis: v=2.4 cv=R7oO2NRX c=1 sm=1 tr=0 ts=6995a772 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=0QCEEdivNueWlpcsm30A:9
 a=bFCP_H2QrGi7Okbo017w:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDEwMyBTYWx0ZWRfX16rkrYtQ/qc/
 MI1IvknKHdXS208nr9E6L2hjvkVrUKtFyxFcWSn6XuRm+khbipK4h3cDbBFL0My6wCKJdtSmgqm
 L4mydfeqM/kqX2Lhy5CgF9T0z8tW+UcPM0rNIR+gE7M6Z3soMHGYsHrs8DZ/rtAkAMKSknPMcCq
 uKndcJ5hpPsGVJa7DCZ9Vu+EhnEUF4P35ecF+WtU7vVk1ipFbeur5pfJwlngduF+f45aA1+FhLR
 XC0qA36mc+6+6qSBt6gn8fbcEdl6E0AY2dLWHOXbflxCrXvrOcqLMGh57MnEKhkwJAUriQ1SvfH
 gmZ3KyGUiC8r6STRvliPk7tdhojqfzKsfJoWVbZAY1cI/HD8+y3WLD/j2UaUbdA0DMowpvQZ1wU
 NU5vERqJXRe3aFKaf9KTioFSbuL6o4X/IyOjHfIfUWTdOVyexgb1TV4NnfX9tEkGmv6k0IUhlHP
 b+Qkbf3ZnwkAHJl4n+A==
X-Proofpoint-ORIG-GUID: 4noBsENO3Z2sMd7IMETepK_HuXoU1AFO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180103
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-93271-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.sahu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,quicinc.com:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F18F515617A
X-Rspamd-Action: no action

QCC2072 is a WiFi/BT connectivity radios which exposes
UART as an interface for Bluetooth part.
It requires different configuartions and firmware, so
document it as a new compatible string.

Signed-off-by: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
---
 .../net/bluetooth/qcom,qcc2072-bt.yaml        | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml
new file mode 100644
index 000000000000..7b27c2c651fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/bluetooth/qcom,qcc2072-bt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCC2072 Bluetooth
+
+maintainers:
+  - Balakrishna Godavarthi <quic_bgodavar@quicinc.com>
+  - Rocky Liao <quic_rjliao@quicinc.com>
+
+description:
+  Qualcomm QCC2072 is a UART-based Bluetooth controller.
+
+properties:
+  compatible:
+    enum:
+      - qcom,qcc2072-bt
+
+  enable-gpios:
+    maxItems: 1
+    description: GPIO specifier for the chip interrupt.
+
+required:
+  - compatible
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
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    serial {
+        bluetooth {
+            compatible = "qcom,qcc2072-bt";
+            enable-gpios = <&tlmm 19 IRQ_TYPE_EDGE_FALLING>;
+            max-speed = <3200000>;
+        };
+    };
-- 
2.34.1


