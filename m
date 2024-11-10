Return-Path: <linux-arm-msm+bounces-37423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EB79C32E3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 15:54:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAD711F21305
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 14:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7834B52F88;
	Sun, 10 Nov 2024 14:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LQ1oPXiC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C863A8D0;
	Sun, 10 Nov 2024 14:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731250431; cv=none; b=kxVGbYz5+u4mSzAcFzB3pqwP5WshQJl4aZ+3Ag/CltKqkydpjquWhoG63lp/Jk6QJuZHQ9uC4mCoyPVRPomo3fe+Iringyic8L3iGf4g634fhIL8oTgYsW4RdqM0KvuC3mIOBdfy0aeY3Lw/ctKXe7E2iuLAMaZGzJ1oieOEKKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731250431; c=relaxed/simple;
	bh=sOhF4OdGf2qysT+uhqF9EFGm5ivLhu+l7RHQQRVurjU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=otjiQu9Uf67XcOjeIXtESkXP0g4PWwgGlx/0J9rQUOKvLKL+g2KheDokSMTPFtKfssBkb+I1Be7FGRtHgoiGTm1fUvr7TfRTWfEq0L/vxy4dR6JDEoI/H+S5j68WVQO6Xeut1gyct2NizPNceB87aRvfFyE7WJ8im+wu7D5VCNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LQ1oPXiC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AACuuae018717;
	Sun, 10 Nov 2024 14:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5AQ1J0Xe3i/
	GMXWeYPElciuQ5BIbFN9I5BcwAp4pX9U=; b=LQ1oPXiCtitRyWSQgXnsw8GTdAU
	58scTVhNBiDsFSPjlRfew2/wOk7rv9lbahNQFZvA7ATl3B2oW2Sq7UAkTmb/LFqa
	UOITTsXgitCKXY4aTPqd0PNeijSUPjYbw8xzW7fd54ivFZuyfVa4lz7yRWFzMg7C
	n7eV8HOZ+wrpIrEsurzyisOgGbcBnyC5I8Ii880pzeho/pqjAIeWVdDmLWusvJnp
	S7XRTdhJyG4hmemK5wh0+eSiRad5mMQTPh/CRIsD4Zb6tRNEdM61Tf2SpvSCu/ue
	RBO9BkXg8qa9/DdPcc6Kgt1J1C1c8xuTtRhM8fQzkf0yoRbfS0Oew/rfdsw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42t0gkt4yr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 10 Nov 2024 14:53:46 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AAErhYJ019250;
	Sun, 10 Nov 2024 14:53:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 42t0tkewgy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 10 Nov 2024 14:53:43 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4AAErhd2019224;
	Sun, 10 Nov 2024 14:53:43 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4AAErhiW019219
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 10 Nov 2024 14:53:43 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 3C4253CA; Sun, 10 Nov 2024 20:23:42 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH 1/5] dt-bindings: arm: qcom,ids: add SoC ID for QCS9075
Date: Sun, 10 Nov 2024 20:23:35 +0530
Message-ID: <20241110145339.3635437-2-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241110145339.3635437-1-quic_wasimn@quicinc.com>
References: <20241110145339.3635437-1-quic_wasimn@quicinc.com>
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
X-Proofpoint-ORIG-GUID: fEqKwUWBylchCEpUtNN41MKMRncn9p0v
X-Proofpoint-GUID: fEqKwUWBylchCEpUtNN41MKMRncn9p0v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 clxscore=1015 mlxscore=0 mlxlogscore=810 lowpriorityscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411100133

Add the unique ID for Qualcomm QCS9075 SoC.
This value is used to differentiate the SoC across qcom targets.

Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index e850dc3a1ad3..1b3e0176dcb7 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -284,6 +284,7 @@
 #define QCOM_ID_QCS9100			667
 #define QCOM_ID_QCS8300			674
 #define QCOM_ID_QCS8275			675
+#define QCOM_ID_QCS9075			676
 #define QCOM_ID_QCS615			680

 /*
--
2.47.0


