Return-Path: <linux-arm-msm+bounces-57106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0744AAD8FF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 09:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 070AA3B4408
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 07:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B113220F4F;
	Wed,  7 May 2025 07:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WQzJ4QcJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D90321FF4E;
	Wed,  7 May 2025 07:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603891; cv=none; b=AOaBrqOnFxqYFuC/AAjC0tOKwI1G+vhcdMM1K193b5uVqw6w7+InDttOIchvSfyp7sT26Ow2gC1o03vu1gWtPDDDqg4JYizW+ziQRH2pZ4xP4BMPS1pfnKq9B/Jw/sstsNC3D1nsQNwonoSnRQurPNXH2zGYhXAvVgNo4kU718U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603891; c=relaxed/simple;
	bh=o6Tahy15zqFxKs7+MQ29Fmt7M7H1QpM6ZzfPsO/YsXU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VNx09KMu3VPNKB57fzztZhiiBtjCSKnlHenU8jNmwOO76efFIaym0CC/4Sj+KvTvDi+56AoJRWmqiFaPfvVDr97TWSa/wOf4730KIiVbh96RMC+oGpnMLzIJpI6MoKmwYGUIPUC9t2HTHOvNhnhHGBtDW+5MHEnyU1ihIeEF6no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WQzJ4QcJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471Gskl003344;
	Wed, 7 May 2025 07:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/etNLGh1/gYsPiShISfdmgqOtYwtjB3/dDC
	dr/sCYjE=; b=WQzJ4QcJEzgOt8TVpIqDk5+dn8AhXnYLiQIIfKDPXPCNFnleqH7
	7b5yaFhgqx5KLeRkovFg8ejuOa6GuTUKEh73aBhiddHs406rAsbq4F4sjI4UD5/8
	xOtXef4JL+ZjkemuJ0a51yrHoe/wqoAq1SX7XMJ/98b+m/FhJFxB/NV8yfBLhDTs
	2uMrGMJh5pUiA2ll4bqlLOmmAEYM16SILbPPbhKH6GWnMOadShWauoFmakzLwb3b
	w7LrThSLg9V/D1ySUEx9wd5b9ORsSIj+NNSgKD4hE4tS/eZeRb0COgLlrJx9KtEK
	8zE91OT/5wn0vwTXUFw5btezH5U5UcJUoJQ==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5sv4xwf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 07:44:27 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5477iPuI032457;
	Wed, 7 May 2025 07:44:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 46dc7m7dx6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 07:44:25 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5477iOov032448;
	Wed, 7 May 2025 07:44:25 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 5477iOwb032410
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 07:44:24 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id 973C440CF7; Wed,  7 May 2025 15:44:23 +0800 (CST)
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_ziqichen@quicinc.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        quic_rampraka@quicinc.com, neil.armstrong@linaro.org,
        luca.weiss@fairphone.com, konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: [PATCH v2 0/3] Bug fixes for UFS multi-frequency scaling on Qcom platform
Date: Wed,  7 May 2025 15:44:12 +0800
Message-Id: <20250507074415.2451940-1-quic_ziqichen@quicinc.com>
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
X-Proofpoint-GUID: TbdHM0GwVCgMCHpp8oVQD-bZ0Ol7Crq0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA3MCBTYWx0ZWRfX6bbilpvP9O6x
 V//7aZ9YWk1GkKLGZlouokkXBeYEomTL2qHUdSjCA5emkYb6AxClBydpL6H7NWcEGFnz3tCxIUk
 ebD/u/41PsDMD9G2fGeUgpPJlhtv63e+pFOtN5nufwjdFYtDKCuV7hD0v37b/ouGBc4RoVKpA3W
 5hXohveei62sHnriBksCrvj/wuXMxSYthlluUFRZ3o4N3HPHDNspYZWkQLOs6TYJTWmcS8x4QD8
 H5ypcAKK/slHsiaKWFYfJ4zjTFlfZGAKB3CxFcBHaKLKP1be59eZnYspuRzAF/5LD/s3bd5UAXp
 ji9O5JiWaBCbIsZTsOqG3+4dXpW+bit9zk0pMZBpcFPJLJxJmfuXYqoaqKCY9Wh4QkelYLYn6Om
 TimeQotvUG0oTr6nA+KI3q7OjMZkZ2hCe5dOqSZ8w3bIFioC+NHvoL4nnzQzWPsC6HSiSNQE
X-Authority-Analysis: v=2.4 cv=cOXgskeN c=1 sm=1 tr=0 ts=681b0f5b cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=6H0WHjuAAAAA:8 a=L2RKipt3gwe40Om7ndYA:9
 a=cvBusfyB2V15izCimMoJ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: TbdHM0GwVCgMCHpp8oVQD-bZ0Ol7Crq0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=999 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505070070

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

v1 - > v2:
For change "scsi: ufs: qcom: Check gear against max gear in vop freq_to_gear()":
1. Instead of return 'gear', return '0' directly if didn't find mapped
   gear
2. Derectly return min_t(gear,max_gear) instead assign to 'gear' then
   return it.

Can Guo (2):
  scsi: ufs: qcom: Map devfreq OPP freq to UniPro Core Clock freq
  scsi: ufs: qcom: Call ufs_qcom_cfg_timers() in clock scaling path

Ziqi Chen (1):
  scsi: ufs: qcom: Check gear against max gear in vop freq_to_gear()

 drivers/ufs/host/ufs-qcom.c | 134 +++++++++++++++++++++++++++---------
 1 file changed, 102 insertions(+), 32 deletions(-)

-- 
2.34.1


