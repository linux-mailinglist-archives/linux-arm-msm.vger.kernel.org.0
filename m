Return-Path: <linux-arm-msm+bounces-4611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C270181209D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 22:22:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AD2F1C20971
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 21:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 405897E55C;
	Wed, 13 Dec 2023 21:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aBU0096L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E675AB9;
	Wed, 13 Dec 2023 13:22:37 -0800 (PST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BDJN4mC017654;
	Wed, 13 Dec 2023 21:22:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding:to:cc; s=qcppdkim1; bh=YzldKfErSjvVb5
	j3dF2jflK0ML+JqWJNTQ9c/IqnehM=; b=aBU0096L4EVC8TEIISlWkecjc5FQGU
	AH6AuONY7cBzCwW8xISsJ16o2NJ2t/AJRjNB6WgK4hI76Bklmod8kaeYdlKofMm8
	JU+0uGqdI8LkULgv4gBLaawvIwEeDTHJ4Ei/t5SxIJd5aikil2uayW1ervrfq7u7
	qv3fna2AdQl8R6DiMSwuH4Wz4izMs5sl1bABBpLyQdsTSYgoNSavsCeHHW1hUPBY
	TG/5jEXkjkzSCyKI2ihwgF0RE+vf+Itw76fRKLUsLh55W+sl3nS9UOiemaKldDJ1
	MR0FmcCmbzb3sQgTHLxTtxi2X8MU0mZhtO1z6BabqCh/3XT6K4WQFP8Q==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uy5tvj73s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 21:22:31 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BDLMUm8023610
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 21:22:30 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 13 Dec 2023 13:22:30 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v3 0/2] drm/msm/dpu: INTF CRC configuration cleanups and
 fix
Date: Wed, 13 Dec 2023 13:22:18 -0800
Message-ID: <20231213-encoder-fixup-v3-0-b5cd2cda6bf5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIogemUC/12MQQ6CMBBFr0K6tqbTUoKuvIdxAdNRZmGrrTQaw
 t0txMSE5fs/700iUWRK4lhNIlLmxMEXMLtK4ND5G0l2hYVW2gBoLcljcBTlld/jQzaAcFA9NKq
 1ojiPSOVYe+dL4YHTK8TPms+wrL+SUZtSBqmkbS3aGp2qGzo9R0b2uMdwF0sr67+vwWx9Xfweo
 Ks7ZyzZjT/P8xdKrgrd7AAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702502550; l=1322;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=FIiQB1GuWNsVi8WzN1oUt+9WK0oLRz87MAPu3Rs7wdI=;
 b=pVhtU0FiqzXfLsuygwngufSxFwnvk6pLDveVSNQpaIVH5oJLbdg8gJHWrNmcogkdVVMUW7Ow3
 r9idmxlOcF9AopIlFS0rTYez0+ub4Fdi26cjnEgQUjH2xVaMcT0X50o
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: L0AGnXu6bP7fdYY8rZdALUnVczVj2RTH
X-Proofpoint-GUID: L0AGnXu6bP7fdYY8rZdALUnVczVj2RTH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 clxscore=1015
 mlxlogscore=720 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312130150

This series drops the frame_count and enable parameters (as they're always
set to the same value). It also sets input_sel=0x1 for INTF.

---
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


