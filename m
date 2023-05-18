Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6252B708825
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 May 2023 21:00:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbjERTAo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 May 2023 15:00:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230059AbjERTAn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 May 2023 15:00:43 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8023E52;
        Thu, 18 May 2023 12:00:39 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34IDkDEn003309;
        Thu, 18 May 2023 19:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=41P6OwUUMHGe41RVQthrP06NYle9G3kCvREmk4Ujk/U=;
 b=bqRgeAqOfcbQTnmkWIVaiX8WJIRrU2b8crFmvPNiGRMsgCseEaSYJtwQJE1tN2sGiL7p
 SZ5uHOok1q9O/l/U/Qjj5hYAJwhO0d5t5uukCxuhq6HHrAiGWYoAqNM43c7cJlfNZ4S1
 6Yxya+zlCAYfFdvi8l2dI/xxFdUy29RdP9Cwu5m4LrXNIHoJHz2mnlXHxycgIY2Pppkm
 uBlhrYncGMGo5gJotT/VxUc9xvr4MPYdPZtjQfdUX/mY/ojs3WqgW+i1Fe+ZNttK7fRs
 39hE6kYneP6Iyc/Yc8C2JglyDDchFWFmYIbWYNCZjICL1w8s7J4MZ5x9vecLPSwSSonT JQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qn3fsjx18-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 18 May 2023 19:00:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34IJ0TJU004567
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 18 May 2023 19:00:29 GMT
Received: from [10.110.94.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 18 May
 2023 12:00:28 -0700
Message-ID: <a89169b0-159d-486d-996c-897e3a0048a4@quicinc.com>
Date:   Thu, 18 May 2023 12:00:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v10 7/8] drm/msm/dpu: add DSC 1.2 hw blocks for relevant
 chipsets
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>
CC:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        <freedreno@lists.freedesktop.org>, <quic_sbillaka@quicinc.com>,
        <andersson@kernel.org>, <dri-devel@lists.freedesktop.org>,
        <dianders@chromium.org>, <vkoul@kernel.org>, <agross@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmitry.baryshkov@linaro.org>,
        <quic_jesszhan@quicinc.com>, <swboyd@chromium.org>,
        <sean@poorly.run>, <linux-kernel@vger.kernel.org>
References: <1684360919-28458-1-git-send-email-quic_khsieh@quicinc.com>
 <1684360919-28458-8-git-send-email-quic_khsieh@quicinc.com>
 <w7xre5jdot3fpe3ldj6vcnvribpbalfvova5hhmbgvgvkrcm34@xqvsc5ga2knb>
 <51f0439c-a5e8-b47a-21af-7bbbc944ca53@quicinc.com>
 <xvcl5ojsrifi26trso6nvvfsimtijygp3iizhl4djdrerc5lej@xrwsawvb3k4t>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <xvcl5ojsrifi26trso6nvvfsimtijygp3iizhl4djdrerc5lej@xrwsawvb3k4t>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DdZrgPMEsRUJyHf0_xuaTq1OLTne6mqZ
X-Proofpoint-GUID: DdZrgPMEsRUJyHf0_xuaTq1OLTne6mqZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-18_14,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 impostorscore=0 mlxlogscore=800 priorityscore=1501 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305180156
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/18/2023 12:05 AM, Marijn Suijten wrote:
> On 2023-05-17 16:22:37, Abhinav Kumar wrote:
> <snip>
>>>> @@ -529,6 +539,19 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>>>>    	.features = _features, \
>>>>    	}
>>>>    
>>>> +/*
>>>> + * NOTE: Each display compression engine (DCE) contains dual hard
>>>> + * slice DSC encoders so both share same base address but with
>>>> + * its own different sub block address.
>>>> + */
>>>
>>> I still think this comment is superfluous (and doesn't even apply
>>> generically, see i.e. sc7280) and should best be kept exclusively in the
>>> SoC-specific catalog files.
>>>
>>> - Marijn
>>>
>>
>> sc7280 is the only exception as it has only one encoder. But, by and
>> large, for all other chipsets this is true and hence kept here.
>>
>> The main reason for this comment is people should not get confused that
>> how come two DSC encoders have the same base address.
> 
> And that's why the comment is already placed in the SoC-specific catalog
> files where a duplicate base address is visible.  It is not visible
> here.
> 
> - Marijn
> 

ok, if kuogee pushes a v11, we can drop it.

>>>> +#define DSC_BLK_1_2(_name, _id, _base, _len, _features, _sblk) \
>>>> +	{\
>>>> +	.name = _name, .id = _id, \
>>>> +	.base = _base, .len = _len, \
>>>> +	.features = BIT(DPU_DSC_HW_REV_1_2) | _features, \
>>>> +	.sblk = &_sblk, \
>>>> +	}
>>>> +
>>>>    /*************************************************************
>>>>     * INTF sub blocks config
>>>>     *************************************************************/
>>>> -- 
>>>> 2.7.4
>>>>
