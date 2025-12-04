Return-Path: <linux-arm-msm+bounces-84410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EDDCA4F7D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 19:42:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16AFD309E2B5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 18:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB7AF34DB76;
	Thu,  4 Dec 2025 18:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hcihNh/G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9102134DB6E;
	Thu,  4 Dec 2025 18:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764873343; cv=none; b=IgzwuXZnHcPniJqho2vIFf3phA74vqrLX4jlGM1DPrIG4DBZcn9HSo2EDVEfPVk7ZsFEkw8CGrgG7rGd3AnAlr1qm30iYSIHzpjr5LMpJE27XAmywEK4aCOLy5049P7g63cWW2ANVg7Q8dAOGATNuRVRBRgYoXWXoCfSEEaufL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764873343; c=relaxed/simple;
	bh=tEylYSei33M1XBl8PJHnxTIUreXZOvA8TltwN1iYV8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OMJ7mnPwOe1DYhj9mE1NgpmUgvYB4EARrwbNA3mxZHfvutN73ihs5vOT9gDRFOuSYw3QTcGk7NFKI7oy3joBaE9T/UUm/XGRsj1F8KTWsem1Docwyltwlp2mBkB2HRmBfj3X7Hd6kAZMZ5bPhcX9j41oEf5XPUdq7exB/InBN1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hcihNh/G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 321F0C4CEFB;
	Thu,  4 Dec 2025 18:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764873343;
	bh=tEylYSei33M1XBl8PJHnxTIUreXZOvA8TltwN1iYV8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hcihNh/GYAZ8COxL8Npkxqz9He0OSgwgodLKdCc2hv1T0w0XiwzYLy7uON4Zb3BWv
	 xVdgz5TT+6owWqYLNnDCQjVL/ugXVSW14VUSr0PNnZ9GLJyYZTjECXP7JCpEnOjAUb
	 CilTPZ8MUWX5BO/z+lJ7gTX1gVuNHAY8YIp5TsWAbHpmKStR2GhESPsOiVODL2Zvle
	 6GE1S+HE7nz8WrPYwVPyLtBfP9taDRWdXsgPb+x170B0DaqkldzA+m/0pl10hOLRpe
	 yR5txubsAWNhoQUABOWjX/Z1PrKSI2HMl7kY8pTSWB1/oRvy27F3xRDwM1U5yFThY6
	 dUQjwHHYFWfkA==
Date: Thu, 4 Dec 2025 12:35:41 -0600
From: Rob Herring <robh@kernel.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Antoine Tenart <atenart@kernel.org>, mwojtas@chromium.org,
	netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Eric Dumazet <edumazet@google.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com,
	davem@davemloft.net, Florian Fainelli <f.fainelli@gmail.com>,
	linux-kernel@vger.kernel.org,
	Romain Gantois <romain.gantois@bootlin.com>,
	devicetree@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>, Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net-next v21 01/14] dt-bindings: net: Introduce the
 ethernet-connector description
Message-ID: <20251204183541.GA1936817-robh@kernel.org>
References: <20251129082228.454678-1-maxime.chevallier@bootlin.com>
 <20251129082228.454678-2-maxime.chevallier@bootlin.com>
 <176440811455.3523222.6418355134728802633.robh@kernel.org>
 <5dc32a3f-42d8-43d7-854b-3cf11c05544c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5dc32a3f-42d8-43d7-854b-3cf11c05544c@kernel.org>

On Sat, Nov 29, 2025 at 12:40:15PM +0100, Christophe Leroy (CS GROUP) wrote:
> 
> 
> Le 29/11/2025 à 10:21, Rob Herring (Arm) a écrit :
> > 
> > On Sat, 29 Nov 2025 09:22:13 +0100, Maxime Chevallier wrote:
> > > The ability to describe the physical ports of Ethernet devices is useful
> > > to describe multi-port devices, as well as to remove any ambiguity with
> > > regard to the nature of the port.
> > > 
> > > Moreover, describing ports allows for a better description of features
> > > that are tied to connectors, such as PoE through the PSE-PD devices.
> > > 
> > > Introduce a binding to allow describing the ports, for now with 2
> > > attributes :
> > > 
> > >   - The number of pairs, which is a quite generic property that allows
> > >     differentating between multiple similar technologies such as BaseT1
> > >     and "regular" BaseT (which usually means BaseT4).
> > > 
> > >   - The media that can be used on that port, such as BaseT for Twisted
> > >     Copper, BaseC for coax copper, BaseS/L for Fiber, BaseK for backplane
> > >     ethernet, etc. This allows defining the nature of the port, and
> > >     therefore avoids the need for vendor-specific properties such as
> > >     "micrel,fiber-mode" or "ti,fiber-mode".
> > > 
> > > The port description lives in its own file, as it is intended in the
> > > future to allow describing the ports for phy-less devices.
> > > 
> > > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> > > Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > > Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > > ---
> > >   .../bindings/net/ethernet-connector.yaml      | 57 +++++++++++++++++++
> > >   .../devicetree/bindings/net/ethernet-phy.yaml | 18 ++++++
> > >   MAINTAINERS                                   |  1 +
> > >   3 files changed, 76 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/net/ethernet-connector.yaml
> > > 
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> > Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> > Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> > Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> 
> Those errors are unrelated to the blamed patch, the patch is about Ethernet
> the error is about thermal-sensors.

There was an assumption that the base (generally linux-next if not 
defined) works. That unfortunately was not the case when a patch applied 
introduced a tab char presumably as part of conflict resolution. So now 
almost every patch fails. Applying the months old patch was timed 
perfectly with my disappearing for US holidays as well as the merge 
window because as an added bonus it went into Linus' tree too. Anyways, 
Linus' tree and today's next are fixed now. The automated testing now 
aborts if the base has issues, so this shouldn't happen again (it will 
be for other reasons). So most of the patches aren't getting tested now 
until folks move of the broken linux-next versions.  

And thanks to all this, now Linus wants to change all kernel YAML files 
over to tabs instead. That's been my week...

Rob

