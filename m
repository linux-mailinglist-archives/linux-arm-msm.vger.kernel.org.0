Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7E046BC272
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 01:28:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231725AbjCPA2f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 20:28:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbjCPA2e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 20:28:34 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F18324BC2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 17:28:32 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32FMaB9B020299;
        Thu, 16 Mar 2023 00:28:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Xj6nsssU+V+ezlW0YZ7mAr9/dBVwZEvq0GmnbnqRFdI=;
 b=gZpUInWB1e9IjNTaUMijXqZCAZsenKCTSbO968vM2Se+MRAsaLW+Cu2ZLmSdLixDl16m
 FdkCWQBdseBvug/lRXkpu6hvYR0Sewja7nsVoWRnj3uz9dNL/tLPS6ZnxPqJCdp2DzSq
 cXdQb1tn+gqY0IYHNBnP85CPFGhXE1jrq20LjUhC6WRo0Q/UNr8qUt5Lsy4VuTlqVF24
 Snq7MPDleJZfgOii42e9X0ZBAE7agYDw548DwU8A/3Ra5qZXAMnhFKe6YYr9Odrr1x8i
 g1FEJqsvS+x5ujJ6ux7Mp5TpOBnKGRhXbabqDmSEW1SjXDyJVpNtNyEFReLX/c9Lm5lw 2w== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pbpy38735-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 16 Mar 2023 00:28:21 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32G0SKgI024494
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 16 Mar 2023 00:28:20 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Wed, 15 Mar 2023 17:28:20 -0700
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
CC:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: (subset) [PATCH v2 01/50] drm/msm/dpu: set DPU_MDP_PERIPH_0_REMOVED for sc8280xp
Date:   Wed, 15 Mar 2023 17:27:46 -0700
Message-ID: <167892634700.18235.6967718018085667924.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230211231259.1308718-2-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org> <20230211231259.1308718-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: d9_2L3lYx-Lfh2HF3vXq1Iw6hpvtbhdj
X-Proofpoint-GUID: d9_2L3lYx-Lfh2HF3vXq1Iw6hpvtbhdj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-15_12,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=817 spamscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303160002
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Sun, 12 Feb 2023 01:12:10 +0200, Dmitry Baryshkov wrote:
> The SC8280XP also has a black hole at the top of MDP_TOP region. Set
> corresponding bit to disable access to that region.
> 
> 

Applied, thanks!

[01/50] drm/msm/dpu: set DPU_MDP_PERIPH_0_REMOVED for sc8280xp
        (no commit info)

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>
