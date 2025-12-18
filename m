Return-Path: <linux-arm-msm+bounces-85679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D1ACCBA43
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 12:37:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 365773085B05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 11:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8921A3242C0;
	Thu, 18 Dec 2025 11:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F2gsiDza"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDB531B832;
	Thu, 18 Dec 2025 11:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766057551; cv=none; b=QxQx1WswyC+By79d67Ui6SzOthoGrSKnkCI5M0ip/mQd/TH+t5hcVP2+H7AIRio3dqH2hY3JQy1fEmrX7xsm08w/u13G8GdOMGeQDWsVRc6pzAnZBmMLhgpXPDGfxDP62J5+RkjmZED93fjB6xvXUfxGsS9/CZPSERwZm0n/Vh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766057551; c=relaxed/simple;
	bh=HH5SuRZ7AJG6ZbQgLhc85WxKa8MbOol8GvIt+2XFtcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=T6QW0DX9BGZa7SVmz/r7RxZFGVAPVjzMBPhbvx3D16WU7wLH47O7GI21tPmY8Ku2TVy79ywnP7G/YvHMlEyZmupUTD5nlRzGUhy543Clt0p5Z37N94FWO+xI8R3PP7WNE5+a2GbbzxEx+FlT4tO0MMiJdPM4QIJhEWNLF7ecACQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F2gsiDza; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI8s1Ux174300;
	Thu, 18 Dec 2025 11:32:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1QXuPi8KZyfWVMhYlWt468H6Q5yqlQnKJWLCLRlGzzw=; b=F2gsiDza7+a3t11x
	ku7HjdtOifgSdyjZ6NLDQxCbhaVVH5GN0CmXV2XFzCZ0x4FY5ifsXaCI8+RsHBEI
	ywMV5V3Dsg0JTt4aH3DzzvYqchN4xQStWrbYaNDdULPCMp80cNfiMzCnEy35BLaA
	DKar8mxpLAWplZULU7dhpjnLQmPGm39UoWrTRsFYEx6Dey8J31rUcQT80qYkRtDo
	16MgbOtuPva8NUqKcSQ90vlojEAUQ4WiwrNJLA2pCwXc7vJQHNSnlpqgmOy5M54h
	TejqZ8VcW9JRJeOx9V2BXbV6JPAmlzjRS9o4eM8cqFPL74NvHNQvdBvfYkFUgVtm
	hlO8mw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b43nmte5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 11:32:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5BIBWOD9015983
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 11:32:24 GMT
Received: from [10.217.216.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 03:32:18 -0800
Message-ID: <3a1a566f-4237-4b77-acf5-030e6d5364c1@quicinc.com>
Date: Thu, 18 Dec 2025 17:02:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] mmc: sdhci-msm: Add Device tree parsing logic for
 DLL settings
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter
	<adrian.hunter@intel.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dmitry.baryshkov@oss.qualcomm.com>, <quic_pragalla@quicinc.com>,
        <quic_sayalil@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <kernel@oss.qualcomm.com>,
        Sachin Gupta
	<quic_sachgupt@quicinc.com>
References: <20251215120009.3877889-1-quic_rampraka@quicinc.com>
 <20251215120009.3877889-5-quic_rampraka@quicinc.com>
 <a6c2236e-a7cd-405c-89a3-6124a588f450@oss.qualcomm.com>
Content-Language: en-US
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
In-Reply-To: <a6c2236e-a7cd-405c-89a3-6124a588f450@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aaarO5t6gRf1MBx75XPIeoXL4P50d0Ve
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA5NSBTYWx0ZWRfX7pRDkDfOn60P
 K9DWBoI4Ay9VPtBtKh4Q1SNNQo1yucbBEJ/6AclwOnl8gNBb1lVSIgtckZbc5YpPViQiQA5Jad1
 W4sAwoXJx9cEREpGV4/XOsnQPi7BsgLme+Fu9YDo429G09xUk5JXyXPQnHW0/umkrpnF5AL1yML
 Ws163FfIA6rMIq4lJt9P0HUTh2ArCiRMohNuxoOPbeEd4FySn7N+PYKKY7P7XRkFubQQN+TXYVF
 uFL67NdtkoEOkibpdPc7X93JH766dddKzMV8pAU0XJR+jk5I7rZbIZ1O6y2SYs2ZMlRRbSVugQu
 FroAj7SO7g2F3LfM600vTsqa4WjS/X7TsEVR9tPYop48GNCGiiMl5vUIHy3p9bJ/089VsPGTZq2
 hnnrw6G95p1fN0L8o1RBZOMdVCIEJw==
X-Proofpoint-ORIG-GUID: aaarO5t6gRf1MBx75XPIeoXL4P50d0Ve
X-Authority-Analysis: v=2.4 cv=A6Zh/qWG c=1 sm=1 tr=0 ts=6943e648 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=hdVdn9EK-IRQd7hYk8QA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180095


On 12/16/2025 7:59 PM, Konrad Dybcio wrote:
> On 12/15/25 1:00 PM, Ram Prakash Gupta wrote:
>> From: Sachin Gupta <quic_sachgupt@quicinc.com>
>>
>> This update introduces the capability to configure HS200
>> and HS400 DLL settings via the device tree and parsing it.
>>
>> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
>> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>> ---
> [...]
>
>> +#define DLL_SIZE 10
>> +static int sdhci_msm_dt_parse_dll_info(struct device *dev, struct sdhci_msm_host *msm_host)
>> +{
>> +	u32 *dll_table = &msm_host->dll[0].dll_config;
>> +	int ret;
>> +
>> +	msm_host->artanis_dll = false;
>> +
>> +	ret = of_property_read_variable_u32_array(dev->of_node,
>> +						  "qcom,dll-presets",
>> +						  dll_table, DLL_SIZE, DLL_SIZE);
>> +	if (ret == DLL_SIZE)
>> +		msm_host->artanis_dll = true;
> This feels backwards.. can we first somehow determine whether this
> platform has the artanis_dll (whatever that is since you didn't explain)
> and then make decisions on what to retrieve from the DT & how to
> interpret it?

I checked document and with hardware designers, currently there is no
distinguishable hardware configuration which can be used, will have to
rely on dt only.

>
>> +	return ret;
>> +}
>> +
>>  static int sdhci_msm_probe(struct platform_device *pdev)
>>  {
>>  	struct sdhci_host *host;
>> @@ -2580,6 +2612,15 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>>  
>>  	msm_host->saved_tuning_phase = INVALID_TUNING_PHASE;
>>  
>> +	/*
>> +	 * Parse HSR dll only when property is present in DT.
>> +	 */
> /* Parse ... */, it's short enough
>
> Probably also "DLL"
>
> Konrad

sure, will update.

Thanks,
Ram


