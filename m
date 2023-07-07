Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB8674BA22
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jul 2023 01:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbjGGXxD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 19:53:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbjGGXxD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 19:53:03 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 389532114;
        Fri,  7 Jul 2023 16:53:00 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 367MeErc011322;
        Fri, 7 Jul 2023 23:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=wT7JOXu4/TRkDYOIYxOdT13I2xIXbbEmyVXkgsSeAfE=;
 b=h3J+LHvLAn+J3uaESPCxuakue4h7ZqSePqCasgVuwFw+VyGeAvP3E4GZK04v6+vWym16
 E2byva32jhYFrZCKEE8bI6fawYpt+Mjj7yY7yt6KATtlJ++1YATE1V3+os2c0chSx4Hq
 5yUlJI7xpC+SAoeBSlzozuFDYOk6iUPJE2iFPI1FTkfmZNZRcWoBo8L+3nOjtffb6dAw
 HwTdTrjV1AAkoVjbNeLHlZn+ZKL4oKszYSexBqVAjzS8+/AoI8678p6KGsS5gDJF0253
 s9PJihVqIRFyxAkVFw3gpuWXADrmejZQl1zVkM5QK4lwNmQCkHIfvMkRJ84CXLndlTgD 2w== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rpuas84eh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 07 Jul 2023 23:52:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 367Nqjvx006326
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 7 Jul 2023 23:52:45 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 7 Jul 2023 16:52:45 -0700
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
        <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
        <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
        <andersson@kernel.org>
CC:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        <quic_abhinavk@quicinc.com>, <quic_jesszhan@quicinc.com>,
        <quic_sbillaka@quicinc.com>, <marijn.suijten@somainline.org>,
        <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 0/5] incorporate pm runtime framework and eDP clean up
Date:   Fri, 7 Jul 2023 16:52:18 -0700
Message-ID: <1688773943-3887-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: b6jjv-QejyjQMr9-8s8W3uE0GP8xBVvE
X-Proofpoint-GUID: b6jjv-QejyjQMr9-8s8W3uE0GP8xBVvE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-07_14,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 clxscore=1011 malwarescore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307070217
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Incorporate pm runtime framework into DP driver and clean up eDP
by moving of_dp_aux_populate_bus() to probe()

Kuogee Hsieh (5):
  drm/msm/dp: remove pm_runtime_xxx() from dp_power.c
  drm/msm/dp: incorporate pm_runtime framework into DP driver
  drm/msm/dp: delete EV_HPD_INIT_SETUP
  drm/msm/dp: move relevant dp initialization code from bind() to
    probe()
  drm/msm/dp: move of_dp_aux_populate_bus() to probe for eDP

 drivers/gpu/drm/msm/dp/dp_aux.c     |  28 +++++
 drivers/gpu/drm/msm/dp/dp_display.c | 204 +++++++++++++++++++++---------------
 drivers/gpu/drm/msm/dp/dp_display.h |   1 -
 drivers/gpu/drm/msm/dp/dp_power.c   |   9 --
 4 files changed, 145 insertions(+), 97 deletions(-)

-- 
2.7.4

