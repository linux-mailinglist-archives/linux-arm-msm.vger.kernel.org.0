Return-Path: <linux-arm-msm+bounces-100929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mH6IHzUjy2kiEQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 03:28:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 214F8363136
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 03:28:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 291C6304B008
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 01:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C66B33E367;
	Tue, 31 Mar 2026 01:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s2zfqob1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190023242A4;
	Tue, 31 Mar 2026 01:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774920447; cv=none; b=C47eI1B6kCMsw+O/RkdIoK/RXhKPOORzBCwblMqLqsy4g5a7gQquHGjZ6G5Xg638xHZ+QuNsug5gmkzqC3aaUCcdi81TYwCYoq2zFrEBDTZHf94XhgyBnyF/wUXyk7NZz3rLL8owY1Ny1Yknb+pbIedyekVmXEFfxHtnTDXLiO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774920447; c=relaxed/simple;
	bh=kapsyZIBVUroUUNajFkxmom2J6m4kP6pbhF+wtAGe1w=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=UWuYr8dukaGnIKPKLbrAezy2EHwzQHLWsJbHeHJ2ax9CQDh8qtx848b31fFVHrCDKUdR/w+zGrZbm/9uJsUNba6H27eH70W6Yada8BjRCZ3mfQ9frhRFPEojA0tVV1h5bennHtf7Z3FmGaZbvjvhM0ecMPlrSZC8SWCbIsixHY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s2zfqob1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 564AAC4CEF7;
	Tue, 31 Mar 2026 01:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774920446;
	bh=kapsyZIBVUroUUNajFkxmom2J6m4kP6pbhF+wtAGe1w=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=s2zfqob1JZMTVWiaB6+EWyeeD3Imgk2m0lidZuq31dXI5h2UG+dyvc7ks4E9pGx9u
	 1sxWU/3N3Tf1Cy+DOXxGhDOMSvIdm4hIMo/WIPyAVYYOFx2ZXey16x46OVkwd2UQAY
	 Sobanj6a9GS9mZGftMFIcRU1H0h8VE9qh277OMNJqvzSGiqJiA1+e6TTOAPRvnF2rp
	 82Eb6TQ5pZd/XmV1860HzByoCsKEJUXgv1hyMf1fvn0XR8/X06iszKyDq8VBQeiFsH
	 LJklszk3vpJMzww5kYYZw7XfuoIn198PGPz2iP+MNcJtHVWq2SQtj0SN5vvr7oPmE1
	 OHAXNYVqzTWKQ==
Date: Mon, 30 Mar 2026 20:27:23 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Georgi Djakov <djakov@kernel.org>, 
 linux-pm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Mike Tipton <mike.tipton@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
In-Reply-To: <20260330-icc-hawi-v1-1-4b54a9e7d38c@oss.qualcomm.com>
References: <20260330-icc-hawi-v1-0-4b54a9e7d38c@oss.qualcomm.com>
 <20260330-icc-hawi-v1-1-4b54a9e7d38c@oss.qualcomm.com>
Message-Id: <177492044387.3803846.4874547665749104183.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: document the RPMh
 Network-On-Chip interconnect in Hawi SoC
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100929-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 214F8363136
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 30 Mar 2026 17:40:00 -0700, Vivek Aknurwar wrote:
> Document the RPMh Network-On-Chip Interconnect of the Hawi platform.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  .../bindings/interconnect/qcom,hawi-rpmh.yaml      | 126 ++++++++++++++++
>  include/dt-bindings/interconnect/qcom,hawi-rpmh.h  | 164 +++++++++++++++++++++
>  2 files changed, 290 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interconnect/qcom,hawi-rpmh.example.dtb: interconnect@f00000 (qcom,hawi-aggre1-noc): reg: [[0, 15728640], [0, 345088]] is too long
	from schema $id: http://devicetree.org/schemas/interconnect/qcom,hawi-rpmh.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260330-icc-hawi-v1-1-4b54a9e7d38c@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


