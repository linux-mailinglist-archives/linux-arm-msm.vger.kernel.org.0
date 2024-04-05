Return-Path: <linux-arm-msm+bounces-16578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A8E89A3AC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 19:45:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A1E92854A7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 17:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66199171E41;
	Fri,  5 Apr 2024 17:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BTPFHhUk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11FA17109C;
	Fri,  5 Apr 2024 17:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712339151; cv=none; b=piXQTSZk/gaIuMBEesWdi697wraBmBoRj7CPhfKCiySj8SpzDWHtfDSpjXZc0+aR1MLaEpNQwkfPAHrE3zQxD+uzBHQyPfkOzTanR0V6fCwzA77eoWmnNj1TilrihxFK/aAENnONTkP/SKknPKfxwbizgqtCRiaMgr/OixDI/bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712339151; c=relaxed/simple;
	bh=p2wlUHkzwT5KE0Jl2f51zUQMFnnMo4lcaaHLE08PYxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WZEFEnvdbDvBXXkbLa33ISEr/0A1l60zpaUV5uOY2NGXEN9pEg45Kb7j8y+yQsnMPY0VxQj1Xg4Hxp/I/S65CfwB+OkSqd54u2cPk0nT3KEHwpiCamFB7sZELHcr/bSXMkI2YoDsT06nWtfRRnvV4KKVpPgZo/+7pCwj22RdT8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BTPFHhUk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 435FIkuc004424;
	Fri, 5 Apr 2024 17:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=DhABskfLRUlM6XCxhUy4QsLLaTPLVsPWtV1d6P8AV8A=; b=BT
	PFHhUk1aRNi4fQuwYuJIcV9z4iHyf3DhJb/EfnA8AZMeW8eJtAs/hKTyh3SZ1gm+
	6i3TF0iuf+oaGTxuMKwrDXJtMI8UsTglj2qx7BWk4Qy63Bepg/wQFmeiH6Osqr8D
	jfkRpfhhSgveJRDq/IAmoL6XAgd6OyN+crzuPte2g1IZ2s1jE9suEBgWjDEjHgN0
	Mmwvd02R6yh9AkhUXHxD9j9g71vuo1nhDZ/MJoMZZCccaxPQXjc2sqTqr6085T3f
	8bQlc5nVRCT8JsjyEhKrIsNAz0LvS1PxBbnuvJnYjwsx9GQobCjb9HIFSWL0B2Lw
	qi0XPbHocGKuUTZXONsQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xa4eja8mt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Apr 2024 17:45:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 435Hjh0M029150
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Apr 2024 17:45:43 GMT
Received: from [10.110.52.194] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 5 Apr 2024
 10:45:42 -0700
Message-ID: <5d6f3cb1-4318-4f13-a96e-46b65c02d522@quicinc.com>
Date: Fri, 5 Apr 2024 10:45:41 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] Add Qualcomm PCIe ECAM root complex driver
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <linux-pci@vger.kernel.org>, <lpieralisi@kernel.org>, <kw@linux.com>,
        <robh@kernel.org>, <bhelgaas@google.com>, <andersson@kernel.org>,
        <manivannan.sadhasivam@linaro.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <quic_ramkri@quicinc.com>,
        <quic_nkela@quicinc.com>, <quic_shazhuss@quicinc.com>,
        <quic_msarkar@quicinc.com>, <quic_nitegupt@quicinc.com>
References: <1712257884-23841-1-git-send-email-quic_mrana@quicinc.com>
 <42d1281e-9546-4af1-a30b-8a0c3969be6b@linaro.org>
 <1d2d231a-ab2e-4552-9e72-2655d778f3b8@quicinc.com>
 <ab967c4c-363b-4530-b11e-6de7f3fa0426@linaro.org>
From: Mayank Rana <quic_mrana@quicinc.com>
In-Reply-To: <ab967c4c-363b-4530-b11e-6de7f3fa0426@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5La-twcRwtURUSBDaJui__FPpxHFYhZ9
X-Proofpoint-GUID: 5La-twcRwtURUSBDaJui__FPpxHFYhZ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_19,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 clxscore=1015 adultscore=0 mlxlogscore=999 malwarescore=0
 impostorscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404050124

Hi Krzysztof

On 4/4/2024 11:50 PM, Krzysztof Kozlowski wrote:
> On 05/04/2024 01:02, Mayank Rana wrote:
>> Hi Krzysztof
>>
>> On 4/4/2024 12:33 PM, Krzysztof Kozlowski wrote:
>>> On 04/04/2024 21:11, Mayank Rana wrote:
>>>> On some of Qualcomm platform, firmware takes care of system resources
>>>> related to PCIe PHY and controller as well bringing up PCIe link and
>>>> having static iATU configuration for PCIe controller to work into
>>>> ECAM compliant mode. Hence add Qualcomm PCIe ECAM root complex driver.
>>>>
>>>> Tested:
>>>> - Validated NVME functionality with PCIe0 and PCIe1 on SA877p-ride platform
>>>>
>>>
>>> RFC means code is not ready, right? Please get internal review done and
>>> send it when it is ready. I am not sure if you expect any reviews. Some
>>> people send RFC and do not expect reviews. Some expect. I have no clue
>>> and I do not want to waste my time. Please clarify what you expect from
>>> maintainers regarding this contribution.
>>>
>>> Best regards,
>>> Krzysztof
>>>
>> Thanks for initial comments.
>> yes, this is work in progress. There are still more functionalities
>> planned to be added as part of this driver. Although purpose of sending
>> initial change here to get feedback and review comments in terms of
>> usage of generic Qualcomm PCIe ECAM driver, and usage of MSI
>> functionality with it. I missed mentioning this as part of cover letter.
>> So please help to review and provide feedback.
> 
> Thanks for explanation. Work in progress as not ready to be merged? Then
> I am sorry, I am not going to provide review of unfinished work. I have
> many more *finished* patches to review first. You can help with these
> too....
> 
> Best regards,
> Krzysztof
Ok. I am looking forward to send finished work on this once ready.
Thank you.

Regards,
Mayank


