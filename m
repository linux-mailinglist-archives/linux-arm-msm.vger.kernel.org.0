Return-Path: <linux-arm-msm+bounces-56441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EA3AA69C6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 06:26:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 363229A11B0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 04:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B42BB19DF66;
	Fri,  2 May 2025 04:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jcKu8s2l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E20F18BBAE;
	Fri,  2 May 2025 04:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746159959; cv=none; b=iue01YeLI3WrZtk1SfCJONVhbkbL5fFX8UezCZn5iM+TGFgjdmku4+W1LkxvvT3GghTSGszFVv+DYyEROPR42t94N7LudvmBzFKCj8s/hEDNxj3AuR/sJodi6fWpKoQbgMVavAcFHm8iXc5NpLGP8ySv50kztfodEIBUl4Bb6yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746159959; c=relaxed/simple;
	bh=hPJe7n9YuNCZbSvQLnvuL57fjZhDV4zKHzUw1hqT/HA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o9pyqaQD/XVUmItaz0f+HEQkNOBJujb+ZNA978LV09qdDvid7cMWUxcePMaT4o0M2Gq5INRi8U4tJs8/3mt7eucz2VErQvoVbEOB6DXh6ADowv0SWBeNm41U+HjxObqxwWBeBnQWHz8i9qdb/uv+JMVNbslS/HvBI3JcHn57COo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jcKu8s2l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5421NawP016240;
	Fri, 2 May 2025 04:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=66LZBgTFEeL
	weI67xujwWJh4kBxoYVozuOjbtla8flQ=; b=jcKu8s2l/ZR2dmsT/tmlEXKdbnc
	UW0T1mXqiZy2B/5RPS/kNfoek0fSBJLTHS/C07JOLlQ1II/4gnJG/1t7Fe8BKfiT
	foME45KLV7LxSru9+DAeoXBY1vEU0Z50otAOWMzV1ViPDLRFg3Um7oi1VZ3Y8SnY
	2MoT4k2njcsJNj8aybjV7HrHt+/YexR4HdOxQCNda/pjrmPbKmqFOs2zKZ159zu6
	Arf/SypbVVCOT8vx1PJ4JgfcWvTdCm9/QOhAOwIzVHXi8d7kddiFxiIhAVx0u3I6
	CqB2SxC7JmHAQo7NYaNVw8soD97rA2D32TkA1vW8JC4ybNhJZw2Cjo8QDHA==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u4f785-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 04:25:35 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5424PXaC008326;
	Fri, 2 May 2025 04:25:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 468rjme1a7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 04:25:33 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5424PXpE008319;
	Fri, 2 May 2025 04:25:33 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 5424PWHC008318
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 04:25:33 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id E54D540C11; Fri,  2 May 2025 12:25:31 +0800 (CST)
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_ziqichen@quicinc.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        quic_rampraka@quicinc.com, neil.armstrong@linaro.org,
        luca.weiss@fairphone.com, konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/3] scsi: ufs: qcom: Check gear against max gear in vop freq_to_gear()
Date: Fri,  2 May 2025 12:24:30 +0800
Message-Id: <20250502042432.88434-2-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250502042432.88434-1-quic_ziqichen@quicinc.com>
References: <20250502042432.88434-1-quic_ziqichen@quicinc.com>
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
X-Proofpoint-ORIG-GUID: -SmXyvV58iMO31FjTBPKll25eCPyWfu-
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=6814493f cx=c_pps a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=ufAJUjbdAAAA:8 a=9A9eNvkZUzg5ubrkZe0A:9 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22 a=rB1ygNaI0PWiOa_UD5GD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDAzMSBTYWx0ZWRfX+zY7RzrRfPTX iAOxzbgJ8LBlRmP2YNjJfDWKyGleOW09dwjvysEqz2CsXxcwdRoeG+E/W25JUfgCyafTfRJxEEl dbx77WogW8aAZG7SGkEeNuKNrEbAu0yhU7QgSai0n787nxx5KYbsQzeBpxMbPlDyzEmkE2e1QnC
 L/aQMECcs5pe7L4PlL/pPR6sRte7fUZlHD0WuQK4iwVPu/TWas26yLQiH+FSnErDsGHXlM7GC8j Pl5ZEAjkNtpRxatYDw0+FDX9sNpe48gIq+3Mzqyt5zCORxHCy1aLb+eMMt1+nVjrB+eHluQCaw0 b1RRO80zmhOQzbeNuOxYR1T33kVwMUfWKoiHmIYlym1JHEZpXhOhhNhXmXUyegvipffpUR/vyj1
 la/4A19okYqADedZ5AS/fGYWWbTWw+h74gYeqHCSSbmA9dzS1rkGfPKllgeoBmiNZNuTaMMk
X-Proofpoint-GUID: -SmXyvV58iMO31FjTBPKll25eCPyWfu-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020031

The vop freq_to_gear() may return a gear greater than the negotiated max
gear, return the negotiated max gear if the mapped gear is greater than it.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 46cca52aa6f1..f5ea703d8ef5 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1938,9 +1938,11 @@ static u32 ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned long freq)
 		break;
 	default:
 		dev_err(hba->dev, "%s: Unsupported clock freq : %lu\n", __func__, freq);
-		break;
+		return gear;
 	}
 
+	gear = min_t(u32, gear, hba->max_pwr_info.info.gear_rx);
+
 	return gear;
 }
 
-- 
2.34.1


