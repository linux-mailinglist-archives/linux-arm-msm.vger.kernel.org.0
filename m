Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C186A78BA60
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Aug 2023 23:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229820AbjH1Vf4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Aug 2023 17:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233794AbjH1Vfj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Aug 2023 17:35:39 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E402D186
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 14:35:36 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37SLXZBh000646;
        Mon, 28 Aug 2023 21:35:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=QX0IWt4Uo65a2ZO0nHly3/Zk1oxm5PDDbCMTrurBS8w=;
 b=LfWFB3Ljlm/8g8PK+3/AA1WFGlOwxDRvP/WJ6jJUj65h3YLD5JXUm/fU5gG1WLyraVov
 TP2DHn+UK6fZj/1DDMc2JboBUzzZmaliTeSD8BSZybX+uUwyK+6eu0SrRETriwP16AQz
 j6hCRYMRowQLSiXUbCaKnKPy0SL9Qyvq9l6SUnBzNgM7qdZ5y6DuS7WmMN1n+ryut5Ls
 9CZNp+Q4SBY/cd1dGxEr2Y0e7gtxq45BaV4mU7ZkxJVI1s0SflW0dE/pvaWMdy+3R886
 po4N45yy3FpdHaAnuyauATRF4eDUwCC3hdRKOifRCmC2GYGPNXMSPoNpvQzBYdBhkg+9 2Q== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ss3fr00dn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 28 Aug 2023 21:35:11 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37SLZBnF002730
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 28 Aug 2023 21:35:11 GMT
Received: from [10.110.112.60] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 28 Aug
 2023 14:35:10 -0700
Message-ID: <c06a31fd-e3b5-1f58-9e4f-7fafd8aa3f28@quicinc.com>
Date:   Mon, 28 Aug 2023 14:35:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] iommu/arm-smmu-qcom: NULL pointer check for driver data
Content-Language: en-US
To:     Rob Clark <robdclark@chromium.org>
CC:     <will@kernel.org>, <joro@8bytes.org>, <robin.murphy@arm.com>,
        <dmitry.baryshkov@linaro.org>, <quic_bjorande@quicinc.com>,
        <konrad.dybcio@linaro.org>, <quic_eberman@quicinc.com>,
        <quic_psodagud@quicinc.com>, <quic_rvishwak@quicinc.com>,
        <quic_saipraka@quicinc.com>, <quic_molvera@quicinc.com>,
        <marijn.suijten@somainline.org>, <mani@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>
References: <20230816225509.11070-1-quic_aprasann@quicinc.com>
 <CAJs_Fx7132o3iHDH0ZR7L9G69o2YV2-jC0v15shQcEhH6=-6RA@mail.gmail.com>
From:   Aravind Vijayakumar <quic_aprasann@quicinc.com>
In-Reply-To: <CAJs_Fx7132o3iHDH0ZR7L9G69o2YV2-jC0v15shQcEhH6=-6RA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Zh__iUlPR0h4jW3lq5ydSAoJjAQ-h5_n
X-Proofpoint-ORIG-GUID: Zh__iUlPR0h4jW3lq5ydSAoJjAQ-h5_n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-28_18,2023-08-28_04,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 adultscore=0 spamscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308280186
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 8/16/2023 6:01 PM, Rob Clark wrote:
> On Wed, Aug 16, 2023 at 3:55 PM Aravind Vijayakumar
> <quic_aprasann@quicinc.com> wrote:
>> The driver_data is NULL when qcom_adreno_smmu_init_context()
>> is called before the dev_set_drvdata() from the client driver
>> and is resulting in kernel crash.
>>
>> So add a null pointer check to handle the scenario
>> where the client driver for the GPU SMMU device would
>> be setting the driver data after the smmu client device
>> probe is done and not necessarily before that. The function
>> qcom_adreno_smmu_init_context() assumes that the client
>> driver always set the driver data using dev_set_drvdata()
>> before the smmu client device probe, but this assumption
>> is not always true.
>>
>> Signed-off-by: Aravind Vijayakumar <quic_aprasann@quicinc.com>
>> ---
>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> index c71afda79d64..5323f82264ca 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> @@ -231,6 +231,9 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>>           */
>>
>>          priv = dev_get_drvdata(dev);
>> +       if (!priv)
>> +               return 0;
> could this -EPROBE_DEFER instead, or something like that?  I think you
> patch as proposed would result in per-process gpu pgtables silently
> failing
>
> BR,
> -R

Thanks for the review comments. Returning -EPROBE_DEFER wont work 
because the probe of the client driver (which sets the driver data) will 
never get triggered. However, the probe of the client driver succeeds if 
we return -ENODATA. would that be acceptable?

Regards,

Aravind

>> +
>>          priv->cookie = smmu_domain;
>>          priv->get_ttbr1_cfg = qcom_adreno_smmu_get_ttbr1_cfg;
>>          priv->set_ttbr0_cfg = qcom_adreno_smmu_set_ttbr0_cfg;
>> --
>> 2.40.1
>>
