Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE8287C91D6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Oct 2023 02:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbjJNAdh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Oct 2023 20:33:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbjJNAdh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Oct 2023 20:33:37 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF7B1B7
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Oct 2023 17:33:35 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39DMmB17020965;
        Sat, 14 Oct 2023 00:33:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=cjipiq3+EJ1v6XustUMA+8h3rIsxAxc3vEfkaVgcIPo=;
 b=ajTDmgHfvQroK560PsctRlgutYR8IznAjXnoC6AykAwmxWEAB4CBDJvtVsuy3ugcQ4F2
 X9itI4JNlxb6vDsKm+cQq3gPvCLF0UfpWtoVh9bCrPvHRQt6OCoLlie2hti4cUbg2+3q
 yhwmewxD/ptK0x1V96hvbgPg+BNYpC3lYIFZahNFCOtMe6S+904Q5egNZLkOz9/+lIQC
 VpMH64xbD8eZIeMoIDEVMLKagYkqCaspkmjSRF3MtCx6qRkcj4Om/GmvqqEbZdJb6SJJ
 pIeM20uW9FC6xnhlv5fsqhZDadzalAgy2y+y/UWvUsr72yqXamyn6HSnEXGLfjtH2KPM 9Q== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tpt10b4ug-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 14 Oct 2023 00:33:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39E0XDgu013616
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 14 Oct 2023 00:33:13 GMT
Received: from [10.110.47.104] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 13 Oct
 2023 17:33:12 -0700
Message-ID: <956c53b4-d4f4-5a08-b86d-8c48374caa4f@quicinc.com>
Date:   Fri, 13 Oct 2023 17:33:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] drm/msm/dsi: use msm_gem_kernel_put to free TX
 buffer
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
References: <20231012012909.450501-1-dmitry.baryshkov@linaro.org>
 <20231012012909.450501-2-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231012012909.450501-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AVvVmyd2onyecKIVG7xlYKl-2qpar6u2
X-Proofpoint-ORIG-GUID: AVvVmyd2onyecKIVG7xlYKl-2qpar6u2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-13_12,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=830 phishscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310140002
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/11/2023 6:29 PM, Dmitry Baryshkov wrote:
> Use exiting function to free the allocated GEM object instead of
> open-coding it. This has a bonus of internally calling
> msm_gem_put_vaddr() to compensate for msm_gem_get_vaddr() in
> msm_get_kernel_new().
> 
> Fixes: 1e29dff00400 ("drm/msm: Add a common function to free kernel buffer objects")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

