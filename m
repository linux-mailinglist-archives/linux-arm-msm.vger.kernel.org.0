Return-Path: <linux-arm-msm+bounces-108460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0I6jKlREDGrQcQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:07:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E0957D2FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:06:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 337A830548A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54883F1AD7;
	Tue, 19 May 2026 10:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QRcfLm5m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C6ybGc8a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29478352038
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187824; cv=none; b=E7yb4TaUvMD3EKye0Nbe6Voy3mZnxVh3qzUsrB6t9PRo1IRUCqObHlNHPzpAy0QkZooG93n4i/4LVsF7YctyzS5aQ8fh8AioIkEI58gqJEpd5VOukp+RSjBdA47md0AuQBnyMyclIToTahXB6DEN7vHtis80svterzyrXkophik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187824; c=relaxed/simple;
	bh=ez6BI+iFIWBZJ4OKYJs5blAxXM0YWETGmKLMOIskNuM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HRa532lPXFAxnxBgwUOPYrseResjXBxeqyt/TbGs6hg5fc16yVtBFyj9t41I/YR1CVpmHOHA33X3rPt/h2WrVrhdOXvuXLS/JcYD1I8BHmZenFne+m170aQkZneotktPUvR+B3BVLzt9g230EI9y2JRe4Fr+u6ComOTSsuxLris=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QRcfLm5m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C6ybGc8a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J8ENd53612521
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yMu3pwwfQeds9RjA4hYk8iB+KBRpIN6EKL+u9mQS2mo=; b=QRcfLm5mmSr/ulxn
	bVyrHujCPYH4W47x5WLyl+CGwvoXpze1FP6R/kIbWfwQJYAE9PRp4xgYD74YiTdq
	xfI2ddDB0EYtNjQHojnjolO8bNy/U0GK17vReG0hGXW6FVeenSiSSgfQO8dvVaDW
	1/P3coiT1WySPd3P+d/XxFy0jO8whThz2Wf7lYl+b4bXlYe2da/ya09GPyCorlmu
	lGPlLqHTn9oLFU8II4YJjiS2EJcGDH0FSwanUOWEJ1rZs5om8GDT1yDLVVtT9p69
	t+cBswWv908YxXGlrI/BZ4gGgAJkF7L15WX4VLwLtvYdraifYD9UMVQV+csaEaFj
	/Dx8BQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8m64rnfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:50:21 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f6e6a3a76so4864287b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 03:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779187821; x=1779792621; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yMu3pwwfQeds9RjA4hYk8iB+KBRpIN6EKL+u9mQS2mo=;
        b=C6ybGc8adLJsJOBUPW/O6fZB9JWxkiKmSihJfNKnCrp18o6mwJk7NmbaeiYqNh0x4X
         siLaX7x7DGguCGTmIZ1FBV0h2kgx++XGygP7oeJxeCQ7QNGYczRrUAiwaW7qvDl7rG04
         zLne3giPUYl5zNsRmRytCqbSeCuIGpERPkW6dQkiJCuVMC0oynnP+UwMK12r3M0VtN2S
         K+wK18inNyajGVKy4eDtK7ehUN0Sxtjzo5ZgTaCq2Bh3XjMpBBXGNPuYmC73y6/byajc
         hQQ0wFl46geeBh2Z3nY0Ss1bd9HKuIEeioRRoZ45F2luxzgPz9fZIE3HVP86SvAu9wU3
         tkew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779187821; x=1779792621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yMu3pwwfQeds9RjA4hYk8iB+KBRpIN6EKL+u9mQS2mo=;
        b=gihld4o2Z7ZZTEPTPw5Dc+kIizfzlodiEPpQ8vFIs+/G/Dqj2qDHAjnGIsY0gFqAx9
         kWnBpB5lFe+tJS8ZyqN+KQHvfBQ6EvkZ7ThYoWI+zS7TzPTAmqNcgSpFXcQOEdY+7QXM
         +FBlhBzaGIfPHiLsY4rYWhkDtzPuYRN3viJQnnnqvXM3gV4p70Pf1R1TloXSWU4x+pDK
         WOUeonR1UbRDTZxwQzWiNRjCP8lEXuFjbuOHeXoicZ3U1VSSwG7MbFhAVzQCxURBOcKJ
         y6R/CYSOIbborH+tDcIwJ20O2KllvDOaKLbGhTujqL4AosaKXFUBaGAVZIgckAncr4TM
         3wsQ==
X-Gm-Message-State: AOJu0YwcR9gBpN+XCDcdgohBhIKFn9y4awY2/ClKPRNCPybRApD+MBYH
	HHySEYjiiZHoAGUJFPYK4mBuKskGab3PK47VRUOs6lIyb02O7XM7CcNXiELrqHxy1USDHJS+4x0
	cYyvcaGqHcIdMIDwrkcwT5UnLpOeAdWuCbUL9CdwcJsV5v73Hvk/3Q/3/BvnyK5K9G3RC
X-Gm-Gg: Acq92OHS7UGWnkygSqDMno3zY2HmnL/0fTiQ2E0Cqo591HrcQudOEIIF0d24ZhC27OO
	7+JBTCc1Pxn2pC2Y6z7oZdkKL4K45TX87Ob8yV3fqysXSBcEAxPF/UVocL3yT93ihYw/foyd8DM
	IkynFsgetK8Plka7I3tJHeyyQG5Zmu9w0mQzC9fIKyYlwkrbhL/e1MjavKzUUyLa5xyLQsYGS1l
	bAq9fyojOEmD6AqQs3M6M1VZR1P69+GsRYv8ZIJSdlVWzOhwAXCZVibjQawIpaLRiRs6pl+kJFr
	jaTOglL5ziIZ6G7qb+9lLn5U7rmQVqkfBBwuCtMvMF6TNHPROoNA+DB3sCwvYkhq5iY4Esc2wFN
	aAN5XudV5sKm3sKyLtVuUrEmKmBVeEmglznXwQU8jSMguIaiFdRfFYv8z
X-Received: by 2002:a05:6a00:4b53:b0:82c:247b:ffdc with SMTP id d2e1a72fcca58-83f33c359b3mr18235915b3a.29.1779187820883;
        Tue, 19 May 2026 03:50:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b53:b0:82c:247b:ffdc with SMTP id d2e1a72fcca58-83f33c359b3mr18235880b3a.29.1779187820298;
        Tue, 19 May 2026 03:50:20 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19fa869esm20877879b3a.61.2026.05.19.03.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:50:19 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 19 May 2026 16:19:49 +0530
Subject: [PATCH 1/3] dt-bindings: power: limits: Describe Qualcomm SPEL
 hardware
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-qcom_spel_driver_upstream-v1-1-75356d1b7f94@oss.qualcomm.com>
References: <20260519-qcom_spel_driver_upstream-v1-0-75356d1b7f94@oss.qualcomm.com>
In-Reply-To: <20260519-qcom_spel_driver_upstream-v1-0-75356d1b7f94@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779187810; l=2537;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=ez6BI+iFIWBZJ4OKYJs5blAxXM0YWETGmKLMOIskNuM=;
 b=+d7gNedQsIlsHf9gc6Uv0waPlUJuobTPnNYs0y84owz2NwRH3/+Xhpd43TiRCGNwDLp4vPJAt
 CVdutJ8/8qnAkWS6mCmHA7QjndpPgrf+elpfD71Va3b0tnoZbGEEaAX
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwNiBTYWx0ZWRfX0fIJhlFHBjxf
 keXjVkiC2jQyCr17ZX4pVTu7OICkbtqPJ5IdvmNMAEj+VZPWDPY0YvJsrC7fqJup0KIC4S4kQrF
 PiOsM2CNXop2vBp1YtTCBeiQvXCrCWqiymwa5Y6GWufngNYyJb6buQKpNJb3LnHFmQ/0gVQ3EFH
 GizH/HdEWLfDvYKN0k2CbRlVJVOa8mhRdjcBKkmjbrMby9N3q5fLUmq+ur84soPlK+bnCetmpRn
 iilzIttRTby8ecrS18IPfsVEC0M6pgBfDaycM16zgrKFVnIfCX2zLKBhL+yAjeJIFLfMcVuuqEB
 GoRd368ZNPoAi1e65gVyAhDzY9D3U6JLAWTuevio2mp2z2X241DLNSWPBRi+C9/JVoAOJTxH1vX
 Byo1xaIkc/ngaXlNHE0uKNxxa3UaWwxelvAwGEfeh03TqU7p017Mc5f4//gB+TWCTexBnWdOD+p
 JGK2Gl2p6NbGQXwHukg==
X-Proofpoint-GUID: Wcls9AE7mDD9-5Ky8BE-cRGsY3m-4UCq
X-Proofpoint-ORIG-GUID: Wcls9AE7mDD9-5Ky8BE-cRGsY3m-4UCq
X-Authority-Analysis: v=2.4 cv=J8aaKgnS c=1 sm=1 tr=0 ts=6a0c406d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=MtUMKvMtarDq8PFyUT8A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190106
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108460-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,devicetree.org:url];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A5E0957D2FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
based power monitoring and limiting capabilities for various domains.

Add a DeviceTree binding to describe the SPEL block on Qualcomm's SoC.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 .../bindings/power/limits/qcom,spel.yaml           | 47 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 +++
 2 files changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/limits/qcom,spel.yaml b/Documentation/devicetree/bindings/power/limits/qcom,spel.yaml
new file mode 100644
index 000000000000..e9bb70c3a3aa
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/limits/qcom,spel.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/limits/qcom,spel.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SoC Power and Electrical Limits (SPEL)
+
+maintainers:
+  - Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
+
+description:
+  The Qualcomm SPEL (SoC Power and Electrical Limits) provides hardware-based
+  power monitoring and limiting capabilities for various power domains in
+  Qualcomm SoCs.
+
+properties:
+  compatible:
+    const: qcom,spel
+
+  reg:
+    maxItems: 3
+
+  reg-names:
+    items:
+      - const: nodes
+      - const: constraints
+      - const: config
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    power-controller@ef3b000 {
+        compatible = "qcom,spel";
+        reg = <0x0ef3e000 0x1000>,
+              <0x0ef3d000 0x1000>,
+              <0x0ef3b000 0x1000>;
+        reg-names = "nodes",
+                    "constraints",
+                    "config";
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 3dd58a16f06a..c63f147e8c54 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22233,6 +22233,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml
 F:	drivers/power/supply/qcom_smbx.c
 
+QUALCOMM SPEL POWERCAP DRIVER
+M:	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/power/limits/qcom,spel.yaml
+
 QUALCOMM PPE DRIVER
 M:	Luo Jie <quic_luoj@quicinc.com>
 L:	netdev@vger.kernel.org

-- 
2.43.0


