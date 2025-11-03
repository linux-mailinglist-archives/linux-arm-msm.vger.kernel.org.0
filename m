Return-Path: <linux-arm-msm+bounces-80108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC9FC2BEB2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 14:02:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22B4A189771A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 13:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2EDB30E85B;
	Mon,  3 Nov 2025 12:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aSD+Imw/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P0bCYWOH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4067C3195FF
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 12:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762174425; cv=none; b=Ue2Pvz0ofuAGBe2o8qJOGt8vrPsMfE9NMxzmok1MF/scJuZ6yiozTT7+F2qcdPOo3657ieO/MDFWQbfV0Wh5kyjRwiHJ7TcEfPcBe252G8oiK6gGO12FadnJcjFDMS9f3aKha76Tb2b/LCyifaicZovQImAtvz43qzw8cdq/yfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762174425; c=relaxed/simple;
	bh=1wYrgHk/Gj00tL7hbYZsPkW7MBkl+SSNPNUVHLYU5j8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SQJkR+ZVyG8r+WpF/HZV/WkgNRMx78gJLzsLaXzTddsEHpuU87pJE5Bsy0eQmhT/4E9Ooa4mQHkRFP4lS4gHigjWgeWNmh0eQfKOiZ5C0U8Gqd0GEcXC4jz/tUHSlANysCrexgWf4THWGBWI83Q4Y20eL9dK5oeDku+VQvoUG4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aSD+Imw/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P0bCYWOH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3CRbpG2269714
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 12:53:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bxF+pw1zVBYAxmH1x/gb5w43+tVAZMY4bZ6Gc64J6so=; b=aSD+Imw/64dTf3Cz
	CWM2kTnzZ0B8giO01FmZ1lKD5MzCvbIHSNTBWmIgkyB5F110eU9iQVuAFt+87Pld
	ptsgq8P+LvFNdEZstu2WCyUZXPlYM/9rqXWMyzbRwXths/h1ln2zZJ/vYTavauTU
	r5j9638duYBAc/lwhIg4xMYcZ0WjEG51LyQ1S5knn4XaIHaqMdNv0KtpPrBvkq7P
	Q3fjABggJ9CFRruE5AVQaEnHbQAIePjVFVhTAccxpJcN9x+T73Sc201VzaWUilrm
	6xgkCqw+MPkBFqh9YOe9Vp/kismOoQ15KYMqI72rGPkpJEwEo21X0ubRJKWpj6A8
	avasEg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6pv795bs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 12:53:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-883618130f5so177230185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 04:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762174422; x=1762779222; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bxF+pw1zVBYAxmH1x/gb5w43+tVAZMY4bZ6Gc64J6so=;
        b=P0bCYWOHzuorQAwoB66OipFHsVULRfEB54baseqHBR+/zmkD1Fc0gbASfEi3cE7Yov
         I4yopUvzMaSiuAK5JDCJhqXzNr8WHm408NWxhTAmEOwBUbT513MCX5uKOKSqNZY9CkqB
         Nr9roAcSr8d2FI8RUZFgt/PD0ItwmTAVrmYeI5LPn5IcJYSID7I7rIrD25LPwrN5u/gg
         7Qv4G/kHo1IassY7TFVQCnSH7v4ELBLWSS3cFKJ/ud9h+J6aFDzYflfFDbZ0gOd3Gfjq
         O3+/C7b3662bdOu7H6hiIgkH7UDje91psyh0nzmNPSQYXOMp3sVaR4pxv5o1OvLnsGa6
         GFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762174422; x=1762779222;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bxF+pw1zVBYAxmH1x/gb5w43+tVAZMY4bZ6Gc64J6so=;
        b=YF2GfWfUALLLJCdJCGweOIhJGh8FGbsjqreWFrrMr4mMMuhFRJxnXPMfSKCAVrs/lK
         bY/Z0ZFQS45grkiUqzZzAUGnz1930i3g7eWEDwStfLtVqt7aQOWa8BIfyKITOM0NKlm3
         oOK3D465QFo6Heqg4/DParXElABh+pyMd96KOXdYCO543yZEznouUazdPFhw18bKeGzp
         CHdpo085lzvEm2NNrCyTwF8HJuDLunZ8c4BjethrqrI7/bfb3Yr/kMja/UxJvtDR/IW7
         h0R87DWSESUU099sfBIS1JBxbTKT7KspFZRVyYdcBu8rpjwm3e3CHcieyNy3VrCmAZPG
         xMaw==
X-Forwarded-Encrypted: i=1; AJvYcCUCzlYcWd0F/8iTX4XFXiVa0hswGO7R7wM9UeEZF95okJSh0fbUgRE5gTyHnCyR2jLuBTJG0DOrOfmvQM+P@vger.kernel.org
X-Gm-Message-State: AOJu0YxwffbIVfyksMU9aEHjdQQ/1quwVvtjU/VyJS7/JH3fr4mDIEle
	JzG6sStKZZindljvFuJpjfMUbxkQTuzNAweIdGaVQnN3B7LbNSioYMhKrKGTaMTQ71J6I1RxLlU
	1uMPaOpclaAqvgaNatRJXuIwS5GgUi2yCSrL3T5XM59Jhf5+vvHC2/PENomJOnbESE2y/
X-Gm-Gg: ASbGnctRCTa5w+fShsKaKTv0/6mC9eaz47dOWMYg4qIZ9A3jnFSJ9oavB0jHydr/C9R
	JXYK6RrbjZvVYw2qRBMCHKQ3G6t68MdNxFrxvvjD2Zzohs2kKEuq8qeRhH0S3OoBZpeNpbaniKX
	QGbygwXZUeWifAGZbuL5cx/ggFd285WUe4FS1Uy2Or6u9IvXl/G4xKhAnkQn03pjqCbpIGy7nqB
	jGH784r5EZXZ1kAsxs1VLZojONOGBhHbN/ZY3h3b1yrxb/P1tBO9i7dNDHBG38UU3jcdfEbZwgL
	J2i87Y3YB8l3+VzxCzOLmdxGQOa2xtQRu90DbCP3JZgFNbnRS2uncEAZUVxE5XNJilNxQnBpNIp
	vVEjGL0SL6Tz6Ms16vh163wH8sYv69b/KCTXjPa3O/ncXqJ7ucbkHUtZ3
X-Received: by 2002:ac8:570f:0:b0:4b5:eaee:1c04 with SMTP id d75a77b69052e-4ed30b544b5mr104981941cf.0.1762174422153;
        Mon, 03 Nov 2025 04:53:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8H0MJvRXjz3VH2JK9oQTQUjhfCpR6bqAcJlkZ0fUgM+AKwXIeO4BOiXXF9jPT9jmZqKcIdg==
X-Received: by 2002:ac8:570f:0:b0:4b5:eaee:1c04 with SMTP id d75a77b69052e-4ed30b544b5mr104981541cf.0.1762174421616;
        Mon, 03 Nov 2025 04:53:41 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6407b42821bsm9610306a12.22.2025.11.03.04.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 04:53:40 -0800 (PST)
Message-ID: <7e56027d-4de0-444c-a924-6dd0e27c6689@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 13:53:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] arm64: dts: qcom: rubikpi3: Add qcs6490-rubikpi3
 board dts
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: andersson@kernel.org, casey.connolly@linaro.org,
        christopher.obbard@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, loic.minier@oss.qualcomm.com,
        rosh@debian.org
References: <549a6235-dadd-4136-86aa-c96400373722@oss.qualcomm.com>
 <20251103123305.9982-1-hongyang.zhao@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251103123305.9982-1-hongyang.zhao@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: q-jRJYmAFfw_YaYH0tckH3Dpmn8Vvoyo
X-Authority-Analysis: v=2.4 cv=A7dh/qWG c=1 sm=1 tr=0 ts=6908a5d7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Wdb1h0LgAAAA:8 a=xNf9USuDAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=ue3jtdYoYviA1ZoLR-oA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=j5gyrzqu0rbr1vhfHjzO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: q-jRJYmAFfw_YaYH0tckH3Dpmn8Vvoyo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDExNyBTYWx0ZWRfX5zaLUO24pVO+
 Ck87ljLfNesSl1VA8Z3Q1HHCqPPmx7mHrMSwS7jHm2HRZfw//8jEiO0JV1PsaF5QQuLMsNEC8iz
 jHSJB0ExwB95G0bk/QUYtBMjdY15SUWe1u2shBpogXV/4dbfPL1jq9NcfxfMQJwfWNBeBOyIIYs
 rDfWEYe0/PAnSs+aj0YtQAHRDpYl1hXnyO+bgD4FzZDLQ2L7nEAaBumZchTOztMPdh7oLpHGJPu
 veSTZA88/sxxsl3dAoBHgU3zkIEAZ8nIhC2bnApHw1/ZYFLR5N4CBUj0e2SWKHYwjzSTpPS2LAN
 XUUYSoWXeP9ui2VQzQih7DWjM4bxqN7Z25n4jT29qeGFd7XUxdQ0wM+WPD2WG6eI3CLfIrZkNQI
 6mKxYn8qSGkwdHJrv3ofjE37UrZ2ww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030117

On 11/3/25 1:33 PM, Hongyang Zhao wrote:
>> On 10/31/25 10:27 AM, Hongyang Zhao wrote:
>>>> On Sat, Oct 25, 2025 at 08:27:22PM +0800, Hongyang Zhao wrote:
>>>>> Add DTS for Thundercomm qcs6490-rubikpi3 board which uses
>>>>> QCS6490 SoC.
>>>>>
>>>>> Works:
>>>>> - Bluetooth (AP6256)
>>>>> - Wi-Fi (AP6256)
>>>>> - Ethernet (AX88179B connected to UPD720201)
>>>>> - FAN
>>>>> - Two USB Type-A 3.0 ports (UPD720201 connected to PCIe0)
>>>>> - M.2 M-Key 2280 PCIe 3.0
>>>>> - RTC
>>>>> - USB Type-C
>>>>> - USB Type-A 2.0 port
>>>>> - 40PIN: I2C x1, UART x1
>>>>>
>>>>> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
>>>>> Reviewed-by: Roger Shimizu <rosh@debian.org>
>>>>> Cc: Casey Connolly <casey.connolly@linaro.org>
>>>>> Cc: Christopher Obbard <christopher.obbard@linaro.org>
>>>>> Cc: Loic Minier <loic.minier@oss.qualcomm.com>
>>>>> ---
>>
>> [...]
>>
>>>>> +			cpu_hot: cpu-hot {
>>>>> +				temperature = <90000>;
>>>>> +				hysteresis = <5000>;
>>>>> +				type = "active";
>>>>> +			};
>>>>
>>>> This has the same value as trip-point0. Is it intentional?
>>>
>>> I overlooked the temperatures in sc7280.dtsi, I will remove cpu_hot.
>>>
>>> Additionally, based on Konrad's final suggestion in
>>> "[PATCH v4 1/2] arm64: dts: qcom: rubikpi3: Add qcs6490-rubikpi3 board dts",
>>> I will remove the cooling-maps node (user space service will get netlink
>>> information to control the fan), and finally change to:
>>
>> My suggestion was to fix the description and wire up the fan. I called
>> your userland service creative because I didn't want to use the other
>> word that came to mind.
>>
> 
> Understood, I will change it to:
> 
> &thermal_zones {
> 	cpu0-thermal {
> 		trips {
> 			cpu_tepid: cpu-tepid {
> 				temperature = <65000>;
> 				hysteresis = <5000>;
> 				type = "active";
> 			};
> 
> 			cpu_warm: cpu-warm {
> 				temperature = <80000>;
> 				hysteresis = <5000>;
> 				type = "active";
> 			};
> 		};
> 
> 		cooling-maps {
> 			map-cpu-tepid {
> 				cooling-device = <&fan0 1 1>;
> 				trip = <&cpu_tepid>;
> 			};
> 
> 			map-cpu-warm {
> 				cooling-device = <&fan0 2 2>;
> 				trip = <&cpu_warm>;
> 			};
> 
> 			map-cpu-hot {
> 				cooling-device = <&fan0 3 3>;
> 				trip = <&cpu0_alert0>;

lgtm

Konrad

