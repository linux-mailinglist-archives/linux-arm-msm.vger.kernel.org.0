Return-Path: <linux-arm-msm+bounces-64772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B0EB03864
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 09:54:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82B39164ED4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 07:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C511238144;
	Mon, 14 Jul 2025 07:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="f59l5jG8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6A12367B7;
	Mon, 14 Jul 2025 07:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752479660; cv=none; b=d+mFRBNYLRuXKPAjyfi8zU7tV7jwj4rWhixC7yFWLqahVoGXrRfDKDj4V92iqsDQRvUpn3nJgNRbdcq1OWR2NnydG6X1swoXzchqYLVw7w3AdvgGGaNHMpdi79L0pdJFiLhKXc7NiNwtGn9UvVJCcpemCONd2JERJYrt4iupyUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752479660; c=relaxed/simple;
	bh=sdK745Vj3Y70qcYzUfHFCTbIE8JLEe6lZLmNzS2Lhb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z55Qi1WljZJ78ZV7T9FZnZETmn9H638XeuQgf3m0UZ+O1PHoRkA2J23eTEn6OysjXAxUBcXL+l9HEujw4RGD2vPkbIfenEgkO9QG/dONVkwKcOTt/Dt2+y/mv6cPV208fu1uE4SN6yqci5yIEpf2wR9vmRpx7sHxiXLmpHjlF7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=f59l5jG8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E66jJe001833;
	Mon, 14 Jul 2025 07:53:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Embif+b7D2T
	39Tf+uoO+bQc+oYLdcrGbbEu3UPB0XCE=; b=f59l5jG8CFOcv7CntbNDq1+x/1p
	57iCUqU6QwHC+dHwlcQsi9oz9v4zYS/damvp7JkTS6tm6p5zTN01tiUMpMp7elga
	/WOMUiUUQawnhjoAhtnedvfdES5T3fhwTGGuketqxtVpqlri2sRTc+FCMHRuzM1J
	cRK+CFI3Uyurtvq7qAT96iDNQkBpjRNh5dfkzmArfPSvLiQdUc4KYT/KjT19kW62
	rTIOJVEVOkVv2xvd8MTZu3fbaAJ+5+XHpTZ74a+AIShUBK7zJLXfYvmvyuG4h7Ms
	dl5lvCReM/BkX04eiNPJChdAIgY2fLF6HezI/FY6nvO6Rsg7Dm7/6RcZEOw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47vvay0aaa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Jul 2025 07:53:42 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 56E7rca8007498;
	Mon, 14 Jul 2025 07:53:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 47ugskv3sc-1;
	Mon, 14 Jul 2025 07:53:38 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56E7rcKx007491;
	Mon, 14 Jul 2025 07:53:38 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 56E7rcNl007486;
	Mon, 14 Jul 2025 07:53:38 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id A7E23571872; Mon, 14 Jul 2025 13:23:37 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, bvanassche@acm.org, avri.altman@wdc.com,
        ebiggers@google.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, "Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V5 1/3] ufs: ufs-qcom: Update esi_vec_mask for HW major version >= 6
Date: Mon, 14 Jul 2025 13:23:34 +0530
Message-ID: <20250714075336.2133-2-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250714075336.2133-1-quic_nitirawa@quicinc.com>
References: <20250714075336.2133-1-quic_nitirawa@quicinc.com>
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
X-Proofpoint-GUID: mmysiaWmWVp_bI9yGgbp3NKwcE0s2J07
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA0NSBTYWx0ZWRfXwvuzOrUIYLwZ
 HfVfsjJrHM5l8K+xZDDcQclWcOhaJtcSR089+57a+Pq68ehlqm56lj/kgSB5PAnt/HQi3FkX6Ky
 l2ZWx9XFApB7nfx6uM2XWTPK/5Xf3khLVX8oPtL4sYNduEs/jJwVR6YVQek8lSraKPQoJGg4PhH
 ZXjHxoSesIJ8G2AbYaXKXvUNE8MfuTyxPVNzXnEX7mt+vx++PYu6ZmV3cuS3zQy4loeTqxIUlT6
 QoasBXeOUO1ZWxKCniffT+HhRb31rQ0J6FY/yPWHG7MiRWnUYGm/Gq14HjjNacQMdEgHNO1l5AV
 qWH+R7+Vd6wVH5DI7zEKeLoPvE5RyKoEOK46qehmZxDju9dc5qkDiUhBGGqW4/6vEQPpjT1JhD2
 LrNtj97CqVYHJGtcKomXZq9RryVWXxpFxD48TfnTWvabuyhikHT4QnqSh4+TyKZ7Ol+zBIix
X-Authority-Analysis: v=2.4 cv=GNIIEvNK c=1 sm=1 tr=0 ts=6874b786 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=QKWVBJnHy1B2er2I7z8A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: mmysiaWmWVp_bI9yGgbp3NKwcE0s2J07
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140045

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


