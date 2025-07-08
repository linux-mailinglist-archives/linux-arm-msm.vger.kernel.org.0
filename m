Return-Path: <linux-arm-msm+bounces-64107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7154FAFD9CF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 23:26:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B20A3A49E7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 21:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49718248873;
	Tue,  8 Jul 2025 21:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nDUbCFiK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98F724397A;
	Tue,  8 Jul 2025 21:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752009965; cv=none; b=kLKAHZ9rvGb79Ukm6ni3o40qnMtiLMLCqGa0gnqgR+zma1zx3NjvWsYDnvx0B1lSDzeNbOz/FzWjO9ZzmbnazDUvIlrnyXvGl3LCIKYKU6V+JZdcsvJzPSs07reiM6GYBKpbOCr4hy13H261GWdyoTrI07fYyq+bwa4eaNmuDqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752009965; c=relaxed/simple;
	bh=sdK745Vj3Y70qcYzUfHFCTbIE8JLEe6lZLmNzS2Lhb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TAVqbY2pHkZY2ZhB7uHjZ3G1/HIaQKdZ/Ir2PONd7YBYvgRkkLaeAtloOBr/QmopVP5lN0uQ7nghNzOfIgdcgG4i+ZRT/sXHO5gHrzGswyHMx1E/nB/HEjRKVIu1GKykZItYq/v2zyjdRQrpdn+9KbnvlJxkxbZyaolVJ9HkKd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nDUbCFiK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568JFKiM012125;
	Tue, 8 Jul 2025 21:25:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Embif+b7D2T
	39Tf+uoO+bQc+oYLdcrGbbEu3UPB0XCE=; b=nDUbCFiK/yspgBayRompDe8fCkU
	SuqoWZzw8zch031qnCrbAaXM/Cya7g70VOiSqYSHpFhhM9TpBITn3AJHoEjSK6Yw
	91ug3Yt+uNoZNb0f1xKZEA1wBMOXkfn6a7dfW4k9vay0/JBTyXewh7Zinb0A8G9b
	mT4S1kxEjTNappngdTX22ZDRJ6Nfr4WgTZfdn8myWJ/+q7AF04E6p7Zt8HDz4hve
	N7MCGLld9b42uiqk9k+S1LMlMB0Fu7X2gZrdfBrVeYvf/g8a+KyBDI/xIgQPKg8j
	Gyicidx+ppp82rk3fJDciHDdETJvDpUxkcfBfilAl6WOqSRoua5DArxu84A==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv97snqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Jul 2025 21:25:42 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 568LPdMC000892;
	Tue, 8 Jul 2025 21:25:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 47pw4kvamj-1;
	Tue, 08 Jul 2025 21:25:39 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 568LPcKR000886;
	Tue, 8 Jul 2025 21:25:38 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 568LPc5Z000883;
	Tue, 08 Jul 2025 21:25:38 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 16B0757186F; Wed,  9 Jul 2025 02:55:38 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, bvanassche@acm.org, avri.altman@wdc.com,
        ebiggers@google.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, "Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V3 1/3] ufs: ufs-qcom: Update esi_vec_mask for HW major version >= 6
Date: Wed,  9 Jul 2025 02:55:32 +0530
Message-ID: <20250708212534.20910-2-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250708212534.20910-1-quic_nitirawa@quicinc.com>
References: <20250708212534.20910-1-quic_nitirawa@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=FrUF/3rq c=1 sm=1 tr=0 ts=686d8cd6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=QKWVBJnHy1B2er2I7z8A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE4MyBTYWx0ZWRfXwbnpjSXlFFPu
 DI82hFvxzFoVVuxhwo/hJJdb0vUOgenElLbIp/V8Kk3NGbaVV6fAzDzu0CdFm7gA3xBVlCK8N4A
 UJxS2VWeJt3VzNHdvznSf0cTYt0CIvEDKsaujKOidwAqbiWf6b2oFgvzSJsyDBMf0aJhW7A4JDo
 QurGqeNMLHi53qthnoq0cmDnTClTkO/xyhi1mDRuI+3BXzeCo/ZFFLEMvvyLCCaTEoliQfbDXSP
 KV0OBvX971UFkigBaxaVqnFPACwc7f+kSS8ZwGfdJBjIXXKaDleTdbPJO08MDVVZHdgTKO1ghBm
 Cikqaa++H2oUemvGgPSeocXnx0sgII3hXVdfJ8fU38k/F4ADYK1vgUjZZXXtKi+8+4Gv9hwSQO6
 RQ323/U/oL+hGm97ZIBk5wl+a1ZRh7EGe2ET+NrhmhBXrTLjutWAVmQU8n1PTxLBPAvufqn3
X-Proofpoint-GUID: VyxMTO_Vi3D9Rvvu-444DikJQLeM5vvJ
X-Proofpoint-ORIG-GUID: VyxMTO_Vi3D9Rvvu-444DikJQLeM5vvJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_06,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080183

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


