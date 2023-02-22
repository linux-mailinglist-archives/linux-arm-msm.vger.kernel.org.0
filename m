Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14C8169F359
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Feb 2023 12:17:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230171AbjBVLR1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Feb 2023 06:17:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231820AbjBVLRY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Feb 2023 06:17:24 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 206D51C584;
        Wed, 22 Feb 2023 03:17:18 -0800 (PST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31M8PcxW028488;
        Wed, 22 Feb 2023 11:16:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=nML31DctwBUvkitASprnhYZAkGy+JzuLI9w8+QmnHUM=;
 b=TupmyjSTW8ZX82imuO3aqJRec6vleU5XTPiPJZAkGcSNuQcSkFwePRZIsheS4/1LQuK8
 F8V5MYjI2wQkrwN3XT0yCaaoNMB796TvHElY7TTQCoG0JYhS/JH5hmKZodtpGM35nS3W
 1/LWE74vxcEaflsJ8jzB0ju9SU8ymgyUXzzf+POoYpoi1QzLnxEKcGDfulSg2Z1Yq1GT
 ppKxMOrzzKtf7DQ0C+sL0is/63lzh/q+SOpWiVeK5U/4J5jdUP2n2BQrkONduI+pjZwT
 x5zuzEHsBpMnSvzAB4nwicvMe/cZLFF3zmWqzm1TT5Cxz6K50jWE/R9S58tTc1fAE+Nx og== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nw8gns9e6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 22 Feb 2023 11:16:36 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31MBGZqV017300
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 22 Feb 2023 11:16:35 GMT
Received: from [10.79.141.17] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 22 Feb
 2023 03:16:24 -0800
Message-ID: <4704856d-eac6-9088-4523-3739e04d3fcd@quicinc.com>
Date:   Wed, 22 Feb 2023 16:46:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [GIT PULL] Qualcomm driver updates for v6.3
Content-Language: en-US
To:     Leo Yan <leo.yan@linaro.org>, Arnd Bergmann <arnd@arndb.de>
CC:     Bjorn Andersson <andersson@kernel.org>, arm <arm@kernel.org>,
        <soc@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Andy Gross <agross@kernel.org>,
        "Olof Johansson" <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        "Bagas Sanjaya" <bagasdotme@gmail.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dawei Li <set_pte_at@outlook.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Naman Jain <quic_namajain@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        "Yang Li" <yang.lee@linux.alibaba.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        <coresight@lists.linaro.org>,
        "Mathieu Poirier" <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        "Arnaldo Carvalho de Melo" <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jiri Olsa <jolsa@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        <linux-perf-users@vger.kernel.org>,
        John Garry <john.g.garry@oracle.com>,
        Will Deacon <will@kernel.org>,
        James Clark <james.clark@arm.com>
References: <20230126163008.3676950-1-andersson@kernel.org>
 <cdcff86c-77fe-4c5d-b8e8-58b815b9e969@app.fastmail.com>
 <20230130222412.t2tkkhqfep2orxf2@builder.lan>
 <9b680581-0956-4188-9af9-af06b625c001@app.fastmail.com>
 <Y/VzRJzxkPm3l0Km@leoy-yangtze.lan>
From:   Souradeep Chowdhury <quic_schowdhu@quicinc.com>
In-Reply-To: <Y/VzRJzxkPm3l0Km@leoy-yangtze.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3MDbKFJmjVKm95scSPH3wKNDqYHFSa3b
X-Proofpoint-GUID: 3MDbKFJmjVKm95scSPH3wKNDqYHFSa3b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-22_05,2023-02-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1011
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302220099
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/22/2023 7:13 AM, Leo Yan wrote:
> On Wed, Feb 15, 2023 at 04:05:36PM +0100, Arnd Bergmann wrote:
> 
> [...]
> 
>>> To my knowledge the hwtracing framework is an interface for
>>> enabling/disabling traces and then you get a stream of trace data out of
>>> it.
>>>
>>> With DCC you essentially write a small "program" to be run at the time
>>> of an exception (or triggered manually). When the "program" is run it
>>> acquire data from mmio interfaces and stores data in sram, which can
>>> then be retrieved - possibly after the fatal reset of the system.
>>>
>>> Perhaps I've misunderstood the hwtracing framework, please help me steer
>>> Souradeep towards a subsystem you find suitable for this functionality.
>>
>> I'm also not too familiar with tracing infrastructure and was hoping
>> that the coresight maintainers (Mathieu, Suzuki, Mike and Leo)
>> would have some suggestions here. My initial guess was that in
>> both cases, you have hardware support that is abstracted by the
>> kernel in order to have a user interface that can be consumed
>> by the 'perf' tool.
> 
> My understanding is hwtracing provides a common framework for STM so
> that different tracing IPs (like Intel_th and Arm CoreSight) can
> register STM module into this framework.  The framework code is placed
> in: linux/drivers/hwtracing/stm.
> 
> Now kernel doesn't provide a general framework for all hardware tracing
> IPs, e.g. Arm CoreSight has its own framework to manage tracing
> components and creating links with sinks.
> 
> Simply to say, we can place DCC driver in linux/drivers/hwtracing folder
> (like Hisilicon's ptt driver), but we have no common framework for it to
> use.
> 
> Based on reading DCC's driver, seems to me it's more like a bus tracing
> module rather than a uncore PMU.  I found the driver does not support
> interrupt, I am not sure this is a hardware limitation or just software
> doesn't implement the interrupt handling, without interrupt, it would be
> difficult for using DCC for profiling.
> 
> If we register DCC into perf framework, the good thing is DCC can use
> perf framework (e.g. perf's configs) as its user space interface, but
> it's still not clear for me how to capture the DCC trace data (no
> interrupt and not relevant with process task switching).
> 
> [...]
> 
>> If the possible use is purely for saving some state across
>> a reboot, as opposed to other events, I wonder if there is
>> a good way to integrate it into the fs/pstore/ code, which
>> already has a way to multiplex various kinds of input (log
>> buffer, ftrace call chain, userspace strings, ...) into
>> various kinds of persistent buffers (sram, blockdev, mtd,
>> efivars, ...) with the purpose of helping analyze the
>> state after a reboot.
> 
> Good point!
> 
> I understand pstore/ramoops is somehow like a sink which routes the
> tracing data (software tracing data but not hadware tracing data) to
> persistent memory.  This is why we also can route these software
> tracing data to STM (hardware sink!).
> 
> Seems to me, Arnd suggests to connect two sinks between DCC and
> pstore (to persistent memory).  But I cannot give an example code in
> kernel for doing this way, sorry if I miss something.
> 
> Essentially, a good user case is to keep a persistent memory for the
> tracing data, then after rebooting cycle we can retrieve the tracing
> data via user space interface (like sysfs node).

Hi Leo/Arnd,

Just wanted to let you know that the justification of not using PStore 
was already given in the version 1 of this patch series as below

https://lore.kernel.org/linux-arm-msm/ab30490c016f906fd9bc5d789198530b@codeaurora.org/#r

PStore/Ramoops only persists across warm-reboots which is present for 
chrome devices but not for android ones. Also the dcc_sram contents can
also be collected by going for a software trigger after loading the 
kernel and the dcc_sram is parsed to get the register values with the
opensource parser as below

https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/tools/tree/dcc_parser

Pstore on the other hand can only be collected on the next reboot.

Thanks,
Souradeep

> 
> Thanks,
> Leo
