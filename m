Return-Path: <linux-arm-msm+bounces-108581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPC2AM2eDGq8jwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 19:33:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 436A65831E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 19:32:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 814D1305208E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DCCF3DB32F;
	Tue, 19 May 2026 17:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iDJ0dUKs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZP/0MV/G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AE43233E8
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 17:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779211698; cv=none; b=d9Z+/mAx7CjX/2PlwUTy8lNR0DbXVDkga8j52NNt51He6WHO1xzw3xTquiIeES6sXw8+ZlOcvz4wh2Ayb93owOIl6dR6e9HR/367gMa/0A0JmqPHqQbDQ70vYzIdJpy1bYTFYACgH7/tnydGE1C7vLcEHAZBLK0bDHjD8ay3VCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779211698; c=relaxed/simple;
	bh=o0KGTNNognzm5ueJpddSZYPS0o0uoX45XbV+lvhn5c0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NTR7NRrEH5ygbPnbS/4bnLH4ZTKThSClT6iYXO6gYt2ih+/YjEOcZ+EW8CZbS3+gDuaLdTh3xxMyiTnQk6YdAfIWY0gjs+VSif5wXFVVBWMu0hmHeyOzISFGgnsdgRluJ0JQnvVropFpNpMzxtclC8/dH78NrYZ8V0sXpOn8YwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iDJ0dUKs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZP/0MV/G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JExMSV1237958
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 17:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	drUWtwA83/EEbEXu3aLtZJgaN28Otw3wIriIN70eSI0=; b=iDJ0dUKsPqaJ5IpL
	FB65N+jBTu9iD7D79LQGOFsW2WmU6BruZQbr3VNhXHMfQqbJnZ/2iXN7CWV6e+7k
	3vR1LPCiNJYHeO4aR3rO4+AsexdDM1EvEhksAvL82qYnSj0YdQsX3G23k5NyFaKP
	nnGEB6B/JKKcrEL6JeuqWD2Hfjv9IKIj0FTdJf6LncQ/HVAPq+ziKo5S2QArK625
	KSoLmPMFcmS/XPizlM1wazeTcaLkCPvabhU61F/cMPWQzJLBvA9Xax2IwSYa7/yQ
	Qu0N45UAW/P/baFkfOuwOyL90GCXZ3bB2pylt2iIbqv2SxKM2E/G0sV4giNHmSL4
	r4BhuQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3srpce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 17:28:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2babc42244aso94334605ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779211695; x=1779816495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=drUWtwA83/EEbEXu3aLtZJgaN28Otw3wIriIN70eSI0=;
        b=ZP/0MV/Gw9iK+XlBW/tBUc3ubhaNJUw68vxM9NT1UsZeFBNOLsGtsuGYR6M66FFOr2
         Q51W9Has2oie2FUKKCdJQOEL1d5/cWPAG+1vFUqRPcXugGWuVoJDpnZ1HJpv8Nwmig08
         1mxssOJvpXtAhuHmlIVivGnjd6rAtUC19TT6DpVF8liemk2b4u4dXNX5KHk6ILKHs4+5
         SuMkgwlqeYEYy4Y2W2BNGin/9K5aErGtUy71dG/Gv89UPGnvQ/4YbJnxziZi19M8mR6g
         uR72KAW+3/q/z8PPsHsO4mQUPRxmAAqaXGwLyR5gePV14Y6l8nlM7XBgLaW92ahL5Ua1
         p05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779211695; x=1779816495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=drUWtwA83/EEbEXu3aLtZJgaN28Otw3wIriIN70eSI0=;
        b=Pv/5R1jdx7hcRQPQiI21IK+xcGG8CGOm/ki3ZNZIvAtmGsfpwpD0hZ3gI1WHwbydtU
         6ViVnHnWQD2Rxqo1zUCfBhCPB3myoGDKZaJJjUv4pKpCx5XsEpAw1O/rTo5MIXyVuAFW
         KAazcp6G6MwNeKPvzj696/zmAI5pC8fCYmCqfkKtFNXm2MYSsV7W8ZKtzO2mpgRkO8iE
         6K9DRIwX64ti7U8DYyBjhSD43Q9gmWgYNyhSzK8ntoZ4q+t1FvQhTKWdBSehUoQTz/tB
         idk0EPvw+M8+V1sEajkfj/okgVoTCfGVAJesK/TbIBeSdIC/wAwdHEufRzBwMmYMtqsC
         n27w==
X-Forwarded-Encrypted: i=1; AFNElJ9RQWWgGPVuPNz5FAIxPPX6+1j414v+PTO3FBiOMb6ksm/YC1utU0Bis7x+YKagal+kEaQ2MIWKCduLYCyF@vger.kernel.org
X-Gm-Message-State: AOJu0YyY1R8EzN0ccbfz64th/JJaM7fvF4J+rhW+PKeaVRQii7ceDc4N
	6Q/8IjTZdxlFg/KmVglsyf2MCItKgW7v8DXxTwTCmTh7JwrXMpby6SX3hajhTZhk7nZGSRK3awq
	2a88yibsfQV/06ugx+d4V0Yfgut4H/V8MOfT5tTPivlFId7oxOgnD1xGEikwqdRBEw3ieN7VfBW
	1+
X-Gm-Gg: Acq92OF1bnNcYlXXvpKILj+PcxyU42nSII9qU++fzFfik+9SLCzGkgZIwrmoVukgkGz
	wiz8L9GXPLk/ACsJXsFDcPu7w+RYuHBlhEoUic7N5Q8pwYKvuru8H1bMdPe13L4WjJ23KPMTI18
	Tn4idlKo21Fa/7UpK1wKuf2qzfAlY+ds2v+JIVP2jrzgdGGxpwr9Cf9gOnIIrDjULRw64SmnOny
	2LFMEQorB3BlM+Q1oFoNJKmazHqY/0WBwLzOUl7hYMK68qXNe/uLe+P4sySZ8F4zj9OErz/mCgn
	w0/n5xBVtcAfBzJ2mTaeDmoUcAZZTj8Bsd+lF6RAV06xs+efBZchgevc2IP5Y4GNQSkufoYl6fs
	koXHhWHZ5lsa6gxCHKe3nancJrwTXHnqJGf93PaZSzU8bcq1MK3aH
X-Received: by 2002:a17:902:f64c:b0:2ba:fed:7891 with SMTP id d9443c01a7336-2bd7e92c24amr235115425ad.30.1779211695270;
        Tue, 19 May 2026 10:28:15 -0700 (PDT)
X-Received: by 2002:a17:902:f64c:b0:2ba:fed:7891 with SMTP id d9443c01a7336-2bd7e92c24amr235114905ad.30.1779211694780;
        Tue, 19 May 2026 10:28:14 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d125159sm182248365ad.76.2026.05.19.10.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 10:28:14 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Tue, 19 May 2026 22:58:03 +0530
Subject: [PATCH v2 1/2] dt-bindings: cpufreq: qcom-hw: Document Shikra
 CPUFREQ Hardware
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-shikra-cpufreq-scaling-v2-1-2b09f0e1c9d8@oss.qualcomm.com>
References: <20260519-shikra-cpufreq-scaling-v2-0-2b09f0e1c9d8@oss.qualcomm.com>
In-Reply-To: <20260519-shikra-cpufreq-scaling-v2-0-2b09f0e1c9d8@oss.qualcomm.com>
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
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: h6cJB7JoyUqhb8uqU6guc_eKxKtgJUX8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE3NCBTYWx0ZWRfX+wtj3hZusoZi
 ptPW3ZlUsSaj8sjeWVa5Tz3L/fmQYFzNtiCx8Gvpq+F6EbQZewx/ygH3duf7tcTQOTaokhf3QFY
 56qrzTnn82ygwMFjVfioANiKYQZwxmzK3Q3nQP1wKKQ/RGmQ5H54w/wFTNCZKc0Sg9MhXm5Hz+B
 bzy31/COh+Dl12gw/Utidx/8BlO52lb6hqbKEbZG5KHRIvscan7CuJgE+vcHJg1N/nOeAy7NPyt
 nf5a0pqPBNW3S2WEQwwvSq17f83y9nw9HSNCt+DDokEbFgG+E7otR0kCNNRNELVDYL2TgDwP6eS
 nTXjNQI2CacAEheavYGnQoXMwe5zfBRKoNxBTK5mWoedB5ZMQHuQecJI89C9ckvtw8qU1Si4Fc9
 BD5N3Ujn+XmF/ihFB4DovuNWKuTgZ6q19UmqV6WWzte+YT61FP6yMJYeLGLGraAcSGZ++L9O02p
 Rgle3tnyW+mC2fyIKrQ==
X-Proofpoint-ORIG-GUID: h6cJB7JoyUqhb8uqU6guc_eKxKtgJUX8
X-Authority-Analysis: v=2.4 cv=SNhykuvH c=1 sm=1 tr=0 ts=6a0c9db0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=sA6xLUNpRn-UYiqxgCcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190174
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108581-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.0:email,qualcomm.com:email,qualcomm.com:dkim,0.0.1.44:email,fd91000:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.100:email,devicetree.org:url,0.0.0.200:email];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 436A65831E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Qualcomm Shikra cpufreq hardware is functionally identical to EPSS,
but supports only up to 12 frequency lookup table (LUT) entries. Introduce
Shikra specific bindings to represent this constrained EPSS variant.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 .../bindings/cpufreq/shikra-cpufreq-qcom-hw.yaml   | 133 +++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/shikra-cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/shikra-cpufreq-qcom-hw.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..52079ed661671554fcca8677409ee11199f5727b
--- /dev/null
+++ b/Documentation/devicetree/bindings/cpufreq/shikra-cpufreq-qcom-hw.yaml
@@ -0,0 +1,133 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/cpufreq/shikra-cpufreq-qcom-hw.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CPUFREQ HW for Qualcomm Shikra SoC
+
+maintainers:
+  - Imran Shaik <imran.shaik@oss.qualcomm.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+
+  CPUFREQ HW is a hardware engine used by some Qualcomm SoCs to manage
+  frequency in hardware. It is capable of controlling frequency for
+  multiple clusters.
+
+  The Qualcomm Shikra CPUFREQ HW supports up to 12 frequency lookup table
+  (LUT) entries.
+
+properties:
+  compatible:
+    enum:
+      - qcom,shikra-cpufreq-epss
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
+  - '#freq-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+
+      cpus {
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        cpu0: cpu@0 {
+          device_type = "cpu";
+          compatible = "arm,cortex-a55";
+          reg = <0x0 0x0>;
+          enable-method = "psci";
+          qcom,freq-domain = <&cpufreq_hw 0>;
+          clocks = <&cpufreq_hw 0>;
+        };
+
+        cpu1: cpu@100 {
+          device_type = "cpu";
+          compatible = "arm,cortex-a55";
+          reg = <0x0 0x100>;
+          enable-method = "psci";
+          qcom,freq-domain = <&cpufreq_hw 0>;
+          clocks = <&cpufreq_hw 0>;
+        };
+
+        cpu2: cpu@200 {
+          device_type = "cpu";
+          compatible = "arm,cortex-a55";
+          reg = <0x0 0x200>;
+          enable-method = "psci";
+          qcom,freq-domain = <&cpufreq_hw 0>;
+          clocks = <&cpufreq_hw 0>;
+        };
+
+        cpu3: cpu@300 {
+          device_type = "cpu";
+          compatible = "arm,cortex-a78c";
+          reg = <0x0 0x300>;
+          enable-method = "psci";
+          qcom,freq-domain = <&cpufreq_hw 1>;
+          clocks = <&cpufreq_hw 1>;
+        };
+      };
+
+    soc {
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      cpufreq@fd91000 {
+        compatible = "qcom,shikra-cpufreq-epss";
+        reg = <0x0fd91000 0x1000>, <0x0fd92000 0x1000>;
+        reg-names = "freq-domain0", "freq-domain1";
+
+        clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&gpll0>;
+        clock-names = "xo", "alternate";
+
+        #freq-domain-cells = <1>;
+        #clock-cells = <1>;
+      };
+    };
+...

-- 
2.34.1


