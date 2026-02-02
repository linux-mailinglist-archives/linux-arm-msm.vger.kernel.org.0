Return-Path: <linux-arm-msm+bounces-91544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EO8eLd3ogGleCAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 19:11:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2BDCFF6E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 19:11:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1BB9B302DBCA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 18:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C6238BF7D;
	Mon,  2 Feb 2026 18:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HpMNVcip";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dbx1PYte"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2D938BF71
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 18:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770055838; cv=none; b=nRbz6TmAkzvquwPEA9bVPbPUKSq1li4Sb3qLQ6RK7T1t31ZOWyHW10LPmbWnoa8SjbHzj0sdNbstQYiCseBe1LsbH/KUMSm9onBjS+Q3q2dai8iiMqcFhywI31ypuLrIlU5+GoP6IIF7wW513aoO+5g1VYvwASeR1DrfIz1DRdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770055838; c=relaxed/simple;
	bh=fLcHXdKV5/hDu2wr6i98ZasPwufFwNkdfF36wyuIx94=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pFOdD/l7xG3qoMDT8s/h4N4Jpj2DepUVGZhCugb32PNT16BVqgWcsHgKHgrGwVp7G9x8XtQdYHmVb7no0wFYusj7XHQAtzqkxARXwz/qvLHEIpxWCoJX1AQ37f3s46clGegzdq9UB40CUt43Bs2z1moCDBeXi+NhCLE2QUaDdR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HpMNVcip; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dbx1PYte; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612APFKH2107257
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 18:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cbpTgWXazdO
	AfAdL49uExcjxZu696DCuIHbDLPHFMMY=; b=HpMNVcipAqegOF32c3LLEcQmm6A
	ikQb5KQHhYJtQ77BXaQRlvhCPxNwDUqCXilM6IUZCqEDG5GMZkoWJA0gxtqRwVPG
	ZsPbkNogMdcikhN39j+CmVN/hCz8FiVOlWTCApMmwjgWkOf4FYnwpirsb9LrSDiA
	nxQI+UJT5GFL9GnKsW+MyPGYHTKEy9EvUopMwYlIjPrULqcgdOdvqgSSFBlEOue6
	ZiO8XdxlsrF4G1pMJQ8T66CTXozSCVEnRfWBZdS/H7tVPa6u/SI6BNiTgiq8lIVr
	0VbO5ZLmkivs5+lAjcAPbpI/sYFVFDPVqTtTK+16QlF6zcHCa2A6eYNCV0w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2t5e9eff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 18:10:37 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-823486f311bso2466797b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 10:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770055836; x=1770660636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cbpTgWXazdOAfAdL49uExcjxZu696DCuIHbDLPHFMMY=;
        b=Dbx1PYteGR6wo5l4svG1lRs0cfZ9ouQ9uXnMHju/wXTTyFYEJFN3ktS3iFG8Gl61a/
         ciWK3Zly2xWniEKgkh4re8GkpoaVZK1ySrMJVj68HBGRtE6YVv5fvmzsauUBdmofZJqd
         waP/Srk7iGFedQCJ1Sd/ozMOrhTk2FIeDWFWn99fnMTJXeVCtnz8DxGoH4mJDWMdSQiG
         mtUH2xBYlHLPrLJYRn0+33f8P6u2ejf9xSLX7vfVFVTyCubYucWSzq1S4fZm9xzxW00N
         e6FPpOkkWhw//DQ01CyMLUqeLuBxsFddXUMHvHpgQ2EsSdz1dqGenRBcZsAfwH+4w7Vx
         A/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770055836; x=1770660636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cbpTgWXazdOAfAdL49uExcjxZu696DCuIHbDLPHFMMY=;
        b=uPnfkmW4vksTuIWxBLtCSgyWzNWHVnbA2iCIrUahhlxyZiNWzZOn37z7iZCm+eds5T
         I+XQcsKF7mTs8r0bKAVSSubNk2qWnlnuN9dtNtZT16EAnZnK83SuwrdpteYI8TrhApzM
         RBLb5bPP+vVznCW/RsoT5ANjMN3LKI3Zxc9NFPJay/ZXfBAJUpM8UpOWz04BSR2tP/Xx
         s48vdRujtedmtnNubqBScMSPNfJ8OMXsuL86GIYBzbp6OVTz3CwlCHRRmFZslnvcptAY
         ZPOX13ZCQ8apHuBwmsnnsdA6rW18SGvu8vYdq6531UlxonMgKrKpKMt3gQ6Pd8n1hRLj
         vMdg==
X-Forwarded-Encrypted: i=1; AJvYcCU3NUrBnwGexGiFCSOOjoloSJt7bX2bwpCxwVCNewAsh7x1Zw11bwh5cOP5DC0rs6aD6s5C1sh1CPeKJMXq@vger.kernel.org
X-Gm-Message-State: AOJu0YyNaxArpwmoPxi40YbXe7wPkpaR3mujcE8ydzqLb9NAuZuw+275
	AHWywgIJ/sGLci4qSETNgc1tHdHG+a7dLakp0lXiYhHyZa7/pyK7Z3DC0OtLjqKuYu8BleEYRRs
	1Q2QiiNdyX5qVykqT+Eb3BMQXxZY1HZUgh446DFoSh+IqT1GrkJBGhOycBbM3XNMOIGTz
X-Gm-Gg: AZuq6aIofgBOO5qmNhYqX4u3Tz7WZ+sC5eASOaHPetxPVygq6gX3Baf6u+XHpKUz1wG
	6D9S0XpBUFQnJqpbkgOZlMtCx1QLMRfu8RCJwQAYZ9I4KfVAIt2kvesFyYsBAAvUsF7kZPP04lJ
	1p81EKk1Auu440JOdfSoYNlV2dPojUTm3OGlKueqsMdh8Hbf+xEG0nzlNoNE008s4QQTGLX/aLm
	545Lokg8dC5c6gO3xbYUxFJvy08nZrxay+6rLyglfgKw5meBUjlvRxdxbePDRuFmMRU5pqj/Sqh
	4RwAvrLnhAko/iohc8CLmb4xrTJMLjaqJUoF2RRJ6zIjmbaFLeM3tajpDdQp9EPiRuiydoN1iCr
	MrCb2RkzU5etfYZyAv44aYCH0dcJfwyNAo6jabOxObc0=
X-Received: by 2002:a05:6a00:94f3:b0:7e8:4398:b360 with SMTP id d2e1a72fcca58-823ab748f55mr12083564b3a.51.1770055836414;
        Mon, 02 Feb 2026 10:10:36 -0800 (PST)
X-Received: by 2002:a05:6a00:94f3:b0:7e8:4398:b360 with SMTP id d2e1a72fcca58-823ab748f55mr12083520b3a.51.1770055835816;
        Mon, 02 Feb 2026 10:10:35 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bfc712sm17476780b3a.40.2026.02.02.10.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 10:10:35 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Nikunj Kela <quic_nkela@quicinc.com>
Subject: [PATCH v4 08/13] dt-bindings: i2c: Describe SA8255p
Date: Mon,  2 Feb 2026 23:39:17 +0530
Message-Id: <20260202180922.1692428-9-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202180922.1692428-1-praveen.talari@oss.qualcomm.com>
References: <20260202180922.1692428-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE0MiBTYWx0ZWRfX8SWi6i0pwHSj
 cSW8i2HOAlI1UUbKnMLT7udOTEhmXtokfeRAMan4hZcGqzp1mts5LckQ0MkeApSrMDvd9Xl5uPJ
 zRhrBJxhig4iqlhpPr2xcJOEoZyLuVcE1F6HLfhCVQK0upvWyDfeEYW8rjNlzVnN4j3QWUpc2Nj
 Ou1qxMzEoiqYLtXYWZ5CUnsK902x6FACX26QpXL5wsxLOWzwXUCniicahhm48JhE684b6rxnxcq
 DMkww9yW24yQf/hLr1PHd01kEnxt9UDKlZWzYcwvMqPmnkvNxfVAPSVT6LJxIaJ+/VNNNhgr5j2
 1NZkigm3IfZvQmIfjVbE72WmsM9G6JUJs1Nd8bDqnCQ83bbwWQOJJklsK+lZj0jzBy3u+QSlrNb
 8hM6hISnA8YQn/JHuTEDG7LHeWeTnpdx72Im63VgOjPNVWjkD0L0m9QT5DsBwcETt4B2yDAP2At
 Kva68S0ADK9h9LSNr7A==
X-Proofpoint-GUID: Rf64n25raXg6wqacBH0ZAP0qVHaj9eZS
X-Authority-Analysis: v=2.4 cv=NOfYOk6g c=1 sm=1 tr=0 ts=6980e89d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=apMzWF-kzHp83YoYYzAA:9
 a=OpyuDcXvxspvyRM73sMx:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Rf64n25raXg6wqacBH0ZAP0qVHaj9eZS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020142
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91544-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,quicinc.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,a90000:email];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4F2BDCFF6E
X-Rspamd-Action: no action

Add DT bindings for the QUP GENI I2C controller on sa8255p platforms.

SA8255p platform abstracts resources such as clocks, interconnect and
GPIO pins configuration in Firmware. SCMI power and perf protocol
are utilized to request resource configurations.

SA8255p platform does not require the Serial Engine (SE) common properties
as the SE firmware is loaded and managed by the TrustZone (TZ) secure
environment.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Co-developed-by: Nikunj Kela <quic_nkela@quicinc.com>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v2->v3:
- Added Reviewed-by tag

v1->v2:
Krzysztof:
- Added dma properties in example node
- Removed minItems from power-domains property
- Added in commit text about common property
---
 .../bindings/i2c/qcom,sa8255p-geni-i2c.yaml   | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml b/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
new file mode 100644
index 000000000000..a61e40b5cbc1
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/qcom,sa8255p-geni-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SA8255p QUP GENI I2C Controller
+
+maintainers:
+  - Praveen Talari <praveen.talari@oss.qualcomm.com>
+
+properties:
+  compatible:
+    const: qcom,sa8255p-geni-i2c
+
+  reg:
+    maxItems: 1
+
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: power
+      - const: perf
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/dma/qcom-gpi.h>
+
+    i2c@a90000 {
+        compatible = "qcom,sa8255p-geni-i2c";
+        reg = <0xa90000 0x4000>;
+        interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+        dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
+               <&gpi_dma0 1 0 QCOM_GPI_I2C>;
+        dma-names = "tx", "rx";
+        power-domains = <&scmi0_pd 0>, <&scmi0_dvfs 0>;
+        power-domain-names = "power", "perf";
+    };
+...
-- 
2.34.1


