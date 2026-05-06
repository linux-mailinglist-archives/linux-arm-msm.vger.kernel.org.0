Return-Path: <linux-arm-msm+bounces-106130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wpgaOyJd+2n3aAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 17:24:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 510C34DD223
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 17:24:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0350302BA52
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 15:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3C2B3FADE2;
	Wed,  6 May 2026 15:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hvWixOoQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61C072627;
	Wed,  6 May 2026 15:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778080993; cv=none; b=IxdPBhO6LCPmfGRsAruGi5rLitl88J+qBqkTtuNsafAStGFHbCSoMp7nVFY5FUC8RCNsCqFKir/fDylb33s3NZ5S0jpuye9m1mdEWu9ygrDU6Fwoks2O7bOMuNJ7iZAYEK80KS9kVk7yy1eYJGp82TvsMZaoN6+vgNqnRfI4x0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778080993; c=relaxed/simple;
	bh=V+9LRE9DDhuKr6ZZ/HALlvqwy8cp4ENj3/Lz0I/d0fI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aQtip+CuZ5ArMCFTpl+nyQwdMFkqrz8vD8PZhWkqR4gDngcIT17WlaJuasVizHeqpudX7uyoP6tLSWcL95Pibl2LcjSyjfELSWE213NoYEO3kjS17cm5sh7icanQDw4PWvERSt3nX+bP+wkvy8NmWNThYTHSUfbtFx6GaK4tV4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hvWixOoQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A16FC2BCB0;
	Wed,  6 May 2026 15:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778080991;
	bh=V+9LRE9DDhuKr6ZZ/HALlvqwy8cp4ENj3/Lz0I/d0fI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hvWixOoQp94LAWXlAMSe65AuGtNjJPIwjei2ZvZfrTLEw6RkbRs402J/0FRU1jJGS
	 IVcUwPVSmDSVYaBQL/PWgF7YxP+wUxJBfB2tKyjqzmop7PnH4JVk25+Ofiv5fhaIX2
	 EIYIl3z8rsuc2pdu19NAzIAxlalzRLsAsF8j04JjrwjhdomahQpRE5pumyPWdjECAp
	 BAvT7dQR7TBYAC8Fhi2RvKFSNUIFbMnj1ueeNb5rE8JURggEfMcS+vvQJU8UUDVTqy
	 U//LnHbz2B+Jh7Sn6XWjKMsGFDnWaPgjEW79BL9WrDi8di9khPccGSZ8U7t5On2rlt
	 qDN1NCizghgsA==
Date: Wed, 6 May 2026 10:23:09 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: crypto: qcom-qce: document the Nord crypto
 engine
Message-ID: <177808098870.2152824.11717885412954046946.robh@kernel.org>
References: <20260429081021.16380-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429081021.16380-1-bartosz.golaszewski@oss.qualcomm.com>
X-Rspamd-Queue-Id: 510C34DD223
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,gondor.apana.org.au,davemloft.net];
	TAGGED_FROM(0.00)[bounces-106130-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]


On Wed, 29 Apr 2026 10:10:20 +0200, Bartosz Golaszewski wrote:
> Document the crypto engine on the Qualcomm Nord Platform.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


