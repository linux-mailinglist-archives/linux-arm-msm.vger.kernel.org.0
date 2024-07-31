Return-Path: <linux-arm-msm+bounces-27507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50706942B82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 12:04:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F45BB24644
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 10:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21AAC1AED32;
	Wed, 31 Jul 2024 10:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PrO+fFf8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB401AB520;
	Wed, 31 Jul 2024 10:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722420128; cv=none; b=TWTEEfCJdcq1NjC0bXB+rHBWNP9jTBwgq3q1OkkWtjW8MxS46A9bzwyl+nTBegMAhBgm3Zb05xxbqQsmw5T5vmLbUq8FVFFtmDLidhaiiw5+TUscrIiGEZvpM0FmZJREvOIJa9nULvBe0I53Oz0aiKXBTIp4Tv2kW168gWKYR7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722420128; c=relaxed/simple;
	bh=fNL6J3gruPoAz9RrtXEOWbhT4gbwezlFWCSBfnTPmws=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZZVAOhyVYy1CdXaGlag4N1Jmxw0yL1IA+4KiHvv/n2FMJWei38hcy0rhH1uZEWYCq3Qs3nPK2Xpn89n3iUM46RIYp3A4BbFbhuOU68C2hHrO//zVfSPowgMpa/rS+VyVohyl1YJsI9HvarCXHcsChtuKWxivE16SBEDnLdcu4Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PrO+fFf8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46V5swoF019227;
	Wed, 31 Jul 2024 10:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eUo+XsBh2F7oq/ik4Tf3xjN3GW8On+vNp4e6MUkKoZY=; b=PrO+fFf8cT991lIm
	jzmZbUGW7gWYmvpNucOS6pj+MmbzFlLt2I5qPVBiJ8I0T2Eu5kVBDxfcejJnGcmM
	Vkfrx+7+hS5Uw/1jomRAX7Xx2QXfFi2dYAM5ReP/iwoq7D4Ig5tn7ae/IStNoaAB
	iwsOOXoc/1xFHQZjHzsm8JODqSpjUow3Wpnd6ObGxDX4xkHd/3PQOs1dqnMM3cNM
	xoFSAzk7NocLDQzfI749blWYjrsVXvVBCjG5OJFucNPluEInH/foDFIOIot5taZA
	vZFJvz4BFeTqSwCGAkkw+XPWZTiB5Kj81RXZl3qWNU5AT4p3O1JCVZcaMmz8ZoX5
	qmZ9cQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40msneamkb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 10:01:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46VA1woQ020568
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 10:01:58 GMT
Received: from [10.217.216.47] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 31 Jul
 2024 03:01:53 -0700
Message-ID: <8ca233d6-78be-49f6-92f9-a04bc98adff0@quicinc.com>
Date: Wed, 31 Jul 2024 15:31:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] dt-bindings: clock: qcom: Remove required-opps from
 required list on SM8650
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        kernel test robot <lkp@intel.com>
References: <20240730034552.31271-1-quic_jkona@quicinc.com>
 <c3671b29-d860-4374-80fe-c284da4ac300@linaro.org>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <c3671b29-d860-4374-80fe-c284da4ac300@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Xlrpwzo7auuP2ZAh-kJGsxoIrPaySlDs
X-Proofpoint-ORIG-GUID: Xlrpwzo7auuP2ZAh-kJGsxoIrPaySlDs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_07,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1011
 spamscore=0 mlxscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407310073



On 7/31/2024 11:57 AM, Krzysztof Kozlowski wrote:
> On 30/07/2024 05:45, Jagadeesh Kona wrote:
>> -
>>   properties:
>>     compatible:
>>       enum:
>> @@ -57,7 +54,24 @@ required:
>>     - compatible
>>     - clocks
>>     - power-domains
>> -  - required-opps
>> +
>> +allOf:
>> +  - $ref: qcom,gcc.yaml#
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,sc8280xp-camcc
>> +              - qcom,sm8450-camcc
>> +              - qcom,sm8550-camcc
>> +              - qcom,x1e80100-camcc
>> +    then:
>> +      required:
>> +        - required-opps
>> +    else:
>> +      properties:
>> +        required-opps: false
> 
> 
> Why would required-opps be invalid for SM8650? What if we want some
> higher opp for some reason? The point of v1 and v2 was oonly to require
> required-opps on certain variants, not to disallow it in other cases.
> 

Thanks Krzysztof for your review.

Yes, agree, will drop the else part in next series.

Thanks,
Jagadeesh

> Best regards,
> Krzysztof
> 

