Return-Path: <linux-arm-msm+bounces-98982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MD4WK48NvmlQFwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 04:16:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 249402E312B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 04:16:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 305CE30B9179
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 03:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A728B2F617C;
	Sat, 21 Mar 2026 03:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RIlwyyxO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639233016E1;
	Sat, 21 Mar 2026 03:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774062711; cv=none; b=ePvvsoes53Tkmtcm7ce2EH2sWiXUssWBYi/bm+y0WXRP9CMStQ9h3SCvXkrGFHEqpA5J3Au4FFT1k9v+OBU/dJz/YQLsEaVU8jq0KurINCewVEaZwgaSqGJibcTixicqEAKKFfZye33OhvYoPFKOCzyf0+ovIt0AJrQSrk8tSno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774062711; c=relaxed/simple;
	bh=ih2p5cyywYHN85x+zfM9SYVwS15fVln/nqKnCRbke1I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=REdnW20hl25lb4VLdvXFmutI9UoEqM0bsyEowtunVEG+Kjk/9H9nQ8oaOd950vr1c7Sy4tDrv45cd41UKgo6rv4nes9c+zGDjIjDPZnaSY0hkHgM5ZMed9fwXlqH5WviJ5ObMTTF72oPgS+3D71rLCovoBKMyqkJGHOaPDDTJHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RIlwyyxO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62KDi42Y1525556;
	Sat, 21 Mar 2026 03:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=etFI5BV2f41
	tOpHHNb7EmX9NKjOKNpYaUpG7TSywK/s=; b=RIlwyyxOKjpvM08X1lm9sZEAWYV
	l3d9y4TUw7hdcDOTE7OxX6luKf41b632cJute/G/X5um8zbGuZvkaasFbaGTmznP
	+hoOeNh4EPfFghD7eUZlUbdWLDnz7yRNqbg10kd97GDiiwrQVY8b3T/SC2V7ULtt
	77D1MhOXkmopUj9JtOj4KQ/mdLN7jtb/RSbwsuMeoWYH5L1iwnK3194nCY9nW7Tk
	lt4KDaVn4MklztVO+fFnRvM28w2njn3STZZXSeZPinmmpkl/NiaNEHu88Hx3Foex
	iEncElBNIPC6qjsDj7wseZFIrEDwGmlnbYic+0b+b7b/2b+a1a4gmCdV4Xw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0jt95629-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Mar 2026 03:11:41 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 62L3BeL3012486;
	Sat, 21 Mar 2026 03:11:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 4d05vf2sd2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Mar 2026 03:11:40 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62L3Be5n012479;
	Sat, 21 Mar 2026 03:11:40 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-cang-lv.qualcomm.com [10.81.25.255])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 62L3BeAM012477
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Mar 2026 03:11:40 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 359480)
	id 31A255A8; Fri, 20 Mar 2026 20:11:40 -0700 (PDT)
From: Can Guo <can.guo@oss.qualcomm.com>
To: avri.altman@wdc.com, bvanassche@acm.org, beanhuo@micron.com,
        peter.wang@mediatek.com, martin.petersen@oracle.com, mani@kernel.org
Cc: linux-scsi@vger.kernel.org, Can Guo <can.guo@oss.qualcomm.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-arm-msm@vger.kernel.org (open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER...),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 12/12] scsi: ufs: ufs-qcom: Enable TX Equalization
Date: Fri, 20 Mar 2026 20:10:21 -0700
Message-Id: <20260321031021.1722459-13-can.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260321031021.1722459-1-can.guo@oss.qualcomm.com>
References: <20260321031021.1722459-1-can.guo@oss.qualcomm.com>
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
X-Proofpoint-GUID: Nh-8138RfQp4_Tip1C8Sy96-iuW6Lrle
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDAyNCBTYWx0ZWRfX2DcNmVVFdnJP
 Qako1fg+QJM7jL92MczN81QWkaLkv4ENqsOUWcUwiV++/x7aRtBkCXlIwdNcV7L2EI+lF3R6c7g
 niKBip6ys2/7oj+yc9kIVQm5ok2qNzuivM2S4SylufryZuP0qQQ3oM74lSJ8QeDHzyXgJEA1iph
 Gq+fT8QUOXvygMjkUKEAweEomqPruFbA562pAbjYktzpAEyduvrLOIWfdOEzJ0RgnXbfzU6NAUF
 sGX2azGV9GASb0sk2cD3SvfGxp5H6EpSMpZWT2i9OzFjXGqivirQ1Qt/A+ER7M+pb0fH9c2Ts9E
 BHsfJ2UfqkoT1kxnD4dicfBfHMYn6tGqca/cCAGId3x0/c2Lso2IesqKg+QR4Vx9D5UDJ6Vi9fU
 3VeKww73AKqJMCd13pKiTaeN3IlgANa2fsFReacnLp3OtYJitt2kjgMoYcDox3GyaXzuOHPUWlm
 zWJQ8RzoxFmeO4rr7FA==
X-Proofpoint-ORIG-GUID: Nh-8138RfQp4_Tip1C8Sy96-iuW6Lrle
X-Authority-Analysis: v=2.4 cv=FKMWBuos c=1 sm=1 tr=0 ts=69be0c6d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=ENi0XzU5rTanaItzT-wA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603210024
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98982-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[can.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 249402E312B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable TX Equalization for hosts with HW version 0x7 and onwards.

Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 9abdeeee81f7..5a58ffef3d27 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1384,6 +1384,8 @@ static void ufs_qcom_set_host_caps(struct ufs_hba *hba)
 
 static void ufs_qcom_set_caps(struct ufs_hba *hba)
 {
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+
 	hba->caps |= UFSHCD_CAP_CLK_GATING | UFSHCD_CAP_HIBERN8_WITH_CLK_GATING;
 	hba->caps |= UFSHCD_CAP_CLK_SCALING | UFSHCD_CAP_WB_WITH_CLK_SCALING;
 	hba->caps |= UFSHCD_CAP_AUTO_BKOPS_SUSPEND;
@@ -1391,6 +1393,9 @@ static void ufs_qcom_set_caps(struct ufs_hba *hba)
 	hba->caps |= UFSHCD_CAP_AGGR_POWER_COLLAPSE;
 	hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;
 
+	if (host->hw_ver.major >= 0x7)
+		hba->caps |= UFSHCD_CAP_TX_EQUALIZATION;
+
 	ufs_qcom_set_host_caps(hba);
 }
 
-- 
2.34.1


