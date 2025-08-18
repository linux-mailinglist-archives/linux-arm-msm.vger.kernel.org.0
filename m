Return-Path: <linux-arm-msm+bounces-69561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB271B2A225
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 14:51:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6766918983D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 12:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCCC931B11A;
	Mon, 18 Aug 2025 12:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="e5a2oCrh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA76190692;
	Mon, 18 Aug 2025 12:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755520882; cv=none; b=n20ZNPQ0Ct4ANzuuxS6EMl0QR7mBExdkgm8y7xVPzRZ5tCrkoVIPcCZ7Pxr0+y6GmzyvAo4itJ7M3K1De3i5E37j8nrInWtkjfh1qn5DQYVCmsHFcZhuS9EyAz+WJCoAoVy2NrTSXFTKSktxzS3mK5kRnQMLuw7Z7ZAEFBsH+LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755520882; c=relaxed/simple;
	bh=3o+3vLq5CrdPUE6NKES/Zx1Omk+srVPd4LOkfRk5Wqo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fd0l5xZ1WUBNeQZvti8P1Pf6i4QtHj84k/0r6CCFw5y+XXo7AAYOu/7jzWzatTdyP8lY+oLIPCXEh5oImukgBzJsVHWK7TJmbpAF9I3LmYQUGgAM4acLgKLvhIvRagxEx5/cl1OAPUa/oLXyr0g42C/IL/ISheTfU4spjbMy1f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=e5a2oCrh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I7V45E004110;
	Mon, 18 Aug 2025 12:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YzkVLAGR/2wpz3nUZgJCWzEQHXpDoZJCDh1
	hFmuux+c=; b=e5a2oCrh/wCfKqb0mPlHuhRyoSSggp79+BQ8Va//uDk1PPCX+Cr
	eg6q3Xl5vw8Y+aHHndfRqb4aKLq/4n+H/WRMvP/iuoZ4V142ajaSkofLCMy4Jw3W
	EzdiqtT2o3V51CiEm1qC8EdLQjD2Q32XxHD+l4a9XS+K19zZsyjw4yxymo2BCp+D
	lewozuzJsEToCQ8CqL6JmYLczcwg2B5y7YU6vKenyDwrZ7Byt/XFxa6GBEaf0AVN
	9SPh04+VfHiE4kYdzWUbUjnQ+skgHWosAxisJB/SlK+iPE2+z1ZRe1a3vjTLGRAH
	Vzuz7YATd8XE8PhXo6hYVSsG4MsuQL5msLA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48kyur8wwc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 12:41:15 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57ICfCY9009281;
	Mon, 18 Aug 2025 12:41:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 48jk2khktv-1;
	Mon, 18 Aug 2025 12:41:12 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57ICfCFA009275;
	Mon, 18 Aug 2025 12:41:12 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 57ICfC4D009273;
	Mon, 18 Aug 2025 12:41:12 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 5884757363A; Mon, 18 Aug 2025 18:11:11 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, mani@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V2 0/2] Add regulator load support for QMP UFS PHY
Date: Mon, 18 Aug 2025 18:11:08 +0530
Message-ID: <20250818124110.8136-1-quic_nitirawa@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDA2OSBTYWx0ZWRfX0lhTUaClx/Wn
 jSsE+CoEPwrdQiaWqXIGW8GwQtlIXzr0OYlp+kSbgo3iDmrnlNdXvrCdvw6TZnWqljBqfQKUO+h
 IXG7ANUTTnfwF+pCt0LsfQoMuGZKRgmjXBwtR11haVSogviMYQAIC1kL3rtbUVwwZKznP8gFiTe
 5rUtOYcDi/UU4U00DwF9kpu2nh9OA7YqtnUpgKl6jABcpxfyjehYjGT0a9bM+t3GV66yx55HATm
 92gm/R1y8uv2drB2/w7bjpwb53tak0Q5fDV1XmIiJFFtaWxYTc1xNetdQLBQvBVcGAoAqqfBSWS
 VTpV5L8DPsT6YZ+tEhNy4j9s7V8+xWUR+Cj72MGVfSYTxM/Z8cuLk14TYCC2Vg9fWV+OmAYOyfU
 pX25bZ38
X-Proofpoint-ORIG-GUID: _GG5dkQMdypki_fZulONdKRJPWv_mjIq
X-Proofpoint-GUID: _GG5dkQMdypki_fZulONdKRJPWv_mjIq
X-Authority-Analysis: v=2.4 cv=YtIPR5YX c=1 sm=1 tr=0 ts=68a31f6b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=oykH4de7tLrJ1zPsMkEA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508180069

This patch series adds regulator load support to the QMP UFS PHY driver.
Currently, the driver only sets regulator supply names without specifying
load requirements, which can lead to suboptimal power management.

On some SoCs, regulators are shared between the QMP UFS PHY and other IP
blocks. The regulator framework needs to know the maximum load
requirements from all consumers to determine the appropriate
regulator mode (Low Power Mode vs High Power Mode) and ensure stable
operation.

The series implements a simple and efficient approach for regulator load
handling, with varying load requirements across different SoC
configurations.

Changes from v1:
1. Addressed comments to move load configuration from device tree to
   hardcoded, per-compatible data within the driver.
2. Accordingly updated commit text to reflect the same.
3. Addressed Manivannan's comment to avoid initialization of load.

Nitin Rawat (2):
  phy: qcom-qmp-ufs: Add regulator load voting for UFS QMP Phy
  phy: qcom-qmp-ufs: Add regulator loads for SM8550 and SM8750

 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

--
2.48.1


