Return-Path: <linux-arm-msm+bounces-62720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0CCAEAD8E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 05:52:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A9157B58D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 03:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FBB219DFB4;
	Fri, 27 Jun 2025 03:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HEnFD4Zz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07062AD2D;
	Fri, 27 Jun 2025 03:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750996348; cv=none; b=a9LJysZGHdY1gfqkv9aRaMEJO/j4FiL1SSoGwSM1N4afwwNtDm/CKTJPuc+Fz+iOfCa+t99buLlImTPGo6vtOrJZz2s3KDF0AFc9fG1mu30YJlYmNbf/qHMrmSrFrBzw/m62j+G4YVI5OnA55+UcXw1y/Cu47dPdlrZUutMtW8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750996348; c=relaxed/simple;
	bh=aZsiy40V526ZMoYenZD2j2dnuixrJgHsE+eT7OdkQUo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fWkCZZf/+r1dBifnHCEGTnaLezaOVJFza7ojfsx9zKE95CAkBqVR6XLHqedQfhk50vL2n8GP9nQ4W0hmxFEtZdoZCdYvW0ELjpQdWLeU6xbn7inDOH6U2wENQ1sVa/dM22wp2WdHoTQK8hINkSRqlzpdM+tUGgoL3CIROQuGms8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HEnFD4Zz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QJNmXY002535;
	Fri, 27 Jun 2025 03:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qrRree7S7uVRQuvfc8/hmKA9hVSovBf+CCe9dWPDHpY=; b=HEnFD4ZzwWeVAnhF
	RgXHvfCmp/WwfBEjvP/isogARkRdqdTM26vPhoizZts4xH6Cfjq8HMBwKwThPxgo
	BquTMZ8kRywAYpdJ3QDcAJqI5tUEofQENoEJqiyDhPsKrgujArBzkKX5u5pINRZW
	q+yCLHY8kZIvCCu7TfdHFo+3Vd/0+b6IFZ1zEk3bVvM+HPcefQMeU3TXgATalLOh
	dpFdY3FuCq9h8cr9Mp+UU9dZml73dMogin98ldhogaCuER5LM+y30XK8T+uBqW9w
	ylBKTF6AvnaOxvA6hoqJ4pbU0Cj83Xa2Qq3DyMi16x/ANfegAwmJwwbZYKMKkxpp
	004GDQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmy3pk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 03:52:24 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55R3qNKa023629
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 03:52:23 GMT
Received: from [10.217.217.109] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 26 Jun
 2025 20:52:19 -0700
Message-ID: <2b29ae78-e4a0-4d25-a694-abb10883086d@quicinc.com>
Date: Fri, 27 Jun 2025 09:22:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs615: Add CPU scaling clock
 node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Jagadeesh Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250625-qcs615-mm-cpu-dt-v4-v4-0-9ca880c53560@quicinc.com>
 <20250625-qcs615-mm-cpu-dt-v4-v4-2-9ca880c53560@quicinc.com>
 <xkvn3r7yphlccurdqzncz5qegs7xc254xc2ou2dzuilatk5f5j@eq5ynce4aepg>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <xkvn3r7yphlccurdqzncz5qegs7xc254xc2ou2dzuilatk5f5j@eq5ynce4aepg>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XoZjffqjWohu2Ehsc8x766svlliaEezw
X-Proofpoint-ORIG-GUID: XoZjffqjWohu2Ehsc8x766svlliaEezw
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685e1578 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=wECTHmSFBrqOf3EFGEoA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDAyNyBTYWx0ZWRfX0W68a1hK01Ai
 2YjcPf3iiQd61XLDOfQG3JXdAeeXG2w3WosFgRhdrAwLLkuq0QZEmf7emKNxkeiYNUijoXgPzrs
 qnufuyDg89Y4vN3qmM6kOfg0ZlG+nfPmccccA8uKBpWRL94VX5SpLSCIHncP/k/VN0lkmEsmFVm
 NaGFDS+BzJ09jn5VDt3lfwTGgraMCf+IBeidtkAshU1uG2IFD+F2h76CJzYly+Zd97AyRxhszZ4
 2YM3CEBjvD8e6huG2uKWtgGeHMrmOG6s6MDaWksm8CQ0KBkMN8jHdxFVjo1bBYhtVXMDRRdLIdY
 qwmn/y/GAtNhr7Y0BvkLzZ1lX5VFLBzzWK7nzXvehwZQjJxhnIo9UcziJOWV8NnquF9Oa/r1RGv
 Qv6dzWbMTlT3e5JkyAqSwlq8IWX7RIh24aX1oAxZ+yTsZIlJ1MyNaBqbnk1GZiyPbJuEWd/U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_01,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=870 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270027



On 6/25/2025 5:06 PM, Dmitry Baryshkov wrote:
> On Wed, Jun 25, 2025 at 04:44:01PM +0530, Taniya Das wrote:
>> Add cpufreq-hw node to support CPU frequency scaling.
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 29 +++++++++++++++++++++++++++++
>>  1 file changed, 29 insertions(+)
>>
>> @@ -3891,6 +3907,19 @@ glink_edge: glink-edge {
>>  				qcom,remote-pid = <2>;
>>  			};
>>  		};
>> +
>> +		cpufreq_hw: cpufreq@18323000 {
>> +			compatible = "qcom,sc7180-cpufreq-hw", "qcom,cpufreq-hw";
> 
> Why? Other platforms use a true SoC as the first entry.
> 
Dmitry, from cpufreq-hw perspective SC7180 is a exact match for QCS615
and that was the reason to use the same.

>> +			reg = <0 0x18323000 0 0x1400>, <0 0x18325800 0 0x1400>;
>> +			reg-names = "freq-domain0", "freq-domain1";
>> +
>> +			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
>> +			clock-names = "xo", "alternate";
>> +
>> +			#freq-domain-cells = <1>;
>> +			#clock-cells = <1>;
>> +		};
>> +
>>  	};
>>  
>>  	arch_timer: timer {
>>
>> -- 
>> 2.34.1
>>
> 


