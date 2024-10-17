Return-Path: <linux-arm-msm+bounces-34731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 585389A20E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 13:28:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 857721C21C93
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 11:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E98E1DC1B2;
	Thu, 17 Oct 2024 11:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="i00EyNUW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A441DBB13
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 11:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729164497; cv=none; b=QEn5mSLAkW1ubag4DigacPyZGPDDjdOCXW+mDM3edQD6AircNqxwEIZb0axZdS6m3UZE1btsow0vF8Z4x0zXy0dSfttZUp7ztq55+YlYbegil/tNwTA8kv9QVykZQo9S9ZEFsHuP07HnwmWZ3nciETW1Tu+/JpvCjsrHCeADJaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729164497; c=relaxed/simple;
	bh=3bstaIXUv6a17OjBqcsZ3jRVz0msaMJniniMIJt1qD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MIh0/kACnbzfwx4QYELjnpnxagqK4R0eRvQwA6CKLpmwA8zzpwpgoloT0p7eTehrbvxOr11LLsirhfEM62IzGTgW3SY9BDRP6e3upCRaLlBQ6WjJ5tG/AlU7JUZ7I0TUEF9M0y91PJ/a/ttqMWWC7AX3hPvW7QsO6aTINBCc31U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=i00EyNUW; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539f8490856so998340e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 04:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729164493; x=1729769293; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3bstaIXUv6a17OjBqcsZ3jRVz0msaMJniniMIJt1qD4=;
        b=i00EyNUWdnWnSy3Cn7DQSjaIek1jGM7iopbhcfcFtzhaCI9vmVnFZdO3R+Pyni4gtl
         ijweL/TBkRXM/9S2mw/eDKkr8Q+rwAk5m+ct8fqt1qa4+pC55fPS0HTVZFcoBnG54o6q
         G5dCxqgeguBSBpcnY3iY8pyuhKwYgDOGXTioti+6dgQFa6E7zsPEHLD/SMRy6/lXCVyE
         8iAXUuNM7zsERgGjtXpgVotVMghZbYH+rhEaCdsH8kp9FlKsY29TPMBVyhC1iNvJEodm
         2QlUU9GnduO+Du2SFgIVKZdyPWnN74mIEZ1eRrLwrXNIO+5Wzm+bmmTyJK0QDOcCGAv2
         5SfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729164493; x=1729769293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3bstaIXUv6a17OjBqcsZ3jRVz0msaMJniniMIJt1qD4=;
        b=q8KHSAhP6ZmCPV2ZpczH8wOFP/RaWAvXx5G3+g7pckMVK5TdMlZ56oVxRr0DYjHbZ2
         FE2gPU7x9dynQ5srQvu3AQD3UULIIIepdBdfYg7D6606jJ8UPXu3uZMqsw9Nk0ulDcjU
         bT1MqhLDGYg3YIubsqTq7ryVd+UHVwFXmmxQEWRkRmeK+i2qM0e5muLMtMCxc+xTeosv
         xo1a4SXXzOKCJtXTUtiVjwiaOwsrFMMumC2ofSikUHpbtba5alaoFDVfnafC+Ew/ZZCR
         xDuwG+k3Ukft7rhsGBdgLGb1ErZoMQp8GvAaf3F0saa4o/e7qAmWp1jH37qKVQeowKwg
         mq5A==
X-Forwarded-Encrypted: i=1; AJvYcCU7eaScwEQYAGw3PH7z1ySZiHT5QpoUn7FK/S6N6HbriFNdtGxnUN/q60nIeg2ayptYJZsij4R8Fm0Kzdmb@vger.kernel.org
X-Gm-Message-State: AOJu0YzK2qIUPHnAo/MN30nUomnlf7xBJvT7HRfVyot8XLFj2/L6s5jL
	VdVDKuJueqcpj7dDdNO8Xr6EVFjlwmM+WhrQsFqWXiQJOIAPbdg/qZdcAUV2fuNkEVCNinsC7o7
	PoHXlzLBJDTa2Kd+wcTBJVl0clkxWOr5H5qW69Q==
X-Google-Smtp-Source: AGHT+IEwdVt6AMUy0dZa8ffDdOfPCN3cB4NRXbqVMD8pKlMzGOo59AxscXSgX2IQKf/+4MH5yGnHCgjzqBA+AeV1wOc=
X-Received: by 2002:a05:6512:3995:b0:539:f26f:d285 with SMTP id
 2adb3069b0e04-539f26fd52amr8730107e87.3.1729164492613; Thu, 17 Oct 2024
 04:28:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241007-x1e80100-pwrseq-qcp-v1-0-f7166510ab17@linaro.org>
 <20241007-x1e80100-pwrseq-qcp-v1-3-f7166510ab17@linaro.org>
 <ZweftESPrJNEsqGE@hovoldconsulting.com> <Zwj539cN2DJ7nd3A@linaro.org>
 <Zw5fzNZ_xCwPyw4G@hovoldconsulting.com> <Zw_dE1rQ-Ljsh-sY@linaro.org>
 <CAMRc=MfUEfKHkAVvtGODxvJ-BdL+kX7uDgW+1y4QW3Kc5mpX+w@mail.gmail.com> <cde15d83-6059-47bc-94d6-2a88ba95e5ae@sirena.org.uk>
In-Reply-To: <cde15d83-6059-47bc-94d6-2a88ba95e5ae@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 17 Oct 2024 13:28:00 +0200
Message-ID: <CAMRc=MddPDFaw6vYo1FzXHbUsLyr2QKT6oy2i68ZCdJdFWCJww@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: x1e80100-qcp: Add WiFi/BT pwrseq
To: Mark Brown <broonie@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>, Johan Hovold <johan@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 12:59=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Thu, Oct 17, 2024 at 11:28:18AM +0200, Bartosz Golaszewski wrote:
>
> > How do others deal with it? I'm asking because I've been seeing these
> > warnings for years on many platforms which makes me think they are not
> > a high priority for anyone.
>
> > The best approach would be to provide an optional bulk get for the
> > regulator API. Or extend struct regulator_bulk_data with bool optional
> > and take this into account.
>
> > Mark: Any thoughts on this?
>
> Fix your driver to request the supplies that actually exist on the
> device rather than just some random supplies you hope will work?

Let me rephrase: the device has this supply but on this particular
board nothing is connected to it. It does sound to me like an example
of an "optional" supply. Do you have anything against making it
possible to define optional supplies when using the bulk regulator
APIs?

Bartosz

