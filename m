Return-Path: <linux-arm-msm+bounces-112334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /lpvJlAZKWp5QgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 09:59:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8F5666DE8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 09:59:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=faIkrX2T;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112334-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112334-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C816C31557D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 07:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39576394E93;
	Wed, 10 Jun 2026 07:54:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADE638E8A3;
	Wed, 10 Jun 2026 07:54:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781078054; cv=none; b=KYphqMGGkzhizmbDvO67aDobO+2EM8XTnM4DAIiTM9YUbxbM+Xof5ja4K7bKfE0ZduiK7Zk5X9I2IHHvA2y0Ojg1m5GqjyB1eHrEORujRUYJ2v+peLaHlC66V17mK0OmlHpm4QVtl8UQ253f7JpSB/OeuH5wNlcUI89CG6nVnls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781078054; c=relaxed/simple;
	bh=EZt313V3XBHsMTSdBH4H7gf0ggLn9W/jB/Hnu4Kt9iQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UVQl95FrjlvgdsD0rxSQJb+nX76S7zSS+/jRqwg+31rJs/iwrkKiisBjpiSUbq5krcfBTfXjRp9P7LouOUrRg03ZqPoQ2IN+gkqS9/1O8Wut+T/4BFCS8n51jlqPCCENPtG8dk2gns3bk7Zs8/Z1+ViMutP7USlihx0hGmyTMV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=faIkrX2T; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 475461F00893;
	Wed, 10 Jun 2026 07:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781078053;
	bh=72J1H07Ckymot13bmg9dt75OSqZpl2qtULP3pI4S52I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=faIkrX2TGiITs/ECUR2TMszYWKzOpl64+36Y5xABGOXpkoCrzGIEPwkFEyT+7iKIc
	 oiSbyqCXWEptm7KoNImLgu5D8aCuhw9TwHPzkCnhhQkp/+V0lli+I6w16MnPEsYUZS
	 zHMGLNkfpUshFPOxcNxP60WhHGnNWkL/cfywnpxot5wUrRUfUyR8eW847EUo7+muUA
	 tJ/3/o7qoogtLd8623V3oUR3dApJj07mS9zyNlS4ajLQi/XLyikQPX9Pgfl+Zzv/xM
	 zqkcM083iA/hAvpbOxsrKnEnGBEJvmK75pwafLlzBLdnRb6k1YL3jUudi3Qwp/QKDO
	 PzDQwfWLpP6SA==
Date: Wed, 10 Jun 2026 09:54:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org, 
	daniel.lezcano@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: thermal: tsens: add ipq5210 &
 ipq9650 compatible
Message-ID: <20260610-whispering-porcupine-of-bliss-897557@quoll>
References: <20260609065447.4024695-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260609065447.4024695-2-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609065447.4024695-2-varadarajan.narayanan@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:varadarajan.narayanan@oss.qualcomm.com,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tharagopinath@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112334-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,intel.com,arm.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,quoll:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD8F5666DE8

On Tue, Jun 09, 2026 at 12:24:46PM +0530, Varadarajan Narayanan wrote:
> Add the compatible for the thermal sensors on the ipq5210 and ipq9650. The
> ipq5210 uses ipq5332-tsens as a fallback, while ipq9650 is added as a
> standalone v2 TSENS compatible with combined interrupt.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
> v2: Fix fallback definition
> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> index 7d34ba00e684..a927650c119b 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> @@ -92,6 +92,13 @@ properties:
>            - qcom,ipq5332-tsens
>            - qcom,ipq5424-tsens
>            - qcom,ipq8074-tsens
> +          - qcom,ipq9650-tsens

qcom,ipq9650-tsens need constraints for interrupts.

Best regards,
Krzysztof


