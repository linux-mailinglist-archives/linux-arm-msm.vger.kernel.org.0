Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 610E76BA125
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 22:07:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbjCNVHw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 17:07:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbjCNVHw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 17:07:52 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31D0243467
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 14:07:49 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32EL0w6Z010774;
        Tue, 14 Mar 2023 21:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=xfs3BomODTH2nNbkDdLehVmjwhkRYstmxYqyNrCZbDE=;
 b=ItyDe77yPf2NIrBL0DRVXn66t+BZKoq3bMW91I50zmCMRXae5NGP10/D1di9N9NURXNM
 jEHQsvPq9be76f+XrBU/onY0l7YnNljdph7WZ+SpMg8IWgxn4+kS9E4bAwG8CAV0xSrd
 /4rTv+7YoMcOk5sX7hXtXKn3+YhvKXmE+zIY/q31yMo047SXcgXZ15n/GoWPArOOWZTh
 aB17oP6GXXsBSM79n4EqMsbu+w2grquS6hh9MM5wcELugTThPJy/8+ATGNycQfgdemjm
 pJ1NUMd/hia/gTh7386vu8wPo+A+updPabiWUihdw42BGUdM8epdT3LbZzDEpHAvkOqE zw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3paef8b48d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 14 Mar 2023 21:07:42 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32EL7ffY016437
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 14 Mar 2023 21:07:41 GMT
Received: from [10.110.64.241] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 14 Mar
 2023 14:07:40 -0700
Message-ID: <6254bcc7-fc29-d59d-a5da-9e7da47a12b9@quicinc.com>
Date:   Tue, 14 Mar 2023 14:07:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v6 27/32] drm/msm/dpu: add support for wide planes
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
 <20230314153545.3442879-28-dmitry.baryshkov@linaro.org>
 <CAA8EJpqTT1BK5oDNbL=t8BMwVjK_swDdD-L4o2PZ2Zec09qSnQ@mail.gmail.com>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpqTT1BK5oDNbL=t8BMwVjK_swDdD-L4o2PZ2Zec09qSnQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: cyffcLhICMPPrdY3AzpC4Dh29k6GdUjv
X-Proofpoint-GUID: cyffcLhICMPPrdY3AzpC4Dh29k6GdUjv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_14,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 impostorscore=0 clxscore=1015 spamscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303140169
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/14/2023 8:41 AM, Dmitry Baryshkov wrote:
> On Tue, 14 Mar 2023 at 17:36, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> It is possible to use multirect feature and split source to use the SSPP
>> to output two consecutive rectangles. This commit brings in this
>> capability to support wider screen resolutions.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  19 +++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 127 +++++++++++++++++++---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |   4 +
>>   3 files changed, 133 insertions(+), 17 deletions(-)
>>
> 
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> index f52120b05b6e..494c1144075a 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> 
> [...]
> 
>> @@ -1016,21 +1026,58 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>>                  return -E2BIG;
>>          }
>>
>> +       fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
>> +
>>          max_linewidth = pdpu->catalog->caps->max_linewidth;
>> +       if (DPU_FORMAT_IS_UBWC(fmt))
>> +               max_linewidth /= 2;
> 
> I added this check and only after sending it caught my mind that this
> check should not be applied in the non-multirec case. Please ignore
> the series, I will resend it later.

ack, will wait for the next rev
> 
>>
>> -       /* check decimated source width */
>>          if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
>> -               DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
>> -                               DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
>> -               return -E2BIG;
>> -       }
>> +               if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
>> +                       DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
>> +                                       DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
>> +                       return -E2BIG;
>> +               }
>>
> 
> [skipped the rest]
> 
