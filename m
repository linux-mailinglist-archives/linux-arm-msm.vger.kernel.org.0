Return-Path: <linux-arm-msm+bounces-115538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5IgbIygZRGrsoQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 21:29:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 732C36E791B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 21:29:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=HJDH9bzc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115538-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115538-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E544B303CEE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 19:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3C03DD526;
	Tue, 30 Jun 2026 19:29:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F89C3546E3;
	Tue, 30 Jun 2026 19:29:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782847780; cv=none; b=bflmibToPHl33t8AThIP1J33OKzE+aGBbdF8VueO/ekqewobGd5H8b8qN5ovJzY8+63NaKOXETST9TqzWfYKEkWXwzFJJpN/VRfXh3LcnWY33y58lbzqN0XJPWAy/5RK0dZ9eePzyv3GVtCTwHhR8VVqU4FWvstaExcqdQdzwFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782847780; c=relaxed/simple;
	bh=UQ7idkB16oZNRvqXTN2t6ylLNnnQY2/bylqkdCXbOl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XO/okQDmkxhhblPrtRBqgdoy9sPDisbmHu7aeHwLmPVHEO2S+kA+ynAbgJWOQ3lJAn8qv/zD5O6BxZRCEmvchQ/ERBlUFUgyxBZcH2ZeBk314glVq5ot6FG0HayDah5L8iahAEShm9j7c/TE6LCn70CaG4VFELkiu2GIQTeIDxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HJDH9bzc; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E96F1F00A3A;
	Tue, 30 Jun 2026 19:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782847778;
	bh=odnUHalfYdPtqwxNosDeWzdGUVRfJ+3jIreFbWqBzgE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HJDH9bzcHH+i0M7vrMTEgoO/ZxE7buAfX2khrVdKutK/Zcj6WS/8CS94SWG9w1JBi
	 HIkB1V7lRt5lnEgDHdBWyBOWJgcL/9IK1CaowNqGUWtxQtubfMV5jKXQ7py1ZZ0dGe
	 JsOC1YWdsvrc5Rwpfnff1/8dAgjXYIhtowgbgN/T9hG2HX+Wb3frYY73YW8A54KrDF
	 f7fw9sgdxdnRj2860w0b1IEXgT0c/IBl6KaNyvew8W8ZH2I1ykyypw6EXFzXgi7VxF
	 YkDXvry15We7qzkV7vHSbt+YEEHZe2ri3LfuV2cKoDMlql1cl8K/HFpAx6JoChWlkr
	 VGRaaar5vXGgQ==
Date: Tue, 30 Jun 2026 14:29:37 -0500
From: Rob Herring <robh@kernel.org>
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/7] dt-bindings: sound: qcom,sm8250: allow TDM slot
 properties
Message-ID: <20260630192937.GA87066-robh@kernel.org>
References: <20260630091605.4043426-1-prasad.kumpatla@oss.qualcomm.com>
 <20260630091605.4043426-6-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630091605.4043426-6-prasad.kumpatla@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115538-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:prasad.kumpatla@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 732C36E791B

On Tue, Jun 30, 2026 at 02:46:03PM +0530, Prasad Kumpatla wrote:
> Allow the standard TDM slot properties in CPU and codec endpoint
> nodes.
> 
> Some audio backends operate in TDM mode and require the slot
> configuration to be described in Devicetree. The common TDM binding
> defines dai-tdm-slot-num, dai-tdm-slot-width,
> dai-tdm-slot-tx-mask and dai-tdm-slot-rx-mask for this purpose.
> 
> Permit these standard properties in endpoint nodes so TDM-capable
> links can describe their slot configuration using the common binding.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
>  .../bindings/sound/qcom,sm8250.yaml           | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> index 15f38622b98b..c82c6c521f40 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> @@ -90,6 +90,19 @@ patternProperties:
>            sound-dai:
>              maxItems: 1
>  
> +          dai-tdm-slot-num:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description: Number of slots in use
> +
> +          dai-tdm-slot-width:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description: Width, in bits, of each slot
> +
> +        patternProperties:
> +          '^dai-tdm-slot-[rt]x-mask$':
> +            $ref: /schemas/types.yaml#/definitions/uint32-array
> +            description: Slot mask for active TDM slots

tdm-slot.yaml already defines these properties. Incorporate that into 
this schema.

Rob

