Return-Path: <linux-arm-msm+bounces-53948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C889A8556F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 09:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27162445562
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 07:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E6C82857D1;
	Fri, 11 Apr 2025 07:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JhYRYeQp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBB72036FD;
	Fri, 11 Apr 2025 07:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744356494; cv=none; b=fLmVSADPd54XSsV/3BqDXJbozLq7/w+wFIRt3sWE0hPVaThDsk6Hy48zp0kTezQFzDbc5NHK/SlhjLgzAHySBMGJP4x4/HiUsmsqq7auQAZH4ypuLhX73/2D43rrCMgEtI2hn71vEudPAsKTBVuC+oFa1oJWkZ2UKoFEeF0zPno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744356494; c=relaxed/simple;
	bh=ZXw7IdSYGbwpYBIfDEuJeabL5UpH+BofGjlFBgSV8gM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iWQtefmuE9xEdkkv1FTrd1tdgiOQmgl3lNiMb/8e8erACt1czPBXkZYMAQuXXaUf36r8Lcs80/mkCaKPDl2ScoqtsMnJz0K2T8JQJanP/dnTGvGtFCqoQwrD8C8Ub+T7h9PH0jyX/kQH3IJBsnFvV4j1SHlgTdX5AUTubHgunTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JhYRYeQp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B4ubJD019687;
	Fri, 11 Apr 2025 07:28:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q0U0ycz0cCg1vV/Qts+Pr8Y1j1A9cbNKFfAJRKW2kBQ=; b=JhYRYeQpsVZ8enrx
	zFGAJo+O6CWnHPF+9smpDkRJo/Q7bQchHt0cUjK2rIbYQnjW6FWkCNGZoCxhPykF
	Sm/imqKkH/vQjBSx4ZPXJJ5rbCtfLBQIp1YnkwbsYUWE0y3cA2fjJc/VK8wic6wf
	opfv6+8QGBmsUjo5T0RJ4yVerUx0hX/I0swhpJaZfB7/NFtBWN1xtgzWv1aL/W5t
	H8jlZLqI4Q0LmZomhpl+6pgm/MRyL9JWMj7rl7W0UcJ+vPDVmHzRWUNMdmXrT/qn
	rLociptGcFqcYO4eIZFyflgkCS2Zdn+Y/Wnt2Xv4A+sZRnePC+6Ze/wecHtPaxAX
	RsXQJw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrsqyk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 07:28:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53B7S6Ph013950
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 07:28:06 GMT
Received: from [10.218.22.7] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 11 Apr
 2025 00:27:59 -0700
Message-ID: <7af5a2a5-6eac-4734-aa20-3e0f2141afef@quicinc.com>
Date: Fri, 11 Apr 2025 12:57:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/18] arm64: dts: qcom: Add MXC power domain to
 videocc node on SM8650
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
 <20250327-videocc-pll-multi-pd-voting-v3-15-895fafd62627@quicinc.com>
 <12986cda-99eb-4a1b-a97b-544ea01e2dbb@oss.qualcomm.com>
 <4d23b54e-93eb-4c1c-86d9-a70f29c23ec4@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <4d23b54e-93eb-4c1c-86d9-a70f29c23ec4@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YHJJPxVZWcWl_l59HymslCK1ge66uv_U
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f8c487 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=nKsp9sJ0S5QfW6cRe6gA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: YHJJPxVZWcWl_l59HymslCK1ge66uv_U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=728 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110049



On 4/1/2025 9:30 PM, Konrad Dybcio wrote:
> On 4/1/25 5:27 PM, Konrad Dybcio wrote:
>> On 3/27/25 10:52 AM, Jagadeesh Kona wrote:
>>> Videocc requires both MMCX and MXC rails to be powered ON to configure
>>> the video PLLs on SM8650 platform. Hence add MXC power domain to videocc
>>> node on SM8650.
>>>
>>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>>> index 818db6ba3b3be99c187512ea4acf2004422f6a18..ad60596b71d25bb0198b26660dc41195a1210a23 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>>> @@ -4959,7 +4959,8 @@ videocc: clock-controller@aaf0000 {
>>>  			reg = <0 0x0aaf0000 0 0x10000>;
>>>  			clocks = <&bi_tcxo_div2>,
>>>  				 <&gcc GCC_VIDEO_AHB_CLK>;
>>> -			power-domains = <&rpmhpd RPMHPD_MMCX>;
>>> +			power-domains = <&rpmhpd RPMHPD_MMCX>,
>>> +					<&rpmhpd RPMHPD_MXC>;
>>
>> So all other DTs touched in this series reference low_svs in required-opps
> 
> actually "all" is wrong on my side, please also consider and if necessary apply
> the same change to patch 18
> 
> Konrad
>
It is not needed for SM8650. In the initial SM8650 videocc and camcc series,
required-opps was added for MMCX. But it was dropped based on the review comments
in that series, after confirming that minimum non-zero level from cmd-db on MMCX
is > retention on SM8650. And as mentioned here[1], required-opps is not mandatory
for MXC as well.

[1]: https://lore.kernel.org/all/44dad3b5-ea3d-47db-8aca-8f67294fced9@quicinc.com/

Thanks,
Jagadeesh

>>
>> Is that an actual requirement? Otherwise since Commit e3e56c050ab6
>> ("soc: qcom: rpmhpd: Make power_on actually enable the domain") we get the
>> first nonzero state, which can be something like low_svs_d2
>>
>> Konrad

