Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33AB06CF7A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 01:47:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbjC2XrY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Mar 2023 19:47:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjC2XrW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Mar 2023 19:47:22 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2735D59EA
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 16:47:22 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32TKgcCT009411;
        Wed, 29 Mar 2023 23:47:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=dk506eupXI76tZ4hWA6Aym+KnsOfo//o0Q5Bo22J4lc=;
 b=HMMUdJFyJgbrOdZGUC6EXY4cEDX8phm17BYQwCtGdpNxbGDttZuznbfGulxuviBGKUMs
 QnPNq3qt4mdPmEqaxEa62xAN7tqofOZh2yCmA5mb/uyBcn3foPiONgTNa7WtSb9a0yPL
 wWod1F8HwdO9X18+NPtFVR4f0Yhjhif7WWQqzR/dsOuEQnW9KBJVqVYLsdxMABHISy0B
 cXT3NOCo1bCmEp8b+yBZRn93penrYBbkfJvguskYEo6lrE9Sur+33SfmMMO1SnlDEAOA
 rf+tJwefpj5Gd8hRNiYtQQkkRMasaZ7Am8C3746GUV0JNFxz9t76CvICIhK96He15Co+ Cw== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pmjjd240y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 29 Mar 2023 23:47:17 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32TNlGe7005464
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 29 Mar 2023 23:47:16 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 29 Mar
 2023 16:47:15 -0700
Message-ID: <7b3dd2e2-bc9a-b4ad-1a79-a00c846f1e65@quicinc.com>
Date:   Wed, 29 Mar 2023 16:47:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFC 1/5] drm/display/dsc: Add flatness and initial scale
 value calculations
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <freedreno@lists.freedesktop.org>
CC:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, <dri-devel@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20230329-rfc-msm-dsc-helper-v1-0-f3e479f59b6d@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v1-1-f3e479f59b6d@quicinc.com>
 <5b713a38-2f3c-05b4-b243-6d9c0bd9e728@linaro.org>
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <5b713a38-2f3c-05b4-b243-6d9c0bd9e728@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: J-SM4LJuQwjqCBplv6pgIfw-LDOMipWL
X-Proofpoint-ORIG-GUID: J-SM4LJuQwjqCBplv6pgIfw-LDOMipWL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_14,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303290177
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/29/2023 4:25 PM, Dmitry Baryshkov wrote:
> On 30/03/2023 02:18, Jessica Zhang wrote:
>> Add helpers to calculate det_thresh_flatness and initial_scale_value as
>> these calculations are defined within the DSC spec.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   include/drm/display/drm_dsc_helper.h | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/include/drm/display/drm_dsc_helper.h 
>> b/include/drm/display/drm_dsc_helper.h
>> index 4448c482b092..63175650a45e 100644
>> --- a/include/drm/display/drm_dsc_helper.h
>> +++ b/include/drm/display/drm_dsc_helper.h
>> @@ -17,6 +17,16 @@ enum drm_dsc_params_kind {
>>       DRM_DSC_1_2_420,
>>   };
>> +static inline int drm_dsc_calculate_initial_scale_value(struct 
>> drm_dsc_config *dsc)
>> +{
>> +    return 8 * dsc->rc_model_size / (dsc->rc_model_size - 
>> dsc->initial_offset);
> 
> Just set this in drm_dsc_config, like other functions do.

Hi Dmitry,

Thanks for the feedback. Acked for both comments here.

Thanks,

Jessica Zhang

> 
>> +}
>> +
>> +static inline int drm_dsc_calculate_det_thresh_flatness(struct 
>> drm_dsc_config *dsc)
>> +{
>> +    return 2 << (dsc->bits_per_component - 8);
>> +}
> 
> this is flatness_det_thresh, per the standard.
> 
> Otherwise LGTM
> 
>> +
>>   void drm_dsc_dp_pps_header_init(struct dp_sdp_header *pps_header);
>>   int drm_dsc_dp_rc_buffer_size(u8 rc_buffer_block_size, u8 
>> rc_buffer_size);
>>   void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set 
>> *pps_sdp,
>>
> 
> -- 
> With best wishes
> Dmitry
> 
