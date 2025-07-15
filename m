Return-Path: <linux-arm-msm+bounces-65066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D57B063E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 18:05:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 806103BB48B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 16:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 581E7231C9F;
	Tue, 15 Jul 2025 16:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UMJijqwX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D5C1E5B7B;
	Tue, 15 Jul 2025 16:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752595550; cv=none; b=agmp/Jf+NOXt7wQO264vvSU1My4y0LP5u3uFBQvx0+5ZTgIAJvJ7XLzLFwvoElhyeag3Cf6f/yFe+4SJpu3Rh0gEN02F1iwFyzZZwshrgEWVqkDqS9KiphQR5qTwq4PwVtcB7JpwHZv7DhyPyiGxT0iqdraIXLIUn0CkkWOlE0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752595550; c=relaxed/simple;
	bh=WFFV8yh7Bx2YrgdBMFx0okBQoJwCRLLW0Ltk2ac7NYY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pbLRgosAnTuKjb1h5xC3MBMhU0qh/GahoCb1pQI0l9zP1d/Qn3IyQdna/t7+V3531aYu8jjYPhylJLRxe8LE54FvoRG2Zjc0JefTyll+q/xftBrnEHUQM4qbcRQ3qb5vUGK3eg+hvG8bZmL0o9Bh65rwjd6wa5F3DQ5qwcTP0jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UMJijqwX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FCYnfY026500;
	Tue, 15 Jul 2025 16:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=B9hPFpJcL+weohiKr5gDxt
	HHHe8VIYpAWEbMdLK+px0=; b=UMJijqwX9N5g+ObzKyJKtQIvvRtoTkPYm0Z0dL
	/4wWUKsSnM6uZ7hH43/2/VvTWb6RDm/lhUZkYjocDdc7cD2Pxdhz0Z/grVRyHPPY
	urVbw9H4SbF3TwGcu/4vPKRIdWEmeGhgGbqbyO2a0ZDuNMFI4D9+Ojm+YIWz9WcJ
	cuT5dy1qw68RJ++M/bjuN0WEu49gPwtfL1M6qbpmcCruGmUwnODAw14RafN0Je1n
	wW3lDtWtnnNfR7jdXHyc7xrmT9uSJswuiJxCnSXerY2tkYGM5eLUaPn/q5JfU3mg
	Yy9i7kSBocn79SUhB8J+pWNz6xOmK0wUQ2xVDNcL+3QHs5yQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5drksb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 16:05:42 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56FG5fcU011956
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 16:05:41 GMT
Received: from hu-pkambar-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 15 Jul 2025 09:05:38 -0700
From: Palash Kambar <quic_pkambar@quicinc.com>
To: <mani@kernel.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>,
        Palash Kambar
	<quic_pkambar@quicinc.com>
Subject: [PATCH] ufs: ufs-qcom: disable lane clocks during phy hibern8
Date: Tue, 15 Jul 2025 21:35:24 +0530
Message-ID: <20250715160524.3088594-1-quic_pkambar@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: wcqqyxC9JNACcl2OL9s-Swhd-pQDp5p4
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=68767c56 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=qBOcMjo_XwzxJe9kIfcA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: wcqqyxC9JNACcl2OL9s-Swhd-pQDp5p4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE0OCBTYWx0ZWRfX0ihsGZISHTBn
 fGGeTFvFY29UVg9Bsx5VWbGVKEejZda2Wl3kTbQ7Y6Hgj7ZFp0YzHWHarnBuX1flZmGv/X04OJO
 o0FlASxsobAGY5jlWuiKcXkv2C8dVpjcznfTYMzfEOwICZEVF+hvCKEqdoxtt2XuO1M11v07Q3U
 iBfm7QTtZyjLJbWxl8OTk/MzBUa0Q2PgkoF4lPvoJmpYwFkEg0+5QUb9r/JWOYjgGDjij9ilfsN
 xU50zUooLvsD+10LQBZYEjioG9Q7yEKm0osOXQbvstHN2ATNS5GTiudqc8IkWLzahusSr5R3iDz
 juj3iRov0eyGThczmFwml2UqI06dQJTL58+qFSJLJiBOaA/Fy2QIu4fWFVmlKMug2ijt4M9yi4f
 gta4EmIQmJ/weGt9Y+gQvmhaNyfl1uMrbpgeKjWdXeqfgAOKj+5M0DZrwCPARpCEXB6m3a/Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=659 impostorscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150148

The UFS lane clocks ensure that the PHY is adequately powered and
synchronized before initiating the link. Currently, these clocks
remain enabled even after the link enters the Hibern8 state and
are only turned off during runtime or system suspend.

Modify the behavior to disable the lane clocks immediately after
the link transitions to Hibern8, thereby reducing the power
consumption.

Signed-off-by: Palash Kambar <quic_pkambar@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 318dca7fe3d7..50e174d9b406 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1141,6 +1141,13 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
 	case PRE_CHANGE:
 		if (on) {
 			ufs_qcom_icc_update_bw(host);
+			if (ufs_qcom_is_link_hibern8(hba)) {
+				err = ufs_qcom_enable_lane_clks(host);
+				if (err) {
+					dev_err(hba->dev, "enable lane clks failed, ret=%d\n", err);
+					return err;
+				}
+			}
 		} else {
 			if (!ufs_qcom_is_link_active(hba)) {
 				/* disable device ref_clk */
@@ -1166,6 +1173,9 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
 			if (ufshcd_is_hs_mode(&hba->pwr_info))
 				ufs_qcom_dev_ref_clk_ctrl(host, true);
 		} else {
+			if (ufs_qcom_is_link_hibern8(hba))
+				ufs_qcom_disable_lane_clks(host);
+
 			ufs_qcom_icc_set_bw(host, ufs_qcom_bw_table[MODE_MIN][0][0].mem_bw,
 					    ufs_qcom_bw_table[MODE_MIN][0][0].cfg_bw);
 		}
-- 
2.34.1


