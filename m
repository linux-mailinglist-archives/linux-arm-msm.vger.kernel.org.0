Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1D66D71DA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 03:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234826AbjDEBCu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Apr 2023 21:02:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236554AbjDEBCt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Apr 2023 21:02:49 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A18626AD
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Apr 2023 18:02:48 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 335094Hs027185;
        Wed, 5 Apr 2023 01:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=jyWKAlm2FIsnwec0vCO5+WjDzpmTAeH9H7jlwpsZkII=;
 b=AyVOg5TBiLuYISobUcetfEvCDmOJgyjscjq4pdsVzzmy8+LEKuFO07XefJ8IwbiWlUN2
 zXSAGUFJzW/0BXIZFu987MyPPhbeO3eW19geAlyTHHJ6L9pyheZOUq+H73r0hA3kVuQg
 qzGYnhseythIPlUHoOe3ftEkN2p/yMAwHwhfjassaG1oSJ7nf/39mgoi94sFwoMuMTyu
 u0ReBY1jdI5iKwePWlAYJ/4nHFQ0SdN6oQICtPt/ifV1sMkGKzvROZYDn51QeG02T2sX
 kQI3LQ1aCgGijgtm1rDhmm2aZne8UhjehxQJyIru996RpnprnzRICHRl+apjBFyH/jpH 0g== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3prg9bjd11-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 05 Apr 2023 01:02:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33512aNJ014643
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 5 Apr 2023 01:02:36 GMT
Received: from [10.110.66.70] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 4 Apr 2023
 18:02:34 -0700
Message-ID: <66e19c58-f6b8-8bd2-c773-42d5750e68bb@quicinc.com>
Date:   Tue, 4 Apr 2023 18:02:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v4 03/42] drm/msm/dpu: Allow variable INTF_BLK size
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
 <20230404130622.509628-4-dmitry.baryshkov@linaro.org>
 <8663b3e5-8745-50ca-670e-e286652202c6@quicinc.com>
 <b00d0507-c492-7ad6-d253-cd218376fa5f@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <b00d0507-c492-7ad6-d253-cd218376fa5f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XgVfJXEDGK6qsd6xw23_GtuSxv6cDVEW
X-Proofpoint-ORIG-GUID: XgVfJXEDGK6qsd6xw23_GtuSxv6cDVEW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-04_14,2023-04-04_05,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=967 priorityscore=1501 impostorscore=0
 bulkscore=0 mlxscore=0 malwarescore=0 spamscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304050007
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4/4/2023 5:37 PM, Dmitry Baryshkov wrote:
> On 05/04/2023 01:30, Abhinav Kumar wrote:
>>
>>
>> On 4/4/2023 6:05 AM, Dmitry Baryshkov wrote:
>>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>
>>> These blocks are of variable length on different SoCs. Set the
>>> correct values where I was able to retrieve it from downstream
>>> DTs and leave the old defaults (0x280) otherwise.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> [DB: fixed some lengths, split the INTF changes away]
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> Everything is fine except sm8250.
>>
>> DPU | SoC      | INTF_DSI size
>> 5.0 | sm8150   | 0x2bc
>> 5.1 | sc8180x  | 0x2bc
>> 6.0 | sm8250   | 0x2c0
>> 6.2 | sc7180   | 0x2c0
>> 6.3 | sm6115   | 0x2c0
>> 6.5 | qcm2290  | 0x2c0
>> 7.0 | sm8350   | 0x2c4
>> 7.2 | sc7280   | 0x2c4
>> 8.0 | sc8280xp | 0x300
>> 8.1 | sm8450   | 0x300
>> 9.0 | sm8550   | 0x300
>>
>> Today sm8250 is using the same table as sm8150 but it needs 0x2c0 and 
>> not 0x2bc.
>>
>> We should de-duplicate it add a new one for sm8250?
> 
> This is done in patch 22. It makes no sense to play with the data until 
> we are clear, which platform uses which instance.
> 

Ack, that one looks fine and since this one is just preserving what was 
already present, this change LGTM, hence

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
