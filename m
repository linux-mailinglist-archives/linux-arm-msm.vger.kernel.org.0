Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64C4064B8E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 16:48:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236286AbiLMPsE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Dec 2022 10:48:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236285AbiLMPrh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Dec 2022 10:47:37 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98A5E23E99;
        Tue, 13 Dec 2022 07:45:56 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BDAGpUI008198;
        Tue, 13 Dec 2022 15:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=dA+v0SbYbR1+A6jHQVPRnFxk/SNcv98iQckXb+HVrOc=;
 b=nu1LsJBXgGHuDx/RUnpmvr+AQ4QK4HJEKV4DGCkeLc2I7LTQjj1pvJVDegw9bnQdsODD
 5o86SkDCj7gMSADJyWcQbBLGunwVFCYTqmPZkmUZIs7UByPcw/l3SSM2RAFYvXj33Pf+
 zgpZgGPyz9xX3R2QB30/kwfRTt46wbFUwPJnQmi4BMBtJob7xCD6wOGAjLHcKKsXLqkr
 1f6Kg+QY0ZuSW1DB7BtFdmoCMx64qarfwARiFg+25Ujqt6DJAvAohTf+3wq1m8Q4PQWD
 qslhg0z8mkmdm8VeMPVvZgKpgVHLZ/5eY1hkCGAT/xYdYusounmlGpsd1QLaLKgV2+Lm 3Q== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3megmp21uj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 13 Dec 2022 15:45:39 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BDFjd1u001653
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 13 Dec 2022 15:45:39 GMT
Received: from [10.216.48.1] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 13 Dec
 2022 07:45:35 -0800
Message-ID: <813be5b3-ca8b-f72c-8077-128e51d52d8d@quicinc.com>
Date:   Tue, 13 Dec 2022 21:15:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sc8280xp: rename i2c5 to i2c21
Content-Language: en-US
To:     Johan Hovold <johan@kernel.org>
CC:     Brian Masney <bmasney@redhat.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <konrad.dybcio@linaro.org>,
        <robh+dt@kernel.org>, <johan+linaro@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <ahalaney@redhat.com>,
        <echanude@redhat.com>
References: <20221212182314.1902632-1-bmasney@redhat.com>
 <20221212182314.1902632-2-bmasney@redhat.com>
 <Y5iSDehp72mQPc+h@hovoldconsulting.com> <Y5iWeTk2zOp9rInx@x1>
 <Y5iaDP+nV9B59U2b@hovoldconsulting.com>
 <03252ccd-e200-a112-b4dd-ba9fbf25c480@quicinc.com>
 <Y5icyo7I5ZGAL02q@hovoldconsulting.com>
From:   Shazad Hussain <quic_shazhuss@quicinc.com>
In-Reply-To: <Y5icyo7I5ZGAL02q@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YQXKcmbL4P3o7l780Xm3M5gqCTucmv12
X-Proofpoint-GUID: YQXKcmbL4P3o7l780Xm3M5gqCTucmv12
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-13_03,2022-12-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 mlxlogscore=770 priorityscore=1501 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212130139
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12/13/2022 9:09 PM, Johan Hovold wrote:
> On Tue, Dec 13, 2022 at 09:04:39PM +0530, Shazad Hussain wrote:
>>
>>
>> On 12/13/2022 8:58 PM, Johan Hovold wrote:
>>> On Tue, Dec 13, 2022 at 10:12:57AM -0500, Brian Masney wrote:
>>>> On Tue, Dec 13, 2022 at 03:54:05PM +0100, Johan Hovold wrote:
>>>>> Note that the node is labelled qup2_i2c5 and not qup_i2c5.
>>>>>
>>>>> That is, the QUP nodes are labelled using two indices, and specifically
>>>>>
>>>>> 	qup2_i2c5
>>>>>
>>>>> would be another name for
>>>>>
>>>>> 	qup_i2c21
>>>>>
>>>>> if we'd been using such a flat naming scheme (there are 8 engines per
>>>>> QUP).
>>>>>
>>>>> So there's nothing wrong with how these nodes are currently named, but
>>>>> mixing the two scheme as you are suggesting would not be correct.
>>>>
>>>> Hi Johan,
>>>>
>>>> What would I use for the name in the aliases section? Right now I have:
>>>>
>>>>       aliases {
>>>>           i2c18 = &qup2_i2c18;
>>>>       }
>>>>
>>>> So qup2_i2c18 becomes qup2_i2c2. Would I use the flat naming scheme for
>>>> the alias like so?
>>>>
>>>>       aliases {
>>>>           i2c18 = &qup2_i2c2;
>>>>       }
>>>
>>> Or perhaps the i2c controllers should use a zero-based index instead of
>>> being named after the serial engines (e.g. as we do for the console
>>> uart).
>>>
>>> How are they named in the schematics?
>>
>> We should use from 0 to N.
> 
> With N being 23 after the number of serial engines, or the number of
> available i2c buses on a particular board minus one?
> 

wrt to serial engine number starting from 0.

Shazad

> Johan
