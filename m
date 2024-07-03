Return-Path: <linux-arm-msm+bounces-25196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BAE926765
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 19:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1C5F283DBF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 17:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0B601850B8;
	Wed,  3 Jul 2024 17:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Y3aHrPsx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18F017C7AB;
	Wed,  3 Jul 2024 17:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720028837; cv=none; b=Lg8rM27poiKhaiJeAZEKzYOq9KEKDhyBLzN3auoJPF4mUQ+ZBTtztp00XozU18sMei7SK74wcvXx5sQ7iDjEe2HV+fSDvdravJE0MQTBfO8HmVYz7HGIel2RLWBEAp+O+6pNyjee7OE/mUOL/1cTiO912Vlm5BZS2zOSd0ykyhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720028837; c=relaxed/simple;
	bh=0BOoSN/vwKF5iPbUzVkATDPa38qHBiYNj4pLU49zhPs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=QVEfhMnJfFPh6VfnozlAK2VBJKr1V/5bPLffD4ZK+4EMtLML5BaXezZnDZ5N+OhfAGbFH3ttvdh0WWyj0BF3V+jQnnh/cgDqvOQx7poxvyOVgR9wOtvGoVn3BDCx0hkzx0TsdwH3XqANhVQh8Ej5Nktxtf/B9tOVEZYWez7c9xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Y3aHrPsx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 463Ec3eS023282;
	Wed, 3 Jul 2024 17:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K8kXkUMRuS5ZJkoOu4J5Www9AwgUv/jNADsGdmLz0Q0=; b=Y3aHrPsx9irOOfYH
	IHk9HNyLrCH8FqWyhimSTUQjWhPKx93NlkUgNGTLeBG0pMccoS1aiChgkpEWyfT+
	SEQT3I2l6A1hfXk+czHC/bc1hld1tfy86XBgL+CyQrjEB9fZnXQoS+PA+N93BT25
	9hpZOxMZYSi79tZx0fhRNZS2Tr41Nf4duqaEuKsKIvGrZaCKtsR6EkLhRF200Xf8
	8dqgA3U0y8j4OSWBmvXLOjQGV2IgPynZT/lyW22kgu4Ts+hpzUw+CtqwKj/EkfOw
	537cHsc/0hmuf+v8jxMOWeSvQiLmXocwEi2dlawpIA8QT68IH/wR8YEawRaXJEIe
	3+cagg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4050cy9qk8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jul 2024 17:47:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 463HlAFU021100
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Jul 2024 17:47:10 GMT
Received: from [10.216.27.55] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 3 Jul 2024
 10:47:04 -0700
Message-ID: <8b19c43e-6b13-4b09-9498-ee0b24749d3f@quicinc.com>
Date: Wed, 3 Jul 2024 23:17:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] clk: qcom: Add support for Display clock Controllers
 on SA8775P
From: Taniya Das <quic_tdas@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_jkona@quicinc.com>, <quic_imrashai@quicinc.com>
References: <20240612-sa8775p-mm-clock-controllers-v1-0-db295a846ee7@quicinc.com>
 <20240612-sa8775p-mm-clock-controllers-v1-6-db295a846ee7@quicinc.com>
 <37bbd466-742a-4a23-b3f7-97f8da109608@linaro.org>
 <053e047b-7594-48bc-ac1b-2368c0c8f1cc@quicinc.com>
Content-Language: en-US
In-Reply-To: <053e047b-7594-48bc-ac1b-2368c0c8f1cc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8H2dPhFn5YhAlR8i7vPvW68GStYIusos
X-Proofpoint-ORIG-GUID: 8H2dPhFn5YhAlR8i7vPvW68GStYIusos
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_12,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 mlxlogscore=955 priorityscore=1501 adultscore=0 mlxscore=0 impostorscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407030132



On 6/21/2024 10:03 AM, Taniya Das wrote:
>> Please merge this into one to save on boilerplate, take a look
>> at dispcc-sc8280xp.c
>>
> 
> I did take a look at the dispcc for SC8280XP before posting the series, 
> but it kind of looked tricky to add fixes for a particular dispcc.
> Debugging could also be difficult in my opinion.
> Though I understand that we are trying to optimize by re-using few 
> common structures/probe but from clocks side they are all redefined.
> That was the reason to keep them separate.

Konrad, are you good with the proposal to keep the two instance of 
display clock controllers as separate drivers? As I looking to post
the next patch series, please let me know your comments.

-- 
Thanks & Regards,
Taniya Das.

