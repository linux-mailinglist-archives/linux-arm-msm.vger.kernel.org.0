Return-Path: <linux-arm-msm+bounces-105204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBADJm8F8mnNmgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 15:19:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF478494B13
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 15:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D2C731062E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 13:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AE383FE345;
	Wed, 29 Apr 2026 13:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XnbW4eR9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SoOp0auG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7013F3FE342
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 13:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777468334; cv=none; b=hEUChWbpm6+g/1dSzFn6Y9Bv9xJQRfnawZLa6XWPmlExBZ4OZ2aYi/4pSdb02lu500N7StHXRuVBIP/q3wzDkmove837GtBCQXrSWwWSaGt7zJGT3LnM/6JVXHTeTJ6DVX6EWKdlquOn9B/kYBy4SamXiFEN2GRohJQ5aPFHFYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777468334; c=relaxed/simple;
	bh=5FeJwkn0w0hoFaU+H21wk2uMRmNaRakanqYwZuX9Z0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FnIM63nq+BdsmBZVJiNtGnNv/2mmynZo61XZBVjUTeYAwAMOO6Z46Z5S/iLY0wgD+AzT64dh9riwVIyJ7HPi9G1PchFeduKUvwlFIH1S0gBmL3O04vveCfzoXiiMVFlHT2xOQGQK/9JvtXhblpXokkKVYciPn5sKNbUr9I4Acx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XnbW4eR9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SoOp0auG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pv1J1728671
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 13:12:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TGkFDtlKiI2veKivqw5MXYpsgYHsHTZr/F0pOrS2oiE=; b=XnbW4eR9hu6wr+fe
	tuUGGpL30RjI7YIXVnBBO8gCaPnnk25pwLjpn++ktExQuXoe6sEdEmnuvDXrJDes
	/JqlqSlu7n0XuiCU0GDs9wZkVxvK2dvS9ApeIz3RPPjZe/UAf8jWwkLiy49ygtwc
	oHcB1hXrmfIYI9R/QVn5KLTrXnXw9+hkg6U6lJUtt+CytORtWNAPGZDhJXaoRwRo
	xq/qWi94ReW6Vf9WN3PsFqZT2dh1RtJhi94bP6ZlCZ4lDVqXGcibJxvbCVB583oO
	nis8Etx6bwV+ChTESz4UJPqkR9hIUh/6QI+yl0lysLcfB6fomK7ajuxvfOiUo36V
	Nyg8IA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4due5ks4rr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 13:12:12 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35da99b90f6so14856873a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 06:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777468331; x=1778073131; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGkFDtlKiI2veKivqw5MXYpsgYHsHTZr/F0pOrS2oiE=;
        b=SoOp0auGAZwej7lGyjw5AfMiCljTTdmzUgQqlL6go/gnUyVG52Y4N6Y+0tygDCurQU
         Ma56JuDfEA4I3hpRVJrjyyVUF1FngWZ7mpjXLoJL3MhihwM+FCpb5Vmte4WykC3JMO7K
         gaT1MLIeedw73irkgMcS3pXgn+ncJkt6PApqGCbu3RFDv1z9xz54uARO1C/a+ZcIEYc3
         1+W2IcbOp7vNPRYfJfwNJcR0JXfY0T/khybB+MMkN43t3PjmYVFH2AcQu3RVAgj4RJWH
         R7ExcKPS04CcKUzTWJYuN+oQF4h7BOdhQiNuGp4QJemTAvORwhFIooCXLArLebEelaQN
         iJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468331; x=1778073131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TGkFDtlKiI2veKivqw5MXYpsgYHsHTZr/F0pOrS2oiE=;
        b=BTXctRp7DIJCl8O5SUrpBDdrP2ByDZIyazS6MtYuQDV0tbf5ZP9fUTvPBnwS30jJ5H
         4WfCQQ5tiWtGbhTg/bq4J1lRDtCgdzOl8u8tkUs2tC5Iodvy6aleQLZWPe+CpS5vWE/i
         iB8ciM1QWA/M0ihdvq4kBvPpnsI7DzfEF/nhuwzIET8pe7vy/yQGjAdezWSsxp+TGNkA
         srI1GAuuXbHORGByj5KqhXihY3CkJUWCvp52N29jkwfo0kHQX4YdLU6WM9FealkfRJJm
         F5M2Ahqg5aHe661I1yMNLAzmLsi9j562FmrP8GoQAbmJU+IrxXbGjQKJNCJjq7+4n5ts
         19HQ==
X-Gm-Message-State: AOJu0YxIom+9BPYzjnWIWlixKIVtQXvhGJFmixoL2PZHkSV85IusPJ5N
	wMf4AXqVLYXgXK/Qwtbr5WK/ly/3hI2C21CznC19Fv23ExzdrQ4H+T35g8nseSPNRGrrzan8hlY
	ledoj8tRq1YIHWbkso8/mE+iHPmC1poqMvsWeNMUXrWDu8AKSjqLy5AMIXyUGXmT2si3t
X-Gm-Gg: AeBDieuW0W1dhYh3TsnnH2RsO39GX7SW7SZfsgxc3Eua8rx1JO9u+vhYsVYtU31qDYx
	qeEOYUtHTisQydFk72SvuS0S/jPlUz39U4tSU8yaCYdrDHVbJLAuN6xuTWMkTfYhO7Bk5YxncEZ
	JwwiMAETX6DdiZZm0UsjsDOiqV9WvBNarB4oBYru38mkrfmN+JmKO++baVgOHyRbanCJUYMFKqc
	D+3LhPHV2NECseKKJVY4BWZ+bfolpthP3Uf2dNWCVgCbv9llh6FEdW3t1NwcbR58QBjRJJb1kES
	Yq1l9AwG64fOZo0o0Nmcjbr8p5g4O3wa36d9VrxcxzUY2c23234ebm2jlLYLm4TnUECtiTyE8bn
	ujya2am5WbFpoWaMz+F+fpzEcEIhbqwKKC4Zq31PQ1t00bAI=
X-Received: by 2002:a05:6a21:33a7:b0:39b:dea7:5626 with SMTP id adf61e73a8af0-3a3af625869mr4368762637.35.1777468331250;
        Wed, 29 Apr 2026 06:12:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:33a7:b0:39b:dea7:5626 with SMTP id adf61e73a8af0-3a3af625869mr4368698637.35.1777468330599;
        Wed, 29 Apr 2026 06:12:10 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed6decf3sm2063025b3a.31.2026.04.29.06.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:12:10 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 18:41:56 +0530
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom: Document Shikra Top Level
 Mode Multiplexer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-shikra-pinctrl-v1-1-1b4bb2b3a8d6@oss.qualcomm.com>
References: <20260429-shikra-pinctrl-v1-0-1b4bb2b3a8d6@oss.qualcomm.com>
In-Reply-To: <20260429-shikra-pinctrl-v1-0-1b4bb2b3a8d6@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777468321; l=4446;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=5FeJwkn0w0hoFaU+H21wk2uMRmNaRakanqYwZuX9Z0c=;
 b=5jYkUxcG5qPe/fWWUGltzwDAgJLZr6glLKzLyJP+03Re8Cc4tJBsVZ9G9sEMEt6u+w9eaRTWw
 V+XLS/mm+G9AuFu3CCoI/hgR3eMkZjKVQcDn8YkI3I5xRZWPMyf3+Ol
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEzNCBTYWx0ZWRfXykoAwAFvG7Fc
 3t0//lDaHn65d6yqXBxId+Qpl4HfCh+NaAUGsvTZQEOhsE9N4GSXjE9nQeB/qHSLjaegQ9EqxbJ
 NrJuKjMLl+sTe/ZrODgtU4zolqoiek5fZmwvfDNXgO4zxYqDudy7O7za1VZFk8uFxioIrOFF84V
 R4MHv4aImP1I6LjeGaI9+CPLZ2Av+pC8GdqrOvci73TbPenScxNCphlBWyerkpEVIAtonh8O5BA
 rHcMvf/DGTj0ZHM2FszyDgFehMl8qCpKh/6vuMnl0EsB2tXQrjKo8IijY8XV6sZ/Nm3HECn3lpW
 V82E1zJvvuneDBSwihC+ldeh3IK3Ig6zY168BSfGCivEbe76p45LZ9fSqE1QBYZt6sjSMSD5UBi
 xHwmGlKqSfwxDwFpQQFKQpr1TzWwtgkpD6YOL8ZPaw086SpQgZVEJJQHysZp3x/F8AotdT0FTwI
 bo/LHo/7gmRgCPNbhQQ==
X-Proofpoint-GUID: YnAFOrUFU2V6LDC1qrPytFv2Aoy4ZfuL
X-Proofpoint-ORIG-GUID: YnAFOrUFU2V6LDC1qrPytFv2Aoy4ZfuL
X-Authority-Analysis: v=2.4 cv=CL4amxrD c=1 sm=1 tr=0 ts=69f203ac cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=bT5XQOCXPleopHcqzpYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290134
X-Rspamd-Queue-Id: BF478494B13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105204-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add a DeviceTree binding to describe the TLMM block on Qualcomm's
Shikra SoC.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,shikra-tlmm.yaml         | 123 +++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml
new file mode 100644
index 000000000000..896fbe461ef9
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,shikra-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Shikra TLMM block
+
+maintainers:
+  - Komal Bajaj <komal.bajaj@oss.qualcomm.com>
+
+description: |
+  Top Level Mode Multiplexer pin controller in Qualcomm Shikra SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,shikra-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 83
+
+  gpio-line-names:
+    maxItems: 165
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-shikra-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-shikra-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-shikra-tlmm-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          oneOf:
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-5][0-9]|16[0-5])$"
+            - enum: [ sdc1_rclk, sdc1_clk, sdc1_cmd, sdc1_data,
+                      sdc2_clk, sdc2_cmd, sdc2_data ]
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+        enum: [ gpio, agera_pll, atest_bbrx, atest_char, atest_gpsadc,
+                atest_tsens, atest_usb, cam_mclk, cci_async, cci_i2c0,
+                cci_i2c1, cci_timer, char_exec, cri_trng, dac_calib,
+                dbg_out_clk, ddr_bist, ddr_pxi, dmic, emac_dll, emac_mcg,
+                emac_phy, emac0_ptp_aux, emac0_ptp_pps, emac1_ptp_aux,
+                emac1_ptp_pps, ext_mclk, gcc_gp, gsm0_tx, i2s0, i2s1,
+                i2s2, i2s3, jitter_bist, m_voc, mdp_vsync_e, mdp_vsync_out0,
+                mdp_vsync_out1, mdp_vsync_p, mdp_vsync_s, mpm_pwr, mss_lte,
+                nav_gpio, pa_indicator_or, pbs_in, pbs_out, pcie0_clk_req_n,
+                phase_flag, pll, prng_rosc, pwm, qdss_cti, qup0_se0,
+                qup0_se1, qup0_se1_01, qup0_se1_23, qup0_se2, qup0_se3_01,
+                qup0_se3_23, qup0_se4_01, qup0_se4_23, qup0_se5, qup0_se6,
+                qup0_se7_01, qup0_se7_23, qup0_se8, qup0_se9, qup0_se9_01,
+                qup0_se9_23, rgmii, sd_write_protect, sdc_cdc, sdc_tb_trig,
+                ssbi_wtr, swr0_rx, swr0_tx, tgu_ch_trigout, tsc_async,
+                tsense_pwm, uim1, uim2, unused_adsp, unused_gsm1, usb0_phy_ps,
+                vfr, vsense_trigger_mirnat, wlan ]
+
+    required:
+      - pins
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    tlmm: pinctrl@500000 {
+        compatible = "qcom,shikra-tlmm";
+        reg = <0x00500000 0x800000>;
+
+        interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        gpio-ranges = <&tlmm 0 0 166>;
+
+        qup-uart0-default-state {
+            pins = "gpio0", "gpio1";
+            function = "qup0_se1";
+            drive-strength = <2>;
+            bias-disable;
+        };
+    };
+...

-- 
2.34.1


