Return-Path: <linux-arm-msm+bounces-62657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DF6AEA06C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 16:25:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E400A165DD5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 14:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B8A2E975E;
	Thu, 26 Jun 2025 14:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="imEAtL5c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E2A2E8895;
	Thu, 26 Jun 2025 14:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947873; cv=none; b=mI0+y4oavvL0LIqsijNcGNN1tz0j09qGiKciYnu+n8fzV/CLnc8YsjwWT19B8Uuva4NkfYSDqNL9w/Aj207I2zvlCgbujC6+HfiZEowYAQHIY+8xc9PGunPaWkI+UyYH2D+H4bISoys+QA6EiNMwN6pBw1yYBRf77zklWZVj3rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947873; c=relaxed/simple;
	bh=z8Az5BxWgwJF72Pl3mwT+3fkWCrd5OPCRzXK03JDlVU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=FdTNJJ1nQmi794HsRBe6oeztmGlQMex5RjGX+CVmxOe8Ad63wEJOGCdJvpXGi3xLG921qCahDZxzg9WLwQA7tVASu3dLjsqgNfdzf46drlbuan5Vuey1dtjWPg3CV4uIBbn1UQqwYSTpPmZIcihpH/5qqeDXyAGuk2YOevYcbVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=imEAtL5c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QA0O4U008400;
	Thu, 26 Jun 2025 14:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lE8bVl1zr4ezIwt8GaAXmRS7KGKLo1VZaXDXmmWObKA=; b=imEAtL5c2zPhJDYx
	kpXiMQv0+Ct3Ub0ZS9bO0B4L4YBm2Yns4QoiD9SBM85NTtAQYy1qwrFqXMGqWR3y
	/BpWB9SHPjiXvWYWVI2rVCnQGLCYKAIbqJbaYOauUqRqeICI0cDMXnPRV3usj6zK
	XTkEF2dBaDq6KTSIzbxROfl4Ls5qrBPeFLIPbaYFxdhkX3mEXJ5RQMLCKTy0smeM
	s7+CzEI8UPX/S8nfsYOXCQZgxLFbj32/7Upoeyxzw18LkZlSlNWpnwzDZgUu4Jd0
	+XxRC4OQGMetPIavRR7jwbyBteZIRekYGOo3BmPzTLRMaabWgerfl4AOVCPcKsj2
	WuFjlw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqt1nx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 14:24:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55QEOOF0028753
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 14:24:24 GMT
Received: from [10.216.48.74] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 26 Jun
 2025 07:24:19 -0700
Message-ID: <64e29442-04eb-cf55-15fd-ea1337d15eb6@quicinc.com>
Date: Thu, 26 Jun 2025 19:54:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH V3 1/4] dt-bindings: mmc: Add dll-hsr-list for HS400 and
 HS200 modes
Content-Language: en-US
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Sachin Gupta
	<quic_sachgupt@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_mapa@quicinc.com>,
        <quic_narepall@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_sartgarg@quicinc.com>
References: <20250122094707.24859-1-quic_sachgupt@quicinc.com>
 <20250122094707.24859-2-quic_sachgupt@quicinc.com>
 <72b02fd1-5195-4bb0-b01d-5481b49a5680@kernel.org>
 <379e9199-4a9e-cd38-20cb-0fbd76fa33b3@quicinc.com>
In-Reply-To: <379e9199-4a9e-cd38-20cb-0fbd76fa33b3@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: eKmYM8IlNMpi_F19RRZtnuXLuPqbAqq6
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685d581a cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=qOHwSVfUYsfMRdCACtQA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: eKmYM8IlNMpi_F19RRZtnuXLuPqbAqq6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDEyMiBTYWx0ZWRfX41OUmrdsCefz
 PqvdDhF8Y+ea2WLcvy0+Y9x+lFQMxqXWaaiQ2O0a1XsZ51pWWAlw3sm0jDs7r4CHyNJ37X2vdLF
 CmOVmMPMDI1xqSuZQD1o6Qchj/uZfEeSzTsxv0q6YfDFVr1ulW+GbhgLuOfAh2Hr/m7ern6SPJF
 K34lAZUj5du1fodp3OZ31MXgeBE5OkJGZCDy5i2kHaDv2PQaDsPCh0CxWvpZa9Feh+puidpzFLZ
 7PkjXVgQj1xqKgupQjJa8Yjwowvf+jjttf9rUY1O2RcXMCqa0JivYxEsl3/w8DMgTKn7orDBQVq
 OcVeo5aZwvrcQou+qp1OmdMDVLlJKXb9LD6OWoq42FGupE4eSGSpLm36A8QQXsM582F08GblsJX
 v97rentCTDqxgGVtYXgJPr5TfAYDuMHl4UGQUyuSx8j2TLmUELHmu6aT1zsBrlBboMsSXvxV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260122


On 6/26/2025 7:46 PM, Ram Prakash Gupta wrote:
> On 1/22/2025 3:56 PM, Krzysztof Kozlowski wrote:
>> On 22/01/2025 10:47, Sachin Gupta wrote:
>>> Document the 'dll-hsr-list' property for MMC device tree bindings.
>>> The 'dll-hsr-list' property defines the DLL configurations for HS400
>>> and HS200 modes.
>>>
>>> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
>>> ---
>>>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>>> index 8b393e26e025..65dc3053df75 100644
>>> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>>> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>>> @@ -133,6 +133,11 @@ properties:
>>>      $ref: /schemas/types.yaml#/definitions/uint32
>>>      description: platform specific settings for DLL_CONFIG reg.
>>>  
>>> +  qcom,dll-hsr-list:
>>> +    maxItems: 10
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> uint32 has only one item. Anyway, there is already DLL there, so don't
>> duplicate or explain why this is different. Explain also why this is not
>> deducible from the compatible.
> I will change it to reflect array from uint32.
> There is change with artanis DLL hw addition where it need total of 5 entries
> (dll_config, dll_config_2, dll_config_3, dll_usr_ctl, ddr_config)
> for each HS400 and HS200 modes, hence the new addition in dt. And these values
> are not fixed and varies for every SoC, hence this needs to be passed through
> dt like it was passed earlier for qcom,dll-config & qcom,ddr-config.
>
> And backward compatibility would be taken care by check for qcom,dll-hsr-list,
> where new settings would apply for soc where qcom,dll-hsr-list is added into
> dt.
>
>> Please provide here link to DTS user so we can validate how you use it.
>>
>>
>> Best regards,
>> Krzysztof

sure, will provide with V4 patchset.


