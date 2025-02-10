Return-Path: <linux-arm-msm+bounces-47387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDCBA2E7D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 10:34:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C7E21887D59
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 09:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E11811C460A;
	Mon, 10 Feb 2025 09:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YVbpuI0D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1946A1BC077;
	Mon, 10 Feb 2025 09:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739180012; cv=none; b=FkSEr4qfA+EWM5pWn4n20GkstToCt6nkLALaMN+keoU1N2fG9msLbl1tzvqTkDzU/pJpn6C6OkZLaNihQXcGhFhIor1/EzdWF82URZc5P8pFT+DNVpfbIl7BpYqtk+Pg2PdLvMshB71ujNcoaaLWA1QoAuaF+3jpeF05R8EYAsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739180012; c=relaxed/simple;
	bh=TosIKhCk3SN1PwRyrLBresTTnSavv/N/mxwO2w09ci0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KXSM+0lDUgPAUUHpmzFiz6noB5cVbSFSyB799omNNKIpo8vO5I70wGLmogVYbmpxOAjmjXkFVOzwR9Fe6bPenxRy46YR9n4bUOj+mF7+GxRUMkt6DgTIKzWpZA2/nRPoyxIWKL1XSEL2m1DMfGLZEvDS+Cfot9N2DB9TvQ80lYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YVbpuI0D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A9HlqO001435;
	Mon, 10 Feb 2025 09:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aFK9VfsypPuyEfZt9gK6YF7AEf5UNrQldNbUXcgKpHo=; b=YVbpuI0DXqFsE1sk
	HfMUURBwLHlzrVXsM77IFn6ZfSZAYulZUTP1euqTXQC/hcoiFNo0B+svgBF6UagH
	5bqOmverugOR4kk2GpMRjIRb/9oVcdt30PcEFGxlIA3CKOC1vXPa3olXDSj99Af8
	+7PMrF+5s3fH2ZwqF+MuihpmNkPumP7W+D5xPN1H6zEv0nA/QRf7y1AQsOoIZPC2
	8A77UGciCtmGZOR3/BhDmOltO/Sp/GkMacR+1P+DwdSqIthyzhl74umHGzP/NTs1
	uRH3eSfoPNwuMgBbAHTZh7BEOMHyTu3AYkZoFOdFgh67ee62vKSqY7xd7jgbQYoW
	BfiFww==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qepxg1dg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 09:33:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51A9XPMw005053
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 09:33:26 GMT
Received: from [10.217.217.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Feb
 2025 01:33:21 -0800
Message-ID: <4787c96d-0397-437d-acb4-da2857d32abe@quicinc.com>
Date: Mon, 10 Feb 2025 15:03:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: qcs615: Add clock nodes for
 multimedia clock
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250119-qcs615-mm-v2-dt-nodes-v2-0-c46ab4080989@quicinc.com>
 <20250119-qcs615-mm-v2-dt-nodes-v2-1-c46ab4080989@quicinc.com>
 <19a83d67-7e1a-495b-8dff-e1d2ba05b878@oss.qualcomm.com>
 <da980161-087b-4fd7-a1a9-56576b6dfff9@quicinc.com>
 <ff574ebe-041b-44f0-8335-6bfa332d8077@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <ff574ebe-041b-44f0-8335-6bfa332d8077@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: B542r0EIn6VvXE2yEM4jNDRmYHn42NND
X-Proofpoint-ORIG-GUID: B542r0EIn6VvXE2yEM4jNDRmYHn42NND
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_04,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100079



On 2/6/2025 5:12 PM, Konrad Dybcio wrote:
> On 4.02.2025 6:33 PM, Taniya Das wrote:
>>
>>
>> On 2/3/2025 7:44 PM, Konrad Dybcio wrote:
>>> On 19.01.2025 1:00 PM, Taniya Das wrote:
>>>> Add support for video, camera, display and gpu clock controller nodes
>>>> for QCS615 platform.
>>>>
>>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/qcs615.dtsi | 51 ++++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 51 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>> index f4abfad474ea62dea13d05eb874530947e1e8d3e..9d537019437c5202c4d398eecd0ce2a991083175 100644
>>>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>> @@ -3,7 +3,11 @@
>>>>     * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>>>>     */
>>>>    +#include <dt-bindings/clock/qcom,qcs615-camcc.h>
>>>> +#include <dt-bindings/clock/qcom,qcs615-dispcc.h>
>>>>    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
>>>> +#include <dt-bindings/clock/qcom,qcs615-gpucc.h>
>>>> +#include <dt-bindings/clock/qcom,qcs615-videocc.h>
>>>>    #include <dt-bindings/clock/qcom,rpmh.h>
>>>>    #include <dt-bindings/dma/qcom-gpi.h>
>>>>    #include <dt-bindings/interconnect/qcom,icc.h>
>>>> @@ -1418,6 +1422,18 @@ data-pins {
>>>>                };
>>>>            };
>>>>    +        gpucc: clock-controller@5090000 {
>>>> +            compatible = "qcom,qcs615-gpucc";
>>>> +            reg = <0 0x05090000 0 0x9000>;
>>>> +
>>>> +            clocks = <&rpmhcc RPMH_CXO_CLK>,
>>>> +                 <&gcc GPLL0>;
>>>
>>> This would normally be GCC_GPU_GPLL0_(DIV_)CLK_SRC, is this intentional?
>>>
>>
>> Yes, Konard, but on QCS615 GPLL0 is connected and not the GCC_GPU_GPLL0 sources.
> 
> It looks like you're right.. if I'm looking in the right place, the _GPU_ ones
> are not connected anywhere..
> 
> It also seems like the reset state of the _GPU_ ones is OFF (as expected),
> should we remove them from the GCC driver to reduce confusion?
> 

Yeah I understand it might confuse, but I would like to keep them as the 
code will match the clocks present in the hardware.


> Konrad


