Return-Path: <linux-arm-msm+bounces-77541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C33CBE2AD0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 12:12:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 412A85066FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 10:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50D6C319611;
	Thu, 16 Oct 2025 10:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QVXTragP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A20D328600
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 10:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760609204; cv=none; b=iedEV0N8fVtHoMTZSBr0I4tFqV/eGRnhOSpFLIfNLgJlW1X0ei0FrB6/KLmASiyz9jv00ZZNfJiH2bDb/XYh4e6oSQQXGVmeFO38gZr8gN/3hcFsFpvq5mCvOA/A+IhI8ASJDZUUeP7usMzXPAA2zrPr9kTunzszgaJQSDrY20c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760609204; c=relaxed/simple;
	bh=xpmb1rSKDBYVs0ZMo28LoKbxEVeTzVqOi0abcXdHxtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mLurANKXa8K7GPRjgBPkegJITDJHqsNexsWE+qlyt36u/FPsX5HyTwiKNweRQiZFGRgZek9hx3W/OyfiZCZbBQmNLai8PrL7OZ5JlqhutO9WWGSX7Tq4CUEjkIjtTutHkmvk+Oy9es+LPSv0jKYyax6d7+VWsr4uatYBoz2vC94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QVXTragP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G7o78h009987
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 10:06:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	btLg6GN9YLzsz1xX+GGVP3PQNjxmkDe+f1IkrCL/lTU=; b=QVXTragPiypYlM/7
	h5oJHjRNN+N8hp9RgH1BhOBNzsGy75QmyIfZa6ZnMLuQqxpk/Stnbo1lLzYWpmsC
	p9wilW16SxOn3in3IervbDZLFCOa03v3CvGZK0IhuR0bxk+pdi/NxFdpguR02UnE
	VXVkObkSSAgW9GnXWuhrMsq2rTMFZqYoh8Gl0hAjy6AhzgCf5zRoqOH0pkAC3dml
	VYfGaYaEj4KiwPBhlte5sRSHho6SpPQDSezUPUJ3DvWVTC6vuLy8XrYLTEtwP/mG
	2BHUmDbDF4Pq3yoNSypQ3Ex3nCymZpsM3DX4nEh48dT8u3zxqS0O4OwiWanHx+IT
	eHW2SA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0c7rk1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 10:06:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-88e965f2bbfso25665985a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 03:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760609200; x=1761214000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=btLg6GN9YLzsz1xX+GGVP3PQNjxmkDe+f1IkrCL/lTU=;
        b=Pk2JwJyp4B484SoqQTuFcBu/gXvAwGO2wHY5+aPAGBuliWdMYVagZpBp9HRDDY+4fP
         8ZcEGGlw9izMquNMvPizimHGPpu++ejNZFkxW9vqS/an81dkOO4D3o5YydvesEi5d9rW
         eK9MGNlJ4NCVzwLeKqIKASBGQ2XCcScMbWxHGx7AV7Hhv1jdwxppalktQi0hZMQOoP97
         jt3y3Kn/CCBTL4ARhDyrFbJsmNHJ0XaOQBpO0M9rzUFXO2B84J+aF5uAVb+rH7NpAhE4
         7EBjgCUqT3LtwY27K5LIujA6FjeSe2r+F8H/mQffMK0eOIN7htLgusH4wfS6fATnwqJP
         49Xw==
X-Forwarded-Encrypted: i=1; AJvYcCXSt9HsFntRrQ0512+2X/Xf0qvkJHCaMZHzbgC5eEsBgZ7/riNYHuqvdTQVjQ660yUwni8FW9unR0OebZNw@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlx4gqM49U4gepANOvM0N2umK9pMfpUUwpOLvRauz3BgEtpdRP
	Xi0vE3StJubw1nnFgGhq564XGBvKM6SNwErIiMXmk2kujZdlUmgP08cNIPawX0zVIx0zoh2/XFQ
	fxckzQnZlUISJa3+zaLmn7uzpXxLQBhg4P8jsAWEKXbxJTNttbDIZCc/mgZSKy4iAwi5n
X-Gm-Gg: ASbGnctAPo55LRNNDvcRnLM4pFdqND6qD22EHH9EiW5RnM/dHLYtfoFJSssXvSONgvn
	ERYf3Ab7Qv4wYLf1uk5ISPQTfY3Wt/UlshKKIr3E3QolD8sDHtwox30I13AnkhzqmJIbcCN8d7q
	S6Pe6DQf/FOFC81rDlZMzZMaAm8w8PdTQ2ys8GWb7STwE8TRXcIetD83/WDe+6LH7Dsuhyamji2
	x51eru+/uga5PBCfuoLuzXACY3eZ6KsBpkuMWEAE2oWhAyEwAY+T0mI5NblTsNJ2iQftdTMNet4
	odZ/XNL147br0aZkhclB/ZlMvyU+RBD6uGLQU5aV8HSWPxQZF7uRB8qFfYJaZ17heospFzPHQHE
	oJ7CvSL1ijzxCrh4fFWrI6xdSo5YHxnr21WbdMaEYE0AwO9/sCSy7YDTs
X-Received: by 2002:ac8:5890:0:b0:4b5:e4dc:1ee5 with SMTP id d75a77b69052e-4e6eac94c8fmr330023481cf.3.1760609200461;
        Thu, 16 Oct 2025 03:06:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFA3ifaqe1DGct9SvZ69E0sm18fTKOHfHo1FLVxYmFpMb1EB/sg+To9f+tLAZtWy+wviEjOMQ==
X-Received: by 2002:ac8:5890:0:b0:4b5:e4dc:1ee5 with SMTP id d75a77b69052e-4e6eac94c8fmr330023151cf.3.1760609199881;
        Thu, 16 Oct 2025 03:06:39 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5235dccfsm15435695a12.9.2025.10.16.03.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 03:06:39 -0700 (PDT)
Message-ID: <8bd5486f-38a9-4104-8d09-234f642b45fe@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 12:06:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: r0q: add touchscreen support
To: Ghatto <ghatto404@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251014044135.177210-1-ghatto404@gmail.com>
 <20251014044135.177210-4-ghatto404@gmail.com>
 <e114504e-4bdd-46b9-b708-8eebc3075163@oss.qualcomm.com>
 <CAMQHOhfjsi1L+3j3TrcjEjPp3xkn94KOdsrVZvJCyUDFBBSeqg@mail.gmail.com>
 <d06a254f-bf54-4bdf-bd09-3ee5e5b31bad@oss.qualcomm.com>
 <CAMQHOhe=WYhtsjHMcRnJOi8UhnNNBfveTWRGSZ_bg24gFysAEw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMQHOhe=WYhtsjHMcRnJOi8UhnNNBfveTWRGSZ_bg24gFysAEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: K6lcf2tpr_WLx9pLGgSos4xKSmc05ylv
X-Proofpoint-ORIG-GUID: K6lcf2tpr_WLx9pLGgSos4xKSmc05ylv
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68f0c3b1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=fGO4tVQLAAAA:8 a=EUspDBNiAAAA:8 a=6DzVY7LKAAAA:8
 a=Z3UwoYWmb9_2lah6h-gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=C-ghHgbq7mZpV9eKepqE:22 a=poXaRoVlC6wW9_mwW8W4:22
 a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfXw05PsZvfpPxk
 vOMXWImbsSJHBcUNgy+/jDWXLsJ/C8z4aHXofBkSfSShb0mCTuG2FVJ0zIFYMsMJ9M6mxUzilJ3
 d4ed/5pSPzc2d3wpSyOcRa5NE/LXfED6fPi1bL5qYzNPTTh6HJ8sytiCOvg+ohMnsMW+HOS6gz8
 Sso2DglyvEmmyfwDer55TK5RFT0ZQPiZxYDEkHubUiyN+040dArAzOe4oPbpBndP85G9sXPK99/
 15JaHtMQSalVGoBfVbVQ87OyU/vEuHEVVWw1c+/Ibuw1v720G4zsky/PkUVRK2dOtEJbA8LBKhn
 n1DZkhjI+pS2zysNyVZ+u62KOygGuKLK7EfLsWUG69fMA6Z0xYOpfk8lIpOC9dFwGdw4/i7/3Ak
 WQhRKan8rQcUKxLQA67SlATg2mU+BA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022



On 10/14/25 9:04 PM, Ghatto wrote:
> On Tue, Oct 14, 2025 at 11:18 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 10/14/25 5:10 PM, Ghatto wrote:
>>> On Tue, Oct 14, 2025 at 7:01 AM Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>> On 10/14/25 6:41 AM, Eric Gonçalves wrote:
>>>>> Enable the ST-Microelectronics FTS2BA61Y touchscreen. This patch
>>>>> depends on "Input: add support for the STM FTS2BA61Y touchscreen".
>>>>
>>>> The second sentence doesn't really make sense to be included in
>>>> the git log
>>> I'll keep it to the cover letter then
>>>>
>>>>> The device has an issue where SPI 8 (the bus which the touchscreen is
>>>>> connected to) is not working properly right now, so
>>>>> spi-gpio is used instead.
>>>>
>>>> Some Samsung devices used to use spi/i2c-gpio intentionally, also
>>>> on downstream. I'm assuming this isn't the case for r0q.
>>> It isn't, the device uses fts2ba61y on the spi8 bus - I hosted the
>>> DT at https://github.com/ghatt-o/ss_experiments/blob/main/r0q.dts if you
>>> want to take a look.
>>>>
>>>> Did you enable gpi_dma1, qupv3_id_1 before spi8, when testing
>>> The driver probes, but it fails to recognize the touchscreen device
>>
>> Could you post a complete dmesg and the precise DT diff you used?
> https://pastebin.com/QkYa8nMp (android dmesg) mainline dmesg doesn't have

The link has expired 🙁

> any relevant information other than spi/i2c probing, however, I've noticed
> both on deviceinfohw.ru and the dmesg that for some reason the touchscreen
> is on spi0.0 (even though DT says 8) and I'm not sure if that means it's on SPI
> but on a bugged out bus or if it's really just spi on bus 0

It means that it's on the SPI bus that probed first (index 0) 

[...]

> +&spi8 {
> +       spi-max-frequency = <5000000>;
> +
> +       touchscreen@0 {
> +               compatible = "st,fts2ba61y";
> +               reg = <0>;
> +
> +               vdd-supply = <&vreg_l8c_1p8>;
> +               avdd-supply = <&vreg_l11c_3p0>;
> +
> +               interrupt-parent = <&tlmm>;
> +               interrupts = <46 IRQ_TYPE_LEVEL_LOW>;
> +
> +               pinctrl-names = "default", "sleep";
> +               pinctrl-0 = <&tsp_int_active>;
> +               pinctrl-1 = <&tsp_int_sleep>;
> +
> +               status = "okay";
> +       };
> +
> +
> +       status = "okay";
> +};

this won't compile ^

Konrad


