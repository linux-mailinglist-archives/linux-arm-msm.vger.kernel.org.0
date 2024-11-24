Return-Path: <linux-arm-msm+bounces-38983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 460F19D7854
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 22:27:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3313B22068
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 21:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65F03155A2F;
	Sun, 24 Nov 2024 21:27:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594B42500AA;
	Sun, 24 Nov 2024 21:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732483645; cv=none; b=evfSIWO5gZzi/C6ROE/rbkmrS5z7j5ecByWK8M3lWwhNfEbiYMuY2ZgME34IfFCI7/fGkCeQSa93FgHZSux8PL5jYqyVLbGEXv5YGM9QIh5Sb15EluHt+MLJD4Z1yxnzCMhMtbYfosr6G8hQ6QDpz08XM4WPv+gF8hpbdh9mlzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732483645; c=relaxed/simple;
	bh=q0zFXd4JS29b9+I/dNk67ZUXr84q4C+lpXjI7/mm3SA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N9x+dW4XTh59ZRuvEJiMFt7vxBs2VkW+byr+mOek2Ua0l7I/aPX9Znq+SGVo128teynIbiSPW1nQ5PmmPOSPS5DJ3NtRjq3T+JWIe8+aZibO/R609958+5tX+hD7y0mp9NSKkTKHw3mrrHzCW15LkLDP3pDlLu70C1wo3elwzy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id BA7F12008A6;
	Sun, 24 Nov 2024 22:27:14 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A3260200464;
	Sun, 24 Nov 2024 22:27:14 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 5A97E203C1;
	Sun, 24 Nov 2024 22:27:13 +0100 (CET)
Date: Sun, 24 Nov 2024 22:27:14 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jose Abreu <joabreu@synopsys.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Russell King <linux@armlinux.org.uk>,
	Minda Chen <minda.chen@starfivetech.com>,
	linux-arm-msm@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	linux-stm32@st-md-mailman.stormreply.com,
	Shawn Guo <shawnguo@kernel.org>,
	Quan Nguyen <quan@os.amperecomputing.com>,
	Vinod Koul <vkoul@kernel.org>,
	Iyappan Subramanian <iyappan@os.amperecomputing.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>, imx@lists.linux.dev,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrew Lunn <andrew@lunn.ch>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Keyur Chudgar <keyur@os.amperecomputing.com>,
	Fabio Estevam <festevam@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	NXP S32 Linux Team <s32@nxp.com>
Subject: Re: [PATCH v5 13/16] dt-bindings: net: Add DT bindings for DWMAC on
 NXP S32G/R SoCs
Message-ID: <Z0OaMjw0A4OadZfI@lsv051416.swis.nl-cdc01.nxp.com>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
 <20241119-upstream_s32cc_gmac-v5-13-7dcc90fcffef@oss.nxp.com>
 <173203348678.1765163.1636321988738538785.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173203348678.1765163.1636321988738538785.robh@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Tue, Nov 19, 2024 at 10:24:46AM -0600, Rob Herring (Arm) wrote:
> 
> On Tue, 19 Nov 2024 16:00:19 +0100, Jan Petrous (OSS) wrote:
> > Add basic description for DWMAC ethernet IP on NXP S32G2xx, S32G3xx
> > and S32R45 automotive series SoCs.
> > 
> > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > ---
> >  .../devicetree/bindings/net/nxp,s32-dwmac.yaml     | 105 +++++++++++++++++++++
> >  .../devicetree/bindings/net/snps,dwmac.yaml        |   3 +
> >  2 files changed, 108 insertions(+)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml:25:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
> 

Thanks, I will fix it in v6.

> dtschema/dtc warnings/errors:
> 
> doc reference errors (make refcheckdocs):

I have also noticed the refcheckdocs errors, but AFAIK those are not
connected to my commit:

 $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-   refcheckdocs
 Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`rt_link<../../networking/netlink_spec/rt_link>`
 Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`tc<../../networking/netlink_spec/tc>`
 Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`tc<../../networking/netlink_spec/tc>`
 Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt: Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
 Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
 Documentation/hwmon/g762.rst: Documentation/devicetree/bindings/hwmon/g762.txt
 Documentation/hwmon/isl28022.rst: Documentation/devicetree/bindings/hwmon/isl,isl28022.yaml
 Documentation/translations/ja_JP/SubmittingPatches: linux-2.6.12-vanilla/Documentation/dontdiff
 Documentation/userspace-api/netlink/index.rst: Documentation/networking/netlink_spec/index.rst
 Documentation/userspace-api/netlink/specs.rst: Documentation/networking/netlink_spec/index.rst
 MAINTAINERS: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
 lib/Kconfig.debug: Documentation/dev-tools/fault-injection/fault-injection.rst

> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241119-upstream_s32cc_gmac-v5-13-7dcc90fcffef@oss.nxp.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.

I have series based on v6.12 and I don't see there any v6.13-rc1.

> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

I rechecked with fixed indentation, no any error was found.

BR.
/Jan

