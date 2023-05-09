Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 687836FBEC1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 May 2023 07:35:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbjEIFfv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 May 2023 01:35:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjEIFfu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 May 2023 01:35:50 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A868049D6;
        Mon,  8 May 2023 22:35:49 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3494Gidx015573;
        Tue, 9 May 2023 05:35:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Z/BGhvH9Jrj8XvGR8C6AUeOtQEdwRrcS3THsHd+8GP0=;
 b=beyQ4WiHt109T72pcEuXqejZ2DEvkUFEGpzTN5LI43MMotVskI3ZVprc1fuI0w99mSyC
 XOf7D0D3FhCYA9a3IeEhDWsd86WKYez28tsDkaouDZY9gkzmLlroKJD8uD2qjKBtvdW9
 x4uCZQxm65yQJUhWGb+meFtGeJKqtqn4sqO7iYVm+yN6t+T8sYYZU9p7gphfWSWZe4S5
 MTaUiaYrvfKLM5tc4Af3UzJEBPsYM3/6dPQIDEGYH+506yC8yCov/UH/Wb2MjaM7DeOR
 akH4xxgzZIbDCHqIJ0pVNMhv7Dyax9yPI+IgNh5n6zUOMzcA2Ns485yQ3cwkZCr5fDLf tQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qf781gvtf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 09 May 2023 05:35:15 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3495ZEXV009406
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 9 May 2023 05:35:14 GMT
Received: from [10.50.33.246] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 8 May 2023
 22:35:10 -0700
Message-ID: <20de1c19-399c-2925-173c-e722922cdefa@quicinc.com>
Date:   Tue, 9 May 2023 11:05:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/2] clk: qcom: mmcc-msm8974: fix MDSS_GDSC power flags
To:     Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org>
References: <20230507175335.2321503-1-dmitry.baryshkov@linaro.org>
 <20230507175335.2321503-2-dmitry.baryshkov@linaro.org>
 <6529911.lOV4Wx5bFT@z3ntu.xyz>
Content-Language: en-US
From:   Rajendra Nayak <quic_rjendra@quicinc.com>
In-Reply-To: <6529911.lOV4Wx5bFT@z3ntu.xyz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WqLYlBCVekDHM4BPTxpN1zb0CL6B3uPi
X-Proofpoint-ORIG-GUID: WqLYlBCVekDHM4BPTxpN1zb0CL6B3uPi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_02,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 suspectscore=0 clxscore=1011 mlxlogscore=727 malwarescore=0 mlxscore=0
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305090041
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/9/2023 2:17 AM, Luca Weiss wrote:
> On Sonntag, 7. Mai 2023 19:53:35 CEST Dmitry Baryshkov wrote:
>> Using PWRSTS_RET on msm8974's MDSS_GDSC causes display to stop working.
>> The gdsc doesn't fully come out of retention mode. Change it's pwrsts
>> flags to PWRSTS_OFF_ON.
> 
> +CC Rajendra & Manivannan
> 
> Following the mails at [0] this was the suggested fix, which I haven't
> made into a patch myself yet.
> 
> With this (and without the revert of the linked patch) panel init is fine
> again on FP2. Thanks!
> 
> [0] https://lore.kernel.org/linux-arm-msm/5897497.lOV4Wx5bFT@g550jk/
> 
> Tested-by: Luca Weiss <luca@z3ntu.xyz>

Reviewed-by: Rajendra Nayak <quic_rjendra@quicinc.com>

> 
>>
>> Fixes: d399723950c4 ("clk: qcom: gdsc: Fix the handling of PWRSTS_RET
>> support") Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/clk/qcom/mmcc-msm8974.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/mmcc-msm8974.c
>> b/drivers/clk/qcom/mmcc-msm8974.c index aa29c79fcd55..277ef0065aae 100644
>> --- a/drivers/clk/qcom/mmcc-msm8974.c
>> +++ b/drivers/clk/qcom/mmcc-msm8974.c
>> @@ -2401,7 +2401,7 @@ static struct gdsc mdss_gdsc = {
>>   	.pd = {
>>   		.name = "mdss",
>>   	},
>> -	.pwrsts = PWRSTS_RET_ON,
>> +	.pwrsts = PWRSTS_OFF_ON,
>>   };
>>
>>   static struct gdsc camss_jpeg_gdsc = {
> 
> 
> 
> 
