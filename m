Return-Path: <linux-arm-msm+bounces-3021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28463801C93
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 13:37:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 591191C209B1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 12:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46625168B2;
	Sat,  2 Dec 2023 12:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n7V1i6y3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 168C3134;
	Sat,  2 Dec 2023 04:37:01 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B2CU7dK018960;
	Sat, 2 Dec 2023 12:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=klbEx+jsgDfMuqP0VbnPr76NxVt0J0p+zZTspCvHoV8=;
 b=n7V1i6y3ydfzVJ1I78KgtfVDc7qyiTLfquAGeK2zHG3J7OukAcE5EfTenPzpBoUlibBX
 CG0+yjd1g+f0xUXbWQQ+zBJSEso2RTYhULdSAsNdxwfUNFgCQBP3MeVv1GtvSgxhBtf0
 ySPmbbYV0N5VZk2dM5XsS2mM13ysOdnC6AqWJ5NzGlvLFVm3344eYtmNTecsqjOzq2to
 abXjuNb4XV04sLGVqBMNe8Y7MjqDwVmg9EDsPDefhk/HMPwxE+RZVY1J7pAZMNACRPQk
 VfzQV7tYlbeMikJ0n5+6GQ7H9zdTqkFMqgcQhEZr7EngIfa4dBxnet9y6nmgs7DvgxWK FA== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uqwvhgf7g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 02 Dec 2023 12:36:47 +0000
Received: from pps.filterd (NASANPPMTA02.qualcomm.com [127.0.0.1])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3B2CalwI018720;
	Sat, 2 Dec 2023 12:36:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NASANPPMTA02.qualcomm.com (PPS) with ESMTP id 3uqwnkka8r-1;
	Sat, 02 Dec 2023 12:36:47 +0000
Received: from NASANPPMTA02.qualcomm.com (NASANPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3B2Ca65h017832;
	Sat, 2 Dec 2023 12:36:46 GMT
Received: from stor-dylan.qualcomm.com (stor-dylan.qualcomm.com [192.168.140.207])
	by NASANPPMTA02.qualcomm.com (PPS) with ESMTP id 3B2CakPO018712;
	Sat, 02 Dec 2023 12:36:46 +0000
Received: by stor-dylan.qualcomm.com (Postfix, from userid 359480)
	id 1843120A90; Sat,  2 Dec 2023 04:36:46 -0800 (PST)
From: Can Guo <quic_cang@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        adrian.hunter@intel.com, vkoul@kernel.org, beanhuo@micron.com,
        avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 07/10] scsi: ufs: ufs-qcom: Check return value of phy_set_mode_ext()
Date: Sat,  2 Dec 2023 04:36:13 -0800
Message-Id: <1701520577-31163-8-git-send-email-quic_cang@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1701520577-31163-1-git-send-email-quic_cang@quicinc.com>
References: <1701520577-31163-1-git-send-email-quic_cang@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yQOsdvsswcu9mtVpAmVnw2daW2vl4wq7
X-Proofpoint-ORIG-GUID: yQOsdvsswcu9mtVpAmVnw2daW2vl4wq7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-02_10,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 mlxscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312020094
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

In ufs_qcom_power_up_sequence(), check return value of phy_set_mode_ext()
and stop proceeding if phy_set_mode_ext() fails.

Reviewed-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 543939c..ee3f07a 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -475,7 +475,9 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
 		return ret;
 	}
 
-	phy_set_mode_ext(phy, mode, host->phy_gear);
+	ret = phy_set_mode_ext(phy, mode, host->phy_gear);
+	if (ret)
+		goto out_disable_phy;
 
 	/* power on phy - start serdes and phy's power and clocks */
 	ret = phy_power_on(phy);
-- 
2.7.4


