Return-Path: <linux-arm-msm+bounces-24322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B20C9185EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 17:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB4561C212F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 15:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5972B18A95F;
	Wed, 26 Jun 2024 15:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EhCUvS4w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D46CA92F;
	Wed, 26 Jun 2024 15:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719416122; cv=none; b=IpYZIdnrO4F/lMJCF8ur62wXnrTCiRweqX61PqNJKJiHw7xfk1rizH1OkSZJo4p84pDSmuayEeViU87K8O8A+A/CkiFVTUsukUlr5X02gmE2gPMJ8baGE94xjUrt/JGLkqA9t18sBwrPLX/D88eho8qzXrO3D42Vhn2u2w0Wbgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719416122; c=relaxed/simple;
	bh=1Kcr3jofdArjh6InWFIdRnfWmP3d7iP++Ac3f1l/fwQ=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=mgQPq54HdBDiZfIN/odhdPoKD59Ae5IYlxUwljDUmThxIZq5GVSteUr1SNaTmXHknAHu3oHX+duJ9XhAfiQy8BI9rieWc1C6YH/m9AUuS0muJ3wd59kl9zhPu7CeI2Ax19Te/Qt4Cz6XJjeacksjoJynVel+CpFFkpe6AWvod7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EhCUvS4w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CE8FC116B1;
	Wed, 26 Jun 2024 15:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719416121;
	bh=1Kcr3jofdArjh6InWFIdRnfWmP3d7iP++Ac3f1l/fwQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=EhCUvS4wltsz2P5ZyUiB69APAxgoqAtE/IcvwXQdxdEpETk8H013mdfGKcvFUiLdB
	 giiSdPkNiHIAESerlBkaXWCvQnFBJ9lvZQ9wLkxyPGldmIWeAGLDhA2OiL9ZuwSAHg
	 c0ezz8n3h1PWIHJQHiPfPA8sJX0lB0B/JXR0LFcTXueub69S9wW/gVrd8az1NrmNgL
	 XR0AOkUsuBpuPnxlbxi/LWKLD2m3fLp7aVe6Prqhjc8kAYxmjns3zBsnIUTE034xxN
	 HVx61Vq+ACCaSQ2eMH3Sy076jJVVIvZ/EI2jT0Etk5dJwT/TJFqYwQKpol66llpCGM
	 vlMxR++QCO5AQ==
Date: Wed, 26 Jun 2024 09:35:20 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Devi Priya <quic_devipriy@quicinc.com>
Cc: catalin.marinas@arm.com, u-kumar1@ti.com, 
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, 
 geert+renesas@glider.be, neil.armstrong@linaro.org, nfraprado@collabora.com, 
 mturquette@baylibre.com, linux-kernel@vger.kernel.org, 
 dmitry.baryshkov@linaro.org, netdev@vger.kernel.org, 
 konrad.dybcio@linaro.org, m.szyprowski@samsung.com, arnd@arndb.de, 
 richardcochran@gmail.com, will@kernel.org, sboyd@kernel.org, 
 andersson@kernel.org, p.zabel@pengutronix.de, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, conor+dt@kernel.org, 
 linux-arm-msm@vger.kernel.org
In-Reply-To: <20240626143302.810632-5-quic_devipriy@quicinc.com>
References: <20240626143302.810632-1-quic_devipriy@quicinc.com>
 <20240626143302.810632-5-quic_devipriy@quicinc.com>
Message-Id: <171941612020.3280624.794530163562164163.robh@kernel.org>
Subject: Re: [PATCH V5 4/7] dt-bindings: clock: Add ipq9574 NSSCC clock and
 reset definitions


On Wed, 26 Jun 2024 20:02:59 +0530, Devi Priya wrote:
> Add NSSCC clock and reset definitions for ipq9574.
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Changes in V5:
> 	- Dropped interconnects and added interconnect-cells to NSS
> 	  clock provider so that it can be  used as icc provider.
> 
>  .../bindings/clock/qcom,ipq9574-nsscc.yaml    |  74 +++++++++
>  .../dt-bindings/clock/qcom,ipq9574-nsscc.h    | 152 ++++++++++++++++++
>  .../dt-bindings/reset/qcom,ipq9574-nsscc.h    | 134 +++++++++++++++
>  3 files changed, 360 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,ipq9574-nsscc.h
>  create mode 100644 include/dt-bindings/reset/qcom,ipq9574-nsscc.h
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.example.dts:26.26-27 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.lib:427: Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1430: dt_binding_check] Error 2
make: *** [Makefile:240: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240626143302.810632-5-quic_devipriy@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


