Return-Path: <linux-arm-msm+bounces-77274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD45CBDC381
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 04:56:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AE611921A8E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 02:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B7B296BDE;
	Wed, 15 Oct 2025 02:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FExM40WF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A243E263F22
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 02:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760496981; cv=none; b=P2SIxU2RKSJUGQoH3rjswpWDr9j/YtCiRCWHqEblPFEOLSlw1eBeLpSB5acVm4Ry/S5LhpS0jbWWW2ATY7E5QkENgWTEq1naNA2it2X/AWPc79DxSNF9v/mSZ/cfD5JnIqMMX+8ej+6tB6fTGmf79Fj4HOFxdlGEr2XZB5mDxcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760496981; c=relaxed/simple;
	bh=XiTtG+qO+1qC4sDF1M/ekkwzg3uVl6NdOygd3cj5Ljs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RmTISKGhCscTFI4tFZ3nmsL9c2LBCuxko9dXqNyZHsnoyKOFnrMizc/ZKud7gfR6V0OWCYdAvvu1abmmDTcv/qHgAot98n1OXrBJRUb+fFRyIr5lrfCUYMvgy8nY4kYZxW/eZ6/CThoSpcjeTAhGY06JbkOaMZCphj/yzolot6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FExM40WF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sSFb015167
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 02:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aJhGwl0+NQVNf0CC7XanGxdHLIYfBFvJpssBFIXoLsA=; b=FExM40WFifCg+RYW
	niLqs05oveRren7c7gFaygxmSzaQsmIwPycTuh4rEDkm5jQ1zOmaVd/qQ3SMr6t1
	DLRTmGPekkDpRlMm3bPEJ71KT1q/ixXxSsrXOoj8o3EcEHqcr4SREhmeUDN7SG5F
	Ez7Demf0Z6Z6OunM7thRDtMycK4XnpmkhKiWgGM5DIkr9HIHMvSHHphAid3Q8wRw
	K540Oj6DUboZ9VoMOJXvGEAT6nGlQaf2hKVro5k433zFbh7skE4ryIw4l75Li96d
	XUTMGUQ7A2pHP13JHbGxsp6dWWn9N9AV6JpZGfBJd9tnjAm2ssGwFnE1bzW9Gkv9
	ERhUYg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbj2u9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 02:56:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-28973df6a90so105015375ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 19:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760496976; x=1761101776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aJhGwl0+NQVNf0CC7XanGxdHLIYfBFvJpssBFIXoLsA=;
        b=LLj7EKT2Wg4S7gNIoWgyFRJPm4O2nQftIlLAomLrMMu1Ns+mSJWEUllE6tInKW733k
         kMmZuZPOtOryBFC0JtUGsJE4OtLt0JCj7ZhPnZY9e9NvEf1BHCRWAvRDr8or6WiK99Hh
         +YSDnvByCJH/YLdo9NdtckrJLa29EwZyQEhayiC4DCcCcSJLdx1b5ZCzQ1O+MJ6in7cm
         ZkROUUwUZ/5ffL9bkbaNtE1CK3DdJphN+7hLY2PlpVkeKcsaiNOlCQ91PZVB163jZQyy
         d/SP8vWvvrKt6K60h0p/+tzdHFjGsIyDqi3owREKLcn4jj7gzdZb5mlySs7cYnObv7oE
         mcMg==
X-Forwarded-Encrypted: i=1; AJvYcCVsOe63CqG5H0KCvC552wIg+iWiQILQtKuukRNErhx4UNqa+wUMrVFJQIFhoAqBLBT2jiMuSzuzc5O+n7I7@vger.kernel.org
X-Gm-Message-State: AOJu0YwpvVBcngO4QCxqJohCaehtOEs1wQU/2X1D2TcI1zvdMzfmUSCd
	274qpZ525eoZgaVUbYOAkY7MCjxGRJ+LLQMwwmzlMdLaI/ppBl2kfjjYCwzX2J9Y5oDYYjrJMW8
	7UpQOTilqhvvUl5TIOmSdikroO++A9Z1ZIYW6Z9qWn9f9z5vw6yB4xO/IF5zkFIM/jIob
X-Gm-Gg: ASbGncuICD3sN3LJBvjovQFOX/BmvzIIz9ABdbS6R7bGe6Tojt5BxkeIoHlg4g+98Mb
	J+Ib3Ymb/T57PrD933NKWkIZ3tu4qPuwc+gKMMIaJiG8NHkr22KJIuBZM099aqQ9jtdmrlu9wAe
	GqlS1gWxNVU9nwnbxDUlPpg2Zvgtqt6MrUVLY5Dv0Fr1lUtUKPqOutXkvZFQfPD/q/wAKNbGG1M
	kHrlpGUaq/THw1/0Jr19hUkoqc2eyfMLewdmnj3+GZ8AeFOYZ644jGqduZbNnntHRVbdwadbYNZ
	aFIlNeLF+pFrmurC1/dNm7n7v1Mi5taHLpYBC2tSowsJYHXJL6NFmGPz+fLw+GbLl63nwEpovQC
	cf2wyC2PFBd4YAtDiWz0=
X-Received: by 2002:a17:903:2349:b0:290:56e7:8ca9 with SMTP id d9443c01a7336-29056e79048mr161148385ad.52.1760496976256;
        Tue, 14 Oct 2025 19:56:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJRTQ6zDYzFTd5M3LyFSpDAWS/PGQqXDN7RRKhxdpQPmV5rFDp/Fh2Y5nh1Wx3dPb/vjxm5Q==
X-Received: by 2002:a17:903:2349:b0:290:56e7:8ca9 with SMTP id d9443c01a7336-29056e79048mr161147975ad.52.1760496975823;
        Tue, 14 Oct 2025 19:56:15 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de54d2sm179122855ad.12.2025.10.14.19.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 19:56:15 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 19:56:01 -0700
Subject: [PATCH v2 1/6] dt-bindings: i2c: qcom-cci: Document Kaanapali
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-add-support-for-camss-on-kaanapali-v2-1-f5745ba2dff9@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
In-Reply-To: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX9JP8XTexLqQ7
 v72apsmUmjnU+LVRWzcS8abLCXssvlZGCkVnwK8bodJn/H35CNa9udKV/x10BeIj2pVVMbsUhku
 nYnBfKqinqxxtJQ5v2y/UFpun0usoikLEskOn1SUB0Cz9pkxb4hZ5GemeJsScIsdzKXEER/Bx09
 jDX7R5BfJ1MYSr2tqtRuruRipPndNs44ai7zrHfw2NfgkFQV0np72QZkqk8hDmqjSDG8KRuMV61
 3vsblXUSQjSKPV3D4nhYNiaEc+mKEZYhaq+IOrcSW2SZ22hDvZVcrLMgXUvGKBkuE0VEVo34gww
 KN/KeW3oOv1qIxgTH7Ee6YD8Z7DNTsPbtOyageJaLIs6weJzLkun78qegYP0KRqIv2kqZFnnoGe
 95kKqbD0x85/Br425r4S42xBD5uQwg==
X-Proofpoint-ORIG-GUID: 26SClW5mgXKM6UwvIpyrSlFlc86wP0cG
X-Authority-Analysis: v=2.4 cv=bodBxUai c=1 sm=1 tr=0 ts=68ef0d51 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=mZPZtqNPFm0sPOGUM0AA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 26SClW5mgXKM6UwvIpyrSlFlc86wP0cG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018

Add Kaanapali compatible consistent with CAMSS CCI interfaces. The list
of clocks for Kaanapali requires its own compat string 'cam_top_ahb',
aggregated into 'qcom,qcm2290-cci' node.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 9bc99d736343..0140c423f6f4 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -25,6 +25,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,kaanapali-cci
               - qcom,qcm2290-cci
               - qcom,sa8775p-cci
               - qcom,sc7280-cci
@@ -128,6 +129,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-cci
               - qcom,qcm2290-cci
     then:
       properties:
@@ -136,7 +138,9 @@ allOf:
           maxItems: 2
         clock-names:
           items:
-            - const: ahb
+            - enum:
+                - ahb
+                - cam_top_ahb
             - const: cci
 
   - if:

-- 
2.34.1


