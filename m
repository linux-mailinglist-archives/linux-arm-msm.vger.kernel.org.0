Return-Path: <linux-arm-msm+bounces-104435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHFZMAxK62ntKgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:46:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 611D545D55A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:46:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4B0013001D61
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 10:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7648A393DC0;
	Fri, 24 Apr 2026 10:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f60EB6UB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3C23921DE;
	Fri, 24 Apr 2026 10:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777027589; cv=none; b=l9cdGNyKPfvzZ8B4Cy1BEj7P6Gq0O5M7AqkVfg0D0fs8VeaxfC+s7m+ezEVoxTg8n/etPocaqzADB7MFs814dnvZ8rtKAcy/G/FMd0MBeprwEceEL8NWkxJx/q0BJW/S2zqvGkS9JcrC25hAA92z0vOmr13z5Y6wusoJ+Dh0K0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777027589; c=relaxed/simple;
	bh=4qtZpyGpsH/FUXZ/GR41T16VMbBy/pFD6vlTosJaPHU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=KCydtKnQLQdTmEfOi6nNC8xyzBrkY05w4nym2G+oa3JTk2slN3k+P8Qkj6jbE5NgvUoUAfulceJ83q8VZkdDElspRZ8wesvoFl+fGkvp3PFIOGFFbEDVYFTAPzWsJZp0pkB0rgsMLbvLloEyXxj1Er9rP6hUlYF9ejaG/mpA4no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f60EB6UB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 783F7C19425;
	Fri, 24 Apr 2026 10:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777027586;
	bh=4qtZpyGpsH/FUXZ/GR41T16VMbBy/pFD6vlTosJaPHU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=f60EB6UBBQOzyXnZoTt2fg3lqM7/hw57D97QDXcL1hczkpIQaTI8wfm6ezJUgz8kU
	 wI/XF3Mea22R0LaZmAfZ3/GW6PifvCM8rZuDIWn4cGnuzbZ9HdYDz3HpPQnM/JD9kq
	 50SaEumAX+hFivR/BnVlhPVh69CjBrVxEXUEsQhBcvvDraI4Ig2kWmYI4f2MapmIvR
	 k2IbfdGmwfhRiAAsx99N/PZiaZ4Nwl7PnXG8lLRq78gO08XBo7ABpBnL3Sg9+ZU35F
	 nrZRspPwJRLUqkVnqkJGZy1oSOMsdM39WBTXDgVNTP/m4cBcvXFtsVUxoLVGldz5yc
	 B9cSGbMInqBQw==
Date: Fri, 24 Apr 2026 05:46:25 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-arm-msm@vger.kernel.org, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org
To: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-3-4b6e09d532ce@linaro.org>
References: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
 <20260424-topic-sm8x50-tie-gcc-to-cx-v1-3-4b6e09d532ce@linaro.org>
Message-Id: <177702758111.3345072.2051838665194424641.robh@kernel.org>
Subject: Re: [PATCH 3/6] dt-bindings: clock: qcom: sm8650-gcc: Add missing
 power-domains property
X-Rspamd-Queue-Id: 611D545D55A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104435-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email,0.1.134.160:email]


On Fri, 24 Apr 2026 11:07:57 +0200, Neil Armstrong wrote:
> In order for the GCC votes on the GDSCs it provides to be propagated
> to CX, CX needs to be declared as power domain of the GCC.
> 
> Document the missing power-domains property to that purpose.
> 
> Fixes: b69d932154dc ("dt-bindings: clock: qcom: document the SM8650 General Clock Controller")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.example.dtb: clock-controller@100000 (qcom,sm8650-gcc): 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8650-gcc.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260424-topic-sm8x50-tie-gcc-to-cx-v1-3-4b6e09d532ce@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


