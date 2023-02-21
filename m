Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42FC469E530
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Feb 2023 17:56:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234424AbjBUQ4D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Feb 2023 11:56:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234143AbjBUQ4B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Feb 2023 11:56:01 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58FB42C642;
        Tue, 21 Feb 2023 08:56:00 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31LCZbKG020637;
        Tue, 21 Feb 2023 16:27:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Z4x/bECX1Ge7EqLqtH9GZNuXP0+OgWex+15JNKUz2aE=;
 b=oqFEaNJJzs0oa1tO9l81qh1Nj2SSSNJt0EVuZcSGCJdyl7eWUq95jrGap7WUzLr4R11O
 cCxKyYLJLU5igQD7UH5sXvaPhz8aNErOc8QUbsC2K2Vub/hWgK9LF/WkdoS5xv2IHat5
 YK+Yjduh+5ggCDmAfyJ78t2aLUnHpQLN7bgZDjD2MdVf24zofHbyMY4b+HwPAU/IDd3w
 q2DYAvNixemiFa1iDR5EhTeVre2GI8mA8+V7X8bCBgda/0Vw2lomOa0HIjOJgg7ARFhD
 OByYQUBoBe66fs3nIdQpkfS68c2iJlulg5IliTsRPjzLI1PVmqmAE+itRsJ7G7uHNdLT DA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nvp4v1n3n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 21 Feb 2023 16:27:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31LGRVck031916
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 21 Feb 2023 16:27:31 GMT
Received: from [10.50.52.163] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 21 Feb
 2023 08:27:22 -0800
Message-ID: <71cbd918-4f93-e714-a2c3-14cb5b0d717e@quicinc.com>
Date:   Tue, 21 Feb 2023 21:57:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [GIT PULL] Qualcomm clock driver updates for v6.3
To:     Bjorn Andersson <quic_bjorande@quicinc.com>
CC:     Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        "Arnd Bergmann" <arnd@arndb.de>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Robert Marko <robimarko@gmail.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Sricharan R <quic_srichara@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
References: <20230219045318.564342-1-andersson@kernel.org>
 <6d5eb527-7e1c-29bb-e13c-e48c989bf8cd@quicinc.com>
 <20230220153544.cda5uqnjnir6jrdx@ripper>
 <a25a0ed5-ba9c-c669-def3-865dcb5072fc@quicinc.com>
 <20230221154451.GA1092194@hu-bjorande-lv.qualcomm.com>
Content-Language: en-US
From:   Kathiravan T <quic_kathirav@quicinc.com>
In-Reply-To: <20230221154451.GA1092194@hu-bjorande-lv.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: C7yHDY8hgxipZWKtjPg-a1NBl7O02HbP
X-Proofpoint-GUID: C7yHDY8hgxipZWKtjPg-a1NBl7O02HbP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-21_09,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=854
 clxscore=1015 adultscore=0 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302210136
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 2/21/2023 9:14 PM, Bjorn Andersson wrote:
> On Mon, Feb 20, 2023 at 10:10:07PM +0530, Kathiravan T wrote:
>> On 2/20/2023 9:05 PM, Bjorn Andersson wrote:
>>> On Mon, Feb 20, 2023 at 05:17:39PM +0530, Kathiravan T wrote:
>>>> On 2/19/2023 10:23 AM, Bjorn Andersson wrote:
>>>>> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
>>>>>
>>>>>      Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
>>>>>
>>>>> are available in the Git repository at:
>>>>>
>>>>>      https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-6.3
>>>>>
>>>>> for you to fetch changes up to 7935b534d32a1823a7d5db449d340f56c201f284:
>>>>>
>>>>>      dt-bindings: clock: Merge qcom,gpucc-sm8350 into qcom,gpucc.yaml (2023-02-08 19:29:25 -0800)
>>>>>
>>>>> ----------------------------------------------------------------
>>>>> Qualcomm clock driver updates for v6.3
>>>>>
>>>>> Support for requesting the next power_off operation for a genpd to be
>>>>> synchronous is introduced, and implemented in the GDSC driver. To allow
>>>>> the GPU driver to request power_off to wait for the GDSC to actually
>>>>> collapse.
>>>>>
>>>>> clk_disable_unused() is altered, to not consider clocks which comes from
>>>>> a provider with sync_state defined. This makes it possible for
>>>>> individual clock drivers to invoke this process once all clients has
>>>>> been probed, avoiding the need for booting many systems with
>>>>> clk_ignore_unused.
>>>>> This is then enabled for SDM845 and SC8280XP clock controllers.
>>>>>
>>>>> Support for QDU1000/QRU1000 Global clock controller, SA8775P Global
>>>>> clock controller, SM8550 TCSR and display clock controller, SM6350 clock
>>>>> controller, nd MSM8996 CBF and APCS clock controllers is introduced..
>>>>>
>>>>> Parent references are updated across a large number of clock drivers, to
>>>>> align with the design changes since those drivers where introduced.
>>>>> Similarly, test clocks has been dropped from a range of drivers.
>>>>>
>>>>> A range of fixes for the MSM8996 CPU clock controller is introduced.
>>>>>
>>>>> MSM8974 GCC is transitioned off the externally defined sleep_clk.
>>>>>
>>>>> GDSC in the global clock controller for QCS404 is added, and various
>>>>> parent definitions are cleaned up.
>>>>>
>>>>> The SDCC core clocks on SM6115 are moved for floor_ops.
>>>>>
>>>>> Programming of clk_dis_wait for GPU CX GDSC on SC7180 and SDM845 are
>>>>> moved to use the recently introduced properties in the GDSC struct.
>>>>>
>>>>> The RPMh clock driver gains SM8550 and SA8775P clocks, and the IPA clock
>>>>> is added on a variety of platforms.
>>>>>
>>>>> The SMD RPM driver receives a big cleanup, in particular a move away
>>>>> from duplicating declaration of identical clocks between multiple
>>>>> platforms.
>>>>> A few missing clocks across msm8998, msm8992, msm8916, qcs404 are added
>>>>> as well.
>>>>>
>>>>> Using devm_pm_runtime_enable() to clean up some duplication is done
>>>>> across SM8250 display and video clock controllers, SM8450 display clock
>>>>> controller and SC7280 LPASS clock controller.
>>>>>
>>>>> Devicetree binding changes for above mentioned additions and changes are
>>>>> introduced.
>>>>>
>>>>> Lastly, a change to pad a few registers in the SM8250 DTS to 8 digits
>>>>> was picked up in the wrong tree and kept here, to avoid rebasing.
>>>>>
>>>>> ----------------------------------------------------------------
>>>> <snip>
>>>>
>>>> Bjorn,
>>>>
>>> Hi Kathiravan,
>>>
>>>> I don't see the change got picked up v6.3 https://lore.kernel.org/linux-arm-msm/20230120082631.22053-1-quic_kathirav@quicinc.com/.
>>>> Please help to understand what is missing to get it picked up?
>>>>
>>> Afaict, this patch introduces support that doesn't have a user today,
>>> and as such should be merged together with:
>>> https://lore.kernel.org/linux-arm-msm/20230217083308.12017-4-quic_kathirav@quicinc.com/
>>
>> Thanks Bjorn. I got the point. This patch also needed for IPQ5332 Baseport
>> patches https://lore.kernel.org/linux-gpio/20230217075835.460-1-quic_kathirav@quicinc.com/
>>
>>
>>> Which hasn't yet been picked up...
>>>
>>> But please send such patches together in the future, to make it easier
>>> for people to review and me to merge them.
>>
>> If I re-spin the IPQ5332 base port patches, shall I add this patch to the
>> IPQ5332 series itself and send it or you are okay to pick it up as it is?
>>
> Doesn't:
> https://lore.kernel.org/linux-gpio/20230217075835.460-1-quic_kathirav@quicinc.com/
> depend on:
> https://lore.kernel.org/linux-arm-msm/20230217083308.12017-4-quic_kathirav@quicinc.com/
> being merged first?


Both the baseport[1] and APSS clock driver[2] series depends on the 
patch 
https://lore.kernel.org/linux-arm-msm/20230120082631.22053-1-quic_kathirav@quicinc.com/. 
GCC driver which is part of baseport uses the clk_alpha_pll_stromer_ops 
which is introduced in the mentioned patch.  However there is no 
dependency between baseport and APSS clock driver apart from DTS changes.


[1] 
https://lore.kernel.org/linux-gpio/20230217075835.460-1-quic_kathirav@quicinc.com/

[2] 
https://lore.kernel.org/linux-arm-msm/20230217083308.12017-1-quic_kathirav@quicinc.com/


>
> If you are going to resubmit the IPQ5332 baseport, please consider
> sending one series with all the clock patches together.
>
> You may send the dts separately, mentioning the dependency on the clock
> series - or any other independent driver series that you sent out. That
> way you make it easy for each maintainer to pick the patches destined
> for their tree.


Thanks got it. In the next re-spin let me include the mentioned patch 
along with the baseport series.


Thanks, Kathiravan T.


> Regards,
> Bjorn
