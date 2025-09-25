Return-Path: <linux-arm-msm+bounces-74806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A96D7B9CC73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:03:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 052832E24AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 00:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B4B8287E;
	Thu, 25 Sep 2025 00:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GlYZhEI3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB73C4400
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758758581; cv=none; b=fvJtLyL3r3gpOwoE75Z04G3Y4e+rPxHdcnK2ZT5mvG5r62vUg8mygplHBHec4KnamW1GJo2KQCX4hgtFbV97XLvrCgiKdq/nuesQJSnsCTOsi8dYHDnzYrryuOwPhYdIbzphKkSpO9Xdp5hSk8goo1VvtWiIxpzHd7L3PFEjMTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758758581; c=relaxed/simple;
	bh=K2mUDJXRZv+9+neVDLWp4StQfNo9IAdiHfJqlB/hRI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g+8NYwtD/6u0a+/kAOGrdV3mW3P2p9XGyqtR+xrC4KpXBHiWQaMQvium7jJBzbTtGK1zvDO9VOslJvSclCgP3uizLqVWqTeF8nJhaIVn0lXGX8g/Yir3xo+SUy1B/QBhuvX/oztfl6s82lbdF+HEY+P8EHcDAoKH9TRK9GhjZIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GlYZhEI3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OD4ZjY017453
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q4OBEzR87oFsou54VovKNGgttpO9q+7QSRhhR2iSBns=; b=GlYZhEI3/un0+yt6
	3sVafURjzYYKuUyRoCOOxfPU8j6WS2hlJKW+i/xczYuOlLFB3BTY03Z0/eXM2DKJ
	GHl+1/18ff9kLhXvh/baKJzhg3tstqIW9NOQTS+WfXMlxEeosmf+rNUPcHHMIjtl
	cJkQEG/Z2BXOTG+2GcAeRA2N72Bu94ZW4YHdQ0XFOp4k8Cs9Bljlnm7qXG/oNDX2
	rOgjeIU56R/PMLnXubAPCOZ6Iz3yzZCjOw5bfkZehHahe1O/3q6Yx6lqLpVJ0Pc8
	DHFZADrarVnYlkdwzW6IKqZZ+BkKzbmC6JWpIa5l7yJQYhxBMgUPK52ibfxq7VOk
	hLkSRA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvjyerb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:02:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32eaeba9abaso605902a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:02:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758758578; x=1759363378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q4OBEzR87oFsou54VovKNGgttpO9q+7QSRhhR2iSBns=;
        b=Dpv2Uyhvxj0ItaqAUUe9ePwpePeoj5SzeHf8FDC2j541IVrNWIM8BcX7AIq4pI/i+1
         4X8ExWEwEUCN2LffWBjnzQc7CRltgkuSgsvqPl6IuOxnPHdPLl4TFFTDXrPcyMi8mKPc
         o60+3uerR5lddmKeNYZ3QO6JF1MAU3UQT/baBbPXC+TP/ZyjYrhIsb2FECYdOdfmV4/Y
         C+NmNbFP9u+mRxlKzdVwR94ReiAUdUA1p8e7jUPXvF7R7CZ9kDBOiL7iQnui0/cEW0xh
         pDGD1VriBWYk62ofInio5m5Tkr4kiSLYV7pjROimjHrteyWIyQWWBzlCqZAajyJyh5Or
         2NEA==
X-Forwarded-Encrypted: i=1; AJvYcCUtjxiiHebHPi50hR6yt15YrSQen+xCRZtuTTqObY8GLX8KohbHx/wORCpdLiRoPWX9+68JEUZhVkzipTsY@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv8NKTS77qiI4qK7fvVtffwphgSyNM1edchrnaP2qQDJVIZaBh
	f5G0cAgpmOF3GC2se6zaTo0hFC0iYMwIta1TBOHYiLOuOGbNjkzPFMpOjrckCSJzON99JdbcDwG
	nbf+x6Sl9N2v3jp7DhevgJc3mkC8tSxjsq6GH5vX73iouq+zCxJEq1uKfreM9F4LsaAxJ
X-Gm-Gg: ASbGnct5kQzJY+LF94VYuVVGKYSirhfIq12YIZ91sR5W/pgSrjt+2hrx6croTQJDuHq
	2fLd7ZNki6H99ZPjZ8Pp2MDsgjLtxYYwz13HdPBo1BPoG5pXjpTXdzpF37g7XhTX3L2/yx2sE9u
	d26Dlq2VNb+DoSrMGmBNSkJ5ejMc64Bxb1is+hH/kap9m0EqFa+Do/9Nn7ZkOb21UfioeacJeHF
	RA4G9DwrA7G7HTBgFSZ4cYdmimoIL7Kx9fdOAkw9fLvxJq8I/xjHM823EAyGQPVHleZe7vWtoAH
	+Hgxfk9d21csJqAiEHB7QZvv8Ulm6+QOy52JvnKQgUR2Duy8DAw7yB0xNTBbxMKgX4S/Koo2J91
	duecFUEClipRg5fw=
X-Received: by 2002:a17:903:38cd:b0:27e:d4a8:56ad with SMTP id d9443c01a7336-27ed4a85a82mr15084485ad.61.1758758578179;
        Wed, 24 Sep 2025 17:02:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzjJDR1kYcH4sQH3cYrBVjWXozwj8iO3NzKQVXwBx6AN0+o+X6+UwyN0HdpPfs0t5yyVWI+w==
X-Received: by 2002:a17:903:38cd:b0:27e:d4a8:56ad with SMTP id d9443c01a7336-27ed4a85a82mr15083975ad.61.1758758577445;
        Wed, 24 Sep 2025 17:02:57 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6715f0esm4807215ad.52.2025.09.24.17.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:02:57 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 17:02:48 -0700
Subject: [PATCH 1/6] dt-bindings: i2c: qcom-cci: Document Kaanapali
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-cam-v1-1-b72d6deea054@oss.qualcomm.com>
References: <20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com>
In-Reply-To: <20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758758574; l=1486;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=SnKFLRNYosTxuqZVX+B0aQPl8RyL1Uf+UAocMiXuIuA=;
 b=sygufknQTjfr3CN/gzxxSYpzHqiUEqe2z6cQAJeRpI62jPUmwGqLOqCZ4lU5kQpOX8jV1Zgk6
 I/2lCxstBxCAPrx+cOrLKhy78j8eeMhO4V5GWgSZUOsiJAAUqd+018Q
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: 1rqKxeshDwiqIYETCC_YWaiW1Dj5iXt6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfXxRPZfcIE1gro
 GiHKops5pOpF06S06Cw5Cdu1+DZtuZM1VXvizAXox6qdqMKAhOHPgngndEpht/LRNsn69AgNqcA
 CSafdBJsid5GgZR/YAbPcFYqAhxqlKwxOczQK/46cG0XNnZeH0vjkig6zgQ2AaZf5EFAHszXdu4
 c8fyqeomN2yZ3+TF3ut1EBP8DNMVVBI8zKa8tBhQJZhMIk66+bNEkcV2xJ4BF+rCaEP2cAI6+en
 NHZb1PX4piOyrisModuiTkB/ATkOj2o+J2V+95vjcmez+GH/3m8yVX0wvgHlcHBMZ4T8C5dlaPA
 sqAjq9qeYxDiMGOY3f/L8teXVOfS0VQup0VTCB4KJxIHOYJ1p4Delde2nrLBorcK1BOuKDeYXdC
 pePdVGu1
X-Proofpoint-GUID: 1rqKxeshDwiqIYETCC_YWaiW1Dj5iXt6
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d486b3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=MM0Ubo5ZH5qwHtlmS8kA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Add Kaanapali compatible consistent with CAMSS CCI interfaces. The list
of clocks for Kaanapali requires its own compat string and definition.
This changes the minimum number of `clocks` and `clock-names`.

- const: cam_top_ahb
- const: cci

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 9bc99d736343..85a1c9738afe 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -25,6 +25,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,kaanapali-cci
               - qcom,qcm2290-cci
               - qcom,sa8775p-cci
               - qcom,sc7280-cci
@@ -257,6 +258,22 @@ allOf:
             - const: cpas_ahb
             - const: cci
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,kaanapali-cci
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: cam_top_ahb
+            - const: cci
+
 additionalProperties: false
 
 examples:

-- 
2.25.1


