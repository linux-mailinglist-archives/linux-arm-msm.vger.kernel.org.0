Return-Path: <linux-arm-msm+bounces-80981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B06C461D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 12:07:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0D85C34784B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 11:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0167307486;
	Mon, 10 Nov 2025 11:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pITaHv7F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5A8307AD6
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 11:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762772837; cv=none; b=gb58EZgiELY+opiQh+N8U+vq4x1D5OC0Uq25ULTqpnhB1nmFgx70I/VWMHzhr4nXEpSq++FNFhqE6lG/BBmxfkjkIhMM1r35gvUmB8CUwJ/Tbe3s+QWTaIL8WHAshyshz+LQ/V6e0IqMa/H2/XfFRK7X25VrJWBTTCv50kiPCHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762772837; c=relaxed/simple;
	bh=y9Rc2TSg2Orx+cZa9j2QdmCSgqy1wVj5vvqljCG9AMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f2Uifnwfu8w0zpgR+0VNu1PrZjz0uEIU6h9X4MwtXNW9voo+qEdhOARQraARidV18R8DHlBqjfcelUnqcyjR+a+wHnHZP/KwLHNv4NwFL6GEkJDI++m7YyyCRwvEIZ/KATTR8gvKhJ5isW1HBou6pUgfq7h441kBQghIfaZqZcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pITaHv7F; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7a4c202a30aso2216310b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 03:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762772834; x=1763377634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TZrYqw2/O2UZmuuLXYkU5bIjhuFDnuqQ3/E5dCC+u7U=;
        b=pITaHv7FQd7Ixj+gmMcfdIpoCp452jsxe5wrcUQnPkmqLdRptFvnTrXkBLEmj1B3dY
         8T9yTfQcHwQlEDmQgVFb+uYgN8AiJAeC2iB59o3D9AY8ZwfpNMKDvxDxp2L+iYYepaGE
         7G+M4Fq0mSIte22N7kwZJot8nVqApdjdpAdrW+WeZ4TqOvNVJ978ZtDu6PIfo/s2Sbqp
         vOuOTn/MdTjzOK+VLNxHxn5KGFq2MprbrWECDW0RGd9RTHUTbAUm8rCmmaCJC9v3mKJK
         d8BJB9xKbSsLq5nXQEyu3sl6CEJpSZMvKsMe+ej0jRPga47fzdAS8+Vz7WyPiWkCzn2x
         CAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762772834; x=1763377634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZrYqw2/O2UZmuuLXYkU5bIjhuFDnuqQ3/E5dCC+u7U=;
        b=VKo0b9Zy0pMxFAn4ckldcIH4cCWTm1R7wGEvbtbhBjxBVSL+anX0S9xZuLBOgpajfo
         6ydIReFtxEtxCIB7iOzsWeORqahQrFWil8v7S+/4c4AaBq/7EB/pLGqGeuflRB9x6Cq2
         oGsS0n4W9BfQqjsdzTkBSZAGyWEB6zWxo8ZP5IMGQPlFsMyFGN17toA5HHOE62FziVFr
         MjmQ9Junou3fezuhIaRAAj6axL6vUG42ADOOUL6jzf4vWkDwAFYuaNBMKO3+vyxKiltK
         oWUTY+5D32pl8p/ZquwmWMeJUX21lyBe0sixBS/i2ipqbIZ3yjKNteNoBAFHYwZ+BuA5
         xH0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWD3vglq1xd/BJ770n1btS5Noz01Rttz1ikYXpg0uCgNKQ7SMa7NbrY2bomfKC7FhVrT7LcfOBHyUrnRkDk@vger.kernel.org
X-Gm-Message-State: AOJu0YzX9KWLI/J9N6gLvquOlagqG+aFuHG7y8BJsAG3iHSmfNssuJJy
	2Bh44gZJ7XFA3NRI/mraZmDllokcTMD/1ck3gjajPTWiKiw/dgQBJ/a9qbkSWSf+g8c=
X-Gm-Gg: ASbGncuWZ53suAlb+91HwdPe4OzNcq8zMVZEgAgh9M85VdrWEvgCiU0MpCfF0hgev4p
	rwpIVILsBQV5bWm5kRx8kVyf5oQQ3Lg1drXwkZgGNM5NqGDif1coT7Y6+IcgKq1666+Rqr9egFk
	7q7J8TOFjKieNMwMF+7Va0uvN8Pnn6iEqfG0V9qK5ZLBFNDzHma7GAiiHfEeHWvVgtGKuSyjxBf
	cyCrA3IftpnvrtY4lJpK69Iu0Fnlw7VZ6Wt1Pz4wt14Pzx4QEmeh39ad/ZZmTiPBSw+GKYZuBVX
	Wz8Ssb5v5FU0APLvce5n6Dx58Ov3FXjPZ9XmRt0Jbr/CltaR5osdiQNSMjHzRBUiluUT8GF/vuC
	+jEybuShVEOKU8syjhQ7b4u5MyRgInZFPpMLQL9+Ww2/d0Ygz7p4ND1KcTtHg1IwSEv9beDk0ve
	1kFbP0QtSa2F0=
X-Google-Smtp-Source: AGHT+IEEBmMVZO0k0MIdHGG3oOt1wzE07GZr0Rosgte3T2/mK8NYjyyq/dXAAAQzolcEZu8MEC+rkQ==
X-Received: by 2002:a05:6a20:12c1:b0:350:d523:80a4 with SMTP id adf61e73a8af0-353a314ff11mr11044525637.28.1762772834004;
        Mon, 10 Nov 2025 03:07:14 -0800 (PST)
Received: from localhost ([122.172.86.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c953cf79sm11625705b3a.3.2025.11.10.03.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 03:07:13 -0800 (PST)
Date: Mon, 10 Nov 2025 16:37:11 +0530
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
Subject: Re: [PATCH 02/13] cpufreq: dt-platdev: Simplify with
 of_machine_get_match_data()
Message-ID: <qg6xxh3vwbfnl3z6otlr2bue2paig7w3agbpbauuzmppiof3q5@e4xjlcfu43cw>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-2-d780ea1780c2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-2-d780ea1780c2@linaro.org>

On 06-11-25, 20:07, Krzysztof Kozlowski wrote:
> Replace open-coded getting root OF node, matching against it and getting
> the match data with two new helpers: of_machine_get_match_data() and
> of_machine_device_match().
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

