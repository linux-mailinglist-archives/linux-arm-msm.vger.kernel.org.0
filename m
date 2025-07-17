Return-Path: <linux-arm-msm+bounces-65542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEFDB0957E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 22:10:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72B84174EF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 20:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBFE21FE45A;
	Thu, 17 Jul 2025 20:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yvs+WD0v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592791DE4E1
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 20:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752783023; cv=none; b=T6OUR77gFqGLMK09uYC8T07r4WK5QN+oIVpiRhCv79rx1prVk9ZryZkHowh6r9EdRWkNOAQgEqoo6dVZcX2/cBf6MpderfF37w/Ervl0ZB3YITof0qROxIk0Fcux2tCdt2MprA4d3kRqi4Hu8nZyF24VpO6Xa38pDHndrK3gt0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752783023; c=relaxed/simple;
	bh=EKPy52oDvGVZSqhCAVKk47J2X7s3CsyNooGD7tK/m/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=joXzgh6ifgi1Bqlnxv8dRLxMAdrZ57/iDUz+gW9dEejRkGWA3CZ9KtuUeyFg9/miKmdQLURShpHQy1PqjK4Ev/wDGFmzTJeqCwVMfSNzzzdpkk/xr/VR0Ufx2zuphhQ8qO8LPbUhqnTPawGEz+2qx5Qa+dTwQuVLNJX+SnlTVMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yvs+WD0v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCB5MH015626
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 20:10:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cYmO1GfNb8ToOrGv1oJJtmJMYTy9sY9g5g+UCjbEQSU=; b=Yvs+WD0v1Vs9fhxP
	s7ASfobm5K0SuvMJSVGkgoYSVHCxiLbwnbtxNcg7zfXi0TS8fHRn/GDgRO+CZlUE
	mOaFAMkkY3nSor2LSpwysqq15d8SpeOSUQX9KFjijN0o6qe8dZdjefshrEFhJko2
	cYhumOKdSSdlneojGuYX4/c9lg++JgogmhXp9s4U9GnOPNftpnlkHw15RgFBWAbu
	tohdak3Ttze7/EtERgpE3AlbMA+xWLuRVw0ck906PA4Ueri55u5MDt8cSgqDLd37
	RifYOUr8S/GAIParP+ZSaMUMubdmxyRFP6A3X+6CsF5LfojaElqWUkVNXC4pIf40
	1SSRZQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dyv1y1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 20:10:21 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6facbe71504so3137166d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 13:10:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752783011; x=1753387811;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cYmO1GfNb8ToOrGv1oJJtmJMYTy9sY9g5g+UCjbEQSU=;
        b=TOTT+i0ALPABAK6+chCSK4E+OF8mSw1kGDabxsiyWxC78u34xhdfUHqMNGT8StArjK
         lkrx5L2DZ9HtA+EGHK1J21P6UKhXcczSoSxloXnY3kgg1BRrDdZulK/3cZ7NmtzSxKKf
         tpOtqXpJuJ8FN4mMVOE0278/ZVI0rDy2in0tNwqgNTCIAvss8LzuT7mkkgWHNOYOSjPJ
         OXG3A4ESamrVtl5/A6IBBIgnjXZUuk+cNci64gZeFOcb8upHI73zTYK31Xl1RJw4II8s
         8AmmQJubS93am8qnY50dYVCtz29XyQ3iAppjenvY0MaPsQy475BM9UOLpnsAgeuB8Cp3
         0JDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLhBZ76Writy0zyJl6tjH/STcxYTkEi5Ibc8FsDaRq3EvPYe6GQzJmy290ZueBm9tYCPHmZjyhtgqQjsJ4@vger.kernel.org
X-Gm-Message-State: AOJu0YzNazyBIJjwsV+TzF5gKhEjdCmePoazZlk7sok2htlJIwTQr5gH
	T0GVOU29ef/bMtb7d3V9/WDlWsCwtbygLDdZUlgAX/m8QrwPj+umUwn5DRf8j3ww9tK3y7yK9pJ
	NIU/fUw9MuDtPcDaART2ZrjiNhM306UHapG5zWtBXtYijTxGMe7ngbt63DS/LBwLgNw5c
X-Gm-Gg: ASbGncvLpEAvSWOVLP1sS4OVT4wB6ebFxgmEpja21lwy1gdmTYYMHxKsGhHqK0sFeNp
	u5uplQcUVI4+LqeZXyZpPQRtQDsb8usaeTCoxpMMnbGrxVHClDEGSGe32lpvXhl3wQUZ40RQbzv
	SWgzguU6bHqtRfy9c+G027Rx4s0uBP9n0v2b5V8YV3aVZXXdUuql2gkzhRJtfs0tzxAEskv93oc
	NYwQ1NPaTGDuWUK3UWn9BmjnMFUnVMfKT7LcIUbWZ7XZFZdyqw32i8bu7cb5aPU6ayt3j9j9ze9
	AQCjwAj/IQbtBFM29EZ0TmZKo7OXc6pqRZx9Vmc/PlqiK6w+ag3/jwGidH7EuvEPxjqg8ZdpEQP
	NkX3ScJ57PW2rCwniEtUV
X-Received: by 2002:a05:620a:172a:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7e342b416b3mr491272985a.10.1752783011013;
        Thu, 17 Jul 2025 13:10:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOAfee9N81jpOmhQ5PZ3hk1t3eQcHZyJcOmJC48exwPfVSuJeo/nSdRV/0obqjOo192WJTNA==
X-Received: by 2002:a05:620a:172a:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7e342b416b3mr491269985a.10.1752783010505;
        Thu, 17 Jul 2025 13:10:10 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7c09dfdsm1407562266b.0.2025.07.17.13.10.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 13:10:09 -0700 (PDT)
Message-ID: <3a381014-cfe4-4b3c-a3c7-df688c1e87cc@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 22:10:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add HAMOA-IOT-SOM platform
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com>
 <20250716-hamoa_initial-v1-3-f6f5d0f9a163@oss.qualcomm.com>
 <aHkhcUVBnrwadKfa@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aHkhcUVBnrwadKfa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YZRH28LKpWg7ugj998vYcZesbEpVA4UM
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=687958ad cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=DGOirDVRF9kFrzJQLnUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE3OCBTYWx0ZWRfX6r8mDhOlK2Vv
 pWrbQQo7HOAeCfSQzKxAryghMMkaP9v14Q7OrasRyrcRi62+aoyi9nqAi7fQDtbCa9vUYh90END
 r130LIHeUnW8mGH0ABLaMOXRDfgsIfWJy6wrxT8yzbPnWi/YVqKwlGyRw4daduSXvtqUzIYEK09
 vDfzBVAVIMju1Gz0cfioqUov9gcsxqvGlYs3KeCI24Xq3yMlSZxhttc6w0Nb46Bat8CrhYccF35
 0iwY/mJAHisewWlYO4kgxq5yNsHakag9GzGJVXBQOdDfdBvUh+pRmvVz5Xh5cLm1DNDEL5STpqP
 y2i3NYu7iaW7Mc3IlzvcXDWHkho3fH8DZjQMTrnubLezZBgxPU6L9C+pI9i4UJ5ARSlZvEv4gQk
 sHwhOD/B7ie5AYSzUPdPLea9JLQlyM/zHWGjYcwAI9pb+2D6fXypdgiXP5q/0DxIrUpV+UZZ
X-Proofpoint-GUID: YZRH28LKpWg7ugj998vYcZesbEpVA4UM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170178

On 7/17/25 6:14 PM, Stephan Gerhold wrote:
> On Wed, Jul 16, 2025 at 05:08:41PM +0800, Yijie Yang wrote:
>> The HAMOA-IOT-SOM is a compact computing module that integrates a System
>> on Chip (SoC) — specifically the x1e80100 — along with essential
>> components optimized for IoT applications. It is designed to be mounted on
>> carrier boards, enabling the development of complete embedded systems.
>>
>> This change enables and overlays the following components:
>> - Regulators on the SOM
>> - Reserved memory regions
>> - PCIe6a and its PHY
>> - PCIe4 and its PHY
>> - USB0 through USB6 and their PHYs
>> - ADSP, CDSP
>> - WLAN, Bluetooth (M.2 interface)

[...]

>> +&usb_mp_hsphy0 {
>> +	vdd-supply = <&vreg_l2e_0p8>;
>> +	vdda12-supply = <&vreg_l3e_1p2>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_mp_hsphy1 {
>> +	vdd-supply = <&vreg_l2e_0p8>;
>> +	vdda12-supply = <&vreg_l3e_1p2>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_mp_qmpphy0 {
>> +	vdda-phy-supply = <&vreg_l3e_1p2>;
>> +	vdda-pll-supply = <&vreg_l3c_0p8>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_mp_qmpphy1 {
>> +	vdda-phy-supply = <&vreg_l3e_1p2>;
>> +	vdda-pll-supply = <&vreg_l3c_0p8>;
>> +
>> +	status = "okay";
>> +};
>>
> 
> Assuming the USB ports are located on the carrier board and not the
> SoM(?):
> 
> Are carrier boards required to make use of all these USB
> ports/interfaces? In my experience it's not unusual that embedded
> carrier boards use only the functionality that they need. Maybe this
> should just set the common properties and enabling individual ports for
> PCIe and USB should be up to the carrier boards.

The PHYs are on the SoC and if the kernel is told they're "disabled",
they may possibly be left dangling from the bootloader

Konrad

