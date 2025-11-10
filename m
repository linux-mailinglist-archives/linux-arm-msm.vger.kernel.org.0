Return-Path: <linux-arm-msm+bounces-80982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 072E5C461F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 12:08:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 490321883E9C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 11:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3516307AF3;
	Mon, 10 Nov 2025 11:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AYl3H+E6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFD43074A6
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 11:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762772850; cv=none; b=DKLtljvTIS20rLTTWMIyhLDKMIaGX2WNRPlbZpw4mgSV9Uy71tI28JGl0WWjQxKz628ZP05OJ81Xh19/VfOJME/sIhVIU9xaZXlcLd9VvpQ2nT2+x94ZDXFJRI3N3zr24eQv/9rQT/tVpm7FFWl+u3o4A7g3ZD8kBZxZ6MgtpzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762772850; c=relaxed/simple;
	bh=P9gC+lGzjtMArrtoyqNulbP4U/Rr/r9sqlbgUdghZh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pNY132f8JBz/rmApLYBSPydGMz7jupM1/L4RHhKmh8qXmYy/1+nlTxw/UFaWsA5pSge3mxyEbF3jpCelxLYDk0wNMxY2JRSV+6lKq9mEXfEJllHsNFpaAB57AxYgm9VdclUYN246Sd+gli8+qU1SGloLPEE2+glsa1HsyUOehfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AYl3H+E6; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7ade456b6abso2379892b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 03:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762772848; x=1763377648; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l1rfVf8CR6nXwtwA2s4abFfmksXss6f4ONY3gj9LEKk=;
        b=AYl3H+E6yMrrrrIq0CYTN5ssxJXa2EHFHx+ESaNyCZaBPjsB5yBPVFN07QC3IfzdZv
         fc/RFcb0W0kPOxXNr6K5+PF1zTjSKLkWduJKAEoZbbzN8eyDl5LZenrQzhU1BXYrv2r3
         gu/00GVcSMvK5lyVdh1b9K/GsBNFyLrpGLMl8KjaiaJr0Odninhk5h0U9CfHW4Srn6MJ
         luLr6bJBgYPzMCCmO3TNhzq2QD3H6OpURz2oWLGwIKRSeLl6dUKBG/nxfrQz3w1eIma0
         zRxeyvfdSqu1Ab1dPi3Dqln5EiAW4BEOPZvjJd566QxOQSDsUC4XmTTqsZJoO2EFGnJb
         IgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762772848; x=1763377648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l1rfVf8CR6nXwtwA2s4abFfmksXss6f4ONY3gj9LEKk=;
        b=OTRIC3e9fY5A1bT4l4Qh5hRuZLlXPuIyKBZTKGWJrALCDSRs94/JEFl3UI5xRXX5gQ
         ONUboK4mzn0wezWqw05Pb0oYDjMmna745B9bZ9Ux8bu4CsWrxp0AVpP55GNiUAnYpiDD
         0jl6a9ZQ/30/6Mwvfsl3bcgBz11v5CNKxTtAl35366luDLrQLwL2t6seMlSo+by2QS46
         OSGMeHWoTGU285l6QwRHlVwuN5do7FFY0T6XgnR/2/6rmeAWgvChgv6vMT3vm6tp6LIF
         LvOFaZAe5G3ihzsMjYmma8kyTcoksNHTQ3AuMbBntvVAdPHcCchz+mHi5tLrfVqKLv0v
         a9lg==
X-Forwarded-Encrypted: i=1; AJvYcCXwL8E752uKJDqGzmnVmr4f9CYYwaZcpgHcaRbRaF8rFGuoVkeSX03ViOJqyJIQb6DMCeaBQVzUk+15YX5X@vger.kernel.org
X-Gm-Message-State: AOJu0YznEZO2JKZj535Oo+tETBVqL8u+C04V8sVcTrYIqi6bmR/WiPRp
	3ReqnmWXdG/pCw5hfvkB3/vpQZ8nHzsaPOzW0/X5k2i/ME5Rf+HbWSI7OCA3kTps4Mg=
X-Gm-Gg: ASbGncvueGvjByyI4Iq+NlK6XNsWAJV4Gs6JcIhpGrQYazryyvtDUdLe4m9aubKXYkI
	ScWY4QZPBsceej6bh0phU9wCoAus8DsqL9M8rzbFtIyMpV4DAPIoShVPriOz7G0NDWBOTrUPhtR
	RUuF3zMFz/mKp8JvKbpQU9EhH3EjIihP0F9SkAOVnqfbynqqGsGlrhAoshPgTqXmR8G7CD1t4Xe
	vwLsv5G2m9mvQ74QAJdVh5PPFCdu2T8Qu1dNytGYO1thPKm/y0km/+UQOg5VSVTMwT9oUP6a62/
	aOaf/wJ6oALTtAdAKF8Kxn5luuwCSdAGXsEdM6A+zsWUZmN84VX+PmVOMJnnytW81VeejHEVvjT
	1Q8o5y4toKCPe/XgFRTTcINziEbF4wIViuN32AGLcJzl9miMcec97fp+q5O1ZTNbjZEtXYIYO9g
	sw
X-Google-Smtp-Source: AGHT+IFLmvoREqyCOsxdVYWioPfB8QTyekqamyvK/6SevugbTh8+Sr7Hzt8HMarNXUtUBmALUpoibA==
X-Received: by 2002:a17:903:46c5:b0:295:fbc7:d282 with SMTP id d9443c01a7336-297e566886emr96785235ad.27.1762772847847;
        Mon, 10 Nov 2025 03:07:27 -0800 (PST)
Received: from localhost ([122.172.86.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c8ef47sm143941675ad.74.2025.11.10.03.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 03:07:27 -0800 (PST)
Date: Mon, 10 Nov 2025 16:37:25 +0530
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
Subject: Re: [PATCH 03/13] cpufreq: mediatek: Simplify with
 of_machine_get_match_data()
Message-ID: <elghyjazfcsbwh4tmyfgfrbstfgpijgmlfu5kytbg7yvjtx2rf@v3riwtqr4itv>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-3-d780ea1780c2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-3-d780ea1780c2@linaro.org>

On 06-11-25, 20:07, Krzysztof Kozlowski wrote:
> Replace open-coded getting root OF node, matching against it and getting
> the match data with new of_machine_get_match_data() helper.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

