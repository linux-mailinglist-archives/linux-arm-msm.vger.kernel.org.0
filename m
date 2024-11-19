Return-Path: <linux-arm-msm+bounces-38377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8229D2CF7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 18:50:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E09B51F21347
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 17:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 887021D278D;
	Tue, 19 Nov 2024 17:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Nur3PWsn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58921D2200;
	Tue, 19 Nov 2024 17:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732038607; cv=none; b=JYGduJxn6WRkplYnAj/p/ai59FesJyGXHSvq18d7HxNXPUuAHsXd3lGXL6L5quDagUdfwJjzNzoWHmKjxBGfdmVbfegkA1Pxpyk7od5sUuDONAhyp6tY0C+KiNz+8wRpRlhrvhMWH4sU6Om3BLPrjz+/5jdUxw06OqlFkP12HBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732038607; c=relaxed/simple;
	bh=CbZHBKuJA6W/UoAE84GFI1E+aJt3W44WhU3c4ij8//0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cjsw9BHYXyZu/LcyjYCGKh/SUINYEK9oLvYsoVZvUqNLh4TUl1EdJkQMQWJwJ94sfm3dgUUwetcD9UiS5OPV7xdEmKT6w0vkXsZBA3MIWhd8tCEpAxT1yqv/njiVAsPxdRaxwWVDQsm+varJlrnKbZGRj9977yCcRZwQBDGWoCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Nur3PWsn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJ7bpdF005668;
	Tue, 19 Nov 2024 17:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vtCfWtly1yA
	8xA6HRcgTnBmAYXHBLqBXnS/SuV3GJW4=; b=Nur3PWsntOocHkZHd0zwgz6o13S
	WPMae/8+QVdXvdh/eN6zmUx6Cpc3vNTIgP4Rn3GABVAg6PthT0VYhaVo15Xfxnry
	DZNX8N6e82llwNpqEK5eevWrnjbqGhKz2KY000yRcz4Xcu37Y9qsyixynvFC82nH
	q+tZRNpP6IIcEbpkNcP9u9d+e/Z5fUagrmLqplgUO9u1m9xFLf1Z287CRHOWsBiP
	ofQNPGpk6uskkulrI5pztHYen8q7MPuIya3+2TU3mbMcuijbDXXGJO8e2CDkOZZa
	XAJnbC3w4dgyDEU09EXVQGvzooJUShke0iW+bpyANav2aCD7Fkl2OO0IFIQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y8kc7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 17:50:02 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJHnxEx007359;
	Tue, 19 Nov 2024 17:49:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 42xmfm26re-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 17:49:59 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4AJHnx8S007332;
	Tue, 19 Nov 2024 17:49:59 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4AJHnw3f007328
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 17:49:59 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id AC4D33C9; Tue, 19 Nov 2024 23:19:57 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH v3 1/5] dt-bindings: arm: qcom,ids: add SoC ID for QCS9075
Date: Tue, 19 Nov 2024 23:19:50 +0530
Message-ID: <20241119174954.1219002-2-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241119174954.1219002-1-quic_wasimn@quicinc.com>
References: <20241119174954.1219002-1-quic_wasimn@quicinc.com>
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
X-Proofpoint-ORIG-GUID: YkJT4NS0U-bWyHfJbjqh7NHEwHvYH41e
X-Proofpoint-GUID: YkJT4NS0U-bWyHfJbjqh7NHEwHvYH41e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=960 lowpriorityscore=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 mlxscore=0 spamscore=0 phishscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190132

Add the unique ID for Qualcomm QCS9075 SoC.
This value is used to differentiate the SoC across qcom targets.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
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


