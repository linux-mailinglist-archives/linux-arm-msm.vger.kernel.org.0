Return-Path: <linux-arm-msm+bounces-59450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 201F9AC426E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 17:40:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DCAC3BA20E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 15:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E7B321A437;
	Mon, 26 May 2025 15:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nBifKIKa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA32A21885D;
	Mon, 26 May 2025 15:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748273938; cv=none; b=LagWkpEn29CHxP8upu5bh4D9th9PeSFqtZKdpkKVzEYBIu0rnaqyKiv45nVVyju5++UgZeapt/iL5tN+V61t6lqvBZCTi0bvGHsoU/ZF2GR8Xd1soTF+peNsJCqtqITXL1/3KS8DLdRPXxx3J1bfbJIYapTSgZUxEKL8zMsY3Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748273938; c=relaxed/simple;
	bh=7ZdbrdDf/Bss/IkaF1ITd70IragO/nqd8QckrwLBHRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hRthG8h+/hDZuCNLWLRi3/el4Kz4yAU4zTgq25/+Duuxvwz7aJaLEj4zmU0n3shzRLrrpx0mT+BkYks0K1UJqK91GPlXQRwQuGl97bmEuzqJxGt1O93s3uG/OIrbq71JWwj7nnNplZ/lOl62CdtfTQdOK7QyBmmLuLCQG0z1SSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nBifKIKa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54QAN9i4031141;
	Mon, 26 May 2025 15:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XYtm8lGbLam
	sMbYv/yM32mGIMiPr3qVps0I3ur4VljM=; b=nBifKIKaAMd2JQ21PTPNguda1Sh
	sRya9AOPIluiSjjfQ1QqLMycFJs2z4GJrGmZQrQxABS8s6zRkE7tu1DVPJxodaQc
	1pbiI08VMnZlvpXEbkMEdSqLYo5ut4azn1JP+f1ov/ODDWbNh8MPC37XYm7i/1uQ
	v3jUn8BMSmRDMR7jWIwyxHFbDViOdCLFkGeip1lPNo1G1cahOXzV7AkKWm9wL/mv
	O9Fy5pEbIOhyq9e0Jq4Fdt4iTKzip8yvleZU6PORzImyhnQoIMxpPwIEshlh7ycs
	hkaeCEzlQRBPjyISWWqcz1vKl6xnH97J4fGylu+0pcmlHYhR1nX8dEjNQrw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u66wcquv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 15:38:28 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54QFcPGe032423;
	Mon, 26 May 2025 15:38:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46u76m73fu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 26 May 2025 15:38:25 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54QFcOXS032414;
	Mon, 26 May 2025 15:38:24 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 54QFcONN032410;
	Mon, 26 May 2025 15:38:24 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id EAF3F61B877; Mon, 26 May 2025 21:08:23 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V6 01/10] scsi: ufs: qcom: Prevent calling phy_exit before phy_init
Date: Mon, 26 May 2025 21:08:12 +0530
Message-ID: <20250526153821.7918-2-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250526153821.7918-1-quic_nitirawa@quicinc.com>
References: <20250526153821.7918-1-quic_nitirawa@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=aYJhnQot c=1 sm=1 tr=0 ts=68348af4 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=6qkdr0EpClcQ5iOZAa0A:9
 a=zZCYzV9kfG8A:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: koCz1gxtN4Ks19lEKiYO-V-ZG-nohNbA
X-Proofpoint-GUID: koCz1gxtN4Ks19lEKiYO-V-ZG-nohNbA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDEzMiBTYWx0ZWRfX8NXoXzri/QUm
 DNQcGUd8/mt7IlwlCHXMRbxY8oH9fCOtGhbAFUoBE7SANcwspFMRXIIXPW+Z31s3Qlmq4/T2d7e
 K+v2Ug4OtXvgxAU/CSESv3hkkKwBWMuge4b7deqNR3kG18dZ+sWbVE5/eeDy/l9+q2dENRb41qO
 xMpcEbFqGwIaRb18OCMjDvhguCSlNuDNrGTrpU2fExUzqPA7V+KazGKxMpXruTXUhDBA9t+UmXl
 Mg3nvpdyyTmD3Bm6XYwKIMaBRc+jHZB1VdBCHnK+VabZHvijdzbYvukiP8Hdy40Gn4jZeCh1pVb
 ysltuc/RGL7jsKVg4fzY+KcEXOjqGC2ch2yI3MreNvKRtf2Cu5NfkMNigwPsSlbOAxPotz0rL3s
 7HC7U8adF6msDKyI6Qf67BqPlvnfcsOmr26mcpLjjnTMeizt0zrnYuUrvXlJMtM7gvckdrhk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_08,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 mlxscore=0 spamscore=0
 clxscore=1015 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505260132

Prevent calling phy_exit before phy_init to avoid abnormal power
count and the following warning during boot up.

[5.146763] phy phy-1d80000.phy.0: phy_power_on was called before phy_init

Fixes: 7bac65687510 ("scsi: ufs: qcom: Power off the PHY if it was already powered on in ufs_qcom_power_up_sequence()")
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 37887ec68412..62a5d76450b6 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -506,10 +506,9 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
 	if (ret)
 		return ret;
 
-	if (phy->power_count) {
+	if (phy->power_count)
 		phy_power_off(phy);
-		phy_exit(phy);
-	}
+
 
 	/* phy initialization - calibrate the phy */
 	ret = phy_init(phy);
-- 
2.48.1


