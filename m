Return-Path: <linux-arm-msm+bounces-33185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0599917C2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 17:26:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0639B1F22DEC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 15:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E26DE15533B;
	Sat,  5 Oct 2024 15:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kiDLLgQd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A25154BE0;
	Sat,  5 Oct 2024 15:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728141971; cv=none; b=e2qEz06lhpnbf9QKNPoJhC7a/pNd14gS29Q+USSAAjLZBXEECn6Tad3BZpSzQgSSnCbDtjGg0jUvIPuJDCFfQjogOi1eb5jj+XflGJdQ/JE5z+BinkhQiq24pl3h2frMge58dojms68O5zWOvWtpznAGtX76CCFWw+7jeBfY7ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728141971; c=relaxed/simple;
	bh=rTovK59roYa4Df258P/59M0Z2NqDIMAJC86yU/KWqXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QqK9mEREDn9lJFQhLSl91zgwBlUDBI3Chnxxq40sGOxHbzWGpoLcXDmyhJevndL353W6qbnx1tOM5pRtwXceigW23jzP/wtI1KkJQdXk+yqM/snKeXzmBaSu8YjQAMs0NuVt1XjrCYI5w63J1ojDkyYJhLqcieu3CLUu9IAK07U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kiDLLgQd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 495COXDl014328;
	Sat, 5 Oct 2024 15:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/0ZK09A8+iNllHsQ5RUQhUKR+sdGbVMTPWawpop5zmk=; b=kiDLLgQdbWGVfFSJ
	FfiCBaIFO0gfMmCvbAhOJbqWJeX+b4d6J7qp/rXgEiVD363BZ65fRiJjRZShWHGK
	1IBvXlVw/if1wXG0zJqgH/I15XR9rAqGsAhKLQy9gGHIGLHJ9Q+MK30RC80liCAd
	sJ7RZWxxSpx1DWBc25t61Jvn8DrnGc19YY1nSTJAyBaPeDTxM/2vYaJiifGdAt+F
	ArjUPgqr2opiek+BceoccU/bBXGLtL68JfsfdBofRzCB/82Mc+MSVpAF+8keyrLG
	LmLai9w/oSdsH4ng+IbWauiB36PtSm9Ap1xUULd0f1NOz+x80fMr0nCdnuPqU0Ku
	XiAL3Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xv88qgu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 05 Oct 2024 15:26:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 495FPxig031590
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 5 Oct 2024 15:25:59 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 5 Oct 2024
 08:25:55 -0700
Message-ID: <d07c709e-9040-6b14-634b-f2b62c47e786@quicinc.com>
Date: Sat, 5 Oct 2024 20:55:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add Snapdragon Devkit for
 Windows
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <krzk+dt@kernel.org>, <robh+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <conor+dt@kernel.org>,
        <abel.vesa@linaro.org>, <srinivas.kandagatla@linaro.org>
References: <20240911073337.90577-1-quic_sibis@quicinc.com>
 <20240911073337.90577-2-quic_sibis@quicinc.com>
 <6a7b60c4-379c-4251-a158-5d9986f37797@quicinc.com>
Content-Language: en-US
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <6a7b60c4-379c-4251-a158-5d9986f37797@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: oE_kpwqEhaTaNpYcWRujBhYlNmTDaAa8
X-Proofpoint-GUID: oE_kpwqEhaTaNpYcWRujBhYlNmTDaAa8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 clxscore=1011 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410050113



On 9/11/24 21:14, Jeff Johnson wrote:
> On 9/11/2024 12:33 AM, Sibi Sankar wrote:
>> X1E001DE is the speed binned variant of X1E80100 that supports turbo
>> boost up to 4.3 Ghz.
> 
> if you respin, s/Ghz/GHz/

Thanks for taking time to review the series.

Will fix it in the next re-spin.

-Sibi

> 
>>
>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index 5cb54d69af0b..6a8fc031e51f 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -1049,6 +1049,12 @@ properties:
>>                 - qcom,sm8650-qrd
>>             - const: qcom,sm8650
>>   
>> +      - items:
>> +          - enum:
>> +              - qcom,x1e001de-devkit
>> +          - const: qcom,x1e001de
>> +          - const: qcom,x1e80100
>> +
>>         - items:
>>             - enum:
>>                 - lenovo,thinkpad-t14s
> 

