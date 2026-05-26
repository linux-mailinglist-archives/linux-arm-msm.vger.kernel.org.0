Return-Path: <linux-arm-msm+bounces-109720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GI9HOegvFWr9TQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:30:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 850155D0D3A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:30:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 55A913019465
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 05:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82D1E3BF684;
	Tue, 26 May 2026 05:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N8M37NyK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g1nB4rtn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D923B2FF2
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779773409; cv=none; b=g1xSStclISv56NNXF523h0C/3Wq1lSfQb2SXhM5q+sNzIW6sl0q26YeNeuNIh0w8WXjwGQqcL6o5FMuzM1P77Vc/o6Bl5UjVioWnRh2k1Lo2SyeX5V6ELGowaFWl1mp2ds+Rq9unu9ujf2BBlkVkFvEKemuuolmlyFv9qrgRK0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779773409; c=relaxed/simple;
	bh=PPpzR6Fy3ALZUlNzn9X9rfLsNAUY59r/ulVpKcsIzrM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OgZonF5V//g6F+b8Ab/cn3abMgEgXZH6Nalx50CX6VKbWwS1mmEzlYK/D7BcUp48pM+SQF8Jg0nCIhp3CUd5aKJ0oFDMFMAzmV1vGkW4L2E+Fi0NAq7Wry/jlbt3r+xQX80Pliz23/N1Ey0ubzyXC2VjLuPs3MHxkaC9j6c2TGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N8M37NyK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g1nB4rtn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q10VCO3603990
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:30:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ESLi7GDGI+mdPVzEeN/1L177WzF4D7iWWh1EznIzvQA=; b=N8M37NyKk79K9HrU
	/hS2Z2QP3s8QH8deT4R91JyZOSWh4Q940U5dcJpIBUqMeANZYu5bTakm4hh2CuMB
	WZ4y8+wbzySWka04Gx1rSue4pbRKJqeArEg9sHY1zvoF69W0hdHBtbLgulG9PiSt
	J74YRfpZiQvuj10ij3S93fyzfiep5+0zXi10BKZoXRYkLNM69fhpA89ywc38LqzF
	G/Ebxi8xn/Ba9IzsrVG/BgMzLXrmZNf0P6v1w8v2FBqUcs1e0E3opsA4TnqiEB7B
	xr6odGNh3+yFPyalilBbliOsaotI7bIy57w8cV+hNqMIBwoWk3Xgom3/ucIJGmOs
	uAE5+g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpyqjdey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:30:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bd00a65673so78079585ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 22:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779773407; x=1780378207; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ESLi7GDGI+mdPVzEeN/1L177WzF4D7iWWh1EznIzvQA=;
        b=g1nB4rtnP+ZPgFR89mdrTDLorK0Dq8597BJZ2lupn9Rlz9TzMSWHxKyYGcwSJjBCai
         AjxjzL2UE64Speh6kLXj7IcC8trPIjk9HGyecyyp5ZNPk2NbpgcOq2IbNWrIEBUgOZ6x
         V3XObr4AQDynagNMtLWPTdWq41wSB/GCBoZ8SndBTxlhPnoJuCVJJUtMucrU1vDOG7O9
         WgTVnMw5P5cBknovlkMBK4XSChiz3gXZrugF0AoNqK47FLiuZM1LNgCRVLp5YZt/LUph
         v00nDEH5PjUaP+WO+cUas3i3m/oLOxs3j+zyfibh06RlHwRcTE/B89si+dQ4jr6PAJHT
         4kyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779773407; x=1780378207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ESLi7GDGI+mdPVzEeN/1L177WzF4D7iWWh1EznIzvQA=;
        b=OdguHJ4EMd1I0ndLkhfzLyueKkL9j4pcwYDwZHmVIp1NS0H8qK9XtGtlTkePdH31JF
         LTzdaVfJ491csLRadBiAY5DeLOgTFFqKv0WvhL+roN9bV0luBsvJsIRzuUAmzN7B9EeI
         UjPdOH0iLs4SfxdY2d9OiQhtb8bmt6A9Se9Nbu37xbCG81weBXTeEZu4+5DloiwPfPmC
         CMWYBJz2b7fTc0rOuhhASyor13OBgiOQHmM8Old4fl0VKg1240TN6RZ03CKozyHQ8Ccj
         XoWqnhZi1rJ02caHRWbb342t840K5KowzvxhZ0OXab21+MFKdpe9LCb0oGFm+s3xPB4c
         j6Fw==
X-Forwarded-Encrypted: i=1; AFNElJ+ZSoNXC5Eky10UCB9k5Fobp4dyb6//MooAMsVNsHqQxfYMRF9KAfGvE4EQcef+pN7c5ZP+P+5GiSuAbvKM@vger.kernel.org
X-Gm-Message-State: AOJu0YyAzRYncewD860RX8hFnaAD6xvxPk7fVmd66z8MMuo+iWT0nrN2
	7hi/KihEQtDt0b8tVrimIpoBXnoejOwhiNn1XLByclSH0pkIfbZJvqwMx4Wil/YMWJhKymZqzLT
	4ywb36imrPHCddX9kQxXtlrxsNjVKScEZudPMTvQ5wOWF3e/fUBl2OSESbn86Bhl3U6rT
X-Gm-Gg: Acq92OFwoRjE/Dgix++BwyM1+90hfwNWlUZsKqxEK0IjNPb2ca/rfUesP16Txp8qy3U
	ABjMjran2ep2szkgOsAl1G+fgVFZgCtBQ5ufJGi6K79tNaJn4eWeXWik/bf37E+H+14roBsuQQ1
	k1DEhsyQsaXnKEjp6bLo0FFSbvwWjmoGqqtSyh1fV8sMibjwtQgMThA/69UR7fX0162GEEQdEtm
	o3iIS3atUargnfqaPnI/9FCfBCoeAj98iFh2ta4duTpngkPtWlBWe471IWKYt4PP7YQ6+ChXxv+
	zRKf0/lRDCji+6HdQ5bmXMLt4HAirDCfdGnR5CmoyLq9W696EPwgHV476i75m/DOprYUZaiAfTh
	wPKafgzLt+cftNdiunNdsYKuXEcOVBepEo8kUL5qqeSN6bK1kAZkJVGJF
X-Received: by 2002:a17:902:e78e:b0:2bc:977b:846d with SMTP id d9443c01a7336-2beb07b5161mr123066155ad.5.1779773406411;
        Mon, 25 May 2026 22:30:06 -0700 (PDT)
X-Received: by 2002:a17:902:e78e:b0:2bc:977b:846d with SMTP id d9443c01a7336-2beb07b5161mr123065755ad.5.1779773405851;
        Mon, 25 May 2026 22:30:05 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56b7920sm114088995ad.21.2026.05.25.22.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 22:30:05 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 26 May 2026 10:59:45 +0530
Subject: [PATCH 2/4] dt-bindings: clock: qcom: Add EVA clock and reset
 controller for Glymur SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-evacc_glymur-v1-2-b61c7755c403@oss.qualcomm.com>
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
In-Reply-To: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a152fdf cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=QUVFY6MdtzYYwQCb-hMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: DQW9XeBxECbFBXhZSUbB6oXbQj7uZcvD
X-Proofpoint-ORIG-GUID: DQW9XeBxECbFBXhZSUbB6oXbQj7uZcvD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA0NSBTYWx0ZWRfX9IF2qJzWGVyv
 7SF1H3OmNPoF8JcS47ZJUJWrQu4FjKU1apsRyrUXq2W5FngbGg5EnnMQbR0GqRgQJpe2Ow4Nfl+
 knXNSlcQnjtwuvedDNV1UIF0Q7xr8GvAmM9JzX07K/e11ZHRA9etVq0GBoOC9gug8Ltt/3Ve8Hf
 qOOTpHX8AIt7qVYGGJqZX8uPSlBmL44efAy1osJC/TwrIUnGKPzEZNgAZrPWSlKEMf5Ch28kuRe
 G/ZJ960wDbJ2CPrwfVfrNTEiPdgAZ6nPiE+wJ68znSTe6ZjK0r9oj9peLruQsgVGh5hP4tZceVW
 8iFIcWEbFh+u9iLJNgOfalkRpbfYv1MhBGn5qpCAJqG+KAISSArnEVIOYhuZC+c5Nqk7HUxkCkm
 wk62jKOOdHUY8o/X8UJKrMfaeP6Ck5Uv5eJ4i3Xq+HuqkVho8r1LyqgX9NviDMoLd3pZI2Fz1Ue
 GFe6jHy1Y8F5FAmxPlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260045
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109720-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 850155D0D3A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the device tree bindings for the enhanced video analytics(EVA) clock
controller which is required on Qualcomm Glymur SoC. The controller
provides clocks, resets and power domains for the EVA subsystem.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,glymur-evacc.yaml          | 76 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,glymur-evacc.h      | 38 +++++++++++
 2 files changed, 114 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-evacc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-evacc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..8315e3ce82ecfefb5413ce1c42843adb0bce50d7
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-evacc.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,glymur-evacc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm EVA Clock & Reset Controller on Glymur SoC
+
+maintainers:
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm EVA clock control module which supports the clocks, resets and
+  power domains for the EVA instances on Glymur SoC.
+
+  See also:
+  - include/dt-bindings/clock/qcom,glymur-evacc.h
+
+properties:
+  compatible:
+    const: qcom,glymur-evacc
+
+  clocks:
+    items:
+      - description: Interface clock from GCC
+      - description: Board XO source
+      - description: Board XO_A source
+      - description: Sleep clock source
+
+  power-domains:
+    description:
+      Power domains required for the clock controller to operate
+    items:
+      - description: MMCX power domain
+      - description: MXC power domain
+
+  required-opps:
+    description:
+      Required OPP nodes for the MMCX and MXC power domains.
+    items:
+      - description: MMCX performance point
+      - description: MXC performance point
+
+required:
+  - compatible
+  - clocks
+  - power-domains
+  - required-opps
+  - '#power-domain-cells'
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,glymur-gcc.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    clock-controller@ab00000 {
+        compatible = "qcom,glymur-evacc";
+        reg = <0x0ab00000 0x10000>;
+        clocks = <&gcc GCC_EVA_AHB_CLK>,
+                 <&rpmhcc RPMH_CXO_CLK>,
+                 <&rpmhcc RPMH_CXO_CLK_A>,
+                 <&sleep_clk>;
+        power-domains = <&rpmhpd RPMHPD_MMCX>,
+                        <&rpmhpd RPMHPD_MXC>;
+        required-opps = <&rpmhpd_opp_low_svs>,
+                        <&rpmhpd_opp_low_svs>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,glymur-evacc.h b/include/dt-bindings/clock/qcom,glymur-evacc.h
new file mode 100644
index 0000000000000000000000000000000000000000..35a7b4550351661bdb1f7bdfbeec625fafdfcef7
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,glymur-evacc.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_EVACC_GLYMUR_H
+#define _DT_BINDINGS_CLK_QCOM_EVACC_GLYMUR_H
+
+/* EVA_CC clocks */
+#define EVA_CC_AHB_CLK					0
+#define EVA_CC_AHB_CLK_SRC				1
+#define EVA_CC_MVS0_CLK					2
+#define EVA_CC_MVS0_CLK_SRC				3
+#define EVA_CC_MVS0_DIV_CLK_SRC				4
+#define EVA_CC_MVS0_FREERUN_CLK				5
+#define EVA_CC_MVS0_SHIFT_CLK				6
+#define EVA_CC_MVS0C_CLK				7
+#define EVA_CC_MVS0C_DIV2_DIV_CLK_SRC			8
+#define EVA_CC_MVS0C_FREERUN_CLK			9
+#define EVA_CC_MVS0C_SHIFT_CLK				10
+#define EVA_CC_PLL0					11
+#define EVA_CC_SLEEP_CLK				12
+#define EVA_CC_SLEEP_CLK_SRC				13
+#define EVA_CC_XO_CLK					14
+#define EVA_CC_XO_CLK_SRC				15
+
+/* EVA_CC power domains */
+#define EVA_CC_MVS0_GDSC				0
+#define EVA_CC_MVS0C_GDSC				1
+
+/* EVA_CC resets */
+#define EVA_CC_INTERFACE_BCR				0
+#define EVA_CC_MVS0_BCR					1
+#define EVA_CC_MVS0C_CLK_ARES				2
+#define EVA_CC_MVS0C_BCR				3
+#define EVA_CC_MVS0C_FREERUN_CLK_ARES			4
+
+#endif /* _DT_BINDINGS_CLK_QCOM_EVACC_GLYMUR_H */

-- 
2.34.1


