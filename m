Return-Path: <linux-arm-msm+bounces-59695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF143AC6942
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 14:28:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 851A41BA072E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 12:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86E228541C;
	Wed, 28 May 2025 12:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ieqvz6wb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB01284B49;
	Wed, 28 May 2025 12:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748435284; cv=none; b=rZhGIrP5G9WwJfJZWenqJxfmqfgwNY+VEWNhbkuKtVLEEKo9M9mJ/UYXv2jfR+fkMa67UXazf7KgCWuvCnX1c1odO4/pUE4JhYStdIa+Nbjn6ZPalmxKcDDPtKOIoogj0+33JRmEW198E5gTNgktuhuoGTs8KuVSd13xn54a1u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748435284; c=relaxed/simple;
	bh=3/iyTvhEMTGEUUPhFMVqWrDj8NKTUF7gusSq9rogfis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lkeapdOB0IVZbGuEO8S2RwWudQdk+2EAM5nuM/DkFkULztdN4zG40qEDhICRRCF1Gji0/be2LW+ohvPJkPTyFdUNTbc1reEPtjtEgptTycuaNYflhgW3Cv0bVNFw0lFi7qfWBw2QWEX1daqvPv0RF+8Z/UP6ucq6QGsCvq6SyoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ieqvz6wb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S57q81027808;
	Wed, 28 May 2025 12:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=L4k5BIhgS5A
	7asZ5jZXlR/tV7TYlPcMkxSEcntis13A=; b=ieqvz6wb0maJAUEeMQIPr2ra7cQ
	zbvmXwxHr5QOXFmAsP00xV79QR7F/38uAlTvwfEtozuLmoAv6eoPSxwcgF/NdIb/
	FfUpYMyLwHpfesU4ZWmzP9+q+nAL9oFeh0umF6uVxg50AlbkryVtrEyaCn5GyRGv
	wNaJ0DKd5Osje4rNWM6wSUwmQFyUMYd7DFw92DEYQhca0LI4ftMd+u/1oUTtFhOO
	DwcAhHAl1l4LYoNnsVDC5s6pIgVwcSsgkW68FdklgwbZ4v/DwSzUrnrbIs55YA0j
	rGZkipeDRFJPSV1a4kc4ZbZTJgDyJG6aCuPtsnXduDMS882pmGA9zxVFJEA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992m7fk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 12:28:00 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54SCRuxS011492;
	Wed, 28 May 2025 12:27:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46u76mxk35-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 12:27:56 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54SCRttI011459;
	Wed, 28 May 2025 12:27:56 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 54SCRtXC011456
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 12:27:55 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id DF84B4B8; Wed, 28 May 2025 17:57:54 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        kernel@oss.qualcomm.com, Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH v8 1/4] dt-bindings: arm: qcom: Add bindings for QCS9075 SOC based board
Date: Wed, 28 May 2025 17:57:48 +0530
Message-ID: <20250528122753.3623570-2-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528122753.3623570-1-quic_wasimn@quicinc.com>
References: <20250528122753.3623570-1-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEwNyBTYWx0ZWRfX7QNJbNgqZWti
 zLA48iI40KmmX2uvnacD0IamZzAV/KRDXGIswKXOP0vb26vKBcI8JmPpzjTViZiqcMEyvizmQsM
 C/7grsGul915CDmAE5KtYIAFVOpWDTT2k8TIid7ERLWIAshh3k5MEgrMTxM3Ow4oJ5IVRazqUCP
 H2wPeXOUDJOzl+2RYBdIPIPr8CZonqlls6oBMoFJRtyAMyo3tPmpG5YK3VGaejLsY8IwgaHpoeW
 /oV+YezLRkfc1WL9pnRf/0ykbQ73Bng36GJfyY5fT+mVCEmavM/MwudlkvZppSXynv5rCuVQIu/
 DC6u1wVHys8lwIhIunvVF6uQ/+DpPQ82HC8o9hh/TNwlwPyk07x6m01Y/uGQjNClDE5+hxjx4PA
 bsxRFhiNEDQ5Y0Ta75i3+oDg/f3ILoQd4a8e2knu+avE+wGBp0o76cPx4sZeC3oNJjY4q3if
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=68370150 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=htuHtO1j-8kfaUu6lmQA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: dJD2LJdI8JiFmtBAhtbu3Jt6UHx8xCgj
X-Proofpoint-ORIG-GUID: dJD2LJdI8JiFmtBAhtbu3Jt6UHx8xCgj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280107

QCS9075 is compatible Industrial-IOT grade variant of SA8775p SOC.
Unlike QCS9100, it doesn't have safety monitoring feature of
Safety-Island(SAIL) subsystem, which affects thermal management.

qcs9075-iq-9075-evk board is based on QCS9075 SOC.

Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 56f78f0f3803..3b2c60af12cd 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -58,6 +58,7 @@ description: |
         qcs8550
         qcm2290
         qcm6490
+        qcs9075
         qcs9100
         qdu1000
         qrb2210
@@ -961,6 +962,12 @@ properties:
               - qcom,sa8775p-ride-r3
           - const: qcom,sa8775p

+      - items:
+          - enum:
+              - qcom,qcs9075-iq-9075-evk
+          - const: qcom,qcs9075
+          - const: qcom,sa8775p
+
       - items:
           - enum:
               - qcom,qcs9100-ride
--
2.49.0


