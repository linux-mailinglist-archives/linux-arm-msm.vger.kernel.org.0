Return-Path: <linux-arm-msm+bounces-99274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPdaMPJAwWmqRwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:32:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 217432F2F99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:32:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32A31305718C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3D383AB289;
	Mon, 23 Mar 2026 13:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o0harCq6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE583AB287;
	Mon, 23 Mar 2026 13:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272257; cv=none; b=BBk8Jdd8SblYykuuAxQY2CndU7377vol2rtWOnj7yF1euZysjHYCcNkTgUPU9uJklgXhJ82nOpm03HAHq9o7oJwulQ+C3fQdnbfKbcgdrBK7rf025QfALZyo26RaAwk18aeZyKe2WdZNH/i274QGkWtgM6cKyA+eDlySI/x//Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272257; c=relaxed/simple;
	bh=WPjonzjVFU9s/+xJsihn3MdqBZiA+8IsxWoY65z80f8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=j0oyvS1gYm8Vtp+XhDn7i3bml0/fTmG1dEmGbKWsjnrcFwV99yk77H4/36V4eVH96bbiccreDM9J0iMzBMveOGNjjCiUrOJF/QjgRhRgy9/oFWkDQxeX6pJ4rH+Jh8r1/GbIF+0YZ26OZUVrKO7Jmz6r7+nqNgLRLx0Q0/QZV3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o0harCq6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 699BFC2BCB4;
	Mon, 23 Mar 2026 13:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774272257;
	bh=WPjonzjVFU9s/+xJsihn3MdqBZiA+8IsxWoY65z80f8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=o0harCq6fhhvFunk9npvuAOSXRqnr7JBLzDcvMPtMHdsPo5D5nHQeQd5BrbNw7GKl
	 hKtuPEDKA6tP7jixlYj0QxXISf7vXffRVtJ/nbQSyfbbS4GHz0HiakFluHXL6wgaSK
	 36+MjvWMshcbDP+DUWuN2JwNdj5f57jC4TOWL4AT4pN3RnpfKaJR8FGcL4Q5JMafB+
	 cC5bAf24HSf7Nz5RahJt8iC9y4hh5Lz0tkwPK7ETVbymOBUhmlwsVdmCA7Pf/RDkKH
	 +Aeplk2x0D+rNq39FH64F7esaqAU9erjdqnohCyPzkpZqvH4IZoA9e96iRRs7INurH
	 KkdPmTifJfFFQ==
Date: Mon, 23 Mar 2026 08:24:16 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Sebastian Reichel <sre@kernel.org>, linux-arm-msm@vger.kernel.org
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
In-Reply-To: <20260323-b4-add_pwrkey_and_resin-v4-1-abef4e4dcc3d@oss.qualcomm.com>
References: <20260323-b4-add_pwrkey_and_resin-v4-0-abef4e4dcc3d@oss.qualcomm.com>
 <20260323-b4-add_pwrkey_and_resin-v4-1-abef4e4dcc3d@oss.qualcomm.com>
Message-Id: <177427225450.450704.444409694269716814.robh@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: power: reset: qcom-pon: Add new
 compatible PMM8654AU
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99274-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 217432F2F99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 23 Mar 2026 16:15:15 +0530, Rakesh Kota wrote:
> PMM8654AU is a different PMIC from PMM8650AU, even though both share
> the same PMIC subtype. Add PON compatible string for PMM8654AU PMIC
> variant.
> 
> The PMM8654AU PON block is compatible with the PMK8350 PON
> implementation, but PMM8654AU also implements additional PON registers
> beyond the baseline. Use the PMM8654AU naming to match the compatible
> string already present in the upstream pinctrl-spmi-gpio driver, keeping
> device tree and kernel driver naming consistent.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---
> Changes in v4:
>  - Remove the contain for PMK8350 and new if:then for PMM8654AU as
>    suggested by Krzysztof Kozlowski
> 
> Changes in v3:
>  - Update the commit message.
> 
> Changes in v2:
>  - Introduces PMM8654AU compatible strings as suggested by Konrad Dybcio.
> ---
>  .../devicetree/bindings/power/reset/qcom,pon.yaml  | 32 +++++++++++++++++-----
>  1 file changed, 25 insertions(+), 7 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/power/reset/qcom,pon.yaml:107:13: [warning] wrong indentation: expected 10 but found 12 (indentation)
./Documentation/devicetree/bindings/power/reset/qcom,pon.yaml:122:13: [warning] wrong indentation: expected 10 but found 12 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260323-b4-add_pwrkey_and_resin-v4-1-abef4e4dcc3d@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


