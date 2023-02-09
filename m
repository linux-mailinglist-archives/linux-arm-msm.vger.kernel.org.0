Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA57691084
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 19:44:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbjBISoy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Feb 2023 13:44:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjBISoy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Feb 2023 13:44:54 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E7664902D
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Feb 2023 10:44:53 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 319II4OQ002516;
        Thu, 9 Feb 2023 18:44:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=QMgMNNmivbUTOtle53nFqUlW1lrejd9pLXZRaxB59CE=;
 b=WPj2oq6+2dLhZYAcyT0aYSj0eBpNf7GwluZn3B9UJwVlzImBEicqijDinxJmnzS0TuoS
 dk08ViV6QW4m5+7iFo+zLpVrUds+gBg8IkNXejeL8ZbjnknhtYVjTkUPc9lEXg5uHql6
 UD75zmAKkrolQ466ykhCt+PSLkkFc1j8Hp3l1yQj5Yq9K2Ia1NQo2j5vjx1DwmYH+nvO
 G131LR1RIaFGyf2Jr93KDdeD8p2tX8Yg7fjr/LM7TW57j8vsnKEV4aY7HJ4piIOzhCKX
 uKsdjU5FGPrOF7xylTvKtyGB79R5kIbbqe6Xz7kPYffPWmwtGir2tqDTLLyA738Xsnxa cA== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nn5ek84hs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 09 Feb 2023 18:44:46 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 319IijNo009160
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 9 Feb 2023 18:44:45 GMT
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 9 Feb 2023 10:44:44 -0800
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
To:     <freedreno@lists.freedesktop.org>
CC:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <dmitry.baryshkov@linaro.org>,
        <quic_abhinavk@quicinc.com>, <marijn.suijten@somainline.org>
Subject: [RFC PATCH v2 0/4] Move TE setup to prepare_for_kickoff()
Date:   Thu, 9 Feb 2023 10:44:22 -0800
Message-ID: <20230209184426.4437-1-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rPN1FOYROn6pBrh_WO84Nhgda63bkTO2
X-Proofpoint-GUID: rPN1FOYROn6pBrh_WO84Nhgda63bkTO2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-09_15,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=795 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302090176
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move TE setup to prepare_for_kickoff() and remove empty prepare_commit()
functions in both MDP4 and DPU drivers.

Changes in V2:
- Added changes to remove empty prepare_commit() functions

Jessica Zhang (4):
  drm/msm/dpu: Move TE setup to prepare_for_kickoff()
  drm/msm: Check for NULL before calling prepare_commit()
  drm/msm/dpu: Remove empty prepare_commit() function
  drm/msm/mdp4: Remove empty prepare_commit() function

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 19 -----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  7 --
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 74 ++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 21 ------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      |  5 --
 drivers/gpu/drm/msm/msm_atomic.c              |  3 +-
 6 files changed, 40 insertions(+), 89 deletions(-)

--
2.39.1

