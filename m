Return-Path: <linux-arm-msm+bounces-107866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKVLI54NB2oLrAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:12:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B09A54F3AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:12:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C5DDC30E74C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5131C480320;
	Fri, 15 May 2026 11:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ow2/Pxru";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NmESJO7U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D3E47DFA7
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845636; cv=none; b=CDdMjFn3/D8oF5llhO5TFVV7pAnmrpsvHIs7YNc2IpdVQirmOkg2njfK/2zHCa+9Ct1mZzyh0dKb9+iHYBh4IXU3/reJf/TcutVislDUrVUEgz67OZLqCNpTBI68srJG3iMPax7/hC96UTELZlFAP3i3n0Ms1+ifryr6PiYpToo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845636; c=relaxed/simple;
	bh=4M2TBYpxqgqbTrXGYFva09FAQRD8CqoUIWxiqXhZFjY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Riov8GGkZTkEC30Kp4xYKw6jMYRmGwHAuBS60TIQ2ZSHr9veJoAOfFAFi6ZQk7KmqiaN2h2R33AktX2KW77jfyKI+A5U86azgibv0mBlwhPdNBUxKw0shs1UWKruy3qOFNXJRzEVo0+eybDu1fXSmvkmQdHa1FjCGtTrBTfpNkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ow2/Pxru; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NmESJO7U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBN38e3200273
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6roQNjpb+8MQigLcJcJkp9nr601xqozhRNmfLC2tKqo=; b=Ow2/PxrusAXTWq5D
	QTWHn3eD3uMqayLeQ9SdBMJQxkb8F3OEjTCK4rsvN196DiPH2aoeVfs0r9R8Mb1a
	LTjRlnRyj8Obukk2ROJQ0qnZGtd5E47G3KEb53Dr2ovMm7bb4KMvxkcsgErTLznt
	fNCdlLF5h9YF6ezTXa9x9NmdIORnp+C77hjr8Cl1rYoFoTNHmD/q3IqKjGzsEJAA
	Xoe8yp8ocePVbstJIZsqcfNR/dYZ2TQxk1Z3G6UlOFLX9m/ndV3+24oAucofoaGs
	8pWUW/mfFC9ntwQh1YVZ0gomI/q0stdWGa7p4VVOqxuVVGlCavmempGU0H6rRG17
	0LctAA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qu22q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:47:11 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-57584c23424so15567975e0c.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845630; x=1779450430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6roQNjpb+8MQigLcJcJkp9nr601xqozhRNmfLC2tKqo=;
        b=NmESJO7UEqjLljy+xnKil1B44mt0T5/dRGaJsHAO+1FnqCvY9k9qtaCJ3iOJYRTkOo
         OXZ2M85HlI6obJmMyRuUN5G9Oj23kAPv1rVUkgL+bc6ZS3D4eeyu1etK2PTL+Dj3+ZgE
         AT5GUANL3CfA+KPpM3UN1UTCGaV8SNSVXj/o6P/949wG8sDjSdkg0sE9j5wq94wzB9+j
         0EoWtuWf1+BXYUh+OofKON7yio6qIFVH64bAHqjwx/zYAzUNPzfHPtQQZ8tyvTrBV7Bk
         fw4tmgyzyXv5IcenF6YYD2c2ITyNKvvWHwVwNyzNcdjcm2hLvv2dacWfnQVSnDkFKDSl
         6bFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845630; x=1779450430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6roQNjpb+8MQigLcJcJkp9nr601xqozhRNmfLC2tKqo=;
        b=pC88EW0PdES31sX45fqN7iXodW6OjiBu/POV1vFIDJCShvcHvk/EOtVy7zZfnKZgXv
         +LAo588xkl3CpDZgIhO1iUPzajiw0YJ1EGUcUCQTYbcTSUREU4QcgI6v5cNLWe4Nk3XX
         qAAWd0mmHKkNK4omrJ4u2/2OIIg+9ZjEETquwv2nZebL7RT8njsWq3lGZWQASx5e/+rj
         x/Edqoqb8itPrx7W4YKcD8RNPwgR0+f+y66b//QKDJgF7FCuytsbqF1X5hE2rBmGuHf7
         +7yXi2//6yx5Zc24X2nqT/pREjujg6skrZyQW1cY5s/uQL/EMo9ABNmCuobBdpYPeQnC
         4/uQ==
X-Forwarded-Encrypted: i=1; AFNElJ+wXLpXg4h07gU/LHMwf2jdW0pJJ3s06xkRLaqTLi4D0rlorIYqVy5WjR4Lquo9DX0y5GxtGxprwqSeIphJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyuF1BIOihvz9CR7wYy6rNJsuI0hm/kDmUq/OcYhO3dkA2BJ/3s
	IyfJi8Ed/tEmTS0/otLo4RI1BxIA0xEqeqiN9ncRbwE+JzJ7dTlyiwknG9nD9zFWur1yFcd9afD
	pGHFgjp2qujIOejDYeNnjk+wCKIgrVPwGV5snKHc924Nm6tpkjXOkhu6lm7toeu5gRj5Q
X-Gm-Gg: Acq92OF3kiS55pjBY63bzCui0dngddslhTQ68KMLMoIBLrde0G49UKUrXfMT/1Vq2aP
	o9OD2yhBbxjFBAYY7u6A245Qk3rEOXrK7ptzuJjkFi9nhzOkP5GxDidSysDptLQBHEkurYJQWdB
	uPVoOcDiiTTCyCGAHKUeE7PlMrbPTFxTMxo3TOwofslei4lfydbnqZUvqHNni3XG7SMw/J9YMfN
	g/uYgSUYcsLCbKNwBmmCt3Fo7m0svuOQPUMkw5Toml81bG8rym8ZWC8p5lhUsg45MCfoqA8Ks7a
	Lz1sXwON1Fpv2GGlMDdbZniKI6FaLKIdTaOR64NvT+YJwCIp/Us83cwb/MBeu4U7Rgd5iFj5YW0
	9dyqgwbGJyw1GEXOgGjERgj5DFTcAiMmR
X-Received: by 2002:a05:6122:30c4:b0:56d:451b:e4dd with SMTP id 71dfb90a1353d-5760c1c8c1bmr1863601e0c.12.1778845630079;
        Fri, 15 May 2026 04:47:10 -0700 (PDT)
X-Received: by 2002:a05:6122:30c4:b0:56d:451b:e4dd with SMTP id 71dfb90a1353d-5760c1c8c1bmr1863575e0c.12.1778845629522;
        Fri, 15 May 2026 04:47:09 -0700 (PDT)
Received: from [127.0.1.1] ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c3150dsm216853366b.24.2026.05.15.04.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:47:08 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:46:59 +0300
Subject: [PATCH 1/3] media: dt-bindings: qcom: add JPEG encoder binding
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-qcom-jpeg-v4l2-v1-1-f38c2e1b3555@oss.qualcomm.com>
References: <20260515-qcom-jpeg-v4l2-v1-0-f38c2e1b3555@oss.qualcomm.com>
In-Reply-To: <20260515-qcom-jpeg-v4l2-v1-0-f38c2e1b3555@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kapatrala Syed <akapatra@quicinc.com>,
        Hariram Purushothaman <hariramp@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gjorgji Rosikopulos <grosikop@quicinc.com>, afilipov@quicinc.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=HbkkiCE8 c=1 sm=1 tr=0 ts=6a0707bf cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=zuwlB1WPNs1_77ySLLMA:9
 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: QdiccEMbf1aRXsRowXpm2FryRguds04f
X-Proofpoint-ORIG-GUID: QdiccEMbf1aRXsRowXpm2FryRguds04f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExOSBTYWx0ZWRfXyGQS1rQCZa2E
 qwrw4PoxH46HlNPUlEtbzuOEz9A835LN4ES0AwQswpYRrUx+CYV9dtmN65YrPTQCgLtbzwcVNZp
 8sL7Jt9HVZxnnudJQaehyfGrYegOpZbBkWmTq31muXBkiGZfxC0Fhk1owKUJPsB/0PwMyHtHBsq
 KMYMlXxWnYlzPnAy4/2Nq7YatrzpIx+dSrZ4zdfDjQzrqhb24z5ZNpNBVimLGH3cxpFHXAosfUD
 OFjUkiykQf3n52v7yISwDSDd1zSAshFaWhbDusW7x2mD3B/z54cS0VmQjWX8JJ6u8vuY7OPaknq
 gtjBMdeHiCX4WE/i8GLO3y35nO5VA4OCEL1noP/2ZIK5Gp7FbzTaRp2f6b0y+2wmPVMnQGHksey
 YU6QJzAoeeGUTGk7ppSY4oX/Ioej5dn8BKTL/5QUMJWrvqT9i1pzbdtOSc2KV1992lL1lsUa+V+
 B7w31zXmAv3hy/64e1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150119
X-Rspamd-Queue-Id: 5B09A54F3AF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107866-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add YAML device tree binding for the Qualcomm JPEG encoder
hardware. This binding is used by the newly added driver and
describes all required resources, including clocks, power domains,
IOMMU mappings and interconnect paths.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../bindings/media/qcom,jpeg-encoder.yaml          | 122 +++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
new file mode 100644
index 000000000000..fac3e654458d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
@@ -0,0 +1,122 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,jpeg-encoder.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm JPEG Encoder
+
+maintainers:
+  - Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>
+  - Hariram Purushothaman <hariramp@quicinc.com>
+
+description: |
+  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - qcom,sc7180-jenc
+        - qcom,sm8250-jenc
+        - qcom,sm7325-jenc
+        - qcom,sc7280-jenc
+        - qcom,qcm6490-jenc
+        - qcom,sm8550-jenc
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: jpeg-regs
+      - const: cpas-regs
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 6
+    maxItems: 6
+
+  clock-names:
+    items:
+    - const: gcc_hf_axi_clk
+    - const: gcc_sf_axi_clk
+    - const: core_ahb_clk
+    - const: cpas_ahb_clk
+    - const: camnoc_axi_clk
+    - const: jpeg_clk
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    maxItems: 2
+
+  interconnects:
+    maxItems: 4
+
+  interconnect-names:
+    items:
+      - const: cam_ahb
+      - const: cam_hf_0_mnoc
+      - const: cam_sf_0_mnoc
+      - const: cam_sf_icp_mnoc
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - power-domains
+  - iommus
+  - interconnects
+  - interconnect-names
+
+additionalProperties: false
+
+examples:
+  - |
+    qcom_jpeg_enc: qcom,jpegenc@ac4e000 {
+        cell-index = <0>;
+        compatible = "qcom,qcm6490-jenc";
+        reg =
+            <0 0xac4e000 0 0x4000>,
+            <0 0xac40000 0 0x1000>;
+
+        interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+        clock-names =
+            "gcc_hf_axi_clk",
+            "gcc_sf_axi_clk",
+            "core_ahb_clk",
+            "cpas_ahb_clk",
+            "camnoc_axi_clk",
+            "jpeg_clk";
+
+        clocks =
+            <&gcc GCC_CAMERA_HF_AXI_CLK>,
+            <&gcc GCC_CAMERA_SF_AXI_CLK>,
+            <&camcc CAM_CC_CORE_AHB_CLK>,
+            <&camcc CAM_CC_CPAS_AHB_CLK>,
+            <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+            <&camcc CAM_CC_JPEG_CLK>;
+
+        iommus =
+            <&apps_smmu 0x20C0 0x20>,
+            <&apps_smmu 0x20E0 0x20>;
+
+        interconnects =
+            <&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_CAMERA_CFG 0>,
+            <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI1 0>,
+            <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI1 0>,
+            <&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI1 0>;
+
+        interconnect-names =
+            "cam_ahb",
+            "cam_hf_0_mnoc",
+            "cam_sf_0_mnoc",
+            "cam_sf_icp_mnoc";
+    };

-- 
2.34.1


