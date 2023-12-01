Return-Path: <linux-arm-msm+bounces-2797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 052C2800125
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 02:41:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B349C28159A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 01:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A484217CD;
	Fri,  1 Dec 2023 01:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nTfHqQi3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A448910F8
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Nov 2023 17:41:21 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B110Ti1023367;
	Fri, 1 Dec 2023 01:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=pBbhuJzhpm5p17tfCiZjVePgIX8Yff0eR3/crDOPvGM=;
 b=nTfHqQi3wd40Xgemo1IIU0akv1B7R+jjXEyRnNnYcYV+/exSzPEKe/NFkihy6ui/kbJJ
 BgwDsJtPfcZRpPrWUyu3zFS59qMUuMc01FbatyB73BEhN/ojq7SuGqW2aRXMe0JcmGIX
 TiD1+DIC/1XhSE28XvP4CzHb7TsjK41GsEUFkGltdUaqUN3TQCBgQ6jDTlaGllYBBp29
 WyTUKEIk1nvFM7LZdXT8p5nWxvJDGGIU4ijoQyKAsIrJP360oXIIv7WbqzeBmxPKEeEd
 Xg0+BXt0la4LVe2seRRALz5z3HFS/raANWGO6qK/H+IGZ0sQH9zfexrLeIdK6OJPpFoA sQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3upgfd3csy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 01:41:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B11fD4J026903
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Dec 2023 01:41:13 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 30 Nov 2023 17:41:12 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
        <quic_jesszhan@quicinc.com>, <marijn.suijten@somainline.org>,
        <steev@kali.org>
Subject: [PATCH v3 0/2] Stabilize use of vblank_refcount
Date: Thu, 30 Nov 2023 17:40:53 -0800
Message-ID: <20231201014101.15802-1-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7AR5ny3XfkB31_g17sqTSPOBU9WrlTHv
X-Proofpoint-GUID: 7AR5ny3XfkB31_g17sqTSPOBU9WrlTHv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-30_25,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 mlxscore=0 adultscore=0
 phishscore=0 mlxlogscore=717 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2312010009

There is currently a race condition occuring when accessing
vblank_refcount. Therefore, vblank irq timeouts may occur.

Avoid any vblank irq timeouts by stablizing the use of vblank_refcount.

Changes from prior versions:
   v2: - Slightly changed wording of patch #2 commit message
   v3: - Mistakenly did not change wording of patch #2 in last version.
         It is done now.

Paloma Arellano (2):
  drm/msm/dpu: Modify vblank_refcount if error in callback
  drm/msm/dpu: Add mutex lock in control vblank irq

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          |  6 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     |  6 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 11 +++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 11 +++++++++--
 4 files changed, 30 insertions(+), 4 deletions(-)

-- 
2.41.0


