Return-Path: <linux-arm-msm+bounces-5021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D68E8154D5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Dec 2023 01:06:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE553283EDE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Dec 2023 00:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8DC8362;
	Sat, 16 Dec 2023 00:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bf01fqHk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DEE364
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Dec 2023 00:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a22f59c6ae6so160025466b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Dec 2023 16:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702685154; x=1703289954; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p+0qgXsOSRF6os3K6heh1DXYQRVdzBBp0d5i/r/g/Oo=;
        b=Bf01fqHkroBsxugOXZFf5bdTzP/gK5heM5b1HcW4oMahtQQqpsRTZIUKuQDBb9Z6ap
         KT3rKdFoBGAiqC6lO21as2UBOaMiUP++gsDmD3dxOZ90iDxA16/N2kcfXwMUlucllRRP
         fm67/9ABN2ih8QbV+m8QcTJ3t8HXmngsPI/799dkkx79L+3Ug2MTmeZs3yQcJenQHW6H
         dTH/MI9jyc3hfr79+x59niOlEG/ZzcwIbGvpjoc2bhBmJuyssFDoFPB5SdThYZtFCDpN
         W/D8v6M3vdZkA5hodfMnIpsuiVmemNJ5FRbtjMGvz8vzHoyOyaPsWbHiSvYXwUhC8+E6
         RFZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702685154; x=1703289954;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p+0qgXsOSRF6os3K6heh1DXYQRVdzBBp0d5i/r/g/Oo=;
        b=Lrh5DeelL4lhsFeGnTW/fOCFKJsauso6MjtcxhX8YClLOFDNp+9v9Kf49uHmzkeK+I
         BZkyLVZcLvT5FMtMlT9lnMzsPVu0s/OV3KboZvPaVs8JcDS3ZsLSEwYpJM7DnyjSqW1O
         4PoU+IE+FPkcikZSUY9Zjdykd9KIUiLyZMp48hQ1FhXDNwilwoDOLzMLMZBe0luwJVOc
         xScaZwvP7wmTk9kwQU8vwtZaFwdNLEnxkzIcdBaAaurBKQCy8aZ39mJdg9x2zBnMyUPV
         T2qBGGDM/Ew7Ao6Vghk4CsrsckBHWaNHLBVO41BRQSgjq6FabmjKE9lq12c0SCXP5Ck4
         ynTg==
X-Gm-Message-State: AOJu0YyR3124w5At2VwsXUicpcpQm0BxA1UtU2VCfXqzQ9/yh6lctzQo
	CCSYqXyH5x48kMmLL9ohZOmCWA==
X-Google-Smtp-Source: AGHT+IH5bkWfHMGPYHZf5zO4mhFeJ4xd1iS4+2x2RVFbvlwSrbiineaoLuwyUlHOd0qb74qs/TKKEQ==
X-Received: by 2002:a17:906:287:b0:a1f:9bc9:84e with SMTP id 7-20020a170906028700b00a1f9bc9084emr2855374ejf.187.1702685154583;
        Fri, 15 Dec 2023 16:05:54 -0800 (PST)
Received: from [192.168.199.59] (178235179137.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.137])
        by smtp.gmail.com with ESMTPSA id tp25-20020a170907c49900b00a1f7c502736sm10026831ejc.164.2023.12.15.16.05.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Dec 2023 16:05:54 -0800 (PST)
Message-ID: <4472fd8e-73a6-44b6-a1d0-c5ebc55d4211@linaro.org>
Date: Sat, 16 Dec 2023 01:05:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "soc: qcom: stats: Add DDR sleep stats"
Content-Language: en-US
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Doug Anderson <dianders@chromium.org>
References: <20231214-topic-undo_ddr_stats-v1-1-1fe32c258e56@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231214-topic-undo_ddr_stats-v1-1-1fe32c258e56@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.12.2023 13:25, Konrad Dybcio wrote:
> After recent reports ([1], [2]) of older platforms (particularly 8150 and
> 7180) breaking after DDR sleep stats introduction, revert the following:
> 
> Commit 73380e2573c3 ("soc: qcom: stats: fix 64-bit division")
> Commit e84e61bdb97c ("soc: qcom: stats: Add DDR sleep stats")
> 
> The feature itself is rather useful for debugging DRAM power management,
> however it looks like the shared RPMh stats data structures differ on
> previous SoCs.
> 
> Revert its addition for now to un-break booting on these earlier SoCs,
> while I try to come up with a better way to enable it conditionally.
> 
> [1] https://lore.kernel.org/linux-arm-msm/20231209215601.3543895-2-dmitry.baryshkov@linaro.org/
> [2] https://lore.kernel.org/linux-arm-msm/CAD=FV=XX4wLg1NNVL15RK4D4tLvuSzZyUv=k_tS4bSb3=7QJzQ@mail.gmail.com/
> 
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reported-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
Arnd, since Bjorn seems to be MIA, could you please pick this directly
so that it gets into the next RC? Un-breaking booting on some platforms
would be very welcome :D

Konrad

