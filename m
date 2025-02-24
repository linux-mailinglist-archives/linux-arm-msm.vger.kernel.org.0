Return-Path: <linux-arm-msm+bounces-49127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FBAA41644
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 08:31:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 158753A7ACE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 07:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 920D835949;
	Mon, 24 Feb 2025 07:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NB2H6Skj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC9A6FC3;
	Mon, 24 Feb 2025 07:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740382262; cv=none; b=a+9lre6OwjpE1kl8x67W1aD0VRGh3lyBHvnsVZnptcOU6AfdbzBlcJzsc/6G7CU39NaBUPFLdznrutzMHt7j8bY8hMEbg4NfUbdbw3LHhkDsLC7yez6nz79OyD0djQvm1Be/wZjNycHfy8bjBc/0OsLasgH3yBkaAjQoFqClgIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740382262; c=relaxed/simple;
	bh=6Z6dnjGVgdpViKxmv3ZMODE/l0flzQ0TomzD7aIpjeQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hhh6CjdXMgrtsmhW0BjdpxTTmZEt68iy0jNpKMWjGGgrUlFYGB2Vdi9WT1WhtsNIp8kyXVOp2WK/w9Bnh6snSpSN9XfVfxx6HvhwQEBo0Ub9q04b1ZYsrvjB1akCmyw9a9TRgX+fINPMpLl2HjoT/63+cj0ojHRrrRMyVuxsj8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NB2H6Skj; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38f29a1a93bso3215428f8f.1;
        Sun, 23 Feb 2025 23:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740382259; x=1740987059; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b0duzw3Ywocqb3zPYovQHOlpL11++t/qRORIguG/x8M=;
        b=NB2H6SkjtKlJ/djFqjHu8QshpxWRo6qha4AFj9YUkgMypUSoBLDZ9SBwtSJqzbvR0l
         sIf5UX19566DLSNvute9ENXcdoucYI+sIIo/k1qM+/fi5EgNAm7zyXByi66rSROHdNK4
         JqS0u3uUyksOmtL8ZhamR8SGwC2ukqSOipyJmuH4Uf5XWlQ+Yej59ByhndkNVDWK2wMV
         xn5mBTRL1s/q9LNZHXJ6Wj4Em3peW4N9vKn4LxYGQ2VSYPQnOZohRFyVl7so1LkVx6TL
         1d+jMhIXYn9oxQr2aZrM/LgxEFS91rdrp9yDaNGY2Dsb9UfFmJCjUt/cTyWIiPlRkrV0
         lPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740382259; x=1740987059;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b0duzw3Ywocqb3zPYovQHOlpL11++t/qRORIguG/x8M=;
        b=NZHRUzlaEZB8HV6iVrGIRopgdkSdXZV/gRF4ml20tX54+Tjf+FYRUNKJRff+Gncipr
         /ZSPIkWAMPEzJwDkBpV12+LAARTJZFgdabycGpNCCOfypILbUW2y/NtAggFNsxXhOmz9
         Bg/EeCkJC7TK4PtcAfJ6tlYgzgcq3yPoH1pvPHs+ECoyatXCbz9GmT3frvUJy/hu6fSU
         IgwdbEKbESkC3MP14PPQp95zf+AGkM5GQt5OxJ/G5Go+vM5aipkvLBuLdyOUoRq2KK0A
         kbu1by83ynDSXtd/xBi/guAcVPl7p6CoYEGkOI3k1uiXuh4E3BD2z9I+Zyel40OorhUu
         3d+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1CEPES0LBUvO3KxD+V8MXyKTKGNNlDbTVI0rjC/ROppP4SwfnJLrQS1e+DjEKhK/orPrUvkvQynnrryNPVISEvzY=@vger.kernel.org, AJvYcCVqz4ypyOXGRex5vlVFp2mXge8Jhl57JpP4HOVhGyT8s0SlI9+p9Tce5rpoO1MZmpI4Om3w3SmDpuLPZj747Q==@vger.kernel.org, AJvYcCXs/znA2q+HragQn51XloaM1H58nJ1ES6W6R9loRodC8SXGGMQCRT9924fbjPPx8QXgCXpW3wh/gfqUVPuq@vger.kernel.org, AJvYcCXy6YRk7LCQKDhdxg02bDU0yMKSdsVout/njM1bPWFDMwoCq3pWng153mObJUr0V5GQ2AwG8xREyO4H@vger.kernel.org
X-Gm-Message-State: AOJu0Yzoq2l/0EzqbyaKZO0xk7iENW7y9HfR5Z4OGv3Jb/ytkgxhth7+
	BIrmPEVrkPSF4umsdk35SvFCiOZZ2Mias8SDgo3Un81UHU9bIQHP
X-Gm-Gg: ASbGncvxdT9dKl6+mNmopUamGZLjdHpo1GJ0uWu+OYNQVf+Q9xesnYI4jMuTnYImpWQ
	qKHpMlTWFA/XrKCXx+tsVYwUyC37UAjQ7JWtJkk+3q13JOKhSOit/tH517WVHrbT+Pe6vNaf+z/
	SSiy6JSLVS04059j+mXwNJ0CcDxhvKt5nk/N4xuhR/JyKEtm/+EwkQR9q2ItDUC2EG30Ts7NbdX
	CSe23NXk29eZ1IPr1bP8O/nWdPElKslV/CmS5plVsFN+fauvnOfm+lxBo2brLbdpPlWaqnVcp8H
	4U/bdJFhGnkJum5BUBjea0pkKgxbuTPMljyC/XBk
X-Google-Smtp-Source: AGHT+IFR8qOglMl8SOkJiw+ah079XOs4fUxWnUURIZha7TGgX1naigEEn4nk1GDXeUIJqH7dqWjSFw==
X-Received: by 2002:a5d:5f92:0:b0:38d:e02d:5f4c with SMTP id ffacd0b85a97d-38f6e7578d8mr10115232f8f.10.1740382258857;
        Sun, 23 Feb 2025 23:30:58 -0800 (PST)
Received: from [192.168.43.21] ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f69b3ca41sm11133698f8f.27.2025.02.23.23.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Feb 2025 23:30:58 -0800 (PST)
Message-ID: <7426ef0e-c0ae-4a4a-8678-c1a3a4ead250@gmail.com>
Date: Mon, 24 Feb 2025 09:30:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] phy: phy-snps-eusb2: add support for exynos2200
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Abel Vesa <abel.vesa@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223122227.725233-8-ivo.ivanov.ivanov1@gmail.com>
 <ac7bq3toicuoppmspqvohiss5wkhgw4v6aozzstd5pr66bfcse@k7tqijab4csq>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <ac7bq3toicuoppmspqvohiss5wkhgw4v6aozzstd5pr66bfcse@k7tqijab4csq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/24/25 01:51, Dmitry Baryshkov wrote:
> On Sun, Feb 23, 2025 at 02:22:26PM +0200, Ivaylo Ivanov wrote:
>> The Exynos2200 SoC reuses the Synopsis eUSB2 PHY IP, alongside an
>> external repeater, for USB 2.0. Add support for it to the existing
>> driver.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
>>  drivers/phy/Kconfig          |   2 +-
>>  drivers/phy/phy-snps-eusb2.c | 172 +++++++++++++++++++++++++++++++++++
>>  2 files changed, 173 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
>> index 11c166204..58c911e1b 100644
>> --- a/drivers/phy/Kconfig
>> +++ b/drivers/phy/Kconfig
>> @@ -45,7 +45,7 @@ config PHY_PISTACHIO_USB
>>  
>>  config PHY_SNPS_EUSB2
>>  	tristate "SNPS eUSB2 PHY Driver"
>> -	depends on OF && (ARCH_QCOM || COMPILE_TEST)
>> +	depends on OF && (ARCH_EXYNOS || ARCH_QCOM || COMPILE_TEST)
>>  	select GENERIC_PHY
>>  	help
>>  	  Enable support for the USB high-speed SNPS eUSB2 phy on select
>> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
>> index 7a242fe32..67a19d671 100644
>> --- a/drivers/phy/phy-snps-eusb2.c
>> +++ b/drivers/phy/phy-snps-eusb2.c
>> @@ -13,6 +13,39 @@
>>  #include <linux/regulator/consumer.h>
>>  #include <linux/reset.h>
>>  
>> +#define EXYNOS_USB_PHY_HS_PHY_CTRL_RST	(0x0)
>> +#define USB_PHY_RST_MASK		GENMASK(1, 0)
>> +#define UTMI_PORT_RST_MASK		GENMASK(5, 4)
>> +
>> +#define EXYNOS_USB_PHY_HS_PHY_CTRL_COMMON	(0x4)
>> +#define RPTR_MODE			BIT(10)
>> +#define FSEL_20_MHZ_VAL			(0x1)
>> +#define FSEL_24_MHZ_VAL			(0x2)
>> +#define FSEL_26_MHZ_VAL			(0x3)
>> +#define FSEL_48_MHZ_VAL			(0x2)
>> +
>> +#define EXYNOS_USB_PHY_CFG_PLLCFG0	(0x8)
>> +#define PHY_CFG_PLL_FB_DIV_19_8_MASK	GENMASK(19, 8)
>> +#define DIV_19_8_19_2_MHZ_VAL		(0x170)
>> +#define DIV_19_8_20_MHZ_VAL		(0x160)
>> +#define DIV_19_8_24_MHZ_VAL		(0x120)
>> +#define DIV_19_8_26_MHZ_VAL		(0x107)
>> +#define DIV_19_8_48_MHZ_VAL		(0x120)
>> +
>> +#define EXYNOS_USB_PHY_CFG_PLLCFG1	(0xc)
>> +#define EXYNOS_PHY_CFG_PLL_FB_DIV_11_8_MASK	GENMASK(11, 8)
>> +#define EXYNOS_DIV_11_8_19_2_MHZ_VAL	(0x0)
>> +#define EXYNOS_DIV_11_8_20_MHZ_VAL	(0x0)
>> +#define EXYNOS_DIV_11_8_24_MHZ_VAL	(0x0)
>> +#define EXYNOS_DIV_11_8_26_MHZ_VAL	(0x0)
>> +#define EXYNOS_DIV_11_8_48_MHZ_VAL	(0x1)
>> +
>> +#define EXYNOS_PHY_CFG_TX		(0x14)
>> +#define EXYNOS_PHY_CFG_TX_FSLS_VREF_TUNE_MASK	GENMASK(2, 1)
>> +
>> +#define EXYNOS_USB_PHY_UTMI_TESTSE	(0x20)
>> +#define TEST_IDDQ			BIT(6)
>> +
>>  #define QCOM_USB_PHY_UTMI_CTRL0		(0x3c)
>>  #define SLEEPM				BIT(0)
>>  #define OPMODE_MASK			GENMASK(4, 3)
>> @@ -196,6 +229,93 @@ static void qcom_eusb2_default_parameters(struct snps_eusb2_hsphy *phy)
>>  				    FIELD_PREP(PHY_CFG_TX_HS_XV_TUNE_MASK, 0x0));
>>  }
>>  
>> +static int exynos_eusb2_ref_clk_init(struct snps_eusb2_hsphy *phy)
>> +{
>> +	unsigned long ref_clk_freq = clk_get_rate(phy->ref_clk);
>> +
>> +	switch (ref_clk_freq) {
>> +	case 19200000:
>> +		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_HS_PHY_CTRL_COMMON,
>> +					    FSEL_MASK,
>> +					    FIELD_PREP(FSEL_MASK, FSEL_19_2_MHZ_VAL));
>> +
> Could you please unify the switchcase? assign the values to temp
> variables, then program them from a single code stream. Or maybe even
> replace switch-case with a table-based lookup.
>
> (we probably should implement the similar change for qcom part. Maybe
> you can refactor it too?)

Alright. I'll do it for the Qualcomm part too in a separate commit.

Thanks for the feedback!

Best regards,
Ivaylo

> Other than that LGTM.
>
>> +		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_CFG_PLLCFG0,
>> +					    PHY_CFG_PLL_FB_DIV_19_8_MASK,
>> +					    FIELD_PREP(PHY_CFG_PLL_FB_DIV_19_8_MASK,
>> +						       DIV_19_8_19_2_MHZ_VAL));
>> +
>> +		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_CFG_PLLCFG1,
>> +					    EXYNOS_PHY_CFG_PLL_FB_DIV_11_8_MASK,
>> +					    EXYNOS_DIV_11_8_19_2_MHZ_VAL);
>> +		break;
>> +
>> +	case 20000000:
>> +		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_HS_PHY_CTRL_COMMON,
>> +					    FSEL_MASK,
>> +					    FIELD_PREP(FSEL_MASK, FSEL_20_MHZ_VAL));
>> +
>> +		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_CFG_PLLCFG0,
>> +					    PHY_CFG_PLL_FB_DIV_19_8_MASK,
>> +					    FIELD_PREP(PHY_CFG_PLL_FB_DIV_19_8_MASK,
>> +						       DIV_19_8_20_MHZ_VAL));
>> +
>> +		snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_CFG_PLLCFG1,
>> +					    EXYNOS_PHY_CFG_PLL_FB_DIV_11_8_MASK,
>> +					    EXYNOS_DIV_11_8_20_MHZ_VAL);
>> +		break;
>> +


