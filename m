Return-Path: <linux-arm-msm+bounces-108613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OE3SESnuDGqJqAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 01:11:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D744B585F2C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 01:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6E00530285DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 23:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D054936E47A;
	Tue, 19 May 2026 23:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LPau1jr/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE0014BF97;
	Tue, 19 May 2026 23:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779232270; cv=none; b=Ejtdmb3n23XMjEmYPqrQKWq3Xx5uAsjt7HHfqPmyOR3dsPnZb8pnmuRnn3zkNHR2p9ini/95CHFibGbF3qPDE7S+kEzSrFxW11a3XSFf/xxpejNROAVxGM6Q3tlIkG11IHLVvSnDuwZqHmvMqZGddTxBd2BzE9X945HVU64d2To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779232270; c=relaxed/simple;
	bh=XRkWFUN5Pq7UaVRKQPWp4gF9xtI+lX6zoYyM5fR+Of0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=AxuZUZAOtsdmbBlrwPvFOK2JQPmhx66y8q0sRInotR6KGPLnGiGf+aN05wiS7cZHOBcAgtXPHLULn9WZ7dD6N5bQOWA6Aiwt0TorVy7I/8NEhAKUizrEaFW6uLHoUKoUIXOAAEZWHoyJIJ2h6198vyKdMP3wADWf1Z3E3dWhxrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LPau1jr/; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E26B1F000E9;
	Tue, 19 May 2026 23:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779232269;
	bh=choz5NQlatwUYY4tKtQfhC0szHDMe85tY70wzbZ5LY0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=LPau1jr/3Fc/JKaWkeXcen9vIrh0Wi164UlhBeCC825CfR/gbJVr+oEMIDEN8kHeY
	 XVKYqPBSjw17ocMSTBUTyP3Fa6wqwBac1gjIi2TJ7HW7VZM8UIkKk6CcBnArfpk1+3
	 vUyWSv3NRZNiJpRqFx7BkTII5Gi1/Far6+ikmsqw9WOO8Xu1QctvuYqXnMd6q7R/fw
	 WLnVY0+R38vpp/YEaqq8oTeJsPurbV9wBblXUrSsr2UDL67JayacYKl3WnNXr2MnjK
	 00neDtNTEYfNhnjCfCS6/bwC+a6YiZp6TYe0Cc1IqtxP7HttGROzZaRVYkTV9/2sJw
	 ggc+EpLSCwx6Q==
Date: Tue, 19 May 2026 18:11:08 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, sumit.garg@kernel.org
To: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <20260520-ipq9650-remoteproc-v1-1-542feb6efb2a@oss.qualcomm.com>
References: <20260520-ipq9650-remoteproc-v1-0-542feb6efb2a@oss.qualcomm.com>
 <20260520-ipq9650-remoteproc-v1-1-542feb6efb2a@oss.qualcomm.com>
Message-Id: <177923226851.3603098.6685100105139121273.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: Document IPQ9650 Compute
 DSP
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linaro.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-108613-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,devicetree.org:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D744B585F2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 20 May 2026 00:56:17 +0530, Vignesh Viswanathan wrote:
> Add device tree binding documentation for the Qualcomm IPQ9650 CDSP
> Peripheral Authentication Service (PAS). Unlike existing PAS
> implementations, the IPQ9650 CDSP does not require power domains or an XO
> clock, requiring a separate binding.
> 
> Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
> ---
>  .../bindings/remoteproc/qcom,ipq9650-pas.yaml      | 136 +++++++++++++++++++++
>  1 file changed, 136 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/qcom,ipq9650-pas.yaml: properties:qcom,smem-states:items:0: 'anyOf' conditional failed, one must be fixed:
	'items' is a required property
	'minItems' is a required property
	'maxItems' is a required property
	from schema $id: http://devicetree.org/meta-schemas/items.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260520-ipq9650-remoteproc-v1-1-542feb6efb2a@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


