Return-Path: <linux-arm-msm+bounces-97412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPNwCIzns2nZcwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:31:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AF9281784
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:31:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2C757301C149
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C31DE31F9A6;
	Fri, 13 Mar 2026 10:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wfa/GqUE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="juTvdS38"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E528336EE9
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773397898; cv=none; b=VHhSkP0zBVLmvfpySsZlN4MqFAByDXx6+Q0A5yAN2UQEiMZbp5ArvQX/PtKea74k7BPnW75SENV8JldHlOR6UtjECfmEqnP2BlwZ7F1Vrhvf9yC2qed2nGDvkvjVH8pcur+z1hjyw3z2t8/SRsWU5kNAZc/fX7LKm2K20xZOZ2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773397898; c=relaxed/simple;
	bh=IWdLMZCoeT7sLlZFMTceFcULNxOWcybT5jnFhi56l0g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K9XAd+UhwU/51NsQNDcf7YQ2gm8etawOqsBcuOatwWMzI62QZ2reFkxJw77rUN2mBTl9P+mAQo6wfvsafkbK3jCe5ir4fVdMlhn0He7OTQ22zz5U4nxMyUbXLxjMMAViVmA/bfoOaXXEktuiXB64lxhNIfxVHO4t86yl2ojZeiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wfa/GqUE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=juTvdS38; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5teMk3342525
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:31:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PuZSbOJsGs/9ICK7khlpc4C8PH85TPIcJBVd/47S+1g=; b=Wfa/GqUE4yfOje20
	lfBRivyWkrPN/r6KPmPTNY41r9BvvWu2CuSuVGVsawI3q8axU2jbm7UmXNp5fyau
	D25eeLO4mtvK/ROVMoEP/0Y0KdjxAQdJ2+aLCcW2NyhAa2nC2V4XKPKct7Yba/4L
	hMJp3I+5WgJlwiSXI4tLL1n+SPrqGT/tZJGWMTqKyVqdVACQXNmiMlm+uQwqp0Eq
	FmvtN4c7DcAdGDvrZkl+r5PFtyX8v6oP7St95UcFmYvQfjl7wrGbg20+em8LarwT
	/ZmdC7D6SpJxqPpTr2mKdNlvnT+EOQC2KyjW36ZEsCia7VKYR5eXczF1PqbV5Pgi
	rAhFIw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w4d60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:31:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354bc535546so1938560a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773397895; x=1774002695; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PuZSbOJsGs/9ICK7khlpc4C8PH85TPIcJBVd/47S+1g=;
        b=juTvdS38acnJafigojYN6bH8RGbLOFghZt25jUjxDxLeOOR3IHxnoHU/3Mv+48FDbD
         DKoYxQ+ZJT412JOCo950AW19eQp8EZD6+1NixGeSuHa7aw7J2wDsjcUJ8j7Ixy+IBgu8
         eZiZ8sEOcWpZiH1XQ58hBFU42qt/1JFyiDygdzeuGV8uA2Zv3WIduLYoj04IUcmjJeY+
         eV3F5IZSOZnJlFdGEo4Q4Iyi/h1lj7MwJ4kflPzOlTgJCaZCgZKwRXM8Zv5MaBdoDghc
         JAEK8NLBWdl+CF1HE84WDCjNrJGBMCXuQLpeX9CeYSdPisafUFKrs6mQSqybg6P8Fy1u
         fBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773397895; x=1774002695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PuZSbOJsGs/9ICK7khlpc4C8PH85TPIcJBVd/47S+1g=;
        b=ebtrsvdakGWQlIfqCE/6HP6p5as0gHMQLdJhF/GgClCdpvus+VxTg8BzbSgq4IxeSz
         WQiCHyaeO555KmEjqvqj/hIyK0X8HQxIe1Lw80blCIDjR4b+dH31oXe0PtuuIZCQOxv7
         yZFT5ei2f6nP4M+OJatVDj7xdEyRJQBOn09Ki4W3exbC6aA1gjPKXqhwlwB5rKwfcDtU
         9JW+c2sYazgUGafpPvfCCFw2cXuPVRpZtZhMt7CylDo+hm58zeKseZcNBSALrrxBaDPB
         nNJ7ssd88Pxj+8O9npOyC41h0rMIE5QzT5kBrr2REbScOeGSKOqQVQp9cP1IOT8fyEft
         0QIQ==
X-Gm-Message-State: AOJu0YwzaCVid2VS8FQcqQp6hYOVVfGbvUw1o9lcjvr90Rcqw0Ku6dvi
	juc2H1OW7eUs5FzJEMG9VK3FLeY10GhfV/9GFThIpYR2WVndCGEDPsu7W3gLx/wqRbhblQEAnT5
	NseaXOvmcz5QBZfw+SJsf1S6Reff1hQoDasm5ZXn1mG1VtZ8ppv6jmcPmkUCacjFJByD3
X-Gm-Gg: ATEYQzxwFr/yeDTbDew+F8RzAFSL0uIVd55XO1/O3vrQ0DNjH71cFl0SWq0cc3zxGvx
	SAtzjoN7zy0vOKmHgPZ1nhxZ6J/lkmDOXfIMLi21eCfTU2sU+0B5hzNtoYEf+INIKrm1Zwmr67P
	JTNcyLexvZPCwCiozr9wVPcEj88TkVzJIhvI9N0roq6pDtTq51A1vPifwgNw/axByWHgDbmcyGB
	qBrCmUIsJKoyDT80V1wUcuYW+rBppeZoMHsRtPL4M1aeXhQdiUCmX4fYZqgMMFFOg1/Y0EUMhbN
	BupnjN9n30pAdtqdGdDTe9EvmA1+8iGbOpZ2ct9AeB77wdGe4VBR/taIzq3NczRKYyQStHZ5ZPG
	y7WDEoV6nj0PdPsY5IB6VeHZuqUNM68pQtMDTbAokPB4czxdSJ+scsRG2nE5rMLko1niW4tX+Dp
	4QjbXN6uzl2RfRHGwS9P8PQYmw+XLEX+AQFQ==
X-Received: by 2002:a17:90b:1e45:b0:359:f2e1:5906 with SMTP id 98e67ed59e1d1-35a21e3958emr2423111a91.4.1773397895318;
        Fri, 13 Mar 2026 03:31:35 -0700 (PDT)
X-Received: by 2002:a17:90b:1e45:b0:359:f2e1:5906 with SMTP id 98e67ed59e1d1-35a21e3958emr2423085a91.4.1773397894859;
        Fri, 13 Mar 2026 03:31:34 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02fc9454sm8604577a91.12.2026.03.13.03.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 03:31:34 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 15:59:51 +0530
Subject: [PATCH v4 1/5] dt-bindings: embedded-controller: Add EC bindings
 for Qualcomm reference devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-v04-add-driver-for-ec-v4-1-ca9d0efd62aa@oss.qualcomm.com>
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
In-Reply-To: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773397885; l=2238;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=UTz9Z1xOCUg69vDgInVuKa/ozDgodVccbshMqN1RjNM=;
 b=DqH6TX4TZB/5jaGrLIyjO5ApcznbF35JeuPxrx6JArsKWKWk6eGSJKs7DxhDwmGLH1phABS8I
 7tMXYW+tTg9AJaVJwUuQHv61kLQHPc/EiyTZJY62hTLNBNbYsLJ2XFf
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: ShQ3_4lW8vfQY6m-IvTN2f5cHXbV2Zix
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b3e788 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=6bqoFnLgofmmdwMbvCAA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4MiBTYWx0ZWRfX4U8BxidcScdm
 qzv9gdEqa4ZNhn4kiQ7kxf0yVwCkT8to9D++Wol8y7yGwdyadfeAWzbjgnW4W3ypnyCf16tjj2J
 ImQT4RsmbaBZKDwE953ceTeck/Z45qQrO2lzIl1O//BmlUt4bWBbLVphXYEdgZ7ojlDCkUDks+s
 9kwQJpsdGGhDpAfRrBcpJuG/AQnVAELFChNrok39IQWVo5hs3jv2eSSv4UCkDBV3nOh+c/5bs87
 +Pi4L3x2Al8uJJnd83bs0uE/bSWZVS4MdNwlgxfwxVHEKYYCedx3BT3gB5vSgTs3gdBdW0Y0msw
 huXT3P0AATjrN0LPL43iZPnSecp+R0gj57UibGYeg/T40c2x0jnX8VOEBmy9S7zyIf3221KNBuR
 qNdGqwXOB2TVG6woStStVdBLHRJecMm43ZWIeUGyWksWUG4rSDJ34flNXyXzheWvIbR01K0PT2m
 Ucrm1bKHhzQwikk1jvQ==
X-Proofpoint-ORIG-GUID: ShQ3_4lW8vfQY6m-IvTN2f5cHXbV2Zix
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1011 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-97412-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,devicetree.org:url,0.0.0.76:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C3AF9281784
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Maya Matuszczyk <maccraft123mc@gmail.com>

Add bindings for the EC firmware running on Hamoa/Purwa and Glymur
reference devices.

Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 .../embedded-controller/qcom,hamoa-ec.yaml         | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml
new file mode 100644
index 000000000000..baa95f06644a
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/qcom,hamoa-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Hamoa Embedded Controller
+
+maintainers:
+  - Sibi Sankar <sibi.sankar@oss.qualcomm.com>
+  - Anvesh Jain P <anvesh.p@oss.qualcomm.com>
+
+description:
+  Qualcomm Snapdragon based Hamoa/Purwa and Glymur reference devices have an
+  EC running on different MCU chips. The EC handles things like fan control,
+  temperature sensors, access to EC internal state changes.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - qcom,glymur-crd-ec
+              - qcom,hamoa-iot-evk-ec
+          - const: qcom,hamoa-crd-ec
+      - enum:
+          - qcom,hamoa-crd-ec
+
+  reg:
+    const: 0x76
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        embedded-controller@76 {
+            compatible = "qcom,hamoa-crd-ec";
+            reg = <0x76>;
+
+            interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_HIGH>;
+        };
+    };
+...

-- 
2.34.1


