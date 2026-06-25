Return-Path: <linux-arm-msm+bounces-114439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B8V1GnChPGqzpwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 05:33:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F616C2947
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 05:33:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ebdE0jcG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114439-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114439-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D9AF3010392
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 03:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34A742C11FD;
	Thu, 25 Jun 2026 03:32:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267B91E9B37;
	Thu, 25 Jun 2026 03:32:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782358364; cv=none; b=jCv1CjW71+xXwF+Oge2xP4crd41yoW9OpsYGY3w+AVMSX++1aygJhMWaOnTKVI4U0BHAhB+1l+0ehUTMj/HpKD2AfCBtc/YmS7mMZ6N/4agZAjOuyViTePBCOwuPaEkkCHn0zkWxNA0/Zvmn9tN9pHRbXEQUDPHfydsxYs610DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782358364; c=relaxed/simple;
	bh=JGheuopsp2mLIfIpiy73fg30l7DNifCBvmhk/hhKNFk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=paxeecUabw5Vn20Pj9QA1DT5mMsrwnSrlygR865m3ByFmp1ZpnSYrVCkCEW4rCiVGWEKw04AXdteABoRPf9zWf2LcnC6n4FaklUVT6Y0MMN7yt6d4qLsY9XGTp1ZaguxrqKSSf79928GlwPC/JccddQJlsswsef6UeBn5N0FW54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ebdE0jcG; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85B7F1F000E9;
	Thu, 25 Jun 2026 03:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782358362;
	bh=OQmdu86f3xGWit3FX5euECxwtL9jKKb6r1TC7QBOJpg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=ebdE0jcGtbeWg4C6LNbOJu5KpB52Fhcii0PQgI7VOWesWOY5xH3q2GIErdY4mOFz0
	 2UrVBA8mC9VS+yiIM+B8bXGgz3G4GBeNH54v+q2c+Nxt1tPwLXdz5LhPK2uhjvU9EE
	 J08qaMsK7Ccj1r8YszpL7c+lzhc/s/HnbQ6nMrsgyuKRR7ZQo1VSkqGw20tBTRVZIu
	 omY+/JUDFJ+ZYGTJYy+RRSNIPrRCYye0M0I4uwEcfuB+m618tTUEgn7Km3eH7EBt/H
	 bOc7bDPYSNoY0UHZOsDQnRwdd1FUeW02llsTqZFvzDBibK9H+rNE2aGKbzz8jh1+at
	 NEE261B0ZvN0g==
Date: Wed, 24 Jun 2026 22:32:41 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, 
 Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org, 
 kernel@oss.qualcomm.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, 
 David Collins <david.collins@oss.qualcomm.com>, 
 Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-input@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 linux-arm-msm@vger.kernel.org
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <20260624-qcom-spmi-haptics-v2-2-b9118e60f3e3@oss.qualcomm.com>
References: <20260624-qcom-spmi-haptics-v2-0-b9118e60f3e3@oss.qualcomm.com>
 <20260624-qcom-spmi-haptics-v2-2-b9118e60f3e3@oss.qualcomm.com>
Message-Id: <178235836163.1577089.873414193711217000.robh@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: mfd: qcom,spmi-pmic: Document
 haptics device
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114439-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:subbaraman.narayanamurthy@oss.qualcomm.com,m:lee@kernel.org,m:devicetree@vger.kernel.org,m:kernel@oss.qualcomm.com,m:dmitry.torokhov@gmail.com,m:andersson@kernel.org,m:linux-kernel@vger.kernel.org,m:david.collins@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:linux-input@vger.kernel.org,m:sboyd@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:fenglin.wu@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B6F616C2947


On Wed, 24 Jun 2026 19:00:37 -0700, Fenglin Wu wrote:
> Some of the Qualcomm SPMI PMIC has haptics device in it, add it in the
> device list.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml: properties:qcom,vmax-microvolt: '$ref' should not be valid under {'const': '$ref'}
	hint: Standard unit suffix properties don't need a type $ref
	from schema $id: http://devicetree.org/meta-schemas/core.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/qcom,spmi-haptics.example.dtb: haptics@f000 (qcom,spmi-haptics): qcom,vmax-microvolt: 1300000 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/property-units.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260624-qcom-spmi-haptics-v2-2-b9118e60f3e3@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


