Return-Path: <linux-arm-msm+bounces-28922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B94D395603D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 01:59:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78A56281AC8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 23:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0139155732;
	Sun, 18 Aug 2024 23:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DaSvGV+5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3400156227
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Aug 2024 23:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724025570; cv=none; b=LKIL7yR/U9hyCDupYMLC05xcREpBOSqgeF2NT9HQKubNRdrw3ykzCF9rcuE3SzgrR5LSAG/tLCPxw/LRqiY3pV7HfaDDojOlmmntTZ6nmPWYTV8Vw20qlmuV6tSm2cHqNxdsCNqfIbzBw0ViBJoffjXyZ0Gs7mglzjBZGQVxPYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724025570; c=relaxed/simple;
	bh=sT/oyCUnRgtfYKJKOX5462XXnI6zqyx/EMbY8RHPp1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D5Owt9h9NiRRHJ4q4XWcj3x39GSo90MCWOjIaOFp6FudNGGA+yaKEkBLaZXz8Y2y13EB6QV22LhcGT4J5I1hTYG9e6brFpg7vTP8nBemxGMQBfnGPMd0VIjnmNVjhYJfn8hr+LKdrgHzzH3O+I2CzDXQYOaePGcFzcaqslxrUpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DaSvGV+5; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52f015ea784so619689e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Aug 2024 16:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724025567; x=1724630367; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mPLEJui4qj3siq5852EmGCqYh8ZMXe+JH32SZh64r0o=;
        b=DaSvGV+59Qquts5jSrA/hipoQQlbzutt3BS5NSmi4flYelabXVfo074iwtn1tngagF
         /IWYX0/BQVhvMc6yzxe/z0jxSHf9jDzO6bquSInPM2veDKU8v3Et8pxuRuU/rVohDYxt
         397YY9CxCSdYNMSSF1CLLd226zvOAL8dwUY2Fw3465UCWZsJW+EMBNfCm2cP0RVqSM4+
         f1lT9WLG8MyL0xUbtwd6EEdTFyQ4wFsrDjsXSGmJLi7+bha13AnkBfhP1R8pZs4ojRlD
         KqTxcCk1gsWPNhfkZ3Bpl5jJQ/GnymGBm8ZNuhekX2nvgAEZhmn+QPPtaZreLMI+A4wV
         I9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724025567; x=1724630367;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mPLEJui4qj3siq5852EmGCqYh8ZMXe+JH32SZh64r0o=;
        b=ZEn+ycjmghRlaKSru8Ra6T3sD/ykHHJKOJuXK8uaRaIxSuqhupHgvJJI3ZK4hV7FB5
         C9MSQCLOM3GNBhLJmoGQiohCp1xjrgQmFJoC9rl72HXCw5kDSXXYEaP68hFIDVviZ8UB
         zTR7yq2tMO7A2tA5zV23R0J+PZGV1CO9zHPRHB7aoQgfwH1c39gDtecMt49P/w8QhhYt
         xQqxlZAxv2FxSo1Q3H5NVyxhqSMqH19yP0lP6rmxHos4CExZWDBtNChRbSZGJQfyMbft
         eaO0L07vi8+KEB8HP0jT3h+DbDzMR3Q8kaqu2PsH67XOpZ0TS7ov8hT6fHq4PUcsbu5k
         kqNQ==
X-Gm-Message-State: AOJu0Yw7TcS+njLDlQq+BA4xo3ExA/cM6F/ifOqJ9yHVSTuTVANHLqZj
	0owwdflT5QX9pkh4YBgb+ipOeh7G8fY6UwpsHZh1LbB5hRJVnuaoIe+vL/MK6uI=
X-Google-Smtp-Source: AGHT+IEF/bSFvm9nm+za9qay0GFZHl420IAWGzAtfnnPgV8iifqYEaCxGZWLsPfCFwJhXLeV97MNpw==
X-Received: by 2002:a05:6512:e9d:b0:52f:e5:3765 with SMTP id 2adb3069b0e04-5331c6d9503mr3378335e87.6.1724025566646;
        Sun, 18 Aug 2024 16:59:26 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5330d4202eesm1321910e87.234.2024.08.18.16.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Aug 2024 16:59:26 -0700 (PDT)
Message-ID: <d54d299e-6634-4b0a-987e-2a1807734a38@linaro.org>
Date: Mon, 19 Aug 2024 02:59:19 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/13] media: qcom: camss: csiphy-3ph: Use an offset
 variable to find common control regs
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-7-quic_depengs@quicinc.com>
Content-Language: en-US
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240812144131.369378-7-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/12/24 17:41, Depeng Shao wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> New versions of the CSIPHY locate the control registers at offset 0x1000
> not offset 0x800.
> 
> Provide a variable to base an offset from for the purposes of redirecting
> the base offset for the new PHY regs layout.
> 
> The existing setup bases from 0x800, the new from 0x1000 with some of the
> 'EXT' registers dropped but the lower-order lane config regs at offset 0x00
> and up the same as before.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> ---
>   .../qcom/camss/camss-csiphy-3ph-1-0.c         | 68 ++++++++++++-------
>   1 file changed, 44 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 93782ebfe0ea..1219a25ec55b 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -42,11 +42,11 @@
>   #define CSIPHY_3PH_LNn_CSI_LANE_CTRL15(n)	(0x03c + 0x100 * (n))
>   #define CSIPHY_3PH_LNn_CSI_LANE_CTRL15_SWI_SOT_SYMBOL	0xb8
>   
> -#define CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(n)	(0x800 + 0x4 * (n))
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(offset, n)	(offset + 0x4 * (n))

Macro value above shall be this one: ((offset) + 0x4 * (n))

>   #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE	BIT(7)
>   #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B	BIT(0)
>   #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID	BIT(1)
> -#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(n)	(0x8b0 + 0x4 * (n))
> +#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n)	((offset + 0xb0) + 0x4 * (n))

Macro value above shall be this one: ((offset) + 0xb0 + 0x4 * (n))

>   #define CSIPHY_DEFAULT_PARAMS		0
>   #define CSIPHY_LANE_ENABLE		1
> @@ -66,6 +66,7 @@ struct csiphy_lane_regs {
>   struct csiphy_device_regs {
>   	const struct csiphy_lane_regs *lane_regs;
>   	int lane_array_size;
> +	u32 offset;
>   };
>   

With two minor fixes above,

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

