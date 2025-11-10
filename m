Return-Path: <linux-arm-msm+bounces-80983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA94C461F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 12:08:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 190444E782B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 11:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80EDC307486;
	Mon, 10 Nov 2025 11:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZOP6MOQ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3F8307AC5
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 11:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762772879; cv=none; b=IVMSRlZUEPzq0gOPl6fUrTddXOvzOQ+9nyRHPbvTVcALoV+R0HsOAXd4Ad502GNzkmK6XAt0VVQLBAn8Q/5zArKvUAGkmLf6Kw2oa+NvpJrJfVPctl347Q7BdHRz/qz5tOzbfL7SIU3N+I5PhyMTfGyav2A4vjWYJmq3qgiaefY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762772879; c=relaxed/simple;
	bh=PV0nu9hpPV+PdL37EjWKyESOoKW7BglfhP4iUdE0IM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FFynPFthD4BDqnjmpp0z8k45uwYYz8sh9YS7dLm+LoD6jaF6ffmsKhyxDVEuvRgjgN7jg7EsYcaKSZTFrd52L8I+vCu8ABuoc7XQfsdqrhlAuunkdH25IKLYY2S6ePCo3TfCHRDPHG1IemVqOgwV1Rp6zIKgTHqMgsTjg43X/98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZOP6MOQ8; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7aca3e4f575so2296334b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 03:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762772877; x=1763377677; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1teV5v5SqS6pFrvXlRn/4yX/VJMz/VkOekGlZHXTNkk=;
        b=ZOP6MOQ8viMXp+whHMIuW+CMg2hu0pQXkgyYI8k3GLd+x8dAKuwj139adqiERa7q2z
         Kx1XSXD0qcGppkvALKE5yvXAy3yWZM+SWUEfT5pM2cvFMjpwgMgJogSVv5JhK/Utpm6N
         3RCqf9kscgsLLaSAkbf1oAoNGVtnVLkoOBn2PxhmoduepLzAFxwNsf+5Z4as3RJHqnQm
         5CcX/esJPeIG/EDFgix2FsucaBn6sdzTcvwlNlyjVuNJTYrSCdtaC8ARSE72pTFyILXi
         ojlsxRFMznyD2xp9VNm8+3mWde8tfTY+bR/UTg2M3N3y3qLxoeUjJQdgQLrndqUpCnZ1
         AS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762772877; x=1763377677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1teV5v5SqS6pFrvXlRn/4yX/VJMz/VkOekGlZHXTNkk=;
        b=oq5R1Nu6ezTCUfQds5ufps5RQF3uNT2fctCiaUsM3BBe7eOEyfCVO8YIuIbP7XklVq
         LVMMy76oFB4UlnKihpXFqIzH6YXPLpZdjGU/csExgjglvz52dtIjuxPPDRe5T5xumvhd
         w5YHTDG8QjSxxhIpfWpRNCR9L9vTkBiG9dRGEWK2702Z9c2tEgx9gCX/e2GXJi0/lS46
         LonHlNByV5rGlM+AWCMwUmtTH3ophLNiBIOh8Aq4r6WEzi7xw3gxMgj/BC1sYQ8LXqZb
         MxmSx68PvwuD2Wy6OUaOyEhZDnWLSa0Vbw9DfScwiLlmWTbM2lhgcs+m5U+SfvN31yVg
         TuvA==
X-Forwarded-Encrypted: i=1; AJvYcCXclTdDAjDkaB35XSA8y+MzLLzZUiq7O0EDDvfyO+4d2M8qPtU0QNnSVJ9Rkgtg+Z+mtAKRvZ4c69/DAjCu@vger.kernel.org
X-Gm-Message-State: AOJu0YySs87uR1lsadti8f+9XUJJTfst8nCN4xGor4tL00ARKHtV4okr
	xxCm4V+NkT5SLDROrZGLMzbWS7jsHuXKh+IlZyyCeM/4GRADsAbJKVWV/fuXYqAxSN0=
X-Gm-Gg: ASbGnctmPnkfPebSd/TawhvUpIQ9fE6GbU+d59KmSaH12F/0rfDonO73ia/Nf3FX+JS
	P7ts7rWvH2D3ooJBsiNBQYQ2LhEneXLJxC6r73vfHE6LTRyNJ5kj5iJ0BLGf7qhkoOW0SEMDPm6
	l6FUYaGymmbU/GBP8oCO4vOdWSkpnJjgfVfdaW803YzySuuvibiBYNtzUCgNP7rpSBpg1ASqG1G
	pzlBg+9pCdiIWuHXBsZqw377xXRnsrFd75IAxQDx1B0Biwf0LrmbkVEQi99x9K6U/OAlezp1qzL
	yQNVrbdNofTkcuvN5kS4cC+9+caz1Uc4qRq1nB85jMJh+G3zWQqirUo6PIpPzasWbkjYowvl+R+
	cGFnt3QSKm0KRmXwT6LePzBvf0IUylktEJ50tuX8MDnIX0KnM1+Z4SMa4J4lwFgjQ6qHWFaHCxy
	E/VvVliVlmfIY=
X-Google-Smtp-Source: AGHT+IEI5dvtjpf7UreD77ujcsma8Qc91uG0xXgrZUKvQ1Ri3S/fmPHsBQ3EzHdR5mFgTf1mYnto9Q==
X-Received: by 2002:a05:6a00:1990:b0:7aa:2d04:ccf6 with SMTP id d2e1a72fcca58-7b2232f8c80mr9070041b3a.0.1762772877004;
        Mon, 10 Nov 2025 03:07:57 -0800 (PST)
Received: from localhost ([122.172.86.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9c09cd6sm11397368b3a.23.2025.11.10.03.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 03:07:56 -0800 (PST)
Date: Mon, 10 Nov 2025 16:37:54 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 04/13] cpufreq: sun50i: Simplify with
 of_machine_device_match()
Message-ID: <awphoxojc3benzdam47mcx7pqty26ohrwpgv46kimg7nl53rqc@szq3aqjqsbrc>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-4-d780ea1780c2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-4-d780ea1780c2@linaro.org>

On 06-11-25, 20:07, Krzysztof Kozlowski wrote:
> Replace open-coded getting root OF node and matching against it with
> new of_machine_device_match() helper.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

