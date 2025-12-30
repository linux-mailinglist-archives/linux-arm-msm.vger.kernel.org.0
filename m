Return-Path: <linux-arm-msm+bounces-86903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC5DCE88FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 03:29:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 92CDE3002493
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 02:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FAF42E06E6;
	Tue, 30 Dec 2025 02:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HscSfh2J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6362F2E03EA
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 02:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767061765; cv=none; b=DJ16smzclRWjUutxZYhHvfCc6sl6HzvAGlDkeuO0WJEuuNT4KbHnpGUDJH720MgV9DFZvqRddk0Sf9+HuTHoPJxkrCqgWEekt07h1XLS/9yf/PKVFIn9LsYfe3kJjfkgjVpU8JcEYDzyOVz8m+zHDe6BCMbMKPxJZqXUj9Q3luI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767061765; c=relaxed/simple;
	bh=tnl41ZSqOs3vutxxNmBDAHdEueEiaaq8cJJrJX1XRo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kZvOLjH5eIZf9XJ5AEJ/0ei4RfjEF93JsQHHFYvikt+qd57XYF4GcmjVM3SjySsifQgK1jPXRkDLIo04VQliplytRyC9cOwe5w0vqk5BYYm8QPH7v0fYwQIrizHnL4bmHYiQz292zjA+gXGOX10h+0d2gvacCkdBe1U605KhLx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HscSfh2J; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4ee0084fd98so82232881cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 18:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767061763; x=1767666563; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R0w28WIRcTstXXfBO265wq3fXHKY3ZwwZgohd1inI7o=;
        b=HscSfh2JeKqPUSu8TrqnErdwt9pVBEJfGinAaGLp6GE6B7gieusRoamUWE3MsXMo+9
         gcy/enbr36azdaUX2e82C3+Di2tII+4eBUHSXqTXlbmveIGiSsenyStjebjcgc/fq67r
         MLQaGYOPp4Rtmzvitk8/WxEOFtL1isRIhtuXb3pm1oDve+3pi8xp7JewpNFT8UC52fvI
         yzIbyX3WHW/ShATq9lJKEwQ7VEgXOPsMU0PNi/Ny51elmvoMiKwQ0QDjjWzM8+4NcQ0n
         VcgVOhO8jLH8ys1lqDNwtNdCeXOZwlLq67eIF9FldiD+hTlVcW4BBWyL0MDGWPA7U7nQ
         lLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767061763; x=1767666563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0w28WIRcTstXXfBO265wq3fXHKY3ZwwZgohd1inI7o=;
        b=ayt1oY0D8lFkvui2KGaMqB0WDxYPMNNjeS+JjQArVqeFhOHmUPk7JU3BSIoHF5S8YG
         U0zm7H42XYWq+c9Ok2ml2oETEj+QvfrCXUWbaIs4ePIZPjJ+qnkH8X/msaB62WyYj/fa
         9T7N6uLWNtCw2c0qqNtlmp65eiLtX4tzpEkdHYbyUcidm/hbTvuXvzZYZYdPvnHv15ua
         RLOporx1C1i239hXsJvkg2cqQsRXMzutFfFvHzse9cKFQb3GibicysZ5mm/zaKg0E2nk
         /+eqmP2r2t+OBKXvCRbf3uGO52g9RfyL3ZqRGMWMSx//FMdlpREbSxceB7WPB1DyQucZ
         1vEg==
X-Forwarded-Encrypted: i=1; AJvYcCV9bdDR+5nR2Kld1/2BRXal8RCxOJblARSwPMot0s1plRy4TEEz5/9KsxxjkdZeVLBtsljZauM7QvjqbjBK@vger.kernel.org
X-Gm-Message-State: AOJu0YyfiYVKt1AmV6o7sWDnwvGBun3PySzBJ1aWf3M+bGfMx6ELZBkj
	q49Rg3UPGwd6zw+gE4swI6g/7xmoIBN+OfFVJJ9yDal6T+t5kmWPBA8b
X-Gm-Gg: AY/fxX6lTI06YsUDyUJkudcGNWCnhq4ICivP3Caig6IQToDHcQG30Pah+f/IqKK1B8n
	rEEN+VTEZ/YlPGchR0AXXm4qivv7Hh/KySxnJe77DKtTWz7QBcryNltRS6VQAEuv2QKi2eUkekN
	+/zcTdLRh/BxLfJV3bFAh2Bhwq3J8GQhUkD0PGiscgDtb82BMKHVPa+qsrF+72Db95kPxrjNTfx
	ZZtQdpU3/vA9T9zz8P5WBeSVWqTrXRwZNLS4HqUVYXcvscj02UVywKCpbNy7Vv7WfuFeyAxpZ56
	vGc19FxL3WUXZmhfWxIYTEAhaxwDxOKh21A+GMN33zHUPY7UptyWjEdLQVGFmqWXddrZN48Qorc
	T6BtxyzbHyF4SgAx4KeDPucRmpTOw13HVgglBNYiASiBb5nKtc5AgrxCvCzbVbX0oh2RMbW9UHG
	15baSQFgTcaHM/RQ==
X-Google-Smtp-Source: AGHT+IHVKBzSADEPx+Onea6LnwYi82VGcAGjBi5hads4qZclwVnVUfA3HzsrqDnFgWQ38aXo7QC4yQ==
X-Received: by 2002:a05:622a:2304:b0:4ed:1880:2863 with SMTP id d75a77b69052e-4f4abd93e82mr506193651cf.57.1767061763264;
        Mon, 29 Dec 2025 18:29:23 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac54a6acsm251760861cf.8.2025.12.29.18.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 18:29:22 -0800 (PST)
Date: Mon, 29 Dec 2025 21:29:42 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
Message-ID: <aVM5FrvQkoxGwgph@rdacayan>
References: <20251211014846.16602-6-mailingradian@gmail.com>
 <wwpqaecvz42jopgaboasbh353ieelctpvgo3yj6y5tnxoem5oz@j5sbx3yxntot>
 <aTtkwQb2gOeWAFuv@rdacayan>
 <d7jcawzugobqern6zlo5jwcnximtsroxywix53v2yp2isvzo5r@ymxicmgfjmzq>
 <341012f3-18bd-4f96-98c1-f964d1fedb8f@oss.qualcomm.com>
 <1d830282-a778-44aa-918b-5ab3e1516c0d@linaro.org>
 <4c4e8e5b-66b1-4227-86ee-756eca945972@oss.qualcomm.com>
 <fa131841-ae9e-49ee-a7c6-728b4a6a4b60@linaro.org>
 <aUIKWMQMAIzjybHO@rdacayan>
 <79e2bb5b-9bca-4712-87bb-e0371b36bf50@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79e2bb5b-9bca-4712-87bb-e0371b36bf50@linaro.org>

On Wed, Dec 17, 2025 at 05:11:11AM +0200, Vladimir Zapolskiy wrote:
> On 12/17/25 03:41, Richard Acayan wrote:
> > On Tue, Dec 16, 2025 at 05:23:53PM +0200, Vladimir Zapolskiy wrote:
> > > For whatever reason CAMSS on SDM670 is very special, because IIRC there is no
> > > other platform with preset status poperties of endpoints. This exclusive SDM670
> > > specifics shall be analysed and eliminated, since it hasn't been done during
> > > patch review time, it's time to do it right now then.
> > 
> > An SoC-common endpoint node is how panels are hooked up to DSI. This
> > seems to be the case for SDM670, SDM845, SM8[123456]50, etc.
> > It's not special or unpopular for DSI, but CAMSS seems to be the
> > subsystem where an endpoint node pre-defined by the SoC is only in
> > SDM670.
> 
> Only SDM670 CAMSS endpoints contain 'status' property, not DSI, not
> CAMSS on any other platform. This makes SDM670 CAMSS special, and as
> I've said above this very odd exclusiveness should be eliminated.

Oh, if everyone is actually fine with empty endpoints for CAMSS
(`camss_endpoint0: endpoint {};` in SoC dtsi), it might be easier to
patch the driver to accept this:

https://lore.kernel.org/r/20251230022759.9449-1-mailingradian@gmail.com

