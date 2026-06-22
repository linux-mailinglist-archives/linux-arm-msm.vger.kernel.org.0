Return-Path: <linux-arm-msm+bounces-113955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v8MtOKACOWqHlQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 11:38:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F776AE4FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 11:38:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=oQu3Jp12;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113955-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113955-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FFD33166147
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 09:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A239399890;
	Mon, 22 Jun 2026 09:21:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51090364049;
	Mon, 22 Jun 2026 09:21:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782120116; cv=none; b=YDa7S58lQIqcuqI2X0QtnBA4oJM7ujUehI1cjwKpz9devoizutfYwROg8tkMdZg6+QPqmV1ctpIvz3QgLLxMcBt+ziyyo7prDYecrgjSQxraTmm4nscrCspTWxhVkJbQr4+1SQA2KyDO4917y3Bm05iIexoKxUvCtUtMpMQyU24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782120116; c=relaxed/simple;
	bh=uHVf0Jy6vUIHuqEDqyAkWupfMY5pJ7s8MtJ34TcNuuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pN4g+OT2enOL8eGZnGtNNjRGkl4v8N+gDhHPsMB6KbcUaJ8KbwOPwuq4hhSng4lSEHP99s1FsNCMRY3vsaNYpdq8ZrJuFeFfl2iVNgBficwILsTtKjjBhH8gJHKerB+V6Ejv8lJdSjgjA0dGSJC6s54J1Qqym8KW85ZzgYx0AzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oQu3Jp12; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 976721F000E9;
	Mon, 22 Jun 2026 09:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782120113;
	bh=77wIqgo4jFeWA0NXSl8ibtCsUhwVKZwgljHlmjkSEoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oQu3Jp12M+W3sDDSDWTuMxQM8AiP6aGolGm18QnoHyGoKNq6o2sFA4yzKsJyPpBuK
	 vBqQP8kZjsflOBIZZuF5vlOnYQ9JpZbgvder+l0ESgiEukgdBCimwROWLOAmI9lgcw
	 94SYsR3d72svwtCy5vMjijm0SaOm/rRO5mxqIpbsB69N4a+6c6Aiuu3YBHu4VeKndY
	 gF3YJ0hsexLVOKVgzINnZHm7Tq7VTvSrf8Ur7E1tSmZpNoiKIl8w+KvkPrd634vAW/
	 GFfJBCLrvWjVC+L1yhpVzEJTj1LI1OB8QzK5EUS7eR+V0kv71YnNMApnw4hrmy4qBn
	 JQlXP+pP8f39A==
Date: Mon, 22 Jun 2026 11:21:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, konrad.dybcio@oss.qualcomm.com, 
	dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: qcom,usb-hs-phy: add
 qcom,hs-drv-slope
Message-ID: <20260622-thankful-vehement-bittern-0edc8d@quoll>
References: <20260616-submit-phy-usb-hs-vendor-init-seq-v3-0-7d21fb1d1484@herrie.org>
 <20260616-submit-phy-usb-hs-vendor-init-seq-v3-1-7d21fb1d1484@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260616-submit-phy-usb-hs-vendor-init-seq-v3-1-7d21fb1d1484@herrie.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113955-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:p.zabel@pengutronix.de,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:llvm@lists.linux.dev,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,pengutronix.de,gmail.com,google.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,oss.qualcomm.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 60F776AE4FF

On Tue, Jun 16, 2026 at 03:26:53PM +0200, Herman van Hazendonk wrote:
> The MSM8x60 / APQ8060 PHY needs three vendor ULPI register tweaks for
> stable USB operation: pre-emphasis level, CDR auto-reset and SE1
> gating in registers 0x32 and 0x36.  A survey of MSM8x60-class
> downstream board files (Qualcomm SURF/FFA/Fluid/Dragon, Samsung
> Galaxy S2 family, Sony Xperia, HTC and HP TouchPad) shows that those
> three values are identical across every reference board and can be
> hardcoded in the driver behind the existing
> qcom,usb-hs-phy-msm8660 compatible.
> 
> The only board-specific value is the 4-bit HS driver slope in bits
> [3:0] of register 0x32:
> 
>   HP TouchPad                                  5
>   HTC MSM8660 ports                            1
>   Qualcomm / Samsung / Sony reference boards   0 (silicon default)
> 
> Add a qcom,hs-drv-slope property carrying that 4-bit value, valid
> only on the qcom,usb-hs-phy-msm8660 variant.  When the property is
> absent the driver leaves the silicon default in place, matching the
> behaviour of the Qualcomm reference platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


