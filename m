Return-Path: <linux-arm-msm+bounces-21226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B92698D5E3C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 11:29:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA0DC1C20C94
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 09:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E44F81219;
	Fri, 31 May 2024 09:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VHr3HB5X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0787710F;
	Fri, 31 May 2024 09:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717147736; cv=none; b=OCLuS6yw59p8/z+25clCXl6q+2lZ75ugHp8IdJQw35W4Tj9vyI6pj1UkAZc/O0wktwRgMcd4KYPzFj1XU5kKJ55QEQOBNqz5f5tBzARSAoFHx+RLJp5LDSRi3flgTz7fnEvarLB5PJaG0zROm4LnHjO610buTCLGEp9RQG3f25k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717147736; c=relaxed/simple;
	bh=9oCuOQFx7u1jBmP/TErGJsHNCgkUMtUrw8XUcPgOCKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qAu+OcGnwrS5s0GrRwuuWJ3u/KtwRq7SXFxTb3etkiyppKBn4yvo20Y3xUtC9NAWkl1GoM+3XGzzsE4jLeL2Xu9MVCUT8TPJh71aEx8D0QmxB3+DrZ33KPxw6Gv21c6n4jGR620lEAxv9F1V/imVccDLsUGt7NrhnsJ00RKNe8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VHr3HB5X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V9DGUo019046;
	Fri, 31 May 2024 09:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AAsCoEXvGUpmiI/5pkbUw1nWN0dwQaqzt28nAMngwUU=; b=VHr3HB5X+JRsN6AY
	fg/BsRCn4orzdWSJd8WIJNhonksEpIHt/64uSvqZhrlqYcmNP5Rm/HR9Vom4a6A2
	wrAZNBtCLVHNkL/r6bwqNoY6JhnjDc9IJvlnlXF3CivFRaEa/ZWvkxrJkrBAc3oZ
	HJgwhXQmuv+36hKfGQf9TEMj9VfyV6r9N9DoXC5x8eemJ0G90iXN+2DXyPq3BzOu
	Dh4iX4bGkfmuSVsiBUrJG4rv6wVfZBURD4Wxt8KpZtniWykm0V6RSngolCPko3Ay
	G+ooC34qDXFp0n8CiN7YYfGHyVU0C3zAayr6ZAta9jNAwhBPh9PB76oF3QCXwn+6
	1WR2vg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yf23ss9ev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:28:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44V9Soxx026547
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:28:50 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 31 May
 2024 02:28:46 -0700
Message-ID: <6ecfa381-e8b5-4f4e-a575-83c5a13524d8@quicinc.com>
Date: Fri, 31 May 2024 14:58:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] dt-bindings: clock: qcom: Add compatible for
 QCM6490 boards
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stephen Boyd
	<sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Bjorn
 Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20240318053555.20405-1-quic_tdas@quicinc.com>
 <20240318053555.20405-2-quic_tdas@quicinc.com>
 <31074cea-70b5-4ff2-8cd4-e0f5a4aa6767@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <31074cea-70b5-4ff2-8cd4-e0f5a4aa6767@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DojRryFff2xnhsMaGSdyprAzswBw-VBr
X-Proofpoint-GUID: DojRryFff2xnhsMaGSdyprAzswBw-VBr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_06,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310069



On 3/18/2024 1:17 PM, Krzysztof Kozlowski wrote:
> On 18/03/2024 06:35, Taniya Das wrote:
>> Add the new QCM6490 compatible to support the reset functionality for
>> Low Power Audio subsystem.
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
>>   .../devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml       | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
>> index deee5423d66e..861b41933525 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
>> @@ -30,6 +30,7 @@ properties:
>>         - qcom,sc7280-lpassaudiocc
>>         - qcom,sc7280-lpasscorecc
>>         - qcom,sc7280-lpasshm
>> +      - qcom,qcm6490-lpassaudiocc
> 
> Don't add stuff at the end, but keep order. This applies everywhere... I
> am pretty sure you got such comment from me in the past.
> 

Apologies to not able to respond on this earlier. I will update this 
patch in the next series.

This patch series seemed to have been blocked on the other fixes, so I 
intend to separate out the patches.

> Best regards,
> Krzysztof
> 

-- 
Thanks & Regards,
Taniya Das.

