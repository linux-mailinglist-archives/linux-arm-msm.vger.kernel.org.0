Return-Path: <linux-arm-msm+bounces-12948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F6586C66A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 11:09:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 583BC1F22451
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 10:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81B6263504;
	Thu, 29 Feb 2024 10:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kr0FBfpg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81F3634F4
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 10:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709201344; cv=none; b=PllHgy+yVVdngtwI6lQFdilZ1uINNMIDKqgeWHHoQCvfaPg1/MLsdzL7XldD0eQIzeA6w4VCVLIGGmi7kwKFzf8j56yR+q+XS9G4ZTnI9wt1ABsjwYFJdahj9TgUK2otSSXKz/vWFxQFeOcFF4NMPq388FiKxOVPHRNgY6bdkvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709201344; c=relaxed/simple;
	bh=TaJ1vIO6c48ourx3qLmNDyG/UNK2kz8FQnWudKrG3+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YTq3f4rPiLgBIVQY7NxzE0TnAKbRV7rVLuOHw4jwb0dHbZs9KZTtH8IjQad9p+T21Gp29AerI7hCu74Q4svxfAiZg8bMPOt2uhiNQxfYygPrPvQsL4ModYdoteLnNqQHArYOkBAnKRYXuV21HMMGWLlUtByMu5GIt6kgVfhDNys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kr0FBfpg; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6da4a923b1bso571789b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 02:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709201342; x=1709806142; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D/kwhfPvnRW9V0TZ9Zxmbl7MMjclgSBvckKEZL8M5Jw=;
        b=Kr0FBfpgQFwAksr4glLYr1po7XztJ4d3WiN/XQKeiKy7ZI7vrH7PRXpNvwV1sUm78F
         5QRdKcc83wqfs2PEa9T/T/B5aVr0bJnjgTt3KNEgWjibzVuoLd9K4VQUFSbVKQflUOo8
         7U77G18fDLs7SiNfL/5QR5WRPNF2mlSC4UF9ZmfQPex93E+MAxGQOCg/kB811VGkbki9
         HyGjnixmJ4u5spe42djvFy1Qi11txaZjyoY61dln3fVlpsAnZuSq6BhIbJSLU6rOGoix
         eQjRMXAXJdQrCq5FlruVE+KvkUAt0lGtyL9PsGv1LG3pDb71kpT88DCHa0FNLILKNZ8K
         5bTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709201342; x=1709806142;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D/kwhfPvnRW9V0TZ9Zxmbl7MMjclgSBvckKEZL8M5Jw=;
        b=xSV1IU452i7e0G3x3e/r5nx6zEHikoeZNwiBR5CXZJXbGz0vPQTJNu/ZuWPkLY1OCh
         5DvUS40y20K8Xrql2H0mJQNye41ZnO0BaEbSf1ZJ0tPW8rSL+Kno1QGgeQYPLOFZruSP
         5S4hXSJ99JK+zKG76Cnu+OAprEgsCXYYqrHnVqcwUKzXeAhkEuYEXNqjbr6I5yXvGp/G
         Cr7GtBwnFb6RjR322YSL7UKUw350YKjWEL08iiJNadE0If6zLzHeDhr4Wx5EmKuDja4q
         +CPjFt/E4plE1DPvoBMOlmqmbp2/Eyl5GE/Kr9ZPj/YS9VAjeOxVltuBt9s35CvYej6+
         Kerg==
X-Forwarded-Encrypted: i=1; AJvYcCVs0mq82U4lP9x6awTYZZit6yU0u0BZO6JkRDZ4xA7AzZLRWeH0irRiqssgeAfuG/VfmU6oR6VVCO+rb/S/zldaeS+0VPqph6CMuWsGhA==
X-Gm-Message-State: AOJu0YzSQcgrT9lJmxDy5sQaJS5+xZSNGcseMeDX3uco9CtX7Srx6rVJ
	zcYclGzEP1OGACP8WMz9sgB9k1MSvYqCNwxQtW8bEGTHL+Lmz3RYx7vjEMZj9Q==
X-Google-Smtp-Source: AGHT+IEoKjra9mFZzOPhAe+Au9fB+EVWfIlT9YQfWmQ8+50P2HzB/vOroWKiVTnfxOxLKr9CWwQkPw==
X-Received: by 2002:a05:6a20:d907:b0:1a0:e944:15b7 with SMTP id jd7-20020a056a20d90700b001a0e94415b7mr2728509pzb.5.1709201342188;
        Thu, 29 Feb 2024 02:09:02 -0800 (PST)
Received: from thinkpad ([120.138.12.68])
        by smtp.gmail.com with ESMTPSA id lc11-20020a170902fa8b00b001dc668e145asm1052267plb.200.2024.02.29.02.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 02:09:01 -0800 (PST)
Date: Thu, 29 Feb 2024 15:38:53 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/12] arm64: dts: qcom: sc8280xp: PCIe fixes and
 GICv3 ITS enable
Message-ID: <20240229100853.GA2999@thinkpad>
References: <20240223152124.20042-1-johan+linaro@kernel.org>
 <20240228220843.GA309344@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240228220843.GA309344@bhelgaas>

On Wed, Feb 28, 2024 at 04:08:43PM -0600, Bjorn Helgaas wrote:
> [+to Mani]
> 
> On Fri, Feb 23, 2024 at 04:21:12PM +0100, Johan Hovold wrote:
> > This series addresses a few problems with the sc8280xp PCIe
> > implementation.
> > ...
> 
> > A recent commit enabling ASPM on certain Qualcomm platforms introduced
> > further errors when using the Wi-Fi on the X13s as well as when
> > accessing the NVMe on the CRD. The exact reason for this has not yet
> > been identified, but disabling ASPM L0s makes the errors go away. This
> > could suggest that either the current ASPM implementation is incomplete
> > or that L0s is not supported with these devices.
> > ...
> 
> > As this series fixes a regression in 6.7 (which enabled ASPM) and fixes
> > a user-reported problem with the Wi-Fi often not starting at boot, I
> > think we should merge this series for the 6.8 cycle. The final patch
> > enabling the GIC ITS should wait for 6.9.
> > 
> > The DT bindings and PCI patch are expected to go through the PCI tree,
> > while Bjorn A takes the devicetree updates through the Qualcomm tree.
> > ...
> 
> > Johan Hovold (12):
> >   dt-bindings: PCI: qcom: Allow 'required-opps'
> >   dt-bindings: PCI: qcom: Do not require 'msi-map-mask'
> >   dt-bindings: PCI: qcom: Allow 'aspm-no-l0s'
> >   PCI: qcom: Add support for disabling ASPM L0s in devicetree
> 
> The ASPM patches fix a v6.7 regression, so it would be good to fix
> that in v6.8.
> 
> Mani, if you are OK with them, I can add them to for-linus for v6.8.  
> 
> What about the 'required-opps' and 'msi-map-mask' patches?  If they're
> important, I can merge them for v6.8, too, but it's late in the cycle
> and it's not clear from the commit logs why they shouldn't wait for
> v6.9.
> 

I'm checking with Qcom HW team on the ASPM behavior. So please hold off the ASPM
related patches until I get an answer. But 'required-opps' and 'msi-map-mask'
patches can be applied for 6.9 (not strictly fixing anything in 6.8).

- Mani

-- 
மணிவண்ணன் சதாசிவம்

