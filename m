Return-Path: <linux-arm-msm+bounces-64288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 624C6AFF357
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 22:57:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D57C75A4F2D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 20:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C183823B606;
	Wed,  9 Jul 2025 20:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VAG6I94F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4921F23AB86;
	Wed,  9 Jul 2025 20:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752094614; cv=none; b=W9dtUY6gp0PsWkcVgMAt9gB8bJJlvoRr9Mdfd96M1wIZRaPs3J3XRjO50Ha6fJmBl4AkL8HZN66UO9UHpWB9ghJQ/WHvtNQBbJzEUFQUK1c3qWBUGQNy+KfKCRIaSgRx9UgzYhctO+y9LPoiJUOkrOddd28BVh9Q/EfefEZR+4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752094614; c=relaxed/simple;
	bh=sdK745Vj3Y70qcYzUfHFCTbIE8JLEe6lZLmNzS2Lhb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uy88uh2iKGqoDWHHcpCevBmn/EzVKIq5RWT0J8rX8LlXsgVWK2DUcbBF8QhgZ5LnfcR8iw6JYciY53ftdqFT5dh2CdyTDDfWK4qI+WftnsTATKo/vnYOMMtmuD5eqQqQKe2qLZvVyxMZWZ4i/yHU6yX5+y4ji/aR+4fVkGI4Z+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VAG6I94F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569CobWx016794;
	Wed, 9 Jul 2025 20:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Embif+b7D2T
	39Tf+uoO+bQc+oYLdcrGbbEu3UPB0XCE=; b=VAG6I94FTt73z7ttOatEuZECm3l
	4h8rNSUx4GqfzITSs9uu10w9ot59iOtN6Io6oSbbQqhcdoYItwRaKzzHry6Sb8Uw
	VujZ1ukvap0PJBjpEB1v6yJJsBHw5MzLNN/QVWb+IkgNx98wyzGn0ojR4U+hOEeB
	7TR7Whq/kERX69Af+wQOytFB8mcyWbiKPyMozc6yCvVt/Uo6oaEN1DvsJ970WOid
	1sz5JbUQUwhWnf97pSoBGcDlz0yJDec7d4+vhauYJp+phw0sdL/w/iCrCrhSqi70
	W1EGF2XUleuy1qLIL3iUKVZVdiJI3aBfN7oI3oSrOK2qCdfOq84NN//Vu/w==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbntepb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Jul 2025 20:56:42 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 569Kudu5029896;
	Wed, 9 Jul 2025 20:56:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 47sdus4c7n-1;
	Wed, 09 Jul 2025 20:56:39 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 569KudWK029890;
	Wed, 9 Jul 2025 20:56:39 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 569KucsJ029886;
	Wed, 09 Jul 2025 20:56:39 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 5C15A57186F; Thu, 10 Jul 2025 02:26:38 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, bvanassche@acm.org, avri.altman@wdc.com,
        ebiggers@google.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, "Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V4 1/3] ufs: ufs-qcom: Update esi_vec_mask for HW major version >= 6
Date: Thu, 10 Jul 2025 02:26:33 +0530
Message-ID: <20250709205635.3395-2-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250709205635.3395-1-quic_nitirawa@quicinc.com>
References: <20250709205635.3395-1-quic_nitirawa@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDE4OCBTYWx0ZWRfX0hE0hVatRV0C
 YYl2Fnp0a4fA3hN4JUsxjgkvbkixTC6TD2wf6pGxC0xKECV9bDjha00BGoZXkn/jfo8Bk2urzg+
 yf0qNkDo2Gom/MFbEa33GSngWg9wbOEvl9KcjytY4vglGMJB+kg6P2+SKK7Tr2Hnm1dZo8VyGhW
 VGMRrWcr8KkcxHKoorcmSLbIKBCytxrsXVXkQUMwU8iuCnno86wNMLa+eM+BIAVsFsOhC482cZX
 RVFoOL/dP1l6nJq6ZYRj47fq7lxc/DNJFUb2flHigIFWugY6fxqFbmgLH8oxyjXOEM8023X2OJd
 hxigAttXI0gFb3SF6ZplbMaYaRAaXTLhID+kgfr+8NvR2sXUO2RM1zGEac4Ro9FOFBpG9MI9/4l
 LdQ4fNithzM+gmB857R6O46Ybp/Cc2L25uKYQNehpWpcDETJ+bQCBXyib92gECgAQi3WCDQi
X-Authority-Analysis: v=2.4 cv=QM1oRhLL c=1 sm=1 tr=0 ts=686ed78a cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=QKWVBJnHy1B2er2I7z8A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: yXGRr5bzM9082PkUlpN573GgOvr4Cn04
X-Proofpoint-GUID: yXGRr5bzM9082PkUlpN573GgOvr4Cn04
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_05,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507090188

From: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>

The MCQ feature and ESI are supported by all Qualcomm UFS controller
versions 6 and above.

Therefore, update the ESI vector mask in the UFS_MEM_CFG3 register
for platforms with major version number of 6 or higher.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bao D. Nguyen <quic_nguyenb@quicinc.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 318dca7fe3d7..dfdc52333a96 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -2113,8 +2113,7 @@ static int ufs_qcom_config_esi(struct ufs_hba *hba)

 	retain_and_null_ptr(qi);

-	if (host->hw_ver.major == 6 && host->hw_ver.minor == 0 &&
-	    host->hw_ver.step == 0) {
+	if (host->hw_ver.major >= 6) {
 		ufshcd_rmwl(hba, ESI_VEC_MASK, FIELD_PREP(ESI_VEC_MASK, MAX_ESI_VEC - 1),
 			    REG_UFS_CFG3);
 	}
--
2.48.1


