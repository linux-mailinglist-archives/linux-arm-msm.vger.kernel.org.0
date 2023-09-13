Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 612E779DEAE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Sep 2023 05:35:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238246AbjIMDfM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Sep 2023 23:35:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238244AbjIMDfK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Sep 2023 23:35:10 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A1701719;
        Tue, 12 Sep 2023 20:35:05 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38D3JPZN016703;
        Wed, 13 Sep 2023 03:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=zGwc/4NW+5sTeq1afR2q5Sg4Ygu0rpAQCMcO6lgCMd8=;
 b=IsVsEA43PRFJK32qN8+Dm4ns6UD8Adb3IuGKaO5uf2RE1ff6lF29HQFlA6wVJKE7ofWg
 2L1HKHhoOcdkisXKebtynxpCifNgVjlQP90ldsM8XeR8VbECttP8k2mh5/+6NkuxB5Rc
 Nx1CSe6NOdLvuQWRg4do9jXbhj0UCDhexZoZ0lsSCn0wTJgXLe6f5T3RvSl72hOtdhi1
 Ow8vBOeQrvu+WPRyekSOEtL3z12NHm1XIE/C26NfWILKYDK0/uqa43yMbv1dTgAXTawz
 ZALBsgPbQAcN/ycsvD9imqzEjI2oY1WIFqHvFiGEwapXp81XI5sd5008YaMMmk4w/AYw qQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t3003ggmf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 13 Sep 2023 03:35:00 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38D3YxN2007057
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 13 Sep 2023 03:34:59 GMT
Received: from [10.216.46.24] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 12 Sep
 2023 20:34:55 -0700
Message-ID: <8c149fc5-3fb4-f9a2-9512-6cab2503aaa9@quicinc.com>
Date:   Wed, 13 Sep 2023 09:04:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Subject: Re: Disconnect interrupt generation for QC targets when role switch
 is enabled
Content-Language: en-US
To:     Pavan Kondeti <quic_pkondeti@quicinc.com>
CC:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Johan Hovold <johan@kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
References: <af60c05b-4a0f-51b8-486a-1fc601602515@quicinc.com>
 <20230828172059.GC818859@hu-bjorande-lv.qualcomm.com>
 <325cf945-4d1f-5591-1ef6-b28e803c134b@quicinc.com>
 <cfa39be4-2b33-4900-800c-9884010f5e75@quicinc.com>
From:   Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
In-Reply-To: <cfa39be4-2b33-4900-800c-9884010f5e75@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JA50tHAnCRDGoT2N04CDxigQBXZ18coz
X-Proofpoint-GUID: JA50tHAnCRDGoT2N04CDxigQBXZ18coz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_24,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=618 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309130027
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/6/2023 9:22 PM, Pavan Kondeti wrote:

>>> As mentioned, this need has been identified a few times by now, so
>>> nothing strange in your request/proposal.
>>>
>>> But so far no one has come up with a good way to register glue code
>>> callbacks with the core; we can't pass arbitrary data (such as a
>>> function pointer to such callback), and we don't know when the core is
>>> registered, so we can't call a register operation when that happens.
>>>
>>> Regards,
>>> Bjorn
>>>
>>>> [1]: https://patchwork.kernel.org/project/linux-usb/patch/20201009082843.28503-4-wcheng@codeaurora.org/
>>>> [2]: https://patchwork.kernel.org/project/linux-usb/cover/20230325165217.31069-1-manivannan.sadhasivam@linaro.org/
>>>>
>>
>> Hi Bjorn,
>>
>>   How about we use Component framework to let the glue layer know that the
>> child probe is complete. That way we don't need to defer QCOM probe and in
>> the bind call back coming to master (in this case, the glue layer), we can
>> register the vendor hook or role switch we need and we can pass the role
>> notifications from core to glue as needed.
>>
> 
> Would device_driver::sync_state() help here? The qcom glue driver
> creates a DL_FLAG_SYNC_STATE_ONLY device link with dwc3 core. If it
> works, we can avoid component framework related changes in dwc3 core.
> 
> 

Hi Pavan,

  Thanks for the suggestion. We can use sync state but we might need to 
suppress unbind path for dwc3 core to prevent remove from being called 
(not sure if that is fine on upstream). Reason being if remove is 
called, we won't get any sync state callback for us to un-register glue 
hook. Other ideas that came from team internally were to add a list and 
iterate through in core probe to find out required glue ops and invoke 
them when required.

Regards,
Krishna,
