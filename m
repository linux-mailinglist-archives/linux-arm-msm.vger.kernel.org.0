Return-Path: <linux-arm-msm+bounces-61699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E08ADE5ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 10:45:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5993416572C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 08:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02803280038;
	Wed, 18 Jun 2025 08:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BAlAZiA7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD0327FD59;
	Wed, 18 Jun 2025 08:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750236324; cv=none; b=U+mTBV4b+1yM6SS8ze/Yo/Bsrt/sjY8y5DZOtERsY0ptoX2E4+aUq3qxGCa1LBSu60bAxAzo+iIswiU22OfG0NaNN5pVq92U2bezuoHiM//ZluI2Vg67GSajydevuspXlWUGJtaHm71Gg5AtHdjHTiFXLijJl0D9XKxevDl2dy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750236324; c=relaxed/simple;
	bh=w/B3ULPRO43iVORfrD0IVd+TTNhb2F4jumYGZIWZYcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rrzXfkmUl5K4COTXEcb3KTr8yJLx3i4PLHKNcSZcS1Q2T+9vHIxGchmeBfMZrP5s+Jhz92b4J6ZGdJc6SlT3Z9aL/HL5kp3LrK0ASXdjePopJuiQHgMaMx+B4m9AsnJiX4s++Y1vjq2b5ZTSELAGvr0Q0kpg1aukwSuDqFcYlZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BAlAZiA7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I1Q69x015543;
	Wed, 18 Jun 2025 08:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TxFcQYGI+vyq/lI0MsXdc6yW67GePE33nsF775PKsvw=; b=BAlAZiA7K3vmHl3g
	XU2HNgaDf1NZsCDtZqZtCtqA6KnlgBZZrDRc29+Ci/xdnA7ZaIzkbF3qb8pLJh1v
	NFu3JgddTkBS2q9beOpaLyljH/Wtyj4M8S+QAvoWziSsg5Zx5vWciIULDwf1vIt5
	scT49vNUxQ/e+9CV/JEWxzd143oKERIOK4fvgM+qnoSY2BYg6HEstGWZVZu75ym4
	FowqmrFvGxwGrsRiutqlPx+u9tzBAJ3V4hrXYlnL8dNon9HJnVNql43tcXNGtIga
	QC6crXVevlj9tmgnzdhGL1od1p9NlBVBu42MtkUcnvP0xaL0szDbaEWI4cbSFtrP
	1VAEHg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hfkgdx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 08:45:17 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55I8j6h3016215
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 08:45:06 GMT
Received: from [10.217.216.168] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 18 Jun
 2025 01:45:01 -0700
Message-ID: <86ad5ddb-1a43-45c3-af35-9eb863c66f63@quicinc.com>
Date: Wed, 18 Jun 2025 14:14:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/4] arm64: dts: qcom: sm8550: Remove SDR104/SDR50
 broken capabilities
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
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
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_pragalla@quicinc.com>,
        <quic_sayalil@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <kernel@oss.qualcomm.com>
References: <20250618072818.1667097-1-quic_sartgarg@quicinc.com>
 <20250618072818.1667097-5-quic_sartgarg@quicinc.com>
 <5336c00d-3b80-423a-bb52-4e1ec35bc7ed@kernel.org>
From: Sarthak Garg <quic_sartgarg@quicinc.com>
In-Reply-To: <5336c00d-3b80-423a-bb52-4e1ec35bc7ed@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDA3NSBTYWx0ZWRfX5uhfxfurFsX8
 D2K/JQbmvUyAG00/zGl94ouSX0vROXSDNE3vjeDJgoMgxVg+fphh7Fq88p6BaKGRqakPMMdStyB
 qccxnB5pe0Rpz9dvLu6FhGt3xqtrg6ElWrLVxeB0oVUsLi5BR7jinw/44Aql8lJQvHTbw6MuMr6
 Zvyezn0mhGE6erTL2dvWU0+FkfnV6YzWFCDDln1JG7CkFb2zWbN0aD12Hg28CDHfY3zkdZJtQFf
 J56+OU0uD9rycbh1EWds2uvFkYY9fTnmVNljzU25GjBVLlBxNSTrG3v05QT4LdFXMu29urVIv1A
 GCRStw73F/3rFiNiOULrg0Gp7qO9Oq7cSSYZNzXQpfjm94LxFofoJkp26Dd546yn2OXQxCus4pt
 7JBk6BNusSIknlm9jahOqUVKm8LyGBWYBucEcs5dA1AjMJYwltt2EZ8PEvMglds+UlM9Wy5E
X-Authority-Analysis: v=2.4 cv=VvEjA/2n c=1 sm=1 tr=0 ts=68527c9d cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=h1owDyanI7SH9Gdp24gA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: iMWtXg2TRElK0lcE9mO5U60Dlh1RCuh1
X-Proofpoint-ORIG-GUID: iMWtXg2TRElK0lcE9mO5U60Dlh1RCuh1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_03,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180075



On 6/18/2025 1:11 PM, Krzysztof Kozlowski wrote:
> On 18/06/2025 09:28, Sarthak Garg wrote:
>> Kernel now handles all level shifter limitations related to SD card
>> modes.
>> As a result, the broken hardware capabilities for SDR104 and SDR50 modes
>> can be removed from the device tree.
>> Additionally, due to level shifter constraints, set the maximum
>> frequency for High Speed (HS) mode to 37.5 MHz using the
>> max-sd-hs-frequency property for sm8550.
>>
>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> index 82cabf777cd2..2c770c979d39 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> @@ -3180,6 +3180,7 @@ sdhc_2: mmc@8804000 {
>>   			iommus = <&apps_smmu 0x540 0>;
>>   			qcom,dll-config = <0x0007642c>;
>>   			qcom,ddr-config = <0x80040868>;
>> +			max-sd-hs-frequency = <37500000>;
> So my previous comments stay... This is SoC thus deducible from compatible.
> 
> Best regards,
> Krzysztof

" I agree that a DT property for the mmc controller would make sense.

Although, this seems limited to SD UHS-I speed modes, so perhaps
"max-sd-uhs-frequency" would be a better name for it?

Kind regards
Uffe "

https://patchwork.kernel.org/project/linux-mmc/cover/20250523105745.6210-1-quic_sartgarg@quicinc.com/

This was the comment given on V2 to introduce a generic dt
property.

Best regards,
Sarthak

