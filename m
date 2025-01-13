Return-Path: <linux-arm-msm+bounces-44941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77588A0C59C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 00:27:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDC6C3A55CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 23:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42F411F9F5E;
	Mon, 13 Jan 2025 23:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I3uAMJeS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C581F9415;
	Mon, 13 Jan 2025 23:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736810844; cv=none; b=uACfbiSiWK9x/g5SLpYzy4vzaygTYbK3fnFbUQYQAli59uezcP+rnY/Jh/AhjcYvYaspi2b3JANQx3zSyL0PJgAvk0Uolwa8kMgATHWTcO2pxsYGQQaPl3v1pL1/9Ir1854dL8wpMW/0EngXQYyiYLyATY79G5zR5zW7PcBTY2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736810844; c=relaxed/simple;
	bh=Wyd0GkcBwPWXois4+LKVXlzTBRXNw0WbLYeURxTamHg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=m7qbs4VwC6c3jGyHkaQc50pxyMlg9ACt/tQ8yNgN2PXZ91sQIJqO8hJKR0AOa3tBfgnBhWxWaKtjix4yBLOUdXO5rWWg8zFkTjfR1dczG+bXrvnewny6lpcszEXnfIBH747QZ8zKVY7iOVS5zondw6tXhsruNw24gHVnIzL7KUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I3uAMJeS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68FB8C4CEE2;
	Mon, 13 Jan 2025 23:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736810843;
	bh=Wyd0GkcBwPWXois4+LKVXlzTBRXNw0WbLYeURxTamHg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=I3uAMJeS15prghq7+Kg6lXcRid8omW21cyV3RO8r5ELoTOhgWVC6aGwxWwXFnz8fx
	 AMrbO7x1n7S+0gYWpSD/jHCY3EtrI+rld6e9mJ4A/1e5tywXx+DlVdOZl1HoqDGft+
	 C5GXUiFhgjPNJSZ7Pj7y33kHbXQR9UqK+4SsP0rKe5lNVaD7HSjOSiR/XZxrPvdlJK
	 QLc2LlxgDRNQAs5zFTYDFVvJ7wc7Uc5FCisrXMx0CfGgI7JGTyPxi+RlCizLrj29JB
	 ZF7X482UUobRP3eFzYY3iJSL3kDjsRYSIoA9tTDGpwDYJ652Fkhl9NX5FH33khzdH/
	 /RlxjLI8G0osA==
Date: Mon, 13 Jan 2025 17:27:22 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor+dt@kernel.org>, 
 Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Will Deacon <will@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-usb@vger.kernel.org, Trilok Soni <quic_tsoni@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
 devicetree@vger.kernel.org, Wesley Cheng <quic_wcheng@quicinc.com>
To: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <20250113-sm8750_usb_master-v1-2-09afe1dc2524@quicinc.com>
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-2-09afe1dc2524@quicinc.com>
Message-Id: <173681084057.3609181.3813483305054365666.robh@kernel.org>
Subject: Re: [PATCH 2/7] dt-bindings: phy: Add the M31 based eUSB2 PHY
 bindings


On Mon, 13 Jan 2025 13:52:08 -0800, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> On SM8750, the M31 eUSB2 PHY is being used to support USB2. Add the
> binding definition for the PHY driver.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  .../bindings/phy/qcom,m31-eusb2-phy.yaml           | 84 ++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.example.dts:18:18: fatal error: dt-bindings/clock/qcom,sm8750-gcc.h: No such file or directory
   18 |         #include <dt-bindings/clock/qcom,sm8750-gcc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1506: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250113-sm8750_usb_master-v1-2-09afe1dc2524@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


