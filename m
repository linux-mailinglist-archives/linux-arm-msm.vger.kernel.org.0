Return-Path: <linux-arm-msm+bounces-44741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD10A092B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 14:58:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0EE81884C89
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 13:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27CC220E71D;
	Fri, 10 Jan 2025 13:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qnDL8Ogj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2DE4400;
	Fri, 10 Jan 2025 13:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736517525; cv=none; b=mWNFSQXT34mbnKa7ajCqoXUzJaWsPhqC8i9NlV759UjEJou2MgUp3H4LckDX/n/oRDZ8qZJ7ReBkrZRCM3uim6naNOYAK50srmmRLKz1amU8LkjjB2Z2GBgrq1FDiw5oKSiyeA9xmy2qDTQSpJ10ZrHft0LiT3bmh86UF7qPBZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736517525; c=relaxed/simple;
	bh=XAsMOZHVjLWiwYwZ4XWgtrLFfXOn9aVDTZPHs4WqG2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SH2g9KU/yYH1gMGGnbjH182zaLnOQX5PAn/Rce1M6KgYHR9fnmSjP9RaOb3OK+N/SoAqA1R3ihrqMfs94mE2K6+dBU+ogCrwASVFTvNXhETwa6+oCAuxFnr5clC3fe3gP/CmOPa8C2MdjW+A0nLarPfcUZmWi8gXAF0VI2Im/UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qnDL8Ogj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D415C4CED6;
	Fri, 10 Jan 2025 13:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736517524;
	bh=XAsMOZHVjLWiwYwZ4XWgtrLFfXOn9aVDTZPHs4WqG2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qnDL8Ogjh0lqfqkDcVSXHaZ6x2mjTvkcUbncmr9YAnLU00SSd/eDGST7jXuMQM2bp
	 MJM7a8fz+G1ZwiIfvLFdRwi7Sdi2QXLoOiU9TpgFUXGnJO1x8d2rInjKvaUQbpzNrP
	 rGX/Ho/iXuqv9VUGSDOAzKkuAmpOzeMHF2h7CDG4qVRRZcBHbXspQ/hvenMaHru2Q0
	 KDpiEGwTR29RRKCwRQooFR4tdvVQZLlZTSVbFRlr7uS9cWE165vJXiHOzyKDytrkF/
	 iB3D7OrCTbsaSx2WyZCfMKv3/49JIgtkFh6WCPDG8EKsXK2P9VzzhfH+f/AFtr60qP
	 R82HeuiFCeElg==
Date: Fri, 10 Jan 2025 07:58:43 -0600
From: Rob Herring <robh@kernel.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev,
	devicetree@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [RFC PATCH 2/6] dt-bindings: bus: Add qcom,soc-sc7180 SoC
Message-ID: <20250110135843.GA2630182-robh@kernel.org>
References: <20250108012846.3275443-1-swboyd@chromium.org>
 <20250108012846.3275443-3-swboyd@chromium.org>
 <7a64e927-235b-4d63-af59-f2c80464a9a1@oss.qualcomm.com>
 <CAE-0n53wX99ry88zOOuq6SPVpraiENheJ1T+HZri82x4gqZJ_w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n53wX99ry88zOOuq6SPVpraiENheJ1T+HZri82x4gqZJ_w@mail.gmail.com>

On Thu, Jan 09, 2025 at 01:51:12PM -0800, Stephen Boyd wrote:
> Quoting Konrad Dybcio (2025-01-09 06:05:14)
> > On 8.01.2025 2:28 AM, Stephen Boyd wrote:
> > > Document the Qualcomm SC7180 System on a Chip (SoC). This SoC is made up
> > > of multiple devices that have their own bindings, therefore this binding
> > > is for a "bus" that is the SoC node.
> > >
> > > TODO: Document all child nodes. This is woefully incomplete but at least
> > > shows what is involved with describing an SoC node in dt schema.
> >
> > I'm not sure I'm a fan, because...
> >
> > [...]
> >
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - const: qcom,soc-sc7180
> > > +      - const: simple-bus
> > > +
> > > +  '#address-cells':
> > > +    const: 2
> > > +
> > > +  '#size-cells':
> > > +    const: 2
> > > +
> > > +  clock-controller@100000:
> > > +    $ref: /schemas/clock/qcom,gcc-sc7180.yaml#

This makes the above schema be applied twice. Once here and then when 
the compatible matches. That can be avoided by just listing a 
compatible. The QCom display bindings follow that style.

> > > +
> > > +  watchdog@17c10000:
> > > +    $ref: /schemas/watchdog/qcom-wdt.yaml#
> > > +
> > > +required:
> > > +  - compatible
> > > +  - '#address-cells'
> > > +  - '#size-cells'
> > > +  - clock-controller@100000
> > > +  - watchdog@17c10000
> > > +
> > > +additionalProperties: false
> >
> > ..this approach will make any dt node addition under /soc require
> > an additional bindings change, which sounds like absolute madness
> 
> We should pretty much know what nodes go under here though, because it's
> a chip that exists and doesn't change after the fact. I agree that it
> will be annoying during early development when everyone is modifying the
> same file to add their node, but that problem also exists with the dts
> files today so it doesn't seem like total madness. It's also nice to be
> able to look at one file and quickly find all the schemas for the SoC
> used, like a table of contents almost or a memory map for the chip.

I don't really care for listing everything either.

We could just generate all the schemas used. Either "give me all the 
schemas matching some compatible patter" or "give me all the schemas 
used to validate the DTB". The latter was possible on a per node basis, 
but I think I dropped that when I changed how we select schemas to 
apply.

Speaking of memory maps, I would like a tool which could dump memory map 
from .dts. My primary reason is to find overlapping regions.

> One thing that I find annoying is that you have to put the whole soc
> node and child nodes in the example. Maybe we can omit the example
> because there are so many child nodes.
> 
> >
> > I think additionalProperties: true would be sufficient here, like in
> > Documentation/devicetree/bindings/soc/imx/imx8m-soc.yaml
> >

No. You can do:

additionalProperties:
  type: object

Or a patternProperties entry requiring '@' in the name.


> Ok. That binding looks to be for the efuse properties of the SoC node
> itself? I was hoping to find another example of this "describe the whole
> SoC" sort of binding but that doesn't match. Is there one already out
> there? Should I move this binding to bindings/soc/qcom instead of
> bindings/bus?

bindings/bus

The 'soc' nodes here aren't really for the whole SoC. Cpus aren't in 
the soc node. They are for buses. We should allow for there to be more 
than 1 for instance.

Rob

