Return-Path: <linux-arm-msm+bounces-15188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B3388C20F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 13:26:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D1BB30334A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 12:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6AAA73522;
	Tue, 26 Mar 2024 12:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ooe8ZA2N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA66271B27
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 12:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711455991; cv=none; b=DIcRUI6DAdtELVZwT67I9lR/jnzm3umzfNHdnSfhh1mwk/kFACoWc0K9DjfaDKWetoc9zRADPWul8SuYpUQfu/hDoHqFxhN/dXumoF1JgNQMaM67NCh5L22iGM/pDnytxYPD1bY3Do2MMsCDXOxnfTtKlVmezpeloZ+qBcFOHpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711455991; c=relaxed/simple;
	bh=bZCKLk7wdK9avk6HcAwUlXaRw+BiBNiN0TjaPZ/bldM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FTyo1/MBeU8WvtLml286R+xMdkc7BuYTkV1BBge+jjqx5wRNTzv6zoZueGuUAzMc1LXk1YxCVbjTpLa6RuKve2yta95R8wc46AKf+SYAblXt+tKSsvjSQLdaNaeJ8kQYXytyr9cRUxv63AsWXWMksqAuEno1+ekYGOb3D4vu4gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ooe8ZA2N; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-ddaad2aeab1so3607715276.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 05:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711455988; x=1712060788; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+XMJhPWRNDVQV14OGFoCFSqRpZIIrLj/0V6PQtElfQ=;
        b=Ooe8ZA2NCOG0QUXioHhwaQNgw5Oqw5koEOopYj7dO/kr2xX3y7kt40bvoUTs+2idOB
         kh/bFva3To2oIsozkejHaCHfztbEFH5L88D770xVLgepE2YzXGXcq80KWdilGH2QNbke
         AQCMEVqZqEZIxGc2jB2AODiYC443infAqfwvg2NMiVP4t7L9zGQdPXt7OGD9M0I3D5EZ
         zCw6nzjEcVUm8eHxglJkaXXP9JyK7QZo4ZWS0n6dKbt9BUdbZwG+DDLUCmnWH0+tKD8b
         dSrpUUoF9/MOd5dRaTuv/apZxf1Nbgiwe7kbwDtI/skzFQomblqFgARvn1wscYwkBJeI
         VmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711455988; x=1712060788;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+XMJhPWRNDVQV14OGFoCFSqRpZIIrLj/0V6PQtElfQ=;
        b=tl0bXyPlGCIYnFGQpF/pm7E45gDovpbZ7/WVCOo05BkkbautNK/n6aiiOX/mamCTzT
         NRqg2F93VC/nkh/KtTnIZAT8yvugP6GxCJ8c5Y5SXvKp2ptKO67ZBnnSwDZyLe7y9lcL
         3HDvGFwKEoRk/6BCLDMCTHRhHy6DlGBy63nCCQSoo+GIXeF8PBF76jAmvbOAu3Tjh8u0
         Dso8WolwPTLcwr3ce6Xz/fIz55XMbkhJ9NHF+QIh0qMe0uXjwAtvPdNIlv9B1FwZrv2s
         HmN3DedQ7fphxCX5rOpCCKMCqIZXaUhwoeEMpTHsHNBVm0g493xrJj7g199YVV+KwKV0
         wHqQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3vBGy13KJMrBTWbGaDpRQKM1Akva9mveLwOjBojD2zq5envbyBeN19O+s9swrI7wr8XET4JCaOWFarDuO/v3mZyu/qnJTXv4ZAR3tSw==
X-Gm-Message-State: AOJu0YzDu8L0Te51TQuNyA08484TcGxEs8ksmcTnWjM2S2pKrkS1qEtj
	xJEU3lY6xUkcSRVORlRw3j4o3AB7XGv3httP4P3AGLstHj7sOOSO8VixjJXf+qzCzwcJYAhYdsW
	lBB5qqQKfpcmgWVpxJjnuzx8Rmk2eRZa4zrAEpg==
X-Google-Smtp-Source: AGHT+IHNWHIwHz8wVqqUW34rwCThepYAFCPxsSkC6FsCCIof+mjyh1FGmUWZ57wJQ+rAEanCUJAnju32fVTj9Bpar9Y=
X-Received: by 2002:a25:6801:0:b0:dca:59a7:896b with SMTP id
 d1-20020a256801000000b00dca59a7896bmr6934322ybc.50.1711455987810; Tue, 26 Mar
 2024 05:26:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240326-alpha-pll-fix-stromer-set-rate-v2-1-48ae83af71c8@gmail.com>
In-Reply-To: <20240326-alpha-pll-fix-stromer-set-rate-v2-1-48ae83af71c8@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Mar 2024 14:26:16 +0200
Message-ID: <CAA8EJprE4+PJV6ZRsPoYdp+LHFriDBkTWt-Y5LaTAqjxQfauPw@mail.gmail.com>
Subject: Re: [PATCH v2] clk: qcom: clk-alpha-pll: fix rate setting for Stromer PLLs
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Varadarajan Narayanan <quic_varada@quicinc.com>, Sricharan R <quic_srichara@quicinc.com>, 
	Kathiravan T <quic_kathirav@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Mar 2024 at 14:16, Gabor Juhos <j4g8y7@gmail.com> wrote:
>
> The clk_alpha_pll_stromer_set_rate() function writes inproper
> values into the ALPHA_VAL{,_U} registers which results in wrong
> clock rates when the alpha value is used.
>
> The broken behaviour can be seen on IPQ5018 for example, when
> dynamic scaling sets the CPU frequency to 800000 KHz. In this
> case the CPU cores are running only at 792031 KHz:
>
>   # cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq
>   800000
>   # cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq
>   792031
>
> This happens because the function ignores the fact that the alpha
> value calculated by the alpha_pll_round_rate() function is only
> 32 bits wide which must be extended to 40 bits if it is used on
> a hardware which supports 40 bits wide values.
>
> Extend the clk_alpha_pll_stromer_set_rate() function to convert
> the alpha value to 40 bits before wrinting that into the registers
> in order to ensure that the hardware really uses the requested rate.
>
> After the change the CPU frequency is correct:
>
>   # cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq
>   800000
>   # cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq
>   800000
>
> Cc: stable@vger.kernel.org
> Fixes: e47a4f55f240 ("clk: qcom: clk-alpha-pll: Add support for Stromer PLLs")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
> Changes in v2:
>   - fix subject prefix
>   - rebase on v6.9-rc1
>   - Link to v1: https://lore.kernel.org/r/20240324-alpha-pll-fix-stromer-set-rate-v1-1-335b0b157219@gmail.com
>
> Depends on the following patch:
>   https://lore.kernel.org/r/20240315-apss-ipq-pll-ipq5018-hang-v2-1-6fe30ada2009@gmail.com
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

