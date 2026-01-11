Return-Path: <linux-arm-msm+bounces-88394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAA7D0F5E5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 16:52:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFB9830BE384
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 15:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A57E9134CF;
	Sun, 11 Jan 2026 15:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZSYF/Eer";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NW+8d26U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2115734D38C
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 15:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768146579; cv=none; b=flESdoIBrewZhr4EPhQbSo38BrwOin5Hzuwxq4p1aWza3aonUAOwIFD97HRYQGVYhEGDrxjqhNQlsVhuy7+5O4wHrQlCwV3NF/2XpRKtfKdVIsYxtXhsurQZTXzapCAVyowNmLMqIeJeC5CFT0KHD2uRJ5cTWrbZHTKJGtyjX8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768146579; c=relaxed/simple;
	bh=IRPUyaWVtt81ELN8RFPfSay6jrmlbrMj1DFklO6mS/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=anYfPvnoSYef/M9sbjgEZOW009XFr2kU0EuWhDy4IDJtfO1wrFg5nWRe04K4l4Soy5soXM+EUwyqeXjUP1FN5n7HsXjq/Ksds8SZ3ec5+S5LaMleGpMaw7/swkDljEWQrYu5sdVOW1LkQD3+0kOUmhk8Krbbb+yn3Jt30vOoSlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZSYF/Eer; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NW+8d26U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BFTOAS3525476
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 15:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m4WuYH2vpOkIakvEa/nSVG8WF7NjL89kvyWGM2cYExo=; b=ZSYF/Eerb6ehJMSt
	IMyQ+yOEAOsidWQVjCtdJ8cqRgoYRscROoC8YKZ+MHJ2LsOZLAe81YdGtF1nbDIu
	e0Jmua4ED7tkwJnt0yKJPqJTzorT2o93FztlYhNnv31c8DLuU4Ff7/oWbUwc8Fq5
	VZC9m5uStJO2aYk+QkAcFIfc0pZGEoE0NItr+eoVObXAyDwuac9ntcoDwSRTyiVt
	LOrywSN1JYn71notaSlV09BSe96Qr4fHXM4XkFwSly/m96r+1PJiR1YhSK/zN3Oh
	Ymgq6kn0xB1zX/Y9czfNqJaoBzaQ9kpgFRJGB6E9t4dp8BpmFc/0LvvdcMLf1RFr
	5TFNeA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bm8kyren5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 15:49:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bb3a245d0cso1457164285a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 07:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768146572; x=1768751372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m4WuYH2vpOkIakvEa/nSVG8WF7NjL89kvyWGM2cYExo=;
        b=NW+8d26UEU6R9vFRALDPky20cEbmVBl2fmW5q+jRtHP7foetkPf7KqKUOk4hO2FQEi
         56w91ybadJACAB4lP+a7R5EaucHyR1bPzDKNPyiscTUMmTjH0VmutcJy9ruKzE8Gmww7
         RaRCqVTyrGh6pSZB+6fzndy11RlsJoFlUdD5rP/pGGeQB3wB/NLG7h+Gg0FfPEq1woRD
         KwcxqfC3M5O2AZUGdOJp9L63jRFWC+0d/FIieX8qR8VUpgw6Ky/FWJbZ8TSShLQ9HU7B
         kEq658jw1NrDyGjpkIt0HsJezOOrf7/FP8He5TmmyjEktyKO63OKzkksuVO0vxUTb2x/
         Px+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768146572; x=1768751372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m4WuYH2vpOkIakvEa/nSVG8WF7NjL89kvyWGM2cYExo=;
        b=DDkennB4rawic89JmqLS/KbwoL+n0ILd1iln+/ZIQnghvE1inSZ+wcKWWU62b+kX/Q
         QrGpuvRzRC+ZbsJ7YbDgedMBUPI+g/zB976wiKMmrEzh0aD7eHrflXeVQSoUYi1u+yzM
         7/Z8/L4Dwp1C2o6LG3BDgVn1/+qALRXlOsZfhIkIdySUutIkp16UxbjTsbfKdDZInH2o
         n8I2KKYzIS1qNt4ak/gW5iLzEgzyHI91IjEhBbsCmHnwcx1iKPEdoktRpNMuuO3kcOjr
         cMMbUOQ9ngiDTRigQjJzS+vapRhphYNmHblEjMxpFOeXzBc7nvh4M2IyCXuTXgYOX+cT
         HLSA==
X-Forwarded-Encrypted: i=1; AJvYcCVmvAN0O2MyHf8n3Fpo9aQJ85qxPCQYhFcleFceglwzj3Y2Q3eYb6gjat2ms/xZZWK9J6TDREUUlnOR++xs@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvx4/hYdnb08vMnpMNWyhoxvm4HiNJeQ6ZiVR9/LpJWchHZ9Oc
	jFkws4fCLnoHoBvSoZZBkz8tZyEGfeUVp7G1qNu8qtcKRiAvliuLWUtxlEb5gc3aawFlfVMyLaS
	8GHZknCDEgMcrT+w/vDJ6awtCtdnd3hVX077kGNqAVq2zYKunGfIyGrMm46/wKFuY1MLtQu5C9M
	6E
X-Gm-Gg: AY/fxX7EYMD5a05ZaJgjDTuzRGdNQditCIefEPKdYgqtEjzAFBStwZ76jUPyolb8IZI
	oQicctNAfvbIratMGLTH/HZ0v4U1Jf0VzNMhGZGl454QGy03K3v5Pmdrulj1u2zkErQxGUdWeCH
	rTRobZ7cxzboJPsBE/FJj057Lqr5Sui8kA+7hjGy7euJ+ObIBUXQe8afMQPX9/YuRbesomRkBmv
	68TF3hc0RfTr0urvXZHKMj1NI0Ai+cr4Qo+C26Oc0quGDlmcvtw0ui6TDGX5Ia/dU1aGUHxiEqh
	O+IAAP+rvEPBZKsHRYe8d/G9R60umAM08wy8pZkKXOK1yDPc8DoUc/2vlQ3hx/CmfMosaXN4CFz
	/CSOeboZhuxK6AX9dim8thi+oS2GTAutKaw==
X-Received: by 2002:a05:620a:4051:b0:8b2:64b1:692c with SMTP id af79cd13be357-8c3893a27fbmr1984167985a.29.1768146571613;
        Sun, 11 Jan 2026 07:49:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIyE0A0qqdyDxwYg1PzKmiqZU64SXfi7RqPcZ8u/sNmWruQ29NWWtBc+mCUvvp0TT4l6Ov8Q==
X-Received: by 2002:a05:620a:4051:b0:8b2:64b1:692c with SMTP id af79cd13be357-8c3893a27fbmr1984165885a.29.1768146571183;
        Sun, 11 Jan 2026 07:49:31 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a5180bdsm1637163166b.57.2026.01.11.07.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 07:49:30 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 11 Jan 2026 16:49:05 +0100
Subject: [PATCH RESEND v3 08/11] dt-bindings: bluetooth: qcom,wcn6855-bt:
 Split to separate schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260111-dt-bindings-qcom-bluetooth-v3-8-95e286de1da1@oss.qualcomm.com>
References: <20260111-dt-bindings-qcom-bluetooth-v3-0-95e286de1da1@oss.qualcomm.com>
In-Reply-To: <20260111-dt-bindings-qcom-bluetooth-v3-0-95e286de1da1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6392;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=IRPUyaWVtt81ELN8RFPfSay6jrmlbrMj1DFklO6mS/A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpY8Z5nQmT92altttezDTPT1h7OqZDBHUoRvIC0
 OucFiy2wAWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWPGeQAKCRDBN2bmhouD
 11spD/sFnpZdTVeqxy19Fb4j8GG5dOO9k4g0XF0XgfsQt+yVqCd0MDkj6fgVIBnlmB89EydY0Qf
 q08jYnMC8/EDbEIB3Wh5bbNSDuwU7VZODiIq4yQ7vFyO148eZzAwDLKye0o/pBz8/9/mTM/Hnk2
 X5rDfe9fP5qXSXVmnIdKJ8bXkP817yh1zEmsHo+HKl4iiQoNwdtzEQFeh35XCnk3aEJ9XwzacWe
 VqGdO5UhtXqum4Gs7PD8b672y92+NbU9paXYzdmE1N4rh8lmM4X+GmVQ5QJj4iPIZcEfGDn1QT0
 e4QyDXaAQ5pz+WXt6uTmJV+mNUEjV9ZY1QBSUecOe1f6bNhLy4PY+BbvCXgmv4tNICKZnPu7Ai2
 G8r8LVfSVLXesN9F5HJ9r1IwfyUod4P/nPkev8Vl1rz2sOosYIpCTslny9PLxd0Kx5KbaTFvWDA
 Hpn5RoITlS7oA+1X9rAYC9rgfhFUmBc1nlrFrkIsOEAKdMyX2u52k3np8lX8pnlW5pVDBnrKPYM
 ypFSLrdXFBCvv/pYo10bYuKQkf/MutL75Znp+y87DwEy9rcYXarA7owPymdj+1XD2F8oyiDD40D
 80Zb8VhKosrtldvGAuQDipW1/PECe/LESfOh2MB9MQw5bhZ/ocz1txxZK/wiM/UBaChW+uGJDbH
 MefpMYUGRN3Hm5w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: tu2wjt1nmRjbvvS8IxycC_yj9i_zla1J
X-Authority-Analysis: v=2.4 cv=ZuDg6t7G c=1 sm=1 tr=0 ts=6963c68c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=TihS8u2qB4LoSCkHJ9EA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: tu2wjt1nmRjbvvS8IxycC_yj9i_zla1J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDE0NiBTYWx0ZWRfXyz4/Ug2HESiP
 d6JGWMEtL41gO6Wb//zmo92OAXHDSI7Cil4kcdCzfZXt4g93uH55XU6veNMOdROz8niDtAS6yc4
 QVX53DdJSWvaCTxF6viWQ+V/vEj+uWVkXIPmVIHh61uK/K4dKhMFd0fCURIN6UNmcE8246ovOBa
 EFTv81mCGfpd5tQz9r7ERc1TXD2g2KCc55M8CkrRGaFoCDnOLJ+/bxH+J3Kb3ZP7u/QDuZE6Sl+
 KzV74KbfQTEW00HGarqeP/t/wuf7ycFFYHbCH9vXVSJFMXs02zD49P0Grej9SXsR6LIH7o6IpAt
 9PUFylStqWpt8yMoh3AfN1CzD7Fc5NT9HkTVtlVQBj87OzjLJM7wKbGd5M78vavdFGJPvJgaIwv
 qvaDqQtQmqqwtNWEmMERtsLGDj2lqbQ97G5qy6UORPStan7cjTXV1uGpTC5WGYk8xjSDDWVtPSP
 wkiF9G0dOdgjGupLuNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601110146

One big Qualcomm Bluetooth schema is hardly manageable: it lists all
possible properties (19 supplies).  Split qcom,wcn6855-bt to separate
bindings, so device schema will be easier to read/maintain and list only
relevant properties.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Changes in v2:
1. Drop few supplies from qualcomm-bluetooth.yaml which are not used by
   devices left there.
2. Add also Bartosz as maintainer because he was working with this
   device in the past.

Expected existing warnings for:
qcs9100-ride-r3.dtb, qcs9100-ride.dtb, sa8775p-ride.dtb,
sa8775p-ride-r3.dtb, sc8280xp-microsoft-arcata*.dtb e.g.:

sc8280xp-microsoft-arcata.dtb: bluetooth (qcom,wcn6855-bt): 'vddaon-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
sc8280xp-microsoft-arcata.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
sc8280xp-microsoft-arcata.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
sc8280xp-microsoft-arcata.dtb: bluetooth (qcom,wcn6855-bt): 'vddbtcmx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
sc8280xp-microsoft-arcata.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
---
 .../bindings/net/bluetooth/qcom,wcn6855-bt.yaml    | 94 ++++++++++++++++++++++
 .../bindings/net/bluetooth/qualcomm-bluetooth.yaml | 26 ------
 2 files changed, 94 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
new file mode 100644
index 000000000000..a4a887a4dde1
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/bluetooth/qcom,wcn6855-bt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm WCN6855 Bluetooth
+
+maintainers:
+  - Bartosz Golaszewski <brgl@bgdev.pl>
+  - Balakrishna Godavarthi <quic_bgodavar@quicinc.com>
+  - Rocky Liao <quic_rjliao@quicinc.com>
+
+properties:
+  compatible:
+    enum:
+      - qcom,wcn6855-bt
+
+  enable-gpios:
+    maxItems: 1
+
+  swctrl-gpios:
+    maxItems: 1
+    description: gpio specifier is used to find status
+                 of clock supply to SoC
+
+  vddaon-supply:
+    description: VDD_AON supply regulator handle
+
+  vddbtcmx-supply:
+    description: VDD_BT_CMX supply regulator handle
+
+  vddbtcxmx-supply:
+    description: VDD_BT_CXMX supply regulator handle
+
+  vddio-supply:
+    description: VDD_IO supply regulator handle
+
+  vddrfa0p8-supply:
+    description: VDD_RFA_0P8 supply regulator handle
+
+  vddrfa1p2-supply:
+    description: VDD_RFA_1P2 supply regulator handle
+
+  vddrfa1p7-supply:
+    description: VDD_RFA_1P7 supply regulator handle
+
+  vddrfa1p8-supply:
+    description: VDD_RFA_1P8 supply regulator handle
+
+  vddrfacmn-supply:
+    description: VDD_RFA_CMN supply regulator handle
+
+  vddwlcx-supply:
+    description: VDD_WLCX supply regulator handle
+
+  vddwlmx-supply:
+    description: VDD_WLMX supply regulator handle
+
+required:
+  - compatible
+  - vddaon-supply
+  - vddbtcmx-supply
+  - vddrfa0p8-supply
+  - vddrfa1p2-supply
+  - vddrfa1p8-supply
+  - vddrfacmn-supply
+  - vddwlcx-supply
+  - vddwlmx-supply
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
+            compatible = "qcom,wcn6855-bt";
+
+            max-speed = <3000000>;
+            vddaon-supply = <&vreg_pmu_aon_0p8>;
+            vddbtcmx-supply = <&vreg_pmu_btcmx_0p8>;
+            vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+            vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+            vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+            vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
+            vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+            vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
index 1ee97089e1d5..62d7cdb67a3a 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
@@ -16,7 +16,6 @@ description:
 properties:
   compatible:
     enum:
-      - qcom,wcn6855-bt
       - qcom,wcn7850-bt
 
   enable-gpios:
@@ -37,21 +36,12 @@ properties:
   vdddig-supply:
     description: VDD_DIG supply regulator handle
 
-  vddbtcmx-supply:
-    description: VDD_BT_CMX supply regulator handle
-
-  vddbtcxmx-supply:
-    description: VDD_BT_CXMX supply regulator handle
-
   vddrfacmn-supply:
     description: VDD_RFA_CMN supply regulator handle
 
   vddrfa0p8-supply:
     description: VDD_RFA_0P8 supply regulator handle
 
-  vddrfa1p7-supply:
-    description: VDD_RFA_1P7 supply regulator handle
-
   vddrfa1p8-supply:
     description: VDD_RFA_1P8 supply regulator handle
 
@@ -91,22 +81,6 @@ allOf:
   - $ref: bluetooth-controller.yaml#
   - $ref: /schemas/serial/serial-peripheral-props.yaml#
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,wcn6855-bt
-    then:
-      required:
-        - vddrfacmn-supply
-        - vddaon-supply
-        - vddwlcx-supply
-        - vddwlmx-supply
-        - vddbtcmx-supply
-        - vddrfa0p8-supply
-        - vddrfa1p2-supply
-        - vddrfa1p8-supply
   - if:
       properties:
         compatible:

-- 
2.51.0


