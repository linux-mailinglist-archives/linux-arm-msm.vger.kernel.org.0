Return-Path: <linux-arm-msm+bounces-59445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 663C8AC425C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 17:39:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 019E57A286E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 15:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98C2214223;
	Mon, 26 May 2025 15:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B2DqacOz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523CF1F4CA0;
	Mon, 26 May 2025 15:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748273933; cv=none; b=ja7OX5U8WNrx6jUWWlNhAtF4/5x1zQGZeOhYCDN1eTbO/OgcBHoIsz89PnKqshmQ9sfDxj6cUKKIfjf/2ZNVlnZjvmirP1SGG05FZbvAilmz2ATvLgaKpiJdhTPUPHZtpLP6m0zTJSQQK/QH+NZKGL1hMK7g2tOd6YxygxTDZWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748273933; c=relaxed/simple;
	bh=6QYRrzb6S5sXrC0ZYtjKoIKx1whODtLQfCOSSsC/vvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W3DiqZ94ezX77kLu26dGiKqzX6zN/4MJzPL33rGeXlEMd8N3HDLa9XrQJWbiCdlvkNcaWuXDkMU3Ah5A/gIyH4aIc6WDMvysQIApKt+gVM7xX+EQ4WMpd4elgO3sk5tUwxX3XP1FJj4Mau9esW0v3IWGki5oRtsRHXX27XCIEJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B2DqacOz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54QAAFRS003920;
	Mon, 26 May 2025 15:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iBwHxzu8i1w
	p3EObwJ3ZT1Q6Yi75A1EmoItTDkB3p4c=; b=B2DqacOzdKeSsKsye75P+Cqdqg/
	0z/wR9dSDz1EG5V1KNe7aw5NsHxA/RHh9ttWqLXuZhaxW9eabuQw/PsxPfWmLfVF
	7agfsbd8CVNvF13cFpa5j2g60d6S58A2WSzzscyt2Cme/x+YaWwbubvhakN3y1Zo
	B4mWHaPihzlnGzN5MNiCHwo01pAOs8SmLylsQTMhABoZmNEQmo4jCHMMX8KHds/l
	8HRTywnXfY37uDQDHyDUaZS6nWbYH0eRUOUQXc/Ic0g7xUIlaT1FO8JsKaPocvo2
	hN7Yq92kjGrJAqgyzWhFMjK+t1cFkgsIJXKBIn0uII4aqB6IMbD7W3I6OTg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6b5mk0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 15:38:30 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54QFcOWf032411;
	Mon, 26 May 2025 15:38:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46u76m73g7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 26 May 2025 15:38:26 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54QFcOOb032404;
	Mon, 26 May 2025 15:38:26 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 54QFcPr2032427;
	Mon, 26 May 2025 15:38:26 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id E104B602733; Mon, 26 May 2025 21:08:24 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V6 02/10] scsi: ufs: qcom: add a new phy calibrate API call
Date: Mon, 26 May 2025 21:08:13 +0530
Message-ID: <20250526153821.7918-3-quic_nitirawa@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=ZcodNtVA c=1 sm=1 tr=0 ts=68348af6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=UrAeSs0ZfGBAw6fyKjEA:9 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDEzMiBTYWx0ZWRfX7p1ubqt2hO3p
 x+lj/l65J/sMnQkrgO415ngIMzsl6PAGlPqMUibYzRvUgAq9gg93oexuf2NfwXQhks8rnzANQYj
 9aSKbUpxxRe8xyZVxu7YeEav9UJ23nNm4HiEiilfhgWqNBr1rFncqUQFipZSmvwnt0AK40xvjUK
 aEqYoH/eWBs7VK3e9n36HVJc4rl9b9oQAUGgk20qRIuHVfgoPvFas6PqQsC0m8IPeX76UJ0qo5U
 lSe0Wkv7bE3GQ23/yV1ph0EUYyXxPpFanY/97RPOyP+VL+Ue9+QpwTvuiDdsoP3qW93JZctHSBN
 7psmxtnGUPgzT6VkRWj0q2WqBc+PNv3YWarZBo829bEte1BuJvHwdKN7plJAveIpwWUorAYtEBC
 3sJTr8rk/nP6K59cS+XfJaAVIfZP6wD7ugUC37qc8JIoxkN3w0wQsVEFqYaml6bNdFfZk/WJ
X-Proofpoint-GUID: jgD_IlDW-5NYTtxdwc_bizfi9-iENxbu
X-Proofpoint-ORIG-GUID: jgD_IlDW-5NYTtxdwc_bizfi9-iENxbu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_08,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505260132

Introduce a new phy calibrate API call in the UFS Qualcomm driver to
separate phy calibration from phy power-on. This change is a precursor
to the successive commits in this series, which requires these two
operations to be distinct.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 62a5d76450b6..dfe164da3668 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -530,6 +530,12 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
 		goto out_disable_phy;
 	}

+	ret = phy_calibrate(phy);
+	if (ret) {
+		dev_err(hba->dev, "Failed to calibrate PHY: %d\n", ret);
+		goto out_disable_phy;
+	}
+
 	ufs_qcom_select_unipro_mode(host);

 	return 0;
--
2.48.1


