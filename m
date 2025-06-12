Return-Path: <linux-arm-msm+bounces-61107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F9BAD6D03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 12:04:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 581F81882040
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 10:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8078422B8A1;
	Thu, 12 Jun 2025 10:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mf+7kYb4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F8E20F07C;
	Thu, 12 Jun 2025 10:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749722635; cv=none; b=GNRe6RAcfgf9/ZdWBkkAFhW353UWI1DvxI/1Kc8RcGZJlgxsnZxn9AFMJIe3cxeUGzPeECTxToQ8vPsnSnz5v1n5nQWd5dAi4hyJCq4p6yPzrIFRzZbaGd+T7i6FKchzjrAAgENPp/CBMOB/xuTZWu6xswkbPoJEC61vvbPvrsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749722635; c=relaxed/simple;
	bh=79Ej92lmxAhokJ6qos1WFG87rDhhZE9TYA2gDfU4Yss=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VGURJ33wpNzVXOKZrE+XJmWrQ+tMNI/shxoT3Jh1okt3SkZj25Bi2mz5OxTcyHA0mPIFjv8UwRw2qKPeEYBG9XAqFlLY0mIlPXaK0gQ7N2QitSP94tGsHQYDKmSoeWKWxjYYs3gNmWU/JAblKrI/t3ORl6MNJFg/IhcEBTG4pfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mf+7kYb4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C002mY031502;
	Thu, 12 Jun 2025 10:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k9U1ttH1VA2kYAXHc9jibIWLy9UBDC54n+4Lt6VLKL0=; b=mf+7kYb4z//vRkPm
	9ZFnzOAYgIHDwbw83V7zBzD48iFTvH0Ne4JlFaIi1Stb0tHlTL81LR+6OEci0ZcH
	4x8NG1WYxHO6aClWiBDqxoYvzWO1qtKHq2dHFNGupvpJKiOtX0nBioqnEpZYL4vl
	degm5AMfRJxrtIrwX7mxlXgF0v1nh6DUTYj9BBJYvIAUshhpxi9zH8+z78tEip01
	wb3lsQEPfNrGA8q9jUjhfl5WnO+r0cKM0ESeKSMnU44UAaCb/QTbs2h4ChRVW8pK
	i6uVb/MhQFtJaXJmLOu+7itOv1q9hEHuFaCDTQQqgstRnivZ8Xl56LwB4NxmmWoi
	DU/qzg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcr2yj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 10:03:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55CA3jI3017955
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 10:03:45 GMT
Received: from [10.217.216.47] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Jun
 2025 03:03:39 -0700
Message-ID: <65828662-5352-449b-a892-7c09d488a1f4@quicinc.com>
Date: Thu, 12 Jun 2025 15:33:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v5 00/18] clk: qcom: Add support to attach
 multiple power domains in cc probe
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Vladimir
 Zapolskiy" <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov
	<lumag@kernel.org>
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
	<bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
References: <20250530-videocc-pll-multi-pd-voting-v5-0-02303b3a582d@quicinc.com>
 <174970084192.547582.612305407582982706.b4-ty@kernel.org>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <174970084192.547582.612305407582982706.b4-ty@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA3OCBTYWx0ZWRfX97ZXxGv9IwNr
 EX90cN9bIqNOsTMWPWZX5n3zcdwVhjEyypW0b2g3iglDKIkGRdYY2rt/9SD+F2QLoVxlm5cx7nY
 AmtkntEuO7nO2wo2NZMvPI6xbxYLS+uMWv134tTJxD9Tcw7XSKjZlx6a/wzVwz1q10/Tx5YijFR
 XPEdKUIs6/ZbI8rkOx+F72uuOAUUI3FSCenG6NzuQnOVAW4ItDguqWAoh9NYxtoVcGyZexR5Phq
 7z+pB1BitQQsXVFEoVA+u8z89ubfcdE++z7PEFwwjbNxVs9MwcZTtDWWgv1GOpKS4+I7kfXTUdF
 iXv/1XsmmKYMHYhQUtdNsy+onJ544od1DyMKPicIN+4IHYkibThA+I6wHk2xUEFw/yiKjRzvoOR
 zIvsm/sv4bz3XtsvktS5tWOQQR3EdNwex5f4BxSPeDY/nk4Cy7IOeqbPPh/ajUJkzX6/3QyV
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=684aa605 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=hQ4XiD8ppu2c1zOSADcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: s1o1K9B_KX_vzw0i5jcmaKdqOECSzXHX
X-Proofpoint-ORIG-GUID: s1o1K9B_KX_vzw0i5jcmaKdqOECSzXHX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120078



On 6/12/2025 9:30 AM, Bjorn Andersson wrote:
> 
> On Fri, 30 May 2025 18:50:45 +0530, Jagadeesh Kona wrote:
>> In recent QCOM chipsets, PLLs require more than one power domain to be
>> kept ON to configure the PLL. But the current code doesn't enable all
>> the required power domains while configuring the PLLs, this leads to
>> functional issues due to suboptimal settings of PLLs.
>>
>> To address this, add support for handling runtime power management,
>> configuring plls and enabling critical clocks from qcom_cc_really_probe.
>> The clock controller can specify PLLs, critical clocks, and runtime PM
>> requirements using the descriptor data. The code in qcom_cc_really_probe()
>> ensures all necessary power domains are enabled before configuring PLLs
>> or critical clocks.
>>
>> [...]
> 
> Applied, thanks!
> 
> [01/18] dt-bindings: clock: qcom,sm8450-videocc: Add MXC power domain
>         commit: 1a42f4d4bb92ea961c58599bac837fb8b377a296
> [02/18] dt-bindings: clock: qcom,sm8450-camcc: Allow to specify two power domains
>         commit: a02a8f8cb7f6f54b077a6f9eb74ccd840b472416
> [03/18] dt-bindings: clock: qcom,sm8450-camcc: Move sc8280xp camcc to sa8775p camcc
>         commit: 842fa748291553d2f56410034991d0eb36b70900
> [04/18] clk: qcom: clk-alpha-pll: Add support for common PLL configuration function
>         commit: 0f698c16358ef300ed28a608368b89a4f6a8623a
> [05/18] clk: qcom: common: Handle runtime power management in qcom_cc_really_probe
>         commit: c0b6627369bcfec151ccbd091f9ff1cadb1d40c1
> [06/18] clk: qcom: common: Add support to configure clk regs in qcom_cc_really_probe
>         commit: 452ae64997dd1db1fe9bec2e7bd65b33338e7a6b
> [07/18] clk: qcom: videocc-sm8450: Move PLL & clk configuration to really probe
>         commit: 512af5bf312efe09698de0870e99c0cec4d13e21
> [08/18] clk: qcom: videocc-sm8550: Move PLL & clk configuration to really probe
>         commit: a9dc2cc7279a1967f37192a2f954e7111bfa61b7
> [09/18] clk: qcom: camcc-sm8450: Move PLL & clk configuration to really probe
>         commit: eb65d754eb5eaeab7db87ce7e64dab27b7d156d8
> [10/18] clk: qcom: camcc-sm8550: Move PLL & clk configuration to really probe
>         commit: adb50c762f3a513a363d91722dbd8d1b4afc5f10
> [11/18] clk: qcom: camcc-sm8650: Move PLL & clk configuration to really probe
>         commit: 3f8dd231e60b706fc9395edbf0186b7a0756f45d
> [12/18] clk: qcom: camcc-x1e80100: Move PLL & clk configuration to really probe
>         commit: d7eddaf0ed07e79ffdfd20acb2f6f2ca53e7851b
> 
> Best regards,


Hi Bjorn,

Thanks for picking these patches. However, the dt-bindings patches are closely linked with
the DT patches in this series and needs to be picked together. The dt-bindings changes adds
multiple power domains support for clock controllers, and without the corresponding DT
patches, dtbs_check will give warnings.

Can you please help to pick DT patches as well?

Thanks,
Jagadeesh

 

