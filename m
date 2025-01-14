Return-Path: <linux-arm-msm+bounces-44979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1214A1027E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 09:57:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B80C3A2827
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 08:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C80FF28EC67;
	Tue, 14 Jan 2025 08:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UNhb7K8c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF41284A40
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 08:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736845053; cv=none; b=kKxr6dyS8EaReg9LQBBO3BIQK20AGVMXH9b52pyC6kMWJCZM8gV2gUPuTFBN1OeXo6tz0ryakvLQJM0NglTEguONSoTHtQpsKm+/jsPY/QlpRAXSc5dVGU4EVMMWdbh5QTQeMLXDZIcXsOWNqCctA9Ki4I4BQKb6u62h6eu7kP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736845053; c=relaxed/simple;
	bh=ae0jwqWD2IQ+TC5qoEQjaO87y/jwl5cvPLkj4bEMDRQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=NpkKHtIJ8oDVSw7tU7A75s7oyu4s8Lan4T8Qj0QH7heyClXfs3B7NbRfxG0abM9S9MQr8s0+UsneXBI8OBSWmxTdkB8rJs/SgGjBLQlCy5pXiXr5zH5tQslTN9BTk/KnxSv+PsxGW5fze/4PnjhUuU4hq9A8FmuwcesXpqTIB0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UNhb7K8c; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43623f0c574so37077945e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 00:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736845049; x=1737449849; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SkbyPek4ikd/zfWm4/dF+evoWpKWcc5LjrmdhY3sgPk=;
        b=UNhb7K8c4KgohhizkDlpCWT6lqRay7bQAh9Why6U+ZguQCDDBbxRzhH/1iP4AioF+E
         sjYYa72WG2mn7PEhfxd1IVHwlI6FhWyqZplNsf/alKUTyen89pxF4O1I54Y9ME01T0pb
         +8nS0esEwXxW5L01Akkv1QdOWOT6zySRnznHhMUQ8q0r9Qg+SK4VqcK6xGk8r/wssOBe
         afQ/W1tw8LlwIdRnn5ffkOLyxGL38aKU99VOmsqCytRQ2S+COaaXC33vj2AfE9UowiTI
         QJVl++xXVMJEOWfH/JPW7KK+ay+QN9Bh/U6YA1gx+xiMy3PsvSPBztQwCFTK+HfGmaji
         BCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736845049; x=1737449849;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SkbyPek4ikd/zfWm4/dF+evoWpKWcc5LjrmdhY3sgPk=;
        b=ZCOqTFCaKjht0uupJwqU55RXrxyulFiWxmQ7hJMOj71HtDmEH6XT3hlzcIknMdudB7
         DyWvJEZ5hYkswShL1TZEgs2pKVYaXlHrDt/tkVkpUISgOZ4jNECSYKuf/SHyd713qmgI
         gB+dwZrMLxa0Nr4P8M6tavdJQhhdNOsmnjQgix0oaCfNkGGUDNI5eB3BNw43gFLjOgt2
         yoYnFM+k+YvSFRH9N8uvG0We9qWjfsAHuBQZTunnd+nnkznpzrV9VpTLDVRoiF9Po6Zi
         ABvV6He5O5odR1nj+a/KWcQe2Ax1sbfK2FC+f/Q8inSDTxAxhkfRGeUzQVDsmWkklyu1
         uNlA==
X-Gm-Message-State: AOJu0YzsFs6NW8zKciGy8wHkinG9h1OLOTyAmQFllDE7ui5N2IAfvJGq
	/3VWW418YQvEXQMb8o7pFYTqVKg8o+dvOm84mfwl0ibzPhVLnQSopLqo0M8Z3+w=
X-Gm-Gg: ASbGncu8qxdHfwEeX1Ub8V57f8tlalaUK/TOMuxGNoGsyCQYZA4q9pRz3443J41XCrA
	zg3izV3JeSlibq6pGY5mpHUZXtCyVjDYueO4ZV+nTumv4PgbYf4ERwqOawrclo620k/6xQQP7Sv
	Y4a8q6k5+/wuWtN8lRQLa8DFW1yarv9bbxUGr/jpTpA5nibCyF1pwzUTSW9WBZno+2kFoTkRQR9
	X3LV94YVojjrkWgXb9RV23BU/+NY3vBT2sT2EOWQiV/Yn+4pwKVd1e79p0ptTA0EFK018IXJRI5
	mI8bkbTHOa41Ja6LKWc6Ek6bGmG2hePkSg==
X-Google-Smtp-Source: AGHT+IGKdF4rSeZyNHxQDPMFUvUCZQHiGgOlVyiokrjzhFfjZf2+fwkH2q15v5w5nBnv49AbL+PvMA==
X-Received: by 2002:a05:600c:a08b:b0:431:5863:4240 with SMTP id 5b1f17b1804b1-436e26dda73mr181588405e9.24.1736845049023;
        Tue, 14 Jan 2025 00:57:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:a5df:aa69:5642:11b5? ([2a01:e0a:982:cbb0:a5df:aa69:5642:11b5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e62333sm165614595e9.36.2025.01.14.00.57.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 00:57:28 -0800 (PST)
Message-ID: <7e97c953-5eb9-4b04-b5fc-d5436a4cb0c4@linaro.org>
Date: Tue, 14 Jan 2025 09:57:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 5/7] phy: qcom: Add M31 based eUSB2 PHY driver
To: Melody Olvera <quic_molvera@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
 Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-5-09afe1dc2524@quicinc.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250113-sm8750_usb_master-v1-5-09afe1dc2524@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/01/2025 22:52, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> On SM8750, the eUSB2 PHY used is M31 based. Add the initialization
> sequences to bring it out of reset, and to initialize the associated eUSB2
> repeater as well.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>   drivers/phy/qualcomm/Kconfig              |  12 +-
>   drivers/phy/qualcomm/Makefile             |   1 +
>   drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 269 ++++++++++++++++++++++++++++++
>   3 files changed, 281 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
> index 846f8c99547fd5132feaa1e41093b8eab51714f9..8c265ae86c7b9ddcb66b42626557ea130b674001 100644
> --- a/drivers/phy/qualcomm/Kconfig
> +++ b/drivers/phy/qualcomm/Kconfig
> @@ -140,7 +140,7 @@ config PHY_QCOM_EUSB2_REPEATER
>   	select GENERIC_PHY
>   	help
>   	  Enable support for the USB high-speed SNPS eUSB2 repeater on Qualcomm
> -	  PMICs. The repeater is paired with a Synopsys eUSB2 Phy
> +	  PMICs. The repeater can be paired with a Synopsys or M31 eUSB2 Phy

This should be a separate patch

>   	  on Qualcomm SOCs.
>   
>   config PHY_QCOM_M31_USB
> @@ -154,6 +154,16 @@ config PHY_QCOM_M31_USB
>   	  management. This driver is required even for peripheral only or
>   	  host only mode configurations.
>   
> +config PHY_QCOM_M31_EUSB
> +	tristate "Qualcomm M31 eUSB2 PHY driver support"
> +	depends on USB && (ARCH_QCOM || COMPILE_TEST)
> +	select GENERIC_PHY
> +	help
> +	  Enable this to support M31 EUSB2 PHY transceivers on Qualcomm
> +	  chips with DWC3 USB core. It supports initializing and cleaning
> +	  up of the associated USB repeater that is paired with the eUSB2
> +	  PHY.
> +
>   config PHY_QCOM_USB_HS
>   	tristate "Qualcomm USB HS PHY module"
>   	depends on USB_ULPI_BUS
> diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
> index eb60e950ad53334a3ada3db618aa584afb33fb93..f88ba0f71a73cd6935184c8831d6cd6488d6551f 100644
> --- a/drivers/phy/qualcomm/Makefile
> +++ b/drivers/phy/qualcomm/Makefile
> @@ -5,6 +5,7 @@ obj-$(CONFIG_PHY_QCOM_EDP)		+= phy-qcom-edp.o
>   obj-$(CONFIG_PHY_QCOM_IPQ4019_USB)	+= phy-qcom-ipq4019-usb.o
>   obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)	+= phy-qcom-ipq806x-sata.o
>   obj-$(CONFIG_PHY_QCOM_M31_USB)		+= phy-qcom-m31.o
> +obj-$(CONFIG_PHY_QCOM_M31_EUSB)		+= phy-qcom-m31-eusb2.o
>   obj-$(CONFIG_PHY_QCOM_PCIE2)		+= phy-qcom-pcie2.o
>   
>   obj-$(CONFIG_PHY_QCOM_QMP_COMBO)	+= phy-qcom-qmp-combo.o phy-qcom-qmp-usbc.o
> diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..e15529673e358db914936a60fa605c872cd2511a
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> @@ -0,0 +1,269 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +#include <linux/slab.h>
> +
> +#define USB_PHY_UTMI_CTRL0		(0x3c)
> +
> +#define USB_PHY_UTMI_CTRL5		(0x50)
> +
> +#define USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
> +#define FSEL				(0x7 << 4)
> +#define FSEL_38_4_MHZ_VAL		(0x6 << 4)
> +
> +#define USB_PHY_HS_PHY_CTRL2		(0x64)
> +
> +#define USB_PHY_CFG0			(0x94)
> +#define USB_PHY_CFG1			(0x154)
> +
> +#define USB_PHY_FSEL_SEL		(0xb8)
> +
> +#define USB_PHY_XCFGI_39_32		(0x16c)
> +#define USB_PHY_XCFGI_71_64		(0x17c)
> +#define USB_PHY_XCFGI_31_24		(0x168)
> +#define USB_PHY_XCFGI_7_0		(0x15c)
> +
> +#define M31_EUSB_PHY_INIT_CFG(o, b, v)	\
> +{				\
> +	.off = o,		\
> +	.mask = b,		\
> +	.val = v,		\
> +}
> +
> +struct m31_phy_tbl_entry {
> +	u32 off;
> +	u32 mask;
> +	u32 val;
> +};
> +
> +struct m31_eusb2_priv_data {
> +	const struct m31_phy_tbl_entry	*setup_seq;
> +	unsigned int			setup_seq_nregs;
> +	const struct m31_phy_tbl_entry	*override_seq;
> +	unsigned int			override_seq_nregs;
> +	const struct m31_phy_tbl_entry	*reset_seq;
> +	unsigned int			reset_seq_nregs;
> +	unsigned int			fsel;
> +};
> +
> +static const struct m31_phy_tbl_entry m31_eusb2_setup_tbl[] = {
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG0, BIT(1), 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL5, BIT(1), 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG1, BIT(0), 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_FSEL_SEL, BIT(0), 1),
> +};
> +
> +static const struct m31_phy_tbl_entry m31_eusb_phy_override_tbl[] = {
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_39_32, GENMASK(3, 2), 0),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_71_64, GENMASK(3, 0), 7),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_31_24, GENMASK(2, 0), 0),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_7_0, GENMASK(1, 0), 0),
> +};
> +
> +static const struct m31_phy_tbl_entry m31_eusb_phy_reset_tbl[] = {
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL2, BIT(3), 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL2, BIT(2), 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL0, BIT(0), 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL_COMMON0, BIT(1), 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL_COMMON0, BIT(2), 0),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL5, BIT(1), 0),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL2, BIT(3), 0),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG0, BIT(1), 0),
> +};
> +
> +struct m31eusb2_phy {
> +	struct phy			*phy;
> +	void __iomem			*base;
> +	const struct m31_eusb2_priv_data	*data;
> +
> +	struct regulator		*vreg;
> +	struct clk			*clk;
> +	struct reset_control		*reset;
> +
> +	struct phy *repeater;
> +};
> +
> +static void msm_m31_eusb2_write_readback(void __iomem *base, u32 offset,
> +					const u32 mask, u32 val)

The function should be named like the other: m31eusb2_phy_write_readback

> +{
> +	u32 write_val, tmp = readl_relaxed(base + offset);
> +
> +	tmp &= ~mask;
> +	write_val = tmp | val;
> +
> +	writel_relaxed(write_val, base + offset);
> +
> +	tmp = readl_relaxed(base + offset);
> +	tmp &= mask;
> +
> +	if (tmp != val)
> +		pr_err("write: %x to offset: %x FAILED\n", val, offset);

Perhaps propagate this error ?

> +}
> +
> +static void m31eusb2_phy_write_sequence(struct m31eusb2_phy *phy,
> +					const struct m31_phy_tbl_entry *tbl,
> +					int num)
> +{
> +	int i;
> +
> +	for (i = 0 ; i < num; i++, tbl++) {
> +		dev_dbg(&phy->phy->dev, "Offset:%x BitMask:%x Value:%x",
> +					tbl->off, tbl->mask, tbl->val);
> +
> +		msm_m31_eusb2_write_readback(phy->base,
> +					tbl->off, tbl->mask,
> +					tbl->val << __ffs(tbl->mask));

Ditto

> +	}
> +}
> +
> +static int m31eusb2_phy_init(struct phy *uphy)
> +{
> +	struct m31eusb2_phy *phy = phy_get_drvdata(uphy);
> +	const struct m31_eusb2_priv_data *data = phy->data;
> +	int ret;
> +
> +	ret = regulator_enable(phy->vreg);
> +	if (ret) {
> +		dev_err(&uphy->dev, "failed to enable regulator, %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = phy_init(phy->repeater);
> +	if (ret) {
> +		dev_err(&uphy->dev, "repeater init failed. %d\n", ret);
> +		goto disable_vreg;
> +	}
> +
> +	if (ret) {
> +		dev_err(&uphy->dev, "failed to enable cfg ahb clock, %d\n", ret);
> +		goto disable_repeater;
> +	}

Useless code, seems you removed a function call and forgot to remote the error check

> +
> +	/* Perform phy reset */
> +	reset_control_assert(phy->reset);
> +	udelay(5);
> +	reset_control_deassert(phy->reset);
> +
> +	m31eusb2_phy_write_sequence(phy, data->setup_seq, data->setup_seq_nregs);
> +	msm_m31_eusb2_write_readback(phy->base,
> +					USB_PHY_HS_PHY_CTRL_COMMON0, FSEL,
> +					data->fsel);
> +	m31eusb2_phy_write_sequence(phy, data->override_seq, data->override_seq_nregs);
> +	m31eusb2_phy_write_sequence(phy, data->reset_seq, data->reset_seq_nregs);
> +
> +	return 0;
> +
> +disable_repeater:
> +	phy_exit(phy->repeater);
> +disable_vreg:
> +	regulator_disable(phy->vreg);
> +
> +	return 0;
> +}
> +
> +static int m31eusb2_phy_exit(struct phy *uphy)
> +{
> +	struct m31eusb2_phy *phy = phy_get_drvdata(uphy);
> +
> +	regulator_disable(phy->vreg);
> +	phy_exit(phy->repeater);
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops m31eusb2_phy_gen_ops = {
> +	.init	= m31eusb2_phy_init,
> +	.exit	= m31eusb2_phy_exit,
> +	.owner		= THIS_MODULE,

Spurious spaces

> +};
> +
> +static int m31eusb2_phy_probe(struct platform_device *pdev)
> +{
> +	struct phy_provider *phy_provider;
> +	const struct m31_eusb2_priv_data *data;
> +	struct device *dev = &pdev->dev;
> +	struct m31eusb2_phy *phy;
> +
> +	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
> +	if (!phy)
> +		return -ENOMEM;
> +
> +	data = of_device_get_match_data(dev);
> +	if (IS_ERR(data))
> +		return -EINVAL;
> +	phy->data = data;
> +
> +	phy->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(phy->base))
> +		return PTR_ERR(phy->base);
> +
> +	phy->reset = devm_reset_control_get_exclusive_by_index(dev, 0);
> +	if (IS_ERR(phy->reset))
> +		return PTR_ERR(phy->reset);
> +
> +	phy->clk = devm_clk_get(dev, NULL);
> +
> +	phy->phy = devm_phy_create(dev, NULL, &m31eusb2_phy_gen_ops);
> +	if (IS_ERR(phy->phy))
> +		return dev_err_probe(dev, PTR_ERR(phy->phy),
> +				     "failed to create phy\n");
> +
> +	phy->vreg = devm_regulator_get(dev, "vdd");
> +	if (IS_ERR(phy->vreg))
> +		return dev_err_probe(dev, PTR_ERR(phy->vreg),
> +				     "failed to get vreg\n");
> +
> +	phy_set_drvdata(phy->phy, phy);
> +
> +	phy->repeater = devm_of_phy_get_by_index(dev, dev->of_node, 0);
> +	if (IS_ERR(phy->repeater))
> +		return dev_err_probe(dev, PTR_ERR(phy->repeater),
> +				     "failed to get repeater\n");
> +
> +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +	if (!IS_ERR(phy_provider))
> +		dev_info(dev, "Registered M31 USB phy\n");
> +
> +	return PTR_ERR_OR_ZERO(phy_provider);
> +}
> +
> +static const struct m31_eusb2_priv_data m31_eusb_v1_data = {
> +	.setup_seq = m31_eusb2_setup_tbl,
> +	.setup_seq_nregs = ARRAY_SIZE(m31_eusb2_setup_tbl),
> +	.override_seq = m31_eusb_phy_override_tbl,
> +	.override_seq_nregs = ARRAY_SIZE(m31_eusb_phy_override_tbl),
> +	.reset_seq = m31_eusb_phy_reset_tbl,
> +	.reset_seq_nregs = ARRAY_SIZE(m31_eusb_phy_reset_tbl),
> +	.fsel = FSEL_38_4_MHZ_VAL,
> +};
> +
> +static const struct of_device_id m31eusb2_phy_id_table[] = {
> +	{ .compatible = "qcom,sm8750-m31-eusb2-phy", .data = &m31_eusb_v1_data },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, m31eusb2_phy_id_table);
> +
> +static struct platform_driver m31eusb2_phy_driver = {
> +	.probe = m31eusb2_phy_probe,
> +	.driver = {
> +		.name = "qcom-m31eusb2-phy",
> +		.of_match_table = m31eusb2_phy_id_table,
> +	},
> +};
> +
> +module_platform_driver(m31eusb2_phy_driver);
> +
> +MODULE_DESCRIPTION("eUSB2 Qualcomm M31 HSPHY driver");
> +MODULE_LICENSE("GPL");
> 

Thanks,
Neil

