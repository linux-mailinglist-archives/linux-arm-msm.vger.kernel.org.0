Return-Path: <linux-arm-msm+bounces-879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7120A7EEF4D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 10:54:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 259FA1F26518
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 09:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D396171A5;
	Fri, 17 Nov 2023 09:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YXsIV8QD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEC76D56;
	Fri, 17 Nov 2023 01:54:11 -0800 (PST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AH9pob7031877;
	Fri, 17 Nov 2023 09:54:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=8PHjishFk/rDJbuAwLGo4DIdsK0nxVJpPl5Q+3+yl58=;
 b=YXsIV8QDK+IwL85TKocCUX9EX6vrchLuNg3cMfGb1B0Pvw3exBsCdt7q79PMqM002U98
 ZTaOXk8kAdaQmMQa4AgY/cBBmBUE+pWnxHQdRKt6l6WzhfPepCN+qe4uOzmQbkeraouG
 uE7SV5GrTqaHH3+XbJN6tKmqecYCuFzUDfv7CwqNNeOBxaUct8L0CXs7eWHcKmgmO20q
 qtDOZnA5bE+SCbK52oE7ENqFSYX1fpTSiz+A9m0J4ONOYtsl8MT+wvm8NvHblzgpfB/u
 6Mt6Boe9TA+0cYosWY6dASPyUcAaX4ZRVXgFH3Z4RIjXhJPpc3KEEwTrCir1fFdSbLdL 3A== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3udw46s199-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 09:54:08 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AH9reTZ023544
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 09:53:40 GMT
Received: from blr-ubuntu-87.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Fri, 17 Nov 2023 01:53:35 -0800
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC: <agross@kernel.org>, <conor+dt@kernel.org>, <quic_rjendra@quicinc.com>,
        <abel.vesa@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_tsoni@quicinc.com>, <neil.armstrong@linaro.org>,
        Sibi Sankar
	<quic_sibis@quicinc.com>
Subject: [PATCH V2 0/2] cache: qcom,llcc: Add llcc support for X1E80100
Date: Fri, 17 Nov 2023 15:23:13 +0530
Message-ID: <20231117095315.2087-1-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yCoPhn1bkOHHZbSk_Ed2-3Rgaegw5L_J
X-Proofpoint-ORIG-GUID: yCoPhn1bkOHHZbSk_Ed2-3Rgaegw5L_J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_07,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 clxscore=1015 phishscore=0 mlxlogscore=962 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311170073

This series adds llcc support for the Qualcomm X1E80100 platform, aka Snapdragon X Elite.

Our v1 post of the patchsets adding support for Snapdragon X Elite SoC had
the part number sc8380xp which is now updated to the new part number x1e80100
based on the new branding scheme and refers to the exact same SoC.

v2:
* Update the part number from sc8380xp to x1e80100.
* Pickup Rbs.

Dependencies: None
Release Link: https://www.qualcomm.com/news/releases/2023/10/qualcomm-unleashes-snapdragon-x-elite--the-ai-super-charged-plat

Rajendra Nayak (2):
  dt-bindings: cache: qcom,llcc: Add X1E80100 compatible
  soc: qcom: llcc: Add configuration data for X1E80100

 .../devicetree/bindings/cache/qcom,llcc.yaml  |  2 +
 drivers/soc/qcom/llcc-qcom.c                  | 39 +++++++++++++++++++
 2 files changed, 41 insertions(+)

-- 
2.17.1


