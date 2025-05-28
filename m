Return-Path: <linux-arm-msm+bounces-59748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9A9AC73BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 00:13:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 567F89E776A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 22:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 487A521CA1C;
	Wed, 28 May 2025 22:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C3PMepjo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD881DFFC;
	Wed, 28 May 2025 22:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748470415; cv=none; b=FpU4Tb5x1PXtGV/IgAZyq/rhJF1a3sBQm+feBhZ+YBZfnFVV9FqGiYsUIpuHHl7by3Jz5Yu6qMQTcDvibnQ/Mdw2TZ2QSWyfoqHGoDhUhgeoMrtcW2V9CG5KElbG1r+tKhDrh8W8XJJAGGW9lB5e6cWHQs/rdeAUm14FxxErEtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748470415; c=relaxed/simple;
	bh=FFixiD6CWexuWWAc/vkRspwDcAhH5LtSZ12dUKV7hE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C9IK6VhGjMKg7y4rwT27ZBQZN5QGglDB7JnyrSdRFMFke9QtF+LfLAD4IG5O40GMNOq8JCvC92h/g1juwGrLe2P30XYNvAN3VD68ADhkiAqn+IXAtlZYNosygbUe77+18+3RIO9ExHwEkTvlSeV0p5nDVK9mL9j4c+ewp5Td7LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C3PMepjo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40082C4CEE3;
	Wed, 28 May 2025 22:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748470414;
	bh=FFixiD6CWexuWWAc/vkRspwDcAhH5LtSZ12dUKV7hE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C3PMepjoQrqneKfB199dlEwGYYOL3JdVq6BLsQ/5Y08O/Jmg4zN8NeJg8BmlLYmZs
	 ZNWdGjuw/Dl4Y4llpRj9y26stNCk2oy5PsdsHiq5PY0ztWOBjto63ZcYb5+gQKut0e
	 dDd5+gaGzbTlE/Y0H3sGi+cdnV1WzUs2jkniTxR28HOLRfT241BeDs8YPFhG7Iyyt+
	 rcdH0yE9cpm61u6A7TsFsXaJF14n8sh5BxGfdoHsmEg/Du7VVTsxjgAe+QTF3fovuJ
	 Hj69WkFIZIhP8c0E3g4jZ9lo+EeZYKSzGCGGCko9bBU/gJMZIg7HmJD/i4KZfrfV7W
	 WVZrtUd6ulZ0A==
Date: Wed, 28 May 2025 17:13:32 -0500
From: Rob Herring <robh@kernel.org>
To: George Moussalem <george.moussalem@outlook.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>, Eric Dumazet <edumazet@google.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 2/5] dt-bindings: net: qca,ar803x: Add IPQ5018
 Internal GE PHY support
Message-ID: <20250528221332.GA865966-robh@kernel.org>
References: <20250528-ipq5018-ge-phy-v2-0-dd063674c71c@outlook.com>
 <20250528-ipq5018-ge-phy-v2-2-dd063674c71c@outlook.com>
 <174844980913.122039.6315970844779589359.robh@kernel.org>
 <DS7PR19MB8883581EF8CD829910D3C1C29D67A@DS7PR19MB8883.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS7PR19MB8883581EF8CD829910D3C1C29D67A@DS7PR19MB8883.namprd19.prod.outlook.com>

On Wed, May 28, 2025 at 08:59:45PM +0400, George Moussalem wrote:
> Hi Rob,
> 
> On 5/28/25 20:30, Rob Herring (Arm) wrote:
> > 
> > On Wed, 28 May 2025 18:45:48 +0400, George Moussalem wrote:
> > > Document the IPQ5018 Internal Gigabit Ethernet PHY found in the IPQ5018
> > > SoC. Its output pins provide an MDI interface to either an external
> > > switch in a PHY to PHY link scenario or is directly attached to an RJ45
> > > connector.
> > > 
> > > The PHY supports 10/100/1000 mbps link modes, CDT, auto-negotiation and
> > > 802.3az EEE.
> > > 
> > > For operation, the LDO controller found in the IPQ5018 SoC for which
> > > there is provision in the mdio-4019 driver. In addition, the PHY needs
> > > to take itself out of reset and enable the RX and TX clocks.
> > > 
> > > Two common archictures across IPQ5018 boards are:
> > > 1. IPQ5018 PHY --> MDI --> RJ45 connector
> > > 2. IPQ5018 PHY --> MDI --> External PHY
> > > In a phy to phy architecture, DAC values need to be set to accommodate
> > > for the short cable length. As such, add an optional boolean property so
> > > the driver sets the correct register values for the DAC accordingly.
> > > 
> > > Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> > > ---
> > >   .../devicetree/bindings/net/qca,ar803x.yaml        | 52 +++++++++++++++++++++-
> > >   1 file changed, 51 insertions(+), 1 deletion(-)
> > > 
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/qca,ar803x.example.dtb: ethernet-phy@7 (ethernet-phy-id004d.d0c0): clocks: [[4294967295, 36], [4294967295, 37]] is too long
> > 	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
> > 
> > doc reference errors (make refcheckdocs):
> > 
> > See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250528-ipq5018-ge-phy-v2-2-dd063674c71c@outlook.com
> > 
> > The base for the series is generally the latest rc1. A different dependency
> > should be noted in *this* patch.
> > 
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> > 
> > pip3 install dtschema --upgrade
> > 
> > Please check and re-submit after running the above command yourself. Note
> > that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> > your schema. However, it must be unset to test all examples with your schema.
> > 
> 
> 
> Really weird, I've checked this numerous times:
> 
> (myenv) george@sl2-ubuntu:~/src/linux-next$ make dt_binding_check
> DT_SCHEMA_FILES=qca,ar803x.yaml
>   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>   CHKDT   ./Documentation/devicetree/bindings
>   LINT    ./Documentation/devicetree/bindings
>   DTEX    Documentation/devicetree/bindings/net/qca,ar803x.example.dts
>   DTC [C] Documentation/devicetree/bindings/net/qca,ar803x.example.dtb
> (myenv) george@sl2-ubuntu:~/src/linux-next$ pip3 install dtschema --upgrade
> Requirement already satisfied: dtschema in
> /home/george/myenv/lib/python3.12/site-packages (2025.2)
> Requirement already satisfied: ruamel.yaml>0.15.69 in
> /home/george/myenv/lib/python3.12/site-packages (from dtschema) (0.18.10)
> Requirement already satisfied: jsonschema<4.18,>=4.1.2 in
> /home/george/myenv/lib/python3.12/site-packages (from dtschema) (4.17.3)
> Requirement already satisfied: rfc3987 in
> /home/george/myenv/lib/python3.12/site-packages (from dtschema) (1.3.8)
> Requirement already satisfied: pylibfdt in
> /home/george/myenv/lib/python3.12/site-packages (from dtschema) (1.7.2)
> Requirement already satisfied: attrs>=17.4.0 in
> /home/george/myenv/lib/python3.12/site-packages (from
> jsonschema<4.18,>=4.1.2->dtschema) (25.3.0)
> Requirement already satisfied: pyrsistent!=0.17.0,!=0.17.1,!=0.17.2,>=0.14.0
> in /home/george/myenv/lib/python3.12/site-packages (from
> jsonschema<4.18,>=4.1.2->dtschema) (0.20.0)
> Requirement already satisfied: ruamel.yaml.clib>=0.2.7 in
> /home/george/myenv/lib/python3.12/site-packages (from
> ruamel.yaml>0.15.69->dtschema) (0.2.12)
> (myenv) george@sl2-ubuntu:~/src/linux-next$ make dt_binding_check
> DT_SCHEMA_FILES=qca,ar803x.yaml
>   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>   CHKDT   ./Documentation/devicetree/bindings
>   LINT    ./Documentation/devicetree/bindings
>   DTEX    Documentation/devicetree/bindings/net/qca,ar803x.example.dts
>   DTC [C] Documentation/devicetree/bindings/net/qca,ar803x.example.dtb
> 
> I only found the same errors when removing the DT_SCHEMA_FILES property.

Correct.

> Is that because ethernet-phy.yaml is a catch-all based on the pattern on the
> compatible property (assuming my understanding is correct)? How would we get
> around that without modifying ethernet-phy.yaml only for this particular PHY
> (with a condition)? This PHY needs to enable two clocks and the restriction
> is on 1.

It's kind of a mess since ethernet phys didn't have compatibles 
frequently and then there was resistance to adding compatibles. You know 
we don't need compatibles because phys are discoverable and all. Well, 
except for everything we keep adding for them in DT like clocks...

We probably need to split out common phy properties to its own schema. 
And then add a schema just for phys with no compatible string (so 
'select' needs to match on $nodename with ethernet-phy as now, but also 
have 'not: { required: [compatible] }'. And then a schema for the 
'generic' phys with just ethernet-phy-ieee802.3-c22 or 
ethernet-phy-ieee802.3-c45. Then we'll have to look at what to do with 
ones with "^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$" compatibles. 
Probably, we need to add specific id's to the generic schema or in their 
own schemas.

Or we can just change clocks in ethernet-phys.yaml to:

minItems: 1
maxItems: 2

And kick that can down the road...

Rob

