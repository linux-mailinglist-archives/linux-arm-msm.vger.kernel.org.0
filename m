Return-Path: <linux-arm-msm+bounces-75871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9460FBB652F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 11:10:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FD213A6BC7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 09:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2765F17A2EA;
	Fri,  3 Oct 2025 09:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mf1ynVAR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B0D2877E2
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 09:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759482607; cv=none; b=ViBIVY71K+RjaAF8v35D+jUPklRaqLTAZqP8x0Dy9dTkeAvUH0txZeinLwjG5U3/VDMfkB3gCZwyUvZ34+no3lj+M2bMfWrbKE2JPMLSFHh5QijhqLGWMpDQZwSvXKaKrp6W+vSup/YB3mejv1U9ssaZnheROIaHdR1t0469Qek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759482607; c=relaxed/simple;
	bh=g+UyabP7D/WYt51zePGNa1iOGkEPveNswKAW4d9GM9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lGJ261qBrwSO6lCiUX5OG+XVjGnK4E/mlruTy6m7UuJn+Xrlu3XBCud3ZJaHJWXlB6YDSnrDEIBrpczJ/xr3I8C7Q0izmr1wP5It3w8AwSjmqXnCnr3TfXbrdRA0hsiQQDz7UWzZC1gG7p3DZ5KtxFP2HkxcrISB0KHQ2ds8KlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mf1ynVAR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 592Mqwsj017886
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Oct 2025 09:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9G+ZsHAD1n3qGPEQOvfOjFGqmrOTP8PC0DMNouciob8=; b=Mf1ynVARGjaPpLa1
	RcUrlPuW2pYAkB77JOlTBVI9k6BXS1qOrKy1Y5TB3Knh8jptEB8tDfRq9QlMWwXp
	NQtyc7ek0v8IbWI+ew3enhe5Z0f0zrhIbrSZCLpaN2SQVXpKzlXzRuy6iASBIxCg
	WnYBCd1zFAwGwzx6e/zGcE00q915QzeJugs6NsmMJiCi6s24s6Io/AR6P8/7Ovlc
	PAvQbwKOzHUL+afjaCNa3y1AWQtnjCI8IhSz+coyCD8gntboN0F090Yl9YEheXPf
	e8F7KfcbTIDmtz7B9NO1cLMwfw+kdyBE3kqIy0/W1uqogE8j3kyHGP8zvmGwaOH5
	qnbmRA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fyrfbv8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 09:10:04 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b551338c2c9so1358704a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 02:10:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759482603; x=1760087403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9G+ZsHAD1n3qGPEQOvfOjFGqmrOTP8PC0DMNouciob8=;
        b=w8vq2fKx+5BxWEGdYpAatQsPWJDkPRSiT/aa+gPIBKEeghzOjL8fj9oT5mbyaOixq7
         m+UagAr/lYzGfhOS5FER0nHDmnPw1Kq/nySPpE4aegD+FpZ0PU3na9GJFoaKLkMdItT2
         u2Saij6vEapJAVr6NmRacr8Osmdqwi/acluNdYG0uS2o5YA+kQqe250brHqVfy/YT1o5
         djyMbHEVVLJWTnArOtyE+hJH01ouJ6Goi2U6lAzrlBC32eLhfACZcQarr8keOHYVeZ1F
         0ydmtr4V2q1WBT0CPf19uFw9rRPSRTGKMDb9cbDrwAsjq/5kiWNiEjQj1coV8jwUtt5V
         De1Q==
X-Gm-Message-State: AOJu0YzUWE1+3yoX1NgV+V5RsoNqbaBuFGo4ttfnvSb9QcU+VBwMucEt
	ReFPk54ZPn26SY2BbFM0rMa8M+3elun79IcGO7cHPsRQOPb5OVyPqRj3e/46NEntxVV51HV6j/Z
	GRm7kSQt0GLixHMR/4fnn1McLaeq5D897+d8Crj3o7Ux8Gr+ctg58Ys8QPa38T9KPB4Rw
X-Gm-Gg: ASbGncv8lw6XDisrH5t037gP3/ygY25XOf/HKdInINBeQkqHa1pIkUw4E75bfrOWlJT
	2lHgbgfURzDaCA6WKVbNl9Zk7SvH9WqQluQbkY6vNFtPspjMk707YANoxs8kFIuZfhk0vYMXpQo
	DqjhR6yiSgMagpX0UARt73F+4FIDj/Iqpqfy1f+I1sdc7WVgVhnOOvVATq5K3JhbXoy+6I4vdvT
	AUf3KWwwDaO5rVJcLFUWWJQ9f/1dtXnPr9yFoi5/msXs8rm+RcIQthphd+7ym3nwV7bBd/gBBWQ
	WkCvADYIL7MNviMu8hrKF0izCiRm/1hzM53LlnSplNAQ782yfw3wWmm4tjMClkFdsl+URvTHtD5
	SXpI=
X-Received: by 2002:a17:903:3c70:b0:269:ae5a:e32b with SMTP id d9443c01a7336-28e9a5668e1mr30170485ad.13.1759482602886;
        Fri, 03 Oct 2025 02:10:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IED/ngo+VR5SYkELB9gRDWFieCrqK8UHsEA2FB7sm98eH67+OUnQaYh4ScjWZbBPm9CWIZQ8w==
X-Received: by 2002:a17:903:3c70:b0:269:ae5a:e32b with SMTP id d9443c01a7336-28e9a5668e1mr30170065ad.13.1759482602391;
        Fri, 03 Oct 2025 02:10:02 -0700 (PDT)
Received: from [10.219.49.214] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1dc168sm44215525ad.120.2025.10.03.02.09.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 02:10:01 -0700 (PDT)
Message-ID: <58a69bdd-f26e-4cc2-bbe2-6e9d5bb69aa0@oss.qualcomm.com>
Date: Fri, 3 Oct 2025 14:39:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/20] arm64: dts: qcom: Introduce Kaanapali platform
 device tree
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manish Pandey <manish.pandey@oss.qualcomm.com>,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <DD6BOLBXKBYP.2NVXRXGJ9W3IG@linaro.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <DD6BOLBXKBYP.2NVXRXGJ9W3IG@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BPXnt_po_N1cneeVAmxgJMbrG5cbXP8w
X-Proofpoint-GUID: BPXnt_po_N1cneeVAmxgJMbrG5cbXP8w
X-Authority-Analysis: v=2.4 cv=etzSD4pX c=1 sm=1 tr=0 ts=68df92ec cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=k2UVWlRvf9iVtZTx9S8A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDE3NSBTYWx0ZWRfX3v/WJG0WlA4G
 wp0Q98t4OXOD4bjFLQBMwvmf+Qq4WuAYbTcBceOLkWQ3JBh3rfA0ZjDqNqOsCrviZypIqVP/kFd
 9FiA51X633uLDwNFdizv0L/vW63EIpccazmGBvbSEiR8lC0/0/s9BJRnuNcp45jA/TREqHgHd5k
 cpJrsTj+QZQ3dsGxCzJOpsMNlwfSPFLe262I35X62peLFPZi/ZHjZx1UOruk/02gQuJzJtuh2LT
 kNA1/N5uy3fInsM6nFKG5Wq/Ydh9yyq7qjH1vKYypxZfMb+WoVuIm9Xyp3hEMRA8gjTFnOoEDVj
 gQIkhM3nliYRjeTZbTvjExfsrJaMnEHjYJWqmTzwc/GhGa2u8w36ElOUmWRVni6zyRrf0PN3jUw
 ni3jEk+gj5zotefgr3QCgNWO/DalAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_02,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509290175


On 9/30/2025 11:18 PM, Alexey Klimov wrote:
> On Thu Sep 25, 2025 at 1:17 AM BST, Jingyi Wang wrote:
>> Introduce the Device Tree for the recently announced Snapdragon SoC from Qualcomm:
>> https://www.qualcomm.com/products/mobile/snapdragon/smartphones/snapdragon-8-series-mobile-platforms/snapdragon-8-elite-gen-5
>>
>> Bindings and base Device Tree for the Kaanapali SoC, MTP (Mobile Test Platform)
>> and QRD (Qualcommm Reference Device) are splited in three:
>>
>> - 1-3: MTP board boot-to-shell with basic function.
>> - 4-16: More feature including PCIE, sdcard, usb, DSPs, PMIC related, tsense, bus, crypto etc. Add QRD board support.
>> - 17-20: Multimedia features including audio, video and camss.
>>
>> Features added and enabled:
>> - CPUs with PSCI idle states and cpufreq
>> - Interrupt-controller with PDC wakeup support
>> - Timers, TCSR Clock Controllers
>> - Reserved Shared memory
>> - GCC and RPMHCC
>> - TLMM
>> - Interconnect with CPU BWMONs
>> - QuP with uart
>> - SMMU
>> - RPMHPD and regulator
>> - UFS with inline crypto engine (ICE)
>> - LLCC
>> - Watchdog
>> - cDSP, aDSP with SMP2P and fastrpc
>> - BUS with I2C and SPI
>> - USB2/USB3
>> - Modem(see crash after bring up)
>> - SoCCP
>> - SDHCI
>> - random number generator (RNG) and Qcrypto
>> - tsens
>> - PCIE
>> - coresight
>> - Bluetooth
>> - WLAN
>> - Audio
> Were everything described as audio enabled and tested? As far as I was aware
> some devices required some soundwire rework to support soundwire microphones.
> Is it finished? I don't see this linked here, but you state that audio
> features "added and enabled".
>
> Do we understand this correctly that, I presume, everthing that is more-or-less compatible
> with previous platforms were added and enabled (with renames) but not _all_ ?
>
> Probably some rewording is required.

No, As outlined in the commit message, validation was performed on the 
Kaanapali-MTP platform having
WSA8845 and On board Microphones(Mic Bias supply from WCD939x) , and 
there is no SoundWire
microphones support on this MTP platform.

Thanks,
Prasad

>
> Best regards,
> Alexey
>

