Return-Path: <linux-arm-msm+bounces-39785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DF29DFB46
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 08:32:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1C0C2821AF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 07:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B751D1F8F0C;
	Mon,  2 Dec 2024 07:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GVwaX6KE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C26E481A3;
	Mon,  2 Dec 2024 07:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733124761; cv=none; b=YiZ8KSGVOTK/RehD3qPw0RufoSwR4HDwinbhA7HLAwmcE1itqpTIK4L4Rv8+5Q/Tpxw6YmF32ZFHWxW0O5m1LEed0IxkDglgFk3Y+nJYUlCSo0GcHInlObdmC95pK9IA09eWcLvAlrDPOiqPbqmihkbuJ8zugBZdE6Dgjk6i5LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733124761; c=relaxed/simple;
	bh=JjTiKPnCHoC5tfaV+fnNqfRLY1eC1Bf7R6Tf90sio4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZznVfi8q2UXXjSaw3fn0HzlCZ7pT8PU+rRDxm9cy9YUOVCxupAk8BGr7tyb9kDYnbBWUk2mK+4pghH9nTJWVbbItQKC3Hw4jQRiXCD1IpeTCaUdZ73MMgskEFW+IbVK/It48ssErUA1a/Ytjph8VN9pXLkxrz/N/mQ2HcxC4HXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GVwaX6KE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B1MuuC0010949;
	Mon, 2 Dec 2024 07:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ak45H3tvMqqq2of6Pf4EuEl9efkuZziVYvV5Zpa/NrY=; b=GVwaX6KEgzUbijNX
	smwGd1S2v094orJ4VLMR1vGmB1YJ77TekhvgRrU0P7QO/zEUQSMuVInNdUhvLqtt
	gRx4QETDhJ5qN5VqzeZeI7W+wiVpx0oaidSt7uAkaqkv5Ug+M/tG3jjBOMtkN5ud
	EeWX9kUSCDDvnbQF34VH6aBc4DpA4TinFgWdXczTqoUL8xJOLjjpPntEY3W0Iex3
	rcB9S34z0iO/BNSOEO0ji/cr0rXYFG0PrDM7DTYjqRrHvSM/hZcLKoTGqbkLUrch
	h5yFBEAQG9gFYFmLur9NyM8xaxVKjzgCo2Bh8CnOEBvFIPVgT+p1RbWee+kndVq5
	3A14tQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437r2mv0g3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 07:31:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B27VqbA013854
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Dec 2024 07:31:52 GMT
Received: from [10.217.217.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 1 Dec 2024
 23:31:46 -0800
Message-ID: <77a134d6-9226-4c49-9c4b-9986e5296805@quicinc.com>
Date: Mon, 2 Dec 2024 13:01:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] dt-bindings: clock: Add Qualcomm QCS615 Camera
 clock controller
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>,
        Abhishek Sahu <absahu@codeaurora.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
References: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
 <20241108-qcs615-mm-clockcontroller-v3-3-7d3b2d235fdf@quicinc.com>
 <a6926e47-0344-4996-b330-cfcf3e7b5f31@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <a6926e47-0344-4996-b330-cfcf3e7b5f31@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MYOM9Ug_7GXip_ZWOik6AvziOkrT_utc
X-Proofpoint-GUID: MYOM9Ug_7GXip_ZWOik6AvziOkrT_utc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020065



On 11/8/2024 5:58 PM, Vladimir Zapolskiy wrote:
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,rpmh.h>
>> +    clock-controller@ad00000 {
>> +      compatible = "qcom,qcs615-camcc";
>> +      reg = <0xad00000 0x10000>;
>> +      clocks = <&rpmhcc RPMH_CXO_CLK>;
>> +
>> +      #clock-cells = <1>;
>> +      #reset-cells = <1>;
>> +      #power-domain-cells = <1>;
>> +    };
>> +...
> 
> would you find it possible to merge this binding into the existing one
> qcom,sdm845-camcc.yaml?
> 
> Those two are very similar, sdm845-camcc requires clock-names though.

Clock-names were mandatory during SDM845, so I moved to add the new 
bindings. Please let me know if you still think I should merge it.

-- 
Thanks & Regards,
Taniya Das.

