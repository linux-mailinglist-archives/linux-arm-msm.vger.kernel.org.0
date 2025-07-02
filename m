Return-Path: <linux-arm-msm+bounces-63425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3DCAF5C7B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 17:15:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48CF5480646
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 15:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3359C1D799D;
	Wed,  2 Jul 2025 15:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="H4UfagTF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9760E2D0C93;
	Wed,  2 Jul 2025 15:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751469308; cv=none; b=WYZOUIGRZYo0xbmuznsjkf9sdLDtrVYKRkJS2CaAIFPbJ9e8aEDHkslTAiqgxARUAX49X3H8WO9C1H0k4dAJZf2n0iMznbdpEGUYL+8Pn7xqzd2U0ORLf/ekswXY/iQyy0upgN10s71Sl6CGTT+3w9XUUAxbnEvXGOdideCDrEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751469308; c=relaxed/simple;
	bh=A1MwKY8R9c5ygJuMtjN4nERZGlHa0OEIm1Hk2GMQxEs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AjbM3n0Am9AJwK8t0dCswwlUUqSC3oBwCf6ANxH51JlL1026711AfxlsGL9JhuKJCmfPeS0oUGxY/mfG1nMtrk9+D6Y+dzS4ynjjLVS5gBpSmZYnVOvAf9IsAsdQLmimuwv0rQ95ovTTXlH0ejEXkR53+lEaJP1X+Bv1daxPiBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=H4UfagTF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562E6QeA025364;
	Wed, 2 Jul 2025 15:14:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pZzNTFmoUQLpNnJzSFEQsI8T2g7Vuik805t
	lJSpUsmY=; b=H4UfagTFSzoHaKm04ywyvAVHGYh73cmjbTHR7u4NH3XyfBxDkod
	CfT+gFBxioe9b7FLb857JsHH98N+FUKDgxwiDlRA7G5Veb17xDEJy1JGuj/oJGJ3
	AF5M5VG0atRvQ2VQ2+jBc7cueygomhYHXGpv2YmbsJLoFo5wsKbp2ydnyz8gUNTb
	vBmhw9QScVBO8n82MYR8RvuqY3SJC4sPOL07Z62N4qXo0VRNo7FLi4D/5GLJdNXX
	h4J7lKSC0xnquiVz8UlSbCeRbyNc73OoMlJwxOedG3m2S/eJ8UYLVmWRgFz6yr6z
	grfY1azRAIYrgKe3nTUwkd6cRTaQzB9WTvA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd64t96q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 15:14:47 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 562FEiWv025520;
	Wed, 2 Jul 2025 15:14:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 47j9fm57pm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 02 Jul 2025 15:14:44 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 562FEhf2025509;
	Wed, 2 Jul 2025 15:14:43 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 562FEhj8025507;
	Wed, 02 Jul 2025 15:14:43 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id A8A9961C6C3; Wed,  2 Jul 2025 20:44:42 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, bvanassche@acm.org,
        neil.armstrong@linaro.org, konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V1 0/2] scsi: ufs: qcom: Align programming sequence as per HW spec
Date: Wed,  2 Jul 2025 20:44:39 +0530
Message-ID: <20250702151441.8061-1-quic_nitirawa@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=68654ce7 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=g0woJlExcYKCPppWxPgA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDEyNSBTYWx0ZWRfX24PteLF38+ud
 9DqH5tUThRhfBix95kxNRLU19z3sJ9mv0/EfA3MDyJjD1zlBI8V6RaU5Aja8en1gK3Ldcs8x73m
 +u2uj0VUqR6FxpKKvIefD1mFDvtalD3CYt9IMDoGL3SJ86TtbN0eIOKLFrBxwDAXwGMKs924/5R
 jzUQQmeMLljwvxw3qhj4uzqeu+gCU8JdQgazTpRQaKAXYo5GmkPgXEZHG788xm3eJvHXp4IrFSX
 4pyRF8gzGeWhjsP98A3EIbbk9Dud4KaFGx3/45RoFMDIU7fipC/9wsTIEML1RYNwTbLjI1qspU9
 rBBzdTfZZIhXa8rbP9J56w3SmmdSKepfelZ13ypmrunO+oTNuKfVAUECrC2vaxww5VvOf/pl/j2
 qm5wnLnPlU1EgcWZ8OD79j+D8H+f6GgSOxNCbl0p7SsBc/yEpdBy67Cph8UPScZwehJEI+P8
X-Proofpoint-GUID: AZKPSsFjqqIFqQ5Hvvu9AeTaidvTqfWe
X-Proofpoint-ORIG-GUID: AZKPSsFjqqIFqQ5Hvvu9AeTaidvTqfWe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_02,2025-07-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=560
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020125

This patch series adds programming support for Qualcomm UFS
to align with Hardware Specification.

In this patch series below changes are taken care.

1. Enable QUnipro Internal Clock Gating
2. Update esi_vec_mask for HW major version >= 6

Bao D. Nguyen (1):
  scsi: ufs: ufs-qcom: Update esi_vec_mask for HW major version >= 6

Nitin Rawat (1):
  scsi: ufs: qcom: Enable QUnipro Internal Clock Gating

 drivers/ufs/host/ufs-qcom.c | 24 ++++++++++++++++++++++--
 drivers/ufs/host/ufs-qcom.h | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+), 2 deletions(-)

--
2.48.1


