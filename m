Return-Path: <linux-arm-msm+bounces-76577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C074ABC830A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 11:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C923C19E6A55
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 09:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B8242DC34B;
	Thu,  9 Oct 2025 09:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AW89w3l8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D3E2D8DB9;
	Thu,  9 Oct 2025 09:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760000813; cv=none; b=f3b22RvI94LtCi1qFHuIef3whjU9yRtdwuQiFjUntBkgCBXJWJgUXXtRZF4kjgjHjccj2bCrRqhEIoyxzAN/Ypbd1Sj9xVDfiGHTULP+nQdJRrgu9IWiVd7hKfhBEwc2Ss1rWZNMjHnmRBHDhzAzmqX/b53PXBlGr79tlpdnxKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760000813; c=relaxed/simple;
	bh=cKu7gdwYB4HAIhUBfDHClZm2hXgbcjj2s6uvhlho/nI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i448GktvF2XnhVFsO3F6d2EVR5kv58oGOCKtpM3Cq8G1JTu6BzDx72oIo8sBgiZEpUtO0ldGX15Jp9pEguSJSpNBozGNCtfcLBtKN3m/EBTIDaiA/sZ8rEfpr15hXCpSEBFEAE52t8hykRFolBGBhNqoCieF8Ix3hXLxG49Qf7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AW89w3l8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EHqC028485;
	Thu, 9 Oct 2025 09:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pkEnZ87t7zk
	J57t1tKlAkdHFXPHiF/Cr+teWWOvYWXM=; b=AW89w3l8dlWd7crcDDq1vo+GSn3
	vd6vitseiSgFusqb2eWCU11OQoZNRX7/crZo8YvrOKDBSMqy5RPRzwTiV+AM7lDz
	pIoOLoIWGIDGc6FXoeLJnl4mfwY4dUC29SZ7P4ud5xN9vjFSMY8GbW92r11j83ud
	yr4XAjPt/czY1oiIOTwGoPJsmWFab53KevLQUhCL/cQyUknO1oZHoGXm1XsIuRLA
	dQsy8K/AXorXHgKsbv6H1wSt2Nobb1Z7zj6YGhrmhdATmrA6yuGane5p7u7M5uOW
	sZZzRwAXgfv00W3LrMECQCVr4jPUo/j7/8/I6JZkzhEMBUnUsyZ6g/hTNNw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4kt568-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 09:06:30 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 59996Sw4011947;
	Thu, 9 Oct 2025 09:06:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 49jvnmy127-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 09:06:28 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59996SVG011942;
	Thu, 9 Oct 2025 09:06:28 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (cse-cd01-lnx.qualcomm.com [10.64.75.209])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 59996RWc011926
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 09:06:28 +0000
Received: by cse-cd01-lnx.ap.qualcomm.com (Postfix, from userid 4531182)
	id E1D1D21BA6; Thu,  9 Oct 2025 17:06:26 +0800 (CST)
From: Le Qi <le.qi@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Le Qi <le.qi@oss.qualcomm.com>
Subject: [PATCH v2 1/2] ASoC: dt-bindings: qcom,sm8250: Add QCS615 sound card
Date: Thu,  9 Oct 2025 17:06:18 +0800
Message-Id: <20251009090619.1097388-2-le.qi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009090619.1097388-1-le.qi@oss.qualcomm.com>
References: <20251009090619.1097388-1-le.qi@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXziAbd0Iaa3LN
 o0iTz4c7MYbBfBhhrRQEbdqATshqEoUjiPIfc1sAmf6Q5qaHzKXq4DP2uPvNqyunYcNYmR1HwY7
 P+aMKYaiJ5g163YAmkMBaF4xVc/lVjrzMlM9/LI07LmHmKK5dDqtlAKlaFu0Lsqm01AUz6ktgN3
 k5TJ5bZ+DnT0lUtLP7pqRvWNf+AM2SSWO7R9esIdWsPXocveCLpmG2YoEOvzLXImIIxBwFEfZfa
 /xEGw2WDezu+ehVYO2HXzbjV3U6Q3UMx61/hT/qMQVC6hEQSLTxkA60qm0mkU+RwW6veqWidSqt
 GFAG+kR6BXNZNjekxUzTlDMOFYc2TzEzPzjG9trto3dGXqbLDz4oeh4fahiHxq0dzWKZqmMKgUJ
 s1yBErE5RTVaBWIiXIDJMLZaEflafQ==
X-Proofpoint-GUID: mxRryIQO8nLMiBKTvNMYdEpp_jNV-lGb
X-Proofpoint-ORIG-GUID: mxRryIQO8nLMiBKTvNMYdEpp_jNV-lGb
X-Authority-Analysis: v=2.4 cv=SJxPlevH c=1 sm=1 tr=0 ts=68e77b16 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=FcwbwtDRuO4CV1RsPicA:9 a=zgiPjhLxNE0A:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

Add bindings for QCS615 sound card, which looks fully
compatible with existing SM8250.

Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 8ac91625dce5..b49a920af704 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -33,6 +33,7 @@ properties:
           - qcom,apq8096-sndcard
           - qcom,glymur-sndcard
           - qcom,qcm6490-idp-sndcard
+          - qcom,qcs615-sndcard
           - qcom,qcs6490-rb3gen2-sndcard
           - qcom,qcs8275-sndcard
           - qcom,qcs9075-sndcard
-- 
2.34.1


