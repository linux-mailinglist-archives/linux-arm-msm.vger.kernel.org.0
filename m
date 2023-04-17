Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 677856E50C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Apr 2023 21:25:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbjDQTZ0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Apr 2023 15:25:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbjDQTZZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Apr 2023 15:25:25 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2157659D1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 12:25:21 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33HFchYL018512;
        Mon, 17 Apr 2023 19:25:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=JEYpsYKwHOR50Mnj7o+oga2T/cgqyoIPU1IgG6RtLT0=;
 b=Fo5zfqT3x2+lzRhSfbl07JPlTVSDSh+4/coZmc0VoNqifGYOO+nTxZ/w/GbUFxy6MRa4
 5Ikmu93iLeOj30i/6myqshTTfgxzzbdU005RTZZQ8ZIaIvP5QQl25Z/l0XH0DK0g6F1I
 1IartU+MTZz9vSHSC7kxDcPi+blzzK1pM8IJEdlnIH1hiOq8kaHFwTwCTXozNi8bEGIL
 S2HoR600mWamV2S2ZMV8z6sIkVYmEgZn6HwGX1LV477ABt6krGyhRBbgXjwRMX0+3iwL
 X+nyox2EdkuxarypiSxYrRppRNDleI4gqG1XGeX3K419aYcmx8O2WNGj65sr7DJNturZ Rg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q14gk995v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 17 Apr 2023 19:25:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33HJPDHE014304
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 17 Apr 2023 19:25:13 GMT
Received: from [10.110.98.241] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 17 Apr
 2023 12:25:11 -0700
Message-ID: <37656370-df7b-208e-9250-10583a54aa56@quicinc.com>
Date:   Mon, 17 Apr 2023 12:25:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 1/2] drm/msm/dpu: simplify intf allocation code
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20230415171926.85774-1-dmitry.baryshkov@linaro.org>
 <20230415171926.85774-2-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230415171926.85774-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: U_66wm-3LZHkv6cvLqGwHglNz7cXFwaj
X-Proofpoint-GUID: U_66wm-3LZHkv6cvLqGwHglNz7cXFwaj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-17_12,2023-04-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxlogscore=638 mlxscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 clxscore=1011 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304170171
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4/15/2023 10:19 AM, Dmitry Baryshkov wrote:
> Rather than passing DRM_MODE_ENCODER_* and letting dpu_encoder to guess,
> which intf type we mean, pass INTF_DSI/INTF_DP directly. This is
> required to support HDMI output in DPU, as both DP and HDMI encoders are
> DRM_MODE_ENCODER_TMDS. Thus dpu_encoder code can not make a difference
> between HDMI and DP outputs.
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Since it was previously agreed that INTF_eDP will be dropped in favor of 
using just INTF_DP for both eDP and DP (the previous cause of debate), I 
am fine with this.

Hence,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
