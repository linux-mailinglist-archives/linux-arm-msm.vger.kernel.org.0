Return-Path: <linux-arm-msm+bounces-20848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 40ED18D27AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 00:02:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA8C21F269F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 22:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7585D13E021;
	Tue, 28 May 2024 22:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UmzdXLJX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421CA13DDC9;
	Tue, 28 May 2024 22:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716933734; cv=none; b=JvxtVyrq00JXcvHNzgGODqnaPlRZ0uXar21QpJLp9heFSTTbJHCbsWnX+U1FzoD9QnleNJcEMzdQIvtSJCDUeCv8csKmDaxL9O2YYDypFNhsxYXLNfZaKgitSHy7ryZOCO+XFv/wC+kINjrobN1QoB9JeEq95Hr4Z9GwslZWWfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716933734; c=relaxed/simple;
	bh=uHelCixRqEzwa5RXj6Eq9URncgxUDyjmq4nN842iQts=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=B7DjH3i/QgWi8W4e1c9JN+a5HEsOSteH3C6DVWH9cLeEPO08E5l5qIUvj7zvFrJUpFrW3UW3QvzXVRCrLJdsvq13HDH04QKO7JZeK2H6WlCKD6H45q8jhNYf8prE3J1P0fHmhCe+i7ljrZBU4jT+ebvQ9mIDDQFbno/NvGhS0Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UmzdXLJX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3025C4AF17;
	Tue, 28 May 2024 22:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716933734;
	bh=uHelCixRqEzwa5RXj6Eq9URncgxUDyjmq4nN842iQts=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=UmzdXLJXtOrNCdCBa2KjR9Y6ob49vFQCTEdD4oB20+u8NdCX8sPmnE0WFfTFCfMKg
	 YJSokBaRmqRLjlM6g1W7D2kFSXscabCf6dG04oz93EdOn8kyFJ8HPFf57B06UQNe/W
	 MUQyAYfrGJplLUBSMpL6Q31wT3+bBGTnHH9Mw6w2KwDsUnvTiejCbl1kBOEZy7qZV9
	 zUf2PTcHYa5a3rm7WzW5BdmOsE07XonhfhyinpMhkoUqTFJuPuFp4BsP4EKFlxLN1Y
	 l0If5wPPXsgUV//RLLMGSXBFZhnRreQ8WTrZ4eGzQtGErajON8zdlzGdLonYwsNcCi
	 ETzu/r/ILPiIA==
Date: Tue, 28 May 2024 17:02:13 -0500
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
Cc: Robert Marko <robimarko@gmail.com>, devicetree@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, linux-arm-msm@vger.kernel.org, 
 Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <20240528-qcom-gdscs-v1-4-03cf1b102a4f@linaro.org>
References: <20240528-qcom-gdscs-v1-0-03cf1b102a4f@linaro.org>
 <20240528-qcom-gdscs-v1-4-03cf1b102a4f@linaro.org>
Message-Id: <171693373016.2295594.972351560499192008.robh@kernel.org>
Subject: Re: [PATCH 04/10] dt-bindings: clock: qcom,gcc-ipq6018: use
 non-power-domain version of GCC schema


On Tue, 28 May 2024 23:43:22 +0300, Dmitry Baryshkov wrote:
> On IPQ6018 the GCC doesn't provide power domains. Switch it to use new
> qcom,gcc-nopd.yaml schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,gcc-ipq6018.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/qcom,gcc-ipq6018.example.dtb: clock-controller@1800000: Unevaluated properties are not allowed ('#power-domain-cells' was unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-ipq6018.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240528-qcom-gdscs-v1-4-03cf1b102a4f@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


