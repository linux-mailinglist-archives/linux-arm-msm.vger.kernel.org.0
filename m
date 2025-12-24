Return-Path: <linux-arm-msm+bounces-86581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 24316CDC5A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 14:22:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F22A0301A70D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 13:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F243164B7;
	Wed, 24 Dec 2025 13:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PGJTom5g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bxiCy5ek"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B80118A6A7
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 13:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766582349; cv=none; b=B5s/EfzvW1PMYMEhOF29n+WJUs8VP71ne2CWW7GytYhW6CVOmwBooQMxfuUBteHZA/XqIizNhpp2ErDuH+BAfSnxjeRl6MMDv2xkd1CDbcgHe+9NyTNFxR4iSPFEgqItA5EwEWte7h0Qvdz6oeOy6wCEGlIEv4VDq6lAvqgPx+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766582349; c=relaxed/simple;
	bh=nbO59WxEv6kJz5J/qzq9hXscmrSCCG2Is3XZzjDxYnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LtVYzG3bVyH/I87Neefgb6C4FhhCp0UrvlWpJ9XpOmkajhfKaLinUCIb8e3oV865bzpZMg1fJ+tmNHjK3VLy0qQt8X5RQyS+xSfp51SVDWrEgZlyi92L14yC8FJ7i6hr7C8TYFDBhwQVcJADyL1ZJyNMsQoGOvFca2504QAPtsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PGJTom5g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bxiCy5ek; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO9XTop700449
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 13:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gLdqPf2jOO7mFzFA7nnGkJ9lAvirM/0WH2whVgXUvVU=; b=PGJTom5gAF001NTM
	AS1NhhZBa1AIantRtPx+6dRAyBM4qQ0gYI5nEMIQgTZQpgOdGRbprHsDKC7LilPu
	Pjs4IrG4mwnzMye3Kd38oz1S5OqWM/ez8uwDJTZnaRCv2G7WSK/9yRyVHzxoK0jM
	TxtfXpyN03mrMhoh9GF1cH2kP9YRhjS5uSAxLYeKTNy0ymy3aaFKLGOiq62IEVp8
	OFycTlvejVWXrmYGyaTFCkj9mR1/WyCf5yTIAqgi+UltKNaUHw1ZfGuqzXZ1adtP
	wmmk/drDLhUfwuq1bGHsd3ghsuwPMwI8YWJ9OxBSKJgpgV0XNCghst0ZyO1K3X9V
	vw0f1w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7jusft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 13:19:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29da1ea0b97so165950085ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 05:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766582344; x=1767187144; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gLdqPf2jOO7mFzFA7nnGkJ9lAvirM/0WH2whVgXUvVU=;
        b=bxiCy5ek01tx+eRf8sQF04baWE+dY9sr2WOAfvyAF08jJf2fshMCQaihqubamwZhff
         KbEWVRox/ea7b892JaKoKWTN+B/2Q5g9fwr+AE5aOvUd4PogHX6XgsmmqwQ5yFEUqevm
         9JJQ+6WhqyIZEQTbzBIQtQJfZiCk12gsiF+0HGqImUst70s04aMAx4xoo+2ymOPNJ30G
         l/E9EaneyrCFfzy5EVdFChtXtNNfkuHl7s08oT6YAhQZFNqUNfdDfIpRmNEt5CQTKDZc
         gVL+aICYFAntiw04FIKO5SyXQ5KM3pM60PiOR49YopJaBxpSFMdmg6CN7GF4XML5dhpz
         BVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766582344; x=1767187144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gLdqPf2jOO7mFzFA7nnGkJ9lAvirM/0WH2whVgXUvVU=;
        b=LNuZPJQzFB3T0l+dPcu2AyL2GgXSljEnvBZP0d9oW6+ua4EJH7C5A510mMlW7X44h1
         GrW7CwhhKyWoqcx5ojnfpc+BL5Nj8tX1jM1VhOQB1gx8RKWFgK3+OXZPpObOlfvvlnAx
         K9J+1h9jwQpuxn2zvV1Mhj+t+lzbE9vKXNssKt53k7eedjQpIoQWof6Mv4l67lzAnV+W
         yNj9Cfsi0HmaBxXiPhXmzXZQLhStx//fjcjU7qfL5tPs++r3m9XToukehopiBE1kTkop
         MCqyJHmVyqRx7x95DQ73BkcUeSEnSUl8qfMy+/qEp/WeE0j7TOZc5usK3YhMT9aagQ5a
         T1vg==
X-Forwarded-Encrypted: i=1; AJvYcCVEeZfOf6swIb6puTvvRakMmTP1aUQQ5dc+fE9ajd3sXcMh43yu6Jmo6uz48Uz0DbE08iu+jACbjD3W5iQh@vger.kernel.org
X-Gm-Message-State: AOJu0YzuZkA6ell28XjO4ZycUvbSkuCnEtmL9YjqB/lbfo9zKeEqK+tF
	huuUAMg2oGYSMrOwrUT36HQGtJxwLPUP46XqmRGflh6TVQwRyBP9SIT3QspSD0GJJ68TVDCjUgl
	WQ/s/8M3YUM+lfii28AnhWWlgrGxqH5p5bcTFjlSKIHn3RTLK5Iio95cNvjm67JCn/7wc
X-Gm-Gg: AY/fxX5nftG1XqarawAZdqdfcIF1XgTBe5+97olVxkuSliVkt+KfJRfO4AvNjfq+1wM
	dAi+rYCcEzEWD1AULWsAZJ0xZaG/rClL5ruUpmNo8XvuOzKwVwX7ETsY0D/MIAu/e3fTX5O8itY
	jbp1/c6D+P0F+h8xuCwcrg55FkCDm7jVMuB/x1JE5z+sKschgcTbOjf0JFMecY6AxSvRp8r5lvT
	VWz3l3of8b/S45KxJ64hqbHdT0eUD4AvAsn0pSOswWtd0JWShB5e+775duc4v5DteA4l/tZiJnL
	+ojSpo6hBF2ylFW3JsYZOlk0yMVI3XoQLjBjg3+KntsllKVs8QMY5lQxqpmdmsmSIhB9WqHkXkF
	3DL9Fgp+IDT3cy1Vt7KqZnfe2RTiQeBJrHw==
X-Received: by 2002:a05:6a20:12ca:b0:363:bb19:ed30 with SMTP id adf61e73a8af0-376a81dc166mr17027337637.5.1766582344346;
        Wed, 24 Dec 2025 05:19:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAWQ5IeWJUtjC5wvZMgjwfXx7WDoB4F6DacQQkKYtbWinA6GcDgnW4NpMjovfVk+F+tuc+WA==
X-Received: by 2002:a05:6a20:12ca:b0:363:bb19:ed30 with SMTP id adf61e73a8af0-376a81dc166mr17027312637.5.1766582343799;
        Wed, 24 Dec 2025 05:19:03 -0800 (PST)
Received: from [192.168.1.7] ([106.222.230.144])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bc69728sm15290452a12.19.2025.12.24.05.18.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Dec 2025 05:19:03 -0800 (PST)
Message-ID: <4a3041af-efda-4345-8298-9602561cb57e@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 18:48:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sdm845-oneplus: Update firmware
 paths
To: David Heidelberg <david@ixit.cz>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251222-oneplus6-new-fw-path-v1-0-a2d366f9eb89@ixit.cz>
 <20251222-oneplus6-new-fw-path-v1-1-a2d366f9eb89@ixit.cz>
 <a8cc09c0-6acd-409a-a907-c3809b4f4db3@oss.qualcomm.com>
 <17490007-73b9-423b-af49-b89e33ee51f3@ixit.cz>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <17490007-73b9-423b-af49-b89e33ee51f3@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDExNiBTYWx0ZWRfX/RI5ToC7d825
 Gb2b5HYTVlJkIDUtJf+ce+XDwa+8ZelOJQXtikr6q7y6oDAL1Jw1nTWMHGZu/5/P8HZJEPqZE8i
 uHQJAM0fExduzOUVh9vODF5Sxk7EoFEnzrrjRU6expgDhihJxC4KhFW4F1fGsk6fAUosGx6KtVV
 hlOXvzVkGhdsvqeey4NuCyeMJAgSlsuVO8vaKiY75HQ2dC/aj76zLWDfi3h3yN5TJ60qE7t9ycx
 D04ZCwdJXyQb82zhB4zQOpOiwqVUTzW9iBKA4l8HClVfObwsNw6gM22Hc4KRg/Wl+BIwL1xHoI9
 sBGeVUQ77VJBh52T6y68vZFWzWXyJ5LzDf/uV2pKR//YzvFWj0kbn8Bl6H8BG9zUy5sPJBKtB/5
 0QsG88RSJAeUf/Dptsng8s8ondwpjbqDqGI6unPD2N+vtk2cryZXTjV1YmIiu4PDNqpC94mx3fL
 dhjGlINlvhNl1UCO3Fw==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694be849 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=9Goc2DGw7r6NbAdAXxNxgg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=0MS-um4iTv7t2dz4xcIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: TrVGVE6iXBFppkRvZSsrlDQWJyrCAG-E
X-Proofpoint-ORIG-GUID: TrVGVE6iXBFppkRvZSsrlDQWJyrCAG-E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240116

On 12/23/2025 1:21 AM, David Heidelberg wrote:
> On 22/12/2025 20:31, Akhil P Oommen wrote:
>> On 12/23/2025 12:35 AM, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> Conform to the new firmware path scheme.
>>> Includes cosmetic cleanups.
>>>
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>>   .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 23 +++++++++++
>>> +++--------
>>>   1 file changed, 15 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/
>>> arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
>>> index db6dd04c51bb5..f1c63794db979 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
>>> @@ -181,8 +181,9 @@ panel_vddi_poc_1p8: panel-vddi-poc-regulator {
>>>   };
>>>     &adsp_pas {
>>> +    firmware-name = "qcom/sdm845/OnePlus/enchilada/adsp.mbn";
>>> +
>>>       status = "okay";
>>> -    firmware-name = "qcom/sdm845/oneplus6/adsp.mbn";
>>>   };
>>>     &apps_rsc {
>>> @@ -353,8 +354,9 @@ vreg_s3c_0p6: smps3 {
>>>   };
>>>     &cdsp_pas {
>>> +    firmware-name = "qcom/sdm845/OnePlus/enchilada/cdsp.mbn";
>>> +
>>>       status = "okay";
>>> -    firmware-name = "qcom/sdm845/oneplus6/cdsp.mbn";
>>>   };
>>>     &gcc {
>>> @@ -370,7 +372,7 @@ &gpu {
>>>   };
>>>     &gpu_zap_shader {
>>> -    firmware-name = "qcom/sdm845/oneplus6/a630_zap.mbn";
>>> +    firmware-name = "qcom/sdm845/OnePlus/enchilada/a630_zap.mbn";
>>
>> I believe this is considered as breaking backward compatibility. How
>> about creating a symlink in linux-firmware instead.
> 
> See discussion here:
> 
> https://lore.kernel.org/linux-arm-msm/
> CAO9ioeW9=TPde4P=AOcQANvPv90K-9MkcRRgb7HNwe8KiOpFjQ@mail.gmail.com/
> 
> I understood the conclusion was "let's do it".
> 
> We have more-less 3 consumers here,
>  - postmarketOS (Alpine)
>  - Mobian (Debian)
>  - NixOS Mobile (NixOS)
> 
> some of these using droid-juicer, which can be easily updated to update
> paths.
> 

Dmitry,

How is this "not breaking backward compatibility"?

-Akhil.

> David
> 
>>
>> -Akhil.
>>
>>>   };
>>>     &i2c10 {
>>> @@ -422,7 +424,8 @@ rmi4_f12: rmi4-f12@12 {
>>>   &ipa {
>>>       qcom,gsi-loader = "self";
>>>       memory-region = <&ipa_fw_mem>;
>>> -    firmware-name = "qcom/sdm845/oneplus6/ipa_fws.mbn";
>>> +    firmware-name = "qcom/sdm845/OnePlus/enchilada/ipa_fws.mbn";
>>> +
>>>       status = "okay";
>>>   };
>>>   @@ -474,8 +477,10 @@ &mdss_dsi0_phy {
>>>     /* Modem/wifi */
>>>   &mss_pil {
>>> +    firmware-name = "qcom/sdm845/OnePlus/enchilada/mba.mbn",
>>> +            "qcom/sdm845/OnePlus/enchilada/modem.mbn";
>>> +
>>>       status = "okay";
>>> -    firmware-name = "qcom/sdm845/oneplus6/mba.mbn", "qcom/sdm845/
>>> oneplus6/modem.mbn";
>>>   };
>>>     &pm8998_gpios {
>>> @@ -593,7 +598,8 @@ &qup_uart9_tx {
>>>   };
>>>     &slpi_pas {
>>> -    firmware-name = "qcom/sdm845/oneplus6/slpi.mbn";
>>> +    firmware-name = "qcom/sdm845/OnePlus/enchilada/slpi.mbn";
>>> +
>>>       status = "okay";
>>>   };
>>>   @@ -744,7 +750,7 @@ bluetooth {
>>>            * This path is relative to the qca/
>>>            * subdir under lib/firmware.
>>>            */
>>> -        firmware-name = "oneplus6/crnv21.bin";
>>> +        firmware-name = "OnePlus/enchilada/crnv21.bin";
>>>             vddio-supply = <&vreg_s4a_1p8>;
>>>           vddxo-supply = <&vreg_l7a_1p8>;
>>> @@ -906,8 +912,9 @@ speaker_default: speaker-default-state {
>>>   };
>>>     &venus {
>>> +    firmware-name = "qcom/sdm845/OnePlus/enchilada/venus.mbn";
>>> +
>>>       status = "okay";
>>> -    firmware-name = "qcom/sdm845/oneplus6/venus.mbn";
>>>   };
>>>     &wcd9340 {
>>>
>>
> 


