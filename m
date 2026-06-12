Return-Path: <linux-arm-msm+bounces-112870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EUHqH7G6K2q7DQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:52:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B0A67773B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:52:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=REVkMqaQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RZaSCYBg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112870-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112870-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5DC6730E5EE0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 07:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B65C924336D;
	Fri, 12 Jun 2026 07:51:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01313E00A9
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:51:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250685; cv=none; b=iHMUyKMq6W7AOXm2AG2uR+a+2UGLhCzComk/ciTLXsMWOrzY5KBAqzYrW/oQwmIGycnpy3NMjKOIqgMQbA1zTCWuJuP0LPYjafpiROxHTRVU0dXI78j6Nrvj0adQMey+ZiMeSW4pyjLW1hFYexTeen1BWk5iK9QVb0+Z6HT+S6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250685; c=relaxed/simple;
	bh=xV3meZxfmg+SmNEyZyakPIM37rJHy3FTDDwjD44e54U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fnTHmBNIdas0cc8xH8nRdUQXuMPthFsGFAd7CFkN3X9NuG05FGyCUb8l2+b51LXbjZEs2MCG+vOjZrJ1bB+Scw+gUxYZMLbKhRutEMdiX9izY4xsp9kZDoTqkSUXr161wD6RoTsLhDvRE8GpEe3CZsahqCP/hMYMNgqTXRYfAI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=REVkMqaQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RZaSCYBg; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3BsAw2401910
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:51:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rnj83nPUbR07NzFuXsiThyrp+KHvAMSxaw41t7iA8jI=; b=REVkMqaQ10yK2k8B
	PJ8XrvcdDzzqrYJmWstTQ4rRZ4AXrbD+lv4CIkQgBLoWu7wMqult7ZL6GTKUIp4N
	ueTfDQ4DEoDIfe9mxfPgqiYHjm6woI3pVkVux2qLUb0EdCQ0f5doIdIIDBH15E2K
	B2Xg3UUyzxYvQe/mCMJugJUVbM2udGW+r9mfysl7IEQEBOV8ToTRbK2dEFiKJ9aB
	YwlLhbrize4CGens8eKc8Y70op5GHyOyEoAd1yl7DTFQHtl5MJvXQ2ova/nsoQxC
	pCyyArPL8foqM+dgKXGpBecCyCo+RYU7RzNgGfcnx4fqubI5qQEkUT4B3jKPb0YC
	v90beg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er30ga36w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:51:18 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8582b167f7so398105a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781250678; x=1781855478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rnj83nPUbR07NzFuXsiThyrp+KHvAMSxaw41t7iA8jI=;
        b=RZaSCYBgmigMVolSxsuFX43G5Cwx0fu3dTSR/909ghlkryTb+RU/05SYJcI2C75k1m
         XBdLd5EAtHHgJvYEjz+JQ8prL8MW+3r34be9y5IpnnVqFqraI2s0Ye/zYRAaAhPm5f7x
         jQ0vRdGftxZVGKgXQ1Bb7KmCJGeRWyGpTMrh8IkhNgqdpe9vXu/Ow8qHYKboXPoqn1cx
         n3hEhzPNNe1AFe9LQpkHE85GFEKnEXjJdNKp+6WyykQmqyH9j3CDpJIuk7NrD/uzh1JU
         R2qkTiKUtpn8f0fiSGLdDuSnz31S3ZiQtoCgpZywZX+9CDIJvnyw8Bn3GzYz3w5i3jFH
         QBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250678; x=1781855478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rnj83nPUbR07NzFuXsiThyrp+KHvAMSxaw41t7iA8jI=;
        b=VF+Qm5NmlCVsXLkhsu01yTTRk/qj9SLiepKiLh737ynF8VOh/CLCKzvnUvQ8oFs7ms
         GLvJfbaMuAIR8KhjQhVLcdAbqgY/yReUtCBbQLPiB9a5Io8TExeafDfpGljWIm5AgPzT
         NtQ0Nd1Ycxwwg7GxRcI+gmJGa0dOgNID5t6HcOwHezt+I6JAlcHq7I+DFgyBbK/3Ct4v
         jKzLdhEO4RlwwH49sp35pz1FQij/YUKGnOElJm+CmZM2IFWi09hRvdzVUxH4Zdvrd0Nl
         tsER0/9JWUSXAcJ9pPByR2Gg3SzYFgUYOhvMMUntm9GQ8fAAdVcKcyHvxh5QgZUCoIeS
         3q7A==
X-Gm-Message-State: AOJu0YzzneKORX3YVliTilXJI2l3U6vawEPH9TCFIUbxuXmqNxnUAHt8
	LYbFPWwRRDaD8g9JmFOjoxiqgMuZ9FbLCLp7Fgq3MSkt10fizIVPY3TmnZdGadu75oFIhXpZ8nO
	n2daGra6W/Ntvb5LT7jGQs+z8QEh57PCIz1Hciez+tA/idPGmeBMQts+rif8tonLdGsVF
X-Gm-Gg: Acq92OGtzw6z6zafp0hMM9IKQDP9GEyqDBteDKHmaQRq4Pow6DpyOS42AtAZlhbfenL
	pgZwQtANmHtfEa4Z7YJ7LTTI0j1olnvpy+StkMtW+EdidGqQOBXmuU2wObJVx4WpYnypbVtxTrl
	6V/FW74z5a61ztnj/Md6v9Xn9Fk71XjKmvj4eW26qPGZkWs+9Bl5dQjWzuzrkISITuseUORhXWw
	2x+xqiDRxfrhHZsypsCusJdMxUHhzlB9QPaRYRvSnS8F3u8IGHhdW1L3IWCHYyCjDCgpE+AfQM3
	3NWoDyyv9fzjoTaFQVd0mOh2JBHNi8PGU+2a4KDMFflnPhU2i+zXZSp2I77aLDVOImIQGFVzuAi
	/sv16Z647RXMdbztMs+D0zoGBOwFIpNkNPY9wvCDwfnxb7rxO8B+FH8SP4tBcEDLauw6gfx8oag
	1yOyqNIM8A1tDoMWDKsPLzIbpGpHxfrK7BOcVI
X-Received: by 2002:a05:6a21:6d93:b0:3a0:b781:4c80 with SMTP id adf61e73a8af0-3b783b3e708mr2418860637.4.1781250677716;
        Fri, 12 Jun 2026 00:51:17 -0700 (PDT)
X-Received: by 2002:a05:6a21:6d93:b0:3a0:b781:4c80 with SMTP id adf61e73a8af0-3b783b3e708mr2418819637.4.1781250677265;
        Fri, 12 Jun 2026 00:51:17 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8661b5ab99sm1307544a12.6.2026.06.12.00.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:51:16 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Google-Original-From: Kathiravan Thirumoorthy <kathirav@qti.qualcomm.com>
Date: Fri, 12 Jun 2026 13:21:01 +0530
Subject: [PATCH v2 1/2] dt-bindings: phy: qcom,ipq8074-qmp-pcie: document
 IPQ9650 QMP PCIe PHYs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-ipq9650_pcie_phy-v2-1-b938cc2fc267@qti.qualcomm.com>
References: <20260612-ipq9650_pcie_phy-v2-0-b938cc2fc267@qti.qualcomm.com>
In-Reply-To: <20260612-ipq9650_pcie_phy-v2-0-b938cc2fc267@qti.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA2OSBTYWx0ZWRfXxJNTogLTv5Ce
 5i2tLZOuA7tnS5W8wY/c5eBvBCasSsMpbQKSFsUSiwpnfoGm4EdXbmO+eEPo/b2+4UN2S3Wj0hm
 byyrSGhHOU3LMhfdYn0hG6ilpphNcSY=
X-Proofpoint-GUID: ZIPwXFZUDhMWjJnyq6i-9xfgz9Z31vCq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA2OSBTYWx0ZWRfX1x20Bznpc8KR
 eg9iYEm8x8fNbQEedcVactI+7qW2di0EQJVGhngK0z0fm8TRRx2mIXnavbifH90eJWmod0klRFo
 jpnUE43+S39IAxFRjtDnYxoKuciK/t9+t9rIKla5hNU/aIYbdDBBiPzIE4O25H2Z176saT0Rzlq
 oKsObthmMRjtDDEiTXstJd6zdKg7oD8dNl2TRnZ0ml9o40G79NJgvbdHa+tvU0VSq/UgRIp5DKJ
 wuegFaSZ7ydFiEjgHKNxJXQoZFcwm3fL8yu8X2FwZj3IUni7pJszmwRRk43emq70QqzXDHRY9AP
 xbCYwguvlWetiWFdNgp6Ng9yLxHb6ZA/mvuXGRbSU6c6KFZe0FAY3rK561zJKxRvZZyA1DRLlX2
 vncnrBUn5MSOiizeEnS1BJtNOPSrMie0+/SAABajhZfdSVuXZCiI/5AKE6Q4LMgi8JH1fzoW1kB
 TE7FuXhY54QnbqjR8zw==
X-Authority-Analysis: v=2.4 cv=evnvCIpX c=1 sm=1 tr=0 ts=6a2bba76 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=pO3CVo40WvI9-LPkYfMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: ZIPwXFZUDhMWjJnyq6i-9xfgz9Z31vCq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120069
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112870-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E5B0A67773B

From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

Document the single-lane and dual-lane QMP PCIe PHYs found on the
IPQ9650 SoC.

Unlike the PHYs in the other supported IPQ SoCs, the IPQ9650 PHYs require
the on-chip refgen supply to power up. Add the refgen-supply property
and require it only for the IPQ9650 compatibles.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


