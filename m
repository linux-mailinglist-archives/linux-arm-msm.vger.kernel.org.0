Return-Path: <linux-arm-msm+bounces-57662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A34C0AB4B8B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 07:59:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B78F16718E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 05:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 657661E521F;
	Tue, 13 May 2025 05:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="N74Jmfn3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD191F5E6;
	Tue, 13 May 2025 05:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747115946; cv=none; b=geCbF9rks1NeYkyv20YIAedqA4OHWg7MCWpoq1cKqaDEsO14v+qOrHYjn5RbzfqjKxC0mfy9c/S4AI2uh9Ph+PJrJ21/qm8zcNbhQzFZz0Ql2grLA4HYIL1UJBs7r6b8QXbK05B01J0VXHOeaAn8WfBFSjWvdDwDPhjFa2wZZTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747115946; c=relaxed/simple;
	bh=TVLwvym3/aeVn56CFigfV5fSvkWJ7gX8ZKNcs9D7kS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fumbzA6ISUg7MAnRGjw91Qdah3cM4xrxnwFkG5OS0Noy1W6NGZhV2Lp5+l61bK48j3nCZovzJQYXA8z3mOXfcD2Is+Jt1wOxBkNSjidyTSYpEUgSo/s6FrlVT9txBqtL9r4l3DDrOCo7P/1LLncvEAOair2whF8wd8/QvkBvK3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=N74Jmfn3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CJjj3i015336;
	Tue, 13 May 2025 05:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PzWx5mdJE8aGGqbeuU1GMbdJ+i1PkQW3UbKqRtbnCL4=; b=N74Jmfn3wvRWHS32
	Jf7wF+OewiI3sJW6lxAd3hBSB8lxol4OPsvo1CGx1bcBvl6vK8M3SY3uhQ7ucQvS
	IOJtUDhU30L01V27ahjN/Ip9YcyqSkgHAOxgru1hLWzWGY2CFFzHMqpkMdkkFzyV
	QztFZEU8uLI1hEgTNdaH100+H7jTAQo8lw5deOFlSZkVolHAtK5Rv7VoAJZzgomR
	tDBgNeM7sXBohxkVqz5czC6GO7fY9jdrbh1YsWOz04qSXqFZamvhv+1QX20tOwak
	B5HoUirTkmI6ppR8uUHTXTa4H9uV+ph4mz97QfesCU5/au1WA6qNMGVkKEgoNuth
	yZOQ1A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hwt96m9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 05:58:59 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54D5wwRw014882
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 05:58:58 GMT
Received: from [10.204.65.175] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 12 May
 2025 22:58:53 -0700
Message-ID: <a21be690-4ff3-4b4a-84ec-f1da4a7b577d@quicinc.com>
Date: Tue, 13 May 2025 11:28:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add adsp fastrpc support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ekansh Gupta
	<ekansh.gupta@oss.qualcomm.com>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Alexey Klimov
	<alexey.klimov@linaro.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <srini@kernel.org>, <krzysztof.kozlowski@linaro.org>,
        "Bharath Kumar (QUIC)"
	<quic_bkumar@quicinc.com>,
        "Chenna Kesava Raju (QUIC)"
	<quic_chennak@quicinc.com>
References: <20250502011539.739937-1-alexey.klimov@linaro.org>
 <10f69da3-6f94-4249-a8f3-459dc48fa5e1@oss.qualcomm.com>
 <D9R4NCKH46WP.14C8F7W4M58ZQ@linaro.org>
 <3c0fea8d-0715-40e6-bed9-e0961bf034e0@oss.qualcomm.com>
 <bb68da04-ef52-4172-8b6e-f4027bcc2786@oss.qualcomm.com>
 <pzlsbznxpfsbdsxlzvcbdy7wwba4z5hoya7fyoacwjadtpl7y4@qajecdvs3bho>
 <effea02f-6ffb-42e9-87df-081caafab728@oss.qualcomm.com>
 <ziko5cxt2cabyu4aimpqhbzcacudfhf3jtp23psobxtjdgi5vg@xcfeush5xlhm>
Content-Language: en-US
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <ziko5cxt2cabyu4aimpqhbzcacudfhf3jtp23psobxtjdgi5vg@xcfeush5xlhm>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDA1NCBTYWx0ZWRfX5rf4kle4AVtz
 W7WShxHc7pPzPYcTCRklUUDOFfoXPOkgkxf5H08a+Pjx4K36cX4mATAq/X3+LMNwqeg85YdrRYp
 3ziUbbD7xRZ68nM4qQegXDGDdaJHX9b31u58b0jHo/g+hS0cTRleq5sFFmgx+sH1qaZgwA0Lf9R
 l5FNTIjrqbCtQo1DAr7U01BBjVWOeT3XsUG5etf72h5zgEkB5pYh/qh8eVPTI9X9lnLkkF1kKAg
 y3Oo4Hy92ehjBKdAUQ0uRqZMv55PlO5JtOHiGER7udNmi41txzH9V9PL+HRsuQ6GLjTCH8wenDw
 RUbV5VxcAMGlCTht1n7Zl5YOLTTY2g/L4bFx4G0xVIlaaSfwrtFRKJQI66vIbnFHi+GpgYB2RaD
 tzk4tRmJuGUU0DkNj5fmWWyDslIwkdibWAgEthPo9UzikGt4a1WhYpyGdEOaiL+FJ0sAF/qU
X-Proofpoint-ORIG-GUID: 8wJJCaZjow0aV2xi5Gxm73KsZCA_2ywt
X-Proofpoint-GUID: 8wJJCaZjow0aV2xi5Gxm73KsZCA_2ywt
X-Authority-Analysis: v=2.4 cv=a58w9VSF c=1 sm=1 tr=0 ts=6822dfa3 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=HFRqob4Jp56kE4hCLf0A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1011 impostorscore=0 mlxscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505130054



On 5/12/2025 9:25 PM, Dmitry Baryshkov wrote:
> On Mon, May 12, 2025 at 09:25:13AM +0530, Ekansh Gupta wrote:
>>
>> On 5/10/2025 1:19 AM, Dmitry Baryshkov wrote:
>>> On Fri, May 09, 2025 at 09:12:30AM +0530, Ekansh Gupta wrote:
>>>> On 5/9/2025 4:27 AM, Konrad Dybcio wrote:
>>>>> On 5/9/25 12:20 AM, Alexey Klimov wrote:
>>>>>> On Fri May 2, 2025 at 10:38 AM BST, Konrad Dybcio wrote:
>>>>>>> On 5/2/25 3:15 AM, Alexey Klimov wrote:
>>>>>>>> While at this, also add required memory region for fastrpc.
>>>>>>>>
>>>>>>>> Tested on sm8750-mtp device with adsprpdcd.
>>>>>>>>
>>>>>>>> Cc: Ekansh Gupta <quic_ekangupt@quicinc.com>
>>>>>>>> Cc: Srinivas Kandagatla <srini@kernel.org>
>>>>>>>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>>>>>> ---
>>>>>>>>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 70 ++++++++++++++++++++++++++++
>>>>>>>>  1 file changed, 70 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>>>>>>> index 149d2ed17641..48ee66125a89 100644
>>>>>>>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>>>>>>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>>>>>>> @@ -7,6 +7,7 @@
>>>>>>>>  #include <dt-bindings/clock/qcom,sm8750-gcc.h>
>>>>>>>>  #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
>>>>>>>>  #include <dt-bindings/dma/qcom-gpi.h>
>>>>>>>> +#include <dt-bindings/firmware/qcom,scm.h>
>>>>>>>>  #include <dt-bindings/interconnect/qcom,icc.h>
>>>>>>>>  #include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
>>>>>>>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>>>>> @@ -523,6 +524,14 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
>>>>>>>>  			reg = <0x0 0xff800000 0x0 0x800000>;
>>>>>>>>  			no-map;
>>>>>>>>  		};
>>>>>>>> +
>>>>>>>> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
>>>>>>>> +			compatible = "shared-dma-pool";
>>>>>>>> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
>>>>>>>> +			alignment = <0x0 0x400000>;
>>>>>>>> +			size = <0x0 0xc00000>;
>>>>>>>> +			reusable;
>>>>>>>> +		};
>>>>>>>>  	};
>>>>>>>>  
>>>>>>>>  	smp2p-adsp {
>>>>>>>> @@ -2237,6 +2246,67 @@ q6prmcc: clock-controller {
>>>>>>>>  						};
>>>>>>>>  					};
>>>>>>>>  				};
>>>>>>>> +
>>>>>>>> +				fastrpc {
>>>>>>>> +					compatible = "qcom,fastrpc";
>>>>>>>> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
>>>>>>>> +					label = "adsp";
>>>>>>>> +					memory-region = <&adsp_rpc_remote_heap_mem>;
>>>>>>> IIUC the driver only considers this on the sensor DSP
>>>>>> Memory region is required for audio protection domain + adsprpdcd as far as I know.
>>>>> next-20250508
>>>>>
>>>>> rmem_node = of_parse_phandle(rdev->of_node, "memory-region", 0);
>>>>> if (domain_id == SDSP_DOMAIN_ID && rmem_node) {
>>>>> 	// ...
>>>>> }
>>>>>
>>>>> maybe some driver changes are still pending?
>>>> Would like to add some more details here:
>>>>
>>>> Memory region is required for audio PD for dynamic loading and remote heap memory
>>>> requirements. Some initial memory(~2MB) is allocated initially when audio daemon
>>>> is getting attached[1] and this memory is added to audio PD memory pool.
>>> How is being handled for the audio PD case? Could you please point it
>>> out in? Currently, as Konrad pointed out, it is only being used for
>>> Sensors domain (unless I miss some obvious usage handled by the core).
>> The reserved-memory support was actually first added for audio PD only[1].
> Okay, so it uses an API which I missed, excuse me. But then... How does
> it work? of_reserved_mem_device_init_by_idx() requires
> rmem->ops->device_init() to be present, which is not set for a
> reserved-memory nodes without a compat string. However on all two and a
> half platforms where I see the ADSP remote heap, it is declared without
> extra compat.

Yes, of_reserved_mem_device_init_by_idx() will fail if the compat
string is not included in the reserved-memory nodes. To understand
this better, I tested the reserved-memory both with and without the
compat string. Despite this, I did not observe any allocation
failures in either case. The only difference was the appearance of
the log message "no reserved DMA memory for FASTRPC" when the compat
string was not added, although the allocation was still successful.
The correct approach is to include the compat string, and it's
unclear why it was omitted for existing platforms.

//Ekansh

>
>> The usage of reserved-memory is audio PD:
>>
>> This memory is used by audio PD for it's dynamic loading and remote heap
>> requirements as I had mentioned earlier. I'll give more details here:
>> When audio PD starts, it expects some initial memory for it's dynamic
>> loading and other allocation requirements. To fulfill this, the audio
>> daemon allocates[2] some initial memory(~2MB) and moves the ownership to
>> the audio specific VMIDs that are configured in DT[3]. Audio PD then uses
>> this memory for it's initial operations. If there is any more memory
>> needed, audio PD makes a request to allocate memory from HLOS which is
>> again allocated from the same region[4] and then the ownership is moved
>> to the configured VMIDs[5].
>>
>> The sensors domain that you are pointing was an extension of this and as
>> pointed earlier, it was added to support SDSP use cases on some old platform
>> where there are no dedicated SDSP context banks.
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/misc/fastrpc.c?id=1ce91d45ba77a4f6bf9209d142d5c89c42cf877a
>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1274
>> [3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/sa8775p.dtsi#n5334
>> [4] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1884
>> [5] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1927
>>
>> //Ekansh
>>
>>>> Additionally, if there is some additional memory requirement from audio PD, the
>>>> PD can request for more memory using remote heap request[2]
>>>>
>>>> The support for SDSP was added sometime back[3] to support SDSP usecases on some old
>>>> platform as there were no dedicated context banks for SDSP there. On recent platforms,
>>>> context banks are available wherever SDSP is supported. 
>>>>
>>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1273
>>>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1884
>>>> [3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/misc/fastrpc.c?id=c3c0363bc72d4d0907a6d446d7424b3f022ce82a
>>>>
>>>> //Ekansh
>>>>
>>>>> Konrad
>>>>>


