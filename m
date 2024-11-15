Return-Path: <linux-arm-msm+bounces-38099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 099409CFA67
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 23:52:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F9921F23D1C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 22:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DDA8199E92;
	Fri, 15 Nov 2024 22:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Dt+bhK53"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C291922C0;
	Fri, 15 Nov 2024 22:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731711127; cv=none; b=kDy5pF9sALIBNZFj9RIr/gSfXFGOhVG+MfLsteldI9ApEnwnkHTvozkyY1oraifMiOw/zovqyL5VdlJ3NwQhX3soTISICBzmh9PynTbJf383eZ0htpn7xZ/4L/Ee4EhH/YzcwucXiyfnB+NzQHdfb3fVMRJeeO27VDI4ZNhmZGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731711127; c=relaxed/simple;
	bh=rGgxLmKdPM+MRyyYJClBUqeUPC9OHftwsL4x72HnK/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UXcNpeBZCEKRGU4W6yP9cPjtW52Rbq6oaqn64JhAt8rp0xgn8Kscut/yi864pegNI58bDiK7U/xyCUPEa32fkp5hpHxii+yigWeg7nrmIE97u0iP8tM/N26xX30YYGeNu81uSTcoA/6e0wYu9bJoSUrd2q+wLmcyV0BglALdcI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Dt+bhK53; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AFIcb5t017006;
	Fri, 15 Nov 2024 22:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fv/A3lTlNX4
	J/1m87XnEZv9R6N5ksiY2yDCE6v1gowI=; b=Dt+bhK53lcZAn2STt02NwK4EkJ8
	Ix9WgC9uaqG99o6VAtiaQ80x4ebIQLHHR+eM/aCkjDQgW87GaNMm6cUOTOB66aAk
	+PGarFb3wiEZVYEBfxFeEbJQ3dTZ8HgNAgqOvvghvFxjCxYV3tqs/Dm0ATng2B/S
	JIROwRFrN0uCxA3arVkHjfHT4t3MIsllVKA8/B9Dem+vBD4HbrYmkjejGQdpXuPM
	mwIFUC99T4IiMDchjvDwQzdXLQlNT5RUoZ2sK40RCXHKOcjKm3U9NxvNg9FYQfu6
	Z175EiZwH4PqL6jkbEoe2K9anVSh/epz1q7oYT8nSKJEj2uReTtuZ5+PieA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42wm75vj94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 22:52:00 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AFMpvkN020279;
	Fri, 15 Nov 2024 22:51:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 42t0tn65df-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 22:51:57 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4AFMpuWG020252;
	Fri, 15 Nov 2024 22:51:57 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4AFMpuAe020249
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 22:51:56 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id D53D25A6; Sat, 16 Nov 2024 04:21:55 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        Wasim Nazir <quic_wasimn@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 2/5] soc: qcom: socinfo: add QCS9075 SoC ID
Date: Sat, 16 Nov 2024 04:21:49 +0530
Message-ID: <20241115225152.3264396-3-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115225152.3264396-1-quic_wasimn@quicinc.com>
References: <20241115225152.3264396-1-quic_wasimn@quicinc.com>
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
X-Proofpoint-GUID: l5ZuREYZvS0otVDsxQdAlzuB_D8PXXrZ
X-Proofpoint-ORIG-GUID: l5ZuREYZvS0otVDsxQdAlzuB_D8PXXrZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=965 spamscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411150192

Update soc_id table for the Qualcomm QCS9075 SoC
to represent qcs9075 machine.

Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 805dc3c4de40..a473d85bc033 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -451,6 +451,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QCS9100) },
 	{ qcom_board_id(QCS8300) },
 	{ qcom_board_id(QCS8275) },
+	{ qcom_board_id(QCS9075) },
 	{ qcom_board_id(QCS615) },
 };

--
2.47.0


