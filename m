Return-Path: <linux-arm-msm+bounces-2794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE61800107
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 02:31:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38D13281572
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 01:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA0AC15C3;
	Fri,  1 Dec 2023 01:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U6lEyvi4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB39910E2;
	Thu, 30 Nov 2023 17:31:06 -0800 (PST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B11OIbU023702;
	Fri, 1 Dec 2023 01:31:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding : to : cc; s=qcppdkim1;
 bh=lL5LPWoqynUz811+lSvI5f46fxNGa5JB3siV0Ial9r8=;
 b=U6lEyvi4ECnoXfYmsz1NbkHutVNeJK2loOJSxbqyImvM2CLtElhEWok/05knyWxcLQwu
 08k4aSNbGxMsrqwg9mnltILy5h0+nAL2O8NWc4FyiI+zKZU9imIfxfJ+d118GE244uft
 RUtgdXfqp8/+RE1vRYTwWrZtOSOru8ts0V/VuNiNkDpzbor6mfJEeePtIMAaXVz0QZjQ
 QuZzs0OTht1C8eMLiAn/LOdNy/E68PBf210dCa5MlJI1NG9tJnA/CLqsKg8YrN3nVo4c
 HRpBp1CKE2A2SgYFnZ69H09HZXmJ7y3utAoxxAYbnW42xJ+M/Co7fJEAyMAq1FV7f7fU wQ== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uq3f7r9n1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 01:31:00 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B11UxgE024457
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Dec 2023 01:30:59 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 30 Nov 2023 17:30:59 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH 0/2] drm/msm/dpu: INTF CRC configuration cleanups and fix
Date: Thu, 30 Nov 2023 17:30:32 -0800
Message-ID: <20231130-encoder-fixup-v1-0-585c54cd046e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADg3aWUC/x2MQQqAIBAAvyJ7TnCNpPpKdCjdai8qShGIf086D
 sNMgUyJKcMsCiR6OHPwDbATYK/NnyTZNQatdI+otSRvg6MkD37vKA1anNSORo0DtCYmauL/LWu
 tHz7Xi61fAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701394259; l=1054;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=ZBK/2ML/yPdAWm4KnzoE/Yq4664M2aS3wyAmmBswsLg=;
 b=Bk/EOTFm3PKvlT31UCBAqFquX349JAJzfGvaaYiBvsBhWZgBZNMXrb2qesUBpeMx1Jzuv0WFl
 SgpG9wEyUfuCtoBspkBpT1aeBkG2r3PPLqcRauoQ2gHG3nS9yXzJx6I
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: wTJLSiEw7vAAhahnHGHLFK491AsvNGzn
X-Proofpoint-GUID: wTJLSiEw7vAAhahnHGHLFK491AsvNGzn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-30_25,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=591 bulkscore=0 clxscore=1011 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010008

This series drops the frame_count and enable parameters (as they're always
set to the same value). It also sets input_sel=0x1 for INTF.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
Jessica Zhang (2):
      drm/msm/dpu: Drop enable and frame_count parameters from dpu_hw_setup_misr()
      drm/msm/dpu: Set input_sel bit for INTF

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h   |  3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 18 +++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h | 11 +++++------
 8 files changed, 26 insertions(+), 30 deletions(-)
---
base-commit: 4047f50eb64d980fcd581a19bbe6164dab25ebc7
change-id: 20231122-encoder-fixup-61c190b16085

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>


