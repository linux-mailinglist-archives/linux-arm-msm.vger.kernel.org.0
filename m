Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA57A6C4D14
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 15:08:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231273AbjCVOI5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 10:08:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230513AbjCVOI4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 10:08:56 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A038C83F9;
        Wed, 22 Mar 2023 07:08:55 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32M5Di7Z006527;
        Wed, 22 Mar 2023 14:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=XyC8Vg8Vddv01CmDJkL51n+6GguQndl0CbYryLQ2s/0=;
 b=Yk8YO2CLwdIbcjGh3XoiwPSuKuMqVXTASblAf5fEk6Z9/ALhwhczEonkRo9EzPyDekzb
 n2DVsEdjDwpR0KQ3RRQaCV+TNgItSMp2oE4+q+OKEU54AScqRaoHNfUAC1aeFfX/dvDu
 AOMQTNOksmf3vm5aLlXhefd5F0Lh4WRfhmR/rvsN8+M6G+q53Osr0OtGTJO9rsRxFeeu
 BUxtmP6lQ6WFqzZkhwzpRzltCk2ONjk8AnX5eDkE8inFzsJHFPAbS8WlXvZbVNXS741v
 /y7KQA32koVjki7Sp+HOAgFz3CPzwwMwR6khvWoc+ofwg8VxC2t/qIERNo1FgOh/ynnq fw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pfdm4k5y9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 22 Mar 2023 14:08:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32ME8ij0018980
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 22 Mar 2023 14:08:44 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 22 Mar
 2023 07:08:43 -0700
Message-ID: <9ecfcdc2-71cb-4149-a05c-69947f255720@quicinc.com>
Date:   Wed, 22 Mar 2023 08:08:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v4 7/8] accel/qaic: Add qaic driver to the build system
Content-Language: en-US
To:     Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        <ogabbay@kernel.org>, <airlied@gmail.com>, <daniel@ffwll.ch>,
        <stanislaw.gruszka@linux.intel.com>
CC:     <dafna@fastmail.com>, <linux-doc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <quic_ajitpals@quicinc.com>, <quic_pkanojiy@quicinc.com>,
        <quic_carlv@quicinc.com>
References: <1679325074-5494-1-git-send-email-quic_jhugo@quicinc.com>
 <1679325074-5494-8-git-send-email-quic_jhugo@quicinc.com>
 <f4e01050-ecaa-75e3-92f4-e2b71702cc52@linux.intel.com>
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <f4e01050-ecaa-75e3-92f4-e2b71702cc52@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KKjN7n1FXYZWVrJvU4-PSbWKHS8JBm_N
X-Proofpoint-GUID: KKjN7n1FXYZWVrJvU4-PSbWKHS8JBm_N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_11,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303220103
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/22/2023 2:03 AM, Jacek Lawrynowicz wrote:
> Hi,
> 
> On 20.03.2023 16:11, Jeffrey Hugo wrote:
>> Now that we have all the components of a minimum QAIC which can boot and
>> run an AIC100 device, add the infrastructure that allows the QAIC driver
>> to be built.
>>
>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
>> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
>> Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> ---
>>   drivers/accel/Kconfig       |  1 +
>>   drivers/accel/Makefile      |  1 +
>>   drivers/accel/qaic/Kconfig  | 23 +++++++++++++++++++++++
>>   drivers/accel/qaic/Makefile | 13 +++++++++++++
>>   4 files changed, 38 insertions(+)
>>   create mode 100644 drivers/accel/qaic/Kconfig
>>   create mode 100644 drivers/accel/qaic/Makefile
>>
>> diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
>> index c437206..64065fb 100644
>> --- a/drivers/accel/Kconfig
>> +++ b/drivers/accel/Kconfig
>> @@ -26,5 +26,6 @@ menuconfig DRM_ACCEL
>>   
>>   source "drivers/accel/habanalabs/Kconfig"
>>   source "drivers/accel/ivpu/Kconfig"
>> +source "drivers/accel/qaic/Kconfig"
>>   
>>   endif
>> diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
>> index 07aa77a..26caf43 100644
>> --- a/drivers/accel/Makefile
>> +++ b/drivers/accel/Makefile
>> @@ -2,3 +2,4 @@
>>   
>>   obj-y	+= habanalabs/
>>   obj-y	+= ivpu/
>> +obj-$(CONFIG_DRM_ACCEL_QAIC)  += qaic/
> 
> Use two tabs instead of two spaces here to align with the current version of this file on drm-misc-next.

Will do.

-Jeff

