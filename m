Return-Path: <linux-arm-msm+bounces-65117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C311B06AA4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 02:40:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7FB91747D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 00:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BA08405F7;
	Wed, 16 Jul 2025 00:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ivJzNZCW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52CC8635D
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 00:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752626420; cv=none; b=PDpSxMK2KotLm+L9gyCILkvJYCTXdxBiJkwGn3710SW0WWr66hRJSyusUa7AIq2erhsxKIhpB3Z8Or7QMeb+lqOit55znSKYLcsaTzo7wbdFDvXcWnlW2dBHBFtG0QzrN4CCVbzL4OFd67f6c9m1PpG86t6C47TspQzvUh11L0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752626420; c=relaxed/simple;
	bh=DmMC5bCJ9CWUiX4p10MCxK/dY96FoqUa8x52jrnCqLE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nfQlrhZ5Sb99b23+6rr+YeEi+YFNCrwTlUGIfnvb5aLhlCRCw835+ImZwQAlxQId1K36wrvY9uRxIHPkGd/340SUI8UhKgwjAb0OaqZVFpybdzVvf1HQkPk9Shy4I88QtJ0Thtvi2Bivcc9gGQvXw3mscHxBLhtp60B0aUskbO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ivJzNZCW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDLqt024984
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 00:40:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GCF416+VOtu
	BXP/dynqOe3kMJwo5Rxbt8eiqcDIlK5I=; b=ivJzNZCWSFYVYHZkhoM1WbpWeAg
	zEExV7vyf094wYQwoPs8Y23OEIH/euhDNXJUwuRD/L2BtMdERS2ePlkbFawZJOvR
	yl8txOkn0kLGSrH2ovYu5nxaNLhM282ySKONsxGXmUN/adfrlf02e4j5qX7PfRhS
	uDNJIpjtsYPnW/jPS44QantUn7qbsvBicao3ZL3kzrQbDqoaDO02Li3p9Qu67ECE
	v/ipWlUnhnHtQdCPZWOYL/1gt5F+s8NVYo4/Yv8K8/jHqu3RmZVFDJwsGl38FurX
	BmtugrM6zQA+kIwYhZ123GKAiUeMwZ+AUXafeHB5gcNxPymoBlz6UjqusSw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w58ymun6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 00:40:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23824a9bc29so79488105ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 17:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752626408; x=1753231208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GCF416+VOtuBXP/dynqOe3kMJwo5Rxbt8eiqcDIlK5I=;
        b=L/rlBQbsLSaqdRqAZoxrE2hYJPFnjwdnbH8kdjz4NX4i93XSBJLxPY0vEo1Okfkk8C
         CpaWFzNnaiL492bcOcCEKI76cwnn/nvY6A1nRITw/J1tMWmtnmzW6BTaWR07tfhino3H
         lACK4KPn71b1XD7MHJhN4ktUlGN2vTRBOGTF+Y41mPoxBaFzZOTuoxtoo2nfD+mTSKLT
         XtJR2fZlDLVv1+XvbcezSne9O6HxLWirzlDcIYeopVufG/lZVSgWCt1NTr/4I/E8pu3Z
         uL1E31kMt4uFjjKOwsKZeq0dCsSL+DV5/XEvorQJhY60Lpxk07ytOykNa8O4+VtT14Cu
         HwUQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2uTv8s8plwQQ5QsDxpj+O5E9aFTJ4wmitFNoDNrQbsftLJ733dR2uUYnULeWtZ4J5IMi63R1R8lyW6ncF@vger.kernel.org
X-Gm-Message-State: AOJu0YxUJKebeaRcIzkKe5jN9omL8vfew/eXMshq3WOZ1dKf18AI6YGK
	KsedcVSEh0wZsDGSWikqgfdDMruqxBymmxBE57HRH9Yd13iKTitCxZcMoPzMxisDrhRju9FBkeb
	vP/mb7VJWMRfIuPgEjmafktZgrRt0B3lwoWNVmkYpHca53U5ZakAtUqSJqNn3Pi13bslg
X-Gm-Gg: ASbGnctihowVu1WG7Izbrz35Kkh1E7Nfcc5Jgebad8b/IBOnYXG36rrFRK0U7WxEl0M
	JSdZK+74vD+zreaZFTcvF2iewIp4iEc+yWzdxHBTh+2Fgosi/6ECpTEx4XwWTh1+ogl1U7hNW45
	55yfGELFeuMDTCwi0cj5ilqZK9QED56OlFRgfORqr9e6Zx1SpAyM1lwmdcRv0AifzNzO2tPvjkg
	zVhu7TMPSJeYLThCQ0zLHRcJ5n143AVy3xBioeUbs7pkkpstbK4IeUeuGm2s81n44N4s634boeS
	qPPB9/CTooefTusWG21fqdaEwzMnQMPx9WIPtb+9iKbONmtCG1AACnPPHPCF/9eJyokKGQ9JBYF
	UDFT/gfEC9wtnyZ9zgUHjIR8xWdw=
X-Received: by 2002:a17:902:ef45:b0:223:619e:71da with SMTP id d9443c01a7336-23e2579d9e0mr11121705ad.49.1752626407752;
        Tue, 15 Jul 2025 17:40:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZqyh5zhn7aZGpW6wWxn9yXi7t+g6XSOjNdJRS6cnNteJ4YgcV0/RNZrkd+8/jUrZRoleGmg==
X-Received: by 2002:a17:902:ef45:b0:223:619e:71da with SMTP id d9443c01a7336-23e2579d9e0mr11121395ad.49.1752626407364;
        Tue, 15 Jul 2025 17:40:07 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42aeadcsm117015525ad.78.2025.07.15.17.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 17:40:06 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Add qcom,subsys-restart property
Date: Tue, 15 Jul 2025 17:40:03 -0700
Message-Id: <20250716004004.311001-2-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716004004.311001-1-anjelique.melendez@oss.qualcomm.com>
References: <20250716004004.311001-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDAwNCBTYWx0ZWRfX8FWFmU6zr3KO
 AP40iZnBl3HYUuFwBbKym1BN7xSHiHNJoYl5R95Klw+KBSJNJFFUUwnBhH7RxuJFuT2X1jPDm4m
 u1o9FYL9WTwk5pNY/KhM9QkeYbjRKa6UiNCT+wB/t5ayds/8nWt/sVIsf1ukKuh/1Qd8C8/W8ZF
 kjWL82rIrgNai13mKTOyZCLygC1c9KejMdjeny+OE0vXIvp9GEzZ+MGinj9TCI3/4QJ8Ly5PmpO
 l7l1kSrfEVg/2PqeCf9cvGlR/Da/NorbVv7d+TqlIKhYi2bWp1LA7O4PswILqZYghMHcPWyETrW
 AzaL9muNXURYl0BiicPfHTg2nM6vgphJ+iZG0D7isMVDgGhn+Gi5f7pgxa0ZW2pbzk6ahzx1599
 4BARlm3pWFMFyNWFQ4yBSFp3d+ABAhNiO025VQcHN2aJFnP64e1iX4paquyOGxMF+1XIhRrq
X-Proofpoint-GUID: zdm_4wb_u7E3-XFF3TxN1mVlD4KwzfVX
X-Proofpoint-ORIG-GUID: zdm_4wb_u7E3-XFF3TxN1mVlD4KwzfVX
X-Authority-Analysis: v=2.4 cv=Or9Pyz/t c=1 sm=1 tr=0 ts=6876f4f0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=EnJsE7tHsB2WQhtf5zMA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_05,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160004

Add new "qcom,subsys-restart" property to enable subsystem restart (SSR)
notifications.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 .../devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index 4c9e78f29523..90011096894e 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -49,6 +49,10 @@ properties:
   '#size-cells':
     const: 0
 
+  qcom,subsys-restart:
+    description: If property is specified subsystem restart (SSR) notifications will be enabled.
+    type: boolean
+
   orientation-gpios:
     description: Array of input gpios for the Type-C connector orientation indication.
       The GPIO indication is used to detect the orientation of the Type-C connector.
-- 
2.34.1


