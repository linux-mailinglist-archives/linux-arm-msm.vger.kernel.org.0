Return-Path: <linux-arm-msm+bounces-108735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKGQJxSlDWqh0wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:12:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 055F258D632
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:12:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA9EF3156F87
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AB5F3DA7D3;
	Wed, 20 May 2026 11:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NibgStms"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7326F3D812D;
	Wed, 20 May 2026 11:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278261; cv=none; b=FWV7eYj5VAqrwsqEsf5CblZn2MnQPzZbacHnsGY1R3qai26mexvrlNRo1Xvn/wVBldk66C0R96iMdAR4uUPp3r7jRZstlhOZgMeOjvTXTFgFZ7hukY3ltbU2PXZ6Ybo5myFMA0Hnp41cI8t9N7r6/z+IS+0eG+19Rcup2EjalNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278261; c=relaxed/simple;
	bh=Iin1/suN175n35D1ODeeg9QVTJCrQQJIBc8hCh7mqa0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=dGGvLOcXT1HWuyim8t2+w2ikqFOKlbH5ILI+1IujOjM6vPWs8M5skOg4tKAAYevgJWwaFGcEETQuUxGgVpOTP1rQUC5jI/cKIVFKvjt5YiO37zgHMKoyWGBGC8UK5GiIFY+TlwHhaEFIyzpcYqYQ57+hqF8GfR53vwmWZ6h50Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NibgStms; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1E6A1F000E9;
	Wed, 20 May 2026 11:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779278260;
	bh=Tvp43yTwJs2pVVHQNQRXYbNpgNqNxucMlzYQtDz5ir0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=NibgStmsexHCT37nz3yhwNVzaM1UY0hENVsBBOXKVTvOxDiF+ixfcTcOoqrRZ0nnN
	 +NBUChGwuWLAEUXEfUPK9X5+Hs425/pGdX+HEWxAE/5fXk4LzHJR2r0ibS8jQoQjDe
	 7MosGC7bjgCnY+TqvIyM+2Q1FizXL0JWFE7iBx5bldKbI0qzHBTKkcfm63EEoGotrp
	 IXFam7KIEciZunbXnsW1cDnh7g5zIQij6ZBO4Q7WAM8FeZ0lnxowmFgQOm/OA7JeW7
	 zfisEnW7EvZezczMsws0ChdWqIxydxOj+aIE9elAcRPW/3a5z3mcRjzkOqzlQeLsyq
	 54slj5rFsL60Q==
Date: Wed, 20 May 2026 06:57:39 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
In-Reply-To: <20260520093902.2064730-2-akash.kumar@oss.qualcomm.com>
References: <20260520093902.2064730-1-akash.kumar@oss.qualcomm.com>
 <20260520093902.2064730-2-akash.kumar@oss.qualcomm.com>
Message-Id: <177927825931.217788.5773775598155839362.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: usb: typec: Add Cypress CYPD6129 UCSI
 controller compatible
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108735-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 055F258D632
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 20 May 2026 15:07:32 +0530, Akash Kumar wrote:
> Document the "cypress,cypd6129" compatible string for the Cypress/Infineon
> EZ-PD CCGx UCSI controller.
> 
> The CYPD6129 is compatible with the existing CCGx binding, so allow it as a
> valid compatible and permit the existing "cypress,cypd4226" fallback where
> appropriate.
> 
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
> ---
>  .../bindings/usb/cypress,cypd4226.yaml        | 73 ++++++++++++++-----
>  1 file changed, 55 insertions(+), 18 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Lexical error: Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dts:34.31-35 Unexpected 'GPIO'
FATAL ERROR: Syntax error parsing input tree
make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1644: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260520093902.2064730-2-akash.kumar@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


