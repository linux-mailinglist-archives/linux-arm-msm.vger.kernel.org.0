Return-Path: <linux-arm-msm+bounces-2700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D40B7FEDBC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 12:24:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0931C281B9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 11:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83DC63C483;
	Thu, 30 Nov 2023 11:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q5/vXlP+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FC1810D4;
	Thu, 30 Nov 2023 03:24:31 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AUAGqoX030099;
	Thu, 30 Nov 2023 11:24:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Pb/ULEA6EZts/A7bgZSpJRDWdXNI8NoXl9I0WNYwpwY=;
 b=Q5/vXlP+BnOB7NSQeHAn21+l/IivpMZ69ijElAXRkQ92Zw/ofzL7numdhIp7XIVN1lIg
 tyWiFp6Mq8G8BeK06aAieMxmHiYskvyrRNDzWl6qUsW4bAhMjB2e6t/XfCh7FwSpkL1d
 bEwo9g4vt338rI8q/yzM4q1DHtmvXZQ+ZuFxWgLuwWEzDZRSJrkbdVk0XbPc3A2QRi42
 S2TWtlCH4VXN/T/zbtJGy0YOpacj2HM12RnnTk5Qg4PnCMlIxsxH/mSacd8iDoimXdaO
 hS6uPYDyS6Z1/J4MLAr2qS24tjLRTlzGXjet5lolQsW5f5m8ljlcAGs1jIeUGldL+RNR hg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3up2byumu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 11:24:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AUBO4rc019029
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 11:24:04 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 30 Nov
 2023 03:23:57 -0800
Message-ID: <9272429a-42f8-8af5-8b70-c0c785c001fd@quicinc.com>
Date: Thu, 30 Nov 2023 16:53:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V2 3/5] arm64: dts: qcom: Add base X1E80100 dtsi and the
 QCP dts
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, <andersson@kernel.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <catalin.marinas@arm.com>, <ulf.hansson@linaro.org>
CC: <agross@kernel.org>, <conor+dt@kernel.org>, <ayan.kumar.halder@amd.com>,
        <j@jannau.net>, <dmitry.baryshkov@linaro.org>,
        <nfraprado@collabora.com>, <m.szyprowski@samsung.com>,
        <u-kumar1@ti.com>, <peng.fan@nxp.com>, <lpieralisi@kernel.org>,
        <quic_rjendra@quicinc.com>, <abel.vesa@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_tsoni@quicinc.com>, <neil.armstrong@linaro.org>
References: <20231117113931.26660-1-quic_sibis@quicinc.com>
 <20231117113931.26660-4-quic_sibis@quicinc.com>
 <918ff1f5-ce01-43ea-b034-e69fbb31f495@linaro.org>
 <3dd41426-c026-a832-0a6b-0aabfaec2a8c@quicinc.com>
 <c6e05a10-88cc-409c-afc0-37166b763eaa@linaro.org>
 <8021a6f5-6316-031d-8181-e0e2047e2fa8@quicinc.com>
 <5ffa4cbf-c30f-4169-ad75-38cd3e8d11c2@linaro.org>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <5ffa4cbf-c30f-4169-ad75-38cd3e8d11c2@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7TCNuBAt3U1hp4nhwT4p9S0anx5UnRGI
X-Proofpoint-ORIG-GUID: 7TCNuBAt3U1hp4nhwT4p9S0anx5UnRGI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-30_09,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311300084



On 11/30/23 03:59, Konrad Dybcio wrote:
> On 29.11.2023 16:46, Sibi Sankar wrote:
>>
>>
>> On 11/29/23 18:24, Konrad Dybcio wrote:
>>> On 29.11.2023 10:25, Sibi Sankar wrote:
>>>>
>>>>
>>>> On 11/18/23 06:36, Konrad Dybcio wrote:
>>>>> On 17.11.2023 12:39, Sibi Sankar wrote:
>>>>>> From: Rajendra Nayak <quic_rjendra@quicinc.com>
>>>>>>
>>>>>> Add base dtsi and QCP board (Qualcomm Compute Platform) dts file for
>>>>>> X1E80100 SoC, describing the CPUs, GCC and RPMHCC clock controllers,
>>>>>> geni UART, interrupt controller, TLMM, reserved memory, interconnects,
>>>>>> SMMU and LLCC nodes.
>>>>>>
>>>>>> Co-developed-by: Abel Vesa <abel.vesa@linaro.org>
>>>>>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>>>>>> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
>>>>>> Co-developed-by: Sibi Sankar <quic_sibis@quicinc.com>
>>>>>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
>>>>>> ---
>>> [...]
>>>
>>>
>>>>>> +        idle-states {
>>>>>> +            entry-method = "psci";
>>>>>> +
>>>>>> +            CLUSTER_C4: cpu-sleep-0 {
>>>>>> +                compatible = "arm,idle-state";
>>>>>> +                idle-state-name = "ret";
>>>>>> +                arm,psci-suspend-param = <0x00000004>;
>>>>> These suspend parameters look funky.. is this just a PSCI sleep
>>>>> implementation that strays far away from Arm's suggested guidelines?
>>>>
>>>> not really! it's just that 30th bit is set according to spec i.e
>>>> it's marked as a retention state.
>>> So, is there no state where the cores actually power down? Or is it
>>> not described yet?
>>>
>>> FWIW by "power down" I mean it in the sense that Arm DEN0022D does,
>>> so "In this state the core is powered off. Software on the device
>>> needs to save all core state, so that it can be preserved over
>>> the powerdown."
>>
>> I was told we mark it explicitly as retention because hw is expected
>> to handle powerdown and we don't want sw to also do the same.
>>
>>>
>>>>
>>>>>
>>>>> [...]
>>>>>
>>>>>
>>>>>> +        CPU_PD11: power-domain-cpu11 {
>>>>>> +            #power-domain-cells = <0>;
>>>>>> +            power-domains = <&CLUSTER_PD>;
>>>>>> +        };
>>>>>> +
>>>>>> +        CLUSTER_PD: power-domain-cpu-cluster {
>>>>>> +            #power-domain-cells = <0>;
>>>>>> +            domain-idle-states = <&CLUSTER_CL4>, <&CLUSTER_CL5>;
>>>>>> +        };
>>>>> So, can the 3 clusters not shut down their L2 and PLLs (if separate?)
>>>>> on their own?
>>>>
>>>> on CL5 the clusters are expected to shutdown their l2 and PLL on their
>>>> own.
>>> Then I think this won't happen with this description
>>>
>>> every cpu has a genpd tree like this:
>>>
>>> cpu_n
>>>    |_CPU_PDn
>>>       |_CLUSTER_PD
>>>
>>> and CLUSTER_PD has two idle states: CLUSTER_CL4 and CLUSTER_CL5
>>>
>>> which IIUC means that neither cluster idle state will be reached
>>> unless all children of CLUSTER_PD (so, all CPUs) go down that low
>>>
>>> This is "fine" on e.g. sc8280 where both CPU clusters are part of
>>> the same Arm DynamIQ cluster (which is considered one cluster as
>>> far as MPIDR_EL1 goes) (though perhaps that's misleading and with
>>> the qcom plumbing they perhaps could actually be collapsed separately)
>>
>> We did verify that the sleep stats increase independently for each
>> cluster, so it's behavior is unlike what you explained above. I'll
>> re-spin this series again in the meantime and you can take another
>> stab at it there.
> So are you saying that you checked the RPMh sleep stats and each cluster
> managed to sleep on its own, or did you do something different?

We had used some jtag scripts but what you said is correct, there
definitely needs to be separate cluster_pd defined for each cluster.
Will fix this in the next re-spin.

-Sibi

> 
> Were the sleep durations far apart? What's the order of magnitude of that
> difference? Are the values reported in RPMh greater than those in
> /sys/kernel/debug/pm_genpd/power-domain-cpu-cluster/total_idle_time?
> 
> Is there any other (i.e. non-Linux) source of "go to sleep" votes?
> 
> Konrad

