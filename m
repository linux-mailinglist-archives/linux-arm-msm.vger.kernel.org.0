Return-Path: <linux-arm-msm+bounces-80206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C631FC2F2D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 04:36:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23FB9189D05C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 03:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E609E298CA3;
	Tue,  4 Nov 2025 03:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pyni/L2y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W0San4eI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D7B289367
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 03:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762227362; cv=none; b=gKILcKpw/AtW42Ay9JOoj4qir/i2/uTDy/C2SwiJ1I1l/97fBtQT4vmw4gqkJuws+O08xJoTd/yULz7vkK0cWQhtGuDXg0bk31NxcDMGhQmDXTQnIeVlMXY4y2gzYu/3d5nTmWCW+tvC4sYoOElD5dOENCCHwOSWQG8VW1c01g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762227362; c=relaxed/simple;
	bh=sONvN48WvUykuvXU9ekPNNHwgbAw4IZu0rPtno0aFkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LsLxdNpK7x5HVxEY70lZK18CYItTBZ1a7EWuUl81at6pKwoG6B/E/0SFJzOag/Md4T0YzPRwFB96QT/9vEu4cQXqh0T5ZTZ17TzVFHBnXS8JDAjOBIU1FZXraddFbL+3mUbHhI7lUpk8hBoA8VH2ExBaG2lYYBveD33NPZ64IaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pyni/L2y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W0San4eI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A43K3t43693596
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 03:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aLTdB4QZiAIA7IonEaxgSWsE3Df8dp078mbN912dQ/g=; b=Pyni/L2ylc6Cj6vk
	1eA5YCtnKfK43id8UAZSnhhf7tKxr4fWwg9VufNBTxuMPhFaInMaGfI3ovrYRuzh
	Tvc4qYgrMdKnsMAxyyTOaBmHYpPbJNGZEqLrEzBukmcEWrPic3oQMNIQCv5x5Ovq
	Wm9IQP96QKNnlnf9sTSKCvpRQAcNsDas6OZW23yYSRjJKjfUV7za2X+rePUUePzm
	17+pxdOEwaRwBLyAuNr3iJd9UqfkWvq+szsRGzxi/lKggjpUoRPDoAA1HxDln1nr
	rY5saRrAZTpmRS2gyws/mN7wA0fk70ZDx9pIoZsMp4IkrWvwLJ7EO8mRWqgIsjR7
	hgNMBg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70gm9gen-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 03:36:00 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7a930afac24so250955b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 19:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762227360; x=1762832160; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aLTdB4QZiAIA7IonEaxgSWsE3Df8dp078mbN912dQ/g=;
        b=W0San4eIapIY54/JaL8LCsFidl80DcNT4GSRg7FuNb2NG1oGsM7JxB5qpdjfB9fv8T
         iHN7n/l6xhHTKcOKZVxHCWI2DlFm/wEWSvypqQZ/hpLe+IaWrBbYHGpo9bTu8NxjugoI
         bhRz2R2dDGstZL+aYFl6Uh6RJE+P4bS0Y7J7IAoS+AJm/hcJrghN0rAbt3zhCpmkBcIG
         7QMk4Ma/jCD83+GkiuyHVrlQl0Psw1acLmscDYp8cjMSAHk/rnMAuX9dabReIVub5/vi
         qCzLO7cY/9LhR8PUAcFouo8jTbDT97X6rukQRbAPeybR6R+6JZcgf/iFZPiq7lOCcq6V
         Xq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762227360; x=1762832160;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aLTdB4QZiAIA7IonEaxgSWsE3Df8dp078mbN912dQ/g=;
        b=AJkjLyfEp1JwDBviKNdxLCmc+/nmp4FojNglZzNqjEcizodEcIMYlZqcHHaAexmX5O
         z7Rks0UqAMlR0ZLyhiRvI3OgrAo2D9tZwir0NgtdZMr0gKEeRuLr4LntPHQ8TwKKyPru
         tx4HzwWpMHnhcyo69KYN8gwml16w2NDFJDD5CJCz89l96I8Wq85XgHD2zj2OMs8R/Y0N
         PRlxgqe9mm/C4hPrO17VquGs0S7Nsmw/lCf4FEnkLD+JHQbYR4cOhL7H4Lz2rpvR0wWO
         ZNzC8VvnlkDVMeYjMLMQ7b/guqtHHtez+JcBccTWx4oB8iY9qc5ghLPZH77Jis78KLPJ
         JYOA==
X-Forwarded-Encrypted: i=1; AJvYcCWczVTKx2gcWXcnuiaQOQIEazO0FtLvooMO1jzLfD7bC0VgCIcyusUC1WBgshsjctewNxjMFVgR3laZRfD8@vger.kernel.org
X-Gm-Message-State: AOJu0YwO8OLu5HY0bdm+r7aGWc5YvXZJQz9gnlw0aSXrJt9FUb8oQraL
	UV9BjGoFbQIRHrF7dWpadtzk56u+tO1f6kdy7jdN8y6eSEVNnxDhod19ojzfyFw7y8BCFd9ynPi
	ApvZvplqajCeQ/WbPc3bwG8++vjDtoVpGB4IH9kaEsCY1eDL0BQP+BXlTuoOhvGv+bcKB
X-Gm-Gg: ASbGnctH/vmMOAKkhvGNyLHAcX2CawTO027BX2qfkLcYaXu6CPSspwoaoT5YEJGgtne
	USlzmuS/duM8xTelNROrGntalcGN/fEn+qWLJyuQCcC6NkM3JcRnttOfy9rnPSITC/Z5D1sdPKd
	lE7u05WTVuoMocBJu83xYOlj/exHAXU1nruXxmTH8kkFnH8tV9VEtgKQtBOI1Puyyh1HwDbdlfC
	kCld/3vDT6Y2UV59QHBrEWZPUjxXoXjBtmJeJcoSntYRBBPzoNDL6de6qn+z2088KPlDUWzPAVv
	KWg8kPJrjUr2lRKv2//AdirVaipD7fdd3orc+MIOGzHivqW45TqAZy/pkJ1CHBWl8nWMQQWeDxD
	M/0Ocaf4lq6iy++SOUZuwVPL2eEJYSqwU1zx8mcFpBAFMsb97ibhITa5E7UV18yR3hg==
X-Received: by 2002:a05:6a00:bd81:b0:781:aad7:214b with SMTP id d2e1a72fcca58-7a776aa91a3mr9906666b3a.2.1762227359672;
        Mon, 03 Nov 2025 19:35:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/JJ3RM7NecDosGss89bhfFDhSWMYNVNuNntMqK71YqzsrihWyXJGLge+Rp0OpNCDluamzbA==
X-Received: by 2002:a05:6a00:bd81:b0:781:aad7:214b with SMTP id d2e1a72fcca58-7a776aa91a3mr9906642b3a.2.1762227359078;
        Mon, 03 Nov 2025 19:35:59 -0800 (PST)
Received: from [10.133.33.149] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd3246d33sm1064594b3a.13.2025.11.03.19.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 19:35:58 -0800 (PST)
Message-ID: <359f88fb-a207-499f-aad0-e12ea3da222b@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 11:35:53 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] clk: qcom: Add TCSR clock driver for Kaanapali
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, jingyi.wang@oss.qualcomm.com
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251030-gcc_kaanapali-v2-v2-0-a774a587af6f@oss.qualcomm.com>
 <20251030-gcc_kaanapali-v2-v2-5-a774a587af6f@oss.qualcomm.com>
From: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251030-gcc_kaanapali-v2-v2-5-a774a587af6f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -H0lAjYulHJjlVHAheiYxJxPJZbaec1V
X-Proofpoint-GUID: -H0lAjYulHJjlVHAheiYxJxPJZbaec1V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDAyNyBTYWx0ZWRfX/YORvdjgtwfU
 tGAVqlwsXn8hCos1qGtJ3zcQsXiOm4QW2sLWyWnYDQJlp6tBgNabWa0kdbdVggM/KVPUUywqyE0
 a5TnsKXqp2fS8QA4CUfw2iCYY9i0IL/YAsUvCmxgQJ947i14Dxp1j7ntuTBcQ1PzZ3xSJ0shz5S
 YxpOvqypAlJ0F+oYph6i/bsUgblUvdKXCI700/2Xop3Hnfm5XVw+63S2CKK8yLURmKHVE89iV3L
 5lcqn/Eg2ATBt+RyDX3F7uyDOGDu47PbEsFekmmlHABjzmpNcL4ULpEQWin9SqqOG6yz51LDcvY
 d+3gCMM0SAUKAbPWfistyDAfwFhqpM73IRgy7Et8FU5kYFqz4DoSmDEkzKegA08bX13QLPN2wMU
 Da7Vdtw4+lJXobek4mtqth0m27QFag==
X-Authority-Analysis: v=2.4 cv=CeMFJbrl c=1 sm=1 tr=0 ts=690974a0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vSTseKTzBe5nLB2U_wEA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040027

On 10/30/2025 7:09 PM, Taniya Das wrote:
> Add the TCSR clock controller that provides the refclks on Kaanapali
> platform for PCIe, USB and UFS subsystems.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig            |   8 ++
>  drivers/clk/qcom/Makefile           |   1 +
>  drivers/clk/qcom/tcsrcc-kaanapali.c | 141 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 150 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 4a78099e706c2cee5162d837cad3723db75039d0..8ec1803af76cb87da59ca3ef28127c06f3e26d2b 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -46,6 +46,14 @@ config CLK_GLYMUR_TCSRCC
>  	  Support for the TCSR clock controller on GLYMUR devices.
>  	  Say Y if you want to use peripheral devices such as USB/PCIe/EDP.
>  
> +config CLK_KAANAPALI_TCSRCC
> +	tristate "KAANAPALI TCSR Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
> +	select QCOM_GDSC
> +	help
> +	  Support for the TCSR clock controller on Kaanapali devices.
> +	  Say Y if you want to use peripheral devices such as PCIe, USB, UFS.
> +
>  config CLK_X1E80100_CAMCC
>  	tristate "X1E80100 Camera Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 5a0fd1d843c87a6f0a805706fcfad91c3f705340..2350631814779ad086d5c8304b250b0cc2f5203b 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -24,6 +24,7 @@ obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
>  obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
>  obj-$(CONFIG_CLK_GLYMUR_GCC) += gcc-glymur.o
>  obj-$(CONFIG_CLK_GLYMUR_TCSRCC) += tcsrcc-glymur.o
> +obj-$(CONFIG_CLK_KAANAPALI_TCSRCC) += tcsrcc-kaanapali.o
>  obj-$(CONFIG_CLK_X1E80100_CAMCC) += camcc-x1e80100.o
>  obj-$(CONFIG_CLK_X1E80100_DISPCC) += dispcc-x1e80100.o
>  obj-$(CONFIG_CLK_X1E80100_GCC) += gcc-x1e80100.o
> diff --git a/drivers/clk/qcom/tcsrcc-kaanapali.c b/drivers/clk/qcom/tcsrcc-kaanapali.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..14cfa75e892cc5ee1b03909f8c03d92de8ae2cd6
> --- /dev/null
> +++ b/drivers/clk/qcom/tcsrcc-kaanapali.c
> @@ -0,0 +1,141 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,sm8750-tcsr.h>
> +
> +#include "clk-branch.h"
> +#include "clk-regmap.h"
> +#include "clk-regmap-divider.h"
> +#include "clk-regmap-mux.h"
> +#include "common.h"
> +
> +enum {
> +	DT_BI_TCXO_PAD,
> +};
> +
> +static struct clk_branch tcsr_pcie_0_clkref_en = {
> +	.halt_reg = 0x0,
> +	.halt_check = BRANCH_HALT_DELAY,
> +	.clkr = {
> +		.enable_reg = 0x0,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "tcsr_pcie_0_clkref_en",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch tcsr_ufs_clkref_en = {
> +	.halt_reg = 0x10,
> +	.halt_check = BRANCH_HALT_DELAY,
> +	.clkr = {
> +		.enable_reg = 0x10,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "tcsr_ufs_clkref_en",
> +			.parent_data = &(const struct clk_parent_data){
> +				.index = DT_BI_TCXO_PAD,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch tcsr_usb2_clkref_en = {
> +	.halt_reg = 0x18,
> +	.halt_check = BRANCH_HALT_DELAY,
> +	.clkr = {
> +		.enable_reg = 0x18,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "tcsr_usb2_clkref_en",
> +			.parent_data = &(const struct clk_parent_data){
> +				.index = DT_BI_TCXO_PAD,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch tcsr_usb3_clkref_en = {
> +	.halt_reg = 0x8,
> +	.halt_check = BRANCH_HALT_DELAY,
> +	.clkr = {
> +		.enable_reg = 0x8,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "tcsr_usb3_clkref_en",
> +			.parent_data = &(const struct clk_parent_data){
> +				.index = DT_BI_TCXO_PAD,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_regmap *tcsr_cc_kaanapali_clocks[] = {
> +	[TCSR_PCIE_0_CLKREF_EN] = &tcsr_pcie_0_clkref_en.clkr,
> +	[TCSR_UFS_CLKREF_EN] = &tcsr_ufs_clkref_en.clkr,
> +	[TCSR_USB2_CLKREF_EN] = &tcsr_usb2_clkref_en.clkr,
> +	[TCSR_USB3_CLKREF_EN] = &tcsr_usb3_clkref_en.clkr,
> +};
> +
> +static const struct regmap_config tcsr_cc_kaanapali_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.max_register = 0x18,
> +	.fast_io = true,
> +};
> +
> +static const struct qcom_cc_desc tcsr_cc_kaanapali_desc = {
> +	.config = &tcsr_cc_kaanapali_regmap_config,
> +	.clks = tcsr_cc_kaanapali_clocks,
> +	.num_clks = ARRAY_SIZE(tcsr_cc_kaanapali_clocks),
> +};
> +
> +static const struct of_device_id tcsr_cc_kaanapali_match_table[] = {
> +	{ .compatible = "qcom,kaanapali-tcsr" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, tcsr_cc_kaanapali_match_table);
> +
> +static int tcsr_cc_kaanapali_probe(struct platform_device *pdev)
> +{
> +	return qcom_cc_probe(pdev, &tcsr_cc_kaanapali_desc);
> +}
> +
> +static struct platform_driver tcsr_cc_kaanapali_driver = {
> +	.probe = tcsr_cc_kaanapali_probe,
> +	.driver = {
> +		.name = "tcsr_cc-kaanapali",
> +		.of_match_table = tcsr_cc_kaanapali_match_table,
> +	},
> +};
> +
> +static int __init tcsr_cc_kaanapali_init(void)
> +{
> +	return platform_driver_register(&tcsr_cc_kaanapali_driver);
> +}
> +subsys_initcall(tcsr_cc_kaanapali_init);
> +
> +static void __exit tcsr_cc_kaanapali_exit(void)
> +{
> +	platform_driver_unregister(&tcsr_cc_kaanapali_driver);
> +}
> +module_exit(tcsr_cc_kaanapali_exit);
> +
> +MODULE_DESCRIPTION("QTI TCSR_CC KAANAPALI Driver");
> +MODULE_LICENSE("GPL");
> 

Remind for review.
I can see the previous comments was well addressed.

-- 
Thx and BRs,
Aiqun(Maria) Yu

