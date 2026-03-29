Return-Path: <linux-arm-msm+bounces-100589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qM3aLF32yGlUswUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 11:52:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD7735171A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 11:52:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3E9130166CB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 09:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0CC32E62AC;
	Sun, 29 Mar 2026 09:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lLgzdYcM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AB92DF14C;
	Sun, 29 Mar 2026 09:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774777946; cv=none; b=aO9gDt7HpHpfrzcypId/6HmnyM5RvL+jx7gbGSLFRx7ziBwJ0jdCy8FVJxhjxOh6fkJN+tzLcx6Yr+7x8DHtkPdgjK9WvEPzQL0BEw4O7c6MsxKfMqVuCSUiC/TIc2+gdyc3nzWkHXZaml5xs89bIyG6Mi7QWqHbEKQPT0+fREo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774777946; c=relaxed/simple;
	bh=82rkNTW1FSQ3YNJRiZvDucDMHgRw2fv7bM52UN94QCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=um/bQg3jMxxAWKvGHNP9gBCBcBfCAoQmQ6FhgZXfQ6FXBNfxRCOs7EGF2DmjwHm6NTNeCErASvmreURKQck9CVm5holi5eSFyDMQAKcE5Bl+vd0Lnnny5a3aG0zjErAsDzVpbYzKbcX2o1vRyRvIxh4Bc9Q7qEVLf5y2JGLjgpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lLgzdYcM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EECFC116C6;
	Sun, 29 Mar 2026 09:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774777946;
	bh=82rkNTW1FSQ3YNJRiZvDucDMHgRw2fv7bM52UN94QCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lLgzdYcMj1v+OuLhOPBtaIvM6XMpAlL20Z6cDE72g1LZqm9zeyaojaeN2QHeFfA1X
	 GSVBZ4bc+urBBE/Xa67iVKZ+NrM84tWW28pndyUoewYehxQJddz/dgj0pN3w6F3/LA
	 8cu+YxsDLZdTxGvrTRavDbzDfw10JvUq26Y4gN5KVlfBABnPD2bOTSNzvZ8zsas2Z7
	 Mlij9VVuKttFdBuHwmFhU5/yR9n4LCtQNxUWcSCC6S5td/zH8Mx2mrP9T0W65mUm6l
	 qdhnjcuaM5h0sUlaJkCsEzHsQ0MUHROUjwb4D95TZ0r9eRNgm0ZN0yzCkfSeyFiBLN
	 f3WIQyXqV2cMg==
Date: Sun, 29 Mar 2026 11:52:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add monaco-evk-ac-sku support
Message-ID: <20260329-accelerated-pigeon-of-joy-c6c903@quoll>
References: <20260328-monaco-evk-ac-sku-v1-0-79d166fa5571@oss.qualcomm.com>
 <20260328-monaco-evk-ac-sku-v1-1-79d166fa5571@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260328-monaco-evk-ac-sku-v1-1-79d166fa5571@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100589-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 0DD7735171A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 28, 2026 at 05:11:17PM +0530, Umang Chheda wrote:
> Introduce new bindings for the monaco-evk-ac-sku,
> an IoT board based on the QCS8300-AC variant SoC.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> 
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index ca880c105f3b..07053cc2ac1c 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -918,6 +918,7 @@ properties:
>            - enum:
>                - arduino,monza
>                - qcom,monaco-evk
> +              - qcom,monaco-evk-ac-sku

Why adding name 'sku' to the compatible? What's the meaning here?

Best regards,
Krzysztof


