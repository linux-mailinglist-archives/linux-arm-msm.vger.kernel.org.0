Return-Path: <linux-arm-msm+bounces-23341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EAE9100A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 11:44:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AF471F25456
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 09:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE12119B3E1;
	Thu, 20 Jun 2024 09:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jStVfnrk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1761E176FA1;
	Thu, 20 Jun 2024 09:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718876649; cv=none; b=u8tLcE0S1xfnb6pOV9uyRFAtnDTV1X9qYAlByfIcsmi1Lqzcymq5fv7GmRdFzNT3qhH+Oy5I3GmS8SyVRpQlMUhKPZU8xLR5JknpwVU+YDImkdQkbXioxmk7+5MaLDeeX1T0M/MK1Fx03/zWLo/5CslBmmuIwdRmlJuHYs4x4l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718876649; c=relaxed/simple;
	bh=HTzGvt8cdfXE0OHYxoQkKocUFMRL+hzPcQyDYgCACo4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AVYRoyqsbfBYpr87+9Uf9SxbhsTWEt5jClTzLGOzbdkbe1eKZ0UyCShTN5YPp++ZIHr4/ChyrAyfCjGmSqEnzNTpsl5q0OKTDiHZ/bgCAZYSN0aWhsn6TA3OYnhCaeS48JBV3NFAlMNFkB5UikxFktNw0z07jIJCwwyrIY0JS7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jStVfnrk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45JKbqsZ022148;
	Thu, 20 Jun 2024 09:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R2JDyZ4UzOKKd/PPEpfYp/WSOavvVShxLFRCnYnfGTA=; b=jStVfnrkVzu/0PgL
	qE8gD7AyxTymRFmgxVu3NsA4JkqNSoByloZnt44KPtcknswHDW15IDZEhCBeCPnD
	gN7lXLHJxTKTP5kvjIcj14jwKrLMK3+WvzAelogIv7fAZNwSohzMK09y7zI29pke
	+YRo+X3vOj8BdAqLJkE5aXhN0w3M8tEaYh2TR1oRYbh3pT4a+1pUPH9agCtY7/DR
	sL0xNgDLG+BBYgCZhzPcUi9ctnM9DNLPgTmO6oQCqehO6fYpwe4oMeHXO3uOC6ZC
	lRxmFHkOlOEVCLn3RLzWd0Dd1ikUvoiQRdJF7XsXd8/uuKzbB7A62aSSAczyt26z
	GjdiJA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yv6hn1dfj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 09:43:59 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45K9hwn2023250
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 09:43:58 GMT
Received: from [10.214.67.128] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Jun
 2024 02:43:55 -0700
Message-ID: <c23f9f69-d095-233e-c20e-b99e6f3921e5@quicinc.com>
Date: Thu, 20 Jun 2024 15:13:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] arm64: defconfig: Enable secure QFPROM driver
Content-Language: en-US
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
        Mukesh Ojha
	<quic_mojha@quicinc.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20240619105642.18947-1-quic_kbajaj@quicinc.com>
 <5582a2a0-c772-4573-9d55-2f963cb87df1@linaro.org>
 <ZnLKwqENxC4wzrUm@hu-mojha-hyd.qualcomm.com>
 <ZnMKh5X+Bm11L/T4@hu-bjorande-lv.qualcomm.com>
From: Komal Bajaj <quic_kbajaj@quicinc.com>
In-Reply-To: <ZnMKh5X+Bm11L/T4@hu-bjorande-lv.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OEcZAlljB6IH6FWxMMgR7e9HdgTZfafY
X-Proofpoint-GUID: OEcZAlljB6IH6FWxMMgR7e9HdgTZfafY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_07,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 mlxlogscore=835 impostorscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406200068



On 6/19/2024 10:12 PM, Bjorn Andersson wrote:
> On Wed, Jun 19, 2024 at 05:40:42PM +0530, Mukesh Ojha wrote:
>> On Wed, Jun 19, 2024 at 01:08:48PM +0200, Krzysztof Kozlowski wrote:
>>> On 19/06/2024 12:56, Komal Bajaj wrote:
>>>> Enable the secure QFPROM driver which is used by QDU1000
>>>
>>> Qualcomm QDU1000. You are changing kernel-wide defconfig, not some
>>> Qualcomm downstream stuff.
>>>
>>>> platform for reading the secure qfprom region to get the
>>>> DDR channel configuration.
>>>>
>>>> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
>>>> ---
>>>>   arch/arm64/configs/defconfig | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>>>> index 838b4466d6f6..c940437ae1b3 100644
>>>> --- a/arch/arm64/configs/defconfig
>>>> +++ b/arch/arm64/configs/defconfig
>>>> @@ -1575,6 +1575,7 @@ CONFIG_NVMEM_LAYERSCAPE_SFP=m
>>>>   CONFIG_NVMEM_MESON_EFUSE=m
>>>>   CONFIG_NVMEM_MTK_EFUSE=y
>>>>   CONFIG_NVMEM_QCOM_QFPROM=y
>>>> +CONFIG_NVMEM_QCOM_SEC_QFPROM=y
>>>
>>> Module
>>
>> Should not this be inline with what CONFIG_NVMEM_QCOM_QFPROM is having ?
>> Either both CONFIG_NVMEM_QCOM_QFPROM and CONFIG_NVMEM_QCOM_SEC_QFPROM
>> should be m or both y
>>
> 
> While that would be a convenient guideline, you're adding runtime
> overhead to all other targets (Qualcomm and non-Qualcomm) so the desire
> to keep anything that can module outweigh such convenience.
> 
> Based on the recent addition of llcc and qfprom nodes I'm _guessing_
> that LLCC is the one user of this today, and it is =m, so therefore
> SEC_QFPROM can be =m as well.
> 
> 
> By expanding the commit message slightly, we could have avoided the
> "why?" questions and the need for me to "guess" the actual dependency.
> 

Thanks Bjorn for the suggestion.
I will incorporate the suggested changes in the next patch.

Thanks
Komal

> Regards,
> Bjorn
> 
>> -Mukesh
>>>
>>>>   CONFIG_NVMEM_RMEM=m
>>>>   CONFIG_NVMEM_ROCKCHIP_EFUSE=y
>>>>   CONFIG_NVMEM_ROCKCHIP_OTP=y
>>>> --
>>>> 2.42.0
>>>>
>>>
>>> Best regards,
>>> Krzysztof
>>>

