Return-Path: <linux-arm-msm+bounces-49063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA46EA40F26
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 14:43:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B9D83A5FCF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 13:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2369B20764C;
	Sun, 23 Feb 2025 13:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VOvT3YKM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D6E205E31;
	Sun, 23 Feb 2025 13:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740318149; cv=none; b=rw0DngkZVOb0ryH1LUwhDABF06ilt78T11MXjHNBnx9ia3yHif3ANEBjS0qHWc3KAsO6KoR682ykhLCrVOeF3a9NO2czQJZQrC6hzVTNyDc44RQSu27agoWwfBapXh2tUclTZgqhxcYEGyfqXPTMx1UyZqWnvuTMyBrpmpbZFAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740318149; c=relaxed/simple;
	bh=jwn6l1jyxsK/cyBjr2VSFnuiR+pFjsZ0dp+FXBN4EKk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=KVWh9EjNZKi0hhYlmxsE5sStXoil1tahyRAEoseb8Y3z12ZFd7E83aV2jW4amXfdZBXKag6Pwu0DvZIpGH7p7YOY0rhOmCyGI4keeCE73jm0fZ+Aro4ZlaO5VYoWKocMlBVyeN0lpMKjHUMoOhtppFD2foxTY6pn5z6xkWy3Yy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VOvT3YKM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40BD3C4CEDD;
	Sun, 23 Feb 2025 13:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740318148;
	bh=jwn6l1jyxsK/cyBjr2VSFnuiR+pFjsZ0dp+FXBN4EKk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=VOvT3YKM+eQXCjRRFCLOAagcaYsSs5wa1B8tqegM6X9ADvs0gZKCNKE+rZilru1J/
	 i4DJn5BI6aHcO5IgQcZpbDb86ceSV3Ggq+usy+L1e/99m6F71L3OhOCCjHMK0IBHDr
	 V5HpUmjnaQ9lPJY1VfK1J6F0MiedheykIXvVwKK+WIjB+zFay5LaliiRTDZG4Y3bfR
	 1BvnlL02+nVY7f+gORG02yX3dXP65Z2XJ3K4pSb8tNAkpbAMlS8y385ce2gv4xzoTy
	 o5vwp7Hui2MHDxOt5YJFkGdrZfPxAz+27/uVLfIvoPTJkwUA/uvDubZ+6NJwivYpM9
	 +1jPMY8oF0sHw==
Date: Sun, 23 Feb 2025 07:42:26 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-phy@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>, 
 Abel Vesa <abel.vesa@linaro.org>, linux-kernel@vger.kernel.org
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250223122227.725233-4-ivo.ivanov.ivanov1@gmail.com>
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223122227.725233-4-ivo.ivanov.ivanov1@gmail.com>
Message-Id: <174031814650.3676571.3567229546810248196.robh@kernel.org>
Subject: Re: [PATCH v2 3/8] dt-bindings: phy: add
 samsung,exynos2200-usbcon-phy schema file


On Sun, 23 Feb 2025 14:22:22 +0200, Ivaylo Ivanov wrote:
> The Exynos2200 SoC has a USB controller PHY, which acts as an
> intermediary between a USB controller (typically DWC3) and other PHYs
> (UTMI, PIPE3). Add a dt-binding schema for it.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../phy/samsung,exynos2200-usbcon-phy.yaml    | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.example.dts:18:18: fatal error: dt-bindings/clock/samsung,exynos2200-cmu.h: No such file or directory
   18 |         #include <dt-bindings/clock/samsung,exynos2200-cmu.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1511: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250223122227.725233-4-ivo.ivanov.ivanov1@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


