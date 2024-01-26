Return-Path: <linux-arm-msm+bounces-8435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A1C83DA7D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 14:02:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 183382853AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 13:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D3451B958;
	Fri, 26 Jan 2024 13:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RXnoB0RI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24361B80C
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 13:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706274159; cv=none; b=aH2Phb/DHppa6TA8ldztCCM1KnY/b3x4blV0nIbeF9l9IHpCyXENl4SjARaRC8GnZsyYnjHXbFZJnZKSQpLOlF/E101Ga8gOsfgyAtqDDAIdAbbEpUtTAy1QslGMozG/mw2KE+TaWu5C5pn79s+52u6iMXKrYn6oXI1PWB+VjZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706274159; c=relaxed/simple;
	bh=mBXiWmO43x4IedI7eW45Poke+eFkqHYazw7gPasItoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MJAfT+VFWYs3A/e3Zh2Gcv6S4V8bQ3r4XDrnwiA40WLGTvuPqj0SFTIZLDtkjfQE8loHKNTF6i9xptaL8FLeXAeBpXs7YHfP1u9T4sspoL2KdaofIsq1gIJErsKnEl4tSltJLsucQfwZYUL/2iCeda5vNzT2EWUvelNvCTMVQe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RXnoB0RI; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-33924df7245so488015f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 05:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706274155; x=1706878955; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a3+07jRFtwaufVPIk/XTD0i2kvGZ4Tbho2wTMEbnG0c=;
        b=RXnoB0RIxwv/NQSIzOtszHrLgNebcQjJd5nF1JqvwwYVz0q2yhfZPY/L8RSal11skC
         0ZLnJHAP1vWwaqCKFDknubpEnWq6HawZenu5H0jfUMAnitZEbDSKHejVlGIMnwtlJo24
         qBwednnHhCsH4QOLccTxqHyzIJwDtfYbdKwlRaXgNx/AHt0mhGSm6d4RO7C3Odz4VQgY
         13EiuJgpOBB9HUrqhoPlKm8hF7gwHv6YzMe83QYeFsyb88Jwik4v1o2giVllb/nsyK3q
         54g3HtS5qPh+8gqqNHeJrI/0+ns8wzghbXPKWd0NzKJYod00DAWE8LWccLtSy3bhSSGJ
         Ak8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706274155; x=1706878955;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3+07jRFtwaufVPIk/XTD0i2kvGZ4Tbho2wTMEbnG0c=;
        b=Y8oh1IM+4uGaD/y3izPm5bcxVrXwTdG49P1BnKDRzqQP/GJIqvCWWV8Cc6DFOTHjZM
         Oe4/5OV3Z2vbLIEBltJ0v7+p+Io6rkCvjOCO5//zoqeKLFXSNMGF7J00Ddr6xpiExEWn
         N70nWYqww0Fe0v+ixFrlmOMKY9eklpuzB7n8G3q7784MMYg1itb2YLXfi4T7s5HcY1/D
         4EjsfTy5At+6fy5j7mrBaPM69flNUcQ4JHsd3HQYSAxMNfcxLYsl4QVfksQiJj4QdnmC
         lWHUX4jQv7y0I1Yqnzvhyr5HDWEAHbyeeLSuadWmYnVk0ZLGZZlWFEafQUwBKuN+yGdS
         TZuw==
X-Gm-Message-State: AOJu0YxqoS06OsIY9NyekCCfQJ1UVVfvBMvpHeJm//x09+aDgAhUs+Ze
	UMB5mWrOw3ihOCAO7e0hFFRBOdU0RkcxI5nuuvuefmsMgOGPs8frwo2YZi+8fI8DRQ1kYokcaUJ
	Rytc=
X-Google-Smtp-Source: AGHT+IFJEnTrtRkieL7052tDdsHf4QprHoC8IvOe6lXVFTMJ1+IvvGQj1R8OZsfDteVBTHZ4Kx1Eyw==
X-Received: by 2002:a5d:694e:0:b0:33a:dec4:1d88 with SMTP id r14-20020a5d694e000000b0033adec41d88mr10537wrw.75.1706274155128;
        Fri, 26 Jan 2024 05:02:35 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id j17-20020adfe511000000b00339214d70b5sm1231554wrm.85.2024.01.26.05.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 05:02:34 -0800 (PST)
Date: Fri, 26 Jan 2024 13:02:32 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Jiri Kosina <jikos@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc8280xp-x13s: Fix/enable
 touchscreen
Message-ID: <20240126130232.GA5506@aspen.lan>
References: <20240125-x13s-touchscreen-v1-0-ab8c882def9c@quicinc.com>
 <20240125-x13s-touchscreen-v1-2-ab8c882def9c@quicinc.com>
 <ZbNpdaSyFS9tYrkd@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZbNpdaSyFS9tYrkd@hovoldconsulting.com>

On Fri, Jan 26, 2024 at 09:12:37AM +0100, Johan Hovold wrote:
> On Thu, Jan 25, 2024 at 07:55:14PM -0800, Bjorn Andersson wrote:
> > The failing read-test in __i2c_hid_core_probe() determines that there's
> > nothing connected at the documented address of the touchscreen.
> >
> > Introduce the 5ms after-power and 200ms after-reset delays found in the
> > ACPI tables. Also wire up the reset-gpio, for good measure.
>
> As the supplies for the touchscreen are always on (and left on by the
> bootloader) it would seem that it is really the addition of the reset
> gpio which makes things work here. Unless the delay is needed for some
> other reason.
>
> (The power-on delay also looks a bit short compared to what is used for
> other devices.)
>
> Reset support was only recently added with commit 2be404486c05 ("HID:
> i2c-hid-of: Add reset GPIO support to i2c-hid-of") so we should not
> backport this one before first determining that.

This comment attracted my attention so I tried booting with each of the
three lines individually.


On Thu, Jan 25, 2024 at 07:55:14PM -0800, Bjorn Andersson wrote:
> +             reset-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;

This is not enough, on it's own, to get the touch screen running.

I guess that's not so much of a surprise since the rebind-the-driver
from userspace trick wouldn't have been touching this reset.


> +             post-power-on-delay-ms = <5>;

This line alone is enough (in v6.7.1).


> +             post-reset-deassert-delay-ms = <200>;

This line alone is also enough!

In short it looks like the delays make the difference and, even a short
delay, can fix the problem.

Of course, regardless of the line-by-line results I also ran with all
the changes so, FWIW:
Tested-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

