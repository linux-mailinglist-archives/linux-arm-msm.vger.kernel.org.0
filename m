Return-Path: <linux-arm-msm+bounces-85271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 967EACBF915
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 20:40:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F2F6301512D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 19:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 119182505A5;
	Mon, 15 Dec 2025 19:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a/z+urM6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB1B22129B
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 19:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765827633; cv=none; b=BBl5IT9xDNHgehdfyL0bZtitM6ighjbGakcWQKs5/ps/eQJwjUAsGjQa/NjJ/Ba3O22852cU4kBC7sX1kFrBco9fRMwPdP7GqQMfXN1Cdl9wAt/131BA7cUUApYOk8y82s+vuRogzY0geyqM9pN6e1G5r1xr0HaQHaSaGU59UWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765827633; c=relaxed/simple;
	bh=9y6b7in2ihxMbdfZC7ltYTi57MN5j8PMIpwtOwO3MuA=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b3UfqVJGQRswsdTWE86NMw/nbGz9p3XqNO5RZc8PhK5dNjPuYQiA75k5hsXbp9Ok5QW7y0AU2bIFAalJkZMcqqv45xwAoAJiiINCib+pSflWjyUl93176KdRISTDOKjA9T9t2uz9c7gDhZyvu5Ld4srTWb1tMrqt1zv5uJ8bukU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a/z+urM6; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42fbad1fa90so2596247f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 11:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765827629; x=1766432429; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lEzLk2shy9y7ypTsgQweik1qhExZjCZM7//mLI7mL1U=;
        b=a/z+urM6NcCmcznbw5oxHj/gKRbiKtJQuXOwb05c394qijWVDRdFjmvsAz7XexH/Vs
         j78OoPemakb7ltpHKLsFP97w40zYEwA8qGdltY7GfKGXztC6BdiubqsP6Fr8ahltlGbw
         SLK56Fp3cuwpUIoMC42uxg74+F/OC3B5YKl6Gcs5DfHO4qR3DRUh2yM21mtQNfVWEiSG
         9KnsuTm/p7tpwnWhVeXy97j74eiJbNwL3GmadZ5mba9JG+D3/95KR4qKGgwrwQ4yVebz
         Bso0KYwW1v0Zsifyc49VGkGx2+8jItciMabB9zvPddYW/saf/GwbOvmdmvrbTU9a3nQS
         v+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765827629; x=1766432429;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lEzLk2shy9y7ypTsgQweik1qhExZjCZM7//mLI7mL1U=;
        b=snLIDSTlQ0+SC5otok0BOZ7cF6YOUQBdnpn/1iROoPNDfS0nRhxcno8AUnAHgz8Ea/
         mMTBKdqE9nLK8J/qFI1+XOoyPsHk7yYy2inP0lgHGOe6DGhNMc1zFmh9S7ZAl3G2Nz9n
         QutmodPKfvU78wdSKqts21aduDVX08E75rAAMGd6PcgSJrJeXLOrwFyFk0VqZQmxuRUG
         Z4bmXE2VCSFiNZ2Rhna70aNTQfPmwEInesvXCkZHyvehgSJrR14Ff8tT0vTL6zy0Lrem
         f3JmxpkD8lUtkLavYoZ3sUAJZ9as8rMBnf0uiz+mGX0+sf1P+f7JuI5iarBSBEH8YJga
         1L7A==
X-Forwarded-Encrypted: i=1; AJvYcCVvlRvApfKxiiVI3O8e0f+p4o7UiIacTUCxgszee6/Rlfw8WbUbErMeNQ5E3pSfqKSAh0pHSlFGIhn7Iy9K@vger.kernel.org
X-Gm-Message-State: AOJu0YxDf+p8bApbbXETir3cwzn3QhuSddyAEw/XsU+8//OuQ93a+oKx
	noMj9DRRDFhIgTt3C2vOdhscqztXgPxoyJ3mvOzRPLE9QDRoZOrAyFAH
X-Gm-Gg: AY/fxX6xP16YoXwyevAcKg91kGjKN6vv+dd4Y+JdRKs7A1nreQt7Rj8udVKykNdo/V6
	4gCo+GbRl4LLN4JwgMujXKU+ZOSwjFBcV4XWJCQSVvQcVL1WitOCWVA6cuDMPMQ9xN51z2PX5+r
	DhVe6onV5S/xpo9OIxDjimAHyMeBnHDmCdJKdaR4gvgiFRu6Sq5P8rmxNBRWFfMSd59A9qh0M8L
	MFjvJE2C2f8VQk60bhkT97f7bCr5jIOY9PpktVG6KFlsiG6tDK1NhcAeSiI86yTA3JPVvMnkWjk
	qO5hcwxkMCrtjuFaayAJMFjOpir0N0/woR97d73XuIqnoMFoO1lIIryMTwxcAP9hJi9YzkbnRIB
	CTjMYdsSgtWuKYbpFVAf0JF+mo57C/m6VJ5EteHErUvQYvx+qmv2NnK39AR7CTqO1HHsmvQSN0q
	UE7SYoTPPvrtq4JApW99uUePYboF9ary+VL+7DAXA=
X-Google-Smtp-Source: AGHT+IFP8gJNON2onfOKCApiokNk+T6Lm2ub7YeNtGawfNOx+Wvx+oGbaozuj1Z8ekx9b+5qNnJgZg==
X-Received: by 2002:a5d:64e6:0:b0:430:f5c3:39fe with SMTP id ffacd0b85a97d-430f5c33c72mr8793616f8f.4.1765827629338;
        Mon, 15 Dec 2025 11:40:29 -0800 (PST)
Received: from Ansuel-XPS. (93-34-88-81.ip49.fastwebnet.it. [93.34.88.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f280cf30sm16923974f8f.3.2025.12.15.11.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 11:40:28 -0800 (PST)
Message-ID: <6940642c.5d0a0220.f68ee.f1c7@mx.google.com>
X-Google-Original-Message-ID: <aUBkKboJLyCatA9w@Ansuel-XPS.>
Date: Mon, 15 Dec 2025 20:40:25 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm/arm64: dts: qcom: Drop unused .dtsi
References: <20251212203226.458694-2-robh@kernel.org>
 <c2mvshcq36eyigsmo5cbwlpk5usfsog7knrd5djwahz2s7crmb@hpen3pruobgz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2mvshcq36eyigsmo5cbwlpk5usfsog7knrd5djwahz2s7crmb@hpen3pruobgz>

On Sat, Dec 13, 2025 at 06:04:56AM +0200, Dmitry Baryshkov wrote:
> On Fri, Dec 12, 2025 at 02:32:08PM -0600, Rob Herring (Arm) wrote:
> > These .dtsi files are not included anywhere in the tree and can't be
> > tested.
> 
> I'd say, either this, or we should get device trees, using these files.
> 
> Christian?
>

Yes I can port some dts that makes use of these. The can run linux.

Thanks for pointing this. Would be enough to prevent having to drop
the dtsi?

> > 
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  .../boot/dts/qcom/qcom-ipq8062-smb208.dtsi    | 37 -------------------
> >  arch/arm/boot/dts/qcom/qcom-ipq8062.dtsi      |  8 ----
> >  .../boot/dts/qcom/qcom-ipq8064-smb208.dtsi    | 37 -------------------
> >  .../dts/qcom/qcom-ipq8064-v2.0-smb208.dtsi    | 37 -------------------
> >  .../boot/dts/qcom/qcom-ipq8065-smb208.dtsi    | 37 -------------------
> >  arch/arm/boot/dts/qcom/qcom-ipq8065.dtsi      |  8 ----
> >  6 files changed, 164 deletions(-)
> >  delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8062-smb208.dtsi
> >  delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8062.dtsi
> >  delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8064-smb208.dtsi
> >  delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8064-v2.0-smb208.dtsi
> >  delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8065-smb208.dtsi
> >  delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8065.dtsi
> > 
> 
> -- 
> With best wishes
> Dmitry

-- 
	Ansuel

