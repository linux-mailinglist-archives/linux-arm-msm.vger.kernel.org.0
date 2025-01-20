Return-Path: <linux-arm-msm+bounces-45567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 222BAA16AD0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 11:34:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26C4F3A4F5A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 10:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C2C1B413E;
	Mon, 20 Jan 2025 10:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gcRAJ6B5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75D5193409;
	Mon, 20 Jan 2025 10:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737369273; cv=none; b=J5roGSqbj2ydVgPh8Wu2xFHezeRXk1GgIzLk/4w4E7uQeI2N6dAZ/8oT7a74BBX+WfFh1AnDaqFDHov05DznPIQlxPnAIj12ZxLsvIZ4xzlrXp/zaQ/3RchXtnsee5cUuXYmnuBPm3QH/J0vxKtidB1UdWC9zhS8TqP0PV26u4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737369273; c=relaxed/simple;
	bh=UkGU1LGSF/BfgGXEdTZ8GhTZ4Bhwwi0KTlwPKLbeZ8E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=f6oMhNYBfxm+HM4XSUjFzU0IMwKvrow2X0jiQraUI2gb7FZObz44R5XTLhyF49OHEV6lWIOY29GhEZrK+uT/++XnfveIeYVSz9jCjtkh0MZIZeoTMYl5CClcqsQd2MXkoMsNNRGY6ecAXU1bDy/p0xJSX6b4lXkjovXGUwDRuos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gcRAJ6B5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50KAPfVj016270;
	Mon, 20 Jan 2025 10:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HMi7hXj4GC5/GYULGYqMO1qI2OcvsWD5eyWeHWSqfyA=; b=gcRAJ6B5l7dMsbzF
	gAVT1s0BDt3tNoKINtAqcOvyaN5cHXQxbiEZC++ttEuGVMPIG4YlcCTsszJuOM9B
	+X6LjwzkovxwdCZotCvK7aPpO4LL4xqJil1m0b0s9trbBjTl5Qmo49cbHtqAPqNZ
	PQ/WR+akCANoLI4Ys93UjLJwGvfuakSphxXgP35hL/ZmgSTeCBDG488LJ2hu8Z+E
	upombEjw+SYaqfi0c1myEdtM49NlDxvjLH6BATvOkK+RsoRvFek6Y6kUB1Yjq3Kn
	px9a4dqNjyRxNtWL7jSy/6kg1mRIZCjmM1MoUzj84H55Evb4R+/I/pHe5n1qf1gg
	/oEOSA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 449mqpg0t6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 10:34:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50KAYJoI006146
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 10:34:19 GMT
Received: from [10.217.217.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 20 Jan
 2025 02:34:15 -0800
Message-ID: <97f5f5b1-b4f9-4d0d-88fb-4c7a0f1c26ac@quicinc.com>
Date: Mon, 20 Jan 2025 16:04:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add cpu scaling clock node
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
References: <20241108-qcs615-mm-dt-nodes-v1-0-b2669cac0624@quicinc.com>
 <20241108-qcs615-mm-dt-nodes-v1-2-b2669cac0624@quicinc.com>
 <cgg3s6f555eb4jl5segz7irwx2kkza7w6zucfyo7myrbjhng3v@2qmyrobzakhd>
 <71635b71-71e4-4c17-add1-bf41ce770632@quicinc.com>
 <scfoxmstfqgvqmxovb7h5gulh6bjhgexs6yxe2n75izc7sawby@djphyr2ilei3>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <scfoxmstfqgvqmxovb7h5gulh6bjhgexs6yxe2n75izc7sawby@djphyr2ilei3>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KXPKuKcNsIHCUryKtG37PJj5ysDKRWlB
X-Proofpoint-ORIG-GUID: KXPKuKcNsIHCUryKtG37PJj5ysDKRWlB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_02,2025-01-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=845 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 phishscore=0 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501200087



On 1/20/2025 2:16 PM, Dmitry Baryshkov wrote:
>>> This doesn't follow the bindings, does it?
>> I will add and re-use the closest target compatible.
>>
>>>> +		reg = <0 0x18323000 0 0x1400>,
>>>> +		      <0 0x18325800 0 0x1400>;
>>>> +		reg-names = "freq-domain0", "freq-domain1";
>>>> +
>>>> +		clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
>>>> +		clock-names = "xo", "alternate";
>>> Are the DCVSH interrupts?
>>>
>> This target does not have DCVSH interrupts directly connected to the
>> CPUFREQ-HW.
> So, does it require a separate LMH driver, like the one used for sdm845?

I will check how it is handled on QCS615 as it is closer to SC7180 and I 
didn't see any LMH handling there as well.

-- 
Thanks & Regards,
Taniya Das.


