Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0167074F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 May 2023 00:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbjEQWC0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 May 2023 18:02:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbjEQWCX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 May 2023 18:02:23 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 085A3469B;
        Wed, 17 May 2023 15:02:23 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34HLBE7f016876;
        Wed, 17 May 2023 22:02:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=MjwFGwrKXcHKZuONJRKdBvbjQ2iECCYMen616XRBHps=;
 b=OxZZkaVysd07G/txetDSYnK97bEwVBzEHVs5F626S5sfeaEzvghR/v0J/bJHZ9ieof7B
 o8b86ZeJC5TlnmA5tFZuwcl8kDkEny/VJ6nwp5e9JNdUrR66QkljYcWc2NrEi45bUuiV
 yzyxwN2OdhpRKy98jqfYHyz44tv/bb75JT/BePfGC1B83P/WeIb+cfwJZri1BnwD0bvO
 Ta9BZBRFYXVpev8ksI/dFmFl2zYC3jQ+8DH+vK3xXM9I+ljeFI++gKweCEqErrwtYOJD
 Ehjhjwn5etSVOjjVV5lcOUaKNdXRf8N6Q/HROMsOKC5C4IaS5H91Vk+WQB46ijn31w7q sQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qmrvht51j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 May 2023 22:02:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34HM2DcP000741
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 May 2023 22:02:13 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 17 May 2023 15:02:12 -0700
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
Subject: [PATCH v10 3/8] drm/msm/dpu: Guard PINGPONG DSC ops behind DPU_PINGPONG_DSC bit
Date:   Wed, 17 May 2023 15:01:54 -0700
Message-ID: <1684360919-28458-4-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1684360919-28458-1-git-send-email-quic_khsieh@quicinc.com>
References: <1684360919-28458-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: EUvz3l0kXwd1Bwz6_CZ6Ifm5NbWRauqb
X-Proofpoint-GUID: EUvz3l0kXwd1Bwz6_CZ6Ifm5NbWRauqb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_04,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 adultscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305170181
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DPU < 7.0.0 has DPU_PINGPONG_DSC feature bit set to indicate it requires
both dpu_hw_pp_setup_dsc() and dpu_hw_pp_dsc_{enable,disable}() to be
executed to complete DSC configuration if DSC hardware block is present.
Hence test DPU_PINGPONG_DSC feature bit and assign DSC related functions
to the ops of PINGPONG block accordingly if DPU_PINGPONG_DSC bit is set.

Changes in v6:
-- split patches, this patch has function handles DPU_PINGPONG_DSC bit

Changes in v9:
-- the original code of assigning dsc related functions to the ops of pingpong
   block without testing the DPU_PINGPONG_DSC feature bit was restored back
   due to rebase error which defeat the purpose of this patch. Remove those
   error code.

Changes in v10:
-- change commit title
-- correct texts at changes in v9

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 79e4576..437d9e6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -291,9 +291,12 @@ static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
 		c->ops.get_line_count = dpu_hw_pp_get_line_count;
 		c->ops.disable_autorefresh = dpu_hw_pp_disable_autorefresh;
 	}
-	c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
-	c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
-	c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
+
+	if (test_bit(DPU_PINGPONG_DSC, &features)) {
+		c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
+		c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
+		c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
+	}
 
 	if (test_bit(DPU_PINGPONG_DITHER, &features))
 		c->ops.setup_dither = dpu_hw_pp_setup_dither;
-- 
2.7.4

