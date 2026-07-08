Return-Path: <linux-arm-msm+bounces-117579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DgIsBxUqTmp0EQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 12:44:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A779B724725
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 12:44:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=kdJXPi86;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117579-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117579-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B881D3020D25
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 10:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D77942B32E;
	Wed,  8 Jul 2026 10:43:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE97423A6D;
	Wed,  8 Jul 2026 10:43:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783507408; cv=none; b=XwQUOWD8Vq/Fco0LIvC1l8tVy2RRiMnzpnnw4g/9T06mBYyzXbRWokLIunvV9aVwDmsThXDoSAx9Uy7Pautr2FK+NFiKD5uR/ZaA9dZwKPnNWn1uFdck9wu/aWR2wTr3lp+yGQTajW3UrR0xHV9pLfcmTeI1dp3qUw+vS/oXnkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783507408; c=relaxed/simple;
	bh=groLJiBtITBZaafYb4py+DXcwhfa0gaynPiaHzseltw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+2lhRI4uf3WpXEXBNMj0fO1xI+ye8WWzsvUGpu3Mv8Ge7oIpe51L/ew8tgb4SP4661O9tpXPhbitqENdXRvuY3IRhHEakKMvWB5cC/G6nHBuAGlwpnb5lEBGlLmKqfZT7Zl6OH0X5K4btnPiIyu6i5G3smx60y7HwVGXwusrIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kdJXPi86; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54D4F1F00A3E;
	Wed,  8 Jul 2026 10:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783507395;
	bh=xgb9L3ybC7vZlTqAiwZqqpWmp0VP5DqNRODliRYFC7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kdJXPi861onpNxYXSyu/H82im8bgzEy/Tq1sP9Lqc+RqRUYgK/1J0qwa1BMi2v6AK
	 9Fm0GqOMgkpiKA9wiiPsTH9E1cuppYXbVDGXjOdRBfDJG+rOW+QnTQmUD1eub805Af
	 e/+XSu4L1Qwy58BFX/n1VaDP8RyVtAe3Q9VOspJyQY1KO3G3YvHZECiy2V6mYfJ1wF
	 fTxccpAww2s22SxBgSKtpAg5BAikZY6dp+wDFEcnq9EU0rg8+DfvJ6i4E9uCMTmtuL
	 k75cyJOKHKKGvrC66is34b0REAKTCsUYvGgfruiHA4XWWRZhGE8JBWFw3a2WYfc/tX
	 EyexGgaV8pSdw==
Date: Wed, 8 Jul 2026 12:43:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
Cc: Mark Brown <broonie@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: qcom,wcd93xx-common: don't
 require micbias4
Message-ID: <20260708-gregarious-elite-dinosaur-537d56@quoll>
References: <20260706192229.144137-1-jorijnvdgraaf@catcrafts.net>
 <20260706192229.144137-2-jorijnvdgraaf@catcrafts.net>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260706192229.144137-2-jorijnvdgraaf@catcrafts.net>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jorijnvdgraaf@catcrafts.net,m:broonie@kernel.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:luca.weiss@fairphone.com,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:mohammad.rafi.shaik@oss.qualcomm.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117579-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,fairphone.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,quoll:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,catcrafts.net:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A779B724725

On Mon, Jul 06, 2026 at 09:22:27PM +0200, Jorijn van der Graaf wrote:
> The WCD9370/9375, WCD9380/9385 and WCD9390/9395 codecs all have four
> mic bias supplies, but the upcoming WCD9378 only has three, so it
> cannot reference the common schema while qcom,micbias4-microvolt is
> required there. Move that requirement out of the common schema into
> each of the current users; no binding is relaxed by this.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
> ---
>  Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml        | 1 +
>  Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml        | 1 +
>  Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml        | 1 +
>  Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml | 1 -
>  4 files changed, 3 insertions(+), 1 deletion(-)
> 

This should be rather squashed with the next one, as wcd9378 is the
reason of doing this.

Best regards,
Krzysztof


