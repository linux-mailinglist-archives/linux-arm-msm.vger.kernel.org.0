Return-Path: <linux-arm-msm+bounces-55702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EE1A9CFEB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:48:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 240D51BC3B88
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 17:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D362E218599;
	Fri, 25 Apr 2025 17:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OoM6afEu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDEB217671
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745603239; cv=none; b=s+esz7mnDNiywWqQ2pOnVi3D6cenDxX/GbPG2jI7g6UGMDiInyFMXAa7tN0XFJ5A9j0P57cUVwS/B/B17Dzo8b2FXNeDIPNm4qCktbNXQQEKci3esAOw9S5uwqsI3V5v9/0Q6MwB+k16Znb50/rkNkkaiw+lQih49tfOpwUspY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745603239; c=relaxed/simple;
	bh=WRG9dHTLQ2jwnkCiRxmgtVZUE3m+6omsipYnyHhT2vg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WnJ133dYRjfTDoN4HJ+OXOOJR/0A6EJ+7UOB6uISfEkQqfDDcIyb6jhEm7IIfAjF1LMLxgghpQXsnZr1AEWoqDvAu5I0IUHkOYBpRvA6y73zuu33Zwo3ljp4RjYGhoGdmTIoec7xyvIKOz/i21soTwJ9SQXyNg65nzgpQSfgQ48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OoM6afEu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJutA024751
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:47:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X5Zt92XUDy5ouQWe6YZM2smr3YjZQjLfBRQBMqLOYPk=; b=OoM6afEuRR4Kz4H1
	5KrmI+gLMaBQ5ITBcMnsNIL/ItyRiR2v9+ft1f4LDy85mxiSM7pHiLvpU/IBx6k7
	2xveUSf1+o8aagk8PvHHSCHX+aY5qUrElYn+9JaNW2q8JA8hQrO3XFoYR+C7PSo1
	CegOi/Gid8aoPMTB8xJlvKvCS1kZj4KolqOOBKLjX3GJKbcs2hQb5/+RS+hNVeAs
	uCND8JdPgeRKClU7Mc9PsjZwX8Jr87wfQ2BTX50Xw5lJgXsBhQj5jByb9YShgkDc
	oeZsV5F72LMFwJYqY1ofXsI/9rLLFar9HVyzvqXOJTiHIjzMlH53+7nawNVTb8jY
	EfqPOA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0srd2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:47:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c9305d29abso438529585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 10:47:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745603236; x=1746208036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X5Zt92XUDy5ouQWe6YZM2smr3YjZQjLfBRQBMqLOYPk=;
        b=TIqddAc375URpZKUqt26I+F7Ag7/uyhdaK+Zqn7pG7ojajRWnwNpk01U3ZoemB4yVB
         4/P1TCIYFr8BhvvW/b8HCQae4deUvH1PlV/VMipBEQxClvd9Azpn2/Vs/HnBzUeG/qpo
         CLkXr3LFNbUQaZnhuDts2f25OdewHLMNwltjuxVERSngUenA9RPaLXI4l12akkAq3thi
         Sb1Wxwb0RnOgu9t5karkmz1mUOYacKFJC2R118vri5Yh/5g+MujqfueZvCEobbmOtqgY
         cvcX8FG6nlhccjBz1UxzkZP2Bg8VdKD0EcO1Zsq/4YkdtnZHoOjyYP5dWMFcpMSIwoyW
         ZYgg==
X-Gm-Message-State: AOJu0Yw1LlwkVt0e5ynjDzHOJCTUEdacG0bOCKLEJnkQKzP5YPzeRQp2
	WL2gqXBx2LKzWloJtssXBzTYnaSD0AwzvQQ29MC3MRT2+JR4d7v6kMggjZNUELmXwWJ4eVUgsMW
	ROjGnH/stMTxt+blVHFoOJgtvtuBJhGFWxgXZ3XFEuCblfOFxM+iEGX6QYGx71rNW
X-Gm-Gg: ASbGncs870KtoxfPaN07i2OKTrgldeyS0wIuoMouGsiFUcnfZkEG/2xyzljpQ+5Xq2C
	KaeBMPbVCs/GtrdIA/eQxj33FfPsLjyb525aZh24W0udrBJGKI/MA7In33j1z9mCuSQ1zl5KMGo
	VrddxOFBv7OO9ehfoeQWcbtHbtMe0YY3jTJirIcG3RRj/hmc1Mv9G+Z++EiyWCRlR5Li924rf/m
	m6i9sLoX78pyWnVSZxVqcEUv00dyG65I2rCaQ6/MEJMhPD3kpMm3oWLf7U9qCfnwJ7MLmUg1GYd
	9VceNi05x/5QSiCvLwDFy+jvtedOoKJDfUw/lQFMJvBfw7ajX5HCTl+IIRC6IZRUDxyDm9ZLBga
	HuA+nYDdJ7tjju/ipdvO7U426
X-Received: by 2002:a05:620a:2b48:b0:7c3:cd78:df43 with SMTP id af79cd13be357-7c9607acbb3mr577619585a.58.1745603236512;
        Fri, 25 Apr 2025 10:47:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXc63YgasBioIfPyv4s4+i+5SA3kwzq74Oh0ca2GCZsKjTjH6+xDOPmc2+pgsugmJAfdYlyg==
X-Received: by 2002:a05:620a:2b48:b0:7c3:cd78:df43 with SMTP id af79cd13be357-7c9607acbb3mr577610985a.58.1745603235745;
        Fri, 25 Apr 2025 10:47:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bd4asm673193e87.84.2025.04.25.10.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:47:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 20:47:04 +0300
Subject: [PATCH v3 04/11] dt-bindings: soc: qcom,rpm: add missing
 clock-controller node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fix-nexus-4-v3-4-da4e39e86d41@oss.qualcomm.com>
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
In-Reply-To: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1206;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WRG9dHTLQ2jwnkCiRxmgtVZUE3m+6omsipYnyHhT2vg=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQwb3qVnBjhOjN1cX+3w9/23Xn69pkQ8NPkfkSe3mub1L+
 X9cRYZUJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmsmM1+1/BgueLbZkWFJT8
 feC4w3nJitqObYpF1zjVRU2a5Gw6N4b0FOU5Z8pk6zYn7DP6bshlpnVCdJ1RwgttdoEW/R6N+wz
 hX9uO7LWaL3s9uugT2xZLNvOsS6YsEnEqypxqz+L/h/1lfc6w22SLlwCrWixDkyxLWFyh3m/Ztc
 FfZ3ewbHJdwbLhoZStQfa6XXfX9V5Uyq2q9NSXZEt6w8ujpDG/c8516aK9Ki9/9/55LVDPfWyZx
 XwGF0HB305LZ7dODN1keeipGnfl6eSCO9kLZwp/6G6x/Zzb3iC655TRNMHWjhL363qh8/+ps+fl
 8bKvWCjQ82cJ/87pNxafdFha/XJNk+jSZ7da/lxwYXAGAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: X1tB0ldEsP2eHuemI-ucFG_z8QbnBqri
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680bcaa5 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=-Z_mRg2wFor0aBS9cE8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: X1tB0ldEsP2eHuemI-ucFG_z8QbnBqri
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNiBTYWx0ZWRfX5M27Dyyyda5v IJ+ZW2++tRL42r8dKJqKrhYq+UfLhAmhNbd3tZ4P6l2d7VWAhLmq9ppFhotOO/wUAdF8PmMTitY NelvSLM2baP74yOOoniBXHIfKhitItFpfonQuWoTbShexF3p/wXgYO+irsk+mu9Tma8W3dlT1zh
 EncrampQFlLfJKrT8BBTOaU9GYBMmNNkZp2sPFYza0AIJ830DY4H/mJooGv2YuIREsY320zx/Su mdLS6+D3WmjcLWwIDi17K0TnuQCGhDbfcrFg0bobY+R2///k1F59YwFexz4YSuSFkH65v1te+0G pHj/gziXo3SNGRGcAykr8Yn77Ht6tuLB1tD+UATs44kUe3psDsxYI1fJlHn7UTz4xPZlzC/cnyr
 RiJRG0vgM0Nz2mUjjMaB/cYylq5/M9l2XPtsx3hgmQHSqaX7xmD9TWsuCcC/oybao15DW7Ez
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250126

On Qualcomm platforms in addition to regulators the RPM also provides
clocks via the child clock-controller node. Describe it properly in the
schema.

Fixes: 872f91b5ea72 ("clk: qcom: Add support for RPM Clocks")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml
index b00be9e01206d1c61802dee9f9ec777c4b946b7b..10956240df0856a4241d6032d3aff7d447af9ce6 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml
@@ -46,6 +46,14 @@ properties:
     description:
       Three entries specifying the outgoing ipc bit used for signaling the RPM.
 
+  clock-controller:
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,rpmcc
+
 patternProperties:
   "^regulators(-[01])?$":
     type: object

-- 
2.39.5


