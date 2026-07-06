Return-Path: <linux-arm-msm+bounces-116658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WBwiBSBZS2pDPwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:28:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB6370D88C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:28:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Y3Lsx4sT;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116658-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116658-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F419F31BF562
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 07:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F1FA3F9F37;
	Mon,  6 Jul 2026 06:54:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80F23D5227;
	Mon,  6 Jul 2026 06:54:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783320880; cv=none; b=BUrtX2Qedi1Wk1MHZlrlmkEdaFVJ9z0cPPg8NbFVaaX4v9O5Oc5TVupqedLG9nLvLy/fbIR0Icai9fADBAqhZJO7Rjgq/GvPZaJAbvGYqztpS2VMzMyg7Iq1K+/vRFRl+NwifvM2MXyUW8IXo9ALsnSva9R2gqICL1ULULuKOwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783320880; c=relaxed/simple;
	bh=Udqsu6NXNtN6m2Q58o8NG1BYLDR+p/saClDM6K0NL6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lY4B+b55XTTTn0pz/al2RkPc7DZ2lcYyocH0pOx4w/N/DX+jtoeGvZ34EKjAOKwl3Inqk4pRaVA96FXLRTsyu2SSXyWMWci/zyLhk6zSv3GkAr7Ibk6OxTF1i4mtLliHl9Zmkl5sCsSnnJP5/8uSqwgPDp4i9Q5aLxEJmMP3Rrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y3Lsx4sT; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 439951F00A3D;
	Mon,  6 Jul 2026 06:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783320866;
	bh=mIGZ46OQ8TbJpuW2HOxSd3bMhnJo3TCWU9MeYnhulcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y3Lsx4sTXEj+hV/DhheT8WqDRz231vsXqKL1ZwbvyrgK5kXyhfvIrXbPAojeKeTm8
	 SNeyK+Snw40vJpr59PBG62ow+AySBXnK11J9zXOy0YrOE7P/ppfa9z3/dX6lxfZMGb
	 /zCVnMl12TpsZhCQCfiPuMZXUGChwcCjyc1iyYHTz9BZG47B9EPDx7YQdnGF2euynv
	 lkJ27880r/B1JpB43rUJIZLTuMgUCTvpvu/XbM3YEkzoXb73+m2r/r6FfIHUrNUzeh
	 UCQsUDivuOS9YEfCwPH7YW4LZiTOpZfEwoabUIvHt9yIR15MwdZ8NOvtpK9qUAZUUE
	 PWgcCfkttjLFA==
Date: Mon, 6 Jul 2026 08:54:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Harshal Dev <harshal.dev@oss.qualcomm.com>
Subject: Re: [PATCH RESEND] dt-bindings: crypto: qcom,inline-crypto-engine:
 Document Nord ICE
Message-ID: <20260706-busy-grumpy-limpet-c59789@quoll>
References: <20260704004408.2303468-1-shengchao.guo@oss.qualcomm.com>
 <b693a9d2-4f1d-4c17-8a63-99c7ac79ed41@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b693a9d2-4f1d-4c17-8a63-99c7ac79ed41@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:kuldeep.singh@oss.qualcomm.com,m:shengchao.guo@oss.qualcomm.com,m:herbert@gondor.apana.org.au,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:deepti.jaggi@oss.qualcomm.com,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116658-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,vger.kernel.org:from_smtp,quoll:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CCB6370D88C

On Sun, Jul 05, 2026 at 11:15:45PM +0530, Kuldeep Singh wrote:
> On 04-07-2026 06:14, Shawn Guo wrote:
> > Document Inline Crypto Engine (ICE) on Qualcomm Nord SoC.
> > 
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> > It was included in the Nord SA8797P DTS series [1] due to that
> > the prerequisite changes were picked up by Bjorn for 7.2. Resend it to
> > Herbert as the dependency is gone now with 7.2-rc1.
> > 
> > [1] https://lore.kernel.org/all/20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com/
> > 
> >  .../devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml   | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> > index db895c50e2d2..d690eff2e86d 100644
> > --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> > +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> > @@ -17,6 +17,7 @@ properties:
> >            - qcom,hawi-inline-crypto-engine
> >            - qcom,kaanapali-inline-crypto-engine
> >            - qcom,milos-inline-crypto-engine
> > +          - qcom,nord-inline-crypto-engine
> >            - qcom,qcs8300-inline-crypto-engine
> >            - qcom,sa8775p-inline-crypto-engine
> >            - qcom,sc7180-inline-crypto-engine
> > @@ -63,6 +64,7 @@ allOf:
> >              enum:
> >                - qcom,eliza-inline-crypto-engine
> >                - qcom,milos-inline-crypto-engine
> > +              - qcom,nord-inline-crypto-engine
> 
> With below patch, we don't need nord entry here.
> https://lore.kernel.org/lkml/20260702-b4-shikra_crypto_changse-v2-1-66173f2f28b3@qti.qualcomm.com/

Patch has conflict. This (Nord) should go after above one, with this
fixed.

> 
> -- 
> Regards
> Kuldeep
> 

