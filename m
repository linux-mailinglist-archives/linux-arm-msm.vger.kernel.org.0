Return-Path: <linux-arm-msm+bounces-56195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1665AAA4218
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 07:02:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A4E41BC068C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 05:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF635145FE0;
	Wed, 30 Apr 2025 05:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Pt+b1A7L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C41DEC2;
	Wed, 30 Apr 2025 05:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745989366; cv=none; b=HwkA1M6urvQBNGMbQZ8lBdvS3Edk7Kgmsx8iSFBLHmJ+9rL6PidziyKxy+7a2yvUy6IOFKmC3JpRM1xQC4BhktGG+VjW9iLEgtlIxdw6T/PK9w4XoVoPD17R/mYsVbPzVoSMIrivDBFC6DKIbeD7Sv+2+Bh0Prg6oxBFAXawABI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745989366; c=relaxed/simple;
	bh=P9dFlAotUFK7qz9Tnye45ZjBexnanHqxKetS/gDk8ik=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gHEAMfoqAajR+7R0IsCxEies4Y/E6svBnV/ZuITQCEev9/H8WQqVcyJnbmFQXXp4jnVs90dNnOkLN+7X7I3VTqieJ7e0hFT5hdjlgjc4IGi2ZRzt76VG9s0/zVFfQ4BDPPioS0V3uGy/H1BH35i8FS1QU9kGiYnQThTBgFXoO9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Pt+b1A7L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLb6hl001708;
	Wed, 30 Apr 2025 05:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BaJlAFQiOr69yTTQfYEnLNYARPRk6bsmVp9U6eMvrtc=; b=Pt+b1A7LKUlMjPKh
	k4YztfLf0MYqaMB9KGePPZwFY9vzHRa1IQEXrQi3PZ9zm0K4ial/0DYoqSpzP51m
	mGAvf0rWLGziLoCiohztxeuR5l8gJQhvZ5hg0I47qJ723sd/baw/xmMUzvOOZCmH
	JYCVVeY6FJaV15SFBvENqK9k2oLqw3KkRb8KBaqW939hGAMQi7+Bme0tSreOAZni
	i8jg9onmgorAB4Py0wrmUkka1AC+MwY9GJ7P0Y4j/B5UULTC55FDatY66T60y+PY
	k7xbdQzbEYhXPlLuCMorzbwWL3YLbEQpD12A7tCJokIl70qbB+qSiJf3mnR3sw4n
	HXfT9Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u28ufh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 05:02:41 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53U52ePr004141
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 05:02:40 GMT
Received: from [10.218.23.250] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Apr
 2025 22:02:35 -0700
Message-ID: <e6075d01-1bca-48fb-b3f1-4a1b35c63ec5@quicinc.com>
Date: Wed, 30 Apr 2025 10:32:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: qcom: camcc-sc8180x: Add SC8180X camera clock
 controller driver
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Jagadeesh
 Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250422-sc8180x-camcc-support-v1-0-691614d13f06@quicinc.com>
 <20250422-sc8180x-camcc-support-v1-2-691614d13f06@quicinc.com>
 <83cc86cc-2cdf-41c2-8e00-61a607b713d5@linaro.org>
Content-Language: en-US
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
In-Reply-To: <83cc86cc-2cdf-41c2-8e00-61a607b713d5@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: r9tw_ZH-NL0wZDNT2Mr5CvWUu2Wtars_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDAzMiBTYWx0ZWRfX3TQE8mFF3xc5 DSiEOLjSfPTuL9Q7F5pZNXkNNnb7wg0pER2JvSOENl0gVkqpyspM9eUa1QSnZjhc7VnxjI8nHGw 9g0rnljvI9a4hI/15k9irrj5B4IIS1CfIJZqcPwR9nAAKsKj+CFU+Rra6TR71YJK2UQSOcZECe0
 e6ul5MH2QfGy0MuOmx5Xr04GW/euSIna/SzmlEnnyrQx/B6pSBjSufYGkBiifpZLjvkUnnfgZfc cQl4w7MLFGq1qE/WR0ItdJwCZkKco/vraoLFZLOMhbP6DefsMU2RAzEPcP68IAV6byfip24FkTr i+Soneo81rKTQjcsv0DrTP6L6umYBZ3nb8zKfpUT3b+yfVu6fYaz/nV+W1h7dHOz3Otl9MPQ9+M
 LQbtB3EA87vuEEInWBtFtLUAZkzyHRsZa2Ygw8I1mYTbPrdZRwdKBiTiBUypXZgd/bvd5Ldk
X-Authority-Analysis: v=2.4 cv=b5qy4sGx c=1 sm=1 tr=0 ts=6811aef1 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=bYuTag8ub-6FyNKvZZEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: r9tw_ZH-NL0wZDNT2Mr5CvWUu2Wtars_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300032


On 4/26/2025 6:54 PM, Vladimir Zapolskiy wrote:
> On 4/22/25 08:42, Satya Priya Kakitapalli wrote:
>> Add support for the camera clock controller for camera clients to
>> be able to request for camcc clocks on SC8180X platform.
>>
>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>> ---
>>   drivers/clk/qcom/Kconfig         |   10 +
>>   drivers/clk/qcom/Makefile        |    1 +
>>   drivers/clk/qcom/camcc-sc8180x.c | 2896 
>> ++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 2907 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>> index 
>> 7d5dac26b244bfe785370033ad8ba49876d6627d..42b64e34b3fcc4bae7c559f34a34f9452307ae9a 
>> 100644
>> --- a/drivers/clk/qcom/Kconfig
>> +++ b/drivers/clk/qcom/Kconfig
>> @@ -900,6 +900,16 @@ config SDX_GCC_75
>>         Say Y if you want to use peripheral devices such as UART,
>>         SPI, I2C, USB, SD/eMMC, PCIe etc.
>>   +config SC_CAMCC_8180X
>> +    tristate "SC8180X Camera Clock Controller"
>> +    depends on ARM64 || COMPILE_TEST
>> +    select SC_GCC_8180X
>> +    help
>> +      Support for the camera clock controller on Qualcomm 
>> Technologies, Inc
>> +      SC8180X devices.
>> +      Say Y if you want to support camera devices and functionality 
>> such as
>> +      capturing pictures.
>> +
>>   config SM_CAMCC_4450
>>       tristate "SM4450 Camera Clock Controller"
>>       depends on ARM64 || COMPILE_TEST
>
> Please add a new config section preserving the alphanumerical order.
>
> The new section should be placed between SC_CAMCC_7280 and 
> SC_CAMCC_8280XP,
> like it's correctly done for the Makefile below.
>

Sure, will fix it. Thanks.


> After fixing it:
>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>
> -- 
> Best wishes,
> Vladimir

