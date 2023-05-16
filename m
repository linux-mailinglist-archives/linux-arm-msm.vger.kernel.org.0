Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 842F77055D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 May 2023 20:18:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbjEPSSe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 14:18:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231708AbjEPSSd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 14:18:33 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6743C46BC
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 11:18:26 -0700 (PDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34GEdABk001830;
        Tue, 16 May 2023 18:18:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=xspRwNCrxo/kpYo9O+6dvjUFg78VADzc6N5fYoqOdvI=;
 b=GhBp2RLLZW2+EyKgDjoSWaqGPD6qxbelSxt5zyvPjVL1gEYYg5PT2jBDWkE/HyQTATgz
 en1v29S+zdNspymq499KHnJ2I0jn+otqmwpa7ElEJ6K2QIPtAlMdqfSAcqZL8soVIrUn
 5GOSu/vd8MiskBjaSpc98cfYdZ/3MLryi2ERR4YMqePQWe9ZtfpDiIIfj1EN1xCqQynW
 AbKU4t4ftKcH8TeanLRBD++IESt41b7h08RdjpL/F1LJwnRalOyATIGYurFznIfBDo0t
 dtQmyBSuRCI6xP4ZbOXOvVZBU5AZ6OBSHyFlG7WZvToL2mg1KDz+uykG7iKijy+/mDUi iQ== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qkt9w2h5r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 16 May 2023 18:18:19 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34GIIIWb009452
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 16 May 2023 18:18:18 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 16 May
 2023 11:18:17 -0700
Message-ID: <43a07bc1-d758-242a-7017-f566daadc35c@quicinc.com>
Date:   Tue, 16 May 2023 11:18:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH v10 8/8] drm/msm/dsi: update hdisplay
 calculation for dsi_timing_setup
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>
CC:     Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        <dri-devel@lists.freedesktop.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>,
        "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
        <freedreno@lists.freedesktop.org>
References: <20230329-rfc-msm-dsc-helper-v10-0-4cb21168c227@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v10-8-4cb21168c227@quicinc.com>
 <5jqvxyy7ixfpwzepgseqwwz5elyn2qhxa4qdwhxcw7xbkvle4l@rijv4uq5wsb7>
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <5jqvxyy7ixfpwzepgseqwwz5elyn2qhxa4qdwhxcw7xbkvle4l@rijv4uq5wsb7>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gLTF98tNf9BBNSvYb-RpbEgaYorUWhPi
X-Proofpoint-ORIG-GUID: gLTF98tNf9BBNSvYb-RpbEgaYorUWhPi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-16_09,2023-05-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305160153
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/14/2023 2:29 PM, Marijn Suijten wrote:
> On 2023-05-12 14:32:18, Jessica Zhang wrote:
>>
>> hdisplay for compressed images should be calculated as bytes_per_slice *
>> slice_count. Thus, use MSM DSC helper to calculate hdisplay for
>> dsi_timing_setup instead of directly using mode->hdisplay.
> 
> As mentioned in review on an earlier revision, is there any sort of
> clarification you can provide here to explain the cases where
> hdisplay!=bytes_per_line?  That goes a long way towards justifying this
> change.  Thanks!

Hi Marijn,

Sorry for not responding to this in the earlier revision, I think I 
missed the original comment.

Please correct me if I'm wrong, but I'm guessing the question here is 
why we can't keep the hdisplay adjustment as `hdisplay /= 3` and have to 
go out of our way to recalculate hdisplay before doing the `/ 3`.

This is because the original adjustment only works for BPP = 8. By using 
the msm_dsc_get_bytes_per_line() here, we can generalize this adjustment 
to work for cases where BPP != 8.

Thanks,

Jessica Zhang


> 
> - Marijn
> 
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 9eeda018774e..739f62643cc5 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -952,7 +952,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>   		 * pulse width same
>>   		 */
>>   		h_total -= hdisplay;
>> -		hdisplay /= 3;
>> +		hdisplay = msm_dsc_get_bytes_per_line(msm_host->dsc) / 3;
>>   		h_total += hdisplay;
>>   		ha_end = ha_start + hdisplay;
>>   	}
>>
>> -- 
>> 2.40.1
>>
