Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC372750945
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jul 2023 15:11:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233222AbjGLNLD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jul 2023 09:11:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbjGLNLD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jul 2023 09:11:03 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D624D12F;
        Wed, 12 Jul 2023 06:11:01 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36CAeWYV010769;
        Wed, 12 Jul 2023 13:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ZOAEa226UHgucF1PyBKdNu4nV5PA77hJx4XBvTo02ss=;
 b=TWtq2v9EcOAEMG8WRlN9JBbbzFkqjYa/u5M0FplyDnq0mcD7vTgck4lROFxCo48VfNx2
 Y0LBOhegHSFWwzliMvZKAJtred6v7pVB+Zvp64Sa1Qfb2MukctgwDwk6fTRgN3JSj4Hn
 AJLuHmsagTy+LGNs1dsXbwHUmQgyECukiVwsW2t1egxcACST72t/JbI5r5oGGcK2mRLe
 bVMasfBE1Us05X9HRIxPV1rU41Dnj55r7YHyfx37zch4le3FCOpIjliQlCPVJa5dicST
 BmhbBvcbWx0dcU2rC7DtrilpbLqBvG/5jeEdC6daWDEq5DKuDfCLqlfinboAdCLQiDHe +Q== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rsfeq1gya-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 12 Jul 2023 13:10:32 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36CDAVHg029228
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 12 Jul 2023 13:10:31 GMT
Received: from [10.217.217.202] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 12 Jul
 2023 06:10:26 -0700
Message-ID: <d9e4aee1-8cd7-d966-3888-45a808703141@quicinc.com>
Date:   Wed, 12 Jul 2023 18:40:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/3] arm64: dts: qcom: sa8775p: Add interconnect to SMMU
To:     Robin Murphy <robin.murphy@arm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC:     Parikshit Pareek <quic_ppareek@quicinc.com>,
        Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Andy Gross" <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Manivannan Sadhasivam" <mani@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Adam Skladowski <a39.skl@gmail.com>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
        <devicetree@vger.kernel.org>,
        "linux-kernel @ vger . kernel . org Prasanna Kumar" 
        <quic_kprasan@quicinc.com>
References: <20230609054141.18938-1-quic_ppareek@quicinc.com>
 <79206b05-674b-1f6c-6eb1-ed45e6bd5637@linaro.org>
 <20230609125631.GA29252@hu-ppareek-blr.qualcomm.com>
 <2881f374-70e2-0057-f43e-7be12d32ae22@arm.com>
 <c3c12574-fc38-84ae-2a94-3c80fb9fb363@linaro.org>
 <CAA8EJprqfq0ey2hgBXxf9Zg1Y_MwHP_73EQkwg-W-sRYS7VE8w@mail.gmail.com>
 <78995241-826f-bf42-9d4b-9ab7c9c9bf7d@arm.com>
Content-Language: en-US
From:   Shazad Hussain <quic_shazhuss@quicinc.com>
In-Reply-To: <78995241-826f-bf42-9d4b-9ab7c9c9bf7d@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UuRwjnBXZ501cRFdK5MRVb6Kd2Is3AA4
X-Proofpoint-GUID: UuRwjnBXZ501cRFdK5MRVb6Kd2Is3AA4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-12_08,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1011
 priorityscore=1501 mlxlogscore=498 suspectscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307120118
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 6/9/2023 9:09 PM, Robin Murphy wrote:
> On 2023-06-09 15:56, Dmitry Baryshkov wrote:
>> On Fri, 9 Jun 2023 at 17:52, Konrad Dybcio <konrad.dybcio@linaro.org> 
>> wrote:
>>>
>>>
>>>
>>> On 9.06.2023 16:45, Robin Murphy wrote:
>>>> On 2023-06-09 13:56, Parikshit Pareek wrote:
>>>>> On Fri, Jun 09, 2023 at 10:52:26AM +0200, Konrad Dybcio wrote:
>>>>>>
>>>>>>
>>>>>> On 9.06.2023 07:41, Parikshit Pareek wrote:
>>>>>>> Some qcom SoCs have SMMUs, which need the interconnect bandwidth 
>>>>>>> to be
>>>>>>> This series introduce the due support for associated 
>>>>>>> interconnect, and
>>>>>>> setting of the due interconnect-bandwidth. Setting due interconnect
>>>>>>> bandwidth is needed to avoid the issues like [1], caused by not 
>>>>>>> having
>>>>>>> due clock votes(indirectly dependent upon interconnect bandwidth).
>>>>>>
>>>>>> [1] ???
>>>>>
>>>>> My bad. Intended to mention following:
>>>>> https://lore.kernel.org/linux-arm-msm/20230418165224.vmok75fwcjqdxspe@echanude/
>>>>
>>>> This sounds super-dodgy - do you really have to rely on 
>>>> configuration of the interconnect path from the SMMU's pagetable 
>>>> walker to RAM to keep a completely different interconnect path 
>>>> clocked for the CPU to access SMMU registers? You can't just request 
>>>> the programming interface clock directly like on other SoCs?
>>> On Qualcomm platforms, particularly so with the more recent ones, some
>>> clocks are managed by various remote cores. Half of what the 
>>> interconnect
>>> infra does on these SoCs is telling one such core to change the 
>>> internally
>>> managed clock's rate based on the requested bw.
>>
>> But enabling PCIe interconnect to keep SMMU working sounds strange to
>> me too. Does the fault come from some outstanding PCIe transaction?
> 
> The "Injecting instruction/data abort to VM 3" message from the 
> hypervisor implies that it is the access to SMMU_CR0 from 
> arm_smmu_shutdown() that's blown up. I can even believe that the SMMU 
> shares some clocks with the PCIe interconnect, given that its TBU must 
> be *in* that path from PCIe to memory, at least. However I would 
> instinctively expect the abstraction layers above to have some notion of 
> distinct votes for "CPU wants to access SMMU" vs. "SMMU/PCIe wants to 
> access RAM", given that the latter is liable to need to enable more than 
> the former if the clock/power gating is as fine-grained as previous SoCs 
> seem to have been. But maybe my hunch is wrong and this time 
> everything's just in one big clock domain. I don't know. I'm just here 
> to ask questions to establish whether this really is the most correct 
> abstraction or just a lazy bodge to avoid doing the proper thing in some 
> other driver.
> 
> Thanks,
> Robin.

For this platform to access the SMMU_CR0 we need to have pcie_tcu_clk
enabled and in order to do so we have to have interconnect vote from
MASTER_PCIE_[0/1] -> SLAVE_ANOC_PCIE_GEM_NOC so that AOP/RPMH can enable
aggre_noc_pcie_sf_clk_src which in turns enables bulk of clocks of which
pcie_tcu_clk is one.

    ---
   |RAM|
  ------------       -----      -----------       ----------
| GEMNOC     |<----| TBU |----| PCIE ANOC |<----| pcie_0/1 |
  ------------       -----      -----------       ----------
    ^      ^           ^
    |      |           |
    |      v           v
   ---   -----------------
  |CPU| |PCIE TCU (smmuv2)|
   ---   -----------------

I think this should be the right driver to implement this to have a sync
with vote/unvote of the clock while the smmu register is being accessed
in arm_smmu_shutdown() right !

-Shazad
