Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5016778D2BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Aug 2023 06:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239127AbjH3E2a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Aug 2023 00:28:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233885AbjH3E2D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Aug 2023 00:28:03 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D536A6;
        Tue, 29 Aug 2023 21:27:59 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37U3fG1S004883;
        Wed, 30 Aug 2023 04:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=AmxuY/t98hp4URJLDEoTGLsYOQkVHzVr0HJUYRk19Fs=;
 b=f0W7S6KiFPYIkJq28lvjDnTBOsGUBqx8PMvDLitJgvIX6x0pPoGcdN9aPSPpH8nwbzs3
 O6GGk8XYAIM2qHaIxpFNUM4VVjryZojvEPPnBsMVLeY2H22HB2JgtxM+nYYavX1XRWsR
 XjROmQabtzhZvotJrBTKzLuVVLRzHADczUDZCzOPGOJby8nuLBBT1ac5Sm/EqkYT7wRe
 5zEh5PtCPdlSBXyU2yPeOf9IxrDWCYVlvynvDrcWRVMQjFJMfXMG+NfDQjdZm9sg2J0h
 R/FivyMGliOpyHBsSj8pjCe3aejr9eP5AbzGMtdYlMoF5D5AH0JjE0e0urecdAGhT56B ug== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ssmcv94jt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 30 Aug 2023 04:27:54 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37U4RrLv002124
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 30 Aug 2023 04:27:53 GMT
Received: from [10.216.28.157] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 29 Aug
 2023 21:27:49 -0700
Message-ID: <325cf945-4d1f-5591-1ef6-b28e803c134b@quicinc.com>
Date:   Wed, 30 Aug 2023 09:57:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Subject: Re: Disconnect interrupt generation for QC targets when role switch
 is enabled
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Johan Hovold <johan@kernel.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
References: <af60c05b-4a0f-51b8-486a-1fc601602515@quicinc.com>
 <20230828172059.GC818859@hu-bjorande-lv.qualcomm.com>
Content-Language: en-US
From:   Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
In-Reply-To: <20230828172059.GC818859@hu-bjorande-lv.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: yq4z2dUFSD8TXUrDUy8eAec7jBhn5Phz
X-Proofpoint-GUID: yq4z2dUFSD8TXUrDUy8eAec7jBhn5Phz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=802 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308300040
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8/28/2023 10:50 PM, Bjorn Andersson wrote:
>>
>> I had some idea on how to get the role notification reach qcom glue driver
>> but wanted your opinion on whether they can be used or not:
>>
>> 1. Register a vendor_hook from glue driver and invoke that during
>> __dwc3_set_mode.
>>
>> 2. Let the role notification reach dwc3-qcom first and then let qcom driver
>> invoke role_set of drd. Something similar to what was implemented by Wesley
>> on [1].
>>
>> But both the options require dwc3_probe to be done in sync with
>> of_platform_populate or we need to defer qcom probe if dwc3_probe is
>> deferred. Since we are leaning towards async probe, not sure if the above
>> two options would be proper.
>>

...

> As mentioned, this need has been identified a few times by now, so
> nothing strange in your request/proposal.
> 
> But so far no one has come up with a good way to register glue code
> callbacks with the core; we can't pass arbitrary data (such as a
> function pointer to such callback), and we don't know when the core is
> registered, so we can't call a register operation when that happens.
> 
> Regards,
> Bjorn
> 
>> [1]: https://patchwork.kernel.org/project/linux-usb/patch/20201009082843.28503-4-wcheng@codeaurora.org/
>> [2]: https://patchwork.kernel.org/project/linux-usb/cover/20230325165217.31069-1-manivannan.sadhasivam@linaro.org/
>>

Hi Bjorn,

  How about we use Component framework to let the glue layer know that 
the child probe is complete. That way we don't need to defer QCOM probe 
and in the bind call back coming to master (in this case, the glue 
layer), we can register the vendor hook or role switch we need and we 
can pass the role notifications from core to glue as needed.

Regards,
Krishna,
