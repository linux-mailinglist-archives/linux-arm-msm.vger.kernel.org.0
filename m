Return-Path: <linux-arm-msm+bounces-105716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPfxHs99+GlvwAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 13:06:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AE94BC289
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 13:06:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 001BB30046AC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 11:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92DFE3A6F15;
	Mon,  4 May 2026 11:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f99U7KUs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE2F3A6F05;
	Mon,  4 May 2026 11:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777892809; cv=none; b=eLtjlpT8wZuJCZ+vYE7xfB2ptk6RoPG/5kV6d/0CmKrLdaeAh1d3uUNmv7AlQgiCJLHwoFLOtMyboES1+U6CK01/gKi7iaqIH82Zn1iGlEThjpe6t7sPbBfIg7xuOQm7f2OVab7QUJGoTr2Dm0OubSO7V0ckf0rz1fKHpGltflk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777892809; c=relaxed/simple;
	bh=P1JeksGnJfalnkW9fgltX5A7BnbUQ6Ca8G4brnUnAXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FTyMC01DVgjgMjry5mpSavKhkC2LRXrGdLqglBGqR3SDw8stS3hUueARJL143viF9Qu4kEY1i74tYZGpuE1CoJdFs5xhx28LytAqkHiWiqpUsilbv+4qBobHMnUW+IlMSZwe1eZJheUveWMCj3RD5DqfBdI6qBeiZMgsYYsADEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f99U7KUs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E654C2BCB9;
	Mon,  4 May 2026 11:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777892809;
	bh=P1JeksGnJfalnkW9fgltX5A7BnbUQ6Ca8G4brnUnAXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f99U7KUsS3Y2FYkIy67stJX/PwvCJXaSsxycKtAcbCl4nxSyIweca4yNaK0EDb/7J
	 dOCCJkRxoHWSa5OnHO0ZsiPeZdao4YeQue2Q+zxHLJIfYqTG2u3/zKpT82DF6IOjfZ
	 MIis6Pxy4CuCAcNKSUo5/6xl7gSyinzB75vR9aT1xjd6lfT8Mi9GVVJgARHnWEiXSm
	 iyGP5QLzfSxOfee7T617Vdcf65FfcszZ3vsxXtQlwTab1yyiDRMaKGZeetRLLoF1Id
	 y01nd3gzC2RF58Gh59C7FkpcKOrfykCTwA6yUJLuvcB5C79VinW8bXiQ4pxy1RUM5q
	 1uYR5RF2vbDSg==
Date: Mon, 4 May 2026 13:06:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: watchdog: qcom-wdt: Document Shikra watchdog
Message-ID: <20260504-accurate-potoo-of-efficiency-dfccad@quoll>
References: <20260501-shikra-wdog-binding-v1-1-fd8c14bc2d20@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260501-shikra-wdog-binding-v1-1-fd8c14bc2d20@oss.qualcomm.com>
X-Rspamd-Queue-Id: B2AE94BC289
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105716-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email]

On Fri, May 01, 2026 at 11:35:49PM +0530, Komal Bajaj wrote:
> Add devicetree binding for watchdog present on Qualcomm's Shikra SoC
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


