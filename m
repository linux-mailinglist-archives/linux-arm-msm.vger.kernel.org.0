Return-Path: <linux-arm-msm+bounces-13409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31091872F13
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 07:54:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E003628B3B5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 06:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5245BAEA;
	Wed,  6 Mar 2024 06:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g6k2jHWB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E46F5BADE;
	Wed,  6 Mar 2024 06:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709708070; cv=none; b=oN9263N0Yx0KKQFyKNiYkz8sdjg9ANyjPC2jf8XX7eDf9jw4mZygD6mILJz52cVFfXgi8PBvG9EoB+EZt29jIHnYBi7bEODWeZ3Qpa5aoRul1k0Pi/SH1oZOQ6Lohkpd7jKM5os5VMaEKUzoyED6dD81DzKMkv+zo/VUMIYi2VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709708070; c=relaxed/simple;
	bh=L54KWHnCMQt/B89gam0caH1lzJveuzRgFVV+Ky9TSX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Z8S0jMsIH81qamAYwQFkXrnKz69EDGt/GdEYV5Sqyv4PsRPFYumbT/JmUFfkI+YDFw1Su5Eho7BWh6bw93LIjp6qqnvm2CuyTIFzy6XeFnerwUHJbxfzCIxXs6aiAzHoommDNFfwQ1dvtaIFkWw0hf8xQBunDtnDRC3Dd0bkj4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g6k2jHWB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4265MuoJ019267;
	Wed, 6 Mar 2024 06:54:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Puu71V0GWNlAX1XB2SaCv+2w/uXI5X0Af6a+Tcymx28=; b=g6
	k2jHWBXmFAkEJYGwSzpTWZMo0RPhzsKz6Aitiqb3qTXbKxqcv6F+yRiubs42TiXb
	bHy6jN3nt/PbdLdetPDQtNp+e2SmEEyiC7m+wGCUuixsGKnW8OPECdKRlg3KDenB
	oO8NiLFA/urmyldvDuxZQJ04DydSGSIM5WwXUgudJHtX1gjBbuq/y3M+Qk/mAybc
	j8XAWPYMoDwszkNcs6RdvGeiw7OPOsAWg+AVKH167GdUTRSWNBlPRlbtzFTn1npQ
	vhwhVFhR+O8Q1vqI3xD671xS9uuHZIGznHwe/e9SLL5SVDIE9weP+d4PEb/uznVN
	aS+aXmx2i2jcRRGx+2Qg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wpgwmr9dm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Mar 2024 06:54:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4266sOWD019596
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Mar 2024 06:54:24 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 5 Mar
 2024 22:54:21 -0800
Message-ID: <2152e3ff-b299-4efc-b855-2d8a5827394c@quicinc.com>
Date: Wed, 6 Mar 2024 12:24:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] bindings: clock: qcom: Add "qcom,adsp-skip-pll"
 property
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad
 Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20240208062836.19767-1-quic_tdas@quicinc.com>
 <20240208062836.19767-2-quic_tdas@quicinc.com>
 <CAA8EJpoF7ii59WuY0WaMkdbs3+GE8UFPmbxdvohfjUfwqC4c0Q@mail.gmail.com>
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <CAA8EJpoF7ii59WuY0WaMkdbs3+GE8UFPmbxdvohfjUfwqC4c0Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HB6OcdocWjdmfhByFsQ90l-MhrmF-V1x
X-Proofpoint-ORIG-GUID: HB6OcdocWjdmfhByFsQ90l-MhrmF-V1x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_04,2024-03-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403060054

Thanks for your review, I will take care of the comments in my next 
patch series.

On 2/8/2024 12:29 PM, Dmitry Baryshkov wrote:
> On Thu, 8 Feb 2024 at 08:29, Taniya Das <quic_tdas@quicinc.com> wrote:
>>
>> When remoteproc is used to boot the LPASS the ADSP PLL should not be
>> configured from the high level OS.
> 
> Why?
> 
>> Thus add support for property to
>> avoid configuring the LPASS PLL.
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
>>   .../devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml   | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
>> index deee5423d66e..358eb4a1cffd 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
>> @@ -49,6 +49,11 @@ properties:
>>         peripheral loader.
>>       type: boolean
>>
>> +  qcom,adsp-skip-pll:
>> +    description:
>> +      Indicates if the LPASS PLL configuration is to be skipped.
>> +    type: boolean
> 
> This property describes OS behaviour rather than the hardware. Such
> things are generally not acceptable.
> 
>> +
>>   required:
>>     - compatible
>>     - reg
>> --
>> 2.17.1
>>
>>
> 
> 

-- 
Thanks & Regards,
Taniya Das.

