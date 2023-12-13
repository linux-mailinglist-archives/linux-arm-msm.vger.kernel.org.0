Return-Path: <linux-arm-msm+bounces-4600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CA581203E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 21:52:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7E4D1F218E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 20:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C4A37E571;
	Wed, 13 Dec 2023 20:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="R1WVgxil"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AB7FEA;
	Wed, 13 Dec 2023 12:52:21 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BDKmbc9015487;
	Wed, 13 Dec 2023 20:51:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding:to:cc; s=qcppdkim1; bh=n2jNeRRxW01CtY
	ew/3nk33eTHmhw6oPAngAUzCwNMGU=; b=R1WVgxilWhkkNy+otiXtSRfO5gldHZ
	6AevqZWnj27+Nq3tJR26sdntJN77PZchK+I/x70zcFRpLRjbdkKj2WaNhB8EQs1k
	+xKhy12ifm9o/BVuw95nLIDYTE4zJGK/q1RyCuaBCnCpO6Q8QHqhJV10TOqw9/uG
	QPOsArqIx/X9Ed/v7LpcVa2cAPHymCSvOSwhQUuhWiJAUAR8bwpJG/pCqnyg17m2
	o1/EuG1Qu7I2zt4MhIdnGvGeia1UacLZrx3nU1ISMCKvtzP65PqD7WbR4I5Q/g8D
	q8SznyttePzZpLjMlwmiFtcyi5B/6sGZq2VB56kBymjmeW1iTbImJYJA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uy4kjjbrv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 20:51:52 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BDKppE3015221
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 20:51:51 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 13 Dec 2023 12:51:51 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v2 0/2] drm/msm/dpu: INTF CRC configuration cleanups and
 fix
Date: Wed, 13 Dec 2023 12:51:26 -0800
Message-ID: <20231213-encoder-fixup-v2-0-b11a4ad35e5e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE4ZemUC/13MwQ6CMAzG8VchPTuzDragJ9/DcNBSpQc32GTRE
 N7dSTx5/Lf5fgskjsIJjtUCkbMkCb6E2VVAw8XfWUlfGow2NaIxij2FnqO6yWselUPCg76i062
 Fshkjl8fmnbvSg6RniO+Nz/i9/qRa/0kZlVa2tWQb6nXj+DTNQuJpT+EB3bquHzx+/yesAAAA
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
CC: <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.13-dev-53db1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702500711; l=1183;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=ulDl1Z4359OgnVEnX7++7qFtELleztErj9mZLsaPNtQ=;
 b=LvlJPGjOepSLoa0IIVoG2VOodfqIz4ggruPYN2yxOApKOeQ1eKB1H2eYC8bpcwRm6ROcYC7Bd
 DUyKLd39MAcAcLPrUhcsBNJmolCiYVliJdFzZhZpayP4VN6RkPC3cJD
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YcK94_jxG1j7yDz6BQw-MGlWZW_5pt2V
X-Proofpoint-ORIG-GUID: YcK94_jxG1j7yDz6BQw-MGlWZW_5pt2V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 mlxlogscore=720 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312130147

This series drops the frame_count and enable parameters (as they're always
set to the same value). It also sets input_sel=0x1 for INTF.

---
Changes in v2:
- Switched patch order
- Changed input_sel parameter from bool to u8
- Link to v1: https://lore.kernel.org/r/20231130-encoder-fixup-v1-0-585c54cd046e@quicinc.com

---
Jessica Zhang (2):
      drm/msm/dpu: Set input_sel bit for INTF
      drm/msm/dpu: Drop enable and frame_count parameters from dpu_hw_setup_misr()

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h   |  3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 20 ++++++++------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  8 +++-----
 8 files changed, 25 insertions(+), 30 deletions(-)
---
base-commit: 0d9372c346d4cdf347354382e0659de8c1cc0236
change-id: 20231122-encoder-fixup-61c190b16085

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>


