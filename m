Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC3E0681C9C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jan 2023 22:22:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230432AbjA3VWS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Jan 2023 16:22:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230425AbjA3VWR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Jan 2023 16:22:17 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF13746D4B;
        Mon, 30 Jan 2023 13:22:15 -0800 (PST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30ULGS64023980;
        Mon, 30 Jan 2023 21:22:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=rP644CWlFJnXB8zVRnRZJwV9nPo/mrHkmJtrCSumVBQ=;
 b=C6OY5lzRivZ41m7WBRNno5M3lIflnGhHHh03FZVlWUUzE5a3T3ZOkn16FQ4Gd9tozn5K
 lsQwxaXTcCGR/MFPYruruzlAZb+HmwsD5LXkpFFiATDS/4ldwth9b9x8d+qyUIpMAx+G
 PlGiBfjybjGqYAu+eCLAeDgzSzNw7r+7KIYbJF+Z6ea6IiZLoixNbO5lU0ykve1t4JQu
 n7rwRHN0BHPdhk1mO+PjgHLUu04Cb8LJfiQLsn3GviUDSGBvJruRtTJpvUappMXOva0a
 UHCturUu95QalwdVMgZRZcEFZJ7Kx32+tZW8LFc0lIc+MhfD1XlmChd1WuPsRjIxviKT IA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nefmfruvx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 30 Jan 2023 21:22:06 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30ULM5wk030052
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 30 Jan 2023 21:22:05 GMT
Received: from [10.110.114.165] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 30 Jan
 2023 13:22:04 -0800
Message-ID: <0a0c3a12-51e9-b0d0-9307-847023dbe1f7@quicinc.com>
Date:   Mon, 30 Jan 2023 13:22:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v1 10/14] drm/msm/disp/dpu: add supports of DSC encoder
 v1.2 engine
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
CC:     <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
        <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
        <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
        <andersson@kernel.org>, <quic_sbillaka@quicinc.com>,
        <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
 <1674498274-6010-11-git-send-email-quic_khsieh@quicinc.com>
 <20230123201133.zzt2zbyaw3pfkzi6@SoMainline.org>
 <926021c1-d9d1-4449-f01b-f405b48f326a@quicinc.com>
 <20230130201654.vlr7p7id3a7vxc2b@SoMainline.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230130201654.vlr7p7id3a7vxc2b@SoMainline.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jBjiJ9x80LuoOecV3mr4f9tKLkgnKl8X
X-Proofpoint-GUID: jBjiJ9x80LuoOecV3mr4f9tKLkgnKl8X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_17,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301300199
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Marijn

On 1/30/2023 12:16 PM, Marijn Suijten wrote:
> On 2023-01-24 15:52:46, Kuogee Hsieh wrote:
> 
> <snip>
> 
> If only replying to a small chunk somewhere in the middle of a diff
> and/or large review, please cut out unnecessary bits to make your reply
> easier to find :)
> 
>>>> +	data = (dsc->flatness_min_qp & 0x1f);
>>>> +	data |= (dsc->flatness_max_qp & 0x1f) << 5;
>>>> +	data |= (dsc_info->det_thresh_flatness & 0xff) << 10;
>>> dpu_hw_dsc.c computes this on the fly.  After removing that, and
>>> using initial_lines from the function parameters, only
>>> dsc_info->num_active_ss_per_enc remains.  Do you really need that
>>> msm_display_dsc_info struct here, do you need it at all?
>>
>> I ported these code from our down stream code base.
>>
>> I make it work first, then clean it up will follow.
>>
>> I submit it for review since it looks like you guy like to have code sooner.
> 
> Correct, I was looking forward to these patches albeit complete with the
> promised DSI support from Jessica, which still seems to be pending.
> 

DSI support is still being worked upon.

I dont think we promised DSC 1.2 will come with DSI together in the same 
series. It was always going to be DSC 1.2 + DP followed by another 
series from Jessica for DSI.

Lets set the expectations right.

Thanks

Abhinav
> When sending patches to that extent, with the intent of getting quick
> turnaround but knowing that they are not ready for prime time yet (or
> were they, based on your "submit it for review" mention? Don't you mean
> testing?), please annotate the series with an RFC tag accompanied with a
> description what still needs to be done and why.  That would have saved
> a great deal of comments and review.
> 
>> yes, eliminate msm_display_dsc_info is my next target and hope it can be
>> done.
> 
> Thank you.  Again, if that was the intent from the get-go, that's
> perfect material to put in an RFC series' cover letter.
> 
> - Marijn
