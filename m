Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4F7F6C6F85
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Mar 2023 18:42:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbjCWRmJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 13:42:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbjCWRmF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 13:42:05 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1444930C2;
        Thu, 23 Mar 2023 10:42:03 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32NBQna8008673;
        Thu, 23 Mar 2023 17:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=d49xfY0qKzT0yFffN/N7thhYxqCCvvAhkFT+qSPqo9s=;
 b=QRGV/mE9AVw7loAK281WwXCnfOKL6pOGv/Y4YycjBzWPJw9oqNbrHnKQxjRfPyoG69YG
 kiwFrGWhF27yWVDrBhCZ/Fi+pkqEeMv2xr2r5RsEIKoSsyPrFht8JVs8BxMTdxXV7n5J
 kZvapjxY97GLoBiFZM8dYh2TXiQz+xCMs4nSYgTiCT0XeL459VeieiVi4xdwWnWcDkcH
 cFCNSa1mCaPrIDfwrbf4/76yjBBylZtxtwJcnCvbbsagOYlYGpJJGXriDoyTytBbVLYR
 K4TdnFTA2hv6O4aq83J33/s+uYQf43QVp3yPKxhMRZdthp9xY9I4G1Bn1EbNjflBPtCF kQ== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pgfv69wp2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 23 Mar 2023 17:41:23 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32NHfMDA029836
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 23 Mar 2023 17:41:22 GMT
Received: from [10.110.12.201] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 23 Mar
 2023 10:41:19 -0700
Message-ID: <9d429459-d28f-5e76-59ab-f04281dea7e2@quicinc.com>
Date:   Thu, 23 Mar 2023 10:41:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [GIT PULL] Qualcomm driver updates for v6.3
Content-Language: en-US
From:   Trilok Soni <quic_tsoni@quicinc.com>
To:     Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Leo Yan <leo.yan@linaro.org>,
        Arnd Bergmann <arnd.bergmann@linaro.org>,
        "Bjorn Andersson" <andersson@kernel.org>
CC:     Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>, arm <arm@kernel.org>,
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
 <4704856d-eac6-9088-4523-3739e04d3fcd@quicinc.com>
 <Y/YHByya0NvoU+If@leoy-yangtze.lan>
 <4e8effc6-396a-84af-856f-c820f62d8b16@quicinc.com>
 <f3797f6f-c2a3-cbe3-dd18-267803fb4620@quicinc.com>
In-Reply-To: <f3797f6f-c2a3-cbe3-dd18-267803fb4620@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _p0jiltCOn1CGx7UfWcRkxwwgSX5OfwP
X-Proofpoint-ORIG-GUID: _p0jiltCOn1CGx7UfWcRkxwwgSX5OfwP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_21,2023-03-23_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 clxscore=1011
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303230129
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/13/2023 9:55 AM, Trilok Soni wrote:
> On 2/27/2023 4:43 AM, Souradeep Chowdhury wrote:
>>
>>
>> On 2/22/2023 5:43 PM, Leo Yan wrote:
>>> Hi Souradeep,
>>>
>>> On Wed, Feb 22, 2023 at 04:46:07PM +0530, Souradeep Chowdhury wrote:
>>>> On 2/22/2023 7:13 AM, Leo Yan wrote:
>>>>> On Wed, Feb 15, 2023 at 04:05:36PM +0100, Arnd Bergmann wrote:
>>>
>>> [...]
>>>
>>>>>> If the possible use is purely for saving some state across
>>>>>> a reboot, as opposed to other events, I wonder if there is
>>>>>> a good way to integrate it into the fs/pstore/ code, which
>>>>>> already has a way to multiplex various kinds of input (log
>>>>>> buffer, ftrace call chain, userspace strings, ...) into
>>>>>> various kinds of persistent buffers (sram, blockdev, mtd,
>>>>>> efivars, ...) with the purpose of helping analyze the
>>>>>> state after a reboot.
>>>>>
>>>>> Good point!
>>>>>
>>>>> I understand pstore/ramoops is somehow like a sink which routes the
>>>>> tracing data (software tracing data but not hadware tracing data) to
>>>>> persistent memory.  This is why we also can route these software
>>>>> tracing data to STM (hardware sink!).
>>>>>
>>>>> Seems to me, Arnd suggests to connect two sinks between DCC and
>>>>> pstore (to persistent memory).  But I cannot give an example code in
>>>>> kernel for doing this way, sorry if I miss something.
>>>>>
>>>>> Essentially, a good user case is to keep a persistent memory for the
>>>>> tracing data, then after rebooting cycle we can retrieve the tracing
>>>>> data via user space interface (like sysfs node).
>>>>
>>>> Hi Leo/Arnd,
>>>>
>>>> Just wanted to let you know that the justification of not using 
>>>> PStore was
>>>> already given in the version 1 of this patch series as below
>>>>
>>>> https://lore.kernel.org/linux-arm-msm/ab30490c016f906fd9bc5d789198530b@codeaurora.org/#r
>>>>
>>>> PStore/Ramoops only persists across warm-reboots which is present 
>>>> for chrome
>>>> devices but not for android ones.
>>>
>>> Thanks for the info.  Just remind a subtle difference of reboots.
>>>
>>> Besides warm reboot, kernel can reboot system after panic (see kernel
>>> command line option `panic`) and watchdog can reboot the system as well.
>>>
>>> Even though Android doesn't support warm reboot, system still can reboot
>>> on panic or by watchdog (in particular after bus lockup), pstore/ramoops
>>> also can support these cases.
>>
>>
>> So for the SoCs that doesn't support warm reboots, the DDR memory is non
>> persistent across panics or watchdog bites in which case the 
>> PStore/Ramoops cannot be of use.
>>
>>
>>>
>>>> Also the dcc_sram contents can
>>>> also be collected by going for a software trigger after loading the 
>>>> kernel
>>>> and the dcc_sram is parsed to get the register values with the
>>>> opensource parser as below
>>>>
>>>> https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/tools/tree/dcc_parser
>>>
>>> To be clear, current driver is fine for me (TBH, I didn't spend much
>>> time to read it but it's very neat after quickly went through it), I
>>> just share some info in case it's helpful for the discussion.
> 
> 
> What is the conclusion here? Can we pick up the DCC now if we rebase to 
> the latest tree? It seems so far response here is that driver is fine 
> as-is and it can be included without any changes. I want this driver 
> discussion to be concluded since we are trying to submit it for more 
> than 23 months (as Bjorn counted :) ).


Bjorn and Arnd can you please check and provide feedback? I really want 
this driver to get merged or open issues resolved.

---Trilok Soni
