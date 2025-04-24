Return-Path: <linux-arm-msm+bounces-55255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 082F1A9A0C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 08:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F41A61945F5E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 06:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B5471D8DFB;
	Thu, 24 Apr 2025 05:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YK4kYFaq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6A51CEAB2;
	Thu, 24 Apr 2025 05:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745474388; cv=none; b=U6Fd6sEFvnW1wwYH+36FaJ2m/rRHESpubzS+YyCfm+bM53JVV0aJn2ecfhyv5JwgSAGysOHKJmJm5l1YY6NUcGI1k0KGPJyAQOHFHnDXK2TbIMeHMcuve7F8J4CCHtuVakMkv/BKqUnCT0tG3H3HBdMwhARsIvixXUnsfaumM4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745474388; c=relaxed/simple;
	bh=UUEdb0ar5fMVdcKaE+6aK1SlHkXxvV3PK7HyvINycTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cXSpxbmw2YJxxxh9f6LgPbDFFdMREtBE4nfyo0j7oxEZ0UL9JDvQOxWkYggpZGXZ4Us1ZJGyRJHi+l2Ca3LE+i4Lo0noAPwbTNDL2GeJvOuCkRS5Lb1puAvkK7FJuWxpYCngKIZlTb0yxqiSrvsppGp90sX/5gxrnfRwOVMF6t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YK4kYFaq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F88U030993;
	Thu, 24 Apr 2025 05:59:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9mAQti71pCT+WDKDo6iUmcSu7YhWwHVsSJ/POdQ+63s=; b=YK4kYFaqX5BNWU3U
	Ti0X7GLP320RQy4fTkGwrhA4U6HStU/cehhW47Xf5x9e7d2f6Kyscefx9PtU1rdJ
	gLMuNaIDqCXj3MnBM+wRhNJNCaaXhvUiQk5v16Fqw9II+dNhlKxuV5/mU7GexwDR
	FjWJ9rFSQXVAAwIRpbFbEpJ43dmX/77JM2Xe9eqA39axWHqmYWAN3jeIOWBR0mnD
	RlbNq12APhRfYoa//xP6zIEYE3cokZ4ePMP6sEYUmaGF2NFTQRsAir19cSTqxbPC
	WNGw6pJxnd4TzZcGOerJtGHvrwIPUtZcUNjS95c4pv7r5VuRs+dcoR8n750zKMC4
	NuOEKA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5ccs1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 05:59:41 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53O5xeZJ015856
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 05:59:40 GMT
Received: from [10.239.133.118] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Apr
 2025 22:59:35 -0700
Message-ID: <1fab200f-c7fd-4772-ae8b-6b8f4f1f4adb@quicinc.com>
Date: Thu, 24 Apr 2025 13:59:04 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs615-ride: Add PSCI SYSTEM_RESET2
 types
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <kernel@quicinc.com>,
        <linux-kernel@vger.kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20250422-add_psci_sys_reset2_modes_for_qcs615-v1-1-7faaf877366e@quicinc.com>
 <174532908966.1111913.12713682553446003215.robh@kernel.org>
Content-Language: en-US
From: Song Xue <quic_songxue@quicinc.com>
In-Reply-To: <174532908966.1111913.12713682553446003215.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDAzNyBTYWx0ZWRfX3+jYuXeeOvGI rvsvA824Y/AcjH7OsJ3GNc4rRns+lNLKLI07Pl1htd3V9yZhNlGI+stQjBnttEmzJMQNQgAOgmI oRUtGjznxWC3Q93p3hlihidCBu2MU/qR/nSVGRS6W4o39g4ToK8BZ4UqAJtlUc6/d49GbFxGVGA
 TYUAWfEQLH1b1kfdyJmdZ26LKb9V+MkMjVn+9PiyFlbLei7bNh8f2RSZ/tTKzaWbvdHBtaUqMeO RJFIU+jr2ADw716fxbEvWTbcKsNnChUdeTdSr9weR6SKHtJeZ5EZ3jD9oIeWcGD/sk8XR2mA8JN +H5isQUf5baBZ3FOkuwm19bZuzBp3ugv0QhnBHLPLj/sFUQT0riYy+y9bt1uciLT+Psx8Gf3gnV
 X9PSVNPOa+zjdl3ngDJznUjoJMvxhSV0Ev4C4+xO7E861bVZpUSubOydp8YeHpIqvOghHDN0
X-Proofpoint-GUID: KfZt-K97T0lsWcthoO2GmCIGbzfbACX1
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=6809d34d cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gEfo2CItAAAA:8
 a=COk6AnOGAAAA:8 a=4CDoZJVVFqlZavh4jk8A:9 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: KfZt-K97T0lsWcthoO2GmCIGbzfbACX1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_02,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240037



On 4/22/2025 9:38 PM, Rob Herring (Arm) wrote:
> 
> On Tue, 22 Apr 2025 15:39:54 +0800, Song Xue wrote:
>> Add properties to support Bootloader and Edl mode for PSCI system
>> reset2 reboot modes. The cookie and magic values set will be used
>> by SYSTEM_RESET2 call.
>>
>> Signed-off-by: Song Xue <quic_songxue@quicinc.com>
>> ---
>> Dependencies:
>> Link to bindings and driver changes:
>> https://lore.kernel.org/all/20250303-arm-psci-system_reset2-vendor-reboots-v9-0-b2cf4a20feda@oss.qualcomm.com/
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 7 +++++++
>>   arch/arm64/boot/dts/qcom/qcs615.dtsi     | 2 +-
>>   2 files changed, 8 insertions(+), 1 deletion(-)
>>
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>    pip3 install dtschema --upgrade
> 
> 
> This patch series was applied (using b4) to base:
>   Base: using specified base-commit e21edb1638e82460f126a6e49bcdd958d452929c
> 
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
> 
> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250422-add_psci_sys_reset2_modes_for_qcs615-v1-1-7faaf877366e@quicinc.com:
> 
> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: psci (arm,psci-1.0): 'reset-types' does not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
> 	from schema $id: http://devicetree.org/schemas/arm/psci.yaml#
> 
My patch is depend on the 
bindings:https://lore.kernel.org/all/20250303-arm-psci-system_reset2-vendor-reboots-v9-1-b2cf4a20feda@oss.qualcomm.com/

In this bindings, we can see the property definition of 'reset-types' 
which only has "mode-" property.

Best regards,
Song Xue
> 
> 
> 
> 


