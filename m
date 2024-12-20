Return-Path: <linux-arm-msm+bounces-43009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D23959F990E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 19:07:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0C72167D5D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 18:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354F9229B0B;
	Fri, 20 Dec 2024 17:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XRdT+A5W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7148F21D004;
	Fri, 20 Dec 2024 17:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734717027; cv=none; b=N+fVlDWe0td0MFXbaY55swjL/+sK2gEtH5sRH/Vxketqwc/VV9O5cjr1UmkcJpn5fw+QQ+iw0T59ZRaBYzleCmbjGGrS9ZBLzG/TF9mDwOucg8xZ4GzDIDFt22QQYXsHJbb0VM83JMftdumNRhPYr3oWJXIf0nFpqq8unig6jOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734717027; c=relaxed/simple;
	bh=HoJ1MeOapED9538iDrRbA4d7HJPgPPdPYoDX7Bo/lHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Pr3maktXlUQTdhzdL+zdufmBOb9lBNH8pO6dMTKNT1ycGpdsJIvRoArHxmb8dJ3qWl66mv9zZuuMGF1mApi2p8k6MF17gSbA3FwPBNWdBLFQh/AUIvq8DG9j/yvcWGJe1Mtq8PIsnXllUH8VP57w4lseZXw/jnYBG5PbFdiFbKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XRdT+A5W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKBbgoi023148;
	Fri, 20 Dec 2024 17:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VI2zlFkuGJMcoqTxZvE7t7cO7B3ftY5nFuRyA8qwXc8=; b=XRdT+A5WF+unfSWT
	+K8uXtYDfdrnlFauQjE9d6/MMSvHFeufnSpbbU4yPm1uIBWDNLmnQxnhR9m8st5y
	Jz0vKX0ALuKLb+jmDIUWNgVhNfXrjTfN1DNon1CmXUJ8WZpS39s8gQ2KznNDoiz0
	LDvdiDT8p4Le7f+3ZTIOXE+M+qT7ptjChaVW7AQmbiXBloQtbG1frX/AomvNaPtB
	nRxuNOlsNpoDRyRsYuTWgwlwalIfBSugpot0898R54aIbJOt4tVDGb67CNDkPCsS
	0mGXRqjdn/PWDdiaetTMJ0TuXNGsMo69YPu72u8XiKD0/7mr7DY8momi3YHiLtbu
	9APxwQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n7vg106p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 17:50:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BKHoGp6032570
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 17:50:17 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 20 Dec
 2024 09:50:16 -0800
Message-ID: <ed88797f-9094-ed93-5036-0af42767dbe3@quicinc.com>
Date: Fri, 20 Dec 2024 10:50:15 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 7/7] accel/qaic: Add AIC200 support
Content-Language: en-US
To: Lizhi Hou <lizhi.hou@amd.com>, <quic_carlv@quicinc.com>,
        <manivannan.sadhasivam@linaro.org>, <quic_yabdulra@quicinc.com>,
        <quic_mattleun@quicinc.com>, <quic_thanson@quicinc.com>
CC: <ogabbay@kernel.org>, <jacek.lawrynowicz@linux.intel.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <mhi@lists.linux.dev>
References: <20241213213340.2551697-1-quic_jhugo@quicinc.com>
 <20241213213340.2551697-8-quic_jhugo@quicinc.com>
 <65a59247-f028-28f9-1a65-5e4dd62dadec@amd.com>
 <dd83ba8c-0b37-7d1e-39a7-4b25ef7e5faf@quicinc.com>
 <ce41ab48-a923-7a29-1c50-3338fed39ea6@amd.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <ce41ab48-a923-7a29-1c50-3338fed39ea6@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3QKbM1CHyj0dHB1lOCi3OE3gZAmTbfF8
X-Proofpoint-ORIG-GUID: 3QKbM1CHyj0dHB1lOCi3OE3gZAmTbfF8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200142

On 12/20/2024 10:33 AM, Lizhi Hou wrote:
> 
> On 12/20/24 09:26, Jeffrey Hugo wrote:
>> On 12/13/2024 5:49 PM, Lizhi Hou wrote:
>>>
>>> On 12/13/24 13:33, Jeffrey Hugo wrote:
>>>> +static const struct qaic_device_config aic200_config = {
>>>> +    .family = FAMILY_AIC200,
>>>> +    .bar_mask = BIT(0) | BIT(1) | BIT(2) | BIT(4),
>>>
>>> Will this pass the BAR mask check in init_pci()?
>>
>> Yes, BITs 0, 1, 2, 4 would be 0x17 and that value is & with 0x3f 
>> (masking off upper bits).  The result would be 0x17.
> 
> It seems BIT(1) is not expected in init_pci?
> 
>      if (bars != (BIT(0) | BIT(2) | BIT(4))) {

I think you are only referencing patch 5, when you should also reference 
patch 6.  This check gets modified in patch 6 -

-	if (bars != (BIT(0) | BIT(2) | BIT(4))) {
-		pci_dbg(pdev, "%s: expected BARs 0, 2, and 4 not found in device. 
Found 0x%x\n",
-			__func__, bars);
+	if (bars != config->bar_mask) {
+		pci_dbg(pdev, "%s: expected BARs %#x not found in device. Found %#x\n",
+			__func__, config->bar_mask, bars);
  		return -EINVAL;
  	}


Do you still see an issue?


