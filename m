Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5526370CC10
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 May 2023 23:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233161AbjEVVPm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 17:15:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232747AbjEVVPl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 17:15:41 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 492AC9C
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 14:15:40 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34MKtOcJ029807;
        Mon, 22 May 2023 21:15:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=3YVNkNWmRPUFujKZvAhaatzuDngrWQZUrPNJtbNxG9I=;
 b=TnAUa5oMFMkk8fE55qTjGMHT1wDfBGVQN7b7sFAqRGECLO5JOZe2gaOzOZSM3xEHarVc
 QLcXDAtkGof0VVrXjtoxQRQhmkHXJ+uKG3MovenCVwV9UpIbY8E2v8LSX91ABpSVHC9R
 UBXTN88HuTg/FflKl/BxpKRrMJEfyrz8f7cptTLoTn2RDJ4kR3XrsLSuy0qpBuuo+GeK
 //F9WWaAkkw6lrQF4b0m7YZHGblpmM5hj6eVwO/FuWrsFY+DPdxaabiRW1J/qJFLK3pC
 UbLeeLUCEIa1XDcJjxYSC9zOtPygIKPVXUe0pfsYdE64BKxFNpyRjqOHD0fANlJdspC6 QA== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qr6h0sabh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 May 2023 21:15:17 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34MLFGQb032178
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 May 2023 21:15:16 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 22 May
 2023 14:15:15 -0700
Message-ID: <7e28afab-c717-bcd1-fd5b-ff64e81eca27@quicinc.com>
Date:   Mon, 22 May 2023 14:15:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v12 1/9] drm/display/dsc: Add flatness and initial scale
 value calculations
Content-Language: en-US
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        <freedreno@lists.freedesktop.org>
CC:     <linux-arm-msm@vger.kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        <dri-devel@lists.freedesktop.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>
References: <20230329-rfc-msm-dsc-helper-v12-0-9cdb7401f614@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v12-1-9cdb7401f614@quicinc.com>
 <875y8kogfd.fsf@intel.com>
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <875y8kogfd.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dDGo40pKsd3JvaEmWFXL6UO5jBc8hVNK
X-Proofpoint-ORIG-GUID: dDGo40pKsd3JvaEmWFXL6UO5jBc8hVNK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_16,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305220180
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/22/2023 2:37 AM, Jani Nikula wrote:
> On Wed, 17 May 2023, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>> Add helpers to calculate det_thresh_flatness and initial_scale_value as
>> these calculations are defined within the DSC spec.
>>
>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   include/drm/display/drm_dsc_helper.h | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
>> index fc2104415dcb..753b0034eda7 100644
>> --- a/include/drm/display/drm_dsc_helper.h
>> +++ b/include/drm/display/drm_dsc_helper.h
>> @@ -25,5 +25,15 @@ void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
>>   int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params_type type);
>>   int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
>>   
>> +static inline u8 drm_dsc_initial_scale_value(const struct drm_dsc_config *dsc)
>> +{
>> +	return 8 * dsc->rc_model_size / (dsc->rc_model_size - dsc->initial_offset);
>> +}
>> +
>> +static inline u32 drm_dsc_flatness_det_thresh(const struct drm_dsc_config *dsc)
>> +{
>> +	return 2 << (dsc->bits_per_component - 8);
>> +}
> 
> kernel-doc?

Hi Jani,

Sure, I'll add kernel docs for these.

> Maybe make them regular functions instead of static inline?

I was under the impression that smaller/single-line functions were good 
candidates for inlining. However, if you have a strong preference for 
having these as regular functions, I'm ok with that too.

Thanks,

Jessica Zhang

> 
> BR,
> Jani.
> 
>> +
>>   #endif /* _DRM_DSC_HELPER_H_ */
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
