Return-Path: <linux-arm-msm+bounces-41995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 157E49F0B2E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 12:33:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9F6C283439
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 11:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A777D1DF746;
	Fri, 13 Dec 2024 11:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TRnRSefN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177BE1DF73E;
	Fri, 13 Dec 2024 11:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734089535; cv=none; b=Ptusi35p0eoSgZhVT/C0CX3v9TNaoXk3PL/I7MHoLvf6RRxrlTMdpQJSsCtPmVXt3Fdn2vb914lAZfqYgx1LOcrpBcATOf5MlhzMpO6G9FpcAw0pawSfYLJjwi8ADQSD3JcDSjZvuGLIfpfDhVZFZq9dYMN4+m2V3nTSAcG3Trw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734089535; c=relaxed/simple;
	bh=yeaxZrYdaOTOpNHVq8bjujPs9vAsZy7cwCYfZhxNsJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=c9Ba107JujkwkKieSq8YRlVteJd/PyUZ4fyV/riKW0Ix9JeNmk5nyUpXFor2rM08i44O/ZCHMSRr58Qyvj7vcgJ2Q3JpJOi2jDzeDsqIHoaWqzw6YlsuOjkGWJuTDWiHjDYuluDhJBP7WBcKpFxdOoIjymMChKMZnu3yWKna1W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TRnRSefN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD3AUgi000455;
	Fri, 13 Dec 2024 11:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bqy3hs8iwJjeDnuwjJPIJEFH6pYhkcIx8l5rF9hIiQk=; b=TRnRSefNvWAcT7z/
	8hzQ4ROC+fuhFhbQ14VQwA9dpfc/qgdIXZNOXUlL5cGSj5dFfCZ6M/+nwgd093+H
	zOVrksIULOAVZRfFLA1oWANz7qNboEGvuS4gr1i+sSXM7vZ9kms2uaST3qaY539f
	v/O1dqe3f+QRHCN2yWkV5PL7D8GIs/cSwkIQ7Wj9MEQLoseCBdaaXuOI+yAf2a9N
	ruqPDSHc1kjqmIPdzg3GyBJd8dEhMu+4Wva7KVodPmtvWLiKwG4alBnf61gYi+jx
	RjgjcZvgVE6Y10EgHKRGM0y7cUYbUSAOhyg3yg3/nKsuR8Rn30IOVGB4iTkP9WMP
	MJwTEg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fqes4np0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 11:32:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDBW2VI021690
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 11:32:02 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 03:31:56 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Fri, 13 Dec 2024 17:01:06 +0530
Subject: [PATCH RESEND v2 4/4] arm64: dts: qcom: qcs615-ride: Enable Adreno
 612 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241213-qcs615-gpu-dt-v2-4-47f3b312b178@quicinc.com>
References: <20241213-qcs615-gpu-dt-v2-0-47f3b312b178@quicinc.com>
In-Reply-To: <20241213-qcs615-gpu-dt-v2-0-47f3b312b178@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Jie Zhang <quic_jiezh@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734089491; l=794;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=WVPlTu1mXemQex8P1nO+oMx853feO0ljqEJzQorcVnk=;
 b=s3fLPm6nuHG/eaiNm6GaT8MzTMvyCBOtkUb2sCeYcOduuc8juGrcowkMLsBPI6TNZRD2ApQ4Y
 npPVCSVjSb2Dngq6DSRvJKpIa27q/6Hq3qXvUH8YHriUgaOrsZz/T/1
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cOfpmwXPLCKaD6x_SaQvcqUWJYgm-dl8
X-Proofpoint-ORIG-GUID: cOfpmwXPLCKaD6x_SaQvcqUWJYgm-dl8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=971 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130080

From: Jie Zhang <quic_jiezh@quicinc.com>

Enable GPU for qcs615-ride platform and provide path for zap
shader.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index ee6cab3924a6d71f29934a8debba3a832882abdd..860a0db1908cfe32a250b14aac14065923c5a575 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -202,6 +202,14 @@ &gcc {
 		 <&sleep_clk>;
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/qcs615/a612_zap.mbn";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.45.2


