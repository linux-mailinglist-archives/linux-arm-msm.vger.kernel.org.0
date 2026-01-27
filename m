Return-Path: <linux-arm-msm+bounces-90825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIKsB9PheGkztwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:03:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B76F97538
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:03:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2514330DBFBD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 15:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E2E35DCE6;
	Tue, 27 Jan 2026 15:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fL9k6hEY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jrWPTAeh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FCD35E547
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769529473; cv=none; b=GwYuZJjZLOPsU7l/WVp71utgzD70AVojrFnGUvVayd3Gn7VPWJuzdGJQ59g9ZRzF8zuhrrGxOd9QAkdB1ZeNIAQ05ZIvSvfwh646pS6ap5HVuyB7foIERCfCT4UgAU1bQbir2ZCDrEsip3hxCxz8AszRq6Y7NyQnkKAkQwNKpIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769529473; c=relaxed/simple;
	bh=rBN9H4kI0rq1cyFsHjZZ/dN5fz5IcTQM2qjaff5Xugc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dSNZqHFRRy9WitObz1z3gp8hUkSWYHH7WB4NMetbenS2khTr3V87wE68Iduvw+VOsME4cjwpT7OlEHznoijUN8AUXa3EvYfm00Yxqp8GQmzQ0qBQiCiiAkEkaaBD32tKT90wwp8Q7kKooxxBlH2vqQL26jil7ejwl3+eONqwdfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fL9k6hEY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jrWPTAeh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RDg3xa658896
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:57:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bDw6El/I8Qn
	/jmYF9BqPfB+N3QPvQqvwh4YJYPYnhVY=; b=fL9k6hEYKTFawRZHDjOqgkg2osb
	01SZT+oRp0kwCiznuEtDE9dFFWfbr9e2wt17XPhJaxvkY29ZBDJxqdqam8MI2zD+
	0RbbAD4YOoVZY40X0iJkfu1EHuPwK05bbz+DChU/9MNv09KJGCg+nnuL6KX0vnis
	iOxxgpbldoGvhbZOuEz+gga2xMv2382wYRulPBs8ur9Mb1xXdsKQcFAlQO47oiYa
	qkI6LqVcBqtbcrQkp5pXB60xbRwPCI9NzyIL+ttxsggjFkJJhFGzELtQgYum7WSp
	EaetbOCMvihl+1XRfsA4KrCoP22YPHjBAnn8yegQ41nRNJT/ln+j3Uak9rA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxryn9pu3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:57:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a78c094ad6so59520075ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 07:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769529470; x=1770134270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDw6El/I8Qn/jmYF9BqPfB+N3QPvQqvwh4YJYPYnhVY=;
        b=jrWPTAehauc4YN9wLtO1PZu1du4HNRPH7pbU2cX78EdJePTyKGBtvTAwg+jjfj4Ysk
         AoCwL+xfrbMbgbWJ86+2c63sIhdPg8TzUcDYfxsQx5JTBnntsRZkVnykm+Ds7WycuUFd
         XSNhvGaNot2WIQMahkEHUtt3tcCpansTJcec26kN+rGzFO6ndnBzkTlRN19c/DQIaz6D
         IIjeTGJ523vElSgnV+FRgM/MStBLM0KTHbmuhm2Bk6zA9jWvILpCU5ouz34JzHOiNl7D
         NKfp2x470MGv8Si+G9mkb3Con6Qmseyjn6FBFaGan0mxdaLCaEqMrSKWD0wE0WxekJRh
         A5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769529470; x=1770134270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bDw6El/I8Qn/jmYF9BqPfB+N3QPvQqvwh4YJYPYnhVY=;
        b=WOOHAo+93wB2e6BABLWnMWLuESJaTV9/PwuQRQ+/kFgqO7EX//WHeFp9wu7Gqkjqlp
         rMBLMIV/orSu1562govZHtxNWf/GRq6VA8i3YCnqJdhW77K5X9nnREA/+eiQ2EmB4N8Z
         tq5a+Rv9C/9yLgeNhvC9Cr9kaaE8FB7hj4uqavCnQ6dDrgeRDUkI3SMs8DlDuiPWirG1
         N6CH9LHPDAQPRhUpdz2u6o5gsvOz4MUaTWAJEwjNyA5LgEk9t3UNOW46mI5yR5+NArtE
         Mekjd/q0R5obXkWN8qKDe2hroN0cXWcq1INIxBnvkqdqgnz2Qba5L5SC4tZD90YHAX5l
         V6Gw==
X-Gm-Message-State: AOJu0YyYZeUvAyhfT9fZ2Av6zoWERKyy55Ew9m9WrkJA2fNi1Airc/7M
	zPa2ju1oBUcilWAVafePNiyp2GdCBXhsqIbNrwIXg66FqsX1N7nRPNuVFfMJ/otaxeqrKaNmw7/
	+VtlNQK+v6vSa6c9a5VLoYPJq1jhinzikrUfadTkBTuX+uoADrxXgTkXhXs0PDnvo/52E
X-Gm-Gg: AZuq6aJwryFPGhCjmsJYLx2eo8l8avAF9yfN9vIYhLggJimZOtqpp88RBKAZs/PZv9F
	PfVe6/rdex2ZbR72cyxweJe512SmuqvxoGMfEzv3ivucC3jirjF04LMl8fhAEhNhEKLtyyVdjO/
	jDfeEAFsWb6bojd/tNmH2OrwnwstXAuogs/VBMdQpRGdeuK0hRxVnZi+0UvdbFqP8dB1N2nCBxq
	O/563xCQXfgQrKft1Up0pOSm2vYtr2P2IOp4PiU2HrUGqRaJosoGGloAQm6gOgoloFnocVNfp5R
	XRrj5QI/HQsJG+JOYb2lS0AidOwCRQUEA6gKYPLDGj1ULdx8fyKH7m+w41jynInTMlkXTxNUM5D
	hLd5iUjLyyLaog6hGBRauI4Pw+orI+ZHrAR7xGP4=
X-Received: by 2002:a17:903:3583:b0:29f:cb81:8bd1 with SMTP id d9443c01a7336-2a870e0ad2emr22212515ad.55.1769529470346;
        Tue, 27 Jan 2026 07:57:50 -0800 (PST)
X-Received: by 2002:a17:903:3583:b0:29f:cb81:8bd1 with SMTP id d9443c01a7336-2a870e0ad2emr22212325ad.55.1769529469807;
        Tue, 27 Jan 2026 07:57:49 -0800 (PST)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802ede745sm120577465ad.44.2026.01.27.07.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 07:57:49 -0800 (PST)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, konradybcio@kernel.org, mani@kernel.org,
        casey.connolly@linaro.org, amit.kucheria@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        gaurav.kohli@oss.qualcomm.com, manaf.pallikunhi@oss.qualcomm.com
Subject: [PATCH v2 2/8] dt-bindings: thermal: Add qcom,qmi-cooling yaml bindings
Date: Tue, 27 Jan 2026 21:27:16 +0530
Message-Id: <20260127155722.2797783-3-gaurav.kohli@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260127155722.2797783-1-gaurav.kohli@oss.qualcomm.com>
References: <20260127155722.2797783-1-gaurav.kohli@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ubeVxuJ-Qs_QbcFSVK6A2rBDfs8gvnhB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEzMCBTYWx0ZWRfX8fpd0+xneVK0
 oPf79T70zsdj42QP9rbAW68rsRXPnhv4zJqbiScnD+ccC5ivJ8HlYSS1OChctzJn+5SCBFNAVjR
 q0hLt9iEl/yo+VnFqCteFxBvEGg2Yk5dfDv0JQK0KdV8Ncj+WKXCoDHmKdGSx60o/l0vnBtVsa1
 M/U0vZ9Ih2PUgVhCP+qRm6VwYXNUxmUdGmoZ9K341f2SrR7etHdZEwRdi5M+pWtZO/TPAKEk9YW
 ohbYjdEMxl9yIAzanKjWvXrTJtfomQ+LyKfAxxf0J5+pEAp0/OS9IECOAo3pkkakVKYRTeyJNMZ
 G1h8bAOgGtt7jysJhJ4SQpAGMpBHwpevyB+fzMtkhHLXQyo3tmZWAh1mPBHWNfc36tOcAV8yQPF
 UCcPVlK17UurwGmRurDONsBnArVdDu4yLqD+B/RCbWCEv4HwWXvozfhRQNzQhX9lD0ALqE9SHSg
 RXkEvgbZKvM8Zb87xVQ==
X-Proofpoint-GUID: ubeVxuJ-Qs_QbcFSVK6A2rBDfs8gvnhB
X-Authority-Analysis: v=2.4 cv=FsEIPmrq c=1 sm=1 tr=0 ts=6978e07f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=sYNnw0LgJqtDHXS-OV0A:9
 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90825-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7B76F97538
X-Rspamd-Action: no action

The cooling subnode of a remoteproc represents a client of the Thermal
Mitigation Device QMI service running on it. Each subnode of the cooling
node represents a single control exposed by the service.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,pas-common.yaml  |  6 ++
 .../bindings/thermal/qcom,qmi-cooling.yaml    | 72 +++++++++++++++++++
 2 files changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/qcom,qmi-cooling.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
index 68c17bf18987..6a736161d5ae 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -80,6 +80,12 @@ properties:
       and devices related to the ADSP.
     unevaluatedProperties: false
 
+  cooling:
+    $ref: /schemas/thermal/qcom,qmi-cooling.yaml#
+    description:
+      Cooling subnode which represents the cooling devices exposed by the Modem.
+    unevaluatedProperties: false
+
 required:
   - clocks
   - clock-names
diff --git a/Documentation/devicetree/bindings/thermal/qcom,qmi-cooling.yaml b/Documentation/devicetree/bindings/thermal/qcom,qmi-cooling.yaml
new file mode 100644
index 000000000000..0dd3bd84c176
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/qcom,qmi-cooling.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/qcom,qmi-cooling.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QMI based thermal mitigation (TMD) cooling devices
+
+maintainers:
+  - Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
+
+description:
+  Qualcomm QMI-based TMD cooling devices are used to mitigate thermal conditions
+  across multiple remote subsystems. These devices operate based on junction
+  temperature sensors (TSENS) associated with thermal zones for each subsystem.
+
+properties:
+  compatible:
+    enum:
+      - qcom,qmi-cooling-cdsp
+      - qcom,qmi-cooling-cdsp1
+
+patternProperties:
+  "cdsp-tmd[0-9]*$":
+    type: object
+
+    description:
+      Each subnode which represents qmi communication to CDSP.
+
+    properties:
+      label:
+        maxItems: 1
+
+      "#cooling-cells":
+        $ref: /schemas/thermal/thermal-cooling-devices.yaml#/properties/#cooling-cells
+
+    required:
+      - label
+      - "#cooling-cells"
+
+    additionalProperties: false
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    remoteproc-cdsp {
+        cooling {
+            compatible = "qcom,qmi-cooling-cdsp";
+
+            cdsp_tmd0: cdsp-tmd0 {
+              label = "cdsp_sw";
+              #cooling-cells = <2>;
+            };
+        };
+    };
+
+  - |
+    remoteproc-cdsp1 {
+        cooling {
+            compatible = "qcom,qmi-cooling-cdsp1";
+
+            cdsp_tmd1: cdsp-tmd1 {
+              label = "cdsp_sw";
+              #cooling-cells = <2>;
+            };
+        };
+    };
-- 
2.34.1


