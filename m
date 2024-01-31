Return-Path: <linux-arm-msm+bounces-9188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADC384386A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 09:02:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B464AB249A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 08:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B20756471;
	Wed, 31 Jan 2024 08:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E04Loq62"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29757657BE
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 08:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706688101; cv=none; b=LckwSGUORl0LdomlsDBVP7cLAX3IROD6pM/PWVjXSob33e0vlfJeX16Z7w9wcP614NADUILg6slvjJi7LsOwvpDGg70HLM7fuffeYht5J5PBRPNF3z6O5ZNJv2FHy4maMB0lpqdTKeRcKxjc5HDsirkljY7lbw4iRqf2ViTgNio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706688101; c=relaxed/simple;
	bh=bcdYESMliQGwmnXxlM5uRrAlJUkgH4mbAcDcbEkBiy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJG7SPaVgMWbLGzy23T4EZe9NByJZGuWpm4rOWHRZO908OJbUUhrd4WHPc24mh8733Vep+CRefsy5nqg8aEJV6qB4+rGsA38QsZhVNagq1yKDol6btHY7dCCohAfyQ9a45b8N34oNJz4zKV0JwNQUUpRcpTJQy8g6TEYTmlXKbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E04Loq62; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a35b32bd055so373814766b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 00:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706688096; x=1707292896; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=31HHx0QgCVuAgnQ4tzCd7Ii1IZudPB4QFu8JKjXKEyk=;
        b=E04Loq62M4WoB+GJcgafbT5/MW9CT0PUXpqioR/Xwji08OIv9mmvdloYDsi2O73bCk
         azVRYzbAd/na8iwdsH0od8hZAj2KLCH0BqT+eEZdLTj74+2rmJiIkul9Uoz24YbVABTe
         NwuILiEupnlx0SayCNSlU8wcB0UW1skM+olUnD8LKGHhzfDgqnN1zWV7vVFiLH4GkKD3
         HsqXl1vZz0R5qJ1HRCy2u8CMS/fIy5kbpBiU4fP3YfiA4PVB/XZN3tcqHrR7ymaFLssA
         3xegW9x56gl+osABZ0njZ6zdYmF8G0RPKugfbRHRFdUAvArC/j27AC5zXr6oXkf7XARE
         5tGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706688096; x=1707292896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31HHx0QgCVuAgnQ4tzCd7Ii1IZudPB4QFu8JKjXKEyk=;
        b=jpdRQP5TcYSmU+igoVtiDCASplmXljSUGbHVHkQf20w4WxPFywdyHDruNMyIkHncCT
         wxduD22LYXujiTHEZgMy1lv2n8m2gb5Pqb8TX7ado4RZrIFAF0zE8FrsegEK0PphmYGv
         5d+eLThGqMhjB/fg9t8o1yZnis6MY0IAuccTz1KaA4J6DvQf+FUSWpslDwGR7Uz/fX+H
         g+b5ineHGG3w4i0GRq0FlSWtdmDmEh0xh5a7GaFQgqDUS1E3fjXpgRp+q4/JQu3cVU29
         dhj8a0et6+qFSw5BrP58tfYUo7DWj3vO1VS18qTV0oo7T35b/e9fE2vd1p8lYNync/9w
         16Hw==
X-Gm-Message-State: AOJu0YzbsswoBMQkIozulAsfnap37oajaKsBMj7Alqc9QCnuYl218uG/
	p6S/HvXSDL0LfM8G/JVPI0NrENpsgEk0wu8McHKqYzi5WVvQv1/9Ou44v5NHAyQ=
X-Google-Smtp-Source: AGHT+IEdAof27yhgTklY1BaSC03UZGW8w2/UZ7s+/KaHZPtPCy2fxL7XqnrhdsryXCuvprnRGu/V9A==
X-Received: by 2002:a17:906:f6cc:b0:a36:7bb0:e2 with SMTP id jo12-20020a170906f6cc00b00a367bb000e2mr438749ejb.34.1706688096295;
        Wed, 31 Jan 2024 00:01:36 -0800 (PST)
Received: from linaro.org ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id tz9-20020a170907c78900b00a35920de35dsm3678369ejc.188.2024.01.31.00.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 00:01:35 -0800 (PST)
Date: Wed, 31 Jan 2024 10:01:34 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v2 1/2] dt-bindings: PCI: qcom: Document the
 X1E80100 PCIe Controller
Message-ID: <Zbn+XmyG5+X5fm8z@linaro.org>
References: <20240129-x1e80100-pci-v2-0-5751ab805483@linaro.org>
 <20240129-x1e80100-pci-v2-1-5751ab805483@linaro.org>
 <120f24cd-dad0-4553-8f94-c8ebc9413338@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <120f24cd-dad0-4553-8f94-c8ebc9413338@linaro.org>

On 24-01-30 08:44:56, Krzysztof Kozlowski wrote:
> On 29/01/2024 15:41, Abel Vesa wrote:
> > Document the PCIe Controllers on the X1E80100 platform. They are similar
> > to the ones found on SM8550, but they don't have SF QTB clock.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> 
> This will conflict with my series, so whoever comes last need to rebase :)

Sure, no problem.

> 
> Best regards,
> Krzysztof
> 

