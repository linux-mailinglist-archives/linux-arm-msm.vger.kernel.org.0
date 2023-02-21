Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2A3469E7BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Feb 2023 19:43:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbjBUSnY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Feb 2023 13:43:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbjBUSnX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Feb 2023 13:43:23 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF18BB777
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Feb 2023 10:43:22 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31LCiorA010786;
        Tue, 21 Feb 2023 18:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=ReHgq6f8vYxOZxU4sR6lnGnXA3gLvjBR1tTElKx7+TM=;
 b=Bi0a1mzo1BbKTu8EYH0QxGGnWplvCroO1ob2qbUIqrsq0Nqr1t2VR7Ibw59v1TFUScoj
 qwDyfj7KUBbE09v+u/8JDuJ7R8ulJqmzqzksWVQgjl00wiECp7jIGDgdmrKvXKnAlPUf
 yIb7jf60NAu+aWLnTLXGcCLDJSlENPHgu/iddvkUJadtP/V5NKPgEZAW+BB6lfPb+c09
 0CgsfiD4zMZjj3Fel1GYg/qE0nJbNyrS/26UMvq7sKGN3rTZ0R+ZA0dQF6CBuZxzzizV
 OSEitmyFaHqLRI8lW/1VASwinR7vmmYo5mtBoH1qwtXnNAYpCslDb1FVOaCq+OZqGRvB eg== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nvn8ra4em-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 21 Feb 2023 18:43:17 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31LIhF8e009037
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 21 Feb 2023 18:43:15 GMT
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Tue, 21 Feb 2023 10:43:15 -0800
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
To:     <freedreno@lists.freedesktop.org>
CC:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <dmitry.baryshkov@linaro.org>,
        <quic_abhinavk@quicinc.com>, <marijn.suijten@somainline.org>
Subject: [PATCH v4 0/4] Move TE setup to prepare_for_kickoff()
Date:   Tue, 21 Feb 2023 10:42:52 -0800
Message-ID: <20230221184256.1436-1-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AkqznDMoIbPcqoMU1KBeVNttcvJxOVqx
X-Proofpoint-ORIG-GUID: AkqznDMoIbPcqoMU1KBeVNttcvJxOVqx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-21_11,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 mlxlogscore=967 bulkscore=0 adultscore=0 mlxscore=0 clxscore=1015
 impostorscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302210159
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move TE setup to prepare_for_kickoff() and remove empty prepare_commit()
functions in both MDP4 and DPU drivers.

Changes in V2:
- Added changes to remove empty prepare_commit() functions

Changes in V3:
- Reordered "drm/msm/dpu: Move TE setup to prepare_for_kickoff()" for 
  clarity
- Fixed spelling mistakes and wording issues
- Picked up "Reviewed-by" tags for patches [2/4] and [4/4]

Changes in V4:
- Reworded commit messages in [1/4] and [3/4] for clarity
- Removed dpu_encoder_phys_cmd_is_ongoing_pptx() function prototype

Jessica Zhang (4):
  drm/msm/dpu: Move TE setup to prepare_for_kickoff()
  drm/msm: Check for NULL before calling prepare_commit()
  drm/msm/dpu: Remove empty prepare_commit() function
  drm/msm/mdp4: Remove empty prepare_commit() function

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 19 -----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  7 -------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  8 ++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 21 -------------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      |  5 -----
 drivers/gpu/drm/msm/msm_atomic.c              |  3 ++-
 6 files changed, 7 insertions(+), 56 deletions(-)

-- 
2.39.2

