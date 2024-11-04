Return-Path: <linux-arm-msm+bounces-36881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D339BAD3F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 08:37:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AA8A280CBD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 07:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1322F199221;
	Mon,  4 Nov 2024 07:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LrsqHYkn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C0118B491;
	Mon,  4 Nov 2024 07:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730705818; cv=none; b=hlVy8YTVBCxpyVNcemdrUEs1WVOR2zqUjznXBealhnKtrzjq/2X1u6BwZrsstkYfiInLm1OzzW/duXaLy4BACJYJfc3ngkrP2rhLqbciNujJz4qd8FK6PeCoZOhUOkvDLLH9nbr3OQALgxgsF/58cjW3jQosn+1Iz265v++5E4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730705818; c=relaxed/simple;
	bh=auNA8MkWp8sQM+YeiVKdMRcHsOps+0KZMwdImRb35js=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rTlr1RPhZ/0cylkTJi7d0ljGQH1hXyGxUEdQGOJPdxolZG0P+Dx3uiNdJs0ZRp0Z/uqlHdO1ijqtAJ+dvla4VWEZXCPS5GCGpZc6Apj9j+ubyW3CPa+EpCDUV1intHOB1gC4FjtsSLmG9LKnnvAI4gvt16vv1ntpCB2JLhQYze4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LrsqHYkn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A3KQKvK024363;
	Mon, 4 Nov 2024 07:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8ek0qXHBnqGmsGf7Rks9NEKL9OwAJA9BT04q474lpaM=; b=LrsqHYknObWMjRkJ
	dquhM5HRswZI2nqcstG7DB1NCqxyhC8A6Z0cMJldWcxzzr44WTYnqTPLectxL1vQ
	eJAN0pndkdbwrjuw7kTPDTBeUjD8TB2zSjCThfLAnO1b62hkGIwZLO85lwJRF5lD
	tY1zKVLW07CynH4HBlqc9l2UZNndCBIahkhmU5183Zvw4sbogcQEE6+waa8M1R5O
	Mm0LbNHx6ndPWZdZgHp5RCPdRGEXmNKmcEa5/I8V+zXr+b/Km75Fti7xcDY3fYV2
	QRPOaJmoSa/mi1gBjbEmZKPib7kcmDtB+0ala6xA0J1u9CTjaPV/6LwtlIXPq6o3
	Ob4jCw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd8hbag0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 07:36:44 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A47ahqx023749
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Nov 2024 07:36:43 GMT
Received: from [10.239.132.41] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 3 Nov 2024
 23:36:39 -0800
Message-ID: <234d5fba-928d-480c-a9bf-1a8c5fc6f58d@quicinc.com>
Date: Mon, 4 Nov 2024 15:36:37 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: qcs615: add the SCM node
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <robimarko@gmail.com>,
        <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>
References: <20241025030732.29743-1-quic_qqzhou@quicinc.com>
 <20241025030732.29743-4-quic_qqzhou@quicinc.com>
 <flk7n534gfqyivlbl72qco4k5d3c6ravevumjfoh6464pe3qg4@r7ns6zr2i3bv>
 <645c9887-4df2-4ab2-a048-ba79a97b8d2f@quicinc.com>
 <vuz5mvmi4srbwdopivu543cdndybjy5cswc3zmukztldyv22ql@27les6xz7r74>
From: Qingqing Zhou <quic_qqzhou@quicinc.com>
In-Reply-To: <vuz5mvmi4srbwdopivu543cdndybjy5cswc3zmukztldyv22ql@27les6xz7r74>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: wxHepGIGJXqG9UYfwGj5GH1YSK5dNwuj
X-Proofpoint-GUID: wxHepGIGJXqG9UYfwGj5GH1YSK5dNwuj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411040067



在 11/1/2024 2:59 AM, Dmitry Baryshkov 写道:
> On Wed, Oct 30, 2024 at 04:42:19PM +0800, Qingqing Zhou wrote:
>>
>>
>> 在 10/25/2024 2:02 PM, Dmitry Baryshkov 写道:
>>> On Fri, Oct 25, 2024 at 08:37:31AM +0530, Qingqing Zhou wrote:
>>>> Add the SCM node for QCS615 platform. It is an interface to
>>>> communicate to the secure firmware.
>>>>
>>>> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 7 +++++++
>>>>  1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>> index ac4c4c751da1..027c5125f36b 100644
>>>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>> @@ -278,6 +278,13 @@
>>>>  		reg = <0 0x80000000 0 0>;
>>>>  	};
>>>>  
>>>> +	firmware {
>>>> +		scm {
>>>> +			compatible = "qcom,scm-qcs615", "qcom,scm";
>>>> +			qcom,dload-mode = <&tcsr 0x13000>;
>>>
>>> No CRYPTO clock?
>> NO, response from Qualcomm clock team is "the current QCS615 RPMH code does not have the clock support for CE clock", so we don't configure clocks here.
> 
> Is this going to change in future?
NO, from Qualcomm clock team, the clock/BW is handled internally in our trustzone and do not see any requirement change going forward to move the clocks/BW vote to HLOS driver.
> 
>>>
>>>> +		};
>>>> +	};
>>>> +
>>>>  	camnoc_virt: interconnect-0 {
>>>>  		compatible = "qcom,qcs615-camnoc-virt";
>>>>  		#interconnect-cells = <2>;
>>>> -- 
>>>> 2.17.1
>>>>
>>>
>>
> 


