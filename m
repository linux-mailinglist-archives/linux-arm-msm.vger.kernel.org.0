Return-Path: <linux-arm-msm+bounces-111394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nGUDJz60ImqbcQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 13:34:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9930D647C18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 13:34:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="Jlc/jpAG";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111394-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111394-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 083B330210E9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 11:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9DFD4D8DBB;
	Fri,  5 Jun 2026 11:27:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A064E4D8D8C;
	Fri,  5 Jun 2026 11:27:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780658832; cv=none; b=rqVD+BsTugIjzwHKsJZvFS8o3zaI5gYiQ5tPp8Tv9YqfkLYRngg2JKT8Y77YcKbSz2deVnmplcByFaTf2Z25RUckfmESPp49NoawoFmf3nqtBkqrABdnIbg/ay7qupKlZ53joDbEPcM4FDMM8HXgw26g13MvyvQ9MuaOMfuWGSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780658832; c=relaxed/simple;
	bh=tNC7e8ph+K4ynpxRT/iomFLlYWBmIw2Q5j/JyJ+hhKs=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Dh2LD+qG4vzjR7mknPazxbitbIn9LkbSI2QejuesS5I4oCGnj2xNMSFZY+xeAK1G8jkrC6GuEEqLLe9zP7b7KtH+1YfNZ2Dq20EIVKwrCR6BczpQgoBpH3FdFus6rT2AVT/NJhVj3fsAuuj3G5PT1Tar2VRMOqU0Hsu2TxlGV9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jlc/jpAG; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB421F00898;
	Fri,  5 Jun 2026 11:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780658831;
	bh=yC0by5lCDY/lPJ1EPwJSYtDAQwVWWf0Ed5URy2sHQJE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=Jlc/jpAGvJnHR8zcA9jCl8FcV4IdLsujotn6KHFQV991DtXP0G9bbAtPZYT4XEDvE
	 s2P+vW2wWFTzbTitvk282Aq1aJ3ABXIO+w+B4F7Hbu+iwv2besV2zlQZHzA+kWmODb
	 DZ2HZXPP3YHFHv/FhIAD+tTf3o3vydk35CnBmtqIdqOF5iIdhwsBryPG//RrXy1l3w
	 AAUWJDy6VjVxXl4kwd3zZheU4vODRIbtYBktJbizd0wGPgr/n5Xr5Pdff2YTGYhMOT
	 aVwt9oDjuG+IbD0QxlcYWHi8e5IT7bSMJkg6d+DnCXhUVIfwYtLeK5mpayc35T4xZe
	 +NOlLKHoAVjPw==
Date: Fri, 05 Jun 2026 06:27:10 -0500
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
 Srinivas Kandagatla <srini@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
In-Reply-To: <20260605103739.3557573-3-harendra.gautam@oss.qualcomm.com>
References: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
 <20260605103739.3557573-3-harendra.gautam@oss.qualcomm.com>
Message-Id: <178065883033.3171433.8446753794680185025.robh@kernel.org>
Subject: Re: [PATCH 2/13] dt-bindings: sound: Add Qualcomm QAIF binding
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111394-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:conor+dt@kernel.org,m:srini@kernel.org,m:krzk+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:harendra.gautam@oss.qualcomm.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9930D647C18


On Fri, 05 Jun 2026 16:07:28 +0530, Harendra Gautam wrote:
> Add a Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU DAI
> controller used on the Shikra audio platform.
> 
> QAIF moves PCM data between system memory and external serial audio
> interfaces through the AIF path, and between memory and the internal Bolero
> digital codec through the CIF path. The controller needs a binding so
> platform Devicetree files can describe its MMIO region, DMA IOMMU stream,
> clocks, interrupt, DAI cells and per-interface AIF configuration.
> 
> Describe the single register region, one EE interrupt, the required GCC
> LPASS and audio core clocks, the DMA IOMMU mapping, and 'aif-interface@N'
> child nodes used for static PCM, TDM or MI2S configuration.
> 
> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/sound/qcom,qaif.yaml  | 353 ++++++++++++++++++
>  1 file changed, 353 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,qaif.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/sound/qcom,qaif.example.dts:28:18: fatal error: dt-bindings/clock/qcom,shikra-audiocorecc.h: No such file or directory
   28 |         #include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/sound/qcom,qaif.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1662: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260605103739.3557573-3-harendra.gautam@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


