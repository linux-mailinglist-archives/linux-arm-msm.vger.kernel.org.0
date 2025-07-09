Return-Path: <linux-arm-msm+bounces-64287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E29AFF356
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 22:57:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A9C95A4E4A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 20:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7C8223A9AA;
	Wed,  9 Jul 2025 20:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EMo1qaIx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EF123A9B4;
	Wed,  9 Jul 2025 20:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752094614; cv=none; b=gGNaFsc2yKKdHwmGWgaC7mVdTylyuBEQrla9UPRLbmooSjUC9KxBto9R7tPY4aX/PijKUeU3wbNABYO0u1xvAvo5rxUTFKi+abd+Q9QVOA2zqy6VEwhYw3OMtDrHcVlHAHlIiF51Q5hpC8W1auWfol5DlNmORouRSSM9RCzb7GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752094614; c=relaxed/simple;
	bh=uTDnsC9gh78Vna16UuEA/n7cxHquFqpIFKCITxcMRbk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rhYZS6NwXVas7F4TPE7QVFc+h3bkuQPC9nOLcjdPDu5RsunaWf5UekEHBjtaop4DeTd4yXriwlcATUlHfSzdIx2wTfdewdw+YCR+y4VGzf/1kGQipEUIkJBc/IZ1paak6s07C0f8+Uo0Tnlus+PkW78ihSAtyik3dd2mjaxm0lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EMo1qaIx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569CofRM023135;
	Wed, 9 Jul 2025 20:56:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=RouWShojFsmqS6of0/eSW5ACb/WhEfF28ye
	hu7XLt7s=; b=EMo1qaIxU5fxY1ppavqilTPWojE6d50rDqIodqDs/JuJMUo8t5o
	92YxNVJhyv6SfnNjH76fynDU+pNbcAopoB6kQjOmxz6+I4QoGJBmFLqTulV9S2wE
	fdb/F5EMeiYQW3POnQyzxXxpft6cuw5XNLXkXG+Du0z8UAReyP+99pWSM3DjZszc
	h21nuVjW36DUoDPVguY7uYCzzwYyotCBXrC2lITcmzTe9H58HfKh8adrDvjPpyBP
	DNBwZdmnsQmzt2ScymJVktHAObidB85IsDfoicKwKjo2dzAFgx3S/ayBLFPY55/w
	Umo2Y3FVeu5KZeIjJWq8TjEJ49xSK3pagBw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbejf9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Jul 2025 20:56:41 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 569KubSc029877;
	Wed, 9 Jul 2025 20:56:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 47sdus4c7e-1;
	Wed, 09 Jul 2025 20:56:37 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 569KubcL029872;
	Wed, 9 Jul 2025 20:56:37 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 569KubUB029870;
	Wed, 09 Jul 2025 20:56:37 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id EC41857186F; Thu, 10 Jul 2025 02:26:36 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, bvanassche@acm.org, avri.altman@wdc.com,
        ebiggers@google.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V4 0/3] ufs: ufs-qcom: Align programming sequence as per HW spec
Date: Thu, 10 Jul 2025 02:26:32 +0530
Message-ID: <20250709205635.3395-1-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDE4OCBTYWx0ZWRfX3k3SM7tTlEdj
 dbvjkObopihZgJ1+EH/hzE5FzEpoeqixpmkgoXr0e87QfsRNK37kj+9SKPTev0IfhIB7hLSQofF
 ZCzi9Qu/MhQlCPVHxDQ4gJh3YDwG7Rlg5t2b0upHc+GBv6EVEls+UWkh91HGuCd66kRpFqaz2BD
 lWYllpwYWlsuh1xgiza88sHVu0oRDLU/bmjGIuXndRqemap1ckjZqK1SOSqo0WrxCiCnPWuuF7r
 vs5UhMCHzWyfM6IqgfJGNHdGJZk3jEtnpE4+e99pK/xSl4y/+VKi1sL4mtiLlUQwp5NNf+cUa06
 ZtIadPgNogeVxuGvApuZMsz5EwdOySeKcJtftteLrjLwEDx4pTxN5aJekv7Mca8hAvgxUvkFXfK
 1BgnrXpnTOMOSlBb3zeYttKoRlCS7mKYG45FpxUrjAqDtalKiZzI0XcSN+z/oJbCS0FTOk4d
X-Proofpoint-GUID: MI5ahkw7KbVTt1oPv358LiEUBrMDjit8
X-Proofpoint-ORIG-GUID: MI5ahkw7KbVTt1oPv358LiEUBrMDjit8
X-Authority-Analysis: v=2.4 cv=VpQjA/2n c=1 sm=1 tr=0 ts=686ed789 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=iRjbf9KB49bWgsSTYZMA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_05,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 mlxlogscore=798 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507090188

This patch series adds programming support for Qualcomm UFS
to align with Hardware Specification.

In this patch series below changes are taken care.

1. Enable QUnipro Internal Clock Gating
2. Update esi_vec_mask for HW major version >= 6

Changes from v3:
1. Updated the kernel-doc comment for function ufshcd_dme_rmw
   to include descriptions for all parameters to fix compilation
   warning (W=1).

Changes from v2:
1. Addressed bart's and Mani's comment to move ufshcd_dme_rmw
   to ufshcd.c
2. Addressed Mani's and bart's comment to avoid initialisation
   of cfg.
3. Addressed Mani's comment to update commit text.

Changes from v1:
1. Moved ufshcd_dme_rmw to ufshcd.h as per avri's comment.


Bao D. Nguyen (1):
  ufs: ufs-qcom: Update esi_vec_mask for HW major version >= 6

Nitin Rawat (2):
  scsi: ufs: core: Add ufshcd_dme_rmw to modify DME attributes
  ufs: ufs-qcom: Enable QUnipro Internal Clock Gating

 drivers/ufs/core/ufshcd.c   | 24 ++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.c | 24 ++++++++++++++++++++++--
 drivers/ufs/host/ufs-qcom.h |  9 +++++++++
 include/ufs/ufshcd.h        |  1 +
 4 files changed, 56 insertions(+), 2 deletions(-)

--
2.48.1


