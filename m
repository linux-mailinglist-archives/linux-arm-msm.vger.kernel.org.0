Return-Path: <linux-arm-msm+bounces-39790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0D69DFB67
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 08:42:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEF1E1631C3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 07:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E311F9A88;
	Mon,  2 Dec 2024 07:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ph19J9pf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AACE1F942E;
	Mon,  2 Dec 2024 07:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733125358; cv=none; b=Wqzox875e7R+mL04MUD9W5vy9gEt2WvNJzIwQ1YlhkA4bDGhx0m3RV4bFUaK2iigMP5JPLcAVkO0m2ls6npNX120eP3AUfuT9k6nBmReKJmbEwklii17twca80PGZvqwKFcAYn/tDTcmSK+fFxVfRBQu7Ga20Hy8wfoKoXLe/Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733125358; c=relaxed/simple;
	bh=2njwOe+cdBDqNpuPS3iZblShtLwgy/1GVSca1pYYrlQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hJ4g0g00G248COdztdQiwkrg7rDDVWSPixYrZtUKA8tPbBoTtsRQ30jL6LIM3zQuEGRgJuqzKZIxSMwH6QUMcNVqb3L5Fq/Yrm24q7pozUg94Hg0EZdn6VPlmHZKMMvSzez7NsJ8ZL9WIjVT0H+sx8m6j0Z58ub1Sr1g55ulAUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ph19J9pf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B1MZ2vA025063;
	Mon, 2 Dec 2024 07:42:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IhB5zgQUxjuc6LFzVZKlrauHl+YO/2s+LV94N0W24Fk=; b=Ph19J9pfOqgOUwfJ
	GOHQg3kOUHNOSHdkM2MmbC8OPjKITOL4pYXIQFeRK0CBnpwsaPHmtNJNL7mfE1cm
	btZtUctxmJTVRCefjcWIrA+y/NYUB51brEpEBLMmbnO7JybydrRubkuraz0QS2/r
	rzrZP6nSUXIRk3fu2V0VrTEMXXnsQexGS+ntU0fiY2l4j9T1RtljQ3P/E3sonKbf
	7mKMLGMeW+N4NFh3cKPaZLufG//WPbe+FzBLj8T+YFZO17hdTRQTWyMIT0B9b9jB
	oE6kZF6x64dhzzGNDIXXhUSY5KbxmERHiVR4sOX97DtfW2RWw3l5fykHO1AKVqQQ
	HjpNgA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437sq63vgp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 07:42:31 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B27gUu6017810
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Dec 2024 07:42:30 GMT
Received: from [10.231.207.28] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 1 Dec 2024
 23:42:24 -0800
Message-ID: <7298f5b4-6a39-44f8-b61c-b753935f5fef@quicinc.com>
Date: Mon, 2 Dec 2024 15:42:22 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: move pon reboot-modes from
 pm8150.dtsi to board files
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <quic_fenglinw@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <kernel@quicinc.com>, <quic_eberman@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241128-adds-spmi-pmic-peripherals-for-qcs615-v5-0-ae673596b71c@quicinc.com>
 <20241128-adds-spmi-pmic-peripherals-for-qcs615-v5-3-ae673596b71c@quicinc.com>
 <n3bqppo2upt64emlfljoin73a5ubgouztmdtitjbds522swgvi@s7re3z55eutw>
Content-Language: en-US
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
In-Reply-To: <n3bqppo2upt64emlfljoin73a5ubgouztmdtitjbds522swgvi@s7re3z55eutw>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TfcytGkzw3HzwWXwErojHfpPq5_eCkz1
X-Proofpoint-ORIG-GUID: TfcytGkzw3HzwWXwErojHfpPq5_eCkz1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020067



On 11/28/2024 9:09 PM, Dmitry Baryshkov wrote:
> On Thu, Nov 28, 2024 at 07:55:27PM +0800, Tingguo Cheng wrote:
>> Reboot modes were originally managed by PMIC pon driver on mobile and
>> IoT platforms. But recently, some new platforms are going to adopt PSCI
>> to manage linux reboot modes, which involves firmwares to co-work with.
> 
> Which platforms? Please be more exact. Also this patch needs to come
> before patch 2, enabling this PMIC on QCS615 board.
mobile/IoT sm8150/sm8250/qdu1000/... platforms, qcs615 are going to 
adopt PSCI...  Let me add this information in the commit message and 
place this patch before enabling PMIC.
> 
>> In this case, reboot-modes should be removed from pon dts node to avoid
>> conflicting. This implies that reboot modes go with devices rather than
>> PMICs as well.
>>
>> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/pm8150.dtsi                      | 2 --
>>   arch/arm64/boot/dts/qcom/qdu1000-idp.dts                  | 5 +++++
>>   arch/arm64/boot/dts/qcom/qrb5165-rb5.dts                  | 5 +++++
>>   arch/arm64/boot/dts/qcom/qru1000-idp.dts                  | 5 +++++
>>   arch/arm64/boot/dts/qcom/sm8150-hdk.dts                   | 5 +++++
>>   arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts | 5 +++++
>>   arch/arm64/boot/dts/qcom/sm8150-mtp.dts                   | 5 +++++
>>   arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi   | 5 +++++
>>   arch/arm64/boot/dts/qcom/sm8250-hdk.dts                   | 5 +++++
>>   arch/arm64/boot/dts/qcom/sm8250-mtp.dts                   | 5 +++++
>>   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi      | 5 +++++
>>   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 5 +++++
>>   arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts           | 5 +++++
>>   13 files changed, 60 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/pm8150.dtsi b/arch/arm64/boot/dts/qcom/pm8150.dtsi
>> index a74a7ff660d2b1be0df0dc26d79e1921a3935f14..d2568686a098cb4d78573000b34840d8f5f674aa 100644
>> --- a/arch/arm64/boot/dts/qcom/pm8150.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/pm8150.dtsi
>> @@ -49,8 +49,6 @@ pm8150_0: pmic@0 {
>>   		pon: pon@800 {
>>   			compatible = "qcom,pm8998-pon";
>>   			reg = <0x0800>;
>> -			mode-bootloader = <0x2>;
>> -			mode-recovery = <0x1>;
>>   
>>   			pon_pwrkey: pwrkey {
>>   				compatible = "qcom,pm8941-pwrkey";
>> diff --git a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
>> index e65305f8136c886c076bd9603b48aadedf59730a..82f6b4a3e24aa2caba90715e12bca25b693a0d65 100644
>> --- a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
>> @@ -239,6 +239,11 @@ vreg_l18a_1p2: ldo18 {
>>   	};
>>   };
>>   
>> +&pon {
>> +	mode-bootloader = <0x2>;
>> +	mode-recovery = <0x1>;
>> +};
>> +
>>   &qup_i2c1_data_clk {
>>   	drive-strength = <2>;
>>   	bias-pull-up;
>> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
>> index 52eef88e882c356a62bf563fcd7ce3d54b5ea824..7afa5acac3fcf7cb6f8c5274acdc2e55192c1280 100644
>> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
>> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
>> @@ -964,6 +964,11 @@ led@3 {
>>   	};
>>   };
>>   
>> +&pon {
>> +	mode-bootloader = <0x2>;
>> +	mode-recovery = <0x1>;
>> +};
>> +
>>   &pon_pwrkey {
>>   	status = "okay";
>>   };
>> diff --git a/arch/arm64/boot/dts/qcom/qru1000-idp.dts b/arch/arm64/boot/dts/qcom/qru1000-idp.dts
>> index 1c781d9e24cf4d4f45380860c6d89c21e8df9925..fe0b782aa3ff5f4b73e921880fc3cd9908398705 100644
>> --- a/arch/arm64/boot/dts/qcom/qru1000-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/qru1000-idp.dts
>> @@ -239,6 +239,11 @@ vreg_l18a_1p2: ldo18 {
>>   	};
>>   };
>>   
>> +&pon {
>> +	mode-bootloader = <0x2>;
>> +	mode-recovery = <0x1>;
>> +};
>> +
>>   &qup_i2c1_data_clk {
>>   	drive-strength = <2>;
>>   	bias-pull-up;
>> diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
>> index bac08f00b303ff6e6d47697f1cd9bff53efaf27b..6ea883b1edfa6c511730550f4db0cb9c25fc633d 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
>> @@ -578,6 +578,11 @@ pm8150b_typec_sbu_out: endpoint {
>>   	};
>>   };
>>   
>> +&pon {
>> +	mode-bootloader = <0x2>;
>> +	mode-recovery = <0x1>;
>> +};
>> +
>>   &pon_pwrkey {
>>   	status = "okay";
>>   };
>> diff --git a/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts b/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
>> index b039773c44653ae8cd5c2b9fdeccbd304ad2c9e5..fc11ef0373c6920e970886ce2eb2c4f20c75154a 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
>> @@ -430,6 +430,11 @@ &i2c19 {
>>   	/* MAX34417 @ 0x1e */
>>   };
>>   
>> +&pon {
>> +	mode-bootloader = <0x2>;
>> +	mode-recovery = <0x1>;
>> +};
>> +
>>   &pon_pwrkey {
>>   	status = "okay";
>>   };
>> diff --git a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
>> index 256a1ba9494560b93dc324751ee8327f763aad90..2e1c7afe0aa7d4ad560dd8e5aab2ce835991cc9d 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
>> @@ -358,6 +358,11 @@ &gpu {
>>   	status = "okay";
>>   };
>>   
>> +&pon {
>> +	mode-bootloader = <0x2>;
>> +	mode-recovery = <0x1>;
>> +};
>> +
>>   &pon_pwrkey {
>>   	status = "okay";
>>   };
>> diff --git a/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi b/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
>> index ae0ca48b89a59f669e0f359e48632b335050a2eb..70fd6455518b9101ba25dda6e1fb5f87c1053a71 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
>> @@ -601,6 +601,11 @@ main_cam_pwr_vmdr_en: main-cam-pwr-vmdr-en-state {
>>   	};
>>   };
>>   
>> +&pon {
>> +	mode-bootloader = <0x2>;
>> +	mode-recovery = <0x1>;
>> +};
>> +
>>   &pon_pwrkey {
>>   	status = "okay";
>>   };
>> diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
>> index 1bbb71e1a4fc0f1289663165e0a8f7ef88d9b429..f5c193c6c5f9b4bf007a17926bcce319f2608706 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
>> @@ -373,6 +373,11 @@ &gpu {
>>   	status = "okay";
>>   };
>>   
>> +&pon {
>> +	mode-bootloader = <0x2>;
>> +	mode-recovery = <0x1>;
>> +};
>> +
>>   &pon_pwrkey {
>>   	status = "okay";
>>   };
>> diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
>> index 21b2ca1def8363cbaf7857215f42ff8492a8f7fa..7f592bd3024868c6ab4c9c61051d3f2cf5707a1a 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
>> @@ -627,6 +627,11 @@ channel@4f {
>>   	};
>>   };
>>   
>> +&pon {
>> +	mode-bootloader = <0x2>;
>> +	mode-recovery = <0x1>;
>> +};
>> +
>>   &qupv3_id_0 {
>>   	status = "okay";
>>   };
>> diff --git a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
>> index f6870d3f2886fc68aaf914caecdd3a22ba249c5a..d8289b2698f37bce0501ac20c356bd5ae017e1ab 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
>> @@ -591,6 +591,11 @@ focus_n: focus-n-state {
>>   	};
>>   };
>>   
>> +&pon {
>> +	mode-bootloader = <0x2>;
>> +	mode-recovery = <0x1>;
>> +};
>> +
>>   &pon_pwrkey {
>>   	status = "okay";
>>   };
>> diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
>> index 3596dd328c31d6f0430fed343c7e2307147d21f3..0bf3d6a826fcbad9c84303e6016c4657c5f89ef1 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
>> @@ -673,6 +673,11 @@ &pm8150b_vbus {
>>   	status = "okay";
>>   };
>>   
>> +&pon {
>> +	mode-bootloader = <0x2>;
>> +	mode-recovery = <0x1>;
>> +};
>> +
>>   &pon_pwrkey {
>>   	status = "okay";
>>   };
>> diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
>> index 86e1f7fd1c2058202c9506d7e737fadabf476d5d..668078ea4f04a7ead052d28bf111be6daf25805f 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
>> @@ -554,6 +554,11 @@ vol_up_n: vol-up-n-state {
>>   	};
>>   };
>>   
>> +&pon {
>> +	mode-bootloader = <0x2>;
>> +	mode-recovery = <0x1>;
>> +};
>> +
>>   &pon_pwrkey {
>>   	status = "okay";
>>   };
>>
>> -- 
>> 2.34.1
>>
> 

-- 
Thank you & BRs
Tingguo


