Return-Path: <linux-arm-msm+bounces-46923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D878DA28511
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 08:48:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 919E1168075
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 07:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F077C229B0B;
	Wed,  5 Feb 2025 07:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SxVNKyd0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF71228CA6;
	Wed,  5 Feb 2025 07:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738741679; cv=none; b=pZmXOXI2vs3lpvvhAuwwPb2Zd4DoNtas9fwr3GeTBt7wsdWmnyIx2wJAcIqmUdar1wKkECx+foJ72Z88Zv2P8cEcsQuvh3XfJVNk6ycqPUm8FnmmmCraLCYTtJlkbHraB0Sa9IHmXGkt8NY8QXuBmKu5VvopNy3a9zRXkV079f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738741679; c=relaxed/simple;
	bh=o88vN75r/CCchZ1ZgARyFWNKshBMUCiRaIzui97yu+s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KeXtiLAqgazj9TgXYfA97eCTJ1EKxSZ32fLW3Gpl0D8g8fvvEqiCYKTjWQ3X5BiMbcyf/zRCo2Gux5YZiNv1Wc1j+IeESqFYzhYCXorTTLMieyrucTCTGE8i31AuWfIJrFt1k/unVs4y6OO+YslfLI6ISTXo8srncejIVYQjvLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SxVNKyd0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5156pTl2018072;
	Wed, 5 Feb 2025 07:47:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EqjBNpcOcQyoZAU5Cc3pyFMNDW6+e2lGvh4SKtFvV1M=; b=SxVNKyd0QwlyX4gh
	7X9IjS6RgrCPTA1HsiwsD7f2DU4hqFUwWobM9vh8IN1RCx15esOkimiq/4AVeZYY
	k3sUuJAjdelZhkiPpAQQgXHON2vU/n7B/yYWvqID51qXJO2Lqy7Cqb5n39g3be0j
	WXg5mSdmSDqeKR7yndBfijkxnierPhRYvUQq5quJa7I6JALsRtAxbFNKqqeZDK+X
	qYCbu0G+IFsdOZgf3XdunMXwyWA1iypYU3AVevZV2Y81sre/Dr/uF25kBbgL53u9
	fdoULXu4RYNFtahpRrZDouEG7HEBnYSgMsrTpzmfutVmo4QTeQVsRb+5ickSZPFj
	0D1hNg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44m33b83sb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 07:47:54 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5157lrJ5010635
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Feb 2025 07:47:53 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 4 Feb 2025 23:47:49 -0800
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <agross@kernel.org>,
        <quic_varada@quicinc.com>, <dmitry.baryshkov@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <stable@vger.kernel.org>
Subject: [PATCH v1 1/2] regulator: qcom_smd: Add l2, l5 sub-node to mp5496 regulator
Date: Wed, 5 Feb 2025 13:16:56 +0530
Message-ID: <20250205074657.4142365-2-quic_varada@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205074657.4142365-1-quic_varada@quicinc.com>
References: <20250205074657.4142365-1-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -k2OSWfKOiHigzS0jgnYGDwJZbSU3N5t
X-Proofpoint-ORIG-GUID: -k2OSWfKOiHigzS0jgnYGDwJZbSU3N5t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_03,2025-02-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 spamscore=0 mlxlogscore=999 clxscore=1011 impostorscore=0
 mlxscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502050061

Adding l2, l5 sub-node entry to mp5496 regulator node.

Cc: stable@vger.kernel.org
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
---
 .../devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
index f2fd2df68a9e..b7241ce975b9 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
@@ -22,7 +22,7 @@ description:
   Each sub-node is identified using the node's name, with valid values listed
   for each of the pmics below.
 
-  For mp5496, s1, s2
+  For mp5496, s1, s2, l2, l5
 
   For pm2250, s1, s2, s3, s4, l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11,
   l12, l13, l14, l15, l16, l17, l18, l19, l20, l21, l22
-- 
2.34.1


