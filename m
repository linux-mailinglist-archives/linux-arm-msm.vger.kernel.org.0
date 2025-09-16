Return-Path: <linux-arm-msm+bounces-73763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F39DB59DA7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 18:29:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA2771BC6DD5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 16:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF54A37C0E3;
	Tue, 16 Sep 2025 16:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kS4lkw4R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39B9374279
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 16:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758040146; cv=none; b=KKbitVDGXWcq5gNoBLE67AB2mkzruZbYQ0Se+WJFyxdSmjW0Ek5uTlh6SxHRiULHugnVUF7DNCUJOFfPYv0Rp7KlV700fAZKrFYUsu8FkwhZA//aQIjTeSI0XCdxHCCr/ScqCHiXaO25qMjsl0NZ2BWnlHTBv7VDRyAUM7V2YmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758040146; c=relaxed/simple;
	bh=V6lAa+9GoxL6c9GboJo7qMttke2uib1segmBaCPWwYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sKyTZde5fOF+2qP0zac/aK6S77dzyeouQS3Y3C2iuRfroj+HCEWJnwag2rmbou/bLU34WGHUog6mkRemGcl1YpW8slzG+IvNS6lEmw4leSDyFhSfLQ6IlfJfknpeuNcDrl1HSo8rVLZgpekUIvGjXAWCg1woYYHSRsR327B9nH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kS4lkw4R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GAf8Sb021231
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 16:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6z+mI/JcrpDzLXkYUuAhV+t032JKtC0auFvwYLf3i/s=; b=kS4lkw4Rhpjk1jzH
	ycLSJ5U87zk0eOVpcBxNZq7sUuJu69qpcRQ2DO8P+UcYiguE1u7la5nmNZgw5jtJ
	w6OfL0juOzhm/eLbPvHdbIbBln6GTjYO3UqlHA6sZ6uoPqqBHhy9HVWsQbd9e5+U
	Sv5Jd140IzOPzrHdf3i7sqQZa+a8u1qVgtymhuXynYUKm2MvRxlh13j37fMT0mUD
	Lu41y3jdHloXYs0FNBvfdHnjKu5qy6YRSUY+1ndA7I74kCZy2O0487IfsysUC9wA
	mNBIgZJXvOFMcB/GaoCdSKQWoK51wLiHPM0jITCD7VcjYbAmVh5BFa39ijJ26cRY
	PMLyOA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494yma9kp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 16:29:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-82b15c1dca8so46598485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 09:29:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758040142; x=1758644942;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6z+mI/JcrpDzLXkYUuAhV+t032JKtC0auFvwYLf3i/s=;
        b=AgjXZEPhKhp711ASH1gAW2fro3d6fJqLSo9PAfUznPpBETAwlkBaGsVYErL5s2yw0A
         0r0hcbWED6+23knl2YsyEp4MT36jqKanf7PNRGuwRLXXDmDWExsuHaXVFaOOaVRNQIRk
         8mfzj91cOGKcGjHRDfpEAPl0EIC6u9yrV0s8W/jhOW8ucfNKp98Fe8K7K50OKo+ytV/Y
         3scknKgBL280kg16QpGLTHSBUyAiTOGpHp1F3URY5mwTNyi9taJdlAxoH5lNWcK9czVY
         jsm/T2ospdxUWLutF3gZYTb1ZOymoLBy8JrC7khkf2P6LYa3nBIgiQEMcr1F4i485UJy
         621Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1CAGHAPsyD2FX0qeioF/A9AbYjGA0B1cC11f5n6mgPmQoUY9uTV7xfA3m6zvACtUJy/HSxWLXQXt5rC8T@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9cJvuzuiLUiQXbdI+DRgIepi4s3kEASIuhV9CXbSOzisQ2z8C
	uDmp0MMAftI6YxWGhlzTFueSHEZA+aCYOGE9MlwMZWwFmQz2kGYmnRAvImufoxuMqqC2iW3fqoo
	PHUgoqwunJtR71O/3q7ihEdr0vcudETiUvzEiluw2eq/6NVlLNObVMwHmbB0CnXKZVWyv
X-Gm-Gg: ASbGncs61ADxC+kTrrTxVZ3+R7co+Or7fj+LyCTn67lUr1RhLe+kpLGrBuF7pteMBqP
	DVIru/+YgxKuUQpmsd1esfA1RCz+6GudCiDcTeTikeIlN8Yj1jifnvEtfpXUmBWFQ6XDCGFluEC
	Q/rkhVxG2XVmzXXyNx+5cvYenc9vlyAjXcVs7OoPY+TtLt+yUjvShmQyEwX4dl3mtcPWrgFgGsJ
	4lG7m/uO0D1kUrQTvZbflN2mTAqAraAKD2N0RFhHu8+rrz9QV9luTlLU8KhFTK7RNyN3usSQRos
	jZjRhNbk8J1NcBd7M+60fRPCEajeUB+kfq+6XnvFtG81/eis9B1/Jbb61CnQSvZwEM3PfgIYVZ8
	vJrJ4hWIwKNKHgDw/C7Qa4A==
X-Received: by 2002:a05:620a:9482:b0:827:1a76:e8f3 with SMTP id af79cd13be357-8271a862d1emr782817685a.7.1758040141740;
        Tue, 16 Sep 2025 09:29:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEazc1AwmHCnYAYH/ad0hiuc9j4t/7hoTAeblgvj8r7zz/qfCWQgQ6/hxOe2uHonNnxY7+aLw==
X-Received: by 2002:a05:620a:9482:b0:827:1a76:e8f3 with SMTP id af79cd13be357-8271a862d1emr782814485a.7.1758040141090;
        Tue, 16 Sep 2025 09:29:01 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07e1aed5ffsm791617666b.81.2025.09.16.09.28.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 09:29:00 -0700 (PDT)
Message-ID: <ccf1b22b-8b6d-4aae-ac27-e84943b7ffd0@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 18:28:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] PCI/ASPM: Override the ASPM and Clock PM states set
 by BIOS for devicetree platforms
To: manivannan.sadhasivam@oss.qualcomm.com,
        Bjorn Helgaas <bhelgaas@google.com>,
        Manivannan Sadhasivam
 <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        "David E. Box" <david.e.box@linux.intel.com>,
        Bjorn Helgaas <helgaas@kernel.org>
References: <20250916-pci-dt-aspm-v1-0-778fe907c9ad@oss.qualcomm.com>
 <20250916-pci-dt-aspm-v1-1-778fe907c9ad@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250916-pci-dt-aspm-v1-1-778fe907c9ad@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxOSBTYWx0ZWRfX5V/Cp3hJvvOq
 fbNLqFn2WZLhNvDvDsxbz+/d+mwMEAPsw/bLpxEVRyGgZitFp0DuC8ZO/LeBaiW6ASwg8iBdDIG
 T5OeeEUE5Zr8jyQ0Mh55V8m0bROwR86hxSkdp9HnlVMwg6wjm57MEk3pQ8XEjdCNoQP9GbCQ+Um
 IYkNt0UqRgZHl464rLYKdzsEJvSu23Z3DX5DaLyyXUngYmu4ATz8B2pkeFIbcR9gk97feD2Y0+x
 a099/tayyiN3UA2W6Oq0uqMqVShEAlbTwgH++pIAEknOviyurayK1ZVVEbE9s7D5RxB1EKbmGm0
 qlAHmUqzOuqHKxJSsAo80z94Z1z8es9OKK+Cnb4Bfuvri92RP0rzvADmiMsrX7KfRarWmBLbGOX
 AGJF2GWR
X-Authority-Analysis: v=2.4 cv=cdTSrmDM c=1 sm=1 tr=0 ts=68c9904e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=AEKlotozOucuHJhDSDgA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 1oO9vtUouA0w13rDDuAyGRor7NueVzmd
X-Proofpoint-GUID: 1oO9vtUouA0w13rDDuAyGRor7NueVzmd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130019

On 9/16/25 6:12 PM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> So far, the PCI subsystem has honored the ASPM and Clock PM states set by
> the BIOS (through LNKCTL) during device initialization. This was done
> conservatively to avoid issues with the buggy devices that advertise
> ASPM capabilities, but behave erratically if the ASPM states are enabled.
> So the PCI subsystem ended up trusting the BIOS to enable only the ASPM
> states that were known to work for the devices.
> 
> But this turned out to be a problem for devicetree platforms, especially
> the ARM based devicetree platforms powering Embedded and *some* Compute
> devices as they tend to run without any standard BIOS. So the ASPM states
> on these platforms were left disabled during boot and the PCI subsystem
> never bothered to enable them, unless the user has forcefully enabled the
> ASPM states through Kconfig, cmdline, and sysfs or the device drivers
> themselves, enabling the ASPM states through pci_enable_link_state() APIs.
> 
> This caused runtime power issues on those platforms. So a couple of
> approaches were tried to mitigate this BIOS dependency without user
> intervention by enabling the ASPM states in the PCI controller drivers
> after device enumeration, and overriding the ASPM/Clock PM states
> by the PCI controller drivers through an API before enumeration.
> 
> But it has been concluded that none of these mitigations should really be
> required and the PCI subsystem should enable the ASPM states advertised by
> the devices without relying on BIOS or the PCI controller drivers. If any
> device is found to be misbehaving after enabling ASPM states that they
> advertised, then those devices should be quirked to disable the problematic
> ASPM/Clock PM states.
> 
> In an effort to do so, start by overriding the ASPM and Clock PM states set
> by the BIOS for devicetree platforms first. Separate helper functions are
> introduced to set the default ASPM and Clock PM states and they will
> override the BIOS set states by enabling all of them if CONFIG_OF is
> enabled. To aid debugging, print the overridden ASPM and Clock PM states.
> 
> In the future, these helpers could be extended to allow other platforms
> like VMD, newer ACPI systems with a cutoff year etc... to follow the path.
> 
> Link: https://lore.kernel.org/linux-pci/20250828204345.GA958461@bhelgaas
> Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---

[...]

> +	/* Override the BIOS disabled Clock PM state for devicetree platforms */
> +	if (IS_ENABLED(CONFIG_OF) && !enabled) {

JFYI CONFIG_OF=y && CONFIG_ACPI=y is valid, at least on arm64
Maybe something like of_have_populated_dt()?

You can then choose which one to use with e.g. acpi=force

Konrad

