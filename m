Return-Path: <linux-arm-msm+bounces-77095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3254CBD7897
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 08:10:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 41FF84E9159
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 06:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEE3C304982;
	Tue, 14 Oct 2025 06:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NXpeSrU9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D5B2BEFE4
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 06:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760422215; cv=none; b=qk1WZ4po2NXZhAu52FszqbamVpsGCBPK+cah73N+R9b5GFN5Bys4rkUxEhPWRTd3+2U4oVDF0UpyEN+96uov+cqqQYGQVl0oSaoCH0qxncC6Ygng3+UZPElp6hvH270CYO+yIpixU5kU//CfxTYeVKOig0TF0bPB8VDG7SeL0Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760422215; c=relaxed/simple;
	bh=RrMh6EceA+IZXkyJtzJ6Z5Nnd55rQF8L/NpXsDl+vQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=peI8BjHTpapJ2Bsk+HkBGHO7QT4SJ+kidNqhRgzPonwq6ABWexZ0RTbX26dgDFzGlV3NOp6rxyN1nqaHZw7wEff2bvC0DKotskWDOXRkCmyYsFpRaUucNXW8TWc0rQ/ri/OU7nY8CQaXyNF+vd+WP9xWaK8VPtSJ47RMCz2byNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NXpeSrU9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHD9tb005642
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 06:10:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cQe/hortG1AVh+iKzOyeYHqZ08OioSOVDKN8xwwnjRc=; b=NXpeSrU9Wbfft9qS
	3ibmEX3IA6cn18d6nHRu1IYeA9oFEDKxaGqTt9mac4YblxX/NDu5G8rHQ/n3XKYW
	Zxw3OXXZPAwA55zQACTzOA1JT9E8ZI8aOUL0qhdzvTzbDdBY7V2r5cB8C8XJpTnL
	w0/ImuN1tgaDuXTwrjUr9DE7JCwjxtACKP9naOYTOEWlt7WlImWeNSCHJmvbNQrK
	/L1jMIYI8klRj9735lgSJfvsiqxlfsvnvdLAqoNcGKt81RK+fDTdKUDuQEMzBBlG
	KdIee14twKuBrpWuowFMO7M8pGzgzMCOOB2EUDzdb+TxTxFhwjNYsspUdcPLK7qN
	5e5Kwg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa87bw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 06:10:07 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77f610f7325so6935158b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 23:10:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760422206; x=1761027006;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cQe/hortG1AVh+iKzOyeYHqZ08OioSOVDKN8xwwnjRc=;
        b=I6ZXkO8IKmOZZHx4/U0HLRBRsthNPIo/gAC1nTEmbM1GP26hY269koUQB/aXY5PqVQ
         sunRn/4zM61YRc0IsRU3hqaK7Mbu0ymP/woNpzUjxEgLJMjL+62Tz+K/WvoRlOt6z83K
         NJmVVe5Nuvo9ja11MJqhon3tWFguDrZOdazPMWChmFfWASaRBj/6hZ0uyWC3UChX/d+y
         yvbgzsmDGC+E8mM/BhiqhBIcZRhgUlXPtEfFG0TCeYldGe4mPR56AcVloSYtPiaaBtrr
         3KyU8xvoJmzivhWOwessMWcvaRGuLxWJGDu3PuZLzHFXqU+JKZwhnuUgLCTGH5hYhvPz
         2QPw==
X-Gm-Message-State: AOJu0Yyq+ig2Tk+9Bq+16AJ74iCwto7ukuvygF0/+R945RSE5PdLitBT
	IRF1mbtV5IgkJLlL0Eq8EPr6A32QVAJuXGE//6zXRn/v1nh+AEOTeLhZGykWf9xUIugGFNDWlSR
	wfEdwe6ME7dpXAm2YytGPfjK6gkRGBJ9NI9IwBhyJhhVGqVS39jFJhFUOb5y89MikiAVA
X-Gm-Gg: ASbGncsZ5+8zH9GvOTgcCU6gh9nNg5HON33h9SPUnN5cti+PPDsfe9W5l0Y0bRsEQPO
	mXHEeau+mDqhpWBT8nsJHCBDZW9JzHIM2cRY2CgbaWg6rXbMlQwEYHcDt1STY3vGyqpakMoAxah
	vo9Jm18HQNx0t63fi3c17o7UMQW/QT+E0RuJqLkSbSPOTcuTjRyTpcenrcSEJa428/Ll+ZtVtSb
	F/dX0cEO9lycrxRiQd8Po+e8QiZBNhmOIBbfK4A8uYVsMUpbAx3nwfHOeCq7xUPVCfdLMFaYdfY
	CjdXNrb4W0SZgrL0LzM73dLJSc9mo2+WoyYss8oGNiahjzBAHksCBSA02jY1N9KBaXEmaaWz1OW
	BMGRpmhqvK6DIJ0HnjwYUV2LTHSAEIGypnow=
X-Received: by 2002:a05:6a00:ccd:b0:781:1562:1f92 with SMTP id d2e1a72fcca58-79387a287dbmr26586201b3a.26.1760422206351;
        Mon, 13 Oct 2025 23:10:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhHTyJWB4YiMHSllLtBh6JbpspmbfHJRdXqdqU9mb6OJKHj/GnOAh41yDTXsWvUAMwfFvNCw==
X-Received: by 2002:a05:6a00:ccd:b0:781:1562:1f92 with SMTP id d2e1a72fcca58-79387a287dbmr26586079b3a.26.1760422204263;
        Mon, 13 Oct 2025 23:10:04 -0700 (PDT)
Received: from [10.133.33.138] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b060962sm13979020b3a.1.2025.10.13.23.09.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 23:10:03 -0700 (PDT)
Message-ID: <5adde3cd-8609-491e-8b85-8a3316f6e0fa@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 14:09:53 +0800
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
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
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
 <58a69bdd-f26e-4cc2-bbe2-6e9d5bb69aa0@oss.qualcomm.com>
 <DD8U00VMC4P1.1P4RGHGOLO92J@linaro.org>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <DD8U00VMC4P1.1P4RGHGOLO92J@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zZuQTPQk49QyDcqFjtoyDN2Q5c2LHd99
X-Proofpoint-ORIG-GUID: zZuQTPQk49QyDcqFjtoyDN2Q5c2LHd99
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfXx6FXQjMesYji
 dYeoOPHGG64E2xnOe064Pm2kWiFpMRodVx5c9LysrmB2SIR+b66amXucfEE4lGdsdQXk1Z6tLEi
 dVJb/kpYpPsbzWWhb4HZOPLXxrwZ6dg3rVrPX5mHNZTasgb428ZaU+wC63V5Lu78pom5f4g1fvD
 779/9ByJo0z/rVfDL1tQ+kmRPkWTx5Gryu5Qg+zhvC2cZlSDJA/8QPiwZYhmKNqeRcSHiyGa+//
 rZneHyuJq9XfCiS3m/6vYHBy7NUB+phyJk5/y6/Wvjkw/TNebVx0uYOkUbxrP9wdCMFtm6zKNwr
 wZYPnKAoUgaP2MKjr0nqSBZdczSDDRmucgDyJ5lwmVcTqohf9tdg3G37ZUVPkqCm+NFYuacFlVA
 uiSBymyMaMiILvriMuHZ8ghSWKgZ6Q==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68ede93f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=k2UVWlRvf9iVtZTx9S8A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017



On 10/4/2025 12:35 AM, Alexey Klimov wrote:
> On Fri Oct 3, 2025 at 10:09 AM BST, Prasad Kumpatla wrote:
>>
>> On 9/30/2025 11:18 PM, Alexey Klimov wrote:
>>> On Thu Sep 25, 2025 at 1:17 AM BST, Jingyi Wang wrote:
>>>> Introduce the Device Tree for the recently announced Snapdragon SoC from Qualcomm:
>>>> https://www.qualcomm.com/products/mobile/snapdragon/smartphones/snapdragon-8-series-mobile-platforms/snapdragon-8-elite-gen-5
>>>>
>>>> Bindings and base Device Tree for the Kaanapali SoC, MTP (Mobile Test Platform)
>>>> and QRD (Qualcommm Reference Device) are splited in three:
>>>>
>>>> - 1-3: MTP board boot-to-shell with basic function.
>>>> - 4-16: More feature including PCIE, sdcard, usb, DSPs, PMIC related, tsense, bus, crypto etc. Add QRD board support.
>>>> - 17-20: Multimedia features including audio, video and camss.
>>>>
>>>> Features added and enabled:
>>>> - CPUs with PSCI idle states and cpufreq
>>>> - Interrupt-controller with PDC wakeup support
>>>> - Timers, TCSR Clock Controllers
>>>> - Reserved Shared memory
>>>> - GCC and RPMHCC
>>>> - TLMM
>>>> - Interconnect with CPU BWMONs
>>>> - QuP with uart
>>>> - SMMU
>>>> - RPMHPD and regulator
>>>> - UFS with inline crypto engine (ICE)
>>>> - LLCC
>>>> - Watchdog
>>>> - cDSP, aDSP with SMP2P and fastrpc
>>>> - BUS with I2C and SPI
>>>> - USB2/USB3
>>>> - Modem(see crash after bring up)
>>>> - SoCCP
>>>> - SDHCI
>>>> - random number generator (RNG) and Qcrypto
>>>> - tsens
>>>> - PCIE
>>>> - coresight
>>>> - Bluetooth
>>>> - WLAN
>>>> - Audio
>>> Were everything described as audio enabled and tested? As far as I was aware
>>> some devices required some soundwire rework to support soundwire microphones.
>>> Is it finished? I don't see this linked here, but you state that audio
>>> features "added and enabled".
>>>
>>> Do we understand this correctly that, I presume, everthing that is more-or-less compatible
>>> with previous platforms were added and enabled (with renames) but not _all_ ?
>>>
>>> Probably some rewording is required.
>>
>> No, As outlined in the commit message, validation was performed on the 
>> Kaanapali-MTP platform having
>> WSA8845 and On board Microphones(Mic Bias supply from WCD939x) , and 
>> there is no SoundWire
>> microphones support on this MTP platform.
> 
> No, the email here clearly says both MTP and QRD and then that audio
> is enabled. That's why is should be clarified otherwise it misleads
> that audio is enabled on all platforms/devices including missing
> features.
> 
> Best regards,
> Alexey

Will make the msg more clear in the cover letter for next version.

Thanks,
Jingyi


