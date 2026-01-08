Return-Path: <linux-arm-msm+bounces-87968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB75D00DCE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 04:28:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CA8B7300180F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 03:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D65B42773DA;
	Thu,  8 Jan 2026 03:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cu+/GE6g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425781EBA14
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 03:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767842895; cv=none; b=C5rLybwtWi7Jxb1AA4bNwuy/Put14NYAAKrgfYan+HWPulcbIbZmaPjFV0SgaqKqYlcg9GnhMp9qWUkCoiTRu9vQRJrXyPzbSNCnCQ/xSZbZKPzgaUR7zrIWC5Db7Fyh9e/+MWslFKo2Iz22tFNC4DSvFiRb+O0naCEgy50Oqa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767842895; c=relaxed/simple;
	bh=VGk454ttZIdzpsHMCIxZieV3Y0Q+sd63A46nmYZNR9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ruGeSoyPy0mjE26KYOHmCQ3kTBUcRxFG+rrEexAaG/BUWXujaBXT5qFp4InPVZopxgiu5Bj+/0L6oxcOrpuHu3eaaOkosyMq0UDsEwbEvjNPOMIRiLoPMRkR4vfZl6tRzKYo9y7T4QkvoNrJ88mpa2uRAD/ATX4yOZhy3KHFwX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cu+/GE6g; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4eda057f3c0so29228051cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 19:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767842893; x=1768447693; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vofKUnypKUICeBkcdQzN2mTABpjUkxfzwfH7Xyfr7fo=;
        b=Cu+/GE6gQ/VWFSZ9sgXaSJoBGq81/pcafRxekyHJO9dCL97P5+wmyQRXqBgvxYfxnP
         q44CdN0zO2/yaPYCJDfXCj14+TW56YghiERkOgU0jnQ92eRqh83O/zeq+AfiEEWpg1dV
         GeoRO0sqx4JrAwpvz9KyDJx46eHY/c4Rauz9QZScu3MklURpASuSvT1a7UBAsa2GW85+
         SoaGH9xWnghMyLRiSqAuz2wJAFC9Gcbh8s12s2T1Gz5+Njjk0JNEGA8fToN+a+yIYY54
         k0NpRzIO0uVPDva8HHznlQFZPUm3S/alDj/TqUsfm2yd/xgXYLRbpWgFSEVkeSBZGayZ
         QICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767842893; x=1768447693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vofKUnypKUICeBkcdQzN2mTABpjUkxfzwfH7Xyfr7fo=;
        b=FL5UJ8WN9xUFlaLR26BZ+BDtb4KzSxgSYllaTTj89f+77EU5FTQDHf+MZxz57UYJlp
         2MYIyXxW/zOwouTERWy7lk6xOGr/ByCuioc6Mw477jvMGnQWD4AqCi0DdOBpqDXN2Ra8
         MSCgEsROXE/hVNnO1D2qeMK4TeyNAqhmfb+jaPxrvfUwaAvUKPOBXUmQlTeWUcZZeIzD
         XYpWI5sUcXQ8Gd2CdbjlWvJymwYv+XEeOpAAvlGqFZfTHpB/i+u8TsvXN7gflO+dTZyo
         6eKywvewtd0777dW4ZKrRuKA6tA+zMQcRIcf/te0JP/pLCKfvsZe4238+v1EOzaTBhVh
         Vz+g==
X-Forwarded-Encrypted: i=1; AJvYcCX/4cb+vQqEjBgedw97DV8djXRuSQqxhSjOBShA5Y18R6fBzCUGmI8HoXQBFhJZxUOuZppN/spXMYkyAmqT@vger.kernel.org
X-Gm-Message-State: AOJu0YwI5hGKIIWFQGC3Ne98dw3CNOWFlf8BzHFbMT14O9IiLb39u0+H
	2OiDSzJwkqjgPenZ6AAD5mqDmhshH/pr5MFuRdj6YMqx42RhJ49mU8Tn
X-Gm-Gg: AY/fxX4Y1xolfbTcnkso6ENrO36tXljIpyG8xZ1Gso5FUXEP70ZSJoaydU6JSR9kVIf
	O+J9RFaKtcNqYqwpfuYWAnA8NSjV08Ifd4tzIU4SUxrz1uH8jrSU6HggtnvOBdvVtaPNWzGjUBo
	mNL+kViW0WgDe92Pno4e4YitGVNx8rqc29h2KG4or2VUjbhFPfOiGzLjNVyCEQjBOIIX1ju670K
	mf9TXVhxBWpUCSXHNXGP7eH0Tu3WS3Xh4cIU6UFGf+6pzcytn5LPo9V0BGczBRCIxN7bUcTFW9s
	hb+qDmYtLLsxaEQm8mC1BQmwb6aiN3Sik6yHR34kX+j1Ku6WrZjWR015V607IvsRERbQdkOp2ya
	h5RLoSya3PSF6sGrB+gG7cO3i4ybEUFQ7dv8UNrsVd3w1+daHen/gYu7NKDR8HjfcNpPkfhLna0
	3PBH6JlvI/WMd9cg==
X-Google-Smtp-Source: AGHT+IEjSoUYkF14Ssyk5oRE7aJzB2JoaALD5N+ldr3oo6bP0R6LXqMtXCQczf07mSQIpjrUbtFTyQ==
X-Received: by 2002:a05:622a:1811:b0:4ee:213b:3391 with SMTP id d75a77b69052e-4ffb482f716mr64003111cf.20.1767842893142;
        Wed, 07 Jan 2026 19:28:13 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa8d39950sm42659431cf.1.2026.01.07.19.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 19:28:11 -0800 (PST)
Date: Wed, 7 Jan 2026 22:28:32 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Robert Mader <robert.mader@collabora.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v6 2/5] media: i2c: imx355: Support devicetree and power
 management
Message-ID: <aV8kYJm7nUM3A5jf@rdacayan>
References: <20260107043044.92485-1-mailingradian@gmail.com>
 <20260107043044.92485-3-mailingradian@gmail.com>
 <20260107-masterful-ermine-of-cubism-e5d5e1@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-masterful-ermine-of-cubism-e5d5e1@quoll>

On Wed, Jan 07, 2026 at 08:34:29AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Jan 06, 2026 at 11:30:41PM -0500, Richard Acayan wrote:
> > A device tree compatible makes it possible for this driver to be used on
> > Open Firmware devices. Initialization of power-managed resources such as
> > the reset GPIO and voltage regulators can be specified in the device
> > tree and handled by the driver. Add support for this so the Pixel 3a can
> > use the driver.
> > 
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > Nacked-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> You did not receive such tag. You cannot construct tags, just because
> of ... what exactly? Why do you think to use this or other email?

I interpret "NAK" as a request to stop working on the patch. I assumed
you wanted this for process reasons, since I didn't specifically address
your review of the reset sequence for 3 revisions (v2-v4). I can't go
back and follow the submission process differently.

Original complaint (https://lore.kernel.org/r/ff9d571a-9b47-4f39-8589-d4c7b190d3bd@kernel.org):

	I already told you this at v1 and you ignored the problem and never
	responded.

	NAK

The path forward is usually to give up, or keep the NAK and hope that
the other maintainers accept the patch anyway. I see 17 cases of the
latter since the kernel started using Git until v6.19-rc1.

> You received only NAK as disagreement of this patch, but I did not allow
> to merge it with my NAK.

Ok, I will remove the Nacked-by in the next revision unless you
communicate that you actually want work on this patch to stop.



