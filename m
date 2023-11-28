Return-Path: <linux-arm-msm+bounces-2217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0DC7FB4B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 09:47:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DBFE1C210C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 08:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E6F199CC;
	Tue, 28 Nov 2023 08:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJOQplbJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6D56E7;
	Tue, 28 Nov 2023 00:46:56 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AS6EUFu013975;
	Tue, 28 Nov 2023 08:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=from : to : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=qcppdkim1;
 bh=EKmFQGvrrAfzF20HXxYC8lpuQsQm5Yp1jI/fTprPVso=;
 b=IJOQplbJw5rYFhpnbDqgqEWwyEC5i/2fvcPfpMNEVHfYGsSEz+48l7KtLPtXOJt0wxao
 cbFW4g1A9E+b7QBiBd49tk/KWCnGumIvsIKe9mcPS2jFe5UMbEgE8toY8+hzFWQTOsn9
 G9yu1db3vi9tsrpfN0i0kAYVMpZZIOgq+CwxFgn1ke60ZRVfipI36w0dhSMByCVXVL2n
 bWomENjH+KkczGpzOgNPz8bCjH0boLSmW1PonRY7Hv2zWULJjWU+4fbprz/N2n35UdB/
 hrtgObBO0U1CbfOSlUaIIPLHkMqaUHgXEEnNd+QZ4vpE/D/172U2wvDfu9hgrF9oFaUY GA== 
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3umt9c2ums-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 08:46:52 +0000
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3AS8knEc010192;
	Tue, 28 Nov 2023 08:46:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3uka0kw92k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 08:46:49 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AS8knTv010173;
	Tue, 28 Nov 2023 08:46:49 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-varada-blr.qualcomm.com [10.190.111.7])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3AS8knq2010171
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 08:46:49 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 85203)
	id 4982241630; Tue, 28 Nov 2023 14:16:48 +0530 (+0530)
From: Varadarajan Narayanan <varada@hu-varada-blr.qualcomm.com>
To: agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        dmitry.baryshkov@linaro.org, quic_varada@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] regulator: qcom_smd: Add LDO5 MP5496 regulator
Date: Tue, 28 Nov 2023 14:16:45 +0530
Message-Id: <3aa2dad7f9927dd34ab46d8fb6d1c9df4ebff7d6.1701160842.git.varada@hu-varada-blr.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701160842.git.varada@hu-varada-blr.qualcomm.com>
References: <cover.1701160842.git.varada@hu-varada-blr.qualcomm.com>
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
X-Proofpoint-GUID: Be2tXSeCS4xFAECY3ZJgB_y5emlmyAsx
X-Proofpoint-ORIG-GUID: Be2tXSeCS4xFAECY3ZJgB_y5emlmyAsx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_07,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 clxscore=1034 priorityscore=1501 malwarescore=0 phishscore=0
 suspectscore=0 adultscore=0 impostorscore=0 mlxlogscore=930
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311280068

From: Varadarajan Narayanan <quic_varada@quicinc.com>

Add support for LDO5 regulator. This is used by IPQ9574 USB.

Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
---
 drivers/regulator/qcom_smd-regulator.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/regulator/qcom_smd-regulator.c b/drivers/regulator/qcom_smd-regulator.c
index 09c471a0ba2e..d1be9568025e 100644
--- a/drivers/regulator/qcom_smd-regulator.c
+++ b/drivers/regulator/qcom_smd-regulator.c
@@ -796,6 +796,7 @@ static const struct rpm_regulator_data rpm_mp5496_regulators[] = {
 	{ "s1", QCOM_SMD_RPM_SMPA, 1, &mp5496_smps, "s1" },
 	{ "s2", QCOM_SMD_RPM_SMPA, 2, &mp5496_smps, "s2" },
 	{ "l2", QCOM_SMD_RPM_LDOA, 2, &mp5496_ldoa2, "l2" },
+	{ "l5", QCOM_SMD_RPM_LDOA, 5, &mp5496_ldoa2, "l5" },
 	{}
 };
 
-- 
2.34.1


