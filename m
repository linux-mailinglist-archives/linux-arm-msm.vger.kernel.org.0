Return-Path: <linux-arm-msm+bounces-109111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFsqCjkgD2pSGAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 17:09:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CC75A7FB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 17:09:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79BD131C79D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AFBB3DB301;
	Thu, 21 May 2026 14:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dxUxF6tJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gwfEtq/D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B5B3D75B5
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 14:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779372389; cv=none; b=sY5oKX0dIqqqSuvwApqlMA+D5As48HUViPGxqyM0fNl70vzUG2GB+VEHDb4l81AnBlQ9Qe9Zh7MotJbzPGLKcORzwE6mda9CKD1/+XbkVnLANOi02fIN7ZOtYT4F1nCnXIPE5T//jfcnltKlkXZiSxskE7Z6kMX0b6NX57UilMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779372389; c=relaxed/simple;
	bh=q6/uXjQ/XPAer0/bzSYSlACp4MPDCgjTYubdTYSseks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NnlZqyMPGYcAJcce5qA2BBy77a5ahdTNyKRXc99nMBBJ8NqB+Ym6FztFTTToa3NDzbrW9h0s1gnbPF2cgTJzWu+YAolVwjUOMGIPWT5lrI6x2cX8wKbVIE6+W4f2GnkaJZy3+wxoZQrcs5jDqsTste1zuk9an40b49Sz2dniJeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dxUxF6tJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gwfEtq/D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99lKd3451365
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 14:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+LbFZlJpygkKRNnq4cZd2WgvzDUunEa6SjSNWENQD28=; b=dxUxF6tJiF4JOU0F
	C7K+Xg92czk1OTWjaITjIKcP2mI1FvyXbL7DOXxhtNz1x6gFYT+5CX8UENdNOr+F
	KfE5H5CJrdyYurZ1AdDd5c2LK0mkI9Mfk10A68SmfRKJPt1E1bLTwXa6l7MdUIq+
	qW69NM4BVAAok4Da6cimmDObxHKIExvkFb7Tl5x1DJrRXqXF7ETkL2KLBW/Ru5Wt
	M1EHZ1sd/f1zVPXT+rggvCkewDUZWzoeTENcCDliPtoXQCcGcynaQ2awve8VTW5f
	+ohmEu6zeAaMutYOf6bag6iIGJjYH1ZhwgYzuraOBe9H9FcxXga6fAAUbiwY77nJ
	7Xny5g==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9y1h96ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 14:06:26 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7c0dea734a8so61270527b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 07:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779372386; x=1779977186; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+LbFZlJpygkKRNnq4cZd2WgvzDUunEa6SjSNWENQD28=;
        b=gwfEtq/DHKZXDo6gizZZG/H95lF4XeVikttCVSdo3ZxCRbakk6OSsHwBtdFZSQ47kQ
         sVuOmT79iChK79TSNXtEAJ5GPkcKb6RfZgUVA7NxGq4m8PkGOPTt+U6g1e3yme91LLZ/
         ABo8CRoPc4VjqFA1UzbPlrrb/7IgFD8NE4o1i04SvGCmMZlCf/q4XE8Vj3Os5ehkI+Et
         q57aWozVExCf6e7F9Nkn1Tx6j8chIc5OhMuyjKNDgrIoXUOJKxS7TAaMdngyKmovz5r1
         JlasGNeKB5Y6OITsivrDCAASLL2vO0I8cKRyFspm/PyeHWZVnS57OvYDpp9Is9djC6Kh
         DmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779372386; x=1779977186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+LbFZlJpygkKRNnq4cZd2WgvzDUunEa6SjSNWENQD28=;
        b=I7+YWxl4EiMYZ/85BLIg3kLhAwrHaEFjDvRA2cqekNaSw8MErD7nFw3j3YukhQytCu
         VnwQiw7sdZih7h6/Hv0m6CY+2dVqpgc7UeWLVaB2KD+R+/lTAQHtC8/jqcg+YHASXPJd
         AA0DEN32CHF3+U01VYDJE4In6dtUH3hV+xiqp2ELT+wvbgG98zSnIzAIGJkhny0CW9XC
         sVRCJHESUpGfYwTmDl6othRxaj6Si5N7I0MPIj6WdEOZTze2rJyyAgfKiHFAV+T9A5og
         za+riRrX8M6hEvnKK2wotTemJ+DVNieC2TRXuo9Dj6bZTvgzzneMp4AGBEasMoDX41gv
         xtrA==
X-Forwarded-Encrypted: i=1; AFNElJ/nf34iL8VjkEfcW4YOb8BBbr/xuT8DF2YK1YyXz6GTSDcl1vj+NcKCnVeA2xIrWEVOBJx8US7CHfknMA84@vger.kernel.org
X-Gm-Message-State: AOJu0YwTyFSwHmhX1CqcWfvd0h4beXaTlcFCE5TGTdw5hS18mKQrTmZ9
	2oIVFuhbZvWns+xEfq9TaFFLv0GJ2oZ8l/iMsLFGyU4SWX8n2RptRpcl2rYNwjxZ/oG6EN6lrgh
	C4aPxKYhvC5bWySkjC3iBNRGpNUsBC/T6BXzKFLbhHxMj6pEHRTD71Q4U/1SRskLaLbSS
X-Gm-Gg: Acq92OH4Zn+NtaQfu7a8a+ChmuY+Xvj/kRza5+0+ftYD9Ex3CGfJV4fqrjNV+ZWvcoe
	4eQaKP4uCfarUGwAQpUA/2Iivgt7e+yRsJSd4Q1eIONXGu9LjBHyle0mw5xusOTZ0OYB9mfodOU
	dnCYgXH0jTtAzzmSaGXtbi7weq4xYM+NdEdzTpCosKXeRxx+M4zSQcKgRAvTwwenei8qAq3rYhH
	Tume6MnjOA2Xcgh83bMQ2xxJomdXTeTrK3GV5gsFhBB/zIYZw99Rz0PQYf/nlmMQ0euMoJEcEYY
	IxOUpnZyV8Q8QywZzEGML6/ycDsv1D/z0qpk0i3GP18o2THfn2XwpxBjvjHSnpZL4bYMZGSqNPK
	kJ5dM7hQSjfnfw6RmyU8u2dHFf9aPg63V5oJO33HggBNgykocWszt
X-Received: by 2002:a05:690c:c4f5:b0:79a:5fb9:62ad with SMTP id 00721157ae682-7d20d604f21mr29085267b3.43.1779372385971;
        Thu, 21 May 2026 07:06:25 -0700 (PDT)
X-Received: by 2002:a05:690c:c4f5:b0:79a:5fb9:62ad with SMTP id 00721157ae682-7d20d604f21mr29084577b3.43.1779372385356;
        Thu, 21 May 2026 07:06:25 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d2cab7a5f9sm2920677b3.39.2026.05.21.07.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:06:24 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 21 May 2026 19:36:04 +0530
Subject: [PATCH v3 1/2] dt-bindings: cpufreq: qcom-hw: Document Shikra
 CPUFREQ Hardware
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-shikra-cpufreq-scaling-v3-1-883c13d1e514@oss.qualcomm.com>
References: <20260521-shikra-cpufreq-scaling-v3-0-883c13d1e514@oss.qualcomm.com>
In-Reply-To: <20260521-shikra-cpufreq-scaling-v3-0-883c13d1e514@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: kv1wNvjPXi44ejHwztTZxzCgl1shSXUo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDE0MiBTYWx0ZWRfX7Nitec47VvU/
 +Tk1fyqOoIS/2PDXLs/LBj03cQJ/xGI+SzM+YOZuZF1mt8msoJvwfoxJN4XT/OwBglevEG44MF5
 sL2p3nGWCXmnP64TntvxI4UfSwFJdP5iw0UPx7ApQlS0I2gdu1vBLTEDq7T5TS+fnRfNzpNBkaL
 CYQjwxFjnaT7g4ynczXyVirdvo5fdRwB5zmj1fM4Mgf/GNC4cyDvmetOKvzcnQ7WTfKd1PW+UrE
 b1ctF2jyGU9OtFPLg8XNA+KvGHynz7UdlRSny38endQxYZKNk9Qd/gpnxlpAjEU4HfwnkkDazO8
 w4xIZQ17TE0fch7gYjaShp7iigObsdmfN7eHMILY3f6FVZTsU6oY0zRXQX+Mfm+uuT5Atz0rg0H
 WjO5xu9IXpEwXYFDmDYTV33ymbhH8nAvcW2RaYjZMEZpAKSMx0gtyF2god6HAEYztE3+GseR3s7
 lJnjDM50Deqhwq+nXSg==
X-Authority-Analysis: v=2.4 cv=YfyNIQRf c=1 sm=1 tr=0 ts=6a0f1162 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=sA6xLUNpRn-UYiqxgCcA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: kv1wNvjPXi44ejHwztTZxzCgl1shSXUo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210142
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-109111-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,devicetree.org:url,fd91000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 76CC75A7FB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Qualcomm Shikra cpufreq hardware is functionally identical to EPSS,
but supports only up to 12 frequency lookup table (LUT) entries. Introduce
Shikra specific bindings to represent this constrained EPSS variant.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 .../bindings/cpufreq/qcom,shikra-epss.yaml         | 96 ++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/qcom,shikra-epss.yaml b/Documentation/devicetree/bindings/cpufreq/qcom,shikra-epss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..8543fd00d82acdbb3422bde462417118aa4c49d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/cpufreq/qcom,shikra-epss.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/cpufreq/qcom,shikra-epss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CPUFREQ HW for Qualcomm Shikra SoC
+
+maintainers:
+  - Imran Shaik <imran.shaik@oss.qualcomm.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
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


