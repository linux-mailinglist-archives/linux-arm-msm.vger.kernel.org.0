Return-Path: <linux-arm-msm+bounces-59035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2898AC0A08
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 12:44:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FADDA24639
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 10:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FFF32690EA;
	Thu, 22 May 2025 10:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jjip4ktk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C91C1EE00C;
	Thu, 22 May 2025 10:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747910675; cv=none; b=DNYdBxvK7IbvaEnP8GxUnO550BglSnktkHZQmQuPrmfWyyzxxEziWWpf41T0ry+FtBYMEXaZ/+sy7DfzibcJhKeQ2rsL23CYU0RGVbC9u4YlvD1GXnVphyeNzKWGgeIaUp0Yu38KefHIg4/z6MQ+xOz6gJmh7RTj7C4nfmY16Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747910675; c=relaxed/simple;
	bh=/Y3x6ptSx20lO9jh0+MWFLDU6p+gaKgxkl+etxB79bQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DN5GE4cmv9DMNKOxzOnRSjmq+TxdaP3FLbWx5ktmhamS6qd0eB5bXU1Yvk0+Lflewgf/+P8FFG1c/IJDEseurpA7qUIoZuhtYXGhxQ6iLBYrJ7XY+Aqfh342VqoRMtY9ewbCM8Zaoph8RvpfGwIPOFdg+smeA+LhyNM9rbQE+hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jjip4ktk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M9aI13015926;
	Thu, 22 May 2025 10:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eAR1CT9wr6MafI6wMJKRvpOiDFyytLje/RJkJ1oFmjo=; b=jjip4ktkXfgSw2tK
	OsOJ2Zi4Y6DvQ14gYwou00IVNvU1X3zVNbW2q49rSpha5P9nKzSrNkraI6KK5kvU
	MiP0fu5wXzYm7ABs8TpgciQI9sbU1X9URfKhiHwFI8uW0ACYqBARE33F+U5+z31U
	tAIcX/ALJYhvKKiv1z7zdZSKPhD3qUx7RLmYbLd+5GKYNgXZLBCxUtepN34H3afq
	PSyGFZLYBe2d+6Nw+nCaXnE6KCEWwqlN4hTNMBRI9ieXPOg+8GS0SPZiZiy0cn38
	mebwXbz/s61AQqPT1FifO2+Ypx3wJBLqJTWqE5JVBvrLIFcbdhAp8amZ+ASKN8sg
	S8DMtA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfb5x9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 10:44:28 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54MAiQDI032750
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 10:44:26 GMT
Received: from [10.239.29.49] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 22 May
 2025 03:44:23 -0700
Message-ID: <46caa88e-790b-4733-83bc-75ed6c7ca2d8@quicinc.com>
Date: Thu, 22 May 2025 18:44:21 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sc7280: Add memory region for
 audiopd
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <cros-qcom-dts-watchers@chromium.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <ekansh.gupta@oss.qualcomm.com>
References: <20250516110029.1637270-1-quic_lxu5@quicinc.com>
 <20250516110029.1637270-2-quic_lxu5@quicinc.com>
 <uzyxagnmxz5tsjy32mfro2alwdpcq5kybwzcbsysul7u6adgdf@x7katw7eme6u>
 <b90ee18a-5e88-4c36-a623-ae9447c53a46@quicinc.com>
 <2mu3bncxoq57rxi22dyd6ys2wa5n3wmtadfvixozshxgenutai@dlkbqgplzrrd>
Content-Language: en-US
From: Ling Xu <quic_lxu5@quicinc.com>
In-Reply-To: <2mu3bncxoq57rxi22dyd6ys2wa5n3wmtadfvixozshxgenutai@dlkbqgplzrrd>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: d1_RkBx_UiUJd3umIxVXy_GWorPJTKzo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEwOCBTYWx0ZWRfX2p8f8sCABHrj
 w1f/qZNh6xpHU/YkAwDFaMqEM6qjr8lCadtLM4DiGd3dIJHz70OAXllckNO089TnMvgpGsMyVKd
 3h+3xWZTqa3HXk8+ZOr9dYVSa7c+3Prn8bbCWWvMoEd9Sl5uMy8v0Qu1UPPqT9Y82z1Z9CAQUba
 tQ9iYJq1GuU/EZ8c2b6YfS7+vh/ZfI/s0iKxFRQCX3MMfedfjEfgekSzFAVcNzhEoTCSC5SXNyK
 RNFRN3pKA8059qTUYF4WSosmDhXQf17S+XhbqQMiC5INwBynRT08VXENBSTSyRZP6X2el+i66aT
 a8Yg1QkkRxS+q738wU2zbE59uP6Bu4jixyAeuf94IUlFOeFQ+1Jy5+RG/g4ON6q+5lEjqZ7nXEb
 wdOPgnRUFHu9JFP7Ynyu07XvUcP4cl7tHOvXezNFeKkeN3x5lWnvTPMVDmVuwHVL3V8fp4D+
X-Proofpoint-GUID: d1_RkBx_UiUJd3umIxVXy_GWorPJTKzo
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=682f000c cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=QSS2_93WkRAJWUwskz4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_05,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=686 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220108

在 5/20/2025 9:53 PM, Dmitry Baryshkov 写道:
> On Tue, May 20, 2025 at 02:41:22PM +0800, Ling Xu wrote:
>> 在 5/17/2025 5:47 AM, Dmitry Baryshkov 写道:
>>> On Fri, May 16, 2025 at 04:30:27PM +0530, Ling Xu wrote:
>>>> Add reserved memory region and VMIDs for audio PD dynamic loading and
>>>> remote heap memory requirements.
>>>
>>> Why? Was it not working without this heap?
>>
>> yes, it will not working without this heap.
>> Memory region is required for audio PD for dynamic loading and remote heap memory
>> requirements. For more info, please refer below patches, it has provided a more
>> detailed explanation.
>> https://lore.kernel.org/all/bb68da04-ef52-4172-8b6e-f4027bcc2786@oss.qualcomm.com/
>> https://lore.kernel.org/all/effea02f-6ffb-42e9-87df-081caafab728@oss.qualcomm.com/
> 
> This triggers a bunch of questions:
> 
> - What is audio PD?
> 
Audio PD is a protection domain which is running on DSP for audio
specific processing.
> - Is it a required component?
yes. it is needed wherever there is some audio use cases where 
DSP audio PD dynamic loading is needed.
> - For which platforms ?
> 
For platforms that require dynamic loading of DSP audio PD.
> - What happens if there is a memory region, but it is not used by the
>   driver (SM8650, SM8550).
> 
It won't be used.
>>
>>>>
>>>> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 11 +++++++++++
>>>>  1 file changed, 11 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>>> index 8e86d75cc6b4..d9af79ff8c4e 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>>> @@ -188,6 +188,14 @@ rmtfs_mem: rmtfs@9c900000 {
>>>>  			qcom,client-id = <1>;
>>>>  			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
>>>>  		};
>>>> +
>>>> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
>>>> +			compatible = "shared-dma-pool";
>>>> +			size = <0x0 0x800000>;
>>>> +			alignment = <0x0 0x100000>;
>>>> +			alloc-ranges = <0x0 0x80000000 0x0 0x40000000>;
>>>> +			no-map;
>>>> +		};
>>>>  	};
>>>>  
>>>>  	cpus {
>>>> @@ -3863,6 +3871,9 @@ fastrpc {
>>>>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>>>>  					label = "adsp";
>>>>  					qcom,non-secure-domain;
>>>> +					memory-region = <&adsp_rpc_remote_heap_mem>;
>>>> +					qcom,vmids = <QCOM_SCM_VMID_LPASS>,
>>>> +							  <QCOM_SCM_VMID_ADSP_HEAP>;
>>
>> Thanks. Will modify this.
>>
>>> Please align '<' vertically.
>>>
>>>>  					#address-cells = <1>;
>>>>  					#size-cells = <0>;
>>>>  
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>
>> -- 
>> Thx and BRs,
>> Ling Xu
>>
> 

-- 
Thx and BRs,
Ling Xu


