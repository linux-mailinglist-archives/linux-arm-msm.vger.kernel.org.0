Return-Path: <linux-arm-msm+bounces-41174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 675CE9EA26C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 00:10:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 682A5284C09
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 23:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A1719E998;
	Mon,  9 Dec 2024 23:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lGkwIacz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FCB142903
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 23:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733785797; cv=none; b=T1Okxjn3NdgiasnQEzFSDM3iQbcpWIJNLXLp9UozSsFjkCS8Pbu7vycIAArWFV9MGisSrwS9jJLx77FbvA4KpteGgTPd1rbCjhrZtWbEsDyWP8KDXML8tCZitMoPBApt08UzX3tnZlL16NXnSUzPhrFBPgENJfLiNENIjxRgypI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733785797; c=relaxed/simple;
	bh=6QzJKZSZKvdk2fxe0xlWA1iGdoNfka/Ybb3HRVD9fBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RpAYHOVQC7S4judpBf9muU6AaoMopLc2841zcm/dUrvlhldcDp3ZZ8Jo3ZQuGLG5klJZJLL1G5zWyLQJ55T8lT/oEph6J70ws/oAo6aaEyiVWUPH6X9NucdZ48VrCT2m53TlHRMWjNOk6zvFOpZghKf4zp6yAnC6ufufAN59Sqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lGkwIacz; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5401ab97206so1711251e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 15:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733785794; x=1734390594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X5GxAyEJ02mNywENRB0ow462CYy8FP4+RIO5DD9Q3DQ=;
        b=lGkwIaczCisoMQA6TAGVbDf4lomP4Fm1/gDzKtYcBXVvkcDAHNSxoOwD5JvCEHiaSL
         ZS00BVSZlryWKeyy9T6x4B3mvf6SYPo3VkRmNBFY9aMdwRkLzSyOLlWLatOSNCB7FRhY
         abBKIFY2R482ZsqoowK/Q5E4cs6cYunKPYeltLCcfT211OUCoAEHnZYtaQg5/OqPL+8I
         6LmvjJ8WR3IIDtoTGvZ7P2mmlei+VxKr7r1nF2FV4BL8mzJsL2QlQtqRxSBEIMmMdL8K
         6AbtksZwntVhDyU20ahsfuvtAJeQl0pV1ulsFEk03JDszLRJQBES9DzXBumoSfhwB3My
         YZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733785794; x=1734390594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5GxAyEJ02mNywENRB0ow462CYy8FP4+RIO5DD9Q3DQ=;
        b=F8ERGMFHNIu6fVadOHNHncmkD0hY9d3voUwFm3myyNlqn3nOVes+fXF0bV4MnPPyYM
         k+lUtL5Yzh7F78j/NtOP167+8Aik9Uv9OA3UMMJoRwv9lGXSjoFeGqvG9zeiwd0GVBPK
         p8A63GfLqTSBojI1DpSz1QuqTgv1Mg6/mqNxYtCbMS1o9Np+u17basVaak9CJeHPZcAC
         I9GRDJkZ5P77SBstjrMmzg1fpUajUPz0sQqX9htkXVZyullKdLT1TVsmSjRqvHZbhSPB
         UguwkA/d2nGeTESnyHDyb+OliUA8q3fW9FOmDSeGKXOpqeQ5qRK1iPkdwsfBowdSAPAT
         7G7w==
X-Forwarded-Encrypted: i=1; AJvYcCVn0vLf70Y0qBt+JeEq0O1NCGAtoaKOd8bPCti7vG+99TnvfhdWjAKiIj1Sy1eONe7YEFe5wgkvVx6Xm6FX@vger.kernel.org
X-Gm-Message-State: AOJu0YxjZCpEaZa4Igad9GcxICtp3yZSrP4mNTfaUPSxdzjZwZJb4m/Y
	VdHgOAUdiasYT1Gkvwr+J5iZm2uyKLqZQRDZLm6Q23mv+2EeUUrTmiIkahw4yq0/SrrU45S18mg
	9boJ6BA==
X-Gm-Gg: ASbGncsY2KT+DJPPr5Ql3u8GwuCQ2IxijKKl178ASxxPs4uecEkOzO0I9K+mmsOnBwG
	4MU+9H2mGBRr2z+syzXfd1vxJwOB54t9hfL0tLHYP8kdnsiousnO0GkwrxZn89vIh9wvaYM7XCK
	5PcKCZb6SLHwSAYJOknE5K/p0PF9wG8cuYwy4P/YYwtMa/IaBntBaNtfHD2HmX88+tKJdbPsmC3
	/y+TNMNc1+vlzf+7ziz63O86l5WykDfxwz1AGKKin7QtSQLy1L0Qf51dfNZAr2xbKZkwTATAUDq
	M4I27wzzHDvugchZ9Js5cGH39uS4LAMtKQ==
X-Google-Smtp-Source: AGHT+IEWUgkaAToyp2VN/parQthrjJOBjUFhHTXot4xiCZm20ehVs3l2DKi/nv5nOESXxYx9J35VJQ==
X-Received: by 2002:a05:6512:3990:b0:53d:a321:db74 with SMTP id 2adb3069b0e04-5402411a69cmr871586e87.50.1733785793813;
        Mon, 09 Dec 2024 15:09:53 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e39fb61d3sm967973e87.22.2024.12.09.15.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 15:09:52 -0800 (PST)
Date: Tue, 10 Dec 2024 01:09:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Julius Werner <jwerner@chromium.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	Roxana Bradescu <roxabee@google.com>, bjorn.andersson@oss.qualcomm.com, 
	linux-arm-kernel@lists.infradead.org, Trilok Soni <quic_tsoni@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] arm64: errata: Add QCOM_KRYO_6XX_GOLD/PRIME to the
 spectre_bhb_k32_list
Message-ID: <tx7vtur7yea6ruefrkpkccqptahgmxnsrudwdz5uzcfxnng25b@afrr5bmdk2xa>
References: <20241209174430.2904353-1-dianders@chromium.org>
 <20241209094310.6.I722621804be859e4ae4b7479ce191c5e3367b37c@changeid>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209094310.6.I722621804be859e4ae4b7479ce191c5e3367b37c@changeid>

On Mon, Dec 09, 2024 at 09:43:16AM -0800, Douglas Anderson wrote:
> Qualcomm Kryo 600-series Gold cores appear to have a derivative of an
> ARM Cortex A78 / ARM Cortex X1 in them. Since these need Spectre
> mitigation then the Kyro 600-series Gold/Prime cores also should need
> Spectre mitigation.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> Yes. I know. This patch DOESN'T COMPILE because
> MIDR_QCOM_KRYO_6XX_GOLD and MIDR_QCOM_KRYO_6XX_PRIME are not
> defined. Those value needs to come from Qualcomm or from testing on
> hardware, which I don't have. Qualcomm needs to chime in to confirm
> that this Spectre mitigation is correct anyway, though. I'm including
> this patch so it's obvious that I think these cores also need the
> mitigation.

SM8350 (Kryo 680) identifies itself as 0x41/0xd44 (Prime), 0x41/0xd41
(Gold) and 0x41/0xd05 (Silver)

> 
>  arch/arm64/kernel/proton-pack.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
> index 212481726f04..67aa54017dea 100644
> --- a/arch/arm64/kernel/proton-pack.c
> +++ b/arch/arm64/kernel/proton-pack.c
> @@ -860,6 +860,8 @@ u8 spectre_bhb_loop_affected(int scope)
>  			MIDR_ALL_VERSIONS(MIDR_CORTEX_X2),
>  			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N2),
>  			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V1),
> +			MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_6XX_GOLD),
> +			MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_6XX_PRIME),
>  			{},
>  		};
>  		static const struct midr_range spectre_bhb_k24_list[] = {
> -- 
> 2.47.0.338.g60cca15819-goog
> 

-- 
With best wishes
Dmitry

