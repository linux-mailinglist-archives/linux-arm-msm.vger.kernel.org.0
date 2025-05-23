Return-Path: <linux-arm-msm+bounces-59186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3126AAC1F10
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 10:59:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D80EA174EAC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 08:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7908922157A;
	Fri, 23 May 2025 08:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t00kL/Pe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636C51DB366
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 08:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747990758; cv=none; b=u7aGoz6cpd47l6FqCBGIkTiKQ3gOD4rwt4Tp7q8hX5GmduoRuZEaRvspBv0dgMAvJ0/FmjfWigs8Fl7HRTfHna58V9DNyOoSaXXt9f1W2MAfkeO1ldbWCGbNyq6LRjLJzbQF+NisqjOwWEMQJchFOc7KJRCJfYERQwaPCgKVAQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747990758; c=relaxed/simple;
	bh=8nIPKcbxUc08zrJ5dh3+DyPSHuuWmJSl5snApphxvDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iAvhCmDosIVSvq/LijLbvTDSPeRvTjHncKTuiphvDWw50Jpgeje5GpE6iJXdtI1oDzpPNS99LVV0LNEBAIFWhxmY3YgC9nrvHySelgLUoGBJkrC/Hm4BtNcWNz7we57bzhAgoZ56w9yaGIWiKzsAtdgmB9PfQODbeWjTZxVZmJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t00kL/Pe; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6016d401501so12436513a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 01:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747990755; x=1748595555; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=stQGbKNOmre948PSNk4Bs17jnwGL+MBsxPrH/ncfoxc=;
        b=t00kL/PeufASgZEJuF85GzkPo2i5aaWUX6cHJvPjAYcq08+wJMMNRx4YHLSQ2KW6Dq
         Qjdh2YdCUfgCi3XUHxwvJFquAmZPZRjn8QWzfxPx4wX5aAG11h3CwWEYC4F9TdUxckUO
         J9cc0LKBsdtReeW5ZDCsGtw1s8WQaqVxUShUvrD5b0zLKGkIeNdKq97KcXHkVT4om/oW
         qce3tOm+64ZIPEDdtHrLvuauMs8ujVq7N6ZRdIHab95FFdFV8YaLlpsMJl6LmyJMivEC
         dedPNjRVfBFyiwyj/3SjnYKuck7zeEcvACMcm+dKK9bCjC0WjAwi46VHB1xU5hnWTiKZ
         1+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747990755; x=1748595555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stQGbKNOmre948PSNk4Bs17jnwGL+MBsxPrH/ncfoxc=;
        b=BHteig/58/fDLjH2YPQa4NbcqbwakklUhUqPYadanondSdmbvO+19wt+/oAGQHPhfo
         0BtQkn/Ol3NKnF0Mj3lc8eSfERelxmO+IUR1p7k95hMVB+IW1gwYTMu854BSct/rkwcE
         uDk7jMDhB2a4SB67LicA1jCUJOlKjHVfaTLBdbxxujLYeQy63cFntKtJWo4ME74XFOA7
         3xjIIdStIwXJmnNxPkBD/j2r/h9HWoLreF6F02vjdHrWg0d38T56ORCxShUWmq0ywwOg
         QMtfDrCes7+QOnWH5iZToIGU6sA701oJMU7nI8KybuYbsO9OZMDQYkPKW6QbbxmlZTav
         y3rw==
X-Forwarded-Encrypted: i=1; AJvYcCVQf4zVFFM49sVnVa1CI/wK2n1UXnoGd4o6vxaISm+wajZbhzCszIYBDO5XJPb8znFhtyT/oc62QVHKhlIH@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/95D1taKfN+2uoEtZmCipGQ3828io1KO2rz3S9qTkvgMWDXx8
	5wnElCwQCAR76R87tqORQW554QyputzMFgqsLTVU78MXTcnDYe/Iqi+puuFBY7VIVxQ=
X-Gm-Gg: ASbGncs44plGlvVszR+xZEhsTic62w71dTWDCfvcdjWAK2FTIQTc2QcRhOf0GmnaVqt
	8qCSvRr6QV7SbwLBlXC48Mie3XhQlfFtk2rCWtg+BLh/aVPgj+mGj/5OXJ+ut7lJftKV3XXfrp1
	eKO5aPz1JgFsW7FYn2MbnkJokHYYC9RD140pDMhPKC2Is3hAptVBBtYGrekHptSivlldBw9w4jy
	VU7KdnrGCSdZ9VX4EyJl0RwBXsQNadf2akmfH88hJGwuyh/CRa/g27+Hv4rHD10q2jMgpoI4X2c
	8fp9kfpiertq72kfRSkRHdDhcRqYxyZFzw7hmT6LjOqtx2rvI2ciUCykefHXqss=
X-Google-Smtp-Source: AGHT+IEZB6pb8qzCvtbrWXEhxWzERNsp1Y4jhHk1e698FW+co9usbzcUdi7j4FxgD7upZFmBeddP0g==
X-Received: by 2002:a17:907:7245:b0:ad2:5499:7599 with SMTP id a640c23a62f3a-ad708449966mr169123566b.18.1747990754401;
        Fri, 23 May 2025 01:59:14 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:845b:bbb4:b39e:a452])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6020e441c84sm5562670a12.38.2025.05.23.01.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 01:59:13 -0700 (PDT)
Date: Fri, 23 May 2025 10:59:11 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, Georgi Djakov <djakov@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 1/4] dt-bindings: mailbox: qcom,apcs: Add separate node
 for clock-controller
Message-ID: <aDA42BQHLvfVO_Gp@linaro.org>
References: <20250506-qcom-apcs-mailbox-cc-v1-0-b54dddb150a5@linaro.org>
 <20250506-qcom-apcs-mailbox-cc-v1-1-b54dddb150a5@linaro.org>
 <7vszdea2djl43oojvw3vlrip23f7cfyxkyn6jw3wc2f7yowht5@bgsc2pqscujc>
 <aCNGSwL7043GoJBz@linaro.org>
 <20250514160841.GA2427890-robh@kernel.org>
 <aCUHTJGktLFhXq4Q@linaro.org>
 <20250523-curvy-ubiquitous-cicada-eac1a1@kuoka>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-curvy-ubiquitous-cicada-eac1a1@kuoka>

On Fri, May 23, 2025 at 10:42:01AM +0200, Krzysztof Kozlowski wrote:
> On Wed, May 14, 2025 at 10:12:44PM GMT, Stephan Gerhold wrote:
> > On Wed, May 14, 2025 at 11:08:41AM -0500, Rob Herring wrote:
> > > On Tue, May 13, 2025 at 02:16:59PM +0100, Stephan Gerhold wrote:
> > > > On Sun, May 11, 2025 at 05:48:11PM -0500, Bjorn Andersson wrote:
> > > > > On Tue, May 06, 2025 at 03:10:08PM +0200, Stephan Gerhold wrote:
> > > > > > APCS "global" is sort of a "miscellaneous" hardware block that combines
> > > > > > multiple registers inside the application processor subsystem. Two distinct
> > > > > > use cases are currently stuffed together in a single device tree node:
> > > > > > 
> > > > > >  - Mailbox: to communicate with other remoteprocs in the system.
> > > > > >  - Clock: for controlling the CPU frequency.
> > > > > > 
> > > > > > These two use cases have unavoidable circular dependencies: the mailbox is
> > > > > > needed as early as possible during boot to start controlling shared
> > > > > > resources like clocks and power domains, while the clock controller needs
> > > > > > one of these shared clocks as its parent. Currently, there is no way to
> > > > > > distinguish these two use cases for generic mechanisms like fw_devlink.
> > > > > > 
> > > > > > This is currently blocking conversion of the deprecated custom "qcom,ipc"
> > > > > > properties to the standard "mboxes", see e.g. commit d92e9ea2f0f9
> > > > > > ("arm64: dts: qcom: msm8939: revert use of APCS mbox for RPM"):
> > > > > >   1. remoteproc &rpm needs mboxes = <&apcs1_mbox 8>;
> > > > > >   2. The clock controller inside &apcs1_mbox needs
> > > > > >      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>.
> > > > > >   3. &rpmcc is a child of remoteproc &rpm
> > > > > > 
> > > > > > The mailbox itself does not need any clocks and should probe early to
> > > > > > unblock the rest of the boot process. The "clocks" are only needed for the
> > > > > > separate clock controller. In Linux, these are already two separate drivers
> > > > > > that can probe independently.
> > > > > > 
> > > > > 
> > > > > Why does this circular dependency need to be broken in the DeviceTree
> > > > > representation?
> > > > > 
> > > > > As you describe, the mailbox probes and register the mailbox controller
> > > > > and it registers the clock controller. The mailbox device isn't affected
> > > > > by the clock controller failing to find rpmcc...
> > > > > 
> > > > 
> > > > That's right, but the problem is that the probe() function of the
> > > > mailbox driver won't be called at all. The device tree *looks* like the
> > > > mailbox depends on the clock, so fw_devlink tries to defer probing until
> > > > the clock is probed (which won't ever happen, because the mailbox is
> > > > needed to make the clock available).
> > > > 
> > > > I'm not sure why fw_devlink doesn't detect this cycle and tries to probe
> > > > them anyway, but fact is that we need to split this up in order to avoid
> > > > warnings and have the supplies/consumers set up properly. Those device
> > > > links are created based on the device tree and not the drivers.
> > > 
> > > Does "post-init-providers" providers solve your problem?
> > > 
> > 
> > I would expect that it does, but it feels like the wrong solution to the
> > problem to me. The clock is not really a post-init provider: It's not
> 
> But the entire node (so the mbox containing clocks) is a provider. This
> looks exactly like the case for post-init or do I miss here something.
> First, I do not see circular dependencies in the DT.
> 

Please see my reply from yesterday, I have explained the disadvantages
of using post-init-provider there and also showed the problematic
circular dependency again [1].

Thanks,
Stephan

[1]: https://lore.kernel.org/linux-arm-msm/aC-AqDa8cjq2AYeM@linaro.org/


