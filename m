Return-Path: <linux-arm-msm+bounces-101339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDC9Jm0KzWnhZgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 14:07:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E972237A225
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 14:07:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4CAA83197711
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 11:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21969411603;
	Wed,  1 Apr 2026 11:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DArvxcAD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j0Y+hhre"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87DD421A0C
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 11:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775044341; cv=none; b=mb97lbqcWcWozDouCdilZR6CUPKA9etbe8bdCzyzrY7a3uPj58o16Rmr6MEUdJlF2JnFz1Z454H2ueLdxdYT16OWb+bZA+A67SxURHKPqU2xda7Afx1uXd/JhaoElUi1oPIdEoQx2NNfL9UCzIptyVLldFBJ1TBVkRJyjJim4DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775044341; c=relaxed/simple;
	bh=DN2hdJkQfwOmkV73g25P6amt7YJJMBYy4ixSvMZeed0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rPBPM8PruP+ujf6zP8f+OObX7hdhkS6nRJpnEN9Sew/plHsFADcGhFjf3bOt/UlNUcZpsyxIl7vyjEt7OpcgS2KY+2d44K6ke77nwwh/qj0bhs48PFZ4kDkSc9Mzi5/5cr0nMAzQjQ2qWR4MiWakZPS0f+0pUx4NQ0KGBlW0ONk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DArvxcAD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j0Y+hhre; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63171bjL1285860
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 11:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B1qj1pjFBSlaz4iTK542UNdUPrp5cuuyZd0VJJVSPDU=; b=DArvxcADu8+8+nZ0
	OQznhjZsM0ojhErJDfpf2hngq9yP0uHbMiuFL/Io3X8dzzPat90CYKpZqfHdFk/q
	ymeU3YP+KfJ33x2So4d2kvYht2TXh8BLW19wkxeoWRITu0ePcfcHmSLeA61yO38D
	1LYyoTQ9ib0J3W3uJ9For3UA+CYt0rX1Q6zl/PHlj+EsfRPMHaTspwAHybzWGN2y
	8/DiE5v0l9c5GTTOA7xIDvS47OJGmCxkQ1jYgN+r4+g0obKvPfeu8N6/EqeyWLlv
	AE9nWIUbQQHUJOyvlNS3zkRnt+GVZgaT8/vLRIWxaaMVJlOSZy5+BrahHuWkD4da
	8PePyg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xm3s2ek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 11:52:18 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82cf084fe58so293423b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 04:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775044337; x=1775649137; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B1qj1pjFBSlaz4iTK542UNdUPrp5cuuyZd0VJJVSPDU=;
        b=j0Y+hhref5kJG5rwROoDPYgZeL4TAdCFykuxCF21Xu71y+u5tjmS2nqS3dz7vVFuC4
         Nvn/bCEC/lzUhscs4QAD+sSRX0LnXStbku7he0ylWbhdBAxA7ppihTozyeeoeJDnGUh6
         85xpNMd/l4iSoy4qJ8f91XcKp4m6yaGGJv7XNz+qEctbdg1Ybc+BnkB5czL/It99RvO7
         /J7KmsTAN/UKqrXiJQ/rvVMHIvnkHu3FKLQJFzYV+kJ2cpVbsKcdGhJ18u9obEhmzcac
         8/bdoZ4wMkE6HRa9+uDptFU3hWhf9P3PxpM0aP4PiG5xFKdWbEXN0ApIvrRS2STrOyCS
         WwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775044337; x=1775649137;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B1qj1pjFBSlaz4iTK542UNdUPrp5cuuyZd0VJJVSPDU=;
        b=B0FC3s79acfd2MdAJ8l8PVr/rwHc8fyRDKttN+MuXjIS3jD0DZht0KsBm5RXgYFMmc
         dPK87XH2K3ePEiCACXWFS+345SMepkZZ3iK75fq2n+gZn7L4Epi1cwu7HgN2OmlGq+jj
         6urKvcaMcK85Tx0HFjyYp2cFkFQBChzMVlWy0V9Voam0FSUCbZAUo0DceK0gQn2bvaP/
         CSJ4HEN3+Gz/X1JQFm1682gbZwqiZZsYLgoc/TniZiot3qbzbJHofyL3R9v1otRkxncD
         pAR9cpibMgIMRFXzrk0UFEQmUY0paqXuCoQSSi5juloAbElxH8oDiV0XGqdXwaYFIV4N
         +FNA==
X-Gm-Message-State: AOJu0Yxbe6Wo1qgA5oj+1SbWYHAAT1p6wxBMUebXKsbdqxswld6Vh9zV
	DaMCMnGXmBGXQBFo+d9Oh4JjBTUPT5RoQs7G6lzI/fhesa7DoVVxwpJRNLDoQNer76NC8eqSLmK
	+UpGMIuSeUQgHAxwb86+byEBJ2OeEetqdS//jCP+Xyq7wRaEns9xv5Gpum6/Jm3izDpAFI1PIb6
	pY
X-Gm-Gg: ATEYQzzt3nJIaCEIc5aP+qDfdlgCfrsgKsHiXerDsiBhTi5sbW+VQClcT+XHW0PgN57
	oFLF4QAFrnhGOh8teKhLNzphkhUDdy39HwQqDyQw0iPPbXqww+0mOgeOjZoAK0jejnQb9Ozp/0i
	c13/8Cvzi37P1H0OGqzPH0uXET84pJ//NGR9XO10V/zO/QFLyfFWtusb/x5sGtOQhgRyqXdtvj7
	qsrdVV/4JeO42mjFaoiXHqX3jElhf1ifIcV8VQQXtU7YbbezuMp4oBHZY0jRA6FtGu7hr9owTaf
	30BPnx2eAk8tOtscl0Uc+ov4Kovw58fjWgF+lUaTL39nu2BAv4toLSjTMY3FWx5d9XEavlO0Exv
	YXBiTlv5zr26fvSKoV3obNcwlg6D/UQ6q3mRo+Y90VO1fcOHU
X-Received: by 2002:a05:6a00:2d98:b0:82c:2480:4e3d with SMTP id d2e1a72fcca58-82ce894352emr3330642b3a.9.1775044337265;
        Wed, 01 Apr 2026 04:52:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d98:b0:82c:2480:4e3d with SMTP id d2e1a72fcca58-82ce894352emr3330607b3a.9.1775044336641;
        Wed, 01 Apr 2026 04:52:16 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca8465785sm18128456b3a.18.2026.04.01.04.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:52:16 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 17:22:07 +0530
Subject: [PATCH 1/2] dt-bindings: pinctrl: describe Hawi TLMM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-hawi-pinctrl-v1-1-4718da24e531@oss.qualcomm.com>
References: <20260401-hawi-pinctrl-v1-0-4718da24e531@oss.qualcomm.com>
In-Reply-To: <20260401-hawi-pinctrl-v1-0-4718da24e531@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775044329; l=5116;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=DN2hdJkQfwOmkV73g25P6amt7YJJMBYy4ixSvMZeed0=;
 b=MvkLZJ7m5M1Y3895YsXu0qHuOgRR2PXaJKLD88QyTe5f3T16BTLu7qzFXL05VkVQkqaBFDUyu
 CFWZZrXOct3D7IzjwGoRnrWtKAAuSGO/1HX9ELKXzDVE+J38i1T/CZg
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=L90QguT8 c=1 sm=1 tr=0 ts=69cd06f2 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=bT5XQOCXPleopHcqzpYA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 78hlq-KXcAk1n8umk_n-_53RH5NegU3R
X-Proofpoint-GUID: 78hlq-KXcAk1n8umk_n-_53RH5NegU3R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEwOCBTYWx0ZWRfX/0jYsG12MBIC
 k7zlDNXOx0AR456OcOBR9PoSvtaQykOlg6cjp2BdeJSQKXMrCSwZtXqg9aXpaDBQNUOxAt85ZeS
 4XWLyHtzXl8699x2gH8WeHrpV1pZmqbWO7NKt7QSl1jnhH5+7h3ww7g7qtK/QWNbfvXqZrYPE4e
 VVUdOLUSU++lUZ3BYMtg9V6SnlvSNCEZw/GIsbp31Q12yqRmpj8gh65I/OteIJhCWK07IFk6k/o
 nqtyKCtoyLV45tNOiRQpxvKse76A3O5x0PafYP1EOuMVXnwAlVSvC8M0grrKprUkIuGzrvMYE5L
 d2X1MyQXJdZrpDg2gPBHkoKfcut0ioxIjtU03kfwg5uPG1Upo4PDqkPQhgsOqBQBuwIbEPjoHIG
 TR89svnvgTWomtAD0dp9BbtlgYcCmUX7FSx8IKRYCWkQnNMD/SqAPW7KXoknRc7eWrJ2GtglVAD
 BG/Sc9NgGyxGSZM5WYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010108
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,f100000:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101339-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E972237A225
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Top Level Mode Multiplexer (TLMM) in the Hawi SoC provide GPIO and
pinctrl functionality for UFS, SDC and 226 GPIO pins.

Add a DeviceTree binding to describe the Hawi TLMM block.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,hawi-tlmm.yaml           | 123 +++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,hawi-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,hawi-tlmm.yaml
new file mode 100644
index 000000000000..303bd7262aac
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,hawi-tlmm.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,hawi-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Hawi TLMM block
+
+maintainers:
+  - Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm Hawi SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,hawi-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 113
+
+  gpio-line-names:
+    maxItems: 226
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-hawi-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-hawi-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-hawi-tlmm-state:
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
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|20[0-9]|21[0-9]|22[0-5])$"
+            - enum: [ ufs_reset, sdc2_clk, sdc2_cmd, sdc2_data ]
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+        enum: [ gpio, aoss_cti, atest_char, atest_usb, audio_ext_mclk,
+                audio_ref_clk, cam_mclk, cci_async_in, cci_i2c_scl, cci_i2c_sda,
+                cci_timer, coex_espmi_sclk, coex_espmi_sdata, coex_uart1_rx,
+                coex_uart1_tx, dbg_out_clk, ddr_bist, ddr_pxi, dp_hot,
+                egpio, gcc_gp, gnss_adc, host_rst, i2chub0_se0, i2chub0_se1,
+                i2chub0_se2, i2chub0_se3, i2chub0_se4, i2s0_data, i2s0_sck,
+                i2s0_ws, i2s1_data, i2s1_sck, i2s1_ws, ibi_i3c, jitter_bist,
+                mdp_esync0, mdp_esync1, mdp_esync2, mdp_vsync, mdp_vsync_e,
+                mdp_vsync_p, mdp_vsync0_out, mdp_vsync1_out, mdp_vsync2_out,
+                mdp_vsync3_out, mdp_vsync5_out, modem_pps_in, modem_pps_out,
+                nav_gpio0, nav_gpio1, nav_gpio2, nav_gpio3, nav_gpio4, nav_gpio5,
+                nav_rffe, pcie0_clk_req_n, pcie0_rst_n, pcie1_clk_req_n,
+                phase_flag, pll_bist_sync, pll_clk_aux, qdss_cti, qlink_enable,
+                qlink_request, qlink_wmss, qspi, qspi_clk, qspi_cs, qup1_se0,
+                qup1_se1, qup1_se2, qup1_se3, qup1_se4, qup1_se5, qup1_se6,
+                qup1_se7, qup2_se0, qup2_se1, qup2_se2, qup2_se3, qup2_se4_l0,
+                qup2_se4_l1, qup2_se4_l2, qup2_se4_l3, qup3_se0_l0, qup3_se0_l1,
+                qup3_se0_l2, qup3_se0_l3, qup3_se1, qup3_se2, qup3_se3, qup3_se4,
+                qup3_se5, qup4_se0, qup4_se1, qup4_se2, qup4_se3_l0, qup4_se3_l1,
+                qup4_se3_l2, qup4_se3_l3, qup4_se4_l0, qup4_se4_l1, qup4_se4_l2,
+                qup4_se4_l3, rng_rosc, sd_write_protect, sdc4_clk,
+                sdc4_cmd, sdc4_data, sys_throttle, tb_trig_sdc, tmess_rng,
+                tsense_clm, tsense_pwm, uim0_clk, uim0_data, uim0_present,
+                uim0_reset, uim1_clk, uim1_data, uim1_present, uim1_reset,
+                usb0_hs, usb_phy, vfr, vsense_trigger_mirnat, wcn_sw_ctrl ]
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
+    tlmm: pinctrl@f100000 {
+        compatible = "qcom,hawi-tlmm";
+        reg = <0x0f100000 0x300000>;
+        interrupts = <GIC_ESPI 272 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 227>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        qup-uart7-state {
+          pins = "gpio62", "gpio63";
+          function = "qup1_se7";
+        };
+    };
+...

-- 
2.53.0


