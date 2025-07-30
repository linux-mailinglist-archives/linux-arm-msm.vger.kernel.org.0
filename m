Return-Path: <linux-arm-msm+bounces-67171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0A5B162D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 16:31:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFF7C3A9BEB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 14:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D7052C3265;
	Wed, 30 Jul 2025 14:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TVGZHb/A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE3422539D;
	Wed, 30 Jul 2025 14:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753885871; cv=none; b=u0FhTWkY/ZTrEDXma1+0fYP5WIwdt8mO0fNGrFGhoU8ymwn1lqAhf0JSzz3Xwaks55tawQ2x/1ySjOER9IRINs7H66jKUIQZrkKXxsrbYE0JwFf3SApucI2/DJKgV8ZxnEAs5rsQQrXcAk3t9kWoJtKyFXWkEGZ0XjYKeScpny0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753885871; c=relaxed/simple;
	bh=Snch+KOVqe7Btb1kUNrEoTqutUb5jKG8E3w1pNm7imo=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=nozd1NkOYb5rKZjMg+I2qiE1w1KUJ6pCUVsK2mAt+uXMiVHKGXG+J26zwzPpUyxXprUO9HKQUrdUV5dR0HH8OuZBxjM/89KZAxZ7sP78zr6MWoxGjJ1s0f0NK9qeAutWUucA0A+bS6GxMWrU/VWssB1JvsGjws6D+Flyqobogxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TVGZHb/A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D27DDC4CEE3;
	Wed, 30 Jul 2025 14:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753885871;
	bh=Snch+KOVqe7Btb1kUNrEoTqutUb5jKG8E3w1pNm7imo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=TVGZHb/A1l0YucqC2rUHutS0EqhFAxlfKKvTI2cliqg/+GY45+2JjV1JOlvSiVc/D
	 zYAC/AG+Q8tisWKqtZ8TMFZz7KJw1sMq3AuGddoFsUbEUlLwaw4k0nvgNBz4xIfK4I
	 mdd23JaSRBUjHBsCE7J1UTbSfZPOuEKxljaDQxvcN8IhbgF84iOHw3CM3osdoNNork
	 JihLPXAOI0oOtYxJs815xJaJWg+EdmEZK01/IRMDqPfYXbXygKetP9AX0rAX64/Ziw
	 WNwV/lKCqizWfTTHQE8nEsW78e8QeVZ+mXA0f9KzT1EwB792PsB4FxsoNURo1idq3l
	 PTNojLno1JosQ==
Date: Wed, 30 Jul 2025 09:31:10 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 stable@vger.kernel.org, Sibi Sankar <quic_sibis@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, Johan Hovold <johan@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org
To: Abel Vesa <abel.vesa@linaro.org>
In-Reply-To: <20250730-phy-qcom-edp-add-missing-refclk-v1-1-6f78afeadbcf@linaro.org>
References: <20250730-phy-qcom-edp-add-missing-refclk-v1-0-6f78afeadbcf@linaro.org>
 <20250730-phy-qcom-edp-add-missing-refclk-v1-1-6f78afeadbcf@linaro.org>
Message-Id: <175388587013.1443735.2833199363518772235.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: phy: qcom-edp: Add missing clock for
 X Elite


On Wed, 30 Jul 2025 14:46:48 +0300, Abel Vesa wrote:
> On X Elite platform, the eDP PHY uses one more clock called
> refclk. Add it to the schema.
> 
> Cc: stable@vger.kernel.org # v6.10
> Fixes: 5d5607861350 ("dt-bindings: phy: qcom-edp: Add X1E80100 PHY compatibles")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  .../devicetree/bindings/phy/qcom,edp-phy.yaml      | 23 +++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.example.dtb: phy@aec2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.example.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/qcom,edp-phy.example.dtb: phy@aec2a00 (qcom,sc8180x-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250730-phy-qcom-edp-add-missing-refclk-v1-1-6f78afeadbcf@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


