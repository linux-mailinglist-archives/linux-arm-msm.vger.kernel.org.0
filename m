Return-Path: <linux-arm-msm+bounces-25984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5825292E995
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 15:33:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 029C51F21245
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 13:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4CB515ECF9;
	Thu, 11 Jul 2024 13:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eKmpcDrH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A6F15ECD6;
	Thu, 11 Jul 2024 13:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720704834; cv=none; b=shrAOCH02lOIsmIt6akFZMgDYG1uPCmv0YZTJH3qtrijTuTeLDU67urFch5Zl8ndU4t2ZVeWs+Bobu9TQJbbF9vwwYS2H8p0gxks2N8wWsw0dfGX2HgueIwYuX0c3uw52MFXoXcs4WUWrpUqqziS8MxlxPQrznRyQg9kyW49bPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720704834; c=relaxed/simple;
	bh=Q0uJNTpk2Imumg1owNbTczldmVgomp8l5jwPmlVdno0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PI+t7nYSyyoTCYNE9M7j8OyvO4tWHcPh8FQVhIkkiakAz/auzVeDrC5i4o1k6kLWxdEJ/yGerW6sNXimYm3sxu3VprFzDuuI9zXRWkaquiE4Oj9DjB/Pnu6uWY61Uwt3y7WosAlJZQAEa7i+x79A5OGDRGfkTvfdhjNlQtTPaR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eKmpcDrH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46BD2sUp017917;
	Thu, 11 Jul 2024 13:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CVa3k0i2OsR9Z5jhEKXiC8fF51xuj5g9e+59ICrlh4Y=; b=eKmpcDrHiub7sM00
	omL44P1Rvg18kEKOoGMH8s7m3dXr7H3zi1EaJ78npFm9XTgnw6KYFMo02jYO4WHK
	KOzC84mHy3XOx11AwqTN+Tqoyt1k35FjsxAbHnebHahD6f3EnbfqBqQfGbYJXEuE
	MVQ8i1zZGldRy3irh3EYsdKqadcomV0W4ld3/+pPPg6LDtWeM/Z3uE8FZWgm++J9
	x95UYhWI4EUeOHEO/vB7G4pUYFujKDi9YHL6M4FiztV+J9Z4IE1dCRoM2BWPDWi/
	t/gY0iGOasECL9PDrAof1CZ4BjTPZgY9VM5EAgFLZHqjM9FSMcTPOnOMQOVzXho4
	aOxdaQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40a8uhs8qy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 13:33:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46BDXgDk030452
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 13:33:42 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 11 Jul
 2024 06:33:38 -0700
Message-ID: <0e9ddeba-ca2e-6f92-dde0-b74629928864@quicinc.com>
Date: Thu, 11 Jul 2024 19:03:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC V3 2/4] firmware: arm_scmi: vendors: Add ARM SCMI QCOM
 vendor protocol v1.0
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, <sudeep.holla@arm.com>,
        <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_rgottimu@quicinc.com>, <quic_kshivnan@quicinc.com>,
        <conor+dt@kernel.org>, Amir Vajid <avajid@quicinc.com>
References: <20240702191440.2161623-1-quic_sibis@quicinc.com>
 <20240702191440.2161623-3-quic_sibis@quicinc.com>
 <2b278a27-f527-448c-99b5-fc307d792127@linaro.org>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <2b278a27-f527-448c-99b5-fc307d792127@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6az48Wt6plrdIL0jKBmYxUdXEWZ_51DX
X-Proofpoint-ORIG-GUID: 6az48Wt6plrdIL0jKBmYxUdXEWZ_51DX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_09,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 mlxlogscore=946 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407110097



On 7/9/24 15:40, Konrad Dybcio wrote:
> On 2.07.2024 9:14 PM, Sibi Sankar wrote:
>> The ARM SCMI QCOM vendor protocol provides a generic way of exposing a
>> number of Qualcomm SoC specific features (like memory bus scaling) through
>> a mixture of pre-determined algorithm strings and param_id pairs hosted on
>> the SCMI controller.
>>
> 
> [...]

Hey Konrad,

Thanks for taking time to review the series.

> 
>> +/**
>> + * qcom_scmi_vendor_protocol_cmd - vendor specific commands supported by Qualcomm SCMI
>> + *                                 vendor protocol.
> 
> include the word 'enum' or:
> 
> warning: cannot understand function prototype: 'enum qcom_scmi_vendor_protocol_cmd '

will fix it in the next re-spin.

-Sibi

> 
> Konrad

