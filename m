Return-Path: <linux-arm-msm+bounces-19337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D42ED8BE4C6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 15:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12C1D28C403
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 13:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95CA915EFA6;
	Tue,  7 May 2024 13:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r0m/XD4n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E363915ECF5
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 May 2024 13:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715089871; cv=none; b=td67L/2rLjefhMeYmYShjjTfZOhxJD9U1t8y3bsdA2aYh1wP9xOdvAJHG6DPAA+roHH/nvlSq0Epb1qqx9TFIAnvyDiI9tv0TcDBtX7P/v6cEYQkDl09nWbs4XPZXeLg1IUVhftelBe/0vDlNZR2Cjmdu7PWF3j2GIhRPVLRXzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715089871; c=relaxed/simple;
	bh=CYOMBbl8ouu83jPSzPzk5sBy7BZZRj9DTxYtalItm/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CFPj/E+lI+xBfoDD6BAWqBBWddNVVa02YKSpKm8qalNZge3OX+qbr3ATrjjMsjkq2Ezmz8wdOEhhTLihCwAnSD2OERUkMAxwmF10wmS8x+LBnFhnDn25MT/55E0JuyIJ75f+Xf9xVot7/Sqhvm/Klgwr8Qausz8w9jwuNGZLftk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r0m/XD4n; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e1fa2ff499so45615661fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2024 06:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715089868; x=1715694668; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LYgXmNSeZ5uAXbZ42Wd8TdT7DuRGzZ+iejAjgC1sq8M=;
        b=r0m/XD4nEyxoZxQPUI1mmK+HQkh2v5jkVYTj2t0nfvge7Rkp4Dfg7yiAzV9xdshnH6
         YAT+K3ulB++nUXZLAdE9pQtDgdd89+fobjtenSLa0RGtXwwqfZ/9VRO/foFxQS/Uot6D
         WmhApjK/Y5Do/CoRB+4APnlc9KuHT6tk0FRFmwoHZbPifHoXdAvTYX7mS5apG06+DZUE
         7tL7beyzWa+sRiNEAmie5xJ47VJ1X65lXN6fRlkjwO5QhahJL1rUvn9LouBFZRZgmUD+
         phmoe5rUG/d+ZxhsB2hRZON+YPZXCFyVIGCZ8xRlyjuVutSGiFakRnkd5Ta42CP/dDvF
         QbBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715089868; x=1715694668;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LYgXmNSeZ5uAXbZ42Wd8TdT7DuRGzZ+iejAjgC1sq8M=;
        b=lOhzotWZxm95kIM8CnWr2707BDp1v18gzpPqdCQ8/pPRy6qpUXL6AUsNrNm3cH6EWc
         XBeo6bnyIjPQcx6Ddgb33HU0HSOga1yojMAs5Wdi1BY8MmiRN+BI4zbw68K4G9s20aEj
         zlHa+V2rTrMSVxzC03UceY51NCiRsNC7FWrj2d+fmha+CwvNPuRNynZY4v58y4ZH2XLW
         7IKRqpgRC4jI1y8TillbScnTtE86fN9nELD+UfOwuBCsw2A3Zax63iTqfcYO4hkKWCnr
         ayc6XvKF+RZ7P4ZfGonuFkF2xxMu/Xv3311EkILvuPZ7236uuzIzaKnHIxw5lVLmHRQe
         kfCA==
X-Forwarded-Encrypted: i=1; AJvYcCU9YpTleKLpnYi4bhxJGWX6h1krfA24wwChkLqHHTdMxRghmlr/mX0Bfy2vZdZ8oezTMQN/LfC6XWz6Z3JFnPdef2NBed+0eaxaSTDywQ==
X-Gm-Message-State: AOJu0YxzWjYxiOorIO1b+alI6SVo18cnsmwpwQnu12B354/J25xeDT6Z
	ZApEEW9CtvJF2fw55h4RkO68uk/ZDx19Z8GAeTM7LL0KpUme686GQBlXq4LfA4w=
X-Google-Smtp-Source: AGHT+IE5G66ioLy5Gd2DnM6KVQtr/z1w+ypEcQkiY8UjkEBgG9dAKVeYIY4NAzVBcYXBb0Fh6caMbQ==
X-Received: by 2002:a2e:84d0:0:b0:2e2:6dd9:dd8a with SMTP id 38308e7fff4ca-2e3d811a8ebmr8385881fa.0.1715089868217;
        Tue, 07 May 2024 06:51:08 -0700 (PDT)
Received: from ?IPV6:2a00:f41:c0d:408:fa88:abdb:17c2:cf24? ([2a00:f41:c0d:408:fa88:abdb:17c2:cf24])
        by smtp.gmail.com with ESMTPSA id e3-20020a2e9e03000000b002d6daf3b41fsm1952160ljk.101.2024.05.07.06.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 06:51:07 -0700 (PDT)
Message-ID: <3a3c4279-a254-48d0-91ad-70b7f1e3eb77@linaro.org>
Date: Tue, 7 May 2024 15:51:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-sm8450: set OPS_PARENT_ENABLE on
 gcc_sdcc2_apps_clk_src
To: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Vinod Koul <vkoul@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240427-topic-8450sdc2-v1-1-631cbb59e0e5@linaro.org>
 <2337ba58adb3fb127710bead9b8665a9.sboyd@kernel.org>
 <11bd7146-30cd-4b71-b2ca-d76875763731@linaro.org>
 <6ba2967c6c9d24e3f1c9b76496176010.sboyd@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <6ba2967c6c9d24e3f1c9b76496176010.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/30/24 23:26, Stephen Boyd wrote:
> Quoting Konrad Dybcio (2024-04-30 03:46:52)
>> On 30.04.2024 2:21 AM, Stephen Boyd wrote:
>>> Quoting Konrad Dybcio (2024-04-27 05:01:07)
>>>> Similar to how it works on other SoCs, the top frequency of the SDHCI2
>>>> core clock is generated by a separate PLL (peculiar design choice) that
>>>> is not guaranteed to be enabled (why does the clock framework not handle
>>>> this by default?).
>>>>
>>>> Add the CLK_OPS_PARENT_ENABLE flag to make sure we're not muxing the
>>>> RCG input to a dormant source.
>>>
>>> The RCG2 hardware hasn't required the parent to be enabled for clk
>>> operations besides for the glitch-free source switch. What scenario is
>>> happening here that's requiring this flag? Is the RCG forcibly enabled
>>> perhaps because the bootloader has left the root enable bit set
>>> (CMD_ROOT_EN)? Or are we changing the parent while the clk framework
>>> thinks the clk is off when it is actually on?
>>>
>>> TL;DR: This is papering over a bigger bug.
>>
>> Definitely.
>>
>>
>> Take a look at:
>>
>> static const struct freq_tbl ftbl_gcc_sdcc2_apps_clk_src[] = {
>>          F(400000, P_BI_TCXO, 12, 1, 4),
>>          F(25000000, P_GCC_GPLL0_OUT_EVEN, 12, 0, 0),
>>          F(50000000, P_GCC_GPLL0_OUT_EVEN, 6, 0, 0),
>>          F(100000000, P_GCC_GPLL0_OUT_EVEN, 3, 0, 0),
>>          F(202000000, P_GCC_GPLL9_OUT_MAIN, 4, 0, 0),
>>          { }
>> };
>>
>> XO and GPLL0 are more or less always on, but GPLL9 is described to only
>> be used for this specific clock for this specific frequency (perhaps it
>> feeds something else on the soc but that's besides the point).
>>
>> Then, the parent input is changed during set_rate, but GPLL9 seems to
>> never be enabled:
> 
> Is the sdcc2 RCG enabled during the set_rate?

without PARENT_OPS_ENABLE:

[    3.326891] sdhci_msm 8804000.mmc: Got CD GPIO
[    3.336839] scsi host0: ufshcd
[    3.337105] gcc_sdcc2_apps_clk_src is DISABLED @ set_rate
[    3.346339] ------------[ cut here ]------------
[    3.351093] gcc_sdcc2_apps_clk_src: rcg didn't update its configuration.
[    3.351114] WARNING: CPU: 1 PID: 11 at drivers/clk/qcom/clk-rcg2.c:133 update_config+0xc8/0xd8

[...]

[    3.610523] gcc_sdcc2_apps_clk_src is ENABLED @ set_rate


with PARENT_OPS_ENABLE:

[    3.331419] sdhci_msm 8804000.mmc: Got CD GPIO
[    3.336569] gcc_sdcc2_apps_clk_src is DISABLED @ set_rate
[    3.344795] scsi host0: ufshcd
[    3.355122] qcrypto 1dfa000.crypto: Adding to iommu group 5
[    3.363567] remoteproc remoteproc0: 2400000.remoteproc is available
[    3.364729] gcc_sdcc2_apps_clk_src is ENABLED @ set_rate

after testing it both ways, I realized it wasn't supposed to make a
difference in this regard, but I suppose I can paste both results anyway..

Konrad

