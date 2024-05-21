Return-Path: <linux-arm-msm+bounces-20154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD658CB422
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 21:19:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2B7728389C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 19:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 840BC1494C5;
	Tue, 21 May 2024 19:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q3lvAyQA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521141494C0;
	Tue, 21 May 2024 19:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716319172; cv=none; b=t8JcO6YcNL8tnyESv89lwBcgeSDtLJ7TLw6nnz2cvQ1xSOBQIblZwrtZbCkjFn40EDC9h7m8Us3dQxLzxFgTj8Tth6WrRqEJKVTK5S2ALgOXscaoIX83GHV3H6SkIJZcNc+HNPygoiOQeFvdUtDSdRSpuV0itDi9d1Arf3Ju8+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716319172; c=relaxed/simple;
	bh=fOj4eX/N7m1mFqSJAh9Khjsst54QtD5KtS5epVuErSU=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=eq+2iLuNk6JG96+DONE8urumEM7Q+YHjD59Lkls+L1cywdZHjEZcVjzYUge8vyvoDxjLi+qkoK+bZdT6A0kvUFiQwG7MeCYYnMZqwSsaQdYRZfqaCXvDQaVwnAFIsxnESJ+pRM3im/8DH4BcVenh1Nv+9rvq1rHz7wVOK/qzwV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q3lvAyQA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98C8CC2BD11;
	Tue, 21 May 2024 19:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716319170;
	bh=fOj4eX/N7m1mFqSJAh9Khjsst54QtD5KtS5epVuErSU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Q3lvAyQAAWgNbO3KgNN0V25wB8P+e3hWIF3A5OfQ+GOD9kgsWPQ0Bv2biExdxOuIO
	 WcUvgVaqkxByj2hiXm6j1VZ5uu6gZMjzCA7pEaN8oNqbtGKTWSUeDWqj5PGvJ2yl/s
	 Ypfv2dgpFYf4Cufdiktw03yOuslIx8VQJXbxjXwLYB8JM4bz1THUHdCZzT4B0+zbWY
	 hDow0v3WVxGitWwgBCU4mpMZzTsJIqyO3grzaV79dFWjj4/wunjvkL+2EAvaDwwrHU
	 2YwKC2jA645JzUe8auyHH85UIfKY6OpU56J49qvQYQANOMnPcTkGkJ9PFvrRBVTh8f
	 3GGYjxEEX9dJA==
Date: Tue, 21 May 2024 14:19:29 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: boot-architecture@lists.linaro.org, devicetree@vger.kernel.org, 
 Rob Herring <robh+dt@kernel.org>, Jon Hunter <jonathanh@nvidia.org>, 
 Frank Rowand <frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Sumit Garg <sumit.garg@linaro.org>, Doug Anderson <dianders@chromium.org>, 
 Julius Werner <jwerner@chromium.org>, Simon Glass <sjg@chromium.org>, 
 "Humphreys, Jonathan" <j-humphreys@ti.com>, linux-kernel@vger.kernel.org, 
 Michal Simek <michal.simek@amd.com>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Amrit Anand <quic_amrianan@quicinc.com>, Chen-Yu Tsai <wenst@chromium.org>, 
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240521-board-ids-v3-5-e6c71d05f4d2@quicinc.com>
References: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
 <20240521-board-ids-v3-5-e6c71d05f4d2@quicinc.com>
Message-Id: <171631916818.486548.9038805382926415687.robh@kernel.org>
Subject: Re: [PATCH RFC v3 5/9] dt-bindings: board: Document board-ids for
 Qualcomm devices


On Tue, 21 May 2024 11:38:02 -0700, Elliot Berman wrote:
> Document board identifiers for devices from Qualcomm Technologies, Inc.
> These platforms are described with two mechanisms: the hardware SoC
> registers and the "CDT" which is in a RO storage.
> 
> The hardware SoC registers describe both the SoC (e.g. SM8650, SC7180)
> as well as revision. Add qcom,soc to describe only the SoC itself and
> qcom,soc-version when the devicetree only works with a certain revision.
> 
> The CDT describes all other information about the board/platform.
> Besides the platform type (e.g. MTP, ADP, CRD), there are 3 further
> levels of versioning as well as additional fields to describe the PMIC
> and boot storage device attached. The 3 levels of versioning are a
> subtype, major, and minor version of the platform. Support describing
> just the platform type (qcom,platform), the platform type and subtype
> (qcom,platform-type), and all 4 numbers (qcom,platform-version).
> 
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---
>  .../devicetree/bindings/board/qcom,board-id.yaml   | 144 +++++++++++++++++++++
>  1 file changed, 144 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/board/qcom,board-id.yaml:15:12: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/board/qcom,board-id.yaml:74:8: [error] empty value in block mapping (empty-values)
./Documentation/devicetree/bindings/board/qcom,board-id.yaml:81:8: [error] empty value in block mapping (empty-values)
./Documentation/devicetree/bindings/board/qcom,board-id.yaml:88:8: [error] empty value in block mapping (empty-values)
./Documentation/devicetree/bindings/board/qcom,board-id.yaml:97:8: [error] empty value in block mapping (empty-values)
./Documentation/devicetree/bindings/board/qcom,board-id.yaml:103:8: [error] empty value in block mapping (empty-values)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/board/qcom,board-id.yaml: allOf:2:if: None is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/board/qcom,board-id.yaml: allOf:3:if: None is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/board/qcom,board-id.yaml: allOf:4:if: None is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/board/qcom,board-id.yaml: allOf:5:if: None is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/board/qcom,board-id.yaml: allOf:6:if: None is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/board/qcom,board-id.yaml: $id: 'http://devicetree.org/schemas/board/qcom,board-id.yaml' does not match 'http://devicetree.org/schemas/.*\\.yaml#'
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/board/qcom,board-id.yaml: $schema: 'http://devicetree.org/meta-schemas/core.yaml' is not one of ['http://devicetree.org/meta-schemas/core.yaml#', 'http://devicetree.org/meta-schemas/base.yaml#']
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/board/qcom,board-id.yaml: ignoring, error in schema: allOf: 2: if
Documentation/devicetree/bindings/board/qcom,board-id.example.dts:26:56: error: macro "QCOM_BOARD_ID" passed 4 arguments, but takes just 3
   26 |     qcom,platform-version = <QCOM_BOARD_ID(MTP, 0, 1, 0)>,
      |                                                        ^
In file included from Documentation/devicetree/bindings/board/qcom,board-id.example.dts:4:
./scripts/dtc/include-prefixes/dt-bindings/arm/qcom,ids.h:279: note: macro "QCOM_BOARD_ID" defined here
  279 | #define QCOM_BOARD_ID(a, major, minor) \
      | 
Documentation/devicetree/bindings/board/qcom,board-id.example.dts:27:56: error: macro "QCOM_BOARD_ID" passed 4 arguments, but takes just 3
   27 |                             <QCOM_BOARD_ID(MTP, 0, 1, 1)>;
      |                                                        ^
./scripts/dtc/include-prefixes/dt-bindings/arm/qcom,ids.h:279: note: macro "QCOM_BOARD_ID" defined here
  279 | #define QCOM_BOARD_ID(a, major, minor) \
      | 
make[2]: *** [scripts/Makefile.lib:427: Documentation/devicetree/bindings/board/qcom,board-id.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1430: dt_binding_check] Error 2
make: *** [Makefile:240: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240521-board-ids-v3-5-e6c71d05f4d2@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


