Return-Path: <linux-arm-msm+bounces-53833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CAAA84595
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 16:02:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AE291BA11B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 14:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECBFE1C3BEE;
	Thu, 10 Apr 2025 14:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WGkn71YE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CE91BD9DD;
	Thu, 10 Apr 2025 14:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744293657; cv=none; b=DmrSAoiNjD+qu+9q0FDh76lcr/IL0TJfMoaHM/yNRULsl01MWBxDgo7av6i480YxsYYTdNcaYzKBFSVDu6DbxLY+iYtz6iUjXEobF8lHHUea6G53Nn+wAmdQ+5rxItGB0OBs4UoWiwL6P+67My1IqrMNTzfI2UjSJpIQoYMOLGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744293657; c=relaxed/simple;
	bh=ZGbqzKVJD6WoFMiKe9SlHIwC17CQ5h6RLRgOhAFzgNw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r/g3OYvHn3M1uVEkzwA5TYiw9kSOyflrnx8qofuIPphQSP3xg22kQT11ftwpV5SJLQNS6xtePxJl/tP+ekZnvS76mJaHJpVNbiabzN7q4kqMPtZrhGRDHszruVTAuYOMR9kZ73kGZWy5JmjQcnFTlElb0K4QE2nABAkeIzpg85s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WGkn71YE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A75N8q008265;
	Thu, 10 Apr 2025 14:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HZqpYeMVcBrxFYiXH10xne0AVUEMd4NzJsuvDdhRRRY=; b=WGkn71YE9cUOAFsQ
	xofiM/GT4mxxazkw1HgjreyfCJ8YBvTzwlSKGRmH6IlY9vy2Kyd8tWzc3pWMLI5I
	hfxtUX6rg7HASOgqiwFF2sEgcTXpqaDebDAL1ofo5KNZhfEQOU4vahY6xCaXKBAF
	5/GfnNDHavV7p7SS1Ivgeu3EI8wCQ7Dj3U3DFIQBtP7rssGObVgNenxrIpsuf7iL
	FEjyzj7ZrNRLg92sH9V7BchZkq3eonBL/CoXj0a5QpOnyYU/nRvUpCkcWF5fV2Vz
	ubPh6DZ8JJSvgoS94ozFNdXw75y3tYfReH6oiEjip5XXYp2jJfnVkoekX6L+HjUF
	MlAv0g==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd078bu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 14:00:47 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53AE0fsU015578
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 14:00:41 GMT
Received: from hu-gkohli-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Apr 2025 07:00:37 -0700
From: Gaurav Kohli <quic_gkohli@quicinc.com>
To: <amitk@kernel.org>, <rafael@kernel.org>, <daniel.lezcano@linaro.org>,
        <rui.zhang@intel.com>, <lukasz.luba@arm.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <andersson@kernel.org>, <konradybcio@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_manafm@quicinc.com>,
        <quic_gkohli@quicinc.com>
Subject: [PATCH v1 1/2] dt-bindings: thermal: tsens: Add QCS615 compatible
Date: Thu, 10 Apr 2025 19:30:18 +0530
Message-ID: <c8339b6ccf5ee19fefed762874560d6d8408ebba.1744292503.git.quic_gkohli@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1744292503.git.quic_gkohli@quicinc.com>
References: <cover.1744292503.git.quic_gkohli@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: t0VIAinaH8GITIl_AiUibT71Fb27sfLz
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f7cf0f cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=Pr_X6dJPkNF1GrwpdJQA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: t0VIAinaH8GITIl_AiUibT71Fb27sfLz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_03,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100102

Add compatibility string for the thermal sensors on QCS615 platform.

Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index f9d8012c8cf5..de9b667a79d3 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -52,6 +52,7 @@ properties:
               - qcom,msm8996-tsens
               - qcom,msm8998-tsens
               - qcom,qcm2290-tsens
+              - qcom,qcs615-tsens
               - qcom,sa8255p-tsens
               - qcom,sa8775p-tsens
               - qcom,sar2130p-tsens
-- 
2.34.1


