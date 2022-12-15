Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6C664E302
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Dec 2022 22:23:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbiLOVXW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Dec 2022 16:23:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbiLOVXT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Dec 2022 16:23:19 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD5A73A2;
        Thu, 15 Dec 2022 13:23:17 -0800 (PST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BFJYDJB011582;
        Thu, 15 Dec 2022 21:23:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=QU5KkRkZe2Gr+oh/FfMfiprdckR8IqoLQ616fAorRLQ=;
 b=PKAxLiHXTnWLRBaosCf3cMlo+Fe41BE9+wIC7mWwQDYKCB/HloHYwFYnaCIDRnPqKDFo
 xOul1v00HHCq/3hyFPULIAicdFL+shT+vrnbuTz2d+Dg6qlBmVXK5urqj+j0ApYqgdsZ
 AFRspkb4Ms3ywEktYazCsHP64Yr3jcuebSFLiMn53QxExDIVZbxM+THdgvDHLDykHDu1
 4riqL3E+QLcKUOrl0k5FEFHATUW1KKGc6SkHTvF9xN46dityQwEnraf8SkC9wtJr90pr
 NfD4JigZJpO51ZABhnJ2amcmgAlesYUCdD2sw35fJZHwh1qBHsBR2vCXIZ/k/H/AYnzN BA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mfyyu2gqw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 15 Dec 2022 21:23:11 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BFLNAUD014519
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 15 Dec 2022 21:23:10 GMT
Received: from [10.110.100.96] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 15 Dec
 2022 13:23:09 -0800
Message-ID: <9fc3cd6c-8ae3-ce9c-435b-76e0e641d960@quicinc.com>
Date:   Thu, 15 Dec 2022 13:23:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2] drm/msm/dp: do not complete dp_aux_cmd_fifo_tx() if
 irq is not for aux transfer
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
        <airlied@gmail.com>, <andersson@kernel.org>, <daniel@ffwll.ch>,
        <dianders@chromium.org>, <robdclark@gmail.com>, <sean@poorly.run>,
        <vkoul@kernel.org>
CC:     <quic_abhinavk@quicinc.com>, <quic_sbillaka@quicinc.com>,
        <freedreno@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1671129159-31105-1-git-send-email-quic_khsieh@quicinc.com>
 <ca15a54b-8040-5e4f-a78e-12b7f8a554e1@linaro.org>
 <CAE-0n53bREwEMV4aP=ySPuPP8mMbDr=Unbjw_bW0MNN7hTsWRw@mail.gmail.com>
 <d41e29a9-5da6-3843-5018-9674e7d56505@linaro.org>
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <d41e29a9-5da6-3843-5018-9674e7d56505@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: neUrE7bAUWARf-_uHNZSDCikfFR6QQYO
X-Proofpoint-GUID: neUrE7bAUWARf-_uHNZSDCikfFR6QQYO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-15_11,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxlogscore=920 lowpriorityscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212150178
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 12/15/2022 1:15 PM, Dmitry Baryshkov wrote:
> On 15/12/2022 22:10, Stephen Boyd wrote:
>> Quoting Dmitry Baryshkov (2022-12-15 10:46:42)
>>> On 15/12/2022 20:32, Kuogee Hsieh wrote:
>>>>        if (!aux->cmd_busy)
>>>>                return;
>>>>
>>>>        if (aux->native)
>>>> -             dp_aux_native_handler(aux, isr);
>>>> +             ret = dp_aux_native_handler(aux, isr);
>>>>        else
>>>> -             dp_aux_i2c_handler(aux, isr);
>>>> +             ret = dp_aux_i2c_handler(aux, isr);
>>>>
>>>> -     complete(&aux->comp);
>>>> +     if (ret == IRQ_HANDLED)
>>>> +             complete(&aux->comp);
>>>
>>> Can you just move the complete() into the individual handling 
>>> functions?
>>> Then you won't have to return the error code from dp_aux_*_handler() at
>>> all. You can check `isr' in that function and call complete if there 
>>> was
>>> any error.
>>
>> I'd prefer we apply my patch and pass the irqreturn_t variable to the
>> caller of this function so spurious irqs are shutdown. Should I send it
>> as a proper patch?
>
> I'm for handling the spurious IRQs in a proper way. However I believe 
> that it's not related to the issue Kuogee is trying to fix.
>
> Thus I think we should have two separate patches: one fixing the EDID 
> corruption issue (for which the proper fix is !isr check, IIUC) and 
> the irqreturn_t. And for the irqreturn_t it might be beneficial to 
> move complete() call to the dp_aux_foo_handler(). Or might be not. 
> That would depend on the patch itself.
>
>
ok, I will split this patch into two.
