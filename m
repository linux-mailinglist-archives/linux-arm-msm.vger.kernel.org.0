Return-Path: <linux-arm-msm+bounces-9697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C6F8483CE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Feb 2024 05:55:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 360B31F21BE1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Feb 2024 04:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C35101CE;
	Sat,  3 Feb 2024 04:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yr40aX5V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52876101FA
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Feb 2024 04:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706936120; cv=none; b=pdIxedfQL3ki42S6zAGsROvt+qzBjM9OiUkqId6IcYlaRWYu7RvdW1t/qjr/DHY37Fd9VlVix4rylcqizj66c4JZPm0P2qF1N517eIAD8bUwXJZAk/BJdr7M7mnwkMB2+7y5+U979+ODYvJNwpQ758osblcB1pCGKCo7sNmyDxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706936120; c=relaxed/simple;
	bh=prhyuYpiyJHE3S7DnClC1gPKzqdA5hlwv1JmdIn2t4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tYK349S7k1U82ZOV3nIrOb9tebuD8Pa7uu/Z+Z8YOb0QRB2KFX9nJhKTJFib6dcM+KN5TdQtXTa++wFVF8puKvSo9xi4NjC8/ntFVxt46HTTNRgq7RaW6tRA0+8pQuQzWzD5//9+vkqpYQui7j+Jo0B3tE0Gik4TeGYn3I+uoLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yr40aX5V; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3bda4bd14e2so2267089b6e.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Feb 2024 20:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706936118; x=1707540918; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=liH+UlEUy0/qdW3w6rXrGrhdkv4ggd+gQjsdMoONLdg=;
        b=Yr40aX5Vdwd2PrAPmusyeO5XUqyrEkqohDXyXoWBJa6AzbvSk2dkmN5xfEEDR0wA1y
         m1Tpm8iz3T6X6MI+3FwJcMYNcaOKLXwHNfqoTIWTOfMlgHh0f+wvtqnlOCtqMa+vCE4k
         nuu7PNmp2ccsaFS899sPRwM/9aRLETZy9UGMxLYxM2JgthLw2RqQfqaWDoVEYM02QxXF
         z5SkYCkF4lvF40gi2sx0FeziFMyeboqBx0VgKlBkJjzwuUW0RqEjmeKgDisGFIOC9pfw
         e3WcX/fcZbjj0hfnObLxSZsopjelgUfPMlsgQRF16vJ69HLZkBXc7qZmGrsMDrYfpApR
         SVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706936118; x=1707540918;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=liH+UlEUy0/qdW3w6rXrGrhdkv4ggd+gQjsdMoONLdg=;
        b=T50FVcgGLtVtSyWMWqYo3p5OooDbZVo9ZdDIIwTQWB5mDW1hQJN72eNLP4xZWGHZc+
         Ab6JGeTEropUePKDILDDiHH6uxqDHXkszVirK10ynTgfW2tUXSECRHVhXXVfvKWaSsoQ
         CY3mixgt0aJ4Zm/YnWvc+s4awKxo7dht7Irkh2QgdQKSganwyFA0w37VqPhq8zhdlzMR
         jkzs/NXbFririWpoBL73pRMs4W8SKEA6bCA6rskgAULxwagOifF0VVGNUMrP67wU1WwJ
         BMbmnbQaSTtUicesrbRHwK7d1YD3BxaexREf2KwIWSpmn1lwA66+u+aGJ41/MAhp/WKt
         hzWg==
X-Gm-Message-State: AOJu0YxoRYBOb2b+1pu/WE28YZ1sQ/obmU/xMtlL9bNAbXUdZimZ4Oyn
	pkYGo0lmkiQyZAQm6ddtOclcHxU6eZh19T/7UY1VoW42qN36koo5WrquHHlyzA==
X-Google-Smtp-Source: AGHT+IHdMv2idNnsnA2Q8aRKwiJvIlzhH8ITKTDULVqn1uKBYYZSSnoU26Aac8cRhwlwGKan8m52Qw==
X-Received: by 2002:a05:6808:2120:b0:3bf:ce2e:c4b2 with SMTP id r32-20020a056808212000b003bfce2ec4b2mr417298oiw.50.1706936118304;
        Fri, 02 Feb 2024 20:55:18 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXUa+col4sTfn88a4vmaccjdk3Lpyd+XnHeUvYW4WBO9Sd+nRVAAP1o5/Cp9h6wpuhupUU8LRF7jkbplfeUvpukjn5WF17Z0UhUjI7Jw6yzxbRRJ4nqJwNhx0i5r9vcTmVl/MC0Fzu+ENJMxDhKhKAh9/BPhM/MrEDKMcb4c+FeqZuwdKRxJQBWVcRHnX2S1xiWSyG570oeU3f9HYGmvDCykKjennYFQDpfxSHoGj4xMJjU8wH+bgrqS4+cMXcGJsXZWuF7tzB9DfbGFRQQiELRLvyqw5CCuK5a2waOP7r0NCwUwPBCUDBAG9pYi0up76Uuv5k2r1zqZk25e06PjZo4TThSaHHUfrSx4QKMiMI6NSAjnnGdX+rfdNqXFLMr+LcDuagUSV3H
Received: from thinkpad ([117.202.187.138])
        by smtp.gmail.com with ESMTPSA id y11-20020a62f24b000000b006ddc7de91e9sm2467321pfl.197.2024.02.02.20.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 20:55:17 -0800 (PST)
Date: Sat, 3 Feb 2024 10:25:12 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczy??ski <kw@linux.com>, Rob Herring <robh@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	quic_krichai@quicinc.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/2] Enable D3 support for Qualcomm bridges
Message-ID: <20240203045512.GA3038@thinkpad>
References: <20240202-pcie-qcom-bridge-v1-0-46d7789836c0@linaro.org>
 <20240202090033.GA9589@wunner.de>
 <20240202100041.GB8020@thinkpad>
 <20240202193326.GA29000@wunner.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240202193326.GA29000@wunner.de>

On Fri, Feb 02, 2024 at 08:33:26PM +0100, Lukas Wunner wrote:
> On Fri, Feb 02, 2024 at 03:30:41PM +0530, Manivannan Sadhasivam wrote:
> > On Fri, Feb 02, 2024 at 10:00:33AM +0100, Lukas Wunner wrote:
> > > Please amend platform_pci_bridge_d3() to call a new of_pci_bridge_d3()
> > > function which determines whether D3 is supported by the platform.
> > > 
> > > E.g. of_pci_bridge_d3() could contain a whitelist of supported VID/DID
> > > tuples.  Or it could be defined as a __weak function which always
> > > returns false but can be overridden at link time by a function
> > > defined somewhere in arch/arm/, arch/arm64/ or in some driver
> > > whose Kconfig option is enabled in Qualcomm platforms.
> > 
> > Hmm. If we go with a DT based solution, then introducing a new property like
> > "d3-support" in the PCI bridge node would be the right approach. But then, it
> > also requires defining the PCI bridge node in all the DTs. But that should be
> > fine since it will help us to support WAKE# (per bridge) in the future.
> 
> I'm not sure whether a "d3-support" property would be acceptable.
> My understanding is that capabilities which can be auto-sensed by
> the driver (or the PCI core in this case), e.g. by looking at the
> PCI IDs or compatible string, should not be described in the DT.
> 

We cannot whitelist platforms in DT. DT should describe the hardware and its
capabilities. In this case, the "supports-d3" property as I proposed [1] tells
the OS that this bridge is capable of supporting D3.

Blacklisting/whitelisting belongs to the OS. We can however, whitelist the
bridges in PCI core. But that has the downside of not being useful to other OSes
supporting DT. Hence, a DT property that describes the hardware capability
makes sense to me.

- Mani

[1] https://github.com/devicetree-org/dt-schema/pull/127

-- 
மணிவண்ணன் சதாசிவம்

