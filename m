Return-Path: <linux-arm-msm+bounces-20847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A557C8D27A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 00:02:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4814C1F26A29
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 22:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F1713DDA0;
	Tue, 28 May 2024 22:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RLjZ/Mbm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B7E13DBA8;
	Tue, 28 May 2024 22:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716933733; cv=none; b=rkVelPAIq5RFLsvbNn5JnBFe6vpQFmjgMlnNOVHaZjFhPOYqawq1f6/1VVvOHkcCkjBfT9iZlkM41b50d6ZwItrXM+FUEAShnJChntJHpQvDb/jU7xerzIUCfa0qikuA8Dh9gqUe8KCxVG5CoglLj731WrQSm44SLxpemgA+lsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716933733; c=relaxed/simple;
	bh=RZnPKmVxj/vXZhE4jn9Vs0dBKetiOAEAUtHS1bJyWHI=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=Gxpp4qhnHM4eOioAtsgyXpR0/xkNHFeCvM2X5PhF2piG/20mr7mpmkQgDJHDO8KZdULq0YBhpGnI6Icc+r1cc1ohVq/t96VBOOtKfFuQM61r5hV1rCiv3YyhdqMqH4Oxf/WBCdrAfmzsRZc9NhU0ZJRRsKP7l2Yn5ujl8+t1XPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RLjZ/Mbm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 980DAC32786;
	Tue, 28 May 2024 22:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716933732;
	bh=RZnPKmVxj/vXZhE4jn9Vs0dBKetiOAEAUtHS1bJyWHI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=RLjZ/MbmKKc1M7CXx+eJJAdu8BFSxP7LxoTfb1bDfJnyxs7WC6nCnMj9vKSioCAGC
	 uRLNuFugSabDha4WAVU3nRBAUOViVgYdh5xK/oziUsBfEy39dWyHI6WYTc3e5fMU3W
	 BLD9gRAvxturb6SJoN3EuxofV/TkI1tsEZjp/RKxHw+tM/HvLfu7vE3s36d93x/ezS
	 H9a9f729CNCowygn6XzEn5GDOs64UsW+wikGQOEiw1cgvAPPo7Ff/JqEaOc8qZIONj
	 j+gYe9fy5ofXinjs+iutQwwhv3JO+9Pr8QIWM4VXtNEuMbTAkwKdmmj+IkvHQfPmk8
	 3Igqe52HYkpXQ==
Date: Tue, 28 May 2024 17:02:11 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Robert Marko <robimarko@gmail.com>, devicetree@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <quic_tdas@quicinc.com>, 
 Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20240528-qcom-gdscs-v1-3-03cf1b102a4f@linaro.org>
References: <20240528-qcom-gdscs-v1-0-03cf1b102a4f@linaro.org>
 <20240528-qcom-gdscs-v1-3-03cf1b102a4f@linaro.org>
Message-Id: <171693372935.2295527.3108085146101428435.robh@kernel.org>
Subject: Re: [PATCH 03/10] dt-bindings: clock: qcom,gcc-msm8660: use
 non-power-domain version of GCC schema


On Tue, 28 May 2024 23:43:21 +0300, Dmitry Baryshkov wrote:
> On MSM8660 the GCC doesn't provide power domains. Switch it to use new
> qcom,gcc-nopd.yaml schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,gcc-msm8660.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/qcom,gcc-msm8660.example.dtb: clock-controller@900000: Unevaluated properties are not allowed ('#power-domain-cells' was unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-msm8660.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240528-qcom-gdscs-v1-3-03cf1b102a4f@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


