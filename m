Return-Path: <linux-arm-msm+bounces-40181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5CF9E35C1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 09:45:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF2802815FB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 08:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF268194C77;
	Wed,  4 Dec 2024 08:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dcJ3GlD9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD69F187553;
	Wed,  4 Dec 2024 08:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733301936; cv=none; b=uk/2kUOhofoLHWrCu0Qd1JGnY7TM3lbnnNWa27sX7WFW2LSrRWYpDOxZtdcxyA3rwz6ghnf9qT0KJDqiDdZziASupC7kPEVEM8n6og2x+VkbacelGQSWw8PoyS4yvF3E90zG9NP2X5/xuTGSkwzta2E/oso+Lp8z43vHDFR4kDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733301936; c=relaxed/simple;
	bh=H5Pdte9yCep1RuuYv+mgFrE6RddrgYB3DpbdUfVBB1s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Bb1YifVPBQu9KlCKk4umEkCyhaLhAH2cNAhIiDbzBWmlk56KwTCPqsVLAnsJp+D90qRML379/Si0CDwlYQ0XeuWEKTxphcALwDgvSoH9oimyypQruE5EC8Bl+lFePkQLfwzK11OK/gb33T58XzGFMUGvJkWGgMbQhDQ7Kfr2xQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dcJ3GlD9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B47Uru6024918;
	Wed, 4 Dec 2024 08:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1U1UA+Kq4bZJj97Vu0Z6azZESzoABDxU4CYc2edLMsE=; b=dcJ3GlD9juFstqsh
	HiiETuX0bYaiR4KQdRgRG3NYaWRBVycMjWY//MsEI8sJBIzuSIHwZBtUMKZpdNuw
	bqeGALP7UG8NumCmpzLp/ho9Tt5xJ0bXrrOgGYlFRJbaDD6pwW+PXfBpTy7UkNFm
	SOpkLDv6IhCScoF+T0G3fPZ30cD5Y7wKVcORvRnmqYdtGSA3WSltjUG/8kx4wcXG
	yi6Inz1IxryhGkPpr+5iqSaFob2MjvThB8b1+Igtgi5Rt5trXT/a/wHh+V8qppCk
	HNu3Aga1t9tkx6i5GPEghm6Bg4qi50392j4QXzocV+Ul2h33JWC68qGvmcVpXb5o
	fFfNsQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439vnyumhr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 08:45:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B48jGEW030356
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 08:45:16 GMT
Received: from [10.217.216.47] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Dec 2024
 00:45:12 -0800
Message-ID: <e88a1685-5aa3-497a-84a0-18065f1bf6a4@quicinc.com>
Date: Wed, 4 Dec 2024 14:15:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sa8775p: Add CPU OPP tables to
 scale DDR/L3
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Brian Masney
	<bmasney@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        "Imran
 Shaik" <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya Kakitapalli" <quic_skakitap@quicinc.com>,
        Shivnandan Kumar
	<quic_kshivnan@quicinc.com>
References: <20241017-sa8775p-cpufreq-l3-ddr-scaling-v1-0-074e0fb80b33@quicinc.com>
 <20241017-sa8775p-cpufreq-l3-ddr-scaling-v1-2-074e0fb80b33@quicinc.com>
 <ZxEwVShJuMH4J1Hp@x1> <9179759d-7af1-409f-8130-1136c9ae4ecd@quicinc.com>
 <daqa3krsp6emdha6h7tlcelsggb6qeilnojgtfxjbp5zw4n6ow@xzwdmu55ygjf>
 <5c3d91e3-e9d3-4e8d-bd4f-f7cbe765dddc@oss.qualcomm.com>
 <d78e6fc9-2238-4f55-a604-f60df8565166@quicinc.com>
 <fhueah2gfi7fartnitasetvxiax3vgpgnbjis6ydjt523cnksk@vs4jmmtxk5jw>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <fhueah2gfi7fartnitasetvxiax3vgpgnbjis6ydjt523cnksk@vs4jmmtxk5jw>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ib6fPkQkCk_WNrkyJD978-R3C9wdMYuV
X-Proofpoint-GUID: ib6fPkQkCk_WNrkyJD978-R3C9wdMYuV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 mlxlogscore=919 bulkscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412040067



On 12/4/2024 8:43 AM, Dmitry Baryshkov wrote:
> On Tue, Dec 03, 2024 at 08:33:46PM +0530, Jagadeesh Kona wrote:
>>
>>
>> On 11/30/2024 8:02 PM, Konrad Dybcio wrote:
>>> On 14.11.2024 11:48 PM, Dmitry Baryshkov wrote:
>>>> On Mon, Nov 11, 2024 at 06:39:48PM +0530, Jagadeesh Kona wrote:
>>>>>
>>>>>
>>>>> On 10/17/2024 9:12 PM, Brian Masney wrote:
>>>>>> On Thu, Oct 17, 2024 at 02:58:31PM +0530, Jagadeesh Kona wrote:
>>>>>>> +	cpu0_opp_table: opp-table-cpu0 {
>>>>>>> +		compatible = "operating-points-v2";
>>>>>>> +		opp-shared;
>>>>>>> +
>>>>>>> +		cpu0_opp_1267mhz: opp-1267200000 {
>>>>>>> +			opp-hz = /bits/ 64 <1267200000>;
>>>>>>> +			opp-peak-kBps = <6220800 29491200>;
>>>>>>> +		};
>>>>>>> +
>>>>>>> +		cpu0_opp_1363mhz: opp-1363200000 {
>>>>>>> +			opp-hz = /bits/ 64 <1363200000>;
>>>>>>> +			opp-peak-kBps = <6220800 29491200>;
>>>>>>> +		};
>>>>>>
>>>>>> [snip]
>>>>>>
>>>>>>> +	cpu4_opp_table: opp-table-cpu4 {
>>>>>>> +		compatible = "operating-points-v2";
>>>>>>> +		opp-shared;
>>>>>>> +
>>>>>>> +		cpu4_opp_1267mhz: opp-1267200000 {
>>>>>>> +			opp-hz = /bits/ 64 <1267200000>;
>>>>>>> +			opp-peak-kBps = <6220800 29491200>;
>>>>>>> +		};
>>>>>>> +
>>>>>>> +		cpu4_opp_1363mhz: opp-1363200000 {
>>>>>>> +			opp-hz = /bits/ 64 <1363200000>;
>>>>>>> +			opp-peak-kBps = <6220800 29491200>;
>>>>>>> +		};
>>>>>>
>>>>>> There's no functional differences in the cpu0 and cpu4 opp tables. Can
>>>>>> a single table be used?
>>>>>>
>>>>>> This aligns with my recollection that this particular SoC only has the
>>>>>> gold cores.
>>>>>>
>>>>>> Brian
>>>>>>
>>>>>
>>>>> Thanks Brian for your review. Sorry for the delayed response.
>>>>>
>>>>> We require separate OPP tables for CPU0 and CPU4 to allow independent
>>>>> scaling of DDR and L3 frequencies for each CPU domain, with the final
>>>>> DDR and L3 frequencies being an aggregate of both.
>>>>>
>>>>> If we use a single OPP table for both CPU domains, then _allocate_opp_table() [1]
>>>>> won't be invoked for CPU4. As a result both CPU devices will end up in sharing
>>>>> the same ICC path handle, which could lead to one CPU device overwriting the bandwidth
>>>>> votes of other.
>>>
>>> Oh that's a fun find.. clocks get the same treatment.. very bad,
>>> but may explain some schroedingerbugs.
>>>
>>> Taking a peek at some code paths, wouldn't dropping opp-shared
>>> solve our issues? dev_pm_opp_set_sharing_cpus() overrides it
>>>
>>> Konrad
>>
>> Thanks Konrad for your review.
>>
>> Yes, correct. I tried dropping opp-shared but it is again getting set due to
>> dev_pm_opp_set_sharing_cpus().
> 
> It should be set, but then it should get the limited CPU mask rather
> than the full CPU set. Isn't that enough for your case?
> 

Even if we call dev_pm_opp_set_sharing_cpus() with the limited CPU mask, it adds
OPP_TABLE_ACCESS_SHARED flag to the OPP table. Due to this flag being set, if this
same opp table is used for another CPU domain(CPU4-7) also in DT, then _managed_opp[1]
which gets called inside from dev_pm_opp_of_add_table() for CPU4 will return the same
CPU0 OPP table. 

Due to above, _allocate_opp_table() [2] won't be invoked for CPU4 but instead CPU4 will be
added as device under the CPU0 OPP table [3]. Due to this, dev_pm_opp_of_find_icc_paths() [4]
won't be invoked for CPU4 device and hence CPU4 won't be able to independently scale it's
interconnects. Both CPU0 and CPU4 devices will scale the same ICC path which can lead to one
device overwriting the BW vote placed by other device. So we need two separate OPP tables for
both domains.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/opp/core.c#n1600
[2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/opp/core.c#n1613
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/opp/core.c#n1606
[4] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/opp/core.c#n1484

Thanks,
Jagadeesh

