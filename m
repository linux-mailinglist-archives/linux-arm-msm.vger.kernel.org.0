Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD4D74BB5A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jul 2023 04:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbjGHCSJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 22:18:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbjGHCSD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 22:18:03 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E733E2708
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 19:17:46 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3682Dbdi013126;
        Sat, 8 Jul 2023 02:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ulqXHTnSVhXeSCsXuK1tQZWJn8XC9VriTf8V1YytK2I=;
 b=Kz7lx1gSwWVdTODR8QNLKnr5ndK+WtMzlfNUEQ0WX5f5TNG66UxTcktQIJrP+bhJjSD1
 Xp+KU7HlneB9ImwqxCZAU9vnPhPTZ3VhlFHV2LrDORZ+fpJqyVNZf38PxOep5C3dbP4C
 l/IhA/TGZ8PrSIXY+6K93UkG3BhLOg+w6kaq+Ds+KBJznV7E3pQIgFKELZrHWt8h3rNK
 0t719qXbaCXrZRL0sByJKdMmUp7BePmAP4xGxTN6QVrftVHVGGMvoVG4er8aAQM/L2YF
 VuyvTGaV3w6mSH0YeA9YRbIrcWYnf2G13TRo9uWhoJ2nTcSVdYLAIRgBdYIirbZQ+Xyd +w== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rpxter068-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 08 Jul 2023 02:17:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3682Ha8Y007962
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 8 Jul 2023 02:17:36 GMT
Received: from [10.110.118.168] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 7 Jul
 2023 19:17:35 -0700
Message-ID: <2c880c8c-0156-e757-8205-8ddba15b85bf@quicinc.com>
Date:   Fri, 7 Jul 2023 19:17:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] drm/msm/dpu: fix DSC 1.2 enc subblock length
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230623013731.1088007-1-dmitry.baryshkov@linaro.org>
 <20230623013731.1088007-2-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230623013731.1088007-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QoWXY8OUPbATiOXeuLnkAvv5Ci-WijTN
X-Proofpoint-ORIG-GUID: QoWXY8OUPbATiOXeuLnkAvv5Ci-WijTN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-07_16,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 mlxlogscore=926 bulkscore=0 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307080019
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/22/2023 6:37 PM, Dmitry Baryshkov wrote:
> Both struct dpu_dsc_sub_blks instances declare enc subblock length to be
> 0x100, while the actual length is 0x9c (last register having offset 0x98).
> Reduce subblock length to remove the empty register space from being
> dumped.
> 
> Fixes: 0d1b10c63346 ("drm/msm/dpu: add DSC 1.2 hw blocks for relevant chipsets")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
