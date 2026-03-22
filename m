Return-Path: <linux-arm-msm+bounces-99069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKq4GyNswGmmHgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 23:24:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EB72EAFD7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 23:24:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0BB03300515A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 22:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B979A376BE5;
	Sun, 22 Mar 2026 22:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aaXQ7Ftn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4633314D0
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 22:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774218269; cv=none; b=HvQFXUgXipRHIJ8k4HBC4ojfsLRxG4eEQ7uhmmsYu7sMorrH6pImbQYJMxQgaOuMBKsiS8Yr52oO1EORQU9sp5bmAbiV5rEAs+ULIpLu61BDHaHeh9A0XtZbr233w6Efh/BhzUPFHXxGB1ys0/HmXNlYuq9/S140DSSV9lhyInU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774218269; c=relaxed/simple;
	bh=YMkX6r2NEeeGAVKAmeo/RTP8S5oRupKhDNo1SE7wpzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SRdB02g4EXaxvsbZrR3cHPIv5bhywROe/YRRE9PLoJtDZs3ROunE/RRXroIJ6I+SErWfHRA0OPHdkbqGqpgjnpelM3cNtIFAmQcqtKXxqkq/iBzDhHjPUQH6HTwU9S7EKOY7T92cDuX1BqM8TEpGh1piv9LPDR8o8PA8hD4x+kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aaXQ7Ftn; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2c0ecaae7dfso6138574eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 15:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774218267; x=1774823067; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wHlux91S1pcszks5LnQqDKbd7Lhdihe1iwVw4ZIiPgU=;
        b=aaXQ7Ftnbu7tCcuKXH+FgmtDYIuzIUZvoyrMg2S9hF68XsNFaBQQ1GMW6c0CsCPmCw
         5/+VPIQ1zYJLhJPghk/oQGNtyzZ3a2ez5G+S430E2EPwI8leNcpVXB6cDM0e7zKf3MOm
         40kV/gIaCNZ5Vm5NfejbsyBk++oMfCkr6Og4l9mMKjsHsegJO/ms7qpamno4WzKr9XM0
         6/KKCdb1dMTh1P1VuvJitv7JZQlQF7GH2DGGEj1CI5AhQGPBSemx1fLz4kxy0aHKqJSe
         F5EnHxlRcPkLZZyB5hDyzhObwU0mqV6ndQNnLmD4yDBIxG7AOJz+2cpiIS483wwACNPY
         SzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774218267; x=1774823067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wHlux91S1pcszks5LnQqDKbd7Lhdihe1iwVw4ZIiPgU=;
        b=ZfBZKXojdvH0+ZKGZFPZ5iSvn5yKv169JjxubG5stzhL3EwqFTzHlhDS8/lAl4Mo9o
         E4plbJ1rkijyz7RU6TXSvgK4qIe6gdI3Ui6oW3d/oDFfgeLmRrZBnegLem9FrY1gKvez
         79Y5SVixhcFawjHktJ70rWbYyjxaxkjfu7NMI3IDaWiKcNVPJXuMMJjjzvGBKGfxwz8f
         Mxmmo/9gRN3ZHM2atHs3Va5D3oc35bXOC35CYi1pnGevH5sjTBO5R4eHHgq9OAcEX5bS
         ItXzAoR91+7Verdb9EgkjeOa0ibdcjHrWtuqG+iY47DyGAnW0KSMEto+hwv3mkCPER0x
         eK/w==
X-Forwarded-Encrypted: i=1; AJvYcCXs+d78uQ6H11AlZvARPPVDbd2yayKyFmTqorQw1soCc9TlBVbnOAE/bQK/XTaEwBIav8zTLWRwo+Xs08RE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1C4jHWXpvLNqnKAY26/cXhKOVoJnJWE5HblNWrdoJyQw3bfPH
	2z4HoaTxT7NK7BBnkRP9md+dwb7Pr7JZwq6+WSh+mZiX4KB+0L8k5mHb
X-Gm-Gg: ATEYQzwaYR734tW1I6oiPMyDVwFfKpwW9nvHZeBn8uFYkvbCJnZ1PUUXRmm1RHoBBhE
	oOLhpwfGgraVtr//t3cSL3MJQdiZJ3aIHLoET/mffzLYhd5xwGPM+X/ATDb4/kucPmiCR3BAnkK
	di0ILk2ZeSGoRm9Oca3keOy5VWeYiMIeJPW5/KNPzTNriKPzfGIzyymSDM9uILSVkGyzzbss/+B
	8php4NBBpY8RHkKjMHP4JqP+owj1xVs1gq3TOBStYitPJvFlb+gwSrJMFtTVtLNJMZ6+Rn+LcCM
	QDNl2MQ11ZloLEzzaNqDyPdEtNizUOIzkjH0rSTQ8I3bSUre2E4XQMF/9LUJPy1Xr37sA10qOMn
	IRKCW3YJphGindX0g+5I3D4Q4bcJfSjVpMM9gksGBjRLwro5uREbYaOecMOK2avvxAhw0AE5kr9
	J8Hlr5dKTjrHBUVyIrSQEHXcJSZhWkNlHTWCeQaxmPRBHJm0rarXS/4p4Osx1o3YJVHtrJ4A5iN
	MA=
X-Received: by 2002:a05:7300:134a:b0:2c1:7ca:ceb1 with SMTP id 5a478bee46e88-2c109567522mr4864099eec.6.1774218266887;
        Sun, 22 Mar 2026 15:24:26 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:b768:22ed:3eba:aeb3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b1a88e5sm13452469eec.13.2026.03.22.15.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 15:24:26 -0700 (PDT)
Date: Sun, 22 Mar 2026 15:24:21 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>, 
	Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Mariel Tinaco <Mariel.Tinaco@analog.com>, 
	Kevin Tsai <ktsai@capellamicro.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Eugen Hristev <eugen.hristev@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Sebastian Reichel <sre@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Hans de Goede <hansg@kernel.org>, Support Opensource <support.opensource@diasemi.com>, 
	Paul Cercueil <paul@crapouillou.net>, Iskren Chernev <me@iskren.info>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Matheus Castello <matheus@castello.eng.br>, Saravanan Sekar <sravanhome@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Casey Connolly <casey.connolly@linaro.org>, 
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v2 2/2] iio: inkern: Use namespaced exports
Message-ID: <acBr-W2ILu9tnMyd@google.com>
References: <20251209-iio-inkern-use-namespaced-exports-v2-0-9799a33c4b7f@bootlin.com>
 <20251209-iio-inkern-use-namespaced-exports-v2-2-9799a33c4b7f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209-iio-inkern-use-namespaced-exports-v2-2-9799a33c4b7f@bootlin.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[samsung.com,roeck-us.net,axentia.se,kernel.org,baylibre.com,analog.com,metafoo.de,capellamicro.com,linaro.org,csie.org,diasemi.com,crapouillou.net,iskren.info,castello.eng.br,gmail.com,collabora.com,linux.alibaba.com,intel.com,arm.com,bp.renesas.com,perex.cz,suse.com,foss.st.com,bootlin.com,vger.kernel.org,lists.infradead.org,st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99069-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[64];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: D4EB72EAFD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Dec 09, 2025 at 09:25:56AM +0100, Romain Gantois wrote:
> Use namespaced exports for IIO consumer API functions.
> 
> This will make it easier to manage the IIO export surface. Consumer drivers
> will only be provided access to a specific set of functions, thereby
> restricting usage of internal IIO functions by other parts of the kernel.
> 
> This change cannot be split into several parts without breaking
> bisectability, thus all of the affected drivers are modified at once.
> 
> Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com> # for power-supply
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>

For input:

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry

