Return-Path: <linux-arm-msm+bounces-104434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APl+LYlK62ntKgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:48:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A9245D5FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:48:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 909683023352
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 10:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B933B3932D1;
	Fri, 24 Apr 2026 10:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MVRMWca+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67AE391E5C;
	Fri, 24 Apr 2026 10:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777027585; cv=none; b=jOYFlPg6ZDYQarb6m7YioqBK+QAOkChNGMxBNt7oHYbF+8ADBlwEoc4yLDVpQKxBe1GTRLO7WXcL4y8GywN/gEsqX+HOnlQeuXDtPcfxiNYSulBPwYdL4i5mgb28hXaFHoK1I3F2EDXP4paFKv573gUmLhhZli5UpDWa/7rEfEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777027585; c=relaxed/simple;
	bh=JIdbGAbB56UxKD4wwRKV4cDdjdNeYZxMW/TybTKMxr0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Y7DfsdElUNCL5CoeAwGjgnCIAsw5JB2jXkDBNDFRkJj72Vlgnh7IOpQj6Dgjl9x5YnjlpiCPd2PXGhIW4jKZH+Qk4jbHZiXJEKf94v7qEXHEL+35Q0nXpS0E0ZC5dPd4Q2mPbfx00B1+8/t/1vivBt6ksvGdJsuJXnQ5RxbX9jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MVRMWca+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 996FAC19425;
	Fri, 24 Apr 2026 10:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777027584;
	bh=JIdbGAbB56UxKD4wwRKV4cDdjdNeYZxMW/TybTKMxr0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=MVRMWca+lC77p1O2GBQDpM4kGs/WxyG9eWCx3kQBtlVJaYVU9D0sW1uxcYR1T8KAp
	 WZ1LFqune4fYSm78iEuxblhf4uUdefA9GI9OdH7S+Vu2Ok9hkQ7+SI2e1z05uk652m
	 NtINKxvAz8qMvLEqJT8qFcYm+wriSqkOHgu95HnQwuuoUFYZ3ZsYzanNkN1lkLkQEf
	 cSOY/cReKCb3gQZTTgEJ0UfAoSS77q/wn7aW8FAvIyZD1E+ZyacLoEVwBpMwJ/7cfq
	 VdlRzVq78rLi5f2tLPxBF9LXaylpDnWoyWiGI2r1lg/yZyMyNAvby2z9vs/A/evyKj
	 GU7PEWnb/NL9w==
Date: Fri, 24 Apr 2026 05:46:23 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Abel Vesa <abelvesa@kernel.org>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org
To: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-2-4b6e09d532ce@linaro.org>
References: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
 <20260424-topic-sm8x50-tie-gcc-to-cx-v1-2-4b6e09d532ce@linaro.org>
Message-Id: <177702758002.3345029.970242459173286550.robh@kernel.org>
Subject: Re: [PATCH 2/6] dt-bindings: clock: qcom: sm8550-gcc: Add missing
 power-domains property
X-Rspamd-Queue-Id: 17A9245D5FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104434-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,0.1.134.160:email,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]


On Fri, 24 Apr 2026 11:07:56 +0200, Neil Armstrong wrote:
> In order for the GCC votes on the GDSCs it provides to be propagated
> to CX, CX needs to be declared as power domain of the GCC.
> 
> Document the missing power-domains property to that purpose.
> 
> Fixes: 47ba9c50bbeb ("dt-bindings: clock: Add SM8550 GCC clocks")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.example.dtb: clock-controller@100000 (qcom,sm8550-gcc): 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-gcc.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260424-topic-sm8x50-tie-gcc-to-cx-v1-2-4b6e09d532ce@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


