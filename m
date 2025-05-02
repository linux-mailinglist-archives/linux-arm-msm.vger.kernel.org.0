Return-Path: <linux-arm-msm+bounces-56440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E757AAA69C4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 06:25:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6D411BC46AE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 04:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4583619E97B;
	Fri,  2 May 2025 04:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="M0AeC1SZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0BF19B5B4;
	Fri,  2 May 2025 04:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746159952; cv=none; b=Ro3VzlAIXHnsgPOny7jneBZW6Co6khimAXWLxErcELakNEchPWIJ+IJntDouCw/AYk/fG8OSdU20AJl1zL1MLzdY1JFP8q75oEdkM0cdjcUYq9hGlopvIUE73HNl2n5UWS8mIoQepQBrGvTSYIRnq809IRXwnKRSqXvstmHCXIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746159952; c=relaxed/simple;
	bh=giJGEefJByRfIEslDgogwcZ3Xn2nicGt4CVA1PGb+cU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CDsBVNr3ZG/VDL1hGrkJBszYJ8Zqs0aMAgu3/GtS9kEedkttxJQA7xUUfsrOXFJ057HpepijJO1WbY2x2ZRJdoAbtCWk59WnykW5V74cwsSIz3S9POEHOHf6eLp24zQUd7fL/4G00PoXn7pkDQQsl6OC2Mkd3NicVhk1HbNBwUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=M0AeC1SZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5421NBmb002480;
	Fri, 2 May 2025 04:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6Kq05V55xQvosExyfqoILoNPtJmJQbyD7RX
	SIMucAjQ=; b=M0AeC1SZ8+vgS7qOwEUH79kJ8KpPqmLiuWSTrNp7REVizwk7k8x
	ovZk6KhinuQcAmvk705h27T6TNeJx8O1fq8kTgpDTGyQL6XEDNfVcywuyiKQSLZH
	vKzRCrF9kpKbLeAYqQoTKJtXjvCtrDdUVX8+c7jGhJWMxJCILwSo92NaAAqEgeJ5
	egaWLCU8cw3RBQxZjPWu6gKcFK0zoPBtq/B4WytnSfrvOqTQ0EviJoZXHIWo5sr5
	a/Spn9xy2JxHSrz1bBpGAlVqNkatLHMeCDqE/RCZr8IhAswF1SbkBJeucmO7TSqb
	LitolKlt4fl3YkdgoFOt4eOfxYE9XfzdDyw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u778pu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 04:25:26 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5424PO0G017775;
	Fri, 2 May 2025 04:25:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 468rjmp371-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 04:25:24 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5424PN8v017767;
	Fri, 2 May 2025 04:25:23 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 5424PN4P017764
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 04:25:23 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id 260B740C11; Fri,  2 May 2025 12:25:22 +0800 (CST)
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_ziqichen@quicinc.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        quic_rampraka@quicinc.com, neil.armstrong@linaro.org,
        luca.weiss@fairphone.com, konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: [PATCH 0/3] Bug fixes for UFS multi-frequency scaling on Qcom platform
Date: Fri,  2 May 2025 12:24:29 +0800
Message-Id: <20250502042432.88434-1-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDAzMSBTYWx0ZWRfXwpseNXm2NT47 yBrRkvF84nNiKMR2nKQjoy9hEyp2Nsn9oKDpf2BdiSNQqCqTl1vpDuFRWrP92EfVZwoUb2z9Par c9v5VYo2AmpxOu7q8Hy6oLsrsZmC7sn8Tv29Izlh8IADHiCNhxZBzCohCR4IiK3bExkK0ec+mo3
 ng98NBCext4NtgX5f6tVHpSkrP7RjlAK0U8Fhq4bbcnzAME+yaaWIIoQPYrKh4tuqohT27/NBl0 NTyTuVDVSFQJbIaNNcaAH3RwpP0DDIawGrGOptR58vy1eMLRoAeBCt7/f51F6nGgEyYHJn+kope k2IM3beOmfdm1cxaHoE1ur4MlN6bYqODlM2tAY5VIixR0/Et9Tch9Qc64zXPUb3t/WjsnWp6NSt
 Xuyj4S5BPs24dlB8GLpo4zRgvf6qI1ZhxDTzOBEHy9wWCBQkEF2aKt3kYyv5IOWJA83Df9c7
X-Proofpoint-GUID: 45af7yNWlcZYP_b9zdsAF28Mizl84ynk
X-Authority-Analysis: v=2.4 cv=W404VQWk c=1 sm=1 tr=0 ts=68144936 cx=c_pps a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=6H0WHjuAAAAA:8 a=L2RKipt3gwe40Om7ndYA:9 a=cvBusfyB2V15izCimMoJ:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: 45af7yNWlcZYP_b9zdsAF28Mizl84ynk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020031

This series fixes a few corner cases introduced by multi-frequency scaling feature
on some old Qcom platforms design.

1. On some platforms, the frequency tables for unipro clock and the core clock are different,
   which has led to errors when handling the unipro clock.

2. On some platforms, the maximum gear supported by the host may exceed the maximum gear
   supported by connected UFS device. Therefore, this should be taken into account when
   find mapped gear for frequency.

This series has been tested on below platforms -
sm8550 mtp + UFS3.1
SM8650 MTP + UFS3.1
QCS6490 BR3GEN2 + UFS2.2

For change "scsi: ufs: qcom: Check gear against max gear in vop freq_to_gear()"
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on RB3GEN2

For change "scsi: ufs: qcom: Map devfreq OPP freq to UniPro Core Clock freq"
           "scsi: ufs: qcom: Call ufs_qcom_cfg_timers() in clock scaling path"
The original pathes of these two changes are tested by: Luca Weiss <luca.weiss@fairphone.com> on
SM6350, but we have reworked the code logic later.


Can Guo (2):
  scsi: ufs: qcom: Map devfreq OPP freq to UniPro Core Clock freq
  scsi: ufs: qcom: Call ufs_qcom_cfg_timers() in clock scaling path

Ziqi Chen (1):
  scsi: ufs: qcom: Check gear against max gear in vop freq_to_gear()

 drivers/ufs/host/ufs-qcom.c | 134 +++++++++++++++++++++++++++---------
 1 file changed, 103 insertions(+), 31 deletions(-)

-- 
2.34.1


