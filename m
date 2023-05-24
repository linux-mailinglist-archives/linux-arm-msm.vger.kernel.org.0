Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0920671016F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 May 2023 01:05:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238660AbjEXXFR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 May 2023 19:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236883AbjEXXFJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 May 2023 19:05:09 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 400F01AE
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 16:04:55 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34OMUCXv011897;
        Wed, 24 May 2023 23:04:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=QuHfUQynatqyifQ6CgogdzaTCv4reHdsHOKrAZ7Aczk=;
 b=VJnnH/oVl9rC/ktkSuNWc6kL5ClP84T4GMGsoTTV2dwQ07maG1bBGBZPXllqxWrMcQka
 XdlsK+FGE0Nj0IVI4PZbpZgjVvI4j8H6rBznx9Y/WSpkjJbpKztEvohb5tO3e1O52zQa
 OtCV6aziA0MmXnanCd1XKOwkw5PpeV5XCJCKEow/fApCHxEMQ4sV2n6NgjCLY/ln24T9
 LCPsseKjZbCoZ8kY1oBEAtUEZZD/Y0MF4rDYLYJH+PqolaJvBTG8RsPah+9VeltwjIvT
 KfmR/mbhT8ENr2lE5GnOpZzHepeiW1hnfWQD1KJ3zZuD19moz9WCofSITznJEXuNWOU0 pw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qsdhh21ma-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 24 May 2023 23:04:43 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34ON4Z2v024854
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 24 May 2023 23:04:35 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 24 May
 2023 16:04:34 -0700
Message-ID: <f010d346-fdbe-62b9-c403-4928b2e929fc@quicinc.com>
Date:   Wed, 24 May 2023 16:04:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [RFC PATCH v2 09/13] drm/msm/dpu: move pstate->pipe
 initialization to dpu_plane_atomic_check
Content-Language: en-US
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-10-dmitry.baryshkov@linaro.org>
 <4af411bf-290c-0818-bdf2-878b2da15146@quicinc.com>
In-Reply-To: <4af411bf-290c-0818-bdf2-878b2da15146@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: V2jj2hqtr-knT8et5UWiQhqYvLMJURrh
X-Proofpoint-ORIG-GUID: V2jj2hqtr-knT8et5UWiQhqYvLMJURrh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_15,2023-05-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 mlxlogscore=875 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305240193
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/24/2023 3:46 PM, Abhinav Kumar wrote:
> 
> 
> On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
>> In preparation to virtualized planes support, move pstate->pipe
>> initialization from dpu_plane_reset() to dpu_plane_atomic_check(). In
>> case of virtual planes the plane's pipe will not be known up to the
>> point of atomic_check() callback.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> 
> Will legacy paths be broken with this? So lets say there is no 
> atomic_check we will not have a valid sspp anymore.

I think it should still work, even if goes through the modeset crtc, it 
should still call drm_atomic_commit() internally which should have the 
call to atomic_check, once you confirm this , i can ack this particular 
change.
