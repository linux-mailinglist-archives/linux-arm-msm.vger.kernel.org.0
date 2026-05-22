Return-Path: <linux-arm-msm+bounces-109356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qE2iK+xzEGoZXgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 17:19:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DF25B6C70
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 17:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D96983024946
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 15:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30B0E3769F7;
	Fri, 22 May 2026 15:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DmxR1aTy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ftkLxK6d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C1C84039
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 15:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779463110; cv=none; b=HL6Y0YbCn76EbbND85F4edGYLVgpIaVUpBR6BvYQYQKbYXCJEy7WTfG7gKnG5Av577MtrK04wEvj/0mwVmMIX+evVj8MOF+ednsEcVBxjIs5ULbpfUHZZOrcGB3dna7sWy4XAnjdhvQ9tDXjx5fBvSJQCTbkZk1F/95M7lkPlNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779463110; c=relaxed/simple;
	bh=BLjTnPkIqMBmeKeUfBB39035D7n/iE8a3uC5nLHD7ms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eRznvS8XTooia2hP7cdG2GiH9iRTpoqm45S4hDUkKJphls2Q2NjerSbLFAfsXhQxrt4vMdeiryVntgQcu7s5SwlTAi7yglrXAc9D3fOEaDsF/XdaT8sou5DTfetVzmWXRxCrrYs0qlB24I38ZC1byroJVmP6C0W4fJpTVu/8690=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DmxR1aTy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ftkLxK6d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MBofnF778821
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 15:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mu9+G7n+6D1Go1la80V3lILv4g67InFZue93g9NauiU=; b=DmxR1aTycQa5i8tr
	Ex/RENYc/b8ShKyDPDJpArJswK6P0RiUU/xtO0gReVRYLm56y+OdG43rDi+fTuc0
	W2OGiAP0dOntgXmHHuj3ZHvFbJ3qhgtE8FjcmKdYcNCXZOs44Pejn2AbTgfVFBVQ
	KcPRsabvYfBr9qdmcr85m4Z2Su8N0WqGWkU/Y/v1F03Hpp0sDQl48h2hCuQ/C1y5
	U5dOqsN0MGr/CrDORB4FU3JHqKAP97l8TVtLjzxwJHg1NZjyrc4p7X+rL1w5EGfy
	8nrIGGb5Z6LI6eJevxDUuVzsm24uYis9KRwscq4VisMq1iq6Y4xLa9XVlBnvNhL+
	PVGW2Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eac7aud8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 15:18:21 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-bce224720d8so3736549a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 08:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779463100; x=1780067900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mu9+G7n+6D1Go1la80V3lILv4g67InFZue93g9NauiU=;
        b=ftkLxK6dhMF9AwAbOPHEJtvUyrXAAZ53lQ93LqGBR92YBzKhcY+UMnNaqmsgCdJnb1
         CbvHRswCcaDd5XRkbKU5d0lPlLG+SotXOqMQ9h6cM/9OH/jecHdUjizg0Z7YcjR/DGzA
         eYUUUoQ35yWJH81AbguTXDhJo2SEUOMb12ivsfbNkH7JNCOntCm0TyjkMvdeORCUvKKk
         Z4afhvss+k+xOxn+Pz00IxMBgT8CPsnBawC/4SEskAN+XCrhR2KU7CG4Bz6Wmr0KXxNo
         sm7IB7ToK2+YtIh6hiRLsJFCg5Y7P0kqgoVCgW3y4SHy3yxlUw/M4f2LT30BmADb2Gki
         4zhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779463100; x=1780067900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mu9+G7n+6D1Go1la80V3lILv4g67InFZue93g9NauiU=;
        b=XtOviYjhLcKQxI6M7Buti1IWKl82xqCpBoSRKezKm1nmMSwHwToR7q5Yu2AMYhOqwR
         Nju6L7Y71gU7Y4PQmoakogTLM7VQrsBtiSP0gPCw3GKllO4IrP2YFxXFGWoR5ngGexyB
         9j6hsoPzPpsSg1wtWkeokxZ4xWsjDMkSGtTBl/4hcPN/ovWymAkczrowtz3YBCCfb6b0
         +TcVMNJCVvAy6K34XTxvBCR3g+LkXhiEDeIsRdU4Vt8zFfCt7T7f//MrrlC65ONcF+pa
         GGLUGHRPTPRdD/hWIt8K7o/6Zuk6Z4cMnE/fPf+KIBFHY1m5TldNIrC+q5dRz48afEog
         cbUA==
X-Forwarded-Encrypted: i=1; AFNElJ9s01CXZsuk3kCYepWuX4NEVk9rOGOXsIm3cWp62Eg5gTFurT1Gtzc2qkeZZbs02Ah0ekscVCcbEGNrwSmV@vger.kernel.org
X-Gm-Message-State: AOJu0YyIqNCdrbHEYK71KxyivvowfdeRtWvnxKvJz02r0QzdJnR2Y0nc
	zKSI81ZAcrFyzsVcYMMk0IJWAsRlaOLRZKpEaVS1ohK/z2jcslYzW1yKQUWLZXjeNzTX5VLUkEl
	+5d7CvJuTeT+QXRjzvs3HbdlsjvPkZPGJ57Fv3uY+jk8mhjBv2NWg2HqGmanGvWgfd9Uw
X-Gm-Gg: Acq92OFp6mihbKmpnvA/gFafV4ASZwIVnsgAU1mENfZLQZrQOgxD5YjPckNM/2eL2DX
	a2/PQ1X+RU9v1Ij2NtjIDFIvwNRyTZLNr9Nf2qOeEX/zkG5f30Xt8RrNIPZEVpM/VrSw8HkMhWQ
	2cjqydmeTuXM9gM979p0oXPO8ANy2WGfGpKiihtcpQyTFeHduVBr6fsroU7g0Vx37B5K62edskx
	SzZu4279lAsNGpwVGuHwzFLfbO27cJxHC0NDk0t+bQCT7qKBrKjGCvRuwq9Q/NFkOfqol3XNbyu
	eRnIc7N7uDn61gCzUErHa71fpXodO86LdfYI+nrOs3fW+q2U3iIWfI6vTkXRrw8iMz32fh3ezBZ
	6Zn/HeRyb0nWyT2L6JlWl2axA0PKfq7vx1rJhj7d6HMIMlRX2s/0N
X-Received: by 2002:a05:6a21:3408:b0:3b1:80c7:5f8c with SMTP id adf61e73a8af0-3b328e9cc45mr4320437637.28.1779463100315;
        Fri, 22 May 2026 08:18:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:3408:b0:3b1:80c7:5f8c with SMTP id adf61e73a8af0-3b328e9cc45mr4320391637.28.1779463099679;
        Fri, 22 May 2026 08:18:19 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fe97c0sm2083042b3a.53.2026.05.22.08.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 08:18:19 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 22 May 2026 20:46:22 +0530
Subject: [PATCH v4 1/2] dt-bindings: cpufreq: Document Qualcomm Shikra SoC
 EPSS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-shikra-cpufreq-scaling-v4-1-f042a25896c5@oss.qualcomm.com>
References: <20260522-shikra-cpufreq-scaling-v4-0-f042a25896c5@oss.qualcomm.com>
In-Reply-To: <20260522-shikra-cpufreq-scaling-v4-0-f042a25896c5@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: k4WiRlsMX3fmnf-s1lCE8ZI3kBIwORTl
X-Authority-Analysis: v=2.4 cv=JrbBas4C c=1 sm=1 tr=0 ts=6a1073bd cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=sA6xLUNpRn-UYiqxgCcA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: k4WiRlsMX3fmnf-s1lCE8ZI3kBIwORTl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE1MSBTYWx0ZWRfX0wjj2mQYo+Q2
 r4/M5pSSH5tMX2qBghKTy+pV2DlXDLwXztw4A0UtRvAS9+GzFZwNsiMNQD0nDq4Dt4llNLIEl+V
 SH0xvrz4aOVLlKestayhDG/QbyZRivv8O5xdnWtGLdBiios+7pGBzkwtYLqz6KXsOxSROnhAv0M
 ix5ExAlxzuNJTUlsZr24clekughgjy9eVpJODXLxJa/tG/idMwZ9kdCaa64oaxIl7h2rAIPefcD
 ePbQDks67qGgArkZxlL3BNcZwcthcyWak7EamswaWhL2Melr1nruXMnTeA+MDPtcUIlB7XLem0k
 jILSBGfvC1vP0UaagOc2df9X5jGZ8qi+Y/L4phcbcjN2y84iKOz/nyl3VJfuPHyxRKzrhhEdZK4
 G+cz4wC+wXYdKIAIOqtMnwtdoWH8aPmBFagAXFr4PiOnhhRm499jXpdgMJKsq8IvL6AwbXeVawH
 nvGHZWkzT8XflXVEfGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220151
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-109356-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 32DF25B6C70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Qualcomm Shikra cpufreq hardware is functionally identical to EPSS,
but supports only up to 12 frequency lookup table (LUT) entries. Introduce
Shikra specific bindings to represent this constrained EPSS variant.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 .../bindings/cpufreq/qcom,shikra-epss.yaml         | 96 ++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/qcom,shikra-epss.yaml b/Documentation/devicetree/bindings/cpufreq/qcom,shikra-epss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..1a3105e86980a14069f8fb40c92d1f9cc71c6c1c
--- /dev/null
+++ b/Documentation/devicetree/bindings/cpufreq/qcom,shikra-epss.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/cpufreq/qcom,shikra-epss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Shikra SoC EPSS
+
+maintainers:
+  - Imran Shaik <imran.shaik@oss.qualcomm.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  EPSS is a hardware engine used by some Qualcomm SoCs to manage
+  frequency in hardware. It is capable of controlling frequency for
+  multiple clusters.
+
+  The Qualcomm Shikra SoC EPSS supports up to 12 frequency lookup table
+  (LUT) entries.
+
+properties:
+  compatible:
+    enum:
+      - qcom,shikra-epss
+
+  reg:
+    items:
+      - description: Frequency domain 0 register region
+      - description: Frequency domain 1 register region
+
+  reg-names:
+    items:
+      - const: freq-domain0
+      - const: freq-domain1
+
+  clocks:
+    items:
+      - description: XO Clock
+      - description: GPLL0 Clock
+
+  clock-names:
+    items:
+      - const: xo
+      - const: alternate
+
+  interrupts:
+    items:
+      - description: IRQ line for DCVSH 0
+      - description: IRQ line for DCVSH 1
+
+  interrupt-names:
+    items:
+      - const: dcvsh-irq-0
+      - const: dcvsh-irq-1
+
+  '#freq-domain-cells':
+    const: 1
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - '#freq-domain-cells'
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      cpufreq@fd91000 {
+        compatible = "qcom,shikra-epss";
+        reg = <0x0fd91000 0x1000>, <0x0fd92000 0x1000>;
+        reg-names = "freq-domain0", "freq-domain1";
+        clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&gpll0>;
+        clock-names = "xo", "alternate";
+        interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "dcvsh-irq-0", "dcvsh-irq-1";
+        #freq-domain-cells = <1>;
+        #clock-cells = <1>;
+      };
+    };
+...

-- 
2.34.1


