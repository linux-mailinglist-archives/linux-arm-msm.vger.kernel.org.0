Return-Path: <linux-arm-msm+bounces-72625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B47C5B496DE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 19:21:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96DD81891024
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 17:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A988731197B;
	Mon,  8 Sep 2025 17:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bq0l7xzn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA0E312826
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 17:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757352069; cv=none; b=GAeRfC6G/PcMNR6vXYxyBZKYbwjDKjl8S2Br/UDy9QkSMmdf5VXpiSSElUukJX5wVG8KobdncdijIjKPRzQEwawm4CJXK6LNTX70fiJpR0wgWl6qfd2ooQdb74ZGykvCHSToEwk+9xTvFN0HoIoVPAXuGxMhv3j4lc1iBbpZXf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757352069; c=relaxed/simple;
	bh=G4BrLvgleWaxxht72XKMAEEw2IxbTnc795ofruBpdCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AjpPjb5KaqFGop8BLoKBD2Euv/QRew9TAofAKkimpgk5wq/VR+XAne7tXfCMvoQziurUiroke0UlKmBW38hPZ/6wl2oujKwWOGvxN0Q/ikjlK0rTMKVJGp+46df3KWMo0OYKaRlBa4TrHuxa9gaWRyWcyOBv7Br6V+hYc5rozXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bq0l7xzn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588GcfK8014776
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 17:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ODZs9h0J4Tt9rKYM/lsBJZbKSKYYe/vF4vwiFuP4OVE=; b=bq0l7xznvGgqX4MF
	xG4StxRIL4s8AdMobbe01/TBgehMgPWm23PWSnnPksEcTPbDIQFf/rmLzlyhETcB
	DTS+nrNeSyEhrBMiV6d/baQyRKZ/qCg+nAjW/kf++s2qwAOnuO/G06zGWeqhSg7m
	MzEDCgoV/4CpWFqoOPW6lJ9ESFo7jX7N/tqoNqLqihEFaNVp6inuirYb+mF9IVAP
	RzbmuU9DPCep9rAdJU9xu456VsY7NwIvQ+ZK1MtKuwUuhGPVpyyEkz1cQsNcekeW
	t+W2TmHpPAt8z0v0HDU15WClPOhiOFmyrFVfJzRTkEw8vDcXDfNzv5gZDBQ5CbCz
	+K92Pw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bws5huk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 17:21:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24b0e137484so39244955ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 10:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757352066; x=1757956866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ODZs9h0J4Tt9rKYM/lsBJZbKSKYYe/vF4vwiFuP4OVE=;
        b=I/ELbTaaTZ0x5/M2HzhemtYELKYv/yw3z8bqJ8JGdL4/eV3ObAO4xF71txyBVT5JR0
         ZgFqry9DRnwaWPSNaeGotm/ZnNF+krHws2kp5BmsgdI4lUkZr0TviXjsGIGNFo3PXQZ1
         yZz9W76eOeFfFWfhxdv1kDj/y/deUb+0hlWtN7/V5YucWhKJi4VdjulHAicaigs+WR5d
         t141+ptcUks5taL4BSt36axtNYMge6fPyp+MNjQ9Q4ctK00Sb1+TrVX5IbohwSD9tJaf
         2ViaCMD3Opcoe10xj8FKymMwbw3LER/S6EFDgMcda/JsVK9mhRPZPH5fykbr465w/5Hm
         1K7w==
X-Forwarded-Encrypted: i=1; AJvYcCWxZtenhgz7OBSG/lSX5GLgu89gSCJsVWGGbt1yC44tI/4D9xTDD4tSphkNRAA/2eA5b6ObGBrwekEAjWKs@vger.kernel.org
X-Gm-Message-State: AOJu0YwwaXAbtHnzVXHThu+8fJZaVkyE1J4oHVDVkYm0lJPScG/Cy9fk
	hAqrnwhoK0ygRhl3qN4vZCOYa1ukuQONVQC5NTk6Ef/Us1qbesD4nQ6A79kfiqvEPUEJk+jfk9v
	j6muQVlWqAooFgmOYomqwEnUvAQJATrKTjw1St2BprLlk6m/NXMCKXh8ohVuSuG5NlvFn
X-Gm-Gg: ASbGncvWmicbtKHDJFJk+2E4b/wLn5CQ1q9yOB2ww8lPUXIBdaJQlWYT26CyojAlsfA
	5qclvKV4ZJsWlDQV52kRwb+L0hXqOWRrI4QrJKd82NONIIy+wakg2WRUqLbLHdbnT0AwR0L2yiM
	MV2fRrQy0HYeDEGYJpnU46JNCCsUizbPMjYUoSMA3emP35wiLY176A9/jA4sBZtIWnrSfF+oP34
	WkkIQWvAKdspRdtR7ewSF84AbAC46Uf/pQqbaldgBBmIMozh/2vNI7sMYUtdanoNGUYYCQNA2JW
	i5OUO9IPTn8y1wyX5f0+g5m4zEfPnHcgTeakdSq3PsQPTJ1ygYOaleHpagd1RrC4hsk3Cis5AvO
	OL3A=
X-Received: by 2002:a17:902:f545:b0:250:6d0e:1e4d with SMTP id d9443c01a7336-2516dbf1ec0mr110154045ad.4.1757352065872;
        Mon, 08 Sep 2025 10:21:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQkPNfzkAlHEBiLtjeXJpfUmFQcP93l7F9njp/9qBA4losfZNr9ZSj7Wz9mErmHUlusFnO5A==
X-Received: by 2002:a17:902:f545:b0:250:6d0e:1e4d with SMTP id d9443c01a7336-2516dbf1ec0mr110153605ad.4.1757352065134;
        Mon, 08 Sep 2025 10:21:05 -0700 (PDT)
Received: from [192.168.1.5] ([223.184.71.210])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327da8e71a8sm31147628a91.15.2025.09.08.10.21.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 10:21:04 -0700 (PDT)
Message-ID: <2f29addf-881a-4aae-9f3c-d8f20f8fbad4@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 22:50:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: monaco-evk: Add sound card
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250905192350.1223812-1-umang.chheda@oss.qualcomm.com>
 <20250905192350.1223812-5-umang.chheda@oss.qualcomm.com>
 <7bzlof2wyqqorhh4xck46wd43zlehm4vhej2oaxajo4dxn5p7p@oc3vikzxcwke>
 <nphea3rtl3z2tgpyn4g4hf7ticbg4kyhgv4ht25etfxspsgkv6@dm67wp7x4mdt>
 <5bbe50f6-5fa3-4685-8f2c-67986c5171ab@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <5bbe50f6-5fa3-4685-8f2c-67986c5171ab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HiAXxFxXPwRJUiqPezuH34X0-OTli0-K
X-Proofpoint-GUID: HiAXxFxXPwRJUiqPezuH34X0-OTli0-K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfXwdB7DVfyNWqy
 sMUU+QGwMdNEOeZHL2DZgO94MgVb3QBg2IpZAeihFVUePb3ty/XAcVWG9DvYk0rvPOUff1Znu6P
 r8pjOeZd2faruzxUtbU0LKy+4NF0KaSz7uqlJdS7M6ByjKNMA1CozqaSF9+OZ/Wnyvqa3kTtJ9k
 +4U/8pf2+IIaWbmXyV7Eb7DXPu0LXEX4l3VODRniKNDClNxWpOEDu+7A+GoY87fL55MMAmmbb/U
 7psV3i9HhGvkbVBwmDfgVi0jkhuOvwdvxYPc4qy8hwrwdHUd5r7ZovpfXPbkCyXgOFwCKzauzn2
 4McNF9ht/G3TcjirMy+B7AgeL2Q2pUNdN7/D7ZfROawaqv4mjsrajXG+hJymzyaEoEZxnFsKXQn
 e+MlpgAJ
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68bf1082 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xi+emkTUnFkL6NAgZCPIgw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=lD4_i0t_BDgHsDeZWuoA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018



On 9/8/2025 9:25 PM, Konrad Dybcio wrote:
> On 9/8/25 4:55 PM, Bjorn Andersson wrote:
>> On Sat, Sep 06, 2025 at 10:26:23PM +0300, Dmitry Baryshkov wrote:
>>> On Sat, Sep 06, 2025 at 12:53:50AM +0530, Umang Chheda wrote:
>>>> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>>>>
>>>> Add the sound card for monaco-evk board and verified playback
>>>> functionality using the max98357a I2S speaker amplifier and I2S
>>>> microphones. The max98357a speaker amplifier is connected via
>>>> High-Speed MI2S HS0 interface, while the microphones utilize the
>>>> Secondary MI2S interface and also enable required pin controller
>>>> gpios for audio.
>>>>
>>>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>>>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/monaco-evk.dts | 52 +++++++++++++++++++++++++
>>>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi   | 37 ++++++++++++++++++
>>>>   2 files changed, 89 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
>>>> index 93e9e5322a39..f3c5d363921e 100644
>>>> --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
>>>> @@ -6,6 +6,7 @@
>>>>   /dts-v1/;
>>>>
>>>>   #include <dt-bindings/gpio/gpio.h>
>>>> +#include <dt-bindings/sound/qcom,q6afe.h>
>>>>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>>>
>>>>   #include "qcs8300.dtsi"
>>>> @@ -24,6 +25,57 @@ aliases {
>>>>   	chosen {
>>>>   		stdout-path = "serial0:115200n8";
>>>>   	};
>>>> +
>>>> +	dmic: audio-codec-0 {
>>>> +		compatible = "dmic-codec";
>>>> +		#sound-dai-cells = <0>;
>>>> +		num-channels = <1>;
>>>> +	};
>>>> +
>>>> +	max98357a: audio-codec-1 {
>>>> +		compatible = "maxim,max98357a";
>>>> +		#sound-dai-cells = <0>;
>>>> +	};
>>>> +
>>>> +	sound {
>>>> +		compatible = "qcom,qcs8275-sndcard";
>>>
>>> qcs8300
>>>

ACK,

>>
>> If the Monaco EVK actually is QCS8300... But, I presume qcs8275 and
>> qcs8300 are identical when it comes to sound?
>>
>> @Mohammad, if this is the case can't we just support the
>> qcom,monaco-sndcard instead to avoid this confusion?
>

The Monaco-EVK board is based on Qualcomm's QCS8300 SoC.

Although the Monaco-EVK platform was previously associated with the 
QCS8275 sound card, the QCS8275 re-use was based on existing coverage. 
However, according to the naming guidelines, sound card compatibility 
should be based on the SoC rather than the board.

Therefore, it's necessary to use the SoC name in the sound card 
compatible string. I will update the DTS to use qcom,qcs8300-sndcard to 
align with the convention and avoid confusion.


> Commit 34d340d48e59 ("ASoC: qcom: sc8280xp: Add support for QCS8275")
> 
> Unless we choose to ignore that compatible and add "monaco", but I don't
> think dt maintainers will love that
> 

Agree. We used the existing qcom,qcs8275-sndcard compatible string 
instead of adding a new one, but this needs to be changed.

The sound card compatible should be SoC specific in this case, qcs8300.

I will update the patch with qcom,qcs8300-sndcard.


Thanks & Regards,
Rafi.


> Konrad


