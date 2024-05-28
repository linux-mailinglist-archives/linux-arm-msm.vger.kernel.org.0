Return-Path: <linux-arm-msm+bounces-20846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C03158D27A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 00:02:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C36E288553
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 22:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22BF013D29E;
	Tue, 28 May 2024 22:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="akkpwfMz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D634D11B;
	Tue, 28 May 2024 22:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716933732; cv=none; b=BQ6BM3MerQGpuok6A2hiDjXbxx8Zek6jr3itjk/xdmVj5y1kye1XoZ2+BjrzGLJCq7L62R2nb2xb+f5CWEERAS2u97lMlXv/tp+2RLVr+lMXRodENyEFFbGBjltdCeUZAMqMAz62EfK37ewtNqYmQcczLtYPKtVWyzevxGMUDfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716933732; c=relaxed/simple;
	bh=U5GwIJ+LTWcl46Eo7bgV8feyU6acMOc6HfoXnN5Yyco=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=ouXRNIgB+Bx/+ioeWQlPf6zQwI7gQzJJIyIErtbaaLYGJoRqY7TQscCz3ziGg+3vGVOo5Fb5iF8Cjgs8+PEy00ktsOt1gYMzhtLdOLsNkxGSDRBxOR/QmQs8roQS1kBNDQFuaiQl76LJaYz7zjrWsiqMEcKGfIUsJuMTCbgR5zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=akkpwfMz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2979DC3277B;
	Tue, 28 May 2024 22:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716933731;
	bh=U5GwIJ+LTWcl46Eo7bgV8feyU6acMOc6HfoXnN5Yyco=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=akkpwfMzhaR/+ZdG5BDJaUxOSURRQqMTl+I89EQkEoAH/NK1uchEdODfklRVd3D6/
	 rPRilbMN7VdBAZGTJT7ucUQ5aV5/zGpZxAaAf9lR5XLflRw/QuChheRUKwkUcQUSlx
	 Ls0LEkc5YzztMYO1bpF25TT3Y0GAP4QtzCd9ItzxFjn1NQc7X9iKzAAdn1YesFapLO
	 xz5cWpbxOapN6CzAaAd84Yw61OX8LGn3ZvywJBAcOFs6yAGWchjT9uBIj9kSfl1Fz7
	 Te6c7y76fdXRKnXtr1TjtnCsw7gC6cz754v65f+GVOrj6jwhgnnYAB6BFAt6G+RubO
	 3qKIJ7ABmKxSQ==
Date: Tue, 28 May 2024 17:02:10 -0500
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
Cc: devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Robert Marko <robimarko@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
In-Reply-To: <20240528-qcom-gdscs-v1-2-03cf1b102a4f@linaro.org>
References: <20240528-qcom-gdscs-v1-0-03cf1b102a4f@linaro.org>
 <20240528-qcom-gdscs-v1-2-03cf1b102a4f@linaro.org>
Message-Id: <171693372859.2295487.17922726923732511948.robh@kernel.org>
Subject: Re: [PATCH 02/10] dt-bindings: clock: qcom,gcc-apq8064: use
 non-power-domain version of GCC schema


On Tue, 28 May 2024 23:43:20 +0300, Dmitry Baryshkov wrote:
> On APQ8064 and MSM8960 the GCC doesn't provide power domains. Switch it
> to use new qcom,gcc-nopd.yaml schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.example.dtb: clock-controller@900000: Unevaluated properties are not allowed ('#power-domain-cells' was unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-apq8064.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240528-qcom-gdscs-v1-2-03cf1b102a4f@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


