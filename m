Return-Path: <linux-arm-msm+bounces-46267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12739A1D793
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 14:56:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 624751660BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 13:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D661FFC40;
	Mon, 27 Jan 2025 13:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FQvupOZm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D111FFC47
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 13:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737986197; cv=none; b=olFFbHkKvZdRJAvPKycuSyj9GQjM9ck3Kb22+KsPcWR4op8q1ERTYAnE5Kj/36l240AQr8skyoDE1Ud4nkEHfimmNChYYxEsmbycRHfaQSAlwEGtNjneQFgjBrOX+rtPiLnT4YsUmqnYWxcQGWKldMaEy8tkkgxazdMqahy2wQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737986197; c=relaxed/simple;
	bh=IVx90ZZkaqdTBCEZvkxMvKj6KlfbrZxHyQ1UuRJdIJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gJfIzowL7xuZ3vD8heI+wQBCSzYTCvdWAJLZQYvd482Ihi9qVDREzDPHT4kzhU4qxEux5vKOgB7i5EPoQkeFbH7GgAXzXUmyqYYUNTVys5/LVFMw89BdTXNR0+ILzyY0YiDPZMFQiNAmXSeWZzFQcx2EhXkGBMWxgGt+rgmD1lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FQvupOZm; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54287a3ba3cso5158109e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 05:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737986194; x=1738590994; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b0jN9V1y7/L/MLutakuws/1hYWGughdKy3zYiBzIvC8=;
        b=FQvupOZmCEmUyp15kiAn/WPRzwBdY8DgFuKEKZ1nM41qPrXVLHyUHz36TwBpmj2kpe
         E83tKI1Ybn8WiFnYAFt2jz3PxdPnHyiKoZ2FtSFLgs6no5ONEVnhvfIhXDUx19FsvO8o
         jiUB2ouXZX+IouQCsz6fvWpnUma0TrxqbWU8Esjbb1oDHHJBDFI8jduhUfp2lV6Xy2Q2
         ePRFlZt0f3LdBdVaoQfrLSGy1e4WVE+/ot4J88lVvE2uDJyS3urvZbQB0jrasJTGEgI/
         injH6tx8Titu1/RWDZJXah76r150UGEQhNQgu8b4YJauDPSBjOms7aOJQQ5Kgv8gSkyJ
         QaKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737986194; x=1738590994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0jN9V1y7/L/MLutakuws/1hYWGughdKy3zYiBzIvC8=;
        b=SAmULcRKP5Ep1jo7tdqApkYZXgM+DamCe0NWqf7A4P+vAyNSvbkICGdhgXyjz1Yp2O
         jghtcvwopKTnDQzBC04DTBfWDqx0VIaurzEoRA5BBLS0kfRF5bfSPreKBNRsSChXqxGY
         2lGeE66J/lLLqnTmnMyumTAM3MY+Chcp9AYXkZLsd1n693ysMoaAU7twAIbYNUe2g29j
         rK7W4Sqyet08/pxs0ZPuB6/GlNRVpx0q/IRIzJsQHM55a0UPyi8mNQelRef3B9tDnXYj
         qdHRzOPSaFAE5qw7EznzilvzcKETcVRyfcN1Y1y8tgMhKcazlQoGrojcbMe3ZE5U1G1W
         RHJw==
X-Forwarded-Encrypted: i=1; AJvYcCXWB8lht5LnnSBCDdHzHkCoATUhHrYGkdKsQby5atdrVEOWeRhVSwrH/ZYz0DcJ+OXFlTECss4mDp5FPF1d@vger.kernel.org
X-Gm-Message-State: AOJu0YxqEJwtzJEG1GeRYlmlT/mNp0dfKnnX4wPChpJNt1lPR+tx9rhJ
	1GJwkxxyvumV9AquipnMeI/7/yYbGCE2VqOL+rQJ3LhiJPbc0yZfaxq0oAJ/ZPU=
X-Gm-Gg: ASbGncs0wEkCLadgmCR3U0xopCevWbydbBfy9fYG8sOCJuoj+xJKcmMjeQtr74+0UDa
	ieTR9pBR2OxFMHJ15Rdw5qLvSTeGE449fgcCkdpgTlixz+I9UZgaM3NVjaTEH3TTUtX58rtV0HB
	4ti/OVVMJ8zn4uZN0aNNn4+CMGWCzuw/70wD0BAf0TkB0sifxhkLsorwQCBCYN6tnouwMYbF64T
	LtZpqcYHzflLgYdtbvEiyBUFEL4Mlqsn/je3WzbNTvWFPmZdq7obF5UM1DU5rANjFuyaDrduoNA
	IzQUp/gwY5fBtpSfJEdLUEMdjUiBMLleKJSq7Bk++r2AeTlLb/zzyW1J/uyy
X-Google-Smtp-Source: AGHT+IHG9/yPxuIf8B66VeTSgcjJsNkURdMjzUehFN2uAgC4UTEwONtiZ+J8Xd6ZdMacU2Hf+AdBDg==
X-Received: by 2002:a05:6512:3a8e:b0:542:2160:26cf with SMTP id 2adb3069b0e04-543c7dab42cmr3865470e87.25.1737986193710;
        Mon, 27 Jan 2025 05:56:33 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c8367e2fsm1313995e87.157.2025.01.27.05.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 05:56:32 -0800 (PST)
Date: Mon, 27 Jan 2025 15:56:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/24] ARM / arm64: dts: qcom: Use the header with DSI
 phy clock IDs
Message-ID: <jtm4kapqdivdqafmj3jqipdujff7hzafbme3a2oa4irnz2sbwl@hf2hf7zcr3sn>
References: <20250127-dts-qcom-dsi-phy-clocks-v1-0-9d8ddbcb1c7f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127-dts-qcom-dsi-phy-clocks-v1-0-9d8ddbcb1c7f@linaro.org>

On Mon, Jan 27, 2025 at 02:47:33PM +0100, Krzysztof Kozlowski wrote:
> Use the header with DSI phy clock IDs to make code more readable.
> Changes done with sed with alignment/wrapping fixups. Verified with
> dtx_diff.
> 
> Depends on:
> https://lore.kernel.org/all/20250127132105.107138-1-krzysztof.kozlowski@linaro.org/
> 
> Please wait with merging till this hit mainline.
> 
> Best regards,
> Krzysztof
> 

For the series:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

