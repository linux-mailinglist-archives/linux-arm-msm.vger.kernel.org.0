Return-Path: <linux-arm-msm+bounces-62413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E90BDAE7F54
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 12:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78A021BC08D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 10:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF1029E0FD;
	Wed, 25 Jun 2025 10:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JoxG3MEd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C1AA48;
	Wed, 25 Jun 2025 10:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847498; cv=none; b=ctXVX3DWsQ2mc9kbhnRM7PI4h6LZXx+fzFher++9BPu8GGHYKawaSa+CRftqKxECgd9HB3YUqsU2xm942RZl6ussovLipBmuB8fywMNOy0gr6LCp+ZwvZ7sQkz7K9pyEi5hnR60NGOVeMiqfUGbL943xLjp0zlnDalb3TNTbG5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847498; c=relaxed/simple;
	bh=T5x7MQq5qGPUOmkdKfVDekbqwDMp76t0iQ9otNr51EU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SV0c98rLRnrHjKiTCB0tQ/sQ2ExUdCzHAk0JiZ8n55lbcKejg5c8bBlkXHUTkNGyn+5ZdLAbfkZsHS6/emHmKp29sYK65xEBadne01bbjjZbcXwzn4tGtbnt1CWCnyklz9Yj6skEbz0NJ0eI6Em8/ERHNw2UJZDeOBTkvwuHRYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JoxG3MEd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P9GmY1031883;
	Wed, 25 Jun 2025 10:31:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oYzTx4PM7LLWPiXzgYdJMuAZn+gpg3+Kw0F4gReTtCg=; b=JoxG3MEdNWYQpDHp
	un0wUWDnqGFi7OBLM/sbcK3CGuQqJ5mGwR0rIcHUCIeBcO+QOEs6nUl2el1dREN7
	6C7HrnlamiRhFjWE/DtfzyMHUt5C1bnpK0P+pjkPbklGnXCio6Ju+iaszPNVXq6p
	THgx9tEsYhInWKbwuMSzJ+q4QpTkrZKEL3pDqlah2bThKLkYVzP0xmwEzG7DpKWc
	MRaKIJ4ZlUqhd77vRFR3cClMUyKwGQ1chz3gJC0FsZEcrnPllg1ycZnD2by9qCw2
	TKOkhPafvgCBcQaUr6eL558RRcQN180gTLLfeRnq0z8OqGj0q5R6tbA55CJqz/Aa
	wmUotg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b3yba7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:31:34 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55PAVY03016483
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:31:34 GMT
Received: from [10.218.23.250] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 25 Jun
 2025 03:31:29 -0700
Message-ID: <904994a2-21c1-4361-bf5c-e44b9807070d@quicinc.com>
Date: Wed, 25 Jun 2025 16:01:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8180x: Add video clock controller
 node
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Jagadeesh
 Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250623-sc8180x-videocc-dt-v1-1-9d210c140600@quicinc.com>
 <7c55acd5-6d30-42a3-aec6-2d7aa2a640b0@kernel.org>
 <cf1c9d32-9034-4d22-8be6-2abacb3ece56@oss.qualcomm.com>
 <739eb2d2-3e2c-4ab7-a040-75edc6f1ece0@kernel.org>
Content-Language: en-US
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
In-Reply-To: <739eb2d2-3e2c-4ab7-a040-75edc6f1ece0@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA3OCBTYWx0ZWRfXwgdAUKRy/rDP
 t4iQ3CgWuThhTldVeQtRs8YpJQv5Ymqsj3ndEsRNt2e+sAXTnjUxcznLScgVTcIZ7QUMvXfqXan
 /096erPOAfCoBdQ7sKKqog8rV97Hrx8JhiFS+L9P5sZOBDEan4Z8Xc9cAR/QuAWrLvj5b40FTR8
 +sHIwW93ox9aAtX16R/CVOBORdkGLfVuYt6XfY5AyG9p1lmXPM8QKEssW/rH2bZkOcm/iRswLso
 bDBbEThrhqGNnUYrCG3bAG/+CHC2IagjfRctwq3OBke1CvsAOzA70Zo2f+7kcLDgozWqpr3mXWU
 tWH8O3vQUS7NBasKBK7dAy9Rt2cS3NOy9fzs2zhiugPzjiW6bzRDAPKu4suxTrfhpsrwcalvRor
 H5A3gteSPXJNuMQdUkeUSRZjlZLqFm+e4nPb/02CJg0CWa/vQnk9hs+Ul7OmniKc9jdeJGWo
X-Proofpoint-ORIG-GUID: 7znXQTMhTA1oZSIWOXc3O5IP8G5oi2z6
X-Proofpoint-GUID: 7znXQTMhTA1oZSIWOXc3O5IP8G5oi2z6
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685bd006 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=EfIvK19bVAazuDrVKN8A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=732 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250078


On 6/23/2025 3:55 PM, Krzysztof Kozlowski wrote:
> On 23/06/2025 12:01, Konrad Dybcio wrote:
>> On 6/23/25 10:44 AM, Krzysztof Kozlowski wrote:
>>> On 23/06/2025 10:14, Satya Priya Kakitapalli wrote:
>>>> Add device node for video clock controller on Qualcomm
>>>> SC8180X platform.
>>>>
>>>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>>>> ---
>>>> Add device node for video clock controller on Qualcomm
>>>> SC8180X platform.
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/sc8180x.dtsi | 14 ++++++++++++++
>>>>   1 file changed, 14 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
>>>> index b74ce3175d209b569e634073662307964158b340..4590c2ff68a9885d8047d728bbf2dea0236d5b8f 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
>>>> @@ -10,6 +10,7 @@
>>>>   #include <dt-bindings/clock/qcom,gpucc-sm8150.h>
>>>>   #include <dt-bindings/clock/qcom,rpmh.h>
>>>>   #include <dt-bindings/clock/qcom,sc8180x-camcc.h>
>>>> +#include <dt-bindings/clock/qcom,videocc-sm8150.h>
>>>>   #include <dt-bindings/interconnect/qcom,icc.h>
>>>>   #include <dt-bindings/interconnect/qcom,osm-l3.h>
>>>>   #include <dt-bindings/interconnect/qcom,sc8180x.h>
>>>> @@ -2943,6 +2944,19 @@ usb_sec_dwc3_ss: endpoint {
>>>>   			};
>>>>   		};
>>>>   
>>>> +		videocc: clock-controller@ab00000 {
>>> Why are you adding the same multiple times? This was added A YEAR AGO,
>>> so you clearly send us some complete outdated ancient tree!
>> It seems like you're confusing something, there is no videocc node in
>> sc8180x.dtsi
>
> Heh, I am... the line below:
> 	compatible = "qcom,sm8150-videocc";
> confused me and I looked at wrong file.
>
> Satya:
> Still for obvious reasons: NAK. See writing bindings or internal guideline.


Sure, I will add a new compatible for sc8180x and update the bindings 
accordingly in my next post.


