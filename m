Return-Path: <linux-arm-msm+bounces-27018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B08D93BE43
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 10:57:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 336C8283A1A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 08:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EBB8196D9E;
	Thu, 25 Jul 2024 08:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fp9uUVNr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88651196D8F
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2024 08:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721897865; cv=none; b=r/4UePPaEa4uLrW4inlYtDclDIqzyaAAMt37ukKpa9WV9ZPvWyolXCTZcc5N1jgSq5jLL8wL4pbaZ0Ic/GaTy6DEh1k93Ejmfjb1RDXHp2660zFEBStiNJ63lJi3VMIrzoPuCLYEZEnV4LkTsutwczYci8G9r0Ek3tR1YsRmxnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721897865; c=relaxed/simple;
	bh=E2N4yFbp+8KZPhXKJxPvSIIpVuXW1rJ4/UrT861ZObA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xh2x1aaKDZ7wXmWOoPWD2tzQRrE91i/7JU0K/hxxP7PenUXWr8+RbXfRl9i2Cx0grEZ1Kkwzc+OAAbyKMWSVnPQJZ920A8sA0MIBIxRM/IdqsFzMotWKsPdDZTLCOWACCpmpfG1oJcBFxSNexZVMuPAsM1ygyMO/mzji4pbnkXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fp9uUVNr; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f01e9f53ebso8122661fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2024 01:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721897862; x=1722502662; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I8NxyUuzsjejruT7irITjyyuzjJo/q4Q+2rql62w/gw=;
        b=fp9uUVNrHZJS76YjNUBQRpVdMxX50c1G4/vneqc7GXqg+2+kVodrH0EoVERXq6sXYq
         6LZFBn1V+n6oc+oHGPvr7i+iBRAxJphTz6Pu+P9dQ9t+xmKZxSbvXa0CYBybcqWtBc60
         T3gfCcy/sM/vOb7PZeZAQgAClw920t9c3avrBPozscaJZupfUejlihqOgVT1+CFTU5Cy
         3DLwQiHZQsYqCnBSQJPOUpb1WnMPrqHETd4I8Ja5r1Ltup/N8CfkmH+CCJDhvCxutMT0
         tuA2EXOl3JmmQSOr8y3ByDEEBHzv7HFACuemlW7UwxSU4wGcXf4gOjpdSH7Ax5FfFqp+
         /IBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721897862; x=1722502662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8NxyUuzsjejruT7irITjyyuzjJo/q4Q+2rql62w/gw=;
        b=WMAgECuR+KEcVT/2tLqCSvEJGWLxTU1AO/1pkjkwbrtEQnsIE2lHg51egdsJiNWOiI
         Y8xLTl/L6z2fKdpPn5z6PYlOpJ5UXCydRelQ9J3uduohIRQYpm7XgQl6mP0i9urcrnNU
         zjXiGpdDYROkL1eBWYntqmCtqxursiIh+ftBsKj1KysrOI8agpumMwd/NPYPX9STAY2j
         ShcUX6DwTBo/vA6t0lJe3kTkb0yMU2En6Hk3odA2tiQJNfdVfj5uxqOxD1aLrfaLxjBO
         +6X8JKGnXtuY072xE8QdJ52sRzmg31mFmuSnhyM1LCQZ5AlemvsVN9ivTL/mQ9qIzsX9
         P4Pg==
X-Forwarded-Encrypted: i=1; AJvYcCXtvWi2uR0O3X1kPVuc0uI6ZSkldoaYaxCd8qqGvkwLFfT55jcWZCgAWLDCYO7WCGwa/bcqPMHNrnLDJpUExXdjJIFueDVOzHmPTKaYpw==
X-Gm-Message-State: AOJu0YxBSUSilKMznwDJhzSb2qychvunLUCnSaODbWsyIWwWt1gCM2Jg
	DFs92BQypNQR8qTzBut7ANzA4/nBEODBnBZOiHcZfQSngAJacU9VLgtF08PFeTA=
X-Google-Smtp-Source: AGHT+IGr5oLThTee0qw7lkqmpiDTtsYrdLV73qS+/r23EtxU+L5YZDFR7Olu2ywE54dzOWxHz5kA+Q==
X-Received: by 2002:a2e:9cce:0:b0:2ee:8720:b4c3 with SMTP id 38308e7fff4ca-2f039ddd47dmr14851391fa.43.1721897861566;
        Thu, 25 Jul 2024 01:57:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03d075489sm1351371fa.115.2024.07.25.01.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 01:57:41 -0700 (PDT)
Date: Thu, 25 Jul 2024 11:57:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: PCI: qcom: Allow 'vddpe-3v3-supply' again
Message-ID: <y6ctin3zp55gzbvzamj2dxm4rdk2h5odmyprlnt4m4j44pnkvu@bfhmhu6djvz2>
References: <20240723151328.684-1-johan+linaro@kernel.org>
 <nanfhmds3yha3g52kcou2flgn3sltjkzhr4aop75iudhvg2rui@fsp3ecz4vgkb>
 <ZqHuE2MqfGuLDGDr@hovoldconsulting.com>
 <CAA8EJppZ5V8dFC5z1ZG0u0ed9HwGgJRzGTYL-7k2oGO9FB+Weg@mail.gmail.com>
 <ZqIJE5MSFFQ4iv-R@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZqIJE5MSFFQ4iv-R@hovoldconsulting.com>

On Thu, Jul 25, 2024 at 10:13:07AM GMT, Johan Hovold wrote:
> On Thu, Jul 25, 2024 at 10:49:41AM +0300, Dmitry Baryshkov wrote:
> > On Thu, 25 Jul 2024 at 09:17, Johan Hovold <johan@kernel.org> wrote:
> > > On Wed, Jul 24, 2024 at 08:22:54PM +0300, Dmitry Baryshkov wrote:
> > > > On Tue, Jul 23, 2024 at 05:13:28PM GMT, Johan Hovold wrote:
> 
> > > > > Note that this property has been part of the Qualcomm PCIe bindings
> > > > > since 2018 and would need to be deprecated rather than simply removed if
> > > > > there is a desire to replace it with 'vpcie3v3' which is used for some
> > > > > non-Qualcomm controllers.
> > > >
> > > > I think Rob Herring suggested [1] adding the property to the root port
> > > > node rather than the host. If that suggestion still applies it might be
> > > > better to enable the deprecated propertly only for the hosts, which
> > > > already used it, and to define a new property at the root port.
> > >
> > > You seem to miss the point that this is just restoring status quo (and
> > > that the property has not yet been deprecated).
> > 
> > You are restoring it for all platforms.
> 
> It is already part of the bindings for all platforms.

It is not, it is enabled only for sc7280 and sc8280xp. It has been,
before the mentioned patch. I propopse to enable the property for the
platforms which are using it now (that is +x1e80100, msm8996 and
sdm845), clearly document it as deprecated and start shifting to the
pwrseq and having the power supplies being a part of the root port or
wcn device, depending on the use case.

-- 
With best wishes
Dmitry

