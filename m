Return-Path: <linux-arm-msm+bounces-27642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFF2944112
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 04:26:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0419E1F21CE7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 02:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37A37EC2;
	Thu,  1 Aug 2024 02:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g0NGMFz1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F151210E0;
	Thu,  1 Aug 2024 02:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722478933; cv=none; b=PBz8SnWJim5cPpoeZSuHnQvwXgHAOX1eozuAnlQxugsJwGchZTzkGZdIo+Nl2O+6n93aXpfGH8v60RzHqgNYRnO1ohitZjEACKXKioRat4dHeOtyp7MWJ80FYuFZ2xyTbYtAMkBdIQapM8NpdaEXPx9nrHtYbVoVrgwnOGWaoq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722478933; c=relaxed/simple;
	bh=cgxg4rbo4fUOa9zSmibfWqsv00PQFdhsSeKcX4HAPjg=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=RkzC5IkxQSimb3+/2li3tiijvMReY6TVbgS/R5sCsu1tUyj9PKrZ6QEmoGDHWvASoXP+yJuSyva83v+rmj4XGlMDGUGgzaegR9A2dtkDXwx2sIdWPqtJdKjihSLpojWSRDDrz4VyHWYvx+h6Cif83YlvkLRag0m3dI82bo/em0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g0NGMFz1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24934C116B1;
	Thu,  1 Aug 2024 02:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722478932;
	bh=cgxg4rbo4fUOa9zSmibfWqsv00PQFdhsSeKcX4HAPjg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=g0NGMFz1HOD7/T0s35VIIArFp5yKZQqK2zn5bgOKLqFQWsYd2iG92tRhhtE2CpZQF
	 QBuD9G/910Q7Mw1q+xOpDWtVsZ4sszv644qjVVhmFSml9jrzsiCclJE25xEyWcDc/W
	 SHfoGtCNOu/yzzmspyvZOkdZN9+ockI+hBATMnlbH2aszcTagPa1fHk/Wr6X05VvgQ
	 h9ToZZi1ciswwXnPVXqurmNQFmlwQzwRE7FgzaiyAkcQRK6d+h6WdzlTs73VNxDx9l
	 pm1zKgvDDqkWBF5H/iUyc6pJ3msqajhP+PoFAptHCJkmRki/JKN1Cm2NsjlT3cxxnY
	 0VUev0OBhuy5g==
Date: Wed, 31 Jul 2024 20:22:10 -0600
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: mathias.nyman@intel.com, linux-usb@vger.kernel.org, 
 Thinh.Nguyen@synopsys.com, krzk+dt@kernel.org, 
 srinivas.kandagatla@linaro.org, linux-doc@vger.kernel.org, 
 bgoswami@quicinc.com, linux-arm-msm@vger.kernel.org, tiwai@suse.com, 
 lgirdwood@gmail.com, alsa-devel@alsa-project.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, corbet@lwn.net, 
 perex@perex.cz, gregkh@linuxfoundation.org, conor+dt@kernel.org, 
 linux-sound@vger.kernel.org, broonie@kernel.org
In-Reply-To: <20240801011730.4797-14-quic_wcheng@quicinc.com>
References: <20240801011730.4797-1-quic_wcheng@quicinc.com>
 <20240801011730.4797-14-quic_wcheng@quicinc.com>
Message-Id: <172247893082.2670643.17763625549296585780.robh@kernel.org>
Subject: Re: [PATCH v24 13/34] ASoC: dt-bindings: Update example for
 enabling USB offload on SM8250


On Wed, 31 Jul 2024 18:17:09 -0700, Wesley Cheng wrote:
> Add an example on enabling of USB offload for the Q6DSP.  The routing can
> be done by the mixer, which can pass the multimedia stream to the USB
> backend.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  .../devicetree/bindings/sound/qcom,sm8250.yaml    | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/sound/qcom,sm8250.example.dts:97.44-45 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.lib:427: Documentation/devicetree/bindings/sound/qcom,sm8250.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1430: dt_binding_check] Error 2
make: *** [Makefile:240: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240801011730.4797-14-quic_wcheng@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


