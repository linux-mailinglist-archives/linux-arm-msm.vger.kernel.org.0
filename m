Return-Path: <linux-arm-msm+bounces-67336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D18B1804E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 12:41:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A00261C81C24
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 10:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90C49235355;
	Fri,  1 Aug 2025 10:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ApYHJCrr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37AF22DFB6;
	Fri,  1 Aug 2025 10:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754044904; cv=none; b=FaEmBw9xwsvTCCdFEFg7CkSEcLeh1aRoB8jm/T0PhBb3Cy7O+Yy12+RAFjB9I04+qBq/b8KKskCn/rnR2BWyatlOcoQ/GibIy9pZuLNXBd4p9hQkL/hPz+klT7hXHO9k3fhhRStx/ZGqLcyooXWqe4/5n8OX35NsKE96T6zNMoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754044904; c=relaxed/simple;
	bh=5pvFkk4M0D3F7KembLaqQ1XWTFU85kOzY64csmV08IM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SA8DvHVovgoXlex4rCiAesr6lkyDb+rIfCYxG27SVsnKLzjLI8V6OVh0JiwjJC/tZwyUEYOYEGHEAqMxu/rfSmIL3T6B+zn8c5Iw041D/hQKn/JoeB2HaxqQ85vi99Eimaj8GnlI1niyjpbNTIdDuFIMvaSpAo20EsEIlNJ7Qe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ApYHJCrr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5718l7gh018752;
	Fri, 1 Aug 2025 10:41:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/+RdDrgUH+Vdx9T0/jAKO/bQwDPOwb8XbAtxLj4mtto=; b=ApYHJCrrS0ZUjaHo
	Sgs0v7KsHnNlmr4V7Q6QWW4F6EWmq7mcEqqKd6CrC8q5lTakTNPabbQpIG0yG0Yx
	OLZ+KMggBSQ5KouzX8OCJodQzD/nKsLS+DvIM2n/L4dOnyjLdB8pGBQfnQoYgd/P
	30DajWuEFkYtw04DycyMiW9poesRytboKze1UcNMkEaYfdW4kREI4zMVVZtazbci
	iP7vJ4SWmpP4TTKzRPT4fGfuTVHCN5UEsWoEEM/Z020MDOieEpDlyStsVDWNrSAR
	Xj0abnVpqPKfI4PVHx4bgaQFF/9oDJy29IGnhVz2bO6Zv+cAqSHi/WP+aixi6DSl
	tz2aVQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 487jwgg2jm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 10:41:38 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 571AfbBL019403
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Aug 2025 10:41:37 GMT
Received: from [10.217.216.168] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 1 Aug
 2025 03:41:32 -0700
Message-ID: <b43cb2fd-c583-4383-9b2a-c186ac1c4e09@quicinc.com>
Date: Fri, 1 Aug 2025 16:11:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 2/4] dt-bindings: mmc: controller: Add
 max-sd-hs-frequency property
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter
	<adrian.hunter@intel.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_pragalla@quicinc.com>,
        <quic_sayalil@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <kernel@oss.qualcomm.com>
References: <20250801084518.2259767-1-quic_sartgarg@quicinc.com>
 <20250801084518.2259767-3-quic_sartgarg@quicinc.com>
 <98bd97cd-0d34-4bb6-869f-68feec1de68e@kernel.org>
Content-Language: en-US
From: Sarthak Garg <quic_sartgarg@quicinc.com>
In-Reply-To: <98bd97cd-0d34-4bb6-869f-68feec1de68e@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=WvgrMcfv c=1 sm=1 tr=0 ts=688c99e2 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=UzVGX4NoDC1Cv9CGhM8A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 11oSBsGxa4mah6YDsE2f3rjzvtrjavF8
X-Proofpoint-GUID: 11oSBsGxa4mah6YDsE2f3rjzvtrjavF8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA3NyBTYWx0ZWRfX+rqFE58m5D0W
 kPpBDzQwVp2HgxZCBbcml9YUvgmggFvAbsGTxZrAJD2MaMC3kb4LW2zCx7okKVvdsI9NYDpee8r
 goRRcxC4m6Nr4d4GajqGScOswWukkmk8am/WahKe4cYIrX4A6VTNJnsC6PfohmNxxKVgLjnWQO5
 hmgNXd1LrObyM0V8tlFI7O/rES93EjqwEqGcnAtYNMlmYNQcTHXyRpoXvZ20lrGohoC7EhVwTco
 GdwD7qL3T18qO1jppTnzhQaYy1Us3Bxq/6Kon+Hn2fbeF4xAJI7D2doaQ55WPAMDiN2Nt2xamuf
 1yaFbCgAyI75TZAQ1P4vFztcPA4GfIfyfgXCIO6Z2KfiEq367JmO8527w1O4km8dry/se4QOYON
 TmoOULaC3KPTyQ6uJ3CaGZwTsUrv3fUwasY1/b90HQ7V+X5AH51Ddhi78TMrDmb/z1u4p4/W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_03,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=908 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010077



On 8/1/2025 2:30 PM, Krzysztof Kozlowski wrote:
> On 01/08/2025 10:45, Sarthak Garg wrote:
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
>>   .../devicetree/bindings/mmc/mmc-controller-common.yaml | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>> index 9a7235439759..6c2529b976d1 100644
>> --- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>> +++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>> @@ -93,6 +93,16 @@ properties:
>>       minimum: 400000
>>       maximum: 384000000
>>   
>> +  max-sd-hs-frequency:
> 
> Use standard unit suffixes. s/frequency/hz/
> 
> 
> 

Sure will update this name to max-sd-hs-hz in V5.

>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: |
>> +      Maximum frequency (in Hz) to be used for SD cards operating in
>> +      High-Speed (HS) mode. This is useful for board-specific limitations,
>> +      such as level shifters or others where the card cannot reliably
>> +      operate at the default 50 MHz HS frequency.
> 
> Don't repeat constraints in free form text.
> 
> default:
> 
> 

Sure will remove min/max constraints and add default: 50000000 in V5.

