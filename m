Return-Path: <linux-arm-msm+bounces-33356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7CD992AFE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 14:02:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C7A81F236EE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 12:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C86E11D2223;
	Mon,  7 Oct 2024 12:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vdqt0e8C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B68B1D2229
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Oct 2024 12:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728302519; cv=none; b=cRatIMhUeggQbpdMbXgxkGTEdB9jJ1PaTA1O3jGT0A4uGMoRnKU4Rx4RukaBrFu7EPMrMhVVcSpVJUjR16kPXq5WWKO7X7+BBNd2T/nlRWgTrC4cxQNLutI1GriBrPRuGq1qP/XMedbtzgsM+ExBebWhg3nZx6Ti6s90EzKopYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728302519; c=relaxed/simple;
	bh=MRXjh4znMefa2MbK88DwZSA7WdV1YGJ8jbOLZmcyiX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EpzmawEuaeLg8+eDD9xkERrDoDb7aahnhMylyxSIR7CtsiNhR5X+qh5imJfVa+Lo7TO4Bh8vdRoLGXE+lIcC0op+t3PHlxcNVY+DRyQDQpTRykSz50b1HwS4+2K9IhLVjKPZGvy6JayNiQoGJflzCOvA2jK4flVZ7jmyK+Ja+jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vdqt0e8C; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2facf48157dso42396731fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Oct 2024 05:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728302516; x=1728907316; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NOc3ugs50/kKOdZO40RO31M4gcITw/UN+vzR220HNZY=;
        b=Vdqt0e8CfUAzQR7IJAZwT+5ANo8ftY//ZZVWtOrqon9orgv15LEzpx0ic4GE4LwwWr
         BDHgEqFuBao2RISEpk6ezShiLXR53FgAwQJ06pBiKN1eYkkVDaLyEfLOiA6ajNdoT2nz
         /inl1LnbPIpUStrBbmHpVxarySXbLnMKKAjqpCmrSlxINEzm09ngqBmwHFMyBgvPmOg3
         qo3Bmnx1FninQ9YXyLSR0OsVFLEKOtGz7nRYQ6xo9uQ9VhConpZ5Fio9XjWh5ALXPtRI
         klVN4KKWZDt44MufUQaOXlIyMSwJDRaD8dm8AlHJo5+RMhDxH5f0M2Owh1wB0DhzK4Qm
         C5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728302516; x=1728907316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NOc3ugs50/kKOdZO40RO31M4gcITw/UN+vzR220HNZY=;
        b=C5QpCj33k84HHOy4hIrUDRQRzBQn+uyIBpiW5Ao2b6eZwZt7hlWTyIfiDH2akcwPd1
         DF7sGpMX+qrOczsD0Rup5LZGY4IYS4S6E9QF1QfbxBjnDZwtLxXtV9mFiwJsiGhrDRMC
         8VUsum5vlatDjzvlEvsDvSM8JkiFivk76w2FqLhJXsG7/Uyms2E89wtZ5Ym3WscsVZWY
         MzmpKfYjX1SS/enrfkkf+sD9hFXFI+iw3qD/Oh6q6rwPpq949qsPp5Ey3fq/TCYOoVry
         pbkgxxvvtq5aqIwDYNnZPSikRoTk1f9vejFLRtB6nvRfM6nSj00G+/NieUICyUzWvcjK
         axWg==
X-Forwarded-Encrypted: i=1; AJvYcCVHod8zlZI1mJRUo1pwpF+u012o5BiKbmz1gOo26SFX8GfCMVT1FUz8y1VhXdRgBwLgg6lvx/jg4Qw1HEkC@vger.kernel.org
X-Gm-Message-State: AOJu0YzyySuJbkT+vxrxA7mgeLA87ywvjgDctsnPu8JxE27p4iAEw1/u
	GNI9NCPdvbjhraJxbTuZh84cA3cqben/Hr7Dc3if//NX4vsjR+lpUj4LJIqIet8=
X-Google-Smtp-Source: AGHT+IFxGIryyah1DNDRyioiONAzPDCUl8iymol8wfs4q6dDZT54Wc8Y/fFNcMfmUDRwrXa9z3kgjw==
X-Received: by 2002:a2e:b8ca:0:b0:2fa:d31a:1b6e with SMTP id 38308e7fff4ca-2faf3bfff78mr41814491fa.9.1728302514961;
        Mon, 07 Oct 2024 05:01:54 -0700 (PDT)
Received: from linaro.org ([82.77.84.93])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c8e05abf21sm3141322a12.40.2024.10.07.05.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 05:01:54 -0700 (PDT)
Date: Mon, 7 Oct 2024 15:01:53 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100: Switch PCIe 6a to 4 lanes
 mode
Message-ID: <ZwPNsTL+5f/6Gtte@linaro.org>
References: <20241004-x1e80100-dts-fixes-pcie6a-v2-1-3af9ff7a5a71@linaro.org>
 <ZwPDxd9JJbgDeJTi@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZwPDxd9JJbgDeJTi@hovoldconsulting.com>

On 24-10-07 13:19:33, Johan Hovold wrote:
> On Fri, Oct 04, 2024 at 12:06:33PM +0300, Abel Vesa wrote:
> > The PCIe 6a controller and PHY can be configured in 4-lanes mode or
> > 2-lanes mode. For 4-lanes mode, it fetches the lanes provided by PCIe 6b.
> 
> nit: I still think you should use "uses" over "fetches" here.

Urgh, I missed that one. Will fix.

> 
> > For 2-lanes mode, PCIe 6a uses 2 lanes and then PCIe 6b uses the other 2
> > lanes. Configure it in 4-lane mode and then each board can configure it
> > depending on the design. 
> 
> To avoid confusion you could avoid the word "configure" here. pcie6a is
> a four-lane controller (and PHY) that can also be used in used in
> two-lane mode, depending on how the system is configured and this can be
> read out through a TCSR register (e.g. the PHY driver adapts
> accordingly).

OK, will that.

> 
> So you should perhaps rather say that you are fixing the description and
> compatible of pcie6a, which *is* a 4-lane controller, that can also be
> used in 2-lane mode. Or similar.

Agreed. Will reword to say fixing the description as suggested.

Just to be sure. We still don't want this backported (even with such
rewording), so no fixes tag, right?

> 
> We also discussed this here:
> 
> 	https://lore.kernel.org/lkml/ZtG2dUVkdwBpBbix@hovoldconsulting.com/
> 
> > Both the QCP and CRD boards, currently upstream,
> > use PCIe 6a for NVMe in 4-lane mode. Mark the controller as 4-lane as
> > well.
> 
> > This is the last change needed in order to support NVMe with Gen4
> > 4-lanes on all existing X Elite boards.
> 
> I'd skip comments like this, or put them in the cover letter, or just
> rephrase as "This will enable 4-lane NVMe on...".

Will rephrase as suggested.

> 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> > Changes in v2:
> > - Re-worded the commit message according to Johan's suggestions
> > - Dropped the clocks changes.
> > - Dropped the fixes tag as this relies on the Gen4 4-lanes stability
> >   patchset which has been only merged in 6.12, so backporting this patch
> >   would break NVMe support for all platforms.
> > - Link to v1: https://lore.kernel.org/r/20240531-x1e80100-dts-fixes-pcie6a-v1-2-1573ebcae1e8@linaro.org
> 
> Patch itself looks good.
> 
> Johan

Thanks for reviewing.

Abel

