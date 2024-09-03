Return-Path: <linux-arm-msm+bounces-30473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C33969589
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 09:32:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 208491C23266
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 07:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E5271D6DBC;
	Tue,  3 Sep 2024 07:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bGTZJtR8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13A41CE6F0;
	Tue,  3 Sep 2024 07:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725348631; cv=none; b=EVs7FcB+Gp+5zM7UPnshrKHaFeNUsBgNHitTCJV0Hyf11DxuvciSuZfq1oz4uu3Uy5Ydqt7cucZ9w+eSZ5F+Jbk5YY9AnqiY5xGaqYngPX/3GrU+q6iJok8d0qlh1LsCx4YsJTr4BeHkdioD01VVFKSVJHG7IlrXOBnSqtGXh6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725348631; c=relaxed/simple;
	bh=FQL8+4I3J0aMb+Bg8Af8WE+32XKG96uJyEA6bH70sGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Z7oow8xroNaW+z+tGpoVBmvTDVQWkWCK8KzxoJni7cbHMZLIESulGKTQOsEtF7Jlox39Nu0Kmlhw5O3ZU/EGxi+WE0ZIG0/F1bmU/6G12qKGS/Ba6mmwT31V1lqtP3ILkWkROAJOgADICs9R08+dOvPiAqnLbYa4VyfpS3Tm268=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bGTZJtR8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 482NXddg027125;
	Tue, 3 Sep 2024 07:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xMNo7N8u+Klq9Ajty0axKpZFD9cyAUOWqquZGW4i4fY=; b=bGTZJtR8mrrjKq7C
	yPrg5+SnM1p9a5dN1G2mBEc8FWZhTkjjA0fYml7C2xHQgjldnuNXzT+kAhF5OcNM
	2IKMxuk4Yd9x7Ker44IE141jNskc2FzoCQ1sV41snRh7n68mXfteTBnAKUb5nu6p
	8looIF3TC1sX19Bb5btMhrzE2RQN0hRvE85G1OXC7e0m49P8wclwopP+oFgj5Jsl
	LI521AgF7OssNcC1Zr96m5gD5/P62d/vWiaJ/Y/A/Ue/Bba+y4YQmNecxyGPw6wX
	8isLO73KAHPYOUGh/gvBn7aTSyJ/MIcV0u9ne6R6718qiL6k7QRnNDaxrfHdBMc2
	zWWgIQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41brvexpfw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 07:30:26 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4837UDrT016525
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 07:30:13 GMT
Received: from [10.233.21.53] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Sep 2024
 00:30:10 -0700
Message-ID: <ac1b3ba2-ac57-411c-acdb-69d288d88355@quicinc.com>
Date: Tue, 3 Sep 2024 15:30:06 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: cache: qcom,llcc: add num-banks property
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240903-qcs8300_llcc_driver-v1-0-228659bdf067@quicinc.com>
 <20240903-qcs8300_llcc_driver-v1-1-228659bdf067@quicinc.com>
 <g7fyt57kzynzpux5nea2v22gcuu24asbr54axzms7mhdh4jq5a@xdyqifloofbk>
Content-Language: en-US
From: Jingyi Wang <quic_jingyw@quicinc.com>
In-Reply-To: <g7fyt57kzynzpux5nea2v22gcuu24asbr54axzms7mhdh4jq5a@xdyqifloofbk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: svIScy-1xC1ures7m6vqH_PypRBUBoIS
X-Proofpoint-ORIG-GUID: svIScy-1xC1ures7m6vqH_PypRBUBoIS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-02_06,2024-09-02_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 adultscore=0 mlxlogscore=864 priorityscore=1501 malwarescore=0 spamscore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2409030059



On 9/3/2024 3:10 PM, Krzysztof Kozlowski wrote:
> On Tue, Sep 03, 2024 at 02:21:29PM +0800, Jingyi Wang wrote:
>> Add a property "num-banks" for errata.
> 
> This you said in commit subject and we see in the diff. You *MUST*
> explain why.
> 
>>
>> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
>> ---
>>  Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
>> index 68ea5f70b75f..03241b719c98 100644
>> --- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
>> +++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
>> @@ -56,6 +56,11 @@ properties:
>>      items:
>>        - const: multi-chan-ddr
>>  
>> +  num-banks:
> 
> No vendor prefix? So this is generic property? Then add to some common
> schema with proper explanation WHY.
> 
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      The num of llcc banks
> 
> And what are llcc (or LLCC?) banks?
> 
> 
Will add the vendor prefix and description in the next series.
> Best regards,
> Krzysztof
> 
Thanks,
Jingyi


