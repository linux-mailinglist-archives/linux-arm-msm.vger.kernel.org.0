Return-Path: <linux-arm-msm+bounces-62585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C9BAE9777
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 10:04:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD6387A3596
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 08:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0381A256C73;
	Thu, 26 Jun 2025 08:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B47zkZ5P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5191623314B;
	Thu, 26 Jun 2025 08:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750925069; cv=none; b=BucD5LMup1mVLg9qLBhcd5btgJ+c11o65xJlhhm1cN1TXfom1i78SllTlxjEWcaEpYpIZYbNbGq1CUCIaki/Ux2mqW335hKpiy+94/v+7PfQdUD+37gi8JkxFaviRGmX3LlLlQstNPrOXokUAUftGSZDkVkFtHWoJZydBRj66Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750925069; c=relaxed/simple;
	bh=ll/GCByaq6L/vUF7X3hIS3Ke3ltdmYqhTq+wVmecgn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DcV2AENcigRJz3W9bOZ99PT3ft7+wx8QhdiNbGYzY8VEpPZ4fIt7EP4RekkriCY/ErIfvDeqrTSRdr+ufgNR+23ffoWNFES9CV+B9JkI2FwvX54HL1Q7K42WhT9DzkLq7NxIaDyIiAZZ7GV62oHl5HbI2Pwd6CMUXH6J7zlg7sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B47zkZ5P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q0EXZa027655;
	Thu, 26 Jun 2025 08:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9bh0BdyixRnDd6O7y8OvWoe7BilB3MF8CQqhr1ip8jM=; b=B47zkZ5P/f5rZs0C
	sv+zpXXegSp5V8D03Yqf02SdiNEdjGQzExSCEYkckthqnlcdZpuananbDe9RDliW
	yKJMC6P3CZ4l1KU3xgj3EGRfXaUXXhlJ++zbJ05eS5aO6/EOh6Xt3iZ1hOaI+/cV
	38ihwf+qDFBbCerJgzDji4O4mEA7K/oPKX6qT4iiMwbNewYQfBJDx6ecaLjrU82R
	WkXuN3/NVoY1PIvoHEcqb1Ha30sYrvIs5bWem8vgP3upWf3xie4h7o8IdAU6Z2iw
	fU0hubREb791B34FjJoKuWgyAzljIzOh66TRY01tuk2Dzss39W78HrGJAREY6kcK
	25hzsQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5umfv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 08:04:12 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55Q84Brl031370
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 08:04:11 GMT
Received: from [10.239.133.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 26 Jun
 2025 01:04:07 -0700
Message-ID: <3905c8ab-941a-4171-a1d9-7721059a7490@quicinc.com>
Date: Thu, 26 Jun 2025 16:04:05 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] dt-bindings: arm: Add qcom,qmi-id for remote etm
To: Bjorn Andersson <andersson@kernel.org>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250424115854.2328190-1-quic_jinlmao@quicinc.com>
 <20250424115854.2328190-4-quic_jinlmao@quicinc.com>
 <ugxijerhh5yfgpvmuaatvenh7yrk5uoiracfp7xknsxrb73dcl@hwsatze4rjuq>
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <ugxijerhh5yfgpvmuaatvenh7yrk5uoiracfp7xknsxrb73dcl@hwsatze4rjuq>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lkzTFagtO3N3ZaAkJPjolOa-R_hAEndf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA2NSBTYWx0ZWRfXw+rmMdNYNj/b
 FDIWbb6LfSWXdLmOXQIs7bMkYQ0f1i3ekwh9XG7MX1ShPY9oED+xgAuVNs6oMUrvODR0rc1epUJ
 iZ+mn7P92bWZwsg1g88877kyAWKMK/M60Fe3yHA7sfXCK12opzP1kZ1r1x9HfmdguQgEYAdoqKA
 HQLpil9QA6btULs8U/DThickdN29S0FMHOmZx3HZvmZ6kJ4FzqOSxrk2zyABE1JnHilcm6j8xOL
 1ktDVc/Q82+phCFlM+xz45jnOYmAL6VZddPc7e6mApngYgYt56K/kLFPauHTJ8g4jM4wrmj8tVC
 3lj81PaXCxnQtAiqwwTs9Bv6r1gqDssLDdxPRZAg71n9RfYJpau8IvdeT8+NS6ffIL8aaujPbsH
 X1CICqoyBl8OhHBuRdMsrpAb4Wd7EpY3CWtP6FWM/R8KxQS+pmGmldbFoW1biPrGGjSrTwAI
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685cfefc cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=GsXIiSCn9My1Hi_4oy0A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: lkzTFagtO3N3ZaAkJPjolOa-R_hAEndf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260065



On 2025/6/18 11:16, Bjorn Andersson wrote:
> On Thu, Apr 24, 2025 at 04:58:52AM -0700, Mao Jinlong wrote:
>> qcom,qmi-id is required for remote etm driver to find the remote
>> subsystem connection. It is the instance id used by qmi API to
>> communicate with remote processor.
>>
>> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
>> ---
>>   .../bindings/arm/qcom,coresight-remote-etm.yaml        | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
>> index 4fd5752978cd..947fe33738a3 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
>> @@ -20,6 +20,13 @@ properties:
>>     compatible:
>>       const: qcom,coresight-remote-etm
>>   
>> +  qcom,qmi-id:
> 
> Why isn't this "qcom,qmi-instance-id" if that's what it represents?

ok.

> 
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      This id is used by qmi API to communicate with remote processor for
>> +      enabling and disabling remote etm. Each processor has its unique instance
>> +      id.
> 
> DeviceTree describes the hardware and firmware interface, so don't
> describe properties in terms of what Linux will do with this value, but
> what it represents.

Sure. I will update it.

> 
>> +
>>     out-ports:
>>       $ref: /schemas/graph.yaml#/properties/ports
>>       additionalProperties: false
>> @@ -32,6 +39,7 @@ properties:
>>   required:
>>     - compatible
>>     - out-ports
>> +  - qcom,qmi-id
> 
> How can this suddenly be required, did devices described by this binding
> up until this point not work?

Without this instance id, remote etm won't work.

> 
> If this is the case, make sure to clearly describe this in the commit
> message.
> 
> Regards,
> Bjorn
> 
>>   
>>   additionalProperties: false
>>   
>> @@ -40,6 +48,8 @@ examples:
>>       etm {
>>           compatible = "qcom,coresight-remote-etm";
>>   
>> +        qcom,qmi-id = <2>;
>> +
>>           out-ports {
>>               port {
>>                   modem_etm0_out_funnel_modem: endpoint {
>> -- 
>> 2.25.1
>>


