Return-Path: <linux-arm-msm+bounces-104433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIPnGhlK62ntKgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:46:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4416745D56A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:46:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1E7B83002F53
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 10:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5389364949;
	Fri, 24 Apr 2026 10:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pJ79BeiA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224D3392823;
	Fri, 24 Apr 2026 10:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777027584; cv=none; b=NV4Y7oWJZXjGkzV+KbBaS9Vc0nG0ZmWjMCrTUyTWUIORSQUu2GRHXnAdbjSGnIIHXmB8XwNXpctm6winWwamO0ckYwzTv35fMONU3UTb42YWIoRYa8AQwVry+fFn5DDeiakzuTdK2oN+gUpM3FhrUD/fQPoMdW06WBWTXTUSSh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777027584; c=relaxed/simple;
	bh=YOuVShcZmgP5QzkQeSusRIbMHW9dhDFha6DgR3S/6BU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=HjnriEW4gRRTP7kFWzUHgXqfePQwCrRzc+E40b+HcoeK6bMVtY+dqkdNecjTVGfxfIDy8MCI/j19CPTUWZauGbMAO8Wt5Ig7fOe+mU74DTk5t9C7e+/JW/hTwMc0sHVHdXa/mNCnkC9pQDr+aZP0As+DP22VhuThYuH3Rh+PR90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pJ79BeiA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12F2FC19425;
	Fri, 24 Apr 2026 10:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777027583;
	bh=YOuVShcZmgP5QzkQeSusRIbMHW9dhDFha6DgR3S/6BU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=pJ79BeiA8R/RgFPZNgGorI5cDahWT1OpueWqrz0HVDSaENXVL7ckUkX6ic1BPGKw+
	 T/VkdMMPT0sr7zHirn+SJFt3uxLEdzZ9dIkXHA2ph1pYqoKG6kevqbLZpwP96xtxZU
	 ew3O0rJUAST3L8fOzqiDzSAnPQ88/uWlegB/HWQXH0ff+VgR80lAg2Wq+zkrnKXYEk
	 vr+fs0NciILZG2uA+OOB97OhM/CiY5kCA9lbYAm/xbwy342IFc7eNcr3mJaICqiJ16
	 3Ey5p1c+24qngv/JFjWxJBb17NL+sG9By5VsVeFbJyM+mUk44/A9WV6aan9g5kTU+f
	 l1aWrmYezABkw==
Date: Fri, 24 Apr 2026 05:46:21 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-1-4b6e09d532ce@linaro.org>
References: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
 <20260424-topic-sm8x50-tie-gcc-to-cx-v1-1-4b6e09d532ce@linaro.org>
Message-Id: <177702757892.3344991.886983197619217917.robh@kernel.org>
Subject: Re: [PATCH 1/6] dt-bindings: clock: qcom: gcc-sm8450: Add missing
 power-domains property
X-Rspamd-Queue-Id: 4416745D56A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104433-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,0.1.134.160:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,devicetree.org:url]


On Fri, 24 Apr 2026 11:07:55 +0200, Neil Armstrong wrote:
> In order for the GCC votes on the GDSCs it provides to be propagated
> to CX, CX needs to be declared as power domain of the GCC.
> 
> Document the missing power-domains property to that purpose.
> 
> Fixes: 72a0ca203ca7 ("dt-bindings: clock: Add SM8450 GCC clock bindings")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.example.dtb: clock-controller@100000 (qcom,gcc-sm8450): 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sm8450.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260424-topic-sm8x50-tie-gcc-to-cx-v1-1-4b6e09d532ce@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


