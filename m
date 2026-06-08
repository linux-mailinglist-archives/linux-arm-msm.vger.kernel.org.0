Return-Path: <linux-arm-msm+bounces-111739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mJAQFJV6Jmp1XAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:17:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1681C653EB0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:17:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=UULiXXlw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111739-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111739-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 307D1300FB54
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 08:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 189533A2E12;
	Mon,  8 Jun 2026 08:17:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7C43A1CEA;
	Mon,  8 Jun 2026 08:17:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780906643; cv=none; b=gwcuc0U6xM4aaFBgWAzcb+YRPSGG/2SY/j5x+N5szdVr4gbJDHrROtbjyGqtgHpoWY092TOYhWMaFyi0iqwxl6VV2lqPh2MNvkb8JK0YoW9cY4yOf4EC8egLQFASqmWKFFkLlDWbXuhDCP8ws6In5gNUqlkssbO6uUgS9BQB3OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780906643; c=relaxed/simple;
	bh=Smo7vaYdgJbjdwe4zMSCkS5vLybmJZBzk9AMg9PVf9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=umqCNNiU43zWrkIvOV6sOCw0Dv0q6kaD+DEgLl10yqiaLCysbQnNb6UX6/cAYQipNuibSnuieXZkFeysNDUF0pi0X0rh5eBTwVXvzFuuQ7LCFiox+IxF7lFSZDab+VNeKirFjcR2ZN8ckYSAN988RdBEJLSvhTN1WdqIeC8Mx8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UULiXXlw; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E52981F00893;
	Mon,  8 Jun 2026 08:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780906641;
	bh=OgeOpFSIPgKUbz4DT+ib8NeaE1Y/vYjn5jY7luka4/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UULiXXlwitYFlgTTt7odM/K4+X39E7kWzP15CPn673Q39EgfYCB/BI7sy7oKcEYbF
	 kcukAlc3lLvwTIX10SWBK+kX9fYgpWX4bC/3cu8w2EJqRpEO/6Hxbkkz/SsXu23gYj
	 XWtHUKI2CsX6Y4oUQMfeLv4oAHTmH93F5MNMozkFP5zGXUifnMdTP16uiuWf0EmP/q
	 YXch3/LXWG5DODAD0XsvTe3RKz+SBOCdf/8j3TXOQfWtYy/m9ME+RMvjzGgdzizSQW
	 8DXvYeK084ARbhuexysb08fx6hHwobpjfjqm9JRKvp1VhtLzVp6JwREF84tgJKVGRE
	 EaQi6nS1fGOgw==
Date: Mon, 8 Jun 2026 10:17:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, quic_wcheng@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Add ipq5210 to USB
 DWC3
Message-ID: <20260608-vivacious-armadillo-of-wholeness-25897e@quoll>
References: <20260604090528.735236-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260604090528.735236-1-varadarajan.narayanan@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111739-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:varadarajan.narayanan@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1681C653EB0

On Thu, Jun 04, 2026 at 02:35:28PM +0530, Varadarajan Narayanan wrote:
> IPQ5210 includes a Qualcomm DWC3 USB controller supported by the existing
> binding. Add its compatible string to the schema and include it in the
> matching conditional constraints.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


