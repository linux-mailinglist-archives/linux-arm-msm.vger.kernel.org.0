Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95D0969CA26
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Feb 2023 12:48:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231767AbjBTLsS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Feb 2023 06:48:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231830AbjBTLsR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Feb 2023 06:48:17 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7745310C1;
        Mon, 20 Feb 2023 03:48:14 -0800 (PST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31K8RBRX001696;
        Mon, 20 Feb 2023 11:47:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ce/k/Dzu7N/ZGvvYU/3umunZo8GKLRIbak+8C25Kgis=;
 b=lf0mva7XlF5JkRjrG4gfeuyeKwftNmB90KfcdqiCGnBF5/k/g/7rOEhVL5nLLFtxPiL1
 LR8FjvpbQAAcCZuAXhnLa4ybPy45GUfO35vIQFeRN24Nd+FrMAzSQp/e1KuSCB/ja+hU
 Iy4H8ag2i0vctNCesVwC780iTENyVMo9nehLhnLHtkob5jmX9sy+uvOUZeIUpepwhCxk
 1dNe19S+RiURRfi0JyjA6gPG+0kUCzJ3hYZyUTMB5iHF7oc5G6Ub4uHw0EjzEAR1roXe
 a5nsTivZfyBX9CMWk/Yir37gzxogsAFV7HI8qqr5bCDUl7esoxxsCPZrFda/0x7SxQwE 8Q== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ntp0t51ft-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 20 Feb 2023 11:47:53 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31KBlq1E030454
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 20 Feb 2023 11:47:52 GMT
Received: from [10.50.18.222] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 20 Feb
 2023 03:47:43 -0800
Message-ID: <6d5eb527-7e1c-29bb-e13c-e48c989bf8cd@quicinc.com>
Date:   Mon, 20 Feb 2023 17:17:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [GIT PULL] Qualcomm clock driver updates for v6.3
To:     Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, <linux-clk@vger.kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>,
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
        "Bjorn Andersson" <quic_bjorande@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
Content-Language: en-US
From:   Kathiravan T <quic_kathirav@quicinc.com>
In-Reply-To: <20230219045318.564342-1-andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7JiFu4XUWsGqM91UDbjNx_V57QnT1OpS
X-Proofpoint-ORIG-GUID: 7JiFu4XUWsGqM91UDbjNx_V57QnT1OpS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_08,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 clxscore=1011 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302200106
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/19/2023 10:23 AM, Bjorn Andersson wrote:
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
>
>    Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
>
> are available in the Git repository at:
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-6.3
>
> for you to fetch changes up to 7935b534d32a1823a7d5db449d340f56c201f284:
>
>    dt-bindings: clock: Merge qcom,gpucc-sm8350 into qcom,gpucc.yaml (2023-02-08 19:29:25 -0800)
>
> ----------------------------------------------------------------
> Qualcomm clock driver updates for v6.3
>
> Support for requesting the next power_off operation for a genpd to be
> synchronous is introduced, and implemented in the GDSC driver. To allow
> the GPU driver to request power_off to wait for the GDSC to actually
> collapse.
>
> clk_disable_unused() is altered, to not consider clocks which comes from
> a provider with sync_state defined. This makes it possible for
> individual clock drivers to invoke this process once all clients has
> been probed, avoiding the need for booting many systems with
> clk_ignore_unused.
> This is then enabled for SDM845 and SC8280XP clock controllers.
>
> Support for QDU1000/QRU1000 Global clock controller, SA8775P Global
> clock controller, SM8550 TCSR and display clock controller, SM6350 clock
> controller, nd MSM8996 CBF and APCS clock controllers is introduced..
>
> Parent references are updated across a large number of clock drivers, to
> align with the design changes since those drivers where introduced.
> Similarly, test clocks has been dropped from a range of drivers.
>
> A range of fixes for the MSM8996 CPU clock controller is introduced.
>
> MSM8974 GCC is transitioned off the externally defined sleep_clk.
>
> GDSC in the global clock controller for QCS404 is added, and various
> parent definitions are cleaned up.
>
> The SDCC core clocks on SM6115 are moved for floor_ops.
>
> Programming of clk_dis_wait for GPU CX GDSC on SC7180 and SDM845 are
> moved to use the recently introduced properties in the GDSC struct.
>
> The RPMh clock driver gains SM8550 and SA8775P clocks, and the IPA clock
> is added on a variety of platforms.
>
> The SMD RPM driver receives a big cleanup, in particular a move away
> from duplicating declaration of identical clocks between multiple
> platforms.
> A few missing clocks across msm8998, msm8992, msm8916, qcs404 are added
> as well.
>
> Using devm_pm_runtime_enable() to clean up some duplication is done
> across SM8250 display and video clock controllers, SM8450 display clock
> controller and SC7280 LPASS clock controller.
>
> Devicetree binding changes for above mentioned additions and changes are
> introduced.
>
> Lastly, a change to pad a few registers in the SM8250 DTS to 8 digits
> was picked up in the wrong tree and kept here, to avoid rebasing.
>
> ----------------------------------------------------------------

<snip>

Bjorn,


I don't see the change got picked up v6.3 
https://lore.kernel.org/linux-arm-msm/20230120082631.22053-1-quic_kathirav@quicinc.com/. 
Please help to understand what is missing to get it picked up?


Thanks,


