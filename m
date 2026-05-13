Return-Path: <linux-arm-msm+bounces-107494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SYQfM+31BGrUQwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 00:06:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEA153B402
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 00:06:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AEA5730237FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 22:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B95B93CA4AF;
	Wed, 13 May 2026 22:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bunUZn/H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F683C9881;
	Wed, 13 May 2026 22:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778709994; cv=none; b=mgH40f6/jXeUeejFtMuJGXwHjNU8585GFC9HYqtSun+3ItSqUktavktnIPRb+HUdNImTDG9KfrhwMzgkSPI0OFqQjZv0pyZbsOXX2pZlq9IXV6RIfrg+gia7NO3xvIj+x0XQgrJ5niW9kgNz8bQq8x3+Kp9tdKOaa05dmAp9H6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778709994; c=relaxed/simple;
	bh=nfkr0LjzpYH7pwPCcArAAuCzVZ5SrzrsddVDAOqZiNE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=WuRYcZuaIdkLJ+hM2xTK8mv3pfdPGJbPA8kzFO9zParPw3x55Qm/lRNMz3RFODjSNt0dK+mLrrRfUzBG20JujQUZuSpoFStJOYS0inHVnTAqlEUhRG7L3aff9W9TVR0CabYGCdO6iEheKlgtI8M9jWdDF2NgYs1niut8LPqer+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bunUZn/H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE754C19425;
	Wed, 13 May 2026 22:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778709994;
	bh=nfkr0LjzpYH7pwPCcArAAuCzVZ5SrzrsddVDAOqZiNE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=bunUZn/H5HxuQnKjMU0Y5mYkD5yA92rV2WgnSonxuFCiuIZ/DsdIm2rpFddUeMoYs
	 H3/l+wK6QA7LGGRn/+URWh/VG52el1lGABi1Xc4HwYgPAlsYvGwu4p4uSDzZVUac9r
	 0ScDPgrQO8qHZ7kmKQiXf9dEoJvdJYJiSzIwkBJlomU8l0pd4uRgsR8GTLJ3vqDbC6
	 d9N1eSw7TQIsXvSL8wcPpyIIeoIeF8eC1Zca90pMzCdDk7yHZ6cuZzhU8LZEdEraSG
	 48rCZUnqaYmNz42mXXc3l84AYBRN0t/dnCXoULvJznl/NUc8o28lNyxGGW/mhlGf+G
	 ce7QNPZAXc/tQ==
Date: Wed, 13 May 2026 17:06:31 -0500
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
 Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260514-shikra-rproc-v1-1-9afdedeee002@oss.qualcomm.com>
References: <20260514-shikra-rproc-v1-0-9afdedeee002@oss.qualcomm.com>
 <20260514-shikra-rproc-v1-1-9afdedeee002@oss.qualcomm.com>
Message-Id: <177870999113.1909237.18311226930391336416.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,shikra-pas: Document
 Shikra PAS remoteprocs
X-Rspamd-Queue-Id: 3DEA153B402
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107494-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action


On Thu, 14 May 2026 00:17:30 +0530, Komal Bajaj wrote:
> Document the bindings for the CDSP, LPAICP and MPSS PAS on
> the Shikra SoC.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  .../bindings/remoteproc/qcom,shikra-pas.yaml       | 141 +++++++++++++++++++++
>  1 file changed, 141 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.example.dts:27:18: fatal error: dt-bindings/interconnect/qcom,shikra.h: No such file or directory
   27 |         #include <dt-bindings/interconnect/qcom,shikra.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1639: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260514-shikra-rproc-v1-1-9afdedeee002@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


