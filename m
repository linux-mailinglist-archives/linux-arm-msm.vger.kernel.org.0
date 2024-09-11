Return-Path: <linux-arm-msm+bounces-31477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2229A974F51
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 12:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C14F11F25F91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 10:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15F9E183CDC;
	Wed, 11 Sep 2024 10:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IskTJdT9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F6A155346;
	Wed, 11 Sep 2024 10:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726049324; cv=none; b=nI05EPiUhoKLKI+ERR4y5svqraDWi9yPkoHWjw7KQjoUTRSxgjNwBq0RzCQpW7yZtRCmPPWzeEhJtkCAnaQtVuhWWDDp2pHumAydljUe9nWaaseXLAl0khgvVhbBO5I5pm2AfdQt4bTgMpo1OFQUrQU8iv9tWYkH2G/7kuhVx+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726049324; c=relaxed/simple;
	bh=XyWJDVM4IFxB9Mlqy3UeHTaQBn0X3kWbKVmqbnXeXZ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=HRcjKr3ZyTxd80v60biyRXvDSAi1ILGt21uM+Gzv5J1aHAARk6xPBIKmBErrETW+j2+7Dokxrra6D9Sey6sujCOP52WP/nLEcqJ1dcq6DfF6p73WJZJaN6G91Pxnswre2mVmRYJunReac4emOZJpfEf9Q8DaU6WKRCu8N/D/EBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IskTJdT9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48B3PdwO024591;
	Wed, 11 Sep 2024 10:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=XyPUqJZhSDnLMWnGgfDlJs5hPDR/P428Wo/2kLwzeqQ=; b=Is
	kTJdT9pgi1Qbtk9Ys8fZ/xvXAEjGianQKHiFc/oQi4CAabZwgZCiSW2j4vmw++7F
	FSp1F3P+FYkLRpN2oMfxcm2jyEB8p/LyELva4s3Tc205gW+iK/rBlFcMa7J9ON9b
	sNveEUlbrJJtJLF/+Q97d4eT9AASk27QUh6VQB3XCGPXraEfc7LWAz6KON4WdGsW
	hNhwHTPM9kzZyS09UnQ6NX/J7lRTM0SseMs6XjhgRTPTWc/rR2C6ruIUd5nIHwEi
	iS1RrTaqUX0UIuFL73CvsRbOYaZIw7X5teWpnJS9BRS2uD7juIoltz0aYXZjEZmh
	/0sTDYiep1gStpUQezrg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy5rh4bq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 10:08:25 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 48BA8LsY019444;
	Wed, 11 Sep 2024 10:08:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 41h168s1sw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 11 Sep 2024 10:08:21 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 48BA8KZo019407;
	Wed, 11 Sep 2024 10:08:20 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-mukhopad-hyd.qualcomm.com [10.147.244.250])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 48BA8KTg019398;
	Wed, 11 Sep 2024 10:08:20 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 3978529)
	id 8D7705000AA; Wed, 11 Sep 2024 15:38:18 +0530 (+0530)
From: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, simona@ffwll.ch, dmitry.baryshkov@linaro.org,
        abel.vesa@linaro.org, robdclark@gmail.com, quic_abhinavk@quicinc.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_khsieh@quicinc.com, konrad.dybcio@linaro.org,
        quic_parellan@quicinc.com, quic_bjorande@quicinc.com
Cc: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        quic_riteshk@quicinc.com, quic_vproddut@quicinc.com
Subject: [PATCH 1/5] dt-bindings: phy: Add eDP PHY compatible for sa8775p
Date: Wed, 11 Sep 2024 15:38:09 +0530
Message-Id: <20240911100813.338-2-quic_mukhopad@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240911100813.338-1-quic_mukhopad@quicinc.com>
References: <20240911100813.338-1-quic_mukhopad@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DzCIeSW3ebZmSuA1N4xFnpz2v4Rarfad
X-Proofpoint-ORIG-GUID: DzCIeSW3ebZmSuA1N4xFnpz2v4Rarfad
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409110075
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Add compatible string for the supported eDP PHY on sa8775p platform.

Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
---
 Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
index 4e15d90d08b0..293fb6a9b1c3 100644
--- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
@@ -17,6 +17,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,sa8775p-edp-phy
       - qcom,sc7280-edp-phy
       - qcom,sc8180x-edp-phy
       - qcom,sc8280xp-dp-phy
-- 
2.17.1


