Return-Path: <linux-arm-msm+bounces-62046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 576DDAE3DCB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 13:20:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE62416FA3B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 11:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3534A23C509;
	Mon, 23 Jun 2025 11:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CjNt/pWK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0A9231C8D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 11:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750677596; cv=none; b=GbVqrDbjxBKhFGOCbhBhAWia95FgC2XLUsyGsF0xiIZlR3ljc5eGHFTg+CEar/Y3OsKAnd2ckH0t9mZVcvhHnrnjMjkuPfqwuKbQNnfycuCLpOjnExtwjAuxo1/ozet1UEA0Z3l6SE84QAkqQWIBJcn6XuusgBDefIAxaNLnYOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750677596; c=relaxed/simple;
	bh=SAX/4gVNCkszlA4kN/MJxlF4iWqpz8DqffG0LjHMHn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mhSONZ0DS+arzNjerNLP0Ol4Ifma2p01j4UMcSk+3yvkFWec85hITOu2Yf9YclmT/NB1dCY3wf/kdQwOcze6OsGa6SqZhEaE19FtyMIi/XDbPnbtCdUEEtV+zTF5M7sslviFCzMAfzrr4//8Jrz0FGhv2v7LAWxae1umlLb1/wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CjNt/pWK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9pYkI013285
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 11:19:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7zKQIAVsdldY9upKrkZv5EtVBOTxNNZ0b5TunOsRvzY=; b=CjNt/pWKALLATVmK
	Nx1yNvJX0afa3tS7XhO3li9kwLbqCCvvBmiiDBrg8SW6RQOSguwn9ZfDrM+ayoZC
	AloKtX4p4fZo7tZ5JPrTHsINcrpl/3RRR6XJk79nIUFZ2gfM2ac96+lJ53bWI83e
	98wUve2dR3JKbzRZjw6KRDo6eeNz9H+a+RdTnl+rAw5W14/WGx3zCsTYagVonreS
	zPn/SVotxdE2w+LjlVJLNUjZ3HJEvt1PAmb1VbqDtNpzlSLmCdwdztCPe/0MwyQ6
	7lmaaWK2Lwr2OO9Uaub+BB4KvW15wAfkL1AjRlxltBfEip9o0GTwxXo+OdpFml5B
	bSmUsg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eud09kek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 11:19:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5af539464so115420985a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 04:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750677592; x=1751282392;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7zKQIAVsdldY9upKrkZv5EtVBOTxNNZ0b5TunOsRvzY=;
        b=BPP3P1HWVFgyACYEflgRa5tcVuOy/fzORoDomWilElSlJeA45ICTKnjfbsh4KtVU5X
         kUrhsmAW2cYgr7RRuPFN+d8kDxLaXtzSDVPN/5LfPHi1AV+mLgcPfrQqm6qPdRLVEwXi
         hfY2ntUStEaN6fGA+N+WkIk6cnFejqgCWd7mI8xbn7ADp7qIc8qg8qWz2hg0l+fHQDfU
         yI4W9sfCo8s+z0qAytu33JeyWm0csUekaO9wj7ydak5Y8pALieKAFbiXh6zgqPcfsxnI
         SrtAU/hOAC3VZVnkUtaNJPHbri9o6tj2TdrmrMO66vgXrgeudMebLFzA2svUhAseQNIT
         MRcA==
X-Gm-Message-State: AOJu0YytlKTHwdXmUJOhde672ckJcI2f2IrkVV5gRejY9lEEMV8eZNo4
	mmhVVCJyJeII8IjDF2mjfvWuqIX4RV8fZyEqqTSjSUjxITQppPACieT/yZWrYxk787gAh8mM/bD
	iFyZoUTUrP3+DYPWGiPAvtsBCHOzJTOibdtWrjaYwR3YHIgWdv3r8j7SoeLuKKrFR0ysV
X-Gm-Gg: ASbGncs8FUoCGs+W22HoE+7PEFJCy5mrmDNQk162GXPPbjgR93gAgOVg+S0KjWshWsU
	N7JHB0KtMfNvoQrQhEdOwe0QxBtwSoXosGg/KMqXGZrW6CvHpnIvZ9ncHXV+U2vIMv1Cx8wKyPN
	NkqsL0KKUwEmP3LvsDgkU3Jlp05Gsgx5+H0JukTHHaZ8GQsZQffz3buzulumAQ7JZ2dxYaB6P8k
	ZXwHb3+LeFwM9tErMKKQEbKx1OyvC7d/Dr/VHGl6+qTr1qvOFX4u8kUvPG/YWImcB3zXpu2Wrzy
	GFzWtuiQrPuhll0oxbaKpF1JqH2vLu3oO05M3te6jBjgMo5b4JXOGa0q4d539odrXhgWvUvT0VE
	iGgI=
X-Received: by 2002:a05:620a:178d:b0:7c5:ac06:af8 with SMTP id af79cd13be357-7d3f9920ff3mr524116985a.9.1750677592205;
        Mon, 23 Jun 2025 04:19:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHqPoH6QmN0MGatJznqXrfBJU91ugdsW9S22UakSW0tiObJMZH8PiX02io1ERTh2F295E7ew==
X-Received: by 2002:a05:620a:178d:b0:7c5:ac06:af8 with SMTP id af79cd13be357-7d3f9920ff3mr524114885a.9.1750677591576;
        Mon, 23 Jun 2025 04:19:51 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b74cesm706297266b.142.2025.06.23.04.19.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 04:19:51 -0700 (PDT)
Message-ID: <1f7af719-a945-400c-8caf-16e6e55b2484@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 13:19:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] ARM: dts: qcom: add device tree for Sony Xperia SP
To: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Max Shevchenko <wctrl@proton.me>,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20250623-msm8960-sdcard-v2-0-340a5e8f7df0@smankusors.com>
 <20250623-msm8960-sdcard-v2-5-340a5e8f7df0@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250623-msm8960-sdcard-v2-5-340a5e8f7df0@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iKRwrP4aL1Cv0-6IkijWafDP-0-tA-J6
X-Proofpoint-ORIG-GUID: iKRwrP4aL1Cv0-6IkijWafDP-0-tA-J6
X-Authority-Analysis: v=2.4 cv=eco9f6EH c=1 sm=1 tr=0 ts=68593859 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=Gbw9aFdXAAAA:8 a=wxLWbCv9AAAA:8
 a=EUspDBNiAAAA:8 a=sfE0evLFWE0D8gplxDEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=9vIz8raoGPyDa4jBFAYH:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2NyBTYWx0ZWRfXwwpSHlGcqqIs
 JdTBTyiaj5ph1o5QTuncAc+C+/FjEmNkPd45fT9f4aY1zrqhMZcYm5a/7/zUPf85czkcp/EkITi
 Bek/HI7Y2wYlyBbVUl70+7VSOvj5SVih7LjT5UUIn9QmBYTRR+rw6cd8aUrtncA0MYzPY9I99HM
 xBbzqT31w8p79mI2F3mwG54MMmFxF85y0eAPs1zyzt8G5usrs2mlrkOw3p5gmEKJ/ibthJtev1L
 dbV3yzYC4W8cWwel4fedxf623tob2jARNtsmmjF8MsO2pbHhk67kZ9E2+Q37+osT3jHFuocMtb8
 MW+B5nQNeDeByA56MgMgOJ9B4zFOFCW+1fIF/2YIwdociEdk9WjcIg3/zBeLEVSx+Guw26vi/4k
 1di2SiDuZ71sasKSHIgqIPhRimajadWM86/dDsYyFXr9UiEuHNQrhMvCDqnIZC9+J2XWNgZg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0 adultscore=0 clxscore=1015 mlxlogscore=991
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230067

On 6/22/25 8:26 PM, Antony Kurniawan Soemardi wrote:
> Add initial device tree support for the Sony Xperia SP (codename:
> sony-huashan), a smartphone based on the Qualcomm MSM8960T SoC.
> 
> There are two variants of the Xperia SP, one without LTE and one with
> LTE. This device tree should work for both variants, though it has only
> been tested on the non-LTE variant.
> 
> The following are currently supported:
> - Serial console support via gsbi8
> - GPIO keys for volume up/down buttons
> - PM8921 keypad with camera focus/capture keys
> - eMMC (sdcc1) and micro SD card (sdcc3) support
> - USB OTG support
> 
> Other hardware features are not yet implemented.
> 
> Booting notes:
> Booting a kernel requires using the Sony ELF boot image format, which
> embeds the kernel, ramdisk, RPM firmware, and cmdline. This can be
> created using the `mkelf` tool. For example:
> 
>   python2 mkelf.py -o boot.img \
>     kernel+dtb@0x80208000 \
>     ramdisk.img@0x81900000 \
>     RPM.bin@0x00020000,rpm \
>     cmdline.txt@cmdline
> 
> The resulting `boot.img` can then be flashed via fastboot. A detailed
> guide, including an alternative method, is available at:
> https://wiki.postmarketos.org/wiki/Sony_Xperia_SP_(sony-huashan)
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

