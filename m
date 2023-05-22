Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6C2370CC17
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 May 2023 23:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233434AbjEVVQs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 17:16:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231758AbjEVVQr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 17:16:47 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE0559D
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 14:16:45 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34MKnOxs023435;
        Mon, 22 May 2023 21:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=eCjGshP4C5ZF8wJmDrKbM1z6aLlOsOROmybmPJaQ3AE=;
 b=pLuLq9Uga6SPN9kOSFlH77oHtd+nQkMdbhO2LQ1CrwjqSh9JZUpGG5xlonSxpbnvxpMs
 xpGSUgSbgouyGM6PFObVCUwKi+ixuCoCAw2ntEFlPiwbbllT2n7YHG7yvEGaGEIrAYBA
 X4S1VZwV2JzqXNs9A4R2IyQPOFHzNALjMsesScxQFcotQfxn2EJ7jNjrwyUtSTyO8jJ7
 E8N56T8hiFzxMStxzMvm5snSlNWKPK67EQWRxmNgSrFsDHRsmdZ2Ie1Hp8LPwXck2XyG
 1tTeA8SSneYbGEzhi0Ssjn8zOsdFc2Lpq34RzUTY64o7gVlJAzT88wBhwIvtY4QVC6bG yg== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qra128u79-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 May 2023 21:16:38 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34MLGbNT028552
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 May 2023 21:16:37 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 22 May
 2023 14:16:36 -0700
Message-ID: <3a9ca911-08a8-2b7b-c18e-a8621c18b0a9@quicinc.com>
Date:   Mon, 22 May 2023 14:16:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v12 3/9] drm/display/dsc: Add drm_dsc_get_bpp_int helper
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
 <20230329-rfc-msm-dsc-helper-v12-3-9cdb7401f614@quicinc.com>
 <87a5xwogii.fsf@intel.com>
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <87a5xwogii.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2jvPlTV-8DaJnnDweiCjUeVSJXddACH9
X-Proofpoint-ORIG-GUID: 2jvPlTV-8DaJnnDweiCjUeVSJXddACH9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_16,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305220180
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/22/2023 2:35 AM, Jani Nikula wrote:
> On Wed, 17 May 2023, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>> Add helper to get the integer value of drm_dsc_config.bits_per_pixel
>>
>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   include/drm/display/drm_dsc_helper.h | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
>> index e0cbc38ada26..7bf7e8ff8eb4 100644
>> --- a/include/drm/display/drm_dsc_helper.h
>> +++ b/include/drm/display/drm_dsc_helper.h
>> @@ -9,6 +9,7 @@
>>   #define DRM_DSC_HELPER_H_
>>   
>>   #include <drm/display/drm_dsc.h>
>> +#include <linux/bug.h>
> 
> Seems like a small thing, adding static inlines in headers usually leads
> to more header dependencies like this, and gradually slows down build.
> 
> Does it need to be a static inline?

Hi Jani,

Good point about the dependencies. Will make this a non-inline function.

Thanks,

Jessica Zhang

> 
> BR,
> Jani.
> 
>>   
>>   enum drm_dsc_params_type {
>>   	DRM_DSC_1_2_444,
>> @@ -26,6 +27,12 @@ void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
>>   int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params_type type);
>>   int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
>>   
>> +static inline u32 drm_dsc_get_bpp_int(const struct drm_dsc_config *dsc)
>> +{
>> +	WARN_ON_ONCE(dsc->bits_per_pixel & 0xf);
>> +	return dsc->bits_per_pixel >> 4;
>> +}
>> +
>>   static inline u8 drm_dsc_initial_scale_value(const struct drm_dsc_config *dsc)
>>   {
>>   	return 8 * dsc->rc_model_size / (dsc->rc_model_size - dsc->initial_offset);
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
