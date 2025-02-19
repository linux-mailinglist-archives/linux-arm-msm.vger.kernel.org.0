Return-Path: <linux-arm-msm+bounces-48533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF440A3C506
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 17:30:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E869171BC4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 16:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B8A51FECCE;
	Wed, 19 Feb 2025 16:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mEfAWXqE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9D91FE44E
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 16:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739982499; cv=none; b=bRD+lABNmRf8zdnbMJVNSrXyOMiypB8aJWGaBX839tz2+kQxS3lETp4woUUiZSPwtXHX89EL4YGJdFgug4KeeX8s2toPkL0/O9KtQJyjgpRbXHfTx2C2mwNIEpY6agtrIydwXBJkWAia7xwzB5En7sGl3VXSdCOzcpG3sk15ML8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739982499; c=relaxed/simple;
	bh=gIEAaQuMpvcrLQDh3vZAHZqWFqhXyhJidbzOzOnz2ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I6Zh6SJZbwgqNg9VvMYdT9obL33Za5TF7dPFtcMR+8EQuaAtUlkH8r2wuPLq+qNjt5HbfjcYDzIwMjEbEenHzvvtElFZymgE07qvV6f3SnsmVObhbk96WlzviqrZ4G6fIRo6fakP8FQnr/FHQQay9LyDLmsfjhyLzzvuLweJiX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mEfAWXqE; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38f26a82d1dso3500877f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 08:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739982494; x=1740587294; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MRwCTxrrfvwtx9nFWmK+OK00bxF7qgqDJMInBEnLV1g=;
        b=mEfAWXqEV3E+1cLWPKyAUOvWBVSOB2FLarif4Js/WWZdVmjgkjT0Ug9JEUQEJx1o37
         mrwvMfZd9M0aR8qhgmDQK/BRN5hpgaEO3NNadpuLCpWhfXVw6mgNspdKJACjpVkByu3h
         76/ZifkX/qMa8RWErEyjBMaLlMvUqHDxix5ChdsHcwciqZKaGez5QIQG9vqPcmB06z4O
         dsm7sLFZD0XuPCd9LjvhxPr39oYiUf2vj/ULif+B01RWgLt1dzj02x4OOq8U0IbF6Mib
         N6pw+22tEfSSFKISprcvfiYpKIGwso4GXN02Uett2yUdX39j4EINhRTwGjtVDueYqTJt
         3O9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739982494; x=1740587294;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MRwCTxrrfvwtx9nFWmK+OK00bxF7qgqDJMInBEnLV1g=;
        b=XTncPP5hZlUulZWoXGVHr0Xw+lwvtQDu392q9Gh1d/Dn1VGK6cpp7FGkWdsTA8UlEm
         3C/kNc36Zb/3jhyL6SX9Fd4iRXgYVkif8qL72RjF6D3sbNs+wZqrTG1aK+zfYjhjKxiu
         Evh0obaPZVShQ60/VwVulCpYgkHNadIvRPxvZQ2L40PoeNRNZhIkhZUXEvdJuUIK/lTT
         pTM+H33PwAblbgkUaAtE6V4DcTH6cni4byNKTkNa/09LiMQCMbtrQ7uNOA0k+FOqoxGL
         00lFrwuMrTo6kUpu/84Iv5/tsXG76CC9mKAFAFk9KC3Vlg5vcbz4g2ZvVql6uggJcEvG
         PK5w==
X-Forwarded-Encrypted: i=1; AJvYcCVyjyDMx6t/uoXGuiIFkfrzVb8prro4dxEYswPjE5EZFZOuBv+Lc0CNjEOlsu+29rZ4A4y4IbbdXbKf11iZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwDIJc21aS9srLe+FtY0J3THvVQ1r25dtmM2Vc1ht9NsuzinnJ9
	FiNCfMXGAwNegGBSF9X8z2NOysPqJD93gP/CBthJ4Itf1o9tJ7DO8Dwt5zz6usI=
X-Gm-Gg: ASbGncuYfqg424n5YuGJ2zOt//G8kkpQ1mvdqs8EJc3YkQuSfnzgmm8potZAkiEJDSs
	lKTsuMda30GcCH8NF8D54upTkhOAsISsdCa7YhaDkTieIND4IDABMy4NGRmxmn7gXGdy2EHhL8g
	deEUYRVcBVKzlcceWrW5aDaFRfnpWkyWTc49U9PNJHIpClHt1ed1lPsnxyyPedNvQPKpNXnPc8+
	zdJbzdQ99ruvck8H5Riwi1M48XPWOy7vJ9MCbznSS7EY0Y7Yx1K9m8TR10fOculb7kIfl+Ojvf8
	7O7VjIWtejDJfJ+ZMNuMeYGSM2o=
X-Google-Smtp-Source: AGHT+IH8qkvsyXpimgmtGKizvI1hdDhttqIBX8KjR41D6xYWe3cw/2Xh8D6uRRAu4ip26Fbz7QtqJw==
X-Received: by 2002:adf:f60f:0:b0:38d:dc4d:3476 with SMTP id ffacd0b85a97d-38f33f58da4mr15133466f8f.52.1739982494207;
        Wed, 19 Feb 2025 08:28:14 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:c59a:9aec:ce42:c01f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1b824dsm215833715e9.34.2025.02.19.08.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 08:28:13 -0800 (PST)
Date: Wed, 19 Feb 2025 17:28:12 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/4] arm64: dts: qcom: x1e80100: Apply consistent
 critical thermal shutdown
Message-ID: <Z7YGnN9XwDqOpwc4@linaro.org>
References: <20250219-x1e80100-thermal-fixes-v1-0-d110e44ac3f9@linaro.org>
 <20250219-x1e80100-thermal-fixes-v1-2-d110e44ac3f9@linaro.org>
 <Z7X6jZev8fpoq0Ih@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z7X6jZev8fpoq0Ih@hovoldconsulting.com>

On Wed, Feb 19, 2025 at 04:36:45PM +0100, Johan Hovold wrote:
> On Wed, Feb 19, 2025 at 12:36:19PM +0100, Stephan Gerhold wrote:
> > The firmware configures the TSENS controller with a maximum temperature of
> > 120°C. When reaching that temperature, the hardware automatically triggers
> > a reset of the entire platform. Some of the thermal zones in x1e80100.dtsi
> > use a critical trip point of 125°C. It's impossible to reach those.
> > 
> > It's preferable to shut down the system cleanly before reaching the
> > hardware trip point. Make the critical temperature trip points consistent
> > by setting all of them to 115°C and apply a consistent hysteresis.
> > The ACPI tables also specify 115°C as critical shutdown temperature.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 4e915987ff5b ("arm64: dts: qcom: x1e80100: Enable tsens and thermal zone nodes")
> > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> 
> > @@ -8483,7 +8483,7 @@ trip-point1 {
> >  				};
> >  
> >  				cpu-critical {
> > -					temperature = <110000>;
> > +					temperature = <115000>;
> 
> Have you asked the authors where this lower limit came from (or
> determined it was just copy pasta some other way)?
> 

I haven't asked before sending the patch, but it looks like copy-paste
from sm8550.dtsi. That one also has these weird double passive trip
points for the CPU, which are dropped for x1e80100.dtsi in the last
patch of this series. Rajendra and Abel are in the Cc though in case
they would like to comment. :-)

> >  					hysteresis = <1000>;
> >  					type = "critical";
> >  				};
> 
> > @@ -8737,7 +8737,7 @@ trip-point0 {
> >  				};
> >  
> >  				video-critical {
> > -					temperature = <125000>;
> > +					temperature = <115000>;
> >  					hysteresis = <1000>;
> >  					type = "critical";
> >  				};
> 
> Ok, make sense to backport the first patch as well then.
> 

Exactly. :D

> Looks good to me:
> 
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

Thanks!
Stephan

