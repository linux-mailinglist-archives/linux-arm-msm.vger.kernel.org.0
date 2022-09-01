Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A8695AA0F0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Sep 2022 22:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231936AbiIAUel (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Sep 2022 16:34:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231443AbiIAUek (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Sep 2022 16:34:40 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A78797961B
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Sep 2022 13:34:39 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 281JT1OR005375;
        Thu, 1 Sep 2022 20:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=Q9TSN0NSgVwqjK9PyRQKz0GDsZInAB+hqlu0cf+g4rg=;
 b=Tnvv99YvvHIdI0r+oJJlUe9s+TSV9fgX1WDS3yOdupcPlUSV0LYMFWd8T+dV7XR35gI+
 ZBNq1d1QhyV0eyyBw5RJ3j+54LgviN1QeaW6T32ddWGCqRjuIJsIEN0tTNG9ZqbU2Kax
 ZmdPtOHrg9GRt7yAO6u/TFbtXL+0alDN5kFSMJu0wQL3BYTq4/cfoYAFkscswhMuO7iQ
 DFziH10p91YsQOfnh9PRSxOEKqySqEk9GoAbIqJ7rZ5ePvfWI6wSyMBB//U7tqcdLdQL
 r15e2/WOxQ4pIcoLpf6eteOP8ftxeAqTlmoaQr2z47bAbKcv2AJhsFh97Psy1ROI95oV Ow== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jabqk4x03-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 01 Sep 2022 20:34:37 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 281KYaiF008325
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 1 Sep 2022 20:34:36 GMT
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 1 Sep 2022 13:34:35 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
To:     <freedreno@lists.freedesktop.org>
CC:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <dmitry.baryshkov@linaro.org>,
        <quic_abhinavk@quicinc.com>
Subject: [PATCH 0/2] Add support for HDR color formats
Date:   Thu, 1 Sep 2022 13:34:20 -0700
Message-ID: <20220901203422.217-1-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KFAjqE1QtdS_VzXr57nZd9RQ9lJP_HDB
X-Proofpoint-ORIG-GUID: KFAjqE1QtdS_VzXr57nZd9RQ9lJP_HDB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_12,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1011
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 mlxlogscore=780 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209010088
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for HDR color formats.

XR30 linear/compressed format has been validated with null_platform_test
on SC7180, and P010 linear has been validated with plane_test (also on
SC7180).

Jessica Zhang (2):
  drm/msm/dpu: Add support for XR30 format
  drm/msm/dpu: Add support for P010 format

 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   | 24 ++++++++++++++++++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  3 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  2 ++
 3 files changed, 28 insertions(+), 1 deletion(-)

--
2.35.1

