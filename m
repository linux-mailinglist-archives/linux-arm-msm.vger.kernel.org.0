Return-Path: <linux-arm-msm+bounces-38891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A37229D66AF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 01:19:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 057D9B21E46
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 00:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11275B640;
	Sat, 23 Nov 2024 00:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Feo9+J+A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAAD4A08
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 Nov 2024 00:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732321144; cv=none; b=PFnfg74HCr65UPOF+lfCoh1ww3KUGA1/pshm28beuOBAuE+oV0gjAignNaflwlGs03OVWKoKSwaem3ut/N0sRAVkrOSvTjNZgwl8Wpp/hR/+e2hbQPTRxVvzY0j5JfYcDXmArFiVvfInOFwdpIwuHPruigFhz0Q7SQjNLwLhCEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732321144; c=relaxed/simple;
	bh=gp6cmepa61xAyiqmA0aFpcdQ8xEtl56sKeMzfRIXE1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZLAOt/Dy/4tRla6rCFF7V7s6MFud+yHn2Ma1jj5erhtSn58kO+SAQ9sV+3YrU35Numaw3nUuB5u6pJIQq1vzo/9yOAtYijYj/DpYhh4/U9extLe2ysi6utEvAPemN2Q9xO+Ih0s0fsJufIXZlOzEqhWUmPelIIKozMqygKUTjT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Feo9+J+A; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-431548bd1b4so23606355e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 16:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732321140; x=1732925940; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CBar/yUBJZ7evAtJzqvt9icFhcSkyuHEJP8iZfvqHus=;
        b=Feo9+J+AR+AU+ahicpwF2PWcXN8I0qV2NdFn1o9kB4MN4DsZY1aPTb3TU6hhTJWUBZ
         tIiioKDGA2up5wrH4dGGfBzaC3Mpi/pwx/OPeZDmfjnOm/Bz+6eIxnbXB4OtOEfpBwGN
         WKqIejjb8qHFpdGcfO5KGg11Kdwag8d53soZNfbkNbbwHNlcXEKfcNT4E6YUEXz7lXrT
         RPqrl3kfirqo8OUcIcx9NHXwJjAQ3Oyy/YIa+StCpxvUY+SNRMhhSGJmJamLoupidY0T
         1RlzrH0Rx4hVoyH8B+lJjf+GP7gycsG4Y2c/zhAhLpWtCcR9MQdJAbyZGjD8vzdcRV2v
         bK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732321140; x=1732925940;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CBar/yUBJZ7evAtJzqvt9icFhcSkyuHEJP8iZfvqHus=;
        b=EEwLpmWUFk2nu7XqU8G7NvAxBxyiV2pvx0dioLr/48qxFKcsOP3+FiLtSEuJYn7ggR
         eKSv7u7w9D3SxU+eDd5GYt69u7QUvAfCPAhxZ7Zl/wUmilU4QS8EH88G1A/J7PUfAJgy
         uEFVFcSxNxf4Asaz2JbslLH2kldjzemOkJHGaxM/uil5SIKr/DZi2M+aPwEKPCeqbXwI
         zJd2QCEBRJnx9w0RHVh1HDbWC5eTrhUcZrILgoCCjv0RdMB7k9CL0Ip82phVr/T791Zz
         lxIcgvSHu/qiZBTmEe/PtoNyI5cEvxbbd0oPzRgWR205rQItFqvI40gQ2JEi8NsvCF99
         KuRA==
X-Gm-Message-State: AOJu0Yztd9PmVeOaLvyZNPWos/leEAYaS67OZWAWCiR4b/cLGLXSNRH/
	QlFnEwkfijr6A/GiICUDlO8Dr8zhBMR37HoBntqvsSOZ/i9HyA/HUS9b9/Istk0=
X-Gm-Gg: ASbGnctaRi2esmfpyxcVrvs6DGlixVQGCLs0VOD/0RRJdLN/w7X+jt8EGXDwYnwDglm
	NVuSuSZY1ElJQHr04VwPV//VZUQTZWDyH8VhvNmEnUmNFwt4slleZR0+3nd0kE7X3tI7KHPwwcT
	Di+Oz9g3DFulTpy80ifaOSfxpYs7UPHWMk4akL3m/E6BoNzbu5vVRp1V2+mn1hq4YlCSfH0AdG3
	kSoNgzzWc2tYotlIoHKlpkxQrnGvOucPSfnyd2Meuy8BDvRKIFe29mga5Pjcvc=
X-Google-Smtp-Source: AGHT+IHlRoz6uk5MGmn7iew4+RptSPaqyvO51B4OHl+zcs4aSMhp1CyvOMHb1GlQZ23DFr2P1b8X8g==
X-Received: by 2002:a05:600c:3ac3:b0:431:6083:cd2a with SMTP id 5b1f17b1804b1-433ce42c78bmr45572455e9.15.1732321140029;
        Fri, 22 Nov 2024 16:19:00 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433cde10eabsm43567815e9.13.2024.11.22.16.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 16:18:59 -0800 (PST)
Message-ID: <f7c31279-8492-484c-94c4-893d98f53afb@linaro.org>
Date: Sat, 23 Nov 2024 00:18:58 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Use APIs in gdsc genpd to switch gdsc mode for venus
 v4 core
To: Renjiang Han <quic_renjiang@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Taniya Das <quic_tdas@quicinc.com>
References: <20241122-switch_gdsc_mode-v1-0-365f097ecbb0@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241122-switch_gdsc_mode-v1-0-365f097ecbb0@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/11/2024 10:31, Renjiang Han wrote:
> The Venus driver requires vcodec GDSC to be ON in SW mode for clock
> operations and move it back to HW mode to gain power benefits. Earlier,
> as there is no interface to switch the GDSC mode from GenPD framework,
> the GDSC is moved to HW control mode as part of GDSC enable callback and
> venus driver is writing to its POWER_CONTROL register to keep the GDSC ON
> from SW whereever required. But the POWER_CONTROL register addresses are
> not constant and can vary across the variants.
> 
> Also as per the HW recommendation, the GDSC mode switching needs to be
> controlled from respective GDSC register and this is a uniform approach
> across all the targets. Hence use dev_pm_genpd_set_hwmode() API which
> controls GDSC mode switching using its respective GDSC register.
> 
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
> Renjiang Han (1):
>        venus: pm_helpers: Use dev_pm_genpd_set_hwmode to switch GDSC mode on V4
> 
> Taniya Das (1):
>        clk: qcom: videocc: Use HW_CTRL_TRIGGER flag for video GDSC's
> 
>   drivers/clk/qcom/videocc-sc7180.c              |  2 +-
>   drivers/clk/qcom/videocc-sdm845.c              |  4 ++--
>   drivers/media/platform/qcom/venus/pm_helpers.c | 10 +++++-----
>   3 files changed, 8 insertions(+), 8 deletions(-)
> ---
> base-commit: 63b3ff03d91ae8f875fe8747c781a521f78cde17
> change-id: 20241122-switch_gdsc_mode-b658ea233c2a
> 
> Best regards,

What's your test strategy here ? What platforms have you tested this on ?

What help do you need ?

---
bod

