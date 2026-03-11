Return-Path: <linux-arm-msm+bounces-96901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PBKA7EosWkBrgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 09:32:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C6425F636
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 09:32:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A46C130ECC76
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 08:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4AAA35D5FC;
	Wed, 11 Mar 2026 08:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WuktVeUe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8163C35A3AD;
	Wed, 11 Mar 2026 08:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773217479; cv=none; b=qMKoOJfJMUNPG2EbTIEdf6Hy2QJ2H1eM/92si1/TuVNZsJF3N1geyhzymPVf2i+9o6cQx59snyf4lD1t6Lzv9CsDOeP4l2yKRsZbv57CBkCaAXnoiYBeoGK3M3n6GRVxKHTNu4BO7nNzdcDZKRD5OKGpmmeJA4hm1KB3ialz0sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773217479; c=relaxed/simple;
	bh=x8WXPRzj9z7k+pgkdOCuO1tcokwkt6Nj+L1KRGtmdqQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=C2zvSnxa3RqQ08rDjTt1CJfUsWBG2i66oZzm5hDxIdwcvxS6WUG2khMrhxYKQ9l36x/utDfCqbAlbhCYS6AQreQOmieqtdHAz9/15Ev1x7U27v1UZ3NKC8uwpg2z3gAi0eoCKLgg8diifKTDCL7EJY46LkD9cFWADONPQSK9y7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WuktVeUe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C27C4CEF7;
	Wed, 11 Mar 2026 08:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773217479;
	bh=x8WXPRzj9z7k+pgkdOCuO1tcokwkt6Nj+L1KRGtmdqQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=WuktVeUeQyxLz4c5fQxyKzetWwgmhQ/Qdwxot/dBWXx+jeyyzNunPRtbXSTrQqFQt
	 /I91nFb+AT1PZstNTFmn2z3cVmSwHXqOiLhK/JP7VwUqZNv3GnpdK6hTZ5UG2enfHg
	 4VTUab9KOSYMhA8FlzAqH1Yv5wxcALdbOmND/Z7Ah+nu5WTpzcfmHkG+33u+JJatdK
	 35nzFpEW0gQK+ZRukCmabr61bu/kN4EgfYIumP46SJir2r3J4y0hnzakLmbm9apR91
	 E2V3V5QjcW8WakM8rjAB1khttOQ4nFvN+5NRK+H+zuzf3/07aPnrjhiVdloOtDfIt+
	 FmEu6TUB+b8mg==
Date: Wed, 11 Mar 2026 03:24:37 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
In-Reply-To: <20260311-ayn-qcs8550-v1-1-fe8b2faad1ea@gmail.com>
References: <20260311-ayn-qcs8550-v1-0-fe8b2faad1ea@gmail.com>
 <20260311-ayn-qcs8550-v1-1-fe8b2faad1ea@gmail.com>
Message-Id: <177321747715.2240760.12516484402907450164.robh@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: arm: qcom: Add AYN QCS8550 Devices
X-Rspamd-Queue-Id: A2C6425F636
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-96901-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action


On Wed, 11 Mar 2026 01:46:04 -0500, Aaron Kling wrote:
> Namely:
> * Odin 2
> * Odin 2 Mini
> * Odin 2 Portal
> * Thor
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/awinic,aw88395.yaml:55:3: [error] duplication of key "firmware-name" in mapping (key-duplicates)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/sound/awinic,aw88395.yaml:55:3: found duplicate key "firmware-name" with value "{}" (original value: "{}")
make[2]: *** Deleting file 'Documentation/devicetree/bindings/sound/awinic,aw88395.example.dts'
Documentation/devicetree/bindings/sound/awinic,aw88395.yaml:55:3: found duplicate key "firmware-name" with value "{}" (original value: "{}")
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/sound/awinic,aw88395.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1608: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260311-ayn-qcs8550-v1-1-fe8b2faad1ea@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


