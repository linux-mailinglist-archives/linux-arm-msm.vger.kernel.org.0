Return-Path: <linux-arm-msm+bounces-44708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA9AA0887C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 07:39:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09222188B57E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 06:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA1C01C3BE7;
	Fri, 10 Jan 2025 06:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WnPAFUcv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E141B4F14;
	Fri, 10 Jan 2025 06:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736491166; cv=none; b=AiAHt7meEHBgfj+1J6jbxxJ3dkch9gdNKcIMsvjHnYTvrGbdP4qiDinQ2NPiXbQ7uxsF23R8Ajoy+APSdcO9FMrB7MSVUVzzQ+/AEBxp7WxMc4cMPhUEAhWAWD8yjBDun/JX7S12kAjmlZg22iO1lTVjoSAn77C0/mGlfBeqOcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736491166; c=relaxed/simple;
	bh=dkM5RIqorCclu9bzpl50+uih3w0XzKZYvHWERd2uCME=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e8Yzoxdi7W9AIRBvu3aM7cHyC0asJjWANqerKTtERIgIdK21k8bd4szNjFTof3UJZqK5kF0rZkqeuREHTIWcd/VF35I8XvfQsJqd9OHV9Yec/cXQ2xL+PnMGBBdVAElHExSyVuoKazIYeMjOPvSBH97rV+66ppycgEoXqNw9IIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WnPAFUcv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50A3bXis002587;
	Fri, 10 Jan 2025 06:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hrVjIc/LcmoNUqL0F5o690iiUubHNCLxTYE
	RaJWRRPk=; b=WnPAFUcvt+AKA46Hwd4w3985gdg1v4R67GUbh3jFfEqLr+AEJd2
	OOl3ULMl6isFDdBiDqQUiuj85YdZY1hnO+0n+k9XFMmNNb29rpvfLzWyHmqYPutm
	ECo+h9XAC25cJbSAVcZ+GlEWAzpfyqPRdcVA/hDeN5M8zMKituanWnrgxXR9tF9M
	QBRmLgVFadT77Uuhmu4Ezu477IQjZwk+OYEc0GqIFXkZk2y9DeQri1r8XlLtbUWz
	R38vNg6WsgfVxY7CJr+HuEuTu9sj2Reb/pf8z+bST8O31VP4mBb6pmx0VuNy31it
	8HcoWfwalUXmZk8qxxWvrYbUgqa0PeS3IRA==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442utegbd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 06:39:20 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 50A6dHaf000512;
	Fri, 10 Jan 2025 06:39:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 43xx2m2jc3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 06:39:17 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 50A6dHje000507;
	Fri, 10 Jan 2025 06:39:17 GMT
Received: from chejiang-gv.ap.qualcomm.com (chejiang-gv.qualcomm.com [10.233.43.239])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 50A6dGJ1000503
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 06:39:17 +0000
Received: by chejiang-gv.ap.qualcomm.com (Postfix, from userid 37913)
	id 073F0FF0; Fri, 10 Jan 2025 14:39:16 +0800 (CST)
From: Cheng Jiang <quic_chejiang@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chejiang@quicinc.com,
        quic_jiaymao@quicinc.com, quic_shuaz@quicinc.com,
        quic_zijuhu@quicinc.com, quic_mohamull@quicinc.com
Subject: [PATCH v1 0/1] Add firmware-name in BT node
Date: Fri, 10 Jan 2025 14:39:13 +0800
Message-Id: <20250110063914.28001-1-quic_chejiang@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-GUID: BcF4PpkGpvFOhnuqG8HL0e_nYv2_LfMj
X-Proofpoint-ORIG-GUID: BcF4PpkGpvFOhnuqG8HL0e_nYv2_LfMj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 mlxlogscore=878 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100053

Add the firmware-name for sa9775p-ride platform.

---
The previous disccuss can be found on
https://lore.kernel.org/all/20250107092650.498154-1-quic_chejiang@quicinc.com/
---

Cheng Jiang (1):
  arm64: dts: qcom: sa8775p-ride: Add firmware-name in BT node

 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 1 +
 1 file changed, 1 insertion(+)


base-commit: 6ecd20965bdc21b265a0671ccf36d9ad8043f5ab
-- 
2.34.1


