Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8DFE70A31B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 May 2023 01:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbjESXCr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 May 2023 19:02:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjESXCq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 May 2023 19:02:46 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B75E107;
        Fri, 19 May 2023 16:02:45 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34JMnTRi020637;
        Fri, 19 May 2023 23:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=su/PahFjFXkN4pxSKJfmLjbSepDjEQz95cj3Gm6P61U=;
 b=GYd3Ri9HErz/KDD2jWMgAH3sW9AnM3MbkbfmSzAcj8+Pq4CccwF+4x/CiktUDNgeeqIv
 CDG7KCH08O/OORlwyaB78o8xlzC033WZ5QL3HXb5aQcXrg9ju+a58fO7PjIz1hZh5/2r
 bE0GkBIKLr9N4IMZs+cFwq81VvmnadSoz/WQfl3BiCsHkbKFTj38nnBm+938pwile6wN
 qNMpF0moBTcnrgg4BSmtL9KCCkFWdOnlWCp70yKpRoxYiGHLVW6NRAHOk7wKjuqEApLF
 xDSWJZ65xw4+J4u8264wNZH0umhEgcuUcVmzUx0HDSqXf0VxBTJQ/ERV+HxFF8CI8fKE 7g== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qnwk4jtmp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 19 May 2023 23:02:37 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34JN2aRQ031930
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 19 May 2023 23:02:36 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 19 May
 2023 16:02:36 -0700
Message-ID: <f62f3676-b931-6c88-9a49-80c17d16f463@quicinc.com>
Date:   Fri, 19 May 2023 16:02:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 5/5] drm/msm/dsi: Remove incorrect references to
 slice_count
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>
CC:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20230405-add-dsc-support-v3-0-6e1d35a206b3@quicinc.com>
 <20230405-add-dsc-support-v3-5-6e1d35a206b3@quicinc.com>
 <qwi3zrnhuqeaiwr2vj7cp2d4czsjqawes7gjbjxcnj7avdzjtd@b7obpanefrt2>
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <qwi3zrnhuqeaiwr2vj7cp2d4czsjqawes7gjbjxcnj7avdzjtd@b7obpanefrt2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TJ14A3qoqzhizwKhFZuROTnFcksGFUEL
X-Proofpoint-ORIG-GUID: TJ14A3qoqzhizwKhFZuROTnFcksGFUEL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-19_16,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305190197
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/19/2023 2:24 PM, Marijn Suijten wrote:
> On 2023-05-19 14:17:30, Jessica Zhang wrote:
>> Currently, slice_count is being used to calculate word count and
>> pkt_per_line. In downstream, these values are calculated using slice per
>> packet, which is not the same as slice_count.
>>
>> Slice count represents the number of soft slices per interface, and its
>> value will not always match that of slice per packet. For example, it is
>> possible to have cases where there are multiple soft slices per interface
>> but the panel specifies only one slice per packet.
>>
>> Thus, use the default value of one slice per packet and remove slice_count
>> from the aforementioned calculations.
>>
>> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
>> Fixes: bc6b6ff8135c ("drm/msm/dsi: Use DSC slice(s) packet size to compute word count")
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 24 ++++++++++++++----------
>>   1 file changed, 14 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index d04f8bbd707d..8c8858ee59ec 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -866,18 +866,15 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>>   	 */
>>   	slice_per_intf = msm_dsc_get_slices_per_intf(dsc, hdisplay);
>>   
>> -	/*
>> -	 * If slice_count is greater than slice_per_intf
>> -	 * then default to 1. This can happen during partial
>> -	 * update.
>> -	 */
>> -	if (dsc->slice_count > slice_per_intf)
>> -		dsc->slice_count = 1;
>> -
>>   	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
>>   
>>   	eol_byte_num = total_bytes_per_intf % 3;
>> -	pkt_per_line = slice_per_intf / dsc->slice_count;
>> +
>> +	/*
>> +	 * Default to 1 slice_per_pkt, so pkt_per_line will be equal to
>> +	 * slice per intf.
>> +	 */
>> +	pkt_per_line = slice_per_intf;
> 
> Same as the comment below, perhaps it is a good idea to clarify in the
> comment here that the original value wa *multiplied by* slice_per_pkt?
> Otherwise this default of 1 is "invisible".

Hi Marijn,

Acked.

> 
> Alternatively we could have a `const slice_per_pkt = 1;` at the top, and
> have the comment (the elaborate one from below) there?

Since the default slice_per_pkt = 1 and there's only 2 places where I 
have to add a clarifying comment, I think having a separate 
slice_per_pkt variable is a bit redundant.

Plus, if support for multiple slice_per_pkt values is added in the 
future, we'd also have to drop this variable anyways.

Thanks,

Jessica Zhang

> 
> - Marijn
> 
>>   
>>   	if (is_cmd_mode) /* packet data type */
>>   		reg = DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_DCS_LONG_WRITE);
>> @@ -1001,7 +998,14 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>   		if (!msm_host->dsc)
>>   			wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
>>   		else
>> -			wc = msm_host->dsc->slice_chunk_size * msm_host->dsc->slice_count + 1;
>> +			/*
>> +			 * When DSC is enabled, WC = slice_chunk_size * slice_per_packet + 1.
>> +			 * Currently, the driver only supports default value of slice_per_packet = 1
>> +			 *
>> +			 * TODO: Expand mipi_dsi_device struct to hold slice_per_packet info
>> +			 *       and adjust DSC math to account for slice_per_packet.
>> +			 */
>> +			wc = msm_host->dsc->slice_chunk_size + 1;
>>   
>>   		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
>>   			DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
>>
>> -- 
>> 2.40.1
>>
