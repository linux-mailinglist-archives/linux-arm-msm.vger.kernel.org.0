Return-Path: <linux-arm-msm+bounces-48864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C64A3F21B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 11:31:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B2FF703625
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 10:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6323F207A15;
	Fri, 21 Feb 2025 10:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RpAC+x27"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38118204F93;
	Fri, 21 Feb 2025 10:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740133727; cv=none; b=O9pw3IWYWC/aod10bAJZyufgiY2I2f2zdrfNVsLJjjk3aKJo9Dl6oldEsja32Nbif1MW6PjszpjaV8wFkGgtkg5vuBRbQpIYA29V+PqPJQetOuKJjb+g9/qktj/7bwOgNClosNoQ8lSJZh+YQETq2uQwmC2acv+f7w+2AKPXIa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740133727; c=relaxed/simple;
	bh=o8OIOsm/MPbdEyD4KkcCh/tcMRYhP9J0g46YQGRZ2ZU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=AL4rsgIOFAqfBQdE/FRZG3bPoZmyTfrbdSkOe4sUUTBrlyRWApnbHF1eiaBX+UU7X3F83V78W6g9YPUo+q5GwqF7Ld16LGo5rVy39zVzMt4CxgEuVI9/EEHpk3z1f9wj1rfJAki25mkQj/ZqkwZoVUXZvhO62GByA0M5tatFuK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RpAC+x27; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E826FC4CED6;
	Fri, 21 Feb 2025 10:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740133727;
	bh=o8OIOsm/MPbdEyD4KkcCh/tcMRYhP9J0g46YQGRZ2ZU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=RpAC+x27hHbrOTHmurwCAW734Jl0TI7vXPJfdtaP2Rb3+8jAEkMz/6iWI83w9/akz
	 Xs657hC4y0+ssL6JYnJaR3SNVoM8wubOGMYghlQ/Z8rBjeW1y4DqI8alpmzdN1NpEB
	 azRxdmXOxymRYoY0yqWwRYT0fYPbbpC+9ingxjn1HN8/9p7nhM7MAj7+wgukB+pbaQ
	 vWdz8+FAml7UuYaGHhnYs66OsN/VeRocsQeEKRabuKsIL+LGbFYiolTqglX5JNGnVx
	 gYr55sY6XotpFKm/ddzaHWWheoTP7oLE3gGgBcxxi9c4a7FgqHBVYpAyPAd9pmFUrr
	 8bhRMQC8O5rpw==
Date: Fri, 21 Feb 2025 04:28:45 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, quic_anupkulk@quicinc.com, 
 andersson@kernel.org, krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
 konrad.dybcio@linaro.org, quic_msavaliy@quicinc.com, conor+dt@kernel.org, 
 linux-arm-msm@vger.kernel.org
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <20250221085439.235821-1-quic_vdadhani@quicinc.com>
References: <20250221085439.235821-1-quic_vdadhani@quicinc.com>
Message-Id: <174013372531.1589990.12319302135988371680.robh@kernel.org>
Subject: Re: [PATCH v1] dt-bindings: qcom: geni-se: Rename
 qcom,geni-se.yaml to qcom,geni-se-qup.yaml


On Fri, 21 Feb 2025 14:24:39 +0530, Viken Dadhaniya wrote:
> The qcom,geni-se.yaml file describes the Qualcomm Universal Peripheral
> (QUP) wrapper and the common entities required by QUP to run any Serial
> Engine (SE) as I2C, SPI, UART, or I3C protocol.
> 
> Rename qcom,geni-se.yaml to qcom,geni-se-qup.yaml to better reflect its
> association with QUP (Qualcomm Universal Peripheral) and the compatible
> string.
> 
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---
>  .../soc/qcom/{qcom,geni-se.yaml => qcom,geni-se-qup.yaml}       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/soc/qcom/{qcom,geni-se.yaml => qcom,geni-se-qup.yaml} (98%)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml references a file that doesn't exist: Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml: Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250221085439.235821-1-quic_vdadhani@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


