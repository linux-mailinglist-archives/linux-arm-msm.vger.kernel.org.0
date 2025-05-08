Return-Path: <linux-arm-msm+bounces-57297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD622AB01AF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 19:46:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CF881BA2272
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 17:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD7F2868B5;
	Thu,  8 May 2025 17:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WrpuVVZS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC7527470
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 May 2025 17:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746726373; cv=none; b=uWH+m98TXbpJGTv14Lh6kYLisbniWif6Figze7uFkcojK/MzJXgkuC8fyiebypGFnjBCnotLLlPRB6qrBt09fWLUn9iJrYzBu9+yeOpr5DpS0K/thRvcliueYw3B/oS0FOVzmfZSlHULmNV3mK9+e16P3t6lxyCGSPxVr9rFV/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746726373; c=relaxed/simple;
	bh=w003YU9xFDtX8th5FrprcQ+2OIPdbMDpi8dif0gJMOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C80n7XXsyoCACit/eBn0SmbGP/UgJLZYcBlmpx/Fx8H/87mD193tA4p3+IwxE4CBgryzqinayBp5pvydtOz51W8tJmKwrB36nPm3dKODnf0czIcz9uvmm7WJP7KsCaqvMzU9vxjwlBIUexLhKxakSveLjqwYsN/9MAkohTu31CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WrpuVVZS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548DGXnF030761
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 May 2025 17:46:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0PMVomh58vUZ5beFSkyMxPogvfIP3QzcyNzI+dTinH4=; b=WrpuVVZS4znDT/HF
	0IE1KdgVRWHVF3SmODomh1fmvopfOFuLf9/+ql4/1XzMFLwGDGEuWqw0qnuVWHBu
	P/4dbUh2slIyi+ZvJknW7pvLfTFEs2yNPDNL4Cr6uOAM9/RKDT4rdBRSGSUrr65G
	/yqDVE/b9nl0FEHojIPMXjHvK3dOz9LBqacfcHcn0AktiCnlC9VEg4/EpDA67aOo
	f5CfcgBmvw0rYOlfRkZEGedD1FDgrt+VtKI25iBMhAtxLwh4g4ekJJkeEgkyivBh
	dHBbrD52jquX1Z8Tms1AQAXUP35nJPBrnEJVT4B4ogsmGJ/F7loKbWJgzYgXJv2A
	t80x+w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpgj4a4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 17:46:04 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6eeb8a269a7so3751166d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 10:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746726363; x=1747331163;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0PMVomh58vUZ5beFSkyMxPogvfIP3QzcyNzI+dTinH4=;
        b=XQXMfjWstm4cUUwPFKCXBq6f2mBH+XPlhMYBWEyWWJcN2bDm1zvi0Lt/2Jubf3BOgB
         E0kv4As3fG3ZFc927jS6aAt7GX7AmegbfyxYq2UjHNgfG+L0Q5mdQeysikIJ8kJeL73c
         +aR6eNpSU1yjSnfb0vSbk7iuwZBeBvLo9NV/1E1JAXx44otIINabt5HIOKUF9lxJ7G1Q
         uFoQHGHMe9yaICpLqheNrlHfXrAlw2zBkJ9+j9HyZBtvtkaAMISzM+i9SyE6lAFpIRYI
         W3O0ZwFHUxN37ckPbdwV68c7S9pNcLQdzMN4q49H0QmOe74q+idBlZT+duTfc0gxXSyJ
         wNqw==
X-Forwarded-Encrypted: i=1; AJvYcCUy4H5UEtu8Lybf7szZjHnOik7+iDy8AdPAs6jSPWsC4Do+Np/GGPwu1e8Wpipuz5gxZMeaC6BEZ+bD4ySE@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr4GXbvQ0CCUejUZoPgRHyPCsHfi2ZNHr1s0qcHxtSpVvMyGKt
	j2OY9pfsGJ7DewfPo4LVxyorlh2ft/LL6rqCO5+BTOn8gpyrx17aOyxLnXXiDyFVFPCc7EcJKM4
	1xrcLFOiAXZl/w+lBxWSsAC8T9wNe4OusyOCwDKc2c5hhcaKDOCsm/uAd/OoAjY/JZnljBrG4
X-Gm-Gg: ASbGncv/8FjKvr8tSonqqcbOIjmLkkwh3mQvF+IHcGX0WlOegHbgjsL5cu4pYwKKccl
	xvl4dPCKRBnghIxvDSvbWi4UaGheEcQO5LQMJdpBlRp4741y1e0dlfFJN3bdTvXNBZUTvECrA5L
	OgNvZJjtZvXTx9U6Akzu6+uiYZ70zQoKYA/N8rONsAA5RRrCGgavoVXTdZiOJ18ePdafNDiMOMW
	z5XhVau1KL/+FuZV83GUJONGXyCQpVEIwagSDlD5qzLKD6pjtX3ClOX0dDo65S4gydhJs2jvbGh
	aie8gGMXUo+wlkbhrQk275i1ylf5O06dPQGwhUHXkIme8QALpYHVUF2cITZcnKl/GG4=
X-Received: by 2002:a05:620a:bcb:b0:7c0:be0e:cb09 with SMTP id af79cd13be357-7cd01106a47mr24446785a.7.1746726363104;
        Thu, 08 May 2025 10:46:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8clsXOD1uC7oNiNun3OmM+46gt3lHglvyTV8F+OOv+jUYM+ZbwoXUOp6M03Tw5z5hkuz1dA==
X-Received: by 2002:a05:620a:bcb:b0:7c0:be0e:cb09 with SMTP id af79cd13be357-7cd01106a47mr24444185a.7.1746726362501;
        Thu, 08 May 2025 10:46:02 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2198b68e6sm16736266b.184.2025.05.08.10.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 10:46:01 -0700 (PDT)
Message-ID: <6e65aa95-cd75-432e-98bd-a8a03e38a35a@oss.qualcomm.com>
Date: Thu, 8 May 2025 19:46:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: qcm6490-idp: Add WSA8830
 speakers and WCD9370 headset codec
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
 <20250429092430.21477-7-quic_pkumpatl@quicinc.com>
 <7322bb2c-5778-48cd-8661-91308ea8cfc8@oss.qualcomm.com>
 <c8097899-42f6-4fa6-bee1-6af9208283d7@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c8097899-42f6-4fa6-bee1-6af9208283d7@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ao/u3P9P c=1 sm=1 tr=0 ts=681ceddc cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=P-IC7800AAAA:8 a=COk6AnOGAAAA:8
 a=DPA8SXBlki6BQVjMWBcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=d3PnA9EDa4IxuAV0gXij:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDE1NiBTYWx0ZWRfX0y35i1VUkXQE
 wFwtyRa3YcbQOC6yNb8pAe/31b1h8GNyF6/LNbo91QyB6DaJJxWGnpwmBUJ4aAldpP7E5ulk7YM
 SSAyTa367vSa/hddITz0yTRaFzXaAmf+RPV/twVTMyysT54Baw4hONntzmxKNZKYC1Wk4S85qiG
 f1yRnKkSIh/wSJQI4/S0RVnokKLBRiU2YyYqYcspoRFIo/FJEvQsiHQmcP3qlz9T1zgtUbQf3p7
 wiERU6gMgaHW7lzPKe99ekMv9IDdIN8GZZY3sNAwwED8wSLQg+zgRUi6CXUvgVbz2qWYL9nDwca
 vjbW72ZoQRXTJEhROB1x4naAV8glwIniXydYM/IR6A2GaM+ZHCbZaemUx2C2bpRMK1/mXMOqBIA
 jt662SkpdpHswE0SCvTbHbFO/k1DlivzBFb3hjg54h/Kjx+BVyRZqtNntHcgQvsIa+ggho8B
X-Proofpoint-GUID: ZuFUUePhlXvCI2N4HlwFZC6alIYhY5AY
X-Proofpoint-ORIG-GUID: ZuFUUePhlXvCI2N4HlwFZC6alIYhY5AY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-08_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080156

On 5/8/25 7:01 PM, Prasad Kumpatla wrote:
> 
> 
> On 4/29/2025 4:31 PM, Konrad Dybcio wrote:
>> On 4/29/25 11:24 AM, Prasad Kumpatla wrote:
>>> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>>
>>> Add nodes for WSA8830 speakers and WCD9370 headset codec
>>> on qcm6490-idp board.
>>>
>>> Enable lpass macros along with audio support pin controls.
>>>
>>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>>> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 162 +++++++++++++++++++++++
>>>   1 file changed, 162 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>>> index 7a155ef6492e..1a59080cbfaf 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>>> @@ -18,6 +18,7 @@
>>>   #include "pm7325.dtsi"
>>>   #include "pm8350c.dtsi"
>>>   #include "pmk8350.dtsi"
>>> +#include "qcs6490-audioreach.dtsi"
>>>     /delete-node/ &ipa_fw_mem;
>>>   /delete-node/ &rmtfs_mem;
>>> @@ -169,6 +170,30 @@
>>>           regulator-min-microvolt = <3700000>;
>>>           regulator-max-microvolt = <3700000>;
>>>       };
>>> +
>>> +    wcd9370: audio-codec-0 {
>>> +        compatible = "qcom,wcd9370-codec";
>>> +
>>> +        pinctrl-0 = <&wcd_reset_n>;
>>> +        pinctrl-1 = <&wcd_reset_n_sleep>;
>>> +        pinctrl-names = "default", "sleep";
>>
>> Does audio work for you? For inexplicable reasons, it didn't for me
>> on rb2 when the sleep state was defined
>>
> For Qcm6490-IDP board Audio is working fine, Not sure about rb2, Could you please provide more details about rb2 ?

I just mentioned it as something to keep in mind. Someone else has taken
over that work since.


[...]

>>> +    wcd_reset_n: wcd-reset-n-state {
>>> +        pins = "gpio83";
>>> +        function = "gpio";
>>> +        drive-strength = <8>;
>>
>> Since the definition is otherwise identical to the sleep state,
>> you should define the (other) bias type that should be set when
>> active.
>>
> Taken the reference from sc7280, which is working fine.
> Link for reference : https://elixir.bootlin.com/linux/v6.15-rc5/source/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi#L841
> 
> Will cross check and modify if required.

sure it will work fine, but in the same spirit typing 147 as
1+1+1+... will work fine as well, please doublecheck :D

Konrad

