Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAB93710111
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 May 2023 00:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234015AbjEXWio (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 May 2023 18:38:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231827AbjEXWin (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 May 2023 18:38:43 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F5F390
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 15:38:42 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34OMIUtW024569;
        Wed, 24 May 2023 22:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=SDe+iQb430m/iPJDb0VDBp+h3tZHOwLPjToO1NVL978=;
 b=KeiBieb9UbKA2vvOrKAuSQtinclueR/DbdLn1G2kXSEt8JDnw7weK1+MUWeV0TVycGG/
 MnDfOAGZ2d0ahBBLxDreBAsdw/1F4OJBrOwy4nZGAJiSCQPNYqOSocPaqCQUdWj/BidZ
 lH6fcZ08+qR3uBFJlj8mtDKSbw1NcIR4/q4hwMxZpVQ9wYFiXkmb8B6OCwDkROoX2LIq
 1QbL+mefs9AS/caOVgoF2PFCdS2rez026+NKKJiuU3AHOIDL/8c2nF/JjJY0CE/Nliw4
 uymWcNT/giqhsQiBbhRekk2CJwvwjJAAMcIwxpZm6DTdpXspZ1xJ9o7gtxikqLYLupcK 1A== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qscpmt4u9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 24 May 2023 22:38:24 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34OMcOq5014621
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 24 May 2023 22:38:24 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 24 May
 2023 15:38:23 -0700
Message-ID: <7ed799fe-1f0a-3d14-3244-7ca351feaf83@quicinc.com>
Date:   Wed, 24 May 2023 15:38:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v14 3/9] drm/display/dsc: Add drm_dsc_get_bpp_int helper
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>
CC:     <freedreno@lists.freedesktop.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        "Daniel Vetter" <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, <dri-devel@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20230329-rfc-msm-dsc-helper-v14-0-bafc7be95691@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v14-3-bafc7be95691@quicinc.com>
 <7e5axjbnbhtdbrvtpcqnapp3p2xe2ekgj3aizssps2zesfhs22@trhwxetiif7p>
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <7e5axjbnbhtdbrvtpcqnapp3p2xe2ekgj3aizssps2zesfhs22@trhwxetiif7p>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fTZ2rHzRFGUgJu_t5oSAECqnU2aMy9Pg
X-Proofpoint-GUID: fTZ2rHzRFGUgJu_t5oSAECqnU2aMy9Pg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_15,2023-05-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0 mlxscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305240189
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/24/2023 12:14 PM, Marijn Suijten wrote:
> On 2023-05-24 10:45:16, Jessica Zhang wrote:
>> Add helper to get the integer value of drm_dsc_config.bits_per_pixel
>>
>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> 
> Nit: if there comes a v15, perhaps this can be squashed with patch 1/9?
> I always thought they were separate because one extends the header while
> this extends the C file... but now both extend the C file with helpers.

Hi Marijn,

Sure, will squash this if there is a v15.

> 
>> ---
>>   drivers/gpu/drm/display/drm_dsc_helper.c | 13 +++++++++++++
>>   include/drm/display/drm_dsc_helper.h     |  1 +
>>   2 files changed, 14 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
>> index b31fe9849784..4424380c6cb6 100644
>> --- a/drivers/gpu/drm/display/drm_dsc_helper.c
>> +++ b/drivers/gpu/drm/display/drm_dsc_helper.c
>> @@ -1436,6 +1436,19 @@ int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg)
>>   }
>>   EXPORT_SYMBOL(drm_dsc_compute_rc_parameters);
>>   
>> +/**
>> + * drm_dsc_get_bpp_int() - Get integer bits per pixel value for the given DRM DSC config
>> + * @vdsc_cfg: Pointer to DRM DSC config struct
>> + *
>> + * Return: Integer BPP value
>> + */
>> +u32 drm_dsc_get_bpp_int(const struct drm_dsc_config *vdsc_cfg)
>> +{
>> +	WARN_ON_ONCE(vdsc_cfg->bits_per_pixel & 0xf);
> 
> You did not add linux/bug.h back, presumably because Dmitry added
> another use of WARN_ON_ONCE to this file in a previous series and it
> compiles fine as the definition trickles in via another header?

Yep, this compiles fine without any error or warning.

Thanks,

Jessica Zhang

> 
> - Marijn
> 
>> +	return vdsc_cfg->bits_per_pixel >> 4;
>> +}
>> +EXPORT_SYMBOL(drm_dsc_get_bpp_int);
>> +
>>   /**
>>    * drm_dsc_initial_scale_value() - Calculate the initial scale value for the given DSC config
>>    * @dsc: Pointer to DRM DSC config struct
>> diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
>> index f4e18e5d077a..913aa2071232 100644
>> --- a/include/drm/display/drm_dsc_helper.h
>> +++ b/include/drm/display/drm_dsc_helper.h
>> @@ -27,6 +27,7 @@ int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params
>>   int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
>>   u8 drm_dsc_initial_scale_value(const struct drm_dsc_config *dsc);
>>   u32 drm_dsc_flatness_det_thresh(const struct drm_dsc_config *dsc);
>> +u32 drm_dsc_get_bpp_int(const struct drm_dsc_config *vdsc_cfg);
>>   
>>   #endif /* _DRM_DSC_HELPER_H_ */
>>   
>>
>> -- 
>> 2.40.1
>>
