Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B989B6FBC0B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 May 2023 02:39:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233293AbjEIAj1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 20:39:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233235AbjEIAj0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 20:39:26 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C89545FD2
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 17:39:24 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3490REBQ003079;
        Tue, 9 May 2023 00:39:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=IhwZnPEAaPt34FMlivE6dnItOAJLmRbXbxO2is2P1Y0=;
 b=UWxgOEQ5jzz491mOvV/N5sgNZg/fsSY0wGGZQYN1UcoSTVA1GJUyLlskPqGuQPuKc/Qn
 rMICxoiOx9oJHMDCaZlCSVLW4psG2Wta17W7DGwa1t+f+p4LUqvqsWfOtWFPkw8hNeJX
 XrvA9zJjvUj//i3ykngbNjvv2RTYXBcHOg63kIbCLNS3Apl3R4cZZguhyFEvY+Uqu6+W
 lttZxrzvg18iSbNb5Ae9bnnQeKls2Yj38SSKq9kEKO1qDvPmNCAILKkvtdtZCPyZ1teO
 l4n61elIpuD7fXSFXsK22KUtpMdFfS5v6HG8jOt/+OwVJBsLCkbNPr+Pz21hk7V/Xrja +Q== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qf77f0e95-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 09 May 2023 00:39:17 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3490dG9M011239
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 9 May 2023 00:39:16 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 8 May 2023
 17:39:16 -0700
Message-ID: <086528a9-c349-6b8e-4c5d-16d8e4200496@quicinc.com>
Date:   Mon, 8 May 2023 17:39:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v6 6/7] drm/msm/dsi: update hdisplay calculation for
 dsi_timing_setup
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>
CC:     <freedreno@lists.freedesktop.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, <dri-devel@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20230329-rfc-msm-dsc-helper-v6-0-cb7f59f0f7fb@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v6-6-cb7f59f0f7fb@quicinc.com>
 <f7ao4r6ciszwslzgosmph5zwtf4adbp6mx35yjgt3fk3ogva7u@4hm2h4b4zyhf>
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <f7ao4r6ciszwslzgosmph5zwtf4adbp6mx35yjgt3fk3ogva7u@4hm2h4b4zyhf>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vjHOqXiwOCcuo97_wI3J3F7dtHe6eM-D
X-Proofpoint-GUID: vjHOqXiwOCcuo97_wI3J3F7dtHe6eM-D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-08_18,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 adultscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305090004
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/8/2023 2:46 PM, Marijn Suijten wrote:
> On 2023-04-12 16:25:20, Jessica Zhang wrote:
>> hdisplay for compressed images should be calculated as bytes_per_slice *
>> slice_count. Thus, use MSM DSC helper to calculate hdisplay for
>> dsi_timing_setup instead of directly using mode->hdisplay.
> 
> This doesn't really matter in the common case of of bpp=8, as the number
> of horizontal pixels is equal to the number of horizontal slices times
> the width of one horizontal slice.
> 
>> Changes in v3:
>> - Split from previous patch
>> - Initialized hdisplay as uncompressed pclk per line at the beginning of
>>    dsi_timing_setup as to not break dual DSI calculations
>>
>> Changes in v4:
>> - Moved pclk_per_intf calculations to DSC hdisplay adjustments
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 508577c596ff..ae966d4e349d 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -952,7 +952,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>   		 * pulse width same
>>   		 */
>>   		h_total -= hdisplay;
>> -		hdisplay /= 3;
>> +		hdisplay = msm_dsc_get_pclk_per_intf(msm_host->dsc) / 3;
> 
> This function sounds like it returns bytes_per_line instead, not the
> number of pixels in case bpp!=8.  Should we rename it?

Hi Marijn,

Sounds good.

Thanks,

Jessica Zhang

> 
> - Marijn
> 
>>   		h_total += hdisplay;
>>   		ha_end = ha_start + hdisplay;
>>   	}
>>
>> -- 
>> 2.40.0
>>
