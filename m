Return-Path: <linux-arm-msm+bounces-118659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0A2WGoqWVGrHnwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:40:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF42D748485
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:40:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=LDnjGMKr;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118659-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118659-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CA553034A9E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 07:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63EE838F62A;
	Mon, 13 Jul 2026 07:35:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3316138F230;
	Mon, 13 Jul 2026 07:35:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928116; cv=none; b=I/+nxpR/SjD0d2RVpLadZA+m6+4kRHP+CIj2xjoUhuY9l92zORKGjkGeQ481UKPYXh318PlMLn3n/+VlTy09F/Pln/sq+T50hnswMuk/9rIDX0dXu3Lhd8RFzb5swle/e++52pgYBsPf/2mIoChbfSB9mPuWTN8yHiKs7nyZNFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928116; c=relaxed/simple;
	bh=v+xirt7tnA90F1k7ZNukmXX0Xn0sDXZZYEADfesBbLw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=DHgbfr07IzNF7IS1SM0TaXG7VrEHGcMVrILvlyIUzBT2VcHfU5EF+/NFUaiYcKXXbXEKiA0gWmkxQCWGxJCrr8L8I/OjD066h+jovWfSMJVNQTAGoBS5NIuheAUELqi0dOxBeZWAVd+1qaSjn/jmgqc4K2MdZgyE1arSrVWKLkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LDnjGMKr; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B555A1F00A3A;
	Mon, 13 Jul 2026 07:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783928114;
	bh=VkR5ESUbkuAfClBs5jzsNMUA3KSuLpDcQ4nYZG5LL5E=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=LDnjGMKrrAmFzE4m/smVbUuUlXBiCL0kknbGjtLFHvHyDPvr2KGz5t3qapP1698tq
	 y84mhmUAJ4mg9taEHYMQddfcIZsj+ix596LUAlx9ht372icy31DskNiV/gu8Rh2H5L
	 8/9CgADXvxb0Q5gV4aX2Qk0ryU5CIIokhpQIeqxMKMrfwM1Z2HElYGJlUe7cp+c+Dx
	 nOxC0O8nD4VM4NWsRahPWrRSMtQMLPBN/hJE6GhXSEG+Sa3vRmfIlLHyYingLixPdW
	 q3S1SV1H4fAfXWhj8mdSxx1V8VNUOjt5U0C9c3JnkUZicTVNZXnC5CTdnc/KmNd01Z
	 sMrt4IoAJUymw==
Date: Mon, 13 Jul 2026 02:35:14 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>, 
 Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-arm-msm@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>, 
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
In-Reply-To: <20260713-rproc-v13-2-41011cbcda3e@oss.qualcomm.com>
References: <20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com>
 <20260713-rproc-v13-2-41011cbcda3e@oss.qualcomm.com>
Message-Id: <178392811408.3513372.8808900729665343167.robh@kernel.org>
Subject: Re: [PATCH v13 2/6] dt-bindings: remoteproc: qcom: document
 hexagon based WCSS secure PIL
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118659-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:vignesh.viswanathan@oss.qualcomm.com,m:manikanta.mylavarapu@oss.qualcomm.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:george.moussalem@outlook.com,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:gokul.sriram.p@oss.qualcomm.com,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,vger.kernel.org,linaro.org,outlook.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,outlook.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF42D748485


On Mon, 13 Jul 2026 12:02:18 +0530, Varadarajan Narayanan wrote:
> From: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
> 
> Add new binding document for hexagon based WCSS secure PIL remoteproc.
> IPQ5018, IPQ5332 and IPQ9574 follow secure PIL remoteproc.
> 
> Signed-off-by: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> [ Dropped ipq5424 support ]
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  .../remoteproc/qcom,ipq5018-wcss-sec-pil.yaml      | 178 +++++++++++++++++++++
>  1 file changed, 178 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml: properties:qcom,smem-states:items:0: 'anyOf' conditional failed, one must be fixed:
	'items' is a required property
	'minItems' is a required property
	'maxItems' is a required property
	from schema $id: http://devicetree.org/meta-schemas/items.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml: properties:qcom,smem-states:items:1: 'anyOf' conditional failed, one must be fixed:
	'items' is a required property
	'minItems' is a required property
	'maxItems' is a required property
	from schema $id: http://devicetree.org/meta-schemas/items.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260713-rproc-v13-2-41011cbcda3e@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


