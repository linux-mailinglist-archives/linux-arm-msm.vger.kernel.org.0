Return-Path: <linux-arm-msm+bounces-71993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F40BEB4355F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 10:18:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 375E41C836F4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 08:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF762C0F61;
	Thu,  4 Sep 2025 08:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VmUKD6g3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198E71FAC34;
	Thu,  4 Sep 2025 08:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756973829; cv=none; b=mh+sgmRaXj1l2ftw/ru/+bGN6j1jgCOOeuj2FQ1D5yZM80cLsJKqx77FvHGLjioaEVJqsSAO6Pu/pxbLsYe3JbYj0ovgobWKhtfLavLuTE1Aeu3lDY+Gh39sQIGGfHKgtMdyspnkI3ciyD9Brv4TMbROtBq5bWeZZzZqrpbNxlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756973829; c=relaxed/simple;
	bh=sUo1K1JYYYYiyS3al7peka2mL8pmCeQeuTW9rgU6C6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qDY27z8wtpm04JEnB248FsZP74brkvaTWIpvirhR+o50h0XCghXFVdN1sb93425pC1glcsTxCT4X2QpQ4I//1ebJ8dxsXT9QzlZ2BmEkrjeBzzWVKVAPUlJyXgxoncyqiYTTcbmUOwKJm3/U96R6qLrtRyrYuXkyWH2wJLB45Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VmUKD6g3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58409KUk018990;
	Thu, 4 Sep 2025 08:17:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eJnKLzuSb9XK3gUUNtVMz6as2hCFKkooRBStRshb2Fk=; b=VmUKD6g3rVm73Ji9
	t+hGqhw6RLX7VKVB01iB25pRmJ7MiCh72aDh2NwObwhoXmOWEnusayM7dJAJhXUE
	jrAygt5rux8agz0V96YC3PiC1mqDPh+tErB/FLeMhsG6A+RsQA9Fmi8POLscUz5w
	qxSFn61Ut+dO86rvcLYTbDdb0PFge7iokyIUBCQNpIM279vcnyYUSsr+kef01KyN
	KXDwFYyG+UeygHoyBT1jeEkYm/rSP81L1An2t4JL/9jWhoFKxN1Csl8Z0QJnLrur
	2RTBqdtXw3zagODA5hQmYHBg40UlfbjXLFxMejEkQ+0QLdcRSLDf9RkzQjpzM5Z7
	XkGogQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk96k9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Sep 2025 08:17:04 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5848H38I026174
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 4 Sep 2025 08:17:03 GMT
Received: from [10.218.0.120] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 4 Sep
 2025 01:15:53 -0700
Message-ID: <c9cd6cf5-2053-4d0e-a1c3-85bdc9046390@quicinc.com>
Date: Thu, 4 Sep 2025 13:45:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 2/4] dt-bindings: mmc: controller: Add
 max-sd-hs-frequency property
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter
	<adrian.hunter@intel.com>, <linux-mmc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_nguyenb@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_pragalla@quicinc.com>,
        <quic_sayalil@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <kernel@oss.qualcomm.com>
References: <20250903080404.3260135-1-quic_sartgarg@quicinc.com>
 <20250903080404.3260135-3-quic_sartgarg@quicinc.com>
 <20250903203928.GA2663015-robh@kernel.org>
From: Sarthak Garg <quic_sartgarg@quicinc.com>
In-Reply-To: <20250903203928.GA2663015-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ajs04VdXb5_W65dPIUkH-fGmoiyQk62V
X-Proofpoint-ORIG-GUID: ajs04VdXb5_W65dPIUkH-fGmoiyQk62V
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b94b00 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=WxtcERbi65Hnnijj8B0A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfXyTDZ4EHgz9Qd
 62zrCenVzLQuhTA3+e4bTm36visgWJy8bARPkBroPCqMkzKGNLIVW4cyz4ztdOooNEHduBkT/bV
 rtLKnoOY7jFFJZ79R2j8EHdlKWIrOvuOUB1YoDNonM0sMDEQX3nxmbLHCN7Wz09H2Cbfw1me502
 cKCI3Brp5Qn42oc8Pjat9V6V1UIpjVLzvTmiXdPJxHpH20bPJzV8kxwSVMI+Wqz5tioJGNs+Dx1
 7TfFvXBeVj2bCwiR8oimGcvSmaDOjN1BL44NNzsc+m53ecRnq+lCAQ7r3Ki5aeUWHdP+t+PliQ9
 BVhRqrTQy1dpmS4tCdW4mWKHfZOuIKqpYG7eXl7JurmrGdlfBT7ozUj+QM+LasvzeGFH2VHuosI
 KuzRe1gb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042



On 9/4/2025 2:09 AM, Rob Herring wrote:
> On Wed, Sep 03, 2025 at 01:34:02PM +0530, Sarthak Garg wrote:
>> Some platforms may require limiting the maximum frequency used in SD
>> High-Speed (HS) mode due to board-level hardware constraints. For
>> example, certain boards may include level shifters or other components
>> that cannot reliably operate at the default 50 MHz HS frequency.
>>
>> Introduce a new optional device tree property max-sd-hs-frequency to
>> limit the maximum frequency (in Hz) used for SD cards operating in
>> High-Speed (HS) mode.
>>
>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>> ---
>>   .../devicetree/bindings/mmc/mmc-controller-common.yaml    | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>> index 9a7235439759..d6b785cb2bd9 100644
>> --- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>> +++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>> @@ -93,6 +93,14 @@ properties:
>>       minimum: 400000
>>       maximum: 384000000
>>   
>> +  max-sd-hs-hz:
>> +    description: |
>> +      Maximum frequency (in Hz) to be used for SD cards operating in
>> +      High-Speed (HS) mode. This is useful for board-specific limitations,
>> +      such as level shifters or others where the card cannot reliably
>> +      operate at the default 50 MHz HS frequency.
>> +    default: 50000000
> 
> Why doesn't max-frequency work for you? I would think frequency limits
> wouldn't really depend on the mode.
> 

The reason max-frequency isn't sufficient in this case is that it 
applies globally across all operating modes of the SD card interface. 
However, the constraint we're trying to address is specific to 
High-Speed (HS) mode where the default frequency is 50 MHz.By 
introducing a mode-specific property like max-sd-hs-frequency, we can 
target only HS mode without affecting the capabilities of other modes. 
This provides more granular control and avoids performance degradation 
for other modes.

>> +
>>     disable-wp:
>>       $ref: /schemas/types.yaml#/definitions/flag
>>       description:
>> -- 
>> 2.34.1
>>

