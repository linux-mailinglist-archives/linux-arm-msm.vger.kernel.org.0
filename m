Return-Path: <linux-arm-msm+bounces-27506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E4A942B61
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 12:00:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8271B23CD5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 10:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B139B1AB51C;
	Wed, 31 Jul 2024 09:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BspajmhJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE6918DF9F;
	Wed, 31 Jul 2024 09:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722419989; cv=none; b=n1Q+b6nhz4DCC/JenBAfKkijlCq8+of84NT7LhSkczNVVLR+dAjXYW3ometm5hf6bmHNnXDWJr6pFGFSMxtzX7wnF2YEL0YZ2PGYxxGUOB8Fu9Nf16F4utFBfLt76jOBNauO04hik5YSzcNijs+9mgpzLmwN8w0TjczttHnaaDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722419989; c=relaxed/simple;
	bh=CR54JQjLO7K+orD25I2mqnuNLtjgDhVHMk1eBZ7uSuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FMwGahY4Nrfq7RXOIAl64VlaF2FQC9PVbGgwptuc1Q3GirT9FFeMsfKhuzYPedxaB4o43feFkgC03vRixBk/1AneedbssEamEE1IN9knadNlP6aBu0j+lfELOg4l0U5TNwujm4Am3jNEc7XqxJ+nHbCPZ+MduKtSv8I6XlfhdgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BspajmhJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46V74kCO012798;
	Wed, 31 Jul 2024 09:58:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fRi1qWS3I1/J7lbxMVZucJ6J1N0+O71myL70AfynqCQ=; b=BspajmhJEKSVH1fz
	UqG+DUmiM/rQjVHLoD+xP3k0F9uZ6YZh55nMbTOdA9zIDTXzXopQX03nYcH43G+W
	IvrilQDetzkRi2DanyJhh5jcgGH9Ko4XAAJ36CDD4FneTP0cr5Fe6qT3Ky4WmFS2
	yPgV8k+0Kdq8q6uqFWs+dAm1ZoLj2qrJqhpQO46ZFYyVJe4oq6NvAAKR/FWTpQIr
	4sgH0Lyz486Eu087jO6R9EeX5kbCwoZQmeSFa20DMNHGNiVvf11A6FU5Gu+pWDOa
	htsJOfAvV5VeaARh3/u8IcVl3NjuMoPWubeEnFTU3nTCUqMilAdoPjuQohQ8978R
	PB1Arg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40msneam6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 09:58:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46V9wtC3031265
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 09:58:55 GMT
Received: from [10.217.216.47] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 31 Jul
 2024 02:58:49 -0700
Message-ID: <7da6d498-d050-4de2-9f97-36bf9458806b@quicinc.com>
Date: Wed, 31 Jul 2024 15:28:34 +0530
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
 <d139339c-32cf-4804-87f8-8fd4588cc925@linaro.org>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <d139339c-32cf-4804-87f8-8fd4588cc925@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Cyh9xmAlETNLcgr8PBlS5exwZ4W0afBy
X-Proofpoint-ORIG-GUID: Cyh9xmAlETNLcgr8PBlS5exwZ4W0afBy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_07,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=773 priorityscore=1501 clxscore=1015
 spamscore=0 mlxscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407310073



On 7/31/2024 12:00 PM, Krzysztof Kozlowski wrote:
> On 30/07/2024 05:45, Jagadeesh Kona wrote:
>> On SM8650, the minimum voltage corner supported on MMCX from cmd-db is
>> sufficient for clock controllers to operate and there is no need to specify
>> the required-opps. Hence remove the required-opps property from the list of
>> required properties for SM8650 camcc and videocc bindings.
>>
>> This fixes:
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@aaf0000:
>> 'required-opps' is a required property
>>
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@ade0000:
>> 'required-opps' is a required property
>>
>> Fixes: a6a61b9701d1 ("dt-bindings: clock: qcom: Add SM8650 video clock controller")
>> Fixes: 1ae3f0578e0e ("dt-bindings: clock: qcom: Add SM8650 camera clock controller")
> 
> Also, these should be two separate commits. Each fix for one issue is
> one logical change.
> 

Thanks Krzysztof for your review.

Sure, will split this into two separate commits.

Thanks,
Jagadeesh

>>   
> 
> Best regards,
> Krzysztof
> 

