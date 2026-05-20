Return-Path: <linux-arm-msm+bounces-108868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPVWKtz3DWry4wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 20:05:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1952C59540E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 20:05:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A265032C0623
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F77C3EEAED;
	Wed, 20 May 2026 16:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GYsbXkOL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F44A3EA953;
	Wed, 20 May 2026 16:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779296292; cv=none; b=LOZ+DHdES7yTWUKCEiMQHSiuYGn/gPMa1d9bwD4H8Bdbp8V3fSv8jJIXfwEK4iFZFlhmJsbSw0AxoEnwsCPlufejvE36w+lDhdOIg/P+11yhSE+avMKhgGWVwjVe2tJ2ltd6LxfeSN6kQE2jzO/hNuXhI0sAKSG+7c/s4VKph8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779296292; c=relaxed/simple;
	bh=bVcP/aJZZ+bB4VgJiU5DuE2T6t9aYInb3Raktfgd62Y=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=cMt0Co0blpdeZuikSk2jWWl+j7iASVZqv1MIt2fEcBv2i+MgUJRa+IYiqSxAFmGe18sfZ9Ma9OMQ8k3lYa6JkJ+PkDnsgM1YlSaCHwUOY6rVK/MyAMRsSmS2wqaHBD3R2V+5Qxjnji9qMxZoaGF56HC5sPYl0RXTPp7i1C5A/Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GYsbXkOL; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F28C01F000E9;
	Wed, 20 May 2026 16:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779296291;
	bh=kLVDFFs0ueJHpFJ5OSehtykxxE2mbwX6aQ3/A/ELP8g=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=GYsbXkOLOOh6zvHULzRgvtEQzXM8mjB6n2PwoMo8oxUp+sQvJUn7UFKUADB8E5xct
	 WexGm4iX8lixkZ5oMSdnKeTenSkLQ7/t30IPGNodW8V/wSktTZ6dN68IQUjZxQMtv3
	 lm477Ts3rKV+6+I3F3NjWoGPqVuja/3zWuQ6f6IEo+47wCPvScsYPhanQCjL30s28E
	 OzS4t3q5tWULqoxWx45NxxiB1/ZQFcYC76vtTapSZByYlV1ks2o42yZBF9ZVJ5nHz/
	 mVvHTWsNGBIwLi1Wf6lwuKwDwUx1cxKMGm0BsT0tKi4MX8IMikOWszGecJXdWdW3sD
	 EWLnSJnUCwNzQ==
Date: Wed, 20 May 2026 11:58:10 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260520-shikra-rproc-v2-1-583a2e413a3a@oss.qualcomm.com>
References: <20260520-shikra-rproc-v2-0-583a2e413a3a@oss.qualcomm.com>
 <20260520-shikra-rproc-v2-1-583a2e413a3a@oss.qualcomm.com>
Message-Id: <177929629036.534086.9871910456803819494.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: qcom,shikra-pas:
 Document Shikra PAS remoteprocs
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108868-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 1952C59540E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 20 May 2026 20:08:05 +0530, Komal Bajaj wrote:
> Document the bindings for the CDSP, LPAICP and MPSS PAS on
> the Shikra SoC.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  .../bindings/remoteproc/qcom,shikra-pas.yaml       | 157 +++++++++++++++++++++
>  1 file changed, 157 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml: properties:qcom,smem-states:items:0: 'anyOf' conditional failed, one must be fixed:
	'items' is a required property
	'minItems' is a required property
	'maxItems' is a required property
	from schema $id: http://devicetree.org/meta-schemas/items.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260520-shikra-rproc-v2-1-583a2e413a3a@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


