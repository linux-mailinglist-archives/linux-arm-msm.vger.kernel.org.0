Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE226705BB0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 May 2023 02:07:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231461AbjEQAHy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 20:07:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjEQAHx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 20:07:53 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAAF31B5
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 17:07:52 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34GNgdID010932;
        Wed, 17 May 2023 00:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=4SMVEAH1zC9rMwo82eLAdC4vZTdlbhje86lZmHbv0UE=;
 b=l3LRabwmjg4VtY4jqEgTtP9E/WeKfVva0S7d8v5JT5a9hQXrvI1OGK7+R9KCheCmrA8Z
 cqYYbF8XPPGvKtEo24SEVMevANDvkrJ7J69na8ZhcIJsWBsPV4QSNQSixPNr1Toi2ucu
 nvylOhizlX4O9QF35n5HR9Tu4Z8lShBW/IH6QlXJu50AXg4911TU7ivXQaNJxLqvUhAm
 oQkQ3tPifBeV7Qv+3LzWq1ZRuA65r38Ui7WJClscT+FG+A+xYrI3MpXiYfdohoAGpVpa
 OsfxVNePdAwFFCqw+29QgaEo1yZIgh1+IiRuon/2aNFtobvlWQZYAFdfBq2ruDBS8jew Sw== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qkkq9ccs0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 May 2023 00:07:45 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34H07iTL020007
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 May 2023 00:07:44 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 16 May
 2023 17:07:43 -0700
Message-ID: <4c24babe-3983-6406-75a4-eaa432cf39c3@quicinc.com>
Date:   Tue, 16 May 2023 17:07:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v10 4/8] drm/msm: Add MSM-specific DSC helper methods
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     <freedreno@lists.freedesktop.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        "Daniel Vetter" <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, <dri-devel@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20230329-rfc-msm-dsc-helper-v10-0-4cb21168c227@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v10-4-4cb21168c227@quicinc.com>
 <kx3be4c2okye2ts4rzy4j4ltnveixf7v4rxp5v4tl2irvevg6t@c5tuelunmn4c>
 <0e8a8af5-5ab8-c1b9-e08d-909072cc9b76@quicinc.com>
 <4cbqbu47vcshskl4npyzos5r7gxipjbbzyfvdfx7fenfh4mzmx@jj6lrysp35du>
 <a5a56711-3607-407c-aa8f-aed39a41fb73@linaro.org>
 <v4qix3bdxj3ykmjsokzrtubozdqh2fnh4mevpiz6v2y63csjb7@hddxgbi4yjgn>
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <v4qix3bdxj3ykmjsokzrtubozdqh2fnh4mevpiz6v2y63csjb7@hddxgbi4yjgn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: j2yDsnACBkLjXsngOe5nJ45W-2p_9AI1
X-Proofpoint-ORIG-GUID: j2yDsnACBkLjXsngOe5nJ45W-2p_9AI1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-16_13,2023-05-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 mlxlogscore=863 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305160203
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/16/2023 3:49 PM, Marijn Suijten wrote:
> On 2023-05-16 01:07:05, Dmitry Baryshkov wrote:
>>
>> On 16/05/2023 01:01, Marijn Suijten wrote:
>>> On 2023-05-15 13:29:21, Jessica Zhang wrote:
>>> <snip>
>>>>> Const, as requested elsewhere.  But this function is not used anywhere
>>>>> in any of the series (because we replaced the usages with more sensible
>>>>> member accesses like slice_chunk_size).
>>>>
>>>> Acked.
>>>>
>>>> I would prefer to keep this helper so that we have a way to easily get
>>>> BPP information from the DRM DSC config in the future, but if you'd
>>>> prefer we add this helper then, I'm also ok with that.
>>>
>>> The inverse helper is available ad DSC_BPP in drm_dsc_helper.c.  Perhaps
>>> we can move the two variants to the header and define them uniformly?
>>> This isn't MSM-specific it seems (i.e. the format supports fractional
>>> bpp but no RC parameters appear to be defined for such a format yet).
>>
>> I think DSC_BPP was removed (around v2 or v3 if I read changelog correctly).
> 
> Seems like it was removed at some point indeed, and now the helper file
> picked up an identically named DSC_BPP macro but with the inverse
> implementation :) - at least it's a *.c file.
> 
> Perhaps we can make it more consistent by defining both ways with
> concise macros in a header.

The changes in this series don't touch DSC_BPP so I think moving that 
might be a change for another time, but I can at least move 
msm_dsc_get_bpp_int to drm_dsc_helper.h.

Thanks,

Jessica Zhang

> 
>> As for the fraction-point BPP, I think AMD supports .5 bpp granularity,
>> see drivers/gpu/drm/amd/display/dc/dml/dsc/qp_tables.h
> 
> That won't use the helper then.
> 
>> With best wishes
>> Dmitry
> 
> - Marijn
