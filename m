Return-Path: <linux-arm-msm+bounces-26083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7FD93061C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jul 2024 17:12:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3315E1C20BB1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jul 2024 15:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D0D13B5BD;
	Sat, 13 Jul 2024 15:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TVU++5Kh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A69137745
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jul 2024 15:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720883533; cv=none; b=XTsGwydeO77OUM7bKIiLhtDwHXPjZZL+yJrfCvgQpIApRIMs3q7zSaYxneD1EqfMOiYrqAwxvpEO2f9nq7H17QLAjWjYkAq5PXIfBZxdAxwZx5y5KCte+4NtsfxHgIBRhFV4H535ZotqoHTOWZ8+xV8xaq+z1DCvU1dTdQ52go4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720883533; c=relaxed/simple;
	bh=P+1NX49KdiTObOO1WSEpuyHFp24rwPSmBcOarxZn/uE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JUnDf+E308cookHbS4d8lS0cXPcr34mTtx2TMsWoWdRFdxiGdePV3wpJO7OHTawPRdcYPny84rngLdUN1b0iQsVqINt+O3BmldhuR5OcrlfTmHUgRbZuWLvOGaagvdXi3OadeH+1bcczYiowaiIc3/hBRU8IgJ7ST1cCoQeEIVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TVU++5Kh; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2eee1384e85so6250181fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jul 2024 08:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720883529; x=1721488329; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7vZWs4SOfcSjJ/0xdBRqV6rLIfc/Pb5SSC5NFGypgNg=;
        b=TVU++5KhLNFzzX2GpfO8RH0NO6Q93zmBH06qvL39caARSEyGSAxgSswywwDDYuyUJS
         G5T+I9XHhMykwUNOz/I2WkZTHIky13ahy3/WqALXjXa+O1zBK4TbPCchcWAP5skRsoEY
         iCmiVJGZWWoFziIsHsByn7Y1sFoRWBq6fSqKV0i9qmEfG4Cnmbjbg+cIhoN7MQiDeVkT
         4HbcNBEF6upbxlROLjxKRmasXS2OQWHSfzliJ63FmK02yuFxLj7eUa354oNRaTvtWl+L
         37eEN7I+hVNt+tfJm+iTNSv0mYmnD9fTVUUu2nRcRQEnmVMEnhi8bg69yl9wUdJLPmEt
         RnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720883529; x=1721488329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vZWs4SOfcSjJ/0xdBRqV6rLIfc/Pb5SSC5NFGypgNg=;
        b=IfMOW3c7C5H7YWUxkHNcjTexYFUzDZelLwDQQxQ+UxKLoQXXZvI7VdpmRZsc8xHNZm
         HWsoae+GGPlK7BheRnTYSza3/NaTk9S1UqtXCE3ygAUq4/F0BLGk5J6DxvHT2nHQYeet
         EZh6WtKqPRFLKzCnT9GQB0KhkK45UFuoVm6HCFxJc1ioUvXye6k3df93V6oAQH6F0US7
         WMv/I5UPWKRTTR4vgACAXWgcCKKVlOInotEY+Cw5mjdq9ooVWiseBEdBEDstYOcfTkT3
         lCiavgUvx4zI9xQapV2NstT2gexIns2pAvPhG7mjhwY4tMktqlZ1vhzqzowFpZYYVayz
         E8sg==
X-Forwarded-Encrypted: i=1; AJvYcCX8oo5NlMmyCA6IMJnh1/tNUNkTGSgqhSbquZ0ltvwgpoPDwmPNVznf2wCH57LhBAeJ5Y9Ey0VWsKqImB/5oQbje+kn/bmY77vuBlr6KA==
X-Gm-Message-State: AOJu0YxbwPsZCQ7aXb0j+mtMSII8niRwML5pF5BCbSKREglqsR3ly4gP
	1g2slI9OXW6+Yitpl/gmMej3AbP7FkapvWs5/18+jxhHSI4VtpiCt+rM4RqcJaQ=
X-Google-Smtp-Source: AGHT+IFMusu1I1v9BiB+eX9P6K0cuf9+FX4dmBbKL7gKF1mkzWuTYbZHowp3wA74HK8woE+7U2QRYA==
X-Received: by 2002:a2e:9bcc:0:b0:2ee:493f:d751 with SMTP id 38308e7fff4ca-2eeb30fd3admr103931631fa.23.1720883528753;
        Sat, 13 Jul 2024 08:12:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2eee179e733sm2304031fa.12.2024.07.13.08.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jul 2024 08:12:08 -0700 (PDT)
Date: Sat, 13 Jul 2024 18:12:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	konrad.dybcio@linaro.org, djakov@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v1 2/3] clk: qcom: ipq5332: Use icc-clk for enabling NoC
 related clocks
Message-ID: <c2s5xsquekvdf4vj3jdbuzjgbeeuarsyj6ummgvq5q7chydp6x@37eti6jhpt2e>
References: <20240709063949.4127310-1-quic_varada@quicinc.com>
 <20240709063949.4127310-3-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240709063949.4127310-3-quic_varada@quicinc.com>

On Tue, Jul 09, 2024 at 12:09:47PM GMT, Varadarajan Narayanan wrote:
> Use the icc-clk framework to enable few clocks to be able to
> create paths and use the peripherals connected on those NoCs.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  drivers/clk/qcom/gcc-ipq5332.c | 36 +++++++++++++++++++++++++++++-----
>  1 file changed, 31 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-ipq5332.c b/drivers/clk/qcom/gcc-ipq5332.c
> index f98591148a97..6d7672cae0f7 100644
> --- a/drivers/clk/qcom/gcc-ipq5332.c
> +++ b/drivers/clk/qcom/gcc-ipq5332.c
> @@ -4,12 +4,14 @@
>   */
>  
>  #include <linux/clk-provider.h>
> +#include <linux/interconnect-provider.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  
>  #include <dt-bindings/clock/qcom,ipq5332-gcc.h>
> +#include <dt-bindings/interconnect/qcom,ipq5332.h>
>  
>  #include "clk-alpha-pll.h"
>  #include "clk-branch.h"
> @@ -131,12 +133,14 @@ static struct clk_alpha_pll gpll4_main = {
>  			 * (will be added soon), so the clock framework
>  			 * disables this source. But some of the clocks
>  			 * initialized by boot loaders uses this source. So we
> -			 * need to keep this clock ON. Add the
> -			 * CLK_IGNORE_UNUSED flag so the clock will not be
> -			 * disabled. Once the consumer in kernel is added, we
> -			 * can get rid of this flag.
> +			 * need to keep this clock ON.
> +			 *
> +			 * After initial bootup, when the ICC framework turns
> +			 * off unused paths, as part of the icc-clk dependencies
> +			 * this clock gets disabled resulting in a hang. Marking
> +			 * it as critical to ensure it is not turned off.

Are there any other users for this clocks? What exactly causes the hang?

>  			 */
> -			.flags = CLK_IGNORE_UNUSED,
> +			.flags = CLK_IS_CRITICAL,
>  		},
>  	},
>  };
> @@ -3628,6 +3632,24 @@ static const struct qcom_reset_map gcc_ipq5332_resets[] = {
>  	[GCC_UNIPHY1_XPCS_ARES] = { 0x16060 },
>  };
>  
> +#define IPQ_APPS_ID			5332	/* some unique value */
> +
> +static struct qcom_icc_hws_data icc_ipq5332_hws[] = {
> +	{ MASTER_SNOC_PCIE3_1_M, SLAVE_SNOC_PCIE3_1_M, GCC_SNOC_PCIE3_1LANE_M_CLK },
> +	{ MASTER_ANOC_PCIE3_1_S, SLAVE_ANOC_PCIE3_1_S, GCC_SNOC_PCIE3_1LANE_S_CLK },
> +	{ MASTER_SNOC_PCIE3_2_M, SLAVE_SNOC_PCIE3_2_M, GCC_SNOC_PCIE3_2LANE_M_CLK },
> +	{ MASTER_ANOC_PCIE3_2_S, SLAVE_ANOC_PCIE3_2_S, GCC_SNOC_PCIE3_2LANE_S_CLK },
> +	{ MASTER_SNOC_USB, SLAVE_SNOC_USB, GCC_SNOC_USB_CLK },
> +	{ MASTER_NSSNOC_NSSCC, SLAVE_NSSNOC_NSSCC, GCC_NSSNOC_NSSCC_CLK },
> +	{ MASTER_NSSNOC_SNOC_0, SLAVE_NSSNOC_SNOC_0, GCC_NSSNOC_SNOC_CLK },
> +	{ MASTER_NSSNOC_SNOC_1, SLAVE_NSSNOC_SNOC_1, GCC_NSSNOC_SNOC_1_CLK },
> +	{ MASTER_NSSNOC_ATB, SLAVE_NSSNOC_ATB, GCC_NSSNOC_ATB_CLK },
> +	{ MASTER_NSSNOC_PCNOC_1, SLAVE_NSSNOC_PCNOC_1, GCC_NSSNOC_PCNOC_1_CLK },
> +	{ MASTER_NSSNOC_QOSGEN_REF, SLAVE_NSSNOC_QOSGEN_REF, GCC_NSSNOC_QOSGEN_REF_CLK },
> +	{ MASTER_NSSNOC_TIMEOUT_REF, SLAVE_NSSNOC_TIMEOUT_REF, GCC_NSSNOC_TIMEOUT_REF_CLK },
> +	{ MASTER_NSSNOC_XO_DCD, SLAVE_NSSNOC_XO_DCD, GCC_NSSNOC_XO_DCD_CLK },
> +};
> +
>  static const struct regmap_config gcc_ipq5332_regmap_config = {
>  	.reg_bits = 32,
>  	.reg_stride = 4,
> @@ -3656,6 +3678,9 @@ static const struct qcom_cc_desc gcc_ipq5332_desc = {
>  	.num_resets = ARRAY_SIZE(gcc_ipq5332_resets),
>  	.clk_hws = gcc_ipq5332_hws,
>  	.num_clk_hws = ARRAY_SIZE(gcc_ipq5332_hws),
> +	.icc_hws = icc_ipq5332_hws,
> +	.num_icc_hws = ARRAY_SIZE(icc_ipq5332_hws),
> +	.icc_first_node_id = IPQ_APPS_ID,
>  };
>  
>  static int gcc_ipq5332_probe(struct platform_device *pdev)
> @@ -3674,6 +3699,7 @@ static struct platform_driver gcc_ipq5332_driver = {
>  	.driver = {
>  		.name = "gcc-ipq5332",
>  		.of_match_table = gcc_ipq5332_match_table,
> +		.sync_state = icc_sync_state,
>  	},
>  };
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

