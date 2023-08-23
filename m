Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F402784F7D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Aug 2023 05:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232377AbjHWD4u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Aug 2023 23:56:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232206AbjHWD4t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Aug 2023 23:56:49 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3466DE4D;
        Tue, 22 Aug 2023 20:56:47 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37N3koo1001236;
        Wed, 23 Aug 2023 03:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=XYFR/hhNrSg1/8o9vpDIeGBTsQ1gKFTng2c2YMs76yc=;
 b=f1GdiArNc/jOB28hvx1lq6kyeHNQ0DOoEIFUe7JOhDXlm7ydOyelxAkuzKbMjbChOn5N
 VHBsl6guFst5MuE19GM1+biRFt8dXaMNntjGT6F1GZcH9iV8OiaLhW2G5K2yMumid4UR
 IQTBowjhphvvG9cla3RWRUD/3sL6n4yw4BvdNXXsmAZ19kHfkWB0mb+2YQDlIdO1UUWL
 /Zad/11Y73kVfmN6u9F1h3hkhcfXYk0WGi1Pa94SrbpgsFzwJi2bFtCJr6c9mGrnnQDL
 g6ufgkVZXPZAx9jFe+FsPGLeNvJM6Q931h4BkhQuroUsbzXimgogJsATKYd0pHUsSt7C jQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sn2bt8up5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 23 Aug 2023 03:56:40 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37N3udXT015167
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 23 Aug 2023 03:56:39 GMT
Received: from [10.218.47.181] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 22 Aug
 2023 20:56:36 -0700
Message-ID: <071bf71a-f513-4be8-9c87-ce3e004901fc@quicinc.com>
Date:   Wed, 23 Aug 2023 09:26:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: core: crypto: Add MMC_CAP2_CRYPTO_RETAIN_KEY
To:     Eric Biggers <ebiggers@kernel.org>
CC:     <andersson@kernel.org>, <linux-mmc@vger.kernel.org>,
        <satyaprateek2357@gmail.com>, <ulf.hansson@linaro.org>,
        <agross@kernel.org>, <adrian.hunter@intel.com>,
        <linux-arm-msm@vger.kernel.org>
References: <20230821065037.1146977-1-quic_omprsing@quicinc.com>
 <20230822045011.GA1661@sol.localdomain>
Content-Language: en-US
From:   Om Prakash Singh <quic_omprsing@quicinc.com>
In-Reply-To: <20230822045011.GA1661@sol.localdomain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: H9Pb4c8F26JuxRFUMzbEjX0stlm2rcld
X-Proofpoint-GUID: H9Pb4c8F26JuxRFUMzbEjX0stlm2rcld
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-22_22,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308230036
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8/22/2023 10:20 AM, Eric Biggers wrote:
> On Mon, Aug 21, 2023 at 12:20:37PM +0530, Om Prakash Singh wrote:
>> Add new capability MMC_CAP2_CRYPTO_RETAIN_KEY for mmc host that
>> support inline crypto key retention and doesn't need reinitialization
>> of all keys after mmc host has reinitialized.
> 
> MMC_CAP2_RETAINS_CRYPTO_KEYS would be a better name.
I will update in next version
> 
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index 1c935b5bafe1..cfc2328f90ed 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -1828,6 +1828,7 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>>   
>>   	msm_host->ice = ice;
>>   	mmc->caps2 |= MMC_CAP2_CRYPTO;
>> +	mmc->caps2 |= MMC_CAP2_CRYPTO_RETAIN_KEY;
>>   
>>   	return 0;
>>   }
> 
> Are you sure that *all* versions of Qualcomm's eMMC inline encryption hardware
> have this behavior?
Thanks for pointing this out. I am not sure and checking internally for 
more information.

> 
>> diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
>> index 461d1543893b..74c69415746d 100644
>> --- a/include/linux/mmc/host.h
>> +++ b/include/linux/mmc/host.h
>> @@ -417,8 +417,10 @@ struct mmc_host {
>>   #define MMC_CAP2_MERGE_CAPABLE	(1 << 26)	/* Host can merge a segment over the segment size */
>>   #ifdef CONFIG_MMC_CRYPTO
>>   #define MMC_CAP2_CRYPTO		(1 << 27)	/* Host supports inline encryption */
>> +#define MMC_CAP2_CRYPTO_RETAIN_KEY (1 << 28)	/* Host doesn't need inline encryption key reinitialization */
> 
> How about:
> 
> /* Host retains inline encryption keys on reset */
>
I will update in next version

>>   #else
>>   #define MMC_CAP2_CRYPTO		0
>> +#define MMC_CAP2_CRYPTO_RETAIN_KEY 0
>>   #endif
>>   #define MMC_CAP2_ALT_GPT_TEGRA	(1 << 28)	/* Host with eMMC that has GPT entry at a non-standard location */
> 
> '1 << 28' is already used.
ack
> Also, the new flag doesn't need to be in the #ifdef section.
> 
> - Eric
