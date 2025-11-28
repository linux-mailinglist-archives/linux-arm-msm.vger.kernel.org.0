Return-Path: <linux-arm-msm+bounces-83688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDE0C90E06
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 06:15:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A382134EBDF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 05:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1507127C162;
	Fri, 28 Nov 2025 05:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oNm0Uu5/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jsx/B04w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E50238C33
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 05:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764306898; cv=none; b=eH7FZgygk2Ivzu+RQLyBi8K7Ro26tonCtLCqEx7GoVUeZgYV7oSHT7yTdv9Mbrx398go10jKRjCFfdQTvyJnb61XTd6AVuQiptx4ivfHh+OGiE2C/gU1FjtWIqvbBNdwoth0+J7zvbPOuh44/xKljZya1O+EhlRX3LwPxsa7kZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764306898; c=relaxed/simple;
	bh=M8GlfEiklZuOY7nx6BPVuMoql6qI/PxDeGyNTmts0SE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gOxq0UqKVv+7e3P4y2+Rz9eVnBiPfVvYbrNkPADvuXXVVQ4Dx/sGq1ooQY22ao56C+MXhu3KCSb3brAyAEVH4qwqerxQVVR6+VK897cs2vDQ5DZg9p+YaqKSADcaF7k3elbIUaTrp5lmw9roWpAvm9F7ElTX3Xzj314yKsfcrDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oNm0Uu5/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jsx/B04w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS0bse0785491
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 05:14:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3P7RhofvXTDR3ANF/0/Z5BBID9rk3iIYywYc2CR0VEs=; b=oNm0Uu5/r39zmsXH
	Ww/FxY7zU5a7FLLSd+H/n31b9Orq7Q9fkO1gA3afaUoVgaerND5f/rpRu6SpKBNg
	Uo8i3rSKuxU1MNezK+jZQuOsCuTIgZKT9UklabBxrtCdizAl3LEM4qZbYOv2WUyf
	DxRqpb/kt4mAxLePaiWLf7F246MuSjbhqq8RGGu7ehN6otRMPSIAKp9QeI7/QtBj
	ZxPkos2CPCYDRNXzI9OEJfADPm/ryAKiLVM9PB9J73gKZZMshIM2s4c37YCN1Fea
	Kq2/0hX98VcRi2sfA1I2weW1dw610SbaYdQN0x9u+uecLVzH5Q6jWjzuJ9NE6cxt
	+dTPOw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apm61t97e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 05:14:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-299d221b749so26499445ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 21:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764306894; x=1764911694; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3P7RhofvXTDR3ANF/0/Z5BBID9rk3iIYywYc2CR0VEs=;
        b=jsx/B04wTXhQqv9ijWj0ToNPJvn3/ZyetS9evjh+mGiFBynOLYb8QNUKeeZsNrXXh4
         Z5ZJFQ67ic/Ke39pS+3UkmRf+NHIrnj8nto0thrBsnnWcRAVt1JTG7+tAIxcC6wPEf/4
         18Dpo19tJ3x0PJgP7pjxRGLVswq9O/8r6KmVf+R0qH5vRyNfUjz6b33BLQv6UjCJ9eTK
         o/3FoWB9KQdqoKm9V55EP3SYXB9xJ2xyPcbTaAJaGkO1xyahtYlZTFEpCgRlerqkEjTr
         lUEOAm8oxKwPFcuR7gJGomDmYmbMzpqvoCnADOcvQMNOW+e3p0MBKhPV9l2qvJuHfBTq
         lgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764306894; x=1764911694;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3P7RhofvXTDR3ANF/0/Z5BBID9rk3iIYywYc2CR0VEs=;
        b=csF14l6zymAd/uobhONiTYIyuq3Gyv2y16/+jgi6xWH9vtAfNOQA73cwAevnKeAz9/
         nQ8rxOVVUUevP2mjNqE+a1/8LY1+HZ4vHALIZu5FCw+HKl8+aeQzUbi75SjWalVQZ41E
         m5mKPLqORsDEUaASj+W52ruetW+/ML6rwiHB1ia9THNfoIhNov0WuxjFXUX3l2umdTC0
         6UhFTmPeGC//zxqFwGjlToVCplRUhcUAeyMDux3W2wtC2JXPxTDhoEEl0MoNQSt+Pj02
         dKXyTExoctDgEFCrFUZ1ZDFTMCIxEubOyyk2AACevl7CNtXMTyPV82piQuEyRvnfuPdz
         bOhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFum/Xwr/UtQp5W/ZxkeNDFwF/Xzai7xdOG18oir3tCGW2bptoXmvnp6mSuNZGrjfX80mi557kxY5U4pCg@vger.kernel.org
X-Gm-Message-State: AOJu0YwA4G0ZUASQAwCeNpB/8qDdrM1u7TXls+k4D/RBFH/NBpo657G5
	UvNlQdKzRChYWHnmH/0noLw2p+UqY4Hirc/bF7+fZIUQ6CNHD0WWwE/MJn3cAy3O5xarelDY95o
	jMZFvV1DqPHK0GlgAhgEL/s4WRjbaJv+dB9HkuJ1IJrLVpiV6DEChE+ArCHC02R1Wjwjp
X-Gm-Gg: ASbGncvpWSzJ1px0SUwWEzx4ALYjMPGtd5YCPbkwUP1hA6JYFlF6SHibzqxcnnhlo3A
	HszGQFh3EtXO7UcPGvRNHXuZLd2Xo7U5+DpbWifkvEvFzDfpINwqJtWg3JCic8NB4Z975+gWpWf
	Rgp3NaCixxIJ2RvohHIwUFyntx6eR+FMCXqR/aurpIYQAia+WMxUpEUAFjPk96/cyWgRn57tKLP
	jju/lhBAzenGxi0zxB9s/fwl231z0IjQrHH1LflXjs0fHvNZiY5lthlGblB99A2zsrEsaU8rByp
	j2w93zy9k1FfuUoVh2Ve/z6IZnF7RPnaxwqTgtKYFhrMYEs6u8NNg+Ip4FSP3TNLrXEdOpmmuXT
	Y1r/AdfCGrALWXiHPmNFcNbrAMxDV2vWOznSCegAA9Q==
X-Received: by 2002:a17:902:ce11:b0:298:49db:a9c5 with SMTP id d9443c01a7336-29b6c692349mr241764475ad.43.1764306893904;
        Thu, 27 Nov 2025 21:14:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpM/HnNqs7nEOD0HrLHZoIO3ahaX4CGZhGquWcB2wHc70S2K19Gzp2KSzLQy29XVA/M1epWg==
X-Received: by 2002:a17:902:ce11:b0:298:49db:a9c5 with SMTP id d9443c01a7336-29b6c692349mr241764245ad.43.1764306893389;
        Thu, 27 Nov 2025 21:14:53 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb40ac4sm32286365ad.77.2025.11.27.21.14.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 21:14:53 -0800 (PST)
Message-ID: <c7aea2b3-6984-40f5-8234-14d265dabefc@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 10:44:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/4] PCI: dwc: Support ECAM mechanism by enabling iATU
 'CFG Shift Feature'
To: "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar
 <alim.akhtar@samsung.com>,
        Jonathan Chocron <jonnyc@amazon.com>, linux-pci@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250909-controller-dwc-ecam-v9-0-7d5b651840dd@kernel.org>
 <20250909-controller-dwc-ecam-v9-4-7d5b651840dd@kernel.org>
 <alpine.DEB.2.21.2511280256260.36486@angie.orcam.me.uk>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <alpine.DEB.2.21.2511280256260.36486@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MpAs1YWFIKp47AR3U_ZfgNHwgDy29o9-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDAzNSBTYWx0ZWRfXwUaBcadb5zMi
 l8Rzp54TkbXjqsh/I6ZIu8UdmD1GWLcjdM6VH1U+rBC4ySxfTGDuWpxmTtID4QiYnc5zkjyTtA6
 ibe8nPLMcQIjBQL7qSNVTkSNUoG62gFz/b2WNw1o9JUdE+0QINzH3TKhSyoIpZ0KeF8pTTBmqy+
 mohPAcXrQQAZaDBORHkYpxmAv+Uzo6J/F2Fo1Qho28o8c5ER0K6+/3tD22WFzv5m3xmLu8SUM+6
 b0jD2XMMoJQ04n5QHHWm0B3Uf0rmWahdKSlwOL8n6qWOvZV1f7jiPEKVEUIJ/E+3SZPxEsassE2
 aPaqpicceTBUOu2EuEmmsC8B6lGLUBgBTeNEdnu7KDOK90msRSMeVgZDxCNKZ5ywUpzQ6ngp3O5
 nDrBwEn0q2mL/OC7DMAS1KQDNBTLaA==
X-Proofpoint-ORIG-GUID: MpAs1YWFIKp47AR3U_ZfgNHwgDy29o9-
X-Authority-Analysis: v=2.4 cv=IciKmGqa c=1 sm=1 tr=0 ts=69292fcf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5rJZNewN76S2RKxIRykA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511280035



On 11/28/2025 8:47 AM, Maciej W. Rozycki wrote:
> On Tue, 9 Sep 2025, Manivannan Sadhasivam wrote:
>
>> From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>
>> Designware databook r5.20a, sec 3.10.10.3 documents the 'CFG Shift Feature'
>> of the internal Address Translation Unit (iATU). When this feature is
>> enabled, it shifts/maps the BDF contained in the bits [27:12] of the target
>> address in MEM TLP to become BDF of the CFG TLP. This essentially
>> implements the Enhanced Configuration Address Mapping (ECAM) mechanism as
>> defined in PCIe r6.0, sec 7.2.2.
>   So this broke a parallel port on my HiFive Unmatched machine (a SiFive
> FU740-C000 based system), the driver no longer registers the device, no
> /dev/parport0 anymore.
Hi Maciej, can you share us lspci -vvv o/p with working & non working 
case and also can you point us parport driver. - Krishna Chaitanya.
>   I've had to bisect it with commit a1978b692a39 ("PCI: dwc: Use custom
> pci_ops for root bus DBI vs ECAM config access") and commit fc2bc2623e3a
> ("Revert "PCI: qcom: Prepare for the DWC ECAM enablement"") applied on top
> and it's affirmative it's this change, i.e. upstream commit 0da48c5b2fa7
> ("PCI: dwc: Support ECAM mechanism by enabling iATU 'CFG Shift Feature'").
>
>   Here's the relevant part of a diff between bootstrap logs:
>
> --- dmesg-good.log	2025-11-28 03:41:18.943097032 +0100
> +++ dmesg-bad.log	2025-11-28 03:47:29.582049781 +0100
> @@ -1,5 +1,5 @@
> -Booting Linux on hartid 3
> -Linux version 6.17.0-rc1-00008-g4660e50cf818-dirty (macro@angie) (riscv64-linux-gnu-gcc (GCC) 13.0.0 20220602 (experimental), GNU ld (GNU Binutils) 2.38.50.20220503) #19 SMP Fri Nov 28 02:37:51 GMT 2025
> +Booting Linux on hartid 1
> +Linux version 6.17.0-rc1-00009-g0da48c5b2fa7-dirty (macro@angie) (riscv64-linux-gnu-gcc (GCC) 13.0.0 20220602 (experimental), GNU ld (GNU Binutils) 2.38.50.20220503) #20 SMP Fri Nov 28 02:43:00 GMT 2025
>   Machine model: SiFive HiFive Unmatched A00
>   SBI specification v0.3 detected
>   SBI implementation ID=0x1 Version=0x9
> @@ -61,7 +61,7 @@
>   EFI services will not be available.
>   smp: Bringing up secondary CPUs ...
>   smp: Brought up 1 node, 4 CPUs
> -Memory: 16383064K/16777216K available (10746K kernel code, 2200K rwdata, 4972K rodata, 537K init, 371K bss, 389448K reserved, 0K cma-reserved)
> +Memory: 16383064K/16777216K available (10746K kernel code, 2200K rwdata, 4972K rodata, 536K init, 371K bss, 389448K reserved, 0K cma-reserved)
>   devtmpfs: initialized
>   clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
>   posixtimers hash table entries: 2048 (order: 3, 32768 bytes, linear)
> @@ -161,6 +161,7 @@
>   fu740-pcie e00000000.pcie:       IO 0x0060080000..0x006008ffff -> 0x0060080000
>   fu740-pcie e00000000.pcie:      MEM 0x0060090000..0x007fffffff -> 0x0060090000
>   fu740-pcie e00000000.pcie:      MEM 0x2000000000..0x3fffffffff -> 0x2000000000
> +fu740-pcie e00000000.pcie: ECAM at [mem 0xdf0000000-0xdffffffff] for [bus 00-ff]
>   fu740-pcie e00000000.pcie: Using 256 MSI vectors
>   fu740-pcie e00000000.pcie: iATU: unroll T, 8 ob, 8 ib, align 4K, limit 4096G
>   fu740-pcie e00000000.pcie: cap_exp at 70
> @@ -655,7 +656,7 @@
>   usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.17
>   usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
>   usb usb1: Product: xHCI Host Controller
> -usb usb1: Manufacturer: Linux 6.17.0-rc1-00008-g4660e50cf818-dirty xhci-hcd
> +usb usb1: Manufacturer: Linux 6.17.0-rc1-00009-g0da48c5b2fa7-dirty xhci-hcd
>   usb usb1: SerialNumber: 0000:04:00.0
>   hub 1-0:1.0: USB hub found
>   hub 1-0:1.0: 2 ports detected
> @@ -663,7 +664,7 @@
>   usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.17
>   usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
>   usb usb2: Product: xHCI Host Controller
> -usb usb2: Manufacturer: Linux 6.17.0-rc1-00008-g4660e50cf818-dirty xhci-hcd
> +usb usb2: Manufacturer: Linux 6.17.0-rc1-00009-g0da48c5b2fa7-dirty xhci-hcd
>   usb usb2: SerialNumber: 0000:04:00.0
>   hub 2-0:1.0: USB hub found
>   hub 2-0:1.0: 2 ports detected
> @@ -735,8 +736,6 @@
>   pcieport 0000:06:01.0: enabling bus mastering
>   parport_pc 0000:07:00.0: enabling device (0000 -> 0001)
>   PCI parallel port detected: 1415:c118, I/O at 0x1000(0x1008), IRQ 35
> -parport0: PC-style at 0x1000 (0x1008), irq 35, using FIFO [PCSPP,TRISTATE,EPP,ECP]
> -lp0: using parport0 (interrupt-driven).
>   parport_pc 0000:07:00.0: vgaarb: pci_notify
>   serial 0000:07:00.3: vgaarb: pci_notify
>   serial 0000:07:00.3: assign IRQ: got 40
>
> and then it goes on with insignificant changes only owing to differences
> in the order of messages produced, the kernel version ID or date stamps.
> As you can see the PCIe parallel port device continues being accessible,
> it's only the driver that doesn't pick up the device anymore.
>
>   I'm stumped as to where it might be coming from.  Any ideas?
>
>    Maciej


