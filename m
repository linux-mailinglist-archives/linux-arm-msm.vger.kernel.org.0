Return-Path: <linux-arm-msm+bounces-87848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF86CFD53B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 12:07:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7AAF530010F5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 11:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32C5D2FC876;
	Wed,  7 Jan 2026 11:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IgDDvd01";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OEQbZok3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB8428DB56
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 11:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767784025; cv=none; b=QzE5UYoNuRsSf1vuIcpFRhLaSHyPYgr2ZSKNFbTHi2N42ouMArPl6+UoSTk7vtUoyty8MwTdvmR0OlNl+xy+Vye4oTY45kXUWpxwsZt4Eck3AO+IkA5bw5ddzpuMYIL4uVm2U8TdnKbOg3059ttxmHXTs4B+eqgVJXcN1Og8kYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767784025; c=relaxed/simple;
	bh=ZDWny5wBsnqvakPkuiA7j81WDWTjo5+R7P/pTb2lMn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DMxFHfKzYz6yrQCO1+Ncsc+mhvx83QnC3qWYRPVDSP96Yjum2Qe26+9RCcNhvB5YUohOfSsEWXQ9gI06h1lw5MTmgDCJySQ3Hku9jmNd2GkbrcZzjSwiFd/Qz7/3bghY0t0JsJyRNbMQ673ehSBEQmr2gIEm9uzhlWeL4vr9x7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IgDDvd01; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OEQbZok3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6074m0NJ1642748
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 11:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dt7bcHZjNmsVrg3C2DydsxusAHzKSarCVoMIbPpzC1E=; b=IgDDvd010tQr7TlM
	LLqfPW89nf/amk5Gb7rpZPqQFEWzffH0YHUn0XsG/39habiFplv2gVWEmxzCz6RL
	bnTw6wmkdMLaK5ZZSJ2rYnYvAc5nYTzq74V2iOs9fa6QjBTuRa9tDcS0xRvlLk+D
	NcaJmU9Gd88O8IICyeRiEi86JAuvQNuhzJ/r56NSw9dQJkra1FmG/XYAmqK/hz+F
	iGB1fuGMC0PVsNoa1BpqtKsdw6MKnEPamhoHd89nKIWU1mxXyZ2hntcp7klyzzuo
	sigbgANEEc/V4ylSidAt1qzDWx3OrQpdtx6du+lUDXyh5mwtFP0RW32lH7fbBA0U
	VXBJ1Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhgsfh5ma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 11:07:01 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-815f9dc8f43so2793129b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 03:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767784020; x=1768388820; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dt7bcHZjNmsVrg3C2DydsxusAHzKSarCVoMIbPpzC1E=;
        b=OEQbZok3cHy4M8Z6FCD9Kq86pgf60uO5SqI3G1JCm9U8pmrfq43mSUswKj+PY2eYnW
         MqA08Dn6UOcJ+Q+ph2nnuGHah9vYsWUNI2RZrciyKMCcCqU81POZqmZLWJHD2NtU12J1
         0DNe8iuxrqAlaMPrXjJ3Lt6h19n9vi7FrDKjaTII73ejnYjN7JU6mfI1QuUQWKu3eWaG
         sQE38RxnGmXn8Rjx1bJ4ZiEW3Wywhp+qY36amzOVoMvEObUadcBAkDzGoPwOGjbmz8vI
         vTGDhuL9uHm7x9qvyjdEFtVaXVmOSjvEYQSNEo6QXSef967TV7tgzaK9w2zggNFMmX6L
         0ddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767784020; x=1768388820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dt7bcHZjNmsVrg3C2DydsxusAHzKSarCVoMIbPpzC1E=;
        b=gJiggMT99ArAbM77PuGcsxIn/FJFGzS+gasozthVa918AiDkRxww2ATENurzB3ysuZ
         88sG/zUBqFAfsw6j9jIVRLSjtkAODDhswraKJvQCzHvwia0247IlJjHoRG6N+HGRK4p9
         t4YbIc4snnqP3uYUIsqeR34ZauhB9zcuvEghFQ4xIDD1HJpWqyQRfXkXDWpN7IEHN1IL
         3JEp6dSIseQAfCT3edUpsOdVG727vsqI0ZbgwXLkqJEOX6HRHm5hd9t+hJ5AtLCgmbbT
         VTpho0F5NPcQrrgGWLrfL/X80/en0mCdF+3rNnGA7E+Oku5ZqK4PqOF+/pyUtVdIGmae
         TJ2g==
X-Forwarded-Encrypted: i=1; AJvYcCUTrYNxyOZ2GCwEtQNrixVN9lA7GoXAPmiNQhni2jyf5TI0wDXs6qLttvyBNxXD0cCx3elvil5kuGGDxYMf@vger.kernel.org
X-Gm-Message-State: AOJu0YzBLiwp/m4f70lmUYwdfQmpqb0dSrWXFN+Rl/E3pYjN60mXVq8G
	CUMpKjPpcJ5L0sM2lOVyejDWI0qZe2T7/wvwsfhUtbI+Uu3ZcfjXKAP37ZSo2yrf3rw0CQUtTGn
	BF9w36LLtHUrYJQKsrTADgvdJeiSb6mAJ81VqGSalDzKjd1ZV1ibrRAK4dwgG5dPYItaH
X-Gm-Gg: AY/fxX6cHAupHCQH3ldUNMRA/c8rdlEOkhO9PaLmPhESkzRwLbfanZf9I4b80Y/7Tyv
	8lw/qfwiCrNiBv+LfoHkYWeDN0nMwGA6YF1+oPaLYUZDkJsdhARymQr6rWVlXLZAHk2tPHNT54U
	WVTZMeANpcSGHW94leu9w4FhVeI/Kv0zZNAAJds98okFkf412F1sB36XzHoEN4YbqdVsY/rjYf3
	NY9dcILNCBkk/k6fCgIbOQFQKDkFx1vg1MWOb0aTOCOgTpC0Wk7uF68c00ouK/0JgFM5mlRYQl3
	J/S2dVTJCcUr3bQ0KTzIPE1pDNOFM8lpmKbx3BAx+PQcGo8Jg5lbHfcTxYSrLGGdlA8BZ0r9MC1
	10WNJrXMr7fipOjKeZFm0sjq7m4TEWfNgWTKb9PvsFpv/64eITpeO0c4gE5uq1TIN0yY1oFwoOF
	lANEfcwmAs+B+njSoG56vPGcv3rq4=
X-Received: by 2002:a05:6a00:e8c:b0:7fb:c6ce:a858 with SMTP id d2e1a72fcca58-81b81197415mr2009344b3a.68.1767784020262;
        Wed, 07 Jan 2026 03:07:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxOrOZj/lOLSkp/SPwAFiTXNYU9SdlgYCvG6OI4vj5T5zuAQFA2+WcItbEGmouMPaYav8bQQ==
X-Received: by 2002:a05:6a00:e8c:b0:7fb:c6ce:a858 with SMTP id d2e1a72fcca58-81b81197415mr2009315b3a.68.1767784019750;
        Wed, 07 Jan 2026 03:06:59 -0800 (PST)
Received: from [10.79.192.227] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe96absm4739372b3a.17.2026.01.07.03.06.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 03:06:59 -0800 (PST)
Message-ID: <66eaf003-c397-4920-b3b7-93ac8a5adfda@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 16:36:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5MCBTYWx0ZWRfXyBCsL7SSBFdT
 dgVE5nDTUldPErY4iULcbqmrX3Gzjrm6a0RqaKz8zvVYc39n95I836gfkxxLwG6AuiexSydUQR5
 MVbuSogWqJnZhFUK7XJPsfYBVOQ3YETmPhzsnxPcUsgA2rri8lxNdo3yWc0mPdWCJ3ZTcfHMb0f
 HbNglG3x5L9CEPiFsF5RiaJA2sHfpEzPzDVPTXQzABSJUGjrHpIyimygwzrsQ6Uq6TTqfMFfOrr
 vRKH9Dtiv99aglXmvT+Fg/Ntb5xT4m+eULNIfZtGzKn1aFGclQFypx2TABiaCDxdCKl7BdB1mdh
 RQ/71EOx3mSUvO8mwmyZrZDQxdzFu5sO5suuWAXkM++7mRgU8mTbUoOSn3xlU2Krd97zKXXBQ9e
 pkhub5Zh8wqfrw45ZHNdBhiH96SFOMUboZnET+vUxHOHp7hU5TUkBBSFZszcUUVADgZxGLVraoc
 ZFN4oPEaylLzJVhJjMw==
X-Proofpoint-GUID: lVgCO7ANtPtRdYkoqZ-PLaN6x4KEwjHK
X-Proofpoint-ORIG-GUID: lVgCO7ANtPtRdYkoqZ-PLaN6x4KEwjHK
X-Authority-Analysis: v=2.4 cv=Abi83nXG c=1 sm=1 tr=0 ts=695e3e55 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=MQqTiiUG2llzu4MCLGsA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070090

On 11/12/2025 7:25 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Some qualcomm platforms use shared GPIOs. Enable support for them by
> selecting the Kconfig switch provided by GPIOLIB.
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  arch/arm64/Kconfig.platforms | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platform=
s
> index 13173795c43d4f28e2d47acc700f80a165d44671..3dbff0261f0add0516d8cb3=
fd0f29e277af94f20 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -316,6 +316,7 @@ config ARCH_QCOM
>  	select GPIOLIB
>  	select PINCTRL
>  	select HAVE_PWRCTRL if PCI
> +	select HAVE_SHARED_GPIOS
>  	help
>  	  This enables support for the ARMv8 based Qualcomm chipsets.
> =20
>
Enabling shared gpios is breaking hamoa and glymur boot on next-20260106
For hamoa - reg_fixed_voltage_probe which calls gpio api is breaking
Please find the log here - https://lava-oss.qualcomm.com/scheduler/job/24=
722#L3514

For Glymur - qcom_pcie_parse_perst calls the gpio api <4>[=C2=A0=C2=A0=C2=
=A0 2.910982] WARNING: drivers/gpio/gpiolib-shared.c:493 at gpio_shared_a=
dd_proxy_lookup+0x160/0x24c, CPU#1: kworker/u75:0/109 <4>[=C2=A0=C2=A0=C2=
=A0 2.911027] Call trace: <4>[=C2=A0=C2=A0=C2=A0 2.911028]=C2=A0 gpio_sha=
red_add_proxy_lookup+0x160/0x24c (P) <4>[=C2=A0=C2=A0=C2=A0 2.911030]=C2=A0=
 gpiod_find_and_request+0x1c0/0x504 <4>[=C2=A0=C2=A0=C2=A0 2.911032]=C2=A0=
 devm_fwnode_gpiod_get_index+0x1c/0x6c <4>[=C2=A0=C2=A0=C2=A0 2.911034]=C2=
=A0 qcom_pcie_parse_perst+0x70/0x150 <4>[=C2=A0=C2=A0=C2=A0 2.911037]=C2=A0=
 qcom_pcie_probe+0x414/0x804 <4>[=C2=A0=C2=A0=C2=A0 2.911039]=C2=A0 platf=
orm_probe+0x5c/0x98 <4>[=C2=A0=C2=A0=C2=A0 2.911042] qcom-eusb2-repeater =
c448000.spmi:pmic@9:phy@fd00: supply vdd18 not found, using dummy regulat=
or <4>[=C2=A0=C2=A0=C2=A0 2.911043]=C2=A0 really_probe+0xbc/0x298 <4>[=C2=
=A0=C2=A0=C2=A0 2.911045]=C2=A0 __driver_probe_device+0x78/0x12c <4>[=C2=A0=
=C2=A0=C2=A0 2.911047]=C2=A0 driver_probe_device+0x3c/0x15c <4>[=C2=A0=C2=
=A0=C2=A0 2.911049]=C2=A0 __device_attach_driver+0xb8/0x134 <4>[=C2=A0=C2=
=A0=C2=A0 2.911050]=C2=A0 bus_for_each_drv+0x84/0xe0 <4>[=C2=A0=C2=A0=C2=A0=
 2.911052]=C2=A0 __device_attach_async_helper+0xac/0xd0 <4>[=C2=A0=C2=A0=C2=
=A0 2.911053]=C2=A0 async_run_entry_fn+0x34/0xe0
<4>[=C2=A0=C2=A0=C2=A0 2.911055]=C2=A0 process_one_work+0x14c/0x28c <4>[=C2=
=A0=C2=A0=C2=A0 2.911058]=C2=A0 worker_thread+0x188/0x304 <4>[=C2=A0=C2=A0=
=C2=A0 2.911059]=C2=A0 kthread+0x11c/0x128 <4>[=C2=A0=C2=A0=C2=A0 2.91106=
0] qcom-eusb2-repeater c448000.spmi:pmic@9:phy@fd00: supply vdd3 not foun=
d, using dummy regulator <4>[=C2=A0=C2=A0=C2=A0 2.911061]=C2=A0 ret_from_=
fork+0x10/0x20 <4>[=C2=A0=C2=A0=C2=A0 2.911063] ---[ end trace 0000000000=
000000 ]--- <3>[=C2=A0=C2=A0=C2=A0 2.911065] qcom-pcie 1b40000.pci: error=
 -ENOENT: Failed to parse Root Port: -2 <3>[=C2=A0=C2=A0=C2=A0 2.911069] =
qcom-pcie 1b40000.pci: probe with driver qcom-pcie failed with error -2
Reverting this commit fixes the boot on both platforms


