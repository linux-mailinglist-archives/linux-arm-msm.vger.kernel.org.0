Return-Path: <linux-arm-msm+bounces-64294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D652AFF4B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 00:30:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62676585DB8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 22:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFE4924679D;
	Wed,  9 Jul 2025 22:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PTOuyLPK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F641CAA85;
	Wed,  9 Jul 2025 22:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752100211; cv=none; b=F6zSmKfNjhJQgkJGmBKIDMJIAaVF6FlOPX6I1jU4Y4il3RMNd0hkKsWtilnkvDOIq+oTEF3oWQDK9ET4Yx81YVhWdrc5h2PNqrmIH3Yxq28gStZOeg35fHGIYBRgPC4aWbRaYC+T5bQKR65Y38/QuX2zz7+OQdRH8mT4jWMDKxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752100211; c=relaxed/simple;
	bh=xHr0SxcTTGeDN1ue6d/qY2D0xz+OPv9AcKajs1DQq90=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=gRrEJ3WDlKeYV+rAtOJCgKVYxaxwg47oXfkuvOdAyw133MDXVn5lElnhzwLTfKCdRo2rnssZx4XGf+24E4wD0fr9zLuaZDT7K1/YTEvFCO1Kr3NyotQOQXp0XIWtBL3GNa7Ugav1k5ml765fPAnej6UIil3QO0z/7Z22zB5rnjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PTOuyLPK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04E3CC4CEEF;
	Wed,  9 Jul 2025 22:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752100211;
	bh=xHr0SxcTTGeDN1ue6d/qY2D0xz+OPv9AcKajs1DQq90=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=PTOuyLPKEIvUR+suT8k+/1Ck2XqWrdas0m70vsOe6FMm5Og/ahHF0rQRSrcb14SnJ
	 LMBvT+0iqFIbwI4vjH6c4giXZi8haH2E0bFdv+gbTkXsSrGlCmDMFW6ybv19i8+YYJ
	 Zz9CDrMlNjkbBeep5UpnjlL2BuetozjIU0RZtYydCuwZnRQeGoAC8HuqAjUxfp+rt+
	 B8kt3zUnn5ks84mSONbOczsJ38ndSunhqfdgTZ65h3ZrUWFHCLM9CCnjDpy9qgPFq/
	 a7aOX4rEyyv3gzQ7UYzoxrvPAQBLn9nPjTvJXJj/SYCliMq6ctrBKHFLn/n9EPoeHU
	 KX/MlRxnUQbqQ==
Date: Wed, 09 Jul 2025 17:30:10 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, linux-remoteproc@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 ~postmarketos/upstreaming@lists.sr.ht
To: Luca Weiss <luca.weiss@fairphone.com>
In-Reply-To: <20250709-sm7635-remoteprocs-v3-1-c943be976180@fairphone.com>
References: <20250709-sm7635-remoteprocs-v3-0-c943be976180@fairphone.com>
 <20250709-sm7635-remoteprocs-v3-1-c943be976180@fairphone.com>
Message-Id: <175210021011.3927964.2963774922041119366.robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: remoteproc: qcom,milos-pas:
 Document remoteprocs


On Wed, 09 Jul 2025 13:13:07 +0200, Luca Weiss wrote:
> Document the bindings for the ADSP, CDSP, MPSS and WPSS PAS on the Milos
> (e.g. SM7635) SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  .../bindings/remoteproc/qcom,milos-pas.yaml        | 201 +++++++++++++++++++++
>  1 file changed, 201 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.example.dts:20:18: fatal error: dt-bindings/interconnect/qcom,milos-rpmh.h: No such file or directory
   20 |         #include <dt-bindings/interconnect/qcom,milos-rpmh.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1519: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250709-sm7635-remoteprocs-v3-1-c943be976180@fairphone.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


