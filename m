Return-Path: <linux-arm-msm+bounces-40558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0143E9E5BA3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 17:41:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF23B281BDF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 16:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC3C4221471;
	Thu,  5 Dec 2024 16:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cUF+4QTf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDAD21D5B4
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 16:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733416907; cv=none; b=J2V4rp7SI3VKwJDe0mPPII0m6zZpxMgfN1/8N6LSBD9Q5gG1mKzwm1tG4b7FN1sFoDScueVAqnOFCRNAM4aOGSyZi2bBIqCq4AqZVP2s5mdYuiyHuh3rgT7/0+kOM/8MQARvuJE6pMy5o5jhXodYYKga3nwHRHkNFPhi9WsVJBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733416907; c=relaxed/simple;
	bh=8tCfC6DI8nuiZrU/l+7ThDzR1R+6npDRvcbfa4SjJvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K+EpJtZozvOLsgfYo8FMClTGPF4W9YNC/85bARTRgNZs1VI8WOsx17U1cHwH7faedLFyMcL06IiPYIF8SvR8QCgppHC2izYqjIdo3QgwflJKdpdj21r2v/RGS/gEdHP7W2pA5EDJ6pJ7EDWZpiQ5Oy6Cix20SvUi9KEx1pOECWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cUF+4QTf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5AOL4u029778
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Dec 2024 16:41:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+VFuxyop2PNnaSHls4qUW96mpevEXDauAAvPu4uj094=; b=cUF+4QTfTryaaSAQ
	Igi16o5VeA5W+NR+D66HhfrmKAHoDfXB7pnCJMkAiGzLgfQc5uWiqCeh/13+Tcib
	whg/bnX5Bj554PEuDDwReSB1S44DeQhznfdWNYrWTFEDhh1LeBBzdM1su6q3Qsi3
	KocdHlzvYZMIcugnMvPqyuCjIuaPp+EK6Pxgzi2dSWX1red8w/GGNIvKf9bibc42
	slkVoc0Bn76/qLuDS4LsJ43a6N7vL8o0mg/j/V13LqO6t/WWx73HNTNK36jDpHb8
	fItg0CEgIDKoaWUkGC6qx5L2BTNIkt3j2LadeLxNg4IW+BKepBcOiLhawXmfukBY
	r5K+lw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ayemanpv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 16:41:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b67127ab77so6996785a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 08:41:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733416904; x=1734021704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+VFuxyop2PNnaSHls4qUW96mpevEXDauAAvPu4uj094=;
        b=ai0xb64pI+YyymFRgJluhXBo+VHS4VvxUJFGTTf0F+Acw+pXGYffaM7PVUEuKMwl2I
         lcVxPrCQ/3s2WWyTLLW2j/PNAIxz/TbGc+dkw7pd222M2OEUh5ysw5N1PDbq1LA4k2AC
         6Z45j/TfPLpeEWO/U2aTiRSxpapJ4OqZKPtMvesrYEJ/xTJVHC0OCuJDv4js2i71fOgM
         JrH92P1X9HTU9dSGg1tAZSaNAgZFhcH2f30iJXt3EpKL3bM4NdYg1heTLL5o4KWG5YDz
         Dym2/s+t0cnXJwH9Ce/wv+iOX5tCbhgxnfPhQQux+RSnDms86HVSm2blB9FDtDExoUYi
         OVdg==
X-Forwarded-Encrypted: i=1; AJvYcCWL9jtiPlE8a2dnYQvMP9Sr23VhElDYLkhoPd+hygD41RydvprSN1ey9HSp+s05908RuUeVLbGD949xMlll@vger.kernel.org
X-Gm-Message-State: AOJu0YyUbKayQehq7sfmQ1ARzaGa1YV6LU5+eQNq5ji7cdhfB96tXBiO
	5Z+WpWz+hbxNfRKmImcNzPV4FPZ3DpaXmPeUByr06bh92gPbgozH9Z+QkTbEeLzyEV0qq0y3igV
	joDQR4eXeelPWoWpRLkZyCyDsXTCDiWh5ag1bloW5wKBlRVTExhhSwZqtmWiOdshm
X-Gm-Gg: ASbGnct2irh6gtCkcG9OEwGl7bal4vyk5f5zOJsxn7JehHWhvumrwWShDdaDAukv1II
	BrN6gglccf8gP6+lezALr8R1eeg2RZysNfKg7ldoZWk52442ogW2Mid4h1nObdkjTuarjNdcmmU
	eQC+LcjeGQgepiId3jIVxSdi9msJIiZ44lusywKbSGY13RTpptgBa9wra/BnwsTimMX3Kzgs8QH
	i2v/64hOR/9QJ/McVyEW/T+m4/WjuAo+bThLM2cYKc0v2PQFta6xdZbWpNF7ukKiA+6JA6epjA2
	mMhxquXRqjOw8XEcKUKl7SHT/JZm5Cg=
X-Received: by 2002:a05:620a:40c1:b0:7b3:2107:2eef with SMTP id af79cd13be357-7b6a61fc9e3mr649624385a.16.1733416903994;
        Thu, 05 Dec 2024 08:41:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDAYsrnvectLyVPPs3uQAzrZhInb/RiKYTZnAB1ahxYrWqzq0rvF35LDg9VeTAi8PUk++rCw==
X-Received: by 2002:a05:620a:40c1:b0:7b3:2107:2eef with SMTP id af79cd13be357-7b6a61fc9e3mr649622885a.16.1733416903640;
        Thu, 05 Dec 2024 08:41:43 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d149a25cc5sm998819a12.7.2024.12.05.08.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 08:41:43 -0800 (PST)
Message-ID: <b0702e0d-b33d-4df5-a0d9-06928e102d0b@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 17:41:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/12] arm64: dts: qcom: sdm845-starqltechn: fix usb
 regulator mistake
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241008-starqltechn_integration_upstream-v6-0-5445365d3052@gmail.com>
 <20241008-starqltechn_integration_upstream-v6-3-5445365d3052@gmail.com>
 <33e14868-e6ee-45ca-b36c-c553e0dcfbef@oss.qualcomm.com>
 <CABTCjFCTggnU7UvqcKYq53iRLACBxWE7C1TKRi7dr42o-=0Mqg@mail.gmail.com>
 <df3e3989-f588-4e53-b6f3-bf8c36330911@oss.qualcomm.com>
 <CABTCjFAMLOmUrr5+spyWJb_XFmwqC_wE94cHLLRrUeVZGJkJrQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CABTCjFAMLOmUrr5+spyWJb_XFmwqC_wE94cHLLRrUeVZGJkJrQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EqOCx-IRoi99EE0RZouiW-X0FzEHsxwa
X-Proofpoint-ORIG-GUID: EqOCx-IRoi99EE0RZouiW-X0FzEHsxwa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxlogscore=979 phishscore=0 malwarescore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050121

On 2.12.2024 9:10 PM, Dzmitry Sankouski wrote:
> пн, 2 дек. 2024 г. в 18:09, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>:
>>
>> On 2.12.2024 2:41 PM, Dzmitry Sankouski wrote:
>>> сб, 26 окт. 2024 г. в 13:41, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>:
>>>>
>>>> On 8.10.2024 6:51 PM, Dzmitry Sankouski wrote:
>>>>> Usb regulator was wrongly pointed to vreg_l1a_0p875.
>>>>> However, on starqltechn it's powered from vreg_l5a_0p8.
>>>>>
>>>>> Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial device tree for starqltechn")
>>>>> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
>>>>>
>>>>> ---
>>>>
>>>> I really really doubt that the supplies for on-SoC PHYs were altered,
>>>> given these regulators are assigned based on their specific characteristics
>>>>
>>>
>>> From rooted android system from klabit87 on starqltechn:
>>>
>>> ```
>>> starqltechn:/ # cat /proc/cpuinfo | grep Hardware
>>> Hardware        : Qualcomm Technologies, Inc SDM845
>>> starqltechn:/ # uname -a
>>> Linux localhost 4.9.186-klabitV6.5 #1 SMP PREEMPT Thu Dec 10 19:42:53
>>> CST 2020 aarch64
>>> starqltechn:/ # cat
>>> /sys/kernel/debug/regulator/soc:rpmh-regulator-ldoa1-pm8998_l1/consumers
>>> Device-Supply                    EN    Min_uV   Max_uV  load_uA
>>> ae90000.qcom,dp_display-vdda-0p9 N     880000   880000        0
>>> 1d87000.ufsphy_mem-vdda-phy      Y     880000   880000    62900
>>> ae96400.qcom,mdss_dsi_phy0-vdda-0p9 N          0        0        0
>>> ae94400.qcom,mdss_dsi_phy0-vdda-0p9 Y     880000   880000    36000
>>> 1c00000.qcom,pcie-vreg-0.9       Y     880000   880000    24000
>>> pm8998_l1                        N          0        0        0
>>> starqltechn:/ # cat
>>> /sys/kernel/debug/regulator/soc:rpmh-regulator-ldoa5-pm8998_l5/consumers
>>> Device-Supply                    EN    Min_uV   Max_uV  load_uA
>>> ae90000.qcom,dp_display-vdda-usb1-ss-core N          0        0        0
>>> 88e2000.qusb-vdd                 Y     800000   800000        0
>>> 88e8000.ssphy-vdd                Y     800000   800000        0
>>> pm8998_l5                        N          0        0        0
>>> ```
>>>
>>> I also downloaded kernel source from Samsung, to check its dts,
>>> and it also powers qusb@88e2000 and ssphy@88e8000 from 'pm8998_l5' regulator.
>>
>> Interesting.. could you try to forcefully shut down L5A (I doubt you'll
>> be able to do so with L1A given it powers so much digital logic), or
>> set its regulator-min&max-microvolt to a way-too-low voltage (vmin
>> seems to be 312000)?
>>
>> You should then be able to tell fairly easily, depending on whether usb2
>> still works after a replug
>>
> 
> Usb doesn't worked in such experiment:
> Here's the log:
> ```
> [    3.541733] ldo5: Setting 312000-312000uV
> ......
> [    3.808224] dwc3 a600000.usb: Adding to iommu group 5
> [    3.823116] qcom-qmp-combo-phy 88e8000.phy: phy initialization timed-out
> [    3.824323] phy phy-88e8000.phy.0: phy init failed --> -110
> [    3.825916] dwc3 a600000.usb: error -ETIMEDOUT: failed to initialize core
> [    3.827208] dwc3 a600000.usb: probe with driver dwc3 failed with error -110
> [    3.828548] probe of a600000.usb returned 110 after 20399 usecs

Wow, I'm really surprised

That said, thank you for confirming

Konrad

