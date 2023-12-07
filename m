Return-Path: <linux-arm-msm+bounces-3654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 145D48084A7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 10:28:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 415601C21D5F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 09:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4228834549;
	Thu,  7 Dec 2023 09:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kw2lMNnx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E081D1706;
	Thu,  7 Dec 2023 01:28:49 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B75KTK4029124;
	Thu, 7 Dec 2023 09:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=sy/1Uo+b7qVWM+Dtv27OmoLVYjhudFcpCG7Sli9Wq5o=;
 b=kw2lMNnxLk+oWhznosoLBsTt0nuB1OcLAxqEmNlGel/WLGV/zi1ceKg0M4yNynzzENnG
 qtqlXSAaSWvOkoaLK/k3qwUr9moVK2jK1OUWIagISFB9pQAczz+QNPngNjHiCERWZ7vc
 OtiuTB0Aeh/8hKJbwaJZBeCxof6wSQ5G7cpckpzi1yr94q/vyolIIl5II76lPrOlWsFm
 xbx23zkcbQ4sgybzxKCTKaiNVfehXKH7k52Es/N6MJTC9CI6bU5vtQvXoZJTjXjyc7VQ
 m/KSPI5BZSmPInTBIhWD+Yt9P+r18LKB8YmbANdKP0cM3J2Q7lkv3GgOaRcRV4b2yE7+ Hg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uu6qr0k1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Dec 2023 09:28:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B79SkDr001448
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Dec 2023 09:28:46 GMT
Received: from tengfan2-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 7 Dec 2023 01:28:40 -0800
From: Tengfei Fan <quic_tengfan@quicinc.com>
To: <agross@kernel.org>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
Subject: [PATCH v2 5/7] soc: qcom: socinfo: add SoC Info support for the QCS8550 platform
Date: Thu, 7 Dec 2023 17:27:59 +0800
Message-ID: <20231207092801.7506-6-quic_tengfan@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231207092801.7506-1-quic_tengfan@quicinc.com>
References: <20231207092801.7506-1-quic_tengfan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vyqNFGSjUzsBZGGUACCLbYP81_WVKR0X
X-Proofpoint-ORIG-GUID: vyqNFGSjUzsBZGGUACCLbYP81_WVKR0X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-07_07,2023-12-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 bulkscore=0 mlxlogscore=918
 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312070076

Add SoC Info support for the QCS8550 platform.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 51e05bec5bfc..c8d216cce41f 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -426,6 +426,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(IPQ5322) },
 	{ qcom_board_id(IPQ5312) },
 	{ qcom_board_id(IPQ5302) },
+	{ qcom_board_id(QCS8550) },
 	{ qcom_board_id(IPQ5300) },
 };
 
-- 
2.17.1


