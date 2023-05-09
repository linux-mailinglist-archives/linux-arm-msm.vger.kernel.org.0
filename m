Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A8EC6FC648
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 May 2023 14:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235055AbjEIM1R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 May 2023 08:27:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230012AbjEIM1Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 May 2023 08:27:16 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 087FABD;
        Tue,  9 May 2023 05:27:15 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 349BqMId019794;
        Tue, 9 May 2023 12:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=G1k/m7VlfCfTdyX6qdJUfIyps8uN80LMOoWK7iOydxA=;
 b=TaQk2QI+SWuozZSw4V+LH/0PevQ0cfU6P/HuQDmC07Vvmn0SPN/fGqW9UIeXd595KJZa
 0rCHgrpJzAY35XrAUqn+IW6GAPWj2lxI2/LTcj83yXy6BTjeygC/HhKXBdhI1I1uOcxG
 8RBV+P+Moym4Fw1HKbV4mVMeGM4XZCdeO+qQCUMPBL4nPbG2kUT3g9dCWynpz/qbVXU3
 T1uU8c36PI2zYsa6Wu+A2iPpzmQ1XFUDjKst1scZibU0kQkcoKoEP/+7odKa4hwjlUBU
 0+bOTh7jx/D7DSpDymghJG5eroVUc/XpwR1s5gebXtA7KKd3bG5uvRSjga298iB/oY89 Zg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qf77g1r2m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 09 May 2023 12:27:04 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 349CR3Z5010985
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 9 May 2023 12:27:03 GMT
Received: from [10.50.37.86] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 9 May 2023
 05:26:59 -0700
Message-ID: <82fcfc55-2879-2af0-5a91-4e9481d41976@quicinc.com>
Date:   Tue, 9 May 2023 17:56:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH V6 2/3] soc: qcom: boot_stat: Add Driver Support for Boot
 Stats
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>,
        "Rajendra Nayak" <quic_rjendra@quicinc.com>
References: <cover.1683628357.git.quic_schowdhu@quicinc.com>
 <35863b47c04c2edd7ae49c57d23682aba6111d4f.1683628357.git.quic_schowdhu@quicinc.com>
 <CAA8EJppkqN6cuYUCC-THb8wb=deRv-01pbS0JgSGf-VXnm8qEg@mail.gmail.com>
From:   Souradeep Chowdhury <quic_schowdhu@quicinc.com>
In-Reply-To: <CAA8EJppkqN6cuYUCC-THb8wb=deRv-01pbS0JgSGf-VXnm8qEg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Oec-eYxsezaHseffRO1Np0qykUKNk6Pj
X-Proofpoint-ORIG-GUID: Oec-eYxsezaHseffRO1Np0qykUKNk6Pj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_08,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 clxscore=1015 mlxscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305090100
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/9/2023 5:09 PM, Dmitry Baryshkov wrote:
> On Tue, 9 May 2023 at 13:53, Souradeep Chowdhury
> <quic_schowdhu@quicinc.com> wrote:
>>
>> All of Qualcomm's proprietary Android boot-loaders capture boot time
>> stats, like the time when the bootloader started execution and at what
>> point the bootloader handed over control to the kernel etc. in the IMEM
>> region. This information is captured in a specific format by this driver
>> by mapping a structure to the IMEM memory region and then accessing the
>> members of the structure to show the information within debugfs file.
>> This information is useful in verifying if the existing boot KPIs have
>> regressed or not. The information is shown in milliseconds, a sample
>> log from sm8450(waipio) device is as follows:-
>>
>> /sys/kernel/debug/qcom_boot_stats # cat abl_time
>> 17898 ms
>> /sys/kernel/debug/qcom_boot_stats # cat pre_abl_time
>> 2879 ms
>>
>> The Module Power Manager(MPM) sleep counter starts ticking at the PBL
>> stage and the timestamp generated by the sleep counter is logged by
>> the Qualcomm proprietary bootloader(ABL) at two points-> First when it
>> starts execution which is logged here as "pre_abl_time" and the second
>> when it is about to load the kernel logged as "abl_time". Documentation
>> details are also added in Documentation/ABI/testing/debugfs-driver-bootstat
>>
>> Signed-off-by: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
>> ---
>>   .../ABI/testing/debugfs-driver-bootstat       |  17 +++
>>   drivers/soc/qcom/Kconfig                      |  10 ++
>>   drivers/soc/qcom/Makefile                     |   1 +
>>   drivers/soc/qcom/boot_stats.c                 | 100 ++++++++++++++++++
>>   4 files changed, 128 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/debugfs-driver-bootstat
>>   create mode 100644 drivers/soc/qcom/boot_stats.c
>>
>> diff --git a/Documentation/ABI/testing/debugfs-driver-bootstat b/Documentation/ABI/testing/debugfs-driver-bootstat
>> new file mode 100644
>> index 000000000000..7127d15d9f15
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/debugfs-driver-bootstat
>> @@ -0,0 +1,17 @@
>> +What:          /sys/kernel/debug/qcom_boot_stats/pre_abl_time
> 
> Could you please change these bindings to be generic?
> 
> s/qcom_boot_stats/boot_stats/
> s/pre_abl_time/pre_bootloader_msec/
> s/abl_time/bootloader_msec/
> 
> This way other platforms might also use the same file structure.

Ack

> 
>> +Date:           May 2023
>> +Contact:        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
>> +Description:
>> +               This file is used to read the KPI value pre abl time.
>> +               It shows the time in milliseconds from the starting
>> +               point of PBL to the point when the control shifted
>> +               to ABL(Qualcomm proprietary bootloader).
>> +
>> +What:           /sys/kernel/debug/qcom_boot_stats/abl_time
>> +Date:           May 2023
>> +Contact:        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
>> +Description:
>> +               This file is used to read the KPI value abl time.
>> +               It show the duration in milliseconds from the
>> +               time control switched to ABL to the point when
>> +               the linux kernel started getting loaded.
>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>> index a491718f8064..04141236dcdd 100644
>> --- a/drivers/soc/qcom/Kconfig
>> +++ b/drivers/soc/qcom/Kconfig
>> @@ -16,6 +16,16 @@ config QCOM_AOSS_QMP
>>            subsystems as well as controlling the debug clocks exposed by the Always On
>>            Subsystem (AOSS) using Qualcomm Messaging Protocol (QMP).
>>
>> +config QCOM_BOOTSTAT
>> +       tristate "Qualcomm Technologies, Boot Stat driver"
>> +       depends on ARCH_QCOM || COMPILE_TEST
>> +       depends on DEBUG_FS
>> +       help
>> +         This option enables driver support for boot stats. Boot stat driver logs
>> +         the kernel bootloader information by accessing the imem region. These
>> +         information are exposed in the form of debugfs files. This is used to
>> +         determine if there is any regression in boot timings.
>> +
>>   config QCOM_COMMAND_DB
>>          tristate "Qualcomm Command DB"
>>          depends on ARCH_QCOM || COMPILE_TEST
>> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
>> index 0f43a88b4894..ae7bda96a539 100644
>> --- a/drivers/soc/qcom/Makefile
>> +++ b/drivers/soc/qcom/Makefile
>> @@ -1,6 +1,7 @@
>>   # SPDX-License-Identifier: GPL-2.0
>>   CFLAGS_rpmh-rsc.o := -I$(src)
>>   obj-$(CONFIG_QCOM_AOSS_QMP) += qcom_aoss.o
>> +obj-$(CONFIG_QCOM_BOOTSTAT) += boot_stats.o
>>   obj-$(CONFIG_QCOM_GENI_SE) +=  qcom-geni-se.o
>>   obj-$(CONFIG_QCOM_COMMAND_DB) += cmd-db.o
>>   obj-$(CONFIG_QCOM_CPR)         += cpr.o
>> diff --git a/drivers/soc/qcom/boot_stats.c b/drivers/soc/qcom/boot_stats.c
>> new file mode 100644
>> index 000000000000..ca67b6b5d8eb
>> --- /dev/null
>> +++ b/drivers/soc/qcom/boot_stats.c
>> @@ -0,0 +1,100 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2013-2019, 2021 The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <linux/debugfs.h>
>> +#include <linux/err.h>
>> +#include <linux/io.h>
>> +#include <linux/init.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_address.h>
>> +#include <linux/platform_device.h>
>> +
>> +#define TO_MS(timestamp) ((timestamp * 1000) / 32768)
> 
> Quoting v4 question, which got no answer:
> 
> Some of the platforms DTs define 32KHz clock instead of 32.768 KHz
> What should be the divisor in this case?

This is the standard divisor used to calculate the pre_abl and abl times
across most QCOM SoCs. Can you give an example where the sleep_stat 
counter has a different frequency?

> 
>> +
>> +/**
>> + *  struct boot_stats - timestamp information related to boot stats
>> + *  @abl_start: Time for the starting point of the abl
>> + *  @abl_end: Time when the kernel starts loading from abl
>> + */
>> +struct boot_stats {
>> +       u32 abl_start;
>> +       u32 abl_end;
>> +} __packed;
>> +
>> +struct bs_data {
>> +       struct boot_stats __iomem *b_stats;
>> +       struct dentry *dbg_dir;
>> +};
>> +
>> +static void populate_boot_stats(char *abl_str, char *pre_abl_str, struct bs_data *drvdata)
>> +{
>> +        u32 abl_time, pre_abl_time;
>> +
>> +        abl_time = TO_MS(drvdata->b_stats->abl_end) - TO_MS(drvdata->b_stats->abl_start);
>> +        sprintf(abl_str, "%u ms", abl_time);
>> +
>> +        pre_abl_time =  TO_MS(drvdata->b_stats->abl_start);
>> +        sprintf(pre_abl_str, "%u ms", pre_abl_time);
> 
> Another point from v4:
> 
> It would be better to move the unit to the file name and include just
> the number.

Clarified from your first comment

> 
>> +}
>> +
>> +static int boot_stats_probe(struct platform_device *pdev)
>> +{
>> +       char abl_str[20], pre_abl_str[20], *abl, *pre_abl;
>> +       struct device *bootstat_dev = &pdev->dev;
>> +       struct bs_data *drvdata;
>> +
>> +       drvdata = devm_kzalloc(bootstat_dev, sizeof(*drvdata), GFP_KERNEL);
>> +       if (!drvdata)
>> +               return dev_err_probe(bootstat_dev, -ENOMEM, "failed to allocate memory");
>> +       platform_set_drvdata(pdev, drvdata);
>> +
>> +       drvdata->b_stats = devm_of_iomap(bootstat_dev, bootstat_dev->of_node, 0, NULL);
>> +       if (IS_ERR(drvdata->b_stats))
>> +               return dev_err_probe(bootstat_dev, PTR_ERR(drvdata->b_stats),
>> +                                    "failed to map imem region");
>> +
>> +       drvdata->dbg_dir = debugfs_create_dir("qcom_boot_stats", NULL);
>> +       if (IS_ERR(drvdata->dbg_dir))
>> +               return dev_err_probe(bootstat_dev, PTR_ERR(drvdata->dbg_dir),
>> +                                    "failed to create debugfs directory");
>> +
>> +       populate_boot_stats(abl_str, pre_abl_str, drvdata);
>> +       abl = abl_str;
>> +       pre_abl = pre_abl_str;
>> +
>> +       debugfs_create_str("pre_abl_time", 0400, drvdata->dbg_dir, (char **)&pre_abl);
>> +       debugfs_create_str("abl_time", 0400, drvdata->dbg_dir, (char **)&abl);
>> +
>> +       return 0;
>> +}
>> +
>> +void boot_stats_remove(struct platform_device *pdev)
>> +{
>> +       struct bs_data *drvdata = platform_get_drvdata(pdev);
>> +
>> +       debugfs_remove_recursive(drvdata->dbg_dir);
>> +}
>> +
>> +static const struct of_device_id boot_stats_dt_match[] = {
>> +       { .compatible = "qcom,imem-bootstats" },
>> +       { }
>> +};
>> +MODULE_DEVICE_TABLE(of, boot_stats_dt_match);
>> +
>> +static struct platform_driver boot_stat_driver = {
>> +       .probe  = boot_stats_probe,
>> +       .remove_new = boot_stats_remove,
>> +       .driver = {
>> +               .name = "qcom-boot-stats",
>> +               .of_match_table = boot_stats_dt_match,
>> +       },
>> +};
>> +module_platform_driver(boot_stat_driver);
>> +
>> +MODULE_DESCRIPTION("Qualcomm Technologies Inc. Boot Stat driver");
>> +MODULE_LICENSE("GPL");
>> --
>> 2.17.1
>>
> 
> 
