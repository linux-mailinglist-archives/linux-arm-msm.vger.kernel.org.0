Return-Path: <linux-arm-msm+bounces-59139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B1AAC1513
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 21:53:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C4B117ED5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 19:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4A832BF3C8;
	Thu, 22 May 2025 19:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QmdQ/BJ5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2E82BF3DC
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747943601; cv=none; b=A3u2L0I8LQ8KSwvby1SrNnlkWyGR8aCJwH5s0jA2Wr55mC1RtfGXstdwxoEVGH+TtraPr0m6A5diPni5TlL8lfq/oeGqb39g0znkToORwQjQ0iuSpFdJT0V8U86fpeTlB7li1ihl5+G/FX9/z/CJNckKwhAOZ9VuxHwPF/wYHXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747943601; c=relaxed/simple;
	bh=UFlponZZxYkww3GfGrUbDyL3TOTEiG2DwvWqSjHEQHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HIMlYjUCNp73YAWNYHmbOeV5pBz2IRYleDgiOX9J9NNeTm+oGeoFACDVf/9v1DunaOGt5pZJILPyjGwqpRJDXmxp1zeCJmJm55FVUqSPjYEtJFAyJTgrL/3EeJW8HEK/iWhD48ayjbwu1TMemQEFAHuDqE+c+50SD3XU42v1Exc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QmdQ/BJ5; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a36f26584bso3018274f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747943598; x=1748548398; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=scYVrd373I9MlT/u/1ycHxVnYL+MjqMEz6PW3HBMlFQ=;
        b=QmdQ/BJ5rzSEnUe/cuISyT0rNHokEz+1pxyuqth4AI3yKY39lNRhDBq1X9ll/kIyqJ
         WweDG4tzG36eWyaadreGR8LPoyqg04OroRT/LYTyfINjkEuoq1Ct8gJGsuQHDWsiqpYG
         wi1/3kX1ocuMCVApO+rkLupMCoK2jZ4hlXMJ7SWOhpQU8uuQA5BDsf3ISDchPy+tPJvy
         NHtOBp+YGJLNjnoht6Au+gDBstbfzIYYYulvNBMtUXFzNZfwEfNATtXr3xh9zcYqILj0
         G5ewoktA/95yXDTQLBsclmU+7h9NuV+cu6HouE/LwWOTg9S+bbulU6y+dUch1Wt9BAc4
         0DcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747943598; x=1748548398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=scYVrd373I9MlT/u/1ycHxVnYL+MjqMEz6PW3HBMlFQ=;
        b=jAiM86CjXcJZgjgsoSabSTfO+30oiB57BjMqyeARlAPRtYRaFwjRgCfj9iqJ49nmNG
         EspBKzUlipf6a0efFB6P6lxcCbrDrFFks+48y3rtj6lbdWLspKKRaUjOORHLmiiyBObu
         g14M2x3IGO6QPDoocM2MyxhSQ4JdobR02SHS7MRImmi87ACNsGWSLn1YslYmwIG1GNI0
         CpZ4PyX6wp/GSqFfPGu7ovBPmDokN/rJGOGu675FGB56weZHju2eL0TLby23BQvZYfnn
         lc4HZImaLNgxj7LfnwPgA4JaQN22GhuOB8/MRLX5iz70IDyDagKnZkepy6grRTxN+kzH
         1bLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVppukxThn81TLZGh/IvIIJ26vRx+K+b+/uotwflOexuGEaNnhM/VTZHOLE1yo3gzd/YH0KPQByoJYCQ0eJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtzb466dRS03yD3T7hc2zMbEnpeDZW18uZ7PKVLKy2CNYX4uze
	QEWPecwYvnbcdLIt8ytebHyUVX2WiEJ+nAJ+/zVFArTRJ5V9nUW4h3Bso9ppQ0H+99U=
X-Gm-Gg: ASbGnctQ3GhhR1/j0GqKmkYS7CjDC8WoaWBhergewycI0VXfBJaexy1HoDNWHhJSAe4
	BXs6NWv0+DCDGOn/M/ACx9jKDpAjOAxnhbYPTZ7NkjrWAneTGhfVsC1FOHJcNIMPtRaMPQhsc7k
	CB9NIAAzqrvburJV1XxzXLgBRZVY0g4KT0RLna3kHKgYsjPnZXlYKJSfpgP7I40AImtzhSBsW4x
	8DHdkiNIcrq7Q41AmBh0sdX8O/Kew9vZr5kAxGRr99FJj+k9tL/JSHC7HSetRQS++WhQotyIgzt
	6jEx4PK51iUX4ySV4q9gKGmS/j0lMtmVlUp1qiZmzuTOTlgNMmk6PM7pv0fVL28=
X-Google-Smtp-Source: AGHT+IE27jiIBztRmaRAQVYdgJQjQilKzkMOn7fyKdg3PUi22O9+0AG/mjYx8r/1u1nyhyVc9L73hA==
X-Received: by 2002:a05:6000:2281:b0:3a3:7be3:cba9 with SMTP id ffacd0b85a97d-3a37be3cebdmr9684954f8f.18.1747943597543;
        Thu, 22 May 2025 12:53:17 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:c340:2dcf:7e37:1be8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f1ef01besm115280035e9.10.2025.05.22.12.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:53:17 -0700 (PDT)
Date: Thu, 22 May 2025 21:53:12 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Saravana Kannan <saravanak@google.com>
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
Message-ID: <aC-AqDa8cjq2AYeM@linaro.org>
References: <20250506-qcom-apcs-mailbox-cc-v1-0-b54dddb150a5@linaro.org>
 <20250506-qcom-apcs-mailbox-cc-v1-1-b54dddb150a5@linaro.org>
 <7vszdea2djl43oojvw3vlrip23f7cfyxkyn6jw3wc2f7yowht5@bgsc2pqscujc>
 <aCNGSwL7043GoJBz@linaro.org>
 <20250514160841.GA2427890-robh@kernel.org>
 <aCUHTJGktLFhXq4Q@linaro.org>
 <20250521-psychedelic-cute-grouse-ee1291@kuoka>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521-psychedelic-cute-grouse-ee1291@kuoka>

+Saravana

On Wed, May 21, 2025 at 11:20:40AM +0200, Krzysztof Kozlowski wrote:
> On Wed, May 14, 2025 at 10:12:44PM GMT, Stephan Gerhold wrote:
> > > > > > The mailbox itself does not need any clocks and should probe early to
> 
> ... so probe it early.
> 
> > > > > > unblock the rest of the boot process. The "clocks" are only needed for the
> > > > > > separate clock controller. In Linux, these are already two separate drivers
> > > > > > that can probe independently.
> 
> They can probe later, no problem and DT does not stop that. Linux, not
> DT, controls the ways of probing of devices and their children.
> 
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
> > consumed at all by the mailbox and needed immediately to initialize the
> > clock controller. The real problem in my opinion is that we're
> > describing two essentially distinct devices/drivers in a single device
> > node, and there is no way to distinguish that.
> > 
> > By splitting up the two distinct components into separate device tree
> > nodes, the relation between the providers/consumers is clearly
> > described.
> 
> You can split devices without splitting the nodes. I do not see reason
> why the DT is the problem here.
> 

The Linux drivers for this particular mailbox/clock controller already
work exactly the way you propose. They are split into two devices that
can probe independently.

The problem is outside of the drivers, because fw_devlink in Linux
blocks probing until all resources specified in the device tree nodes
become available. fw_devlink has no knowledge that the mailbox described
by this peculiar device tree node does not actually need the clocks:

	apcs1_mbox: mailbox@b011000 {
		compatible = "qcom,msm8939-apcs-kpss-global", "syscon";
		reg = <0x0b011000 0x1000>;
		#mbox-cells = <1>;
		clocks = <&a53pll_c1>, <&gcc GPLL0_VOTE>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
		clock-names = "pll", "aux", "ref";
		#clock-cells = <0>;
	};

Without device-specific quirks in fw_devlink, the fact that these clocks
are only used by an unrelated clock controller only becomes clear if we
split the device tree node like I propose in this series:

	apcs1_mbox: mailbox@b011000 {
		compatible = "qcom,msm8939-apcs-kpss-global", "syscon";
		reg = <0x0b011000 0x1000>;
		#mbox-cells = <1>;

		apcs1_clk: clock-controller {
			clocks = <&a53pll_c1>, <&gcc GPLL0_VOTE>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
			clock-names = "pll", "aux", "ref";
			#clock-cells = <0>;
		};
	};

It is easy to say that the problem is in Linux (and not the DT), but
unless you are suggesting to remove fw_devlink from Linux, or to add
more device-specific quirks to the generic fw_devlink code, I'm only
aware of the following two options to make this work (both already
discussed in this email thread):

 1. post-init-providers (as suggested by Rob):

		post-init-providers = <&a53pll_c1>, <&gcc>, <&rpmcc>;

    To repeat my previous email: IMHO this is a crude workaround for
    this situation. The clock is not really a post-init provider: It's
    not consumed at all by the mailbox and needed immediately to
    initialize the clock controller.

    With this approach, there are no device links created for the
    clocks, so we don't get the proper probe/suspend ordering that
    fw_devlink normally provides.

 2. Split up device tree node (this patch series): With this approach,
    the mailbox can probe early and the clock controller child device
    gets the expected consumer/supplier device links to the clocks. IMHO
    this is the cleanest solution to go for.

@Saravana: Is there any other option that I missed? Or perhaps you have
any other suggestions how we should handle this?

To summarize the series and previous emails, the dependency cycle that
was in msm8939.dtsi before commit d92e9ea2f0f9 ("arm64: dts: qcom:
msm8939: revert use of APCS mbox for RPM") is:

  1. The clock controller inside &apcs1_mbox needs
     clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>.
  2. &rpmcc is a child of remoteproc &rpm
  3. remoteproc &rpm needs mboxes = <&apcs1_mbox 8>;

This is not a real dependency cycle, the clocks in the mailbox@ node are
not needed for the mailbox. They are only used and needed for the clock
controller child device that makes use of the same device tree node.

At runtime this cycle currently results in none of the devices probing:

[   13.281637] platform remoteproc: deferred probe pending: qcom-rpm-proc: Failed to register smd-edge
[   13.296257] platform b011000.mailbox: deferred probe pending: platform: supplier b016000.clock not ready
[   13.308397] platform b016000.clock: deferred probe pending: platform: wait for supplier /remoteproc/smd-edge/rpm-requests/clock-controller

Thanks,
Stephan

