Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 707CC6F1EF5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Apr 2023 21:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346531AbjD1TxK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Apr 2023 15:53:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346563AbjD1TxJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Apr 2023 15:53:09 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 394FA2716;
        Fri, 28 Apr 2023 12:53:05 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33SJ8LkK019378;
        Fri, 28 Apr 2023 19:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=EXAgEMjbth8cyVtARpfuh7S5goHbVAcNet1MmlFgCxs=;
 b=fbe/vBLUfFZtbsqbIoYuKWbC7T084410P8urofnEyTRWxo4HM+4e/tJvJyqwvmIbYjmv
 9/W6ePxl2OFPMR/1/weWGgrWszquLScs4Yqe+xVYXfX9bUXFbz/CzLWED1PLZeDG1vWw
 pyl4V9vI6Svin3h/iXOMecP/lOnAcqIwZZStf3rShsWihuHg9LFtyDd/3OSOZSbA8h4M
 WbhxU8bH5FlqmHNS0CIlwkDJ0ZqbEQTfbQih8iw1ta7PeoqXsUsDJo/D43Mz84kcymws
 cAwVFAYXqDl6VfFpFRZxkRXXUl+5yjkCWHHMwpUtXrQER25Amy0O3MaWwFmuRK1dlycK Ug== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q8fvngtcg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 28 Apr 2023 19:52:49 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33SJqmhE002597
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 28 Apr 2023 19:52:48 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 28 Apr 2023 12:52:47 -0700
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
To:     <robdclark@gmail.com>, <sean@poorly.run>,
        <dmitry.baryshkov@linaro.org>, <airlied@gmail.com>,
        <daniel@ffwll.ch>, <lyude@redhat.com>,
        "Srinivas Kandagatla" <srinivas.kandagatla@linaro.org>
CC:     Abhinav Kumar <quic_abhinavk@quicinc.com>, <javierm@redhat.com>,
        <tzimmermann@suse.de>, <quic_khsieh@quicinc.com>,
        <quic_bjorande@quicinc.com>, <johan+linaro@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/dp: unregister audio driver during unbind
Date:   Fri, 28 Apr 2023 12:52:29 -0700
Message-ID: <168271141820.10894.8416058508355144323.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230421145657.12186-1-srinivas.kandagatla@linaro.org>
References: <20230421145657.12186-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DxTjwicBopAh-zcTbWIi0XTGml9lwEz5
X-Proofpoint-GUID: DxTjwicBopAh-zcTbWIi0XTGml9lwEz5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-28_06,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=661 spamscore=0 bulkscore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304280162
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Fri, 21 Apr 2023 15:56:57 +0100, Srinivas Kandagatla wrote:
> while binding the code always registers a audio driver, however there
> is no corresponding unregistration done in unbind. This leads to multiple
> redundant audio platform devices if dp_display_bind and dp_display_unbind
> happens multiple times during startup. On X13s platform this resulted in
> 6 to 9 audio codec device instead of just 3 codec devices for 3 dp ports.
> 
> Fix this by unregistering codecs on unbind.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dp: unregister audio driver during unbind
      https://gitlab.freedesktop.org/abhinavk/msm/-/commit/85c636284cb6

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>
