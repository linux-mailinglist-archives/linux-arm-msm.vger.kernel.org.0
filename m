Return-Path: <linux-arm-msm+bounces-110773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MnRBrqfHmquDAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:17:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9021E62B3E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:17:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A07030D3C8D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 09:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 727173CF95C;
	Tue,  2 Jun 2026 09:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dCjuozEb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fluKrH0X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEA83CF68B
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 09:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780391431; cv=none; b=GVbwo/LcJ3MV5xxneGpbXCDpF+QPAWiBn1B9Oi+wpr+Gq4A82dWsOwrbsKjKpGmXgMZMcL8oBfFzdBw/YmDJZcyd8M4y9iPt2JEcyPVL0Cz8od/faaxbvTRG9VXipS3sDUyPLCKPifRNGqtjfCOkjIia81UeW/owTrOHWpazCB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780391431; c=relaxed/simple;
	bh=PwHVZpJX9brIN226X+RqpA2VNqM5YOqAh3goSrAbgPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gpYBTLrdX2aOsagkSUEjsOm2uCnnlqKklS/iq/kJPe6lokgTUReh7/tccVoNRddrGRgJX2FpZS4tfwC3t/XopIZe2HvFUXQ/I7Y6SWfDuVDCMSRNTyGVCAjQtEKr+blQezLLcz2HIcS6WATW8LCsTONyYbWL72pb8j2unJG6Lwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dCjuozEb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fluKrH0X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65245hdW2691980
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 09:10:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	euyWMbjcoM091o/6mEbzxe+zmJHFTJERj9ARUAp9lDc=; b=dCjuozEbeRXzlhDv
	vDPaTXFtWdxWGFkUggSSAoNEfRrvyomIddOk6JBtSDjLI+RykI3vNFt6iPfKBOmL
	P/ps+K+dFNin7rO48asQPUNovLq7sfKpIp5TDrsHv6l6lIBf3UOtnP3J0lFjLk79
	EnBiwBKzeYa/zVQPycKSFobLDMV/qtOFS6yfJsTj/uzQr/DlsFvoVCvNdS42mUYH
	Jppb0pVR5hyHAmkXfkslXzBVQ1suDcILWH9h2CK3zGhDKYUh0p2SDsHAiD90/Hg+
	qT8l+vDm+Sksc/pMcfM/W23fum1jpcnBX5aMKdSbKyjUEmNdvdz21SeAKstsLUp7
	NJUtYA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehqumh67w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 09:10:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c1e112dfso31324405ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 02:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780391429; x=1780996229; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=euyWMbjcoM091o/6mEbzxe+zmJHFTJERj9ARUAp9lDc=;
        b=fluKrH0X3E7hUcFggVdPq9J2dvI+2eaSkp4iQG/wnwEeaW8mrtInz1S+GKQiYHNXuR
         g9BCZ1dNVmrKcQDTqLtoAtbEOuJarYOFdGIdnB+aY023WLxMOBvZsQdW392meP51ZKFm
         EnCZs4b/mdeP7/3VoLW/UYLEghgi+uL9iLO2ZomDTdbpZYy6WKgWyc4b//42x5zqIDd3
         CfnHe6Vhew2k+dMIfEAJQ1sIG7EQn95sAtpd803Bj7mr3QrQCmv/mwA8VlYvjC8KlVKy
         4pK08B6fAthH603+CYLWjj9cfmHcW6iaaw6JbMtD8w4LMud5/awI38zlwv4yQU58/yCo
         7HFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780391429; x=1780996229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=euyWMbjcoM091o/6mEbzxe+zmJHFTJERj9ARUAp9lDc=;
        b=KRpLNy+PBJAPNUWBY11X9w3I5j7GBpt23iGSrVHEXAAtlj5bw2hZh8lph4Bt2DgyAe
         +RL3IBMfO9BmTl6AoMNCPODSqX+kOsCwmEW6GUz+A4jjB0qmcukaJbyKRH19mjlS5Vcl
         SftaTfptdxhhTotnufpfrI6teSnkW4OLpklPkWYcBQERiBaZRo/myslPPogkr0C60U0l
         aLjnsez2P3xTPUSje/ynGNJb386kV11SfI12dl58pDXCr0BLDy1xag32Im3GdOYZ3yjE
         USe4CuMK1x9njCpDuaj0ip3XZxZZsBb3toigEtPFnA0HedqznUxwP/nlCgjGYG8H/9Ag
         LICQ==
X-Gm-Message-State: AOJu0YzN6zoSzHw7E+mw/CEKgAY04//2pHzgxypy/PKoRPBxiunKILd8
	BPblaIioQQXaRryhr4QmlWu5jzDi0bI55lih/58uP7cIDneK+EvmkV50i3m2QxqLKJ0Hwb0E91p
	PrmUoi6Ffm5xzon52AYe4P5VwuaSu/zzjf7ieD0zYARxpsmmDyBkumIm3xfLhf2FTSJ3j
X-Gm-Gg: Acq92OHxEmVf85pxkFSQYGckS7ILvP9DmH0Z/qwmsFBop0SqmVtyctwRFQsQBeO4wUm
	CP7F3WaHJrVkPeetGFoPJB9egje/EVhwZiIKLJd8uyfbII6A5bsU7A6UlJ8jrHruws/6HDM4kTs
	1K+XM16pTroSOa4H1PkkX384W9JeYfbLBpIIwPPHrY7UB97goEn/5/dIiBl6Xv59ags9cY8f6Di
	wZO5sMdjgHPEA39dj90d5JRGAXgP5eOVxcXYUK5tDPLj0flXzy6nHSoJZeQvoqiI3XtgeEBl4LH
	/WIxx7i5GRpQE/rwssyJoSYC8cROD+Lw6+X6tVkRYlhmW57mHkaF+iGccjoKdRQEEbdHg7cRZ2o
	+0OcaHr7CCnfy9rlNLNE3a/z6Zt0g9kgbEQDgi1jeqaXx1WRMZKxhkK7A5yq+b3k3Lb8M0uENZb
	1sxxXwQeMzS/sey+a12rm+h/Dez4A1RIXX8nwtqDbQ5GMT/GsF+sDGImF1BD6//rYQc4I=
X-Received: by 2002:a17:902:e5d0:b0:2c0:ccdb:e029 with SMTP id d9443c01a7336-2c0ccdbe566mr106706815ad.18.1780391428772;
        Tue, 02 Jun 2026 02:10:28 -0700 (PDT)
X-Received: by 2002:a17:902:e5d0:b0:2c0:ccdb:e029 with SMTP id d9443c01a7336-2c0ccdbe566mr106706425ad.18.1780391428195;
        Tue, 02 Jun 2026 02:10:28 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e6ff5sm173007765ad.7.2026.06.02.02.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 02:10:26 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 14:40:17 +0530
Subject: [PATCH 1/2] dt-bindings: phy: qcom,ipq8074-qmp-pcie: document
 IPQ9650 QMP PCIe PHYs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-ipq9650_pcie_phy-v1-1-d8c32a36dbd9@oss.qualcomm.com>
References: <20260602-ipq9650_pcie_phy-v1-0-d8c32a36dbd9@oss.qualcomm.com>
In-Reply-To: <20260602-ipq9650_pcie_phy-v1-0-d8c32a36dbd9@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA4NSBTYWx0ZWRfX1O+zBRTGTZwU
 X9+lWRGqduJ06StXP9jI8lUOrtKGEEtxux84FgqrEJDfrMVlYOLx35zwGqHZwJ2rU2ky3MMqRQv
 MDfMLh8r+VJUGB79OSWwrWqnPOLhtEUuzXyXOYVDeBUwAqXSshE2oTiJET1wnPSzCSgoRSo+bg8
 3olYqd9stVhUfiBOp7H81Yw15FEmhHA1iqs2jJ+JQt4Suzpk42hthQgsjtPfqvyJSB84dyXRoAp
 88LQTAJrZWOrTFqkc3VZWilEST+yaglx07mny9UdT7ATYbDkbnIZk0NZmhGJbzWrgMf3wYDIkdb
 B0+hAdqkGKtQdv9TyzXteGDiv8r7BVLaOpraHXpI18ob/SAWYpACM7zVnfOds/rQGuyKTlxVgkG
 Ca/xheSpcdwVTXKmSunVQen42Uf1eGigvTNA69goI/3PEBPyrmVhhZMP0zWATnGE7nYqTtU5UD2
 sLytPwlygCNVya7cJCw==
X-Proofpoint-ORIG-GUID: k3z7sDT4jeLVyX1XALFDJy4uG1h2ig9b
X-Proofpoint-GUID: k3z7sDT4jeLVyX1XALFDJy4uG1h2ig9b
X-Authority-Analysis: v=2.4 cv=Rrv16imK c=1 sm=1 tr=0 ts=6a1e9e05 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pO3CVo40WvI9-LPkYfMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020085
X-Rspamd-Queue-Id: 9021E62B3E5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110773-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document the single-lane and dual-lane QMP PCIe PHYs found on the
IPQ9650 SoC.

Unlike the PHYs in the other supported IPQ SoCs, the IPQ9650 PHYs require
the on-chip refgen supply to power up. Add the refgen-supply property
and require it only for the IPQ9650 compatibles.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 .../bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml       | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
index f60804687412..048b2e3ff0ef 100644
--- a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
@@ -22,6 +22,8 @@ properties:
           - qcom,ipq8074-qmp-pcie-phy
           - qcom,ipq9574-qmp-gen3x1-pcie-phy
           - qcom,ipq9574-qmp-gen3x2-pcie-phy
+          - qcom,ipq9650-qmp-gen3x1-pcie-phy
+          - qcom,ipq9650-qmp-gen3x2-pcie-phy
       - items:
           - enum:
               - qcom,ipq5424-qmp-gen3x1-pcie-phy
@@ -61,6 +63,8 @@ properties:
   "#phy-cells":
     const: 0
 
+  refgen-supply: true
+
 required:
   - compatible
   - reg
@@ -72,6 +76,21 @@ required:
   - clock-output-names
   - "#phy-cells"
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq9650-qmp-gen3x1-pcie-phy
+              - qcom,ipq9650-qmp-gen3x2-pcie-phy
+    then:
+      required:
+        - refgen-supply
+    else:
+      properties:
+        refgen-supply: false
+
 additionalProperties: false
 
 examples:

-- 
2.34.1


