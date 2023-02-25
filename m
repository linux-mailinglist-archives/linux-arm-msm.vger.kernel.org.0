Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D56BE6A2C94
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Feb 2023 00:27:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbjBYX1c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Feb 2023 18:27:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbjBYX1b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Feb 2023 18:27:31 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65DF615560
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Feb 2023 15:27:30 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31PNDXGV012476;
        Sat, 25 Feb 2023 23:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=U35kC7hnWvS/8Nh8bGJBoXwCPMBqXu7npXDEIZnSFqM=;
 b=aIS8uA/Bxw85DtUzSmGfapPlP8KYPN83SIvUQruxvP/Y80+dOegJV1IXbetvGP3ByjNR
 Z2GNrMs4Zy26UjplOG/QJS4FCQNEu9zz6ccSxyC/xq5/RUWM0GGIx7DYpGMy4YegP4it
 tfJoDplxwNH7DB4lwJ68wZTetja81Yyk73pJ4LlbWFpMEQF9KkoLasQe4jSnqNyNn7OB
 H3Fk8OWjDh0+2vl3u6+x8IsRpjwCmT5kOrItWNSF/tZUzC8NiAgUiS4sh4TQKGTIIMXa
 pCt4/bLo9J8eND/sac46eL5NPqSqmOlBC7FjJemZ0Qx8Yw26YaYvW5y3m0JU8I6LnugD cA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nyaqg1f3u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 25 Feb 2023 23:27:23 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31PNRMSV027550
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 25 Feb 2023 23:27:22 GMT
Received: from [10.110.89.76] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Sat, 25 Feb
 2023 15:27:22 -0800
Message-ID: <533f2da0-fecc-27e9-7bab-2a9d51377833@quicinc.com>
Date:   Sat, 25 Feb 2023 15:27:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 06/50] drm/msm/dpu: correct sm8550 scaler
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <neil.armstrong@linaro.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
 <20230211231259.1308718-7-dmitry.baryshkov@linaro.org>
 <5bc2221f-61ba-3801-6dbb-83587d986b50@linaro.org>
 <a589d45e-f084-9371-05dc-0676f12458a3@linaro.org>
 <e20d2b76-a446-019d-73db-6f16ba7cbfb5@linaro.org>
 <298eff36-1a55-75a8-d957-ab97504e5caf@quicinc.com>
 <2f7fb041-edf0-79b1-5005-2af19a3d4934@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <2f7fb041-edf0-79b1-5005-2af19a3d4934@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oFYMSdOgRe5TwEmC8xf0CTQeNHN_ccQs
X-Proofpoint-ORIG-GUID: oFYMSdOgRe5TwEmC8xf0CTQeNHN_ccQs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-25_14,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302250201
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry

On 2/25/2023 3:06 PM, Dmitry Baryshkov wrote:
> On 24/02/2023 22:51, Abhinav Kumar wrote:
>>
>>
>> On 2/13/2023 9:36 AM, neil.armstrong@linaro.org wrote:
>>> On 13/02/2023 12:16, Dmitry Baryshkov wrote:
>>>> On 13/02/2023 12:41, Neil Armstrong wrote:
>>>>> On 12/02/2023 00:12, Dmitry Baryshkov wrote:
>>>>>> QSEED4 is a newer variant of QSEED3LITE, which should be used on
>>>>>> sm8550. Fix the DPU caps structure and used feature masks.
>>>>>
>>>>> I found nowhere SM8550 uses Qseed4, on downstream DT, it's written:
>>>>>          qcom,sde-qseed-sw-lib-rev = "qseedv3lite";
>>>>>          qcom,sde-qseed-scalar-version = <0x3002>;
>>>>
>>>> And then the techpack tells us starting from 0x3000 the v3lite is v4:
>>>>
>>>> https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/display-kernel.lnx.5.10.r8-rel/msm/sde/sde_hw_util.c#L59 
>>>>
>>>>
>>>> https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/display-kernel.lnx.5.10.r8-rel/msm/sde/sde_hw_util.c#L102 
>>>>
>>>
>>> OK then:
>>>
>>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>
>>>>
>>
>> This little bit of confusion is because with downstream, the qseed is 
>> a separate usermode library having its own revision. So the SW lib 
>> version in this case is not exactly correlating with the scalar HW 
>> revision.
> 
> Can you possibly spend some more words here? I see that sde_hw_utils.c 
> programs scalers slightly different depending on the version of the 
> scaler. At some point the SDE driver was reading the register to 
> determine the revision. Then it switched to the revision specified in 
> the DTS (which, as far as I understand, corresponds to the HW register 
> contents).
> 
> So, where does SW revision come into the play? (and which library are we 
> talking about?). Is the 'v3lite' an SW revision? Or is the 0x3002 an SW 
> revision?
> 

qcom,sde-qseed-sw-lib-rev is the SW library revision for libscale.

This is a proprietary library used to calculate the LUTs for the qseed 
block. Its not used in the upstream version of the driver.

For upstream driver, the driver uses default settings for the LUTs which 
work for most of the common use-cases we see.

You can refer the below property names, there are programmed by the lib 
for the downstream driver.

3733 		msm_property_install_range(
3734 				&psde->property_info, "scaler_v2",
3735 				0x0, 0, ~0, 0, PLANE_PROP_SCALER_V2);
3736 		msm_property_install_blob(&psde->property_info,
3737 				"lut_sep", 0,
3738 				PLANE_PROP_SCALER_LUT_SEP);

No, 0x3002 is the HW revision of the qseed and thats why this change is 
correct because the SW library name/rev doesnt exactly match the qseed 
HW revision as its possible that even qseed3lite library can support the 
QSEED4 HW.

So we should be going off qcom,sde-qseed-scalar-version and not 
qcom,sde-qseed-sw-lib-rev.

>>
>> Since upstream DPU only cares about the HW revision of the scaler, we 
>> should be going off the qcom,sde-qseed-scalar-version.
>>
>> This change LGTM,
>>
>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> 
