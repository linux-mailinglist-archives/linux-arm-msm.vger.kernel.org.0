Return-Path: <linux-arm-msm+bounces-49143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EEFA41A4C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 11:10:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 998BA3AFDFE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 10:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE1624E4DC;
	Mon, 24 Feb 2025 10:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SAhEPXfb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0633721CC61;
	Mon, 24 Feb 2025 10:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740391479; cv=none; b=CrnOBSztKkLQ3A1dvCTT2GP51huqRDHxyc9/VyaZAWHplGFS3kmJIwAmkzzi8KVIRTVanuCQAiNUgcqZrmY46vhBlGvlgHoR6RXQwq+k9ElsQFzKZH+y2/7YJJPnK3u3PL+Mu6lx/PiWCsbY8vfwlWxSo5NtAG40MKxln8C+psQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740391479; c=relaxed/simple;
	bh=E3/bczRec9pVtWQMjrcwN0OY2t8jxmlhzoI1LiLYcrM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=loij4nI8tZNCAX1/NcKJu+FcAiLCtS68CBXmomSZruOtdwHqU8pzttOemwjz9nlxgyF97ySkSh8Gz4x3FnECDTQEZf90oxhJXYi5BR/IUcpyzCyGn6eIVLPQKrD8r523wcLs/4sWkFJ9GIXAlLdploC/jZjz7dfyLFHGaNCxC4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SAhEPXfb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51O9sZE9013579;
	Mon, 24 Feb 2025 10:04:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yY+KveWQhVVxqkinHRnvCjBEvaEaLERviV/Vl35aWCk=; b=SAhEPXfbnkRyXgJh
	imBUHXdekZuQERjRHuQUkGtCGTPoD2u1wwiarBWbm/8PbX3QT4OSddn054x2wMBC
	IcxQPMLma/VA/D05kp8ymvkin11ga9Bdf5ER7GjGFVrClax6uE8agV24SMZdGwop
	YhmP4gtwu2EjE9IcZ+Sm/ZZV9g9BshnWPo7sZ5SdRAUZPtjjTSWdTnKoP/JT/bkO
	ekrgZ7WSUypuhFFRJzMJogwUqFirftg09Oxnc/U1ATmivJRK7NuM4iwI7rxhEdr5
	5BOFX6xJgpmuB9BvGW4xTuQxDljVnNkqX/KUzJLyC/Ku+vP+nfph22+EJ4uQJSr+
	ntFC3w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y3xncvf5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 10:04:30 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51OA4TKE022566
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 10:04:29 GMT
Received: from hu-arakshit-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 24 Feb 2025 02:04:25 -0800
From: Abhinaba Rakshit <quic_arakshit@quicinc.com>
Date: Mon, 24 Feb 2025 15:34:10 +0530
Subject: [PATCH 1/2] dt-bindings: crypto: qcom-qce: document QCS615 crypto
 engine
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250224-enable-qce-for-qcs615-v1-1-e7c665347eef@quicinc.com>
References: <20250224-enable-qce-for-qcs615-v1-0-e7c665347eef@quicinc.com>
In-Reply-To: <20250224-enable-qce-for-qcs615-v1-0-e7c665347eef@quicinc.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu
	<herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Abhinaba
 Rakshit" <quic_arakshit@quicinc.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Xh-GENaPM8s2CIFayGKeiB0-tnkjjBXu
X-Proofpoint-GUID: Xh-GENaPM8s2CIFayGKeiB0-tnkjjBXu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_04,2025-02-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=934 bulkscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 clxscore=1011
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502240073

Document the crypto engine on the QCS615 platform.

Signed-off-by: Abhinaba Rakshit <quic_arakshit@quicinc.com>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 3ed56d9d378e38a7ed3f5cd606c4dc20955194f0..acc1eef9d85825d0331db314dd103b8c7a8e2ab3 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -45,6 +45,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,qcs615-qce
               - qcom,qcs8300-qce
               - qcom,sa8775p-qce
               - qcom,sc7280-qce

-- 
2.34.1


