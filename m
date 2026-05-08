Return-Path: <linux-arm-msm+bounces-106561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDiPIMk3/WnpYwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 03:09:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA0F4F0900
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 03:09:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 605F0303E211
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 01:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C58C214204;
	Fri,  8 May 2026 01:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dld8PACq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZvzKoQjh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E232F1C84D0
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 01:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778202154; cv=none; b=hTvjP1ga302utYR8z3XBg/Q6AqOjexgPpE6xVWxYahX5yHZ40QhCVvBW9CwOx83fmNpoyKQ8Rzt7NbWCMVbjfWxNgROEDhmtFtnpLXGAKhjJbCHUcCfa6ur4r+Iq4eg14iNmk9mDdrv9CfZuX+PczXHUzD1wOMIG6RZIH8fl2LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778202154; c=relaxed/simple;
	bh=iFwIHq7PnPhS1l/+UKbWINN7tuQP1Ai/kBITF6YukuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rWKVdaSea0DuQPVVmE5Wh2NGlM+XtZVWiwIIh3wiZ616xiqEqvd6v3JWoPAbEmgmXWraNYOaLX79Mg8apxDMmj/vtyqEcgdc8Q+BOKv6tyuc/0qNhAO9gdHQjlcEG1Im2u0qSpFytwOmXcYjFOieRj4F6aa0VIQPhwnVR2eb7y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dld8PACq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZvzKoQjh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647HjlST2734045
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 01:02:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cluxkf2uiEfOGcDx00rV2g86ug1I8ZPNyJpvaWCjQIo=; b=Dld8PACqVv+fP+KE
	LHUsaxAWPwMh6SE0dqeYMMDTU9FuBoKCKvjed+E7szn6OIdeypI+JH5+xrx2relK
	jemWbBxSXFUXdstMKh6aXqqNTUAq3Ov9/SaMys1whAD6fsa6phVfEaPuxICcBv9g
	9Hw+F4u04Pr6vTmxVKtx71VcKELgwymvdYfaykbpKnODlj05uLQSJcCkDxjdGF6l
	tLySgb9munCGIiWPpLVwDB76IvY6Dq6KcTcmJ6V05ZUUVWreTKoQqIn5AI1Me+E4
	eeP7a7GVFr8Me9LYdx7HB7+gxKPLXo7n6fK3qYBhDNUqHTH/ReKAsV2AxTpleljX
	mNYIOA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0tbqtpge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 01:02:31 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ef62078ee7so1893035eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 18:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778202150; x=1778806950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cluxkf2uiEfOGcDx00rV2g86ug1I8ZPNyJpvaWCjQIo=;
        b=ZvzKoQjhHyJiJukh3UUVF4IPgGEQ3hqkji4Um4Bm0DVgbOjLCNr+CMKJsaP4fPm8J6
         o822xlYKURdOhSqpJa6XJeznsqp0uAeYbnc/O6gJxcTU2WECEZF8GaOrZC0AIhayfr++
         AeCL7oVPMfU6nzEsOGoIbug7C9q2IGlklAgNdrcJA37PHv5d+JDjMdkv0Sqblkd9zwsy
         cex/12pY8Ej8etaEDf8VPH7VaTr2UD0zG+etgBUnoDNVVomSDcNa0dtJuEcdYPYJZVCB
         pJL4Pd4Htbq/Y8r12MXEbgeuOQPZhy0to4OOo3dVlRC97y2wtzlFLimhIcDR8Txs5zTa
         bbBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778202150; x=1778806950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cluxkf2uiEfOGcDx00rV2g86ug1I8ZPNyJpvaWCjQIo=;
        b=QXsv1vYJOCaoBYETqV0NZQWiuRzER1CkkuITwKjbS4XTOpn+14OrJXh5Dqy/aUCVLO
         qU49iyjbl3/PnKjA1/lWIq9LawWzye0H7Dnem6qeaitxNHoFlyFiAEEOp9a9h4yiyZj6
         7PErWL3Gm/bQuo6XGwHopTiFTVaLHaOV2ZgZBCXJJ46OK6wQb9nn4X6iXcDv+Yg8K2wK
         qOXo+d4lfHTkYZq9kiAPwKTx8/i7qksaNDTLG/Cc+Qh9SDn2OBuHyYrBlOBsI9K6+xy2
         0abDZAHkRK31zE535osFvoasiSQRbT3n/lIEF/fljbFOdkxD2Xznrwmx+b5APE9aJOx/
         YIfw==
X-Gm-Message-State: AOJu0YxYZvmHG31uz17X451iRVDrnNIz1/VEUuzN9yuuqwfLAaWQb5RY
	mCXXix3Yv/MPI02JcIhV3cVGUXrqxZRKJOS+O/RETNAwNohjQr9t8Db5Dee+qfUge/apv09heBQ
	TiOUll4HrklMhSJnpEXIaoTWh3uzkDwRuWnmHkRPb0nucrGbIcICW9Zk+BapEhorhFpyq
X-Gm-Gg: Acq92OFKEztVqrfN5t3v7Ya/3ZsGtSGXotvMRT4M5rwP5nRIJ337UtO/cgLUpATDWzY
	4ieSl8eQljASOJc2CVpfSvohwhn9FWkZQcn2EXv837VnjvmXU2ZRBew8UtJX57jiwrD3pUqY8I7
	Hz4STi9RZEyM3oYp+NNO9F5kXGkrd5E93neAVuENMbJ6x2IHd4f3zqzeYdDS0pqy4zjNOzkaSPm
	5wEqWuCa9SikJjCofcqp89jlnzqU/9Ihic5Daiu+1cDeomuQtKK4K2rIcljfbtkDU7V8iJvV305
	f4QOg7vP4gC5dS9Di+vS9h2+2nRoSwnngSzRyHYxNIRK0Mk+S0oZEiFkUcuPFOdRErodKRkpl4z
	pu/g4CPPk9vuknegz6cyD5ci41zoRXMhblBhENsOjN1IBE70LTTYe19zXokk=
X-Received: by 2002:a05:7300:e78d:b0:2d0:239a:23c9 with SMTP id 5a478bee46e88-2f54a7840c2mr4740011eec.16.1778202150306;
        Thu, 07 May 2026 18:02:30 -0700 (PDT)
X-Received: by 2002:a05:7300:e78d:b0:2d0:239a:23c9 with SMTP id 5a478bee46e88-2f54a7840c2mr4739986eec.16.1778202149405;
        Thu, 07 May 2026 18:02:29 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888c469b6sm149809eec.24.2026.05.07.18.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 18:02:28 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Fri, 08 May 2026 01:02:14 +0000
Subject: [PATCH 1/2] dt-bindings: PCI: qcom: Document the Hawi PCIe
 Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hawi-pcie-v1-1-0c910906f7e5@oss.qualcomm.com>
References: <20260508-hawi-pcie-v1-0-0c910906f7e5@oss.qualcomm.com>
In-Reply-To: <20260508-hawi-pcie-v1-0-0c910906f7e5@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778202147; l=6962;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=iFwIHq7PnPhS1l/+UKbWINN7tuQP1Ai/kBITF6YukuA=;
 b=yUXMpaVvjIge5apBthE7ZOvm59w/9GnABJ9NbMQ+g15rusIJtakRlooKfuOI5euclxj666CQB
 HzbNp3zVaaCCtvJRqDaCDIV+KIGi8oTB8ahNDoPBGdwTKPdv8NNmhsP
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-ORIG-GUID: Ow3sywFCsUsAmRSLAGHgeK4tX361iijs
X-Authority-Analysis: v=2.4 cv=SJVykuvH c=1 sm=1 tr=0 ts=69fd3627 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bI9jczpiwHmIHscsW4wA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: Ow3sywFCsUsAmRSLAGHgeK4tX361iijs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDAwNyBTYWx0ZWRfX2JV4s5f9BkUN
 D97uSNmvPum66pOYwbu6P7kJE1C58RyMZ6fukPsfZ3d8Kpd0TMQGUmPURD7nBUYZSew3mIct67Y
 SJFuDENzXvdXF/gTt8y60SvQydH6zQ5zgWDItIL22NayT2Vozaa9MUbWfjTcs2FW46zfvHjx2oQ
 k0mJCWYHf3/bY5QAuFtq4Nxakh2f2a2vZqpQCME8SNrDmkjjeO6A8pfUnGLcqiOLKZ4A5XAzAIo
 SCDYJex25oPyS0XgtT/uWS0aZRwCk0R4YsNv0xyFUj2yW7BzJUCjHuwfcADkp0p7vCU1Co3FOOm
 +Qc5D48tShYLh0HfbReZnU/artx/ab8427iwGGC/c28bpR9jCvZCi5glsxIvWGLnL4oIMHoYtuF
 6OoQmA5mSsT/N0nBWWy55GyU7jK1r1Y9IZmSSsWfPmUexGNDeP+LQ7VkrCFWnXOt6nVH/Rp6t7N
 BP7L2zLz6G+UaC0RNWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080007
X-Rspamd-Queue-Id: EAA0F4F0900
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,devicetree.org:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,1c00000:email];
	TAGGED_FROM(0.00)[bounces-106561-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	RCPT_COUNT_TWELVE(0.00)[13];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_SPAM(0.00)[0.869];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add a dedicated schema for the PCIe controllers found on the Hawi
platform.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 .../devicetree/bindings/pci/qcom,hawi-pcie.yaml    | 188 +++++++++++++++++++++
 1 file changed, 188 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml
new file mode 100644
index 000000000000..154bc88e5969
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml
@@ -0,0 +1,188 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/qcom,hawi-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Hawi PCI Express Root Complex
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Manivannan Sadhasivam <mani@kernel.org>
+
+description:
+  Qualcomm Hawi SoC (and compatible) PCIe root complex controller is based on
+  the Synopsys DesignWare PCIe IP.
+
+properties:
+  compatible:
+    const: qcom,hawi-pcie
+
+  reg:
+    minItems: 5
+    maxItems: 6
+
+  reg-names:
+    minItems: 5
+    items:
+      - const: parf # Qualcomm specific registers
+      - const: dbi # DesignWare PCIe registers
+      - const: elbi # External local bus interface registers
+      - const: atu # ATU address space
+      - const: config # PCIe configuration space
+      - const: mhi # MHI registers
+
+  clocks:
+    maxItems: 7
+
+  clock-names:
+    minItems: 6
+    items:
+      - const: aux # Auxiliary clock
+      - const: cfg # Configuration clock
+      - const: bus_master # Master AXI clock
+      - const: bus_slave # Slave AXI clock
+      - const: slave_q2a # Slave Q2A clock
+      - const: noc_aggr # Aggre NoC PCIe AXI clock
+      - const: cnoc_sf_axi # Config NoC PCIe0 AXI clock
+
+  interrupts:
+    minItems: 8
+    maxItems: 9
+
+  interrupt-names:
+    minItems: 8
+    items:
+      - const: msi0
+      - const: msi1
+      - const: msi2
+      - const: msi3
+      - const: msi4
+      - const: msi5
+      - const: msi6
+      - const: msi7
+      - const: global
+
+  resets:
+    minItems: 1
+    maxItems: 2
+
+  reset-names:
+    minItems: 1
+    items:
+      - const: pci # PCIe core reset
+      - const: link_down # PCIe link down reset
+
+required:
+  - power-domains
+  - resets
+  - reset-names
+
+allOf:
+  - $ref: qcom,pcie-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,hawi-gcc.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,hawi-rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pcie@1c00000 {
+            compatible = "qcom,hawi-pcie";
+            reg = <0 0x01c00000 0 0x3000>,
+                  <0 0x40000000 0 0xf1d>,
+                  <0 0x40000f20 0 0xa8>,
+                  <0 0x40001000 0 0x1000>,
+                  <0 0x40100000 0 0x100000>;
+            reg-names = "parf", "dbi", "elbi", "atu", "config";
+            ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
+                     <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x3d00000>;
+
+            bus-range = <0x00 0xff>;
+            device_type = "pci";
+            linux,pci-domain = <0>;
+            num-lanes = <2>;
+
+            #address-cells = <3>;
+            #size-cells = <2>;
+
+            clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
+                     <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+                     <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
+                     <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
+                     <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>,
+                     <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
+                     <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
+            clock-names = "aux",
+                          "cfg",
+                          "bus_master",
+                          "bus_slave",
+                          "slave_q2a",
+                          "noc_aggr",
+                          "cnoc_sf_axi";
+
+            dma-coherent;
+
+            interrupts = <GIC_ESPI 205 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_ESPI 206 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_ESPI 207 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_ESPI 208 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_ESPI 209 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_ESPI 210 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_ESPI 211 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_ESPI 212 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_ESPI 204 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "msi0", "msi1", "msi2", "msi3",
+                              "msi4", "msi5", "msi6", "msi7", "global";
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 0x7>;
+            interrupt-map = <0 0 0 1 &intc 0 0 GIC_ESPI 213 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+                            <0 0 0 2 &intc 0 0 GIC_ESPI 214 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+                            <0 0 0 3 &intc 0 0 GIC_ESPI 215 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+                            <0 0 0 4 &intc 0 0 GIC_ESPI 216 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+
+            interconnects = <&pcie_anoc MASTER_PCIE_0 QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+                            <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                             &cnoc_main SLAVE_PCIE_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
+            interconnect-names = "pcie-mem", "cpu-pcie";
+
+            iommu-map = <0x0 &apps_smmu 0x1000 0x1>,
+                        <0x100 &apps_smmu 0x1001 0x1>;
+
+            pinctrl-0 = <&pcie0_default_state>;
+            pinctrl-names = "default";
+
+            power-domains = <&gcc GCC_PCIE_0_PHY_GDSC>;
+
+            resets = <&gcc GCC_PCIE_0_BCR>,
+                     <&gcc GCC_PCIE_0_LINK_DOWN_BCR>;
+            reset-names = "pci", "link_down";
+
+            msi-map = <0x0 &gic_its 0x1000 0x1>,
+                      <0x100 &gic_its 0x1001 0x1>;
+            msi-map-mask = <0xff00>;
+
+            pcie@0 {
+                device_type = "pci";
+                reg = <0x0 0x0 0x0 0x0 0x0>;
+                bus-range = <0x01 0xff>;
+
+                #address-cells = <3>;
+                #size-cells = <2>;
+                ranges;
+
+                phys = <&pcie0_phy>;
+                wake-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
+                reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
+            };
+        };
+    };

-- 
2.34.1


