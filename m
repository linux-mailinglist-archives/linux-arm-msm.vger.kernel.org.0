Return-Path: <linux-arm-msm+bounces-31671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA228977829
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 07:03:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB5EB1C24536
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 05:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA347126BE2;
	Fri, 13 Sep 2024 05:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="o4XoWv2E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D6C4A07;
	Fri, 13 Sep 2024 05:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726203816; cv=none; b=gVomYj6jTNZ3E0WKDshy/zYEbDM6U9mh3+0G/IJrwzm9bAIJ4pEh5G/L502I9dhbTPwcmDzOMld1lQ0czWOVsCzGfzHF+cGQdmofGV201Lt89wbDgUmEmZ7GcjOqfQ1Zm619J0MUVfYc4hoTg+jBcMwJjFSixPfchcCKzjjRvBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726203816; c=relaxed/simple;
	bh=YmyPnEl45ACPUN325a0XmhNEugYv4p9LROQs1+Iap0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nyurvO7oj1G+Qz3aPReY5y9ev02HBMQE+//J3wCx/2Y1vEbdVVlHIh7m5WVzN0pAGyZnX7neCYtvkEN0aj7h2E2STbCoQe4R6qMDck2ZeMLO93kMKZrjIQIE8zbLhIXaXmFFdv+wXAZAtYEqVnEONk045PhnSZDGxPUjwcC3itw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=o4XoWv2E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48CMBIgC004278;
	Fri, 13 Sep 2024 05:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SM52+lia3XFLtAORVvalfea5pGsmbBS2wnhmx0Ivpco=; b=o4XoWv2E4pI9EHEk
	hAVPg6emCyf7X0FtHuIOZSMYv0M+eJl+SNF4Hh7D1igPJDxrMQ/P41AMni91NTrY
	ZcJnwI6D8IFLDCPj+1YSR2FCe9OYa3oVhuuBFty6rMXJdeM1WsFXz/vokOoUOhwI
	co/L/zy/XcCIUAkBPYan98Xa2bT8NNoMg1X4kYcZwFyLOF+JZdJIKid8ygMndtT5
	J4PZE3Us6Rh80vr6k3kTuwbw5hrBizi4zyhHj4CXGfHjiLq7JAi8h6SIGs2beI8y
	NzIzprKNB3ComKK4j6WFRmUEdR0XCUXax8oOqhn539xFXV4D0rWy2sNdraqZh8gO
	3s23Dw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41kvma35pg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 05:03:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48D53Sue023984
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 05:03:28 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Sep
 2024 22:02:55 -0700
Message-ID: <40dc7c1a-9f27-45a3-ad8d-0e9989894574@quicinc.com>
Date: Fri, 13 Sep 2024 10:32:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] dt-bindings: clock: qcom: Add SA8775P camera clock
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>,
        <quic_imrashai@quicinc.com>, <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com>
 <20240816-sa8775p-mm-v3-v1-3-77d53c3c0cef@quicinc.com>
 <57672tyb6pij3h7ensq4itbhnw3lr4wahfttc2fdcj4twbqpta@pwskxpet4nsh>
 <5d6c455f-7fbc-4e2f-a537-907f26a4ef59@kernel.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <5d6c455f-7fbc-4e2f-a537-907f26a4ef59@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vSRUChjvVMahuxidvG7zCRblY2q0Tx9A
X-Proofpoint-GUID: vSRUChjvVMahuxidvG7zCRblY2q0Tx9A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 mlxlogscore=920 bulkscore=0 priorityscore=1501 adultscore=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409130033



On 9/6/2024 5:54 PM, Krzysztof Kozlowski wrote:
> On 18/08/2024 20:02, Krzysztof Kozlowski wrote:
>> On Fri, Aug 16, 2024 at 12:01:45PM +0530, Taniya Das wrote:
>>> Add device tree bindings for the camera clock controller
>>> on Qualcomm SA8775P platform.
>>>
>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>> ---
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Un-reviewed.
> 
> We achieved consensus allowing sa8775p to stay, but now Qualcomm changes
> point of view and insists on new approach of dropping sa8775p. Therefore
> this change does not make much sense in the new approach.
>

Krzysztof could you please re-review the patches again? As I understand 
the that Qualcomm will support both SA8775p and QCS9100 in Kernel. 
There’s no plan to drop SA8775p support. These two SoCs will keep 
compatible.


> Best regards,
> Krzysztof
> 

-- 
Thanks & Regards,
Taniya Das.

