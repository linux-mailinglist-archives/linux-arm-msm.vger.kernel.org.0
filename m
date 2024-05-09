Return-Path: <linux-arm-msm+bounces-19583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B48E18C0F29
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 14:07:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 400831F2157B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 12:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E4814AD2D;
	Thu,  9 May 2024 12:07:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A98D14A4EE
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 May 2024 12:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715256426; cv=none; b=T26C7TEPh+DcCrSTb9Ve2fH/aGWLlk4tGjp8V3oQCF8g9x+7XPSCR1Jvu/PmGpMLTDclQ/6E9ZS45NkhYDGEx5PVtfLvBaEKv5o0YC+MirOia9oo1keDV2nkOh1PcTz/a3gRUBSGM0A6gFAApJ+vMrbp4CJXVjHre/lf2JMWzlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715256426; c=relaxed/simple;
	bh=kpbzqpy6Rhe5iTf0LFJ+eXVAVyIAjSiwFfmOtEu0JAM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XC3gAHD2AGtCJB8HlNxDXJDjacMTMO+9wAo0Y3rSFVj3pLSlUgn9YsUZPHQOnPoTnt+LIydoeLgOyiSCax1cEVAOVv5fADu4zlWo70IS1Ip1C6PqloPhQWwdcltIWPS3rwyhfdsC0XCGp1RYVZP/QDSIqzztwHsLhEGrxkqSKws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-208.elisa-laajakaista.fi [88.113.25.208])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id a526c7aa-0dfc-11ef-b972-005056bdfda7;
	Thu, 09 May 2024 15:07:02 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 9 May 2024 15:07:02 +0300
To: Stephen Boyd <swboyd@chromium.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya <quic_c_skakit@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 12/13] regulator: add pm8008 pmic regulator driver
Message-ID: <Zjy8Zj_naFQ2Ri0M@surfacebook.localdomain>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-13-johan+linaro@kernel.org>
 <CAE-0n52KTZ8G2VuvrDgJ9kAE61YULXY4u6nPP3CYWpg1CBjbXA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n52KTZ8G2VuvrDgJ9kAE61YULXY4u6nPP3CYWpg1CBjbXA@mail.gmail.com>

Wed, May 08, 2024 at 10:37:50PM +0000, Stephen Boyd kirjoitti:
> Quoting Johan Hovold (2024-05-06 08:08:29)

...

> > +               BUILD_BUG_ON((ARRAY_SIZE(pldo_ranges) != 1) ||
> 
> This should be an && not || right?

> > +                               (ARRAY_SIZE(nldo_ranges) != 1));

In any case BUILD_BUG_ON() is not encouraged for such cases, it would be much
better to have a static_assert() near to one of those arrays.

-- 
With Best Regards,
Andy Shevchenko



