Return-Path: <linux-arm-msm+bounces-19276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA19D8BD504
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 May 2024 20:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74B8F283767
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 May 2024 18:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF0041591E8;
	Mon,  6 May 2024 18:58:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE7F158DCE
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 May 2024 18:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715021899; cv=none; b=Xuys1NfosUiCjEihEcwGM8+cthnnQKWELxJeTwkdFz0N4xQvGb9FYG7LkTkoCxIqDoI/fThnfSXrNSZZVDxFnGr7k637H0c51dRroXVnXJZloo3rz1ziIC121ehy/jLzXkLBJN/CQ1U2SC8mEyhceK9yGfo1JfujF3wUsEyopDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715021899; c=relaxed/simple;
	bh=J20Je3Zl2WUSUaB+UdJsru3txq1hJF2mfkkZNQTlaQk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GLWKcqvvDsm2ZcPPE7HWyTebmhL8lChWy/nRjU/hks60TrvTqdh1bwpq3O0w1dVDhEzNzWvW64G0/m8q1ipOzlnr1GLBRFmXf0FwzXAP3LK6ZKfhZeMoKRfMP35QuD4Bg/w7TU2249J2X2v1W6HB8kTMZMCb7/lOH5Ib93EvRMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-208.elisa-laajakaista.fi [88.113.25.208])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 6f9ad5fd-0bda-11ef-b972-005056bdfda7;
	Mon, 06 May 2024 21:57:07 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 6 May 2024 21:57:07 +0300
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya <quic_c_skakit@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 03/13] mfd: pm8008: deassert reset on probe
Message-ID: <ZjkoAzHnYTKk_6Yr@surfacebook.localdomain>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-4-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240506150830.23709-4-johan+linaro@kernel.org>

Mon, May 06, 2024 at 05:08:20PM +0200, Johan Hovold kirjoitti:
> Request and deassert any (optional) reset gpio during probe in case it
> has been left asserted by the boot firmware.
> 
> Note the reset line is not asserted to avoid reverting to the default
> I2C address in case the firmware has configured an alternate address.

...

> +	reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(reset))
> +		return PTR_ERR(reset);

Shouldn't you wait a bit to make chip settle down?

-- 
With Best Regards,
Andy Shevchenko



