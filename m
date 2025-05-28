Return-Path: <linux-arm-msm+bounces-59722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5CEAC6E07
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 18:30:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DBA9D7A757C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 16:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24D8328D8EA;
	Wed, 28 May 2025 16:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qM2hQoUQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE86B28D84D;
	Wed, 28 May 2025 16:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748449814; cv=none; b=TUDbZEfRBCrhA/ZL3BqfUKQ+B86PD2n/0T2sg4COXSMeeu9shroJmFX3SJDlpp5lR9Sl1Pm+9RMTsj09yXHOOBaNHV1OrnGMtONVOtmSfZJbSxXJtfnLwYEctUgsfS7Z2iS7XvurfzEFh8eH1SN9xxeEU7nsUrPgABwWbgvgIgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748449814; c=relaxed/simple;
	bh=7Ddco8Bs8XoPP7Sgox9+6gs/ynZ2ONDg+RF4XTZ26x8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=EDSZ1TC0qx4X4gUb5CYV61y4l2buIUet7B2xUkkmQmp2W1si3JhyiFJIkyzXWUSJYrLS2BjrhZvTFtMBOVVphpVYl3uR5Z49VJn7tHvv30rM3oD1ys7uuN2jkwAeCNRpbB6Md92Yf1zp9CIIgJs5JiwJmGWjVNtfVOshRkFGfjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qM2hQoUQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 124ACC4CEED;
	Wed, 28 May 2025 16:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748449813;
	bh=7Ddco8Bs8XoPP7Sgox9+6gs/ynZ2ONDg+RF4XTZ26x8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=qM2hQoUQRoa+sjl+Pd34UZ8gWk9fmaucPWGcXjz2hhNVtu0jQ7cosdxFBtew2i8mg
	 eijOPXuC37GVroVoy8qFYJdRZ3aDCMTDZklItaIlYhJ8t5NEmf1qVm2ilGq6R7toz/
	 C6PA5DLY5uu04KrGsgJ0TlP+fw+XBsxB+4MNt1njgkdHntLx2xQKKoQkTmnB3XbZ/x
	 zxQovxJHQ43ngRcCqoHp9z/4bxJJANwnF06U/+W7dnH6ZEuG0HU09oE6Fk9VecnkMG
	 XsKkKFXd9WxKXjMLxbuU/yVPLZUPXBDfDkckVDfPv81s9KyUBh7whN0nhQaq4IBR0H
	 f2dGfD0xkFkjg==
Date: Wed, 28 May 2025 11:30:11 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
 Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-clk@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
 Stephen Boyd <sboyd@kernel.org>, Eric Dumazet <edumazet@google.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <20250528-ipq5018-ge-phy-v2-2-dd063674c71c@outlook.com>
References: <20250528-ipq5018-ge-phy-v2-0-dd063674c71c@outlook.com>
 <20250528-ipq5018-ge-phy-v2-2-dd063674c71c@outlook.com>
Message-Id: <174844980913.122039.6315970844779589359.robh@kernel.org>
Subject: Re: [PATCH v2 2/5] dt-bindings: net: qca,ar803x: Add IPQ5018
 Internal GE PHY support


On Wed, 28 May 2025 18:45:48 +0400, George Moussalem wrote:
> Document the IPQ5018 Internal Gigabit Ethernet PHY found in the IPQ5018
> SoC. Its output pins provide an MDI interface to either an external
> switch in a PHY to PHY link scenario or is directly attached to an RJ45
> connector.
> 
> The PHY supports 10/100/1000 mbps link modes, CDT, auto-negotiation and
> 802.3az EEE.
> 
> For operation, the LDO controller found in the IPQ5018 SoC for which
> there is provision in the mdio-4019 driver. In addition, the PHY needs
> to take itself out of reset and enable the RX and TX clocks.
> 
> Two common archictures across IPQ5018 boards are:
> 1. IPQ5018 PHY --> MDI --> RJ45 connector
> 2. IPQ5018 PHY --> MDI --> External PHY
> In a phy to phy architecture, DAC values need to be set to accommodate
> for the short cable length. As such, add an optional boolean property so
> the driver sets the correct register values for the DAC accordingly.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  .../devicetree/bindings/net/qca,ar803x.yaml        | 52 +++++++++++++++++++++-
>  1 file changed, 51 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/qca,ar803x.example.dtb: ethernet-phy@7 (ethernet-phy-id004d.d0c0): clocks: [[4294967295, 36], [4294967295, 37]] is too long
	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250528-ipq5018-ge-phy-v2-2-dd063674c71c@outlook.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


