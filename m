Return-Path: <linux-arm-msm+bounces-110565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCAkNZ1mHWrqaAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 13:01:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF52A61E0B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 13:01:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E67FA300ACB2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 11:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291A7371053;
	Mon,  1 Jun 2026 11:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N42UUFiv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L5lqV/NB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF063932F0
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 11:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780311698; cv=none; b=pvVZoquZxhPbHgwdaF6J3hKPgOVGLT1Jk19AYs3jZVIa4dFi6U6GVjiwsLCTvC56N6SAShdTAA7i7VZK2CGda7X3tYP1g442ELYA6oHykAgrWSdh7ZwElClzZ+bMBrfd49WP8gZrqIS6scz7JVDeWu8wZSHAfTyxvK90mFUuOHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780311698; c=relaxed/simple;
	bh=E51oxoPSW5lEbFl2QwR4u2/Z0SHFv6vL4YhGehqP5Kg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HWk+/0s/iWFO9q1J38WZ4uJVK4pCT+3xL0ZQnh3gAGDJSPRjfdaaUdnSaokRTeJDCmrAFU87CZfeV/ZQdeXcFmJZJ+T+MKuTld/iuIEl5C7YButJD/vyXEKg4Bp+ch6Hxq2626258G0YZ5fdn2KqiAQzylvHeGr0BCuUPqb+l+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N42UUFiv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L5lqV/NB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518e2lD4111308
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 11:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IytjrOQapu4e63hvcSkye8w4XxPBsAEbmdV8VfWTdCg=; b=N42UUFivDHOp4KKr
	LKkjWLHEnIwZpOS2wkvdPDNsaAxivkuY1b/mHr6Rw2OIufOlOT4ZouPZJo9CV8gO
	JZLcJ+JOPpALUkqcpXy5RTRaRZsjVQkfS0rh1BaETkisCHH2P4OnUqpgK6nfFIfA
	3UQB+ffeYGDSBp/M9e3Gq4riMusNrEG4ZxRwqKk23W4bI56mZhMBLlKJn1eFpmZW
	+tqMUQVK7tKOu4ACdL6x+XyCy7Gc6zRWRztcQht208c/K+xspyrMtUVJ2+lQCDdB
	cYVyQsQTCB0C5ciaSEcd1PLGnix6h47rNMwaDRCafdD2tr5IdKKxRv5UfgN8qlkL
	Vnb/uQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6s3rheb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 11:01:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c36f1cc0so23719135ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 04:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780311695; x=1780916495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IytjrOQapu4e63hvcSkye8w4XxPBsAEbmdV8VfWTdCg=;
        b=L5lqV/NBCBeYAWW0VfcoszuKxcirUvvdkzwNgFRlvKLOZdWKKHvHcGDnpa6PF+z1yD
         gPF++L15XDIOzqTui8LnuFl+x/3I1iWH5SmIKwHsc47aACV9tl/SfhjH6IvrQ7nHQhnf
         qC6aAXbfNRkXonGYpXpR44imoYcjamyOpdzKtJttMR3w4piB2PG+4jMEI2OXvdzFknqZ
         32VVBIQnkgKOzMTQIWhjAgPdKHT9A6NaMMPNob7+tzSvqYZjyNuK/7UKyIRNhSh6c1Vz
         xQel15w9PIAoiX8h9IOGYItEXjVpUx85F/Y0tmRT7De8FoBC8dVuBXGzgaenXQRw96RV
         SsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780311695; x=1780916495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IytjrOQapu4e63hvcSkye8w4XxPBsAEbmdV8VfWTdCg=;
        b=HNXrK7L1Av17SLhp+Xo0d5LQ43AUhpNJGmCc4/vGDcPRswRHjAh/Gvg2pgteh+6hJb
         AJuKbaoHMUBs+jri8ddhcBMYpgr8Afyn5tLKq8pN8/sjzOLDUQfczjmo6ty8usTFF6eP
         0gW99jc3WwEK3U62iYsDQxzQI18FB6QL+uCNjEIOmY5CtcTF2+Pzo0Ix5uxigsmMgEvQ
         K3AanBFeBDs6GKDkjMUTfyOA2qTOXY/nrotwGW9Q7pyCXrX+54WT2OfZlfB2b17Vseed
         ZrZyawNB4tTiCdHHmWFQXcYmNOyrWR4ndnGSVPEIbvfhyXJQK04mQCzlB4gjzCM3/4MX
         +dVA==
X-Gm-Message-State: AOJu0YxPNF2luD6OwshlyGCFjVSDmWy33zg56tqvu/cEldNcB20xKNRk
	+x4AKB6qhScs7AHK/HdD8NZH5ETldBDEPizVbH6HdAc1sE/wSCmTfTEwg8L+k85406fJ860Ri3H
	IxHKToYFhiM7+x4nLa29VVLu6Dbh5tia1yBm1e79x0W/3Tm7GZua2STmSPiZ4Gg0/LuxwV/Pd1I
	id
X-Gm-Gg: Acq92OGTekKE0kiZpawU+SrKNkjdHpUI74fAuV3jFBUC1/yANov6BQpSpxGRY7Tm6e3
	j2YwB9y+I15gHl7jmlX47U5TuPociKplI2Km35ReD+T+3iibCNtE6PWQdctQqRJAbWwftGuOQDE
	nJ7XHubUV/qmjxJg9u3RhPnkkgidnY/f2KFPG3pAHFtEtCFuh0lspDji9/ornzB/LkFElI+4AsL
	/12OZalKqPr2ZWwt/xekmybXRpeQ8zsF7Myn61McP7WRC4rmJFD+rmbEMu0gynzmwuC1LHQceIr
	6cNMVR6BKn4f0SHdQ/2C4EMy1Rfom1W79TYs4TXZIjhzyY0LvOkb7BYI9NKgImtBE7Pii/6+eRc
	KZEVx1RQWsRGOuvfMeH8vSdH1zXko+x6hIH0ZFmYjuiERFme+wzw/KP3F3Xieb6xj
X-Received: by 2002:a17:902:e88c:b0:2b2:4d36:7aa with SMTP id d9443c01a7336-2bf368859d8mr109933385ad.35.1780311694116;
        Mon, 01 Jun 2026 04:01:34 -0700 (PDT)
X-Received: by 2002:a17:902:e88c:b0:2b2:4d36:7aa with SMTP id d9443c01a7336-2bf368859d8mr109932015ad.35.1780311693055;
        Mon, 01 Jun 2026 04:01:33 -0700 (PDT)
Received: from hu-sachgupt-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd6edsm126239185ad.18.2026.06.01.04.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:01:32 -0700 (PDT)
From: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 16:31:18 +0530
Subject: [PATCH 1/2] dt-bindings: thermal: Add Qualcomm MBG thermal monitor
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-spmi-mbg-driver-v1-1-b4892b55a17f@oss.qualcomm.com>
References: <20260601-spmi-mbg-driver-v1-0-b4892b55a17f@oss.qualcomm.com>
In-Reply-To: <20260601-spmi-mbg-driver-v1-0-b4892b55a17f@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Sachin Gupta <sachin.gupta@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=AP3YypGC c=1 sm=1 tr=0 ts=6a1d668f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=E-gG5h9l_blIFwvKag4A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDExMSBTYWx0ZWRfX/tyOlh/JLPyg
 Lat5rjYQgkpeOUcl1KjaRftmJEbrnj6uWnR8M7LXSg+kZh7OxqA9jj5L0rHPXg62qOxHqzRR8Dw
 CleCWBL61cRc+7BCJcAu9Jrju8sUXu7KC3AVinzjru35FrY0N7tna9+BovU0JmuKsQgYxOzYuwb
 q+5zQLKClFI8WMEObVT5bJVeGBrTHrRThengNGcrc2L0873eOWnBCEmHZstbYHii0I+izzUhT76
 Ok8+DfcFjCUENCRZZTxvb0iC33VqoaBYhXvgrTUuL4Z4V1/wxlT13WTH1enMzmUFHmLpIbuduT3
 dMK8NKyCndj8NbdBsmd55Ghl+p+3nlKtDgBw+iZAc7GmOVWJcz5UyTH+XJoY6nnMv9vmt9KuXWP
 aDJcwJQr6JVawRMTsEdqJ+T7/l1A/WOLR7PmvDksu3F0i55VBR2AzTy1wWZPbN5wXIHd3ekmmPk
 ZmXWrjIstNMNROGl/oA==
X-Proofpoint-GUID: YNki53r-LfBf0n7UIgUycoPjpteNkEyD
X-Proofpoint-ORIG-GUID: YNki53r-LfBf0n7UIgUycoPjpteNkEyD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1011
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010111
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110565-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,devicetree.org:url,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,quicinc.com:email];
	FREEMAIL_TO(0.00)[kernel.org,intel.com,arm.com,oss.qualcomm.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sachin.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AF52A61E0B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>

Add bindings for the Qualcomm MBG (Master Bandgap) temperature alarm peripheral
found on the PM8775 PMIC. Unlike the existing SPMI temp alarm peripheral,
the MBG peripheral supports both hot and cold threshold monitoring across
two programmable levels (LVL1 and LVL2), with interrupt status reported via
a fault status register over SPMI.

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Co-developed-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
---
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  4 ++
 .../bindings/thermal/qcom-spmi-mbg-tm.yaml         | 72 ++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 644c42b5e2e5..5f409fe700b2 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -193,6 +193,10 @@ patternProperties:
     type: object
     $ref: /schemas/thermal/qcom,spmi-temp-alarm.yaml#
 
+  "^temperature-sensor@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/thermal/qcom-spmi-mbg-tm.yaml#
+
   "^typec@[0-9a-f]+$":
     type: object
     $ref: /schemas/usb/qcom,pmic-typec.yaml#
diff --git a/Documentation/devicetree/bindings/thermal/qcom-spmi-mbg-tm.yaml b/Documentation/devicetree/bindings/thermal/qcom-spmi-mbg-tm.yaml
new file mode 100644
index 000000000000..a0ecc9f35cf6
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/qcom-spmi-mbg-tm.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/qcom-spmi-mbg-tm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm's SPMI PMIC MBG Thermal Monitoring
+
+maintainers:
+  - Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
+  - Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
+
+description:
+  Qualcomm's MBG(Master Bandgap) temperature alarm monitors the die
+  temperature and generates an interrupt if the PMIC die temperature is
+  over a set of programmable temperature thresholds. It allows monitoring
+  for both hot and cold, LVL1 and LVL2 thresholds, which makes it different
+  from the existing temp alarm peripheral. The interrupt comes over SPMI
+  and the MBG's fault status register gives details to understand whether
+  it is a hot/cold and LVL1/LVL2 violation.
+
+properties:
+  compatible:
+    const: qcom,pm8775-mbg-tm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  io-channels:
+    items:
+      - description: ADC channel, which reports chip die temperature.
+
+  io-channel-names:
+    items:
+      - const: thermal
+
+  '#thermal-sensor-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - io-channels
+  - io-channel-names
+
+allOf:
+  - $ref: thermal-sensor.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        temperature-sensor@d700 {
+            compatible = "qcom,pm8775-mbg-tm";
+            reg = <0xd700>;
+            interrupts = <0x1 0xd7 0x0 IRQ_TYPE_EDGE_RISING>;
+            io-channels = <&pm8775_adc 0x3>;
+            io-channel-names = "thermal";
+            #thermal-sensor-cells = <0>;
+        };
+    };
+...

-- 
2.34.1


