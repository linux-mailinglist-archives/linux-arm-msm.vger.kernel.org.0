Return-Path: <linux-arm-msm+bounces-4615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 424918120BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 22:30:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DAAC1B2102C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 21:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A81D7F548;
	Wed, 13 Dec 2023 21:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jQFmXpyu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63FFECF;
	Wed, 13 Dec 2023 13:30:42 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BDLK2Lm006960;
	Wed, 13 Dec 2023 21:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding:to:cc; s=qcppdkim1; bh=Ev7kWXtCWpfscX
	qMrC5pD7qQBgS/Ut8J4/WWemhWIGc=; b=jQFmXpyuK0o3h8gIC3QojdGajz+FKh
	FUM/yFbvGXRpfW+cSjwy4sFCfo3BDrOe2nMaVoDOEr/2UmOPGvD2y/hS7JDlVWu9
	lEjYlnPj6xo/rf5Il2i7SNzN1JMyhsJDgQ7JGYu1i5/nJcuiw7sg5sUULzhVmV8Q
	uyeF2u1HCwFBe6fcJvzHtmXi8rW/5I4qtR0H9b9A+lUcIa37TZPVYBDy6pKMZqzX
	Ioj5wzYaBjVw/FTl+hP1u+oRiwavurTCvgFpdFRQVOSmnrjoYMHa60Ccc1lVaWvq
	DyN2L7khlm8BKDfh4dxWJpvg1t9CP335naMxfMVtUh0Wy+UJKEo1E9vQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uyec5rxrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 21:30:36 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BDLUZxj002505
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 21:30:35 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 13 Dec 2023 13:30:34 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v4 0/2] drm/msm/dpu: INTF CRC configuration cleanups and
 fix
Date: Wed, 13 Dec 2023 13:30:16 -0800
Message-ID: <20231213-encoder-fixup-v4-0-6da6cd1bf118@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGgiemUC/33MQQ6CMBCF4auQrq3pTClBV97DuIDpIF0I2kqjI
 dzdQkyMxLh8M/n+UQT2joPYZ6PwHF1wfZdGvskEtVV3Zuls2gIVagBEyR31lr1s3GO4ygIIdqq
 GQpVGJHP1nB5L73hKu3Xh3vvnko8wX98lrValCFJJUxoyOVmVF3y4DY5cR1vqL2JuRfx4BL32m
 HwNUOWV1YbND6//ej17QxbJVkXdmG8/TdML+mBl+iwBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702503034; l=1501;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=BrFw3LR0P7+DgJHwX+8tV4/I8FlZ0hduE12ayCyh5II=;
 b=3zcJdCBVephq3qR1wVqlstsPb3t0SOACUT2nh1DnWlWHt1O5RDiRfONl4rLGiTegz9EzivYYp
 yiWtwBRBEYzC1eKJwRG3zuyJMJKNMbyB5VTlgotjBzZ+T0YEEEdICUB
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: QqonFjyOlCbqVH5biJBHWYrm0UHvZdqH
X-Proofpoint-GUID: QqonFjyOlCbqVH5biJBHWYrm0UHvZdqH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 suspectscore=0
 mlxlogscore=714 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312130151

This series drops the frame_count and enable parameters (as they're always
set to the same value). It also sets input_sel=0x1 for INTF.

---
Changes in v4:
- Moved comment about input_sel to outside of dpu_hw_setup_misr()
- Link to v3: https://lore.kernel.org/r/20231213-encoder-fixup-v3-0-b5cd2cda6bf5@quicinc.com

Changes in v3:
- Changed input_sel to u8
- Link to v2: https://lore.kernel.org/r/20231213-encoder-fixup-v2-0-b11a4ad35e5e@quicinc.com

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


