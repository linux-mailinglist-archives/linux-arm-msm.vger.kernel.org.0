Return-Path: <linux-arm-msm+bounces-115521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tiQHIDoBRGrPnAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 19:47:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 041EF6E7053
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 19:47:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=EWfgRBmA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115521-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115521-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6A75430393F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 17:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABD023DC86D;
	Tue, 30 Jun 2026 17:47:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFAE2DB794;
	Tue, 30 Jun 2026 17:47:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782841653; cv=none; b=kIVG9H0VFwCDISD4aSrToZMbrgmryAHes3DB7Hwxos4MI1LHlD7pdX4/BSDgw6YC+zbgMf+UoZM8ZYHhqRuw6urMRMc7RDzpPFy9xsf1hpPwBo6MofExX56leX4CxvBxIGhdw4Gq42te7u0xJn22cAkVaE+tTl/F9Q1pjcprk9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782841653; c=relaxed/simple;
	bh=XW4iUjVnb4D9jI5ydYsjbhP127xGVB6ghCda72WgOC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BQze3ox6VEgX26rdvtoLsaQDgRk9pMdfuObleqdXecC2pHBdTgu6nrToeCG4W6INt2VIhMb1FlrbNpQwQs+/OS2+jml/+9wRq/PodWNILp0bBgdiqEZeP5tNhAfqwG5976lrqLfr3tFJ/eoXPmCwp3IJFFWggCEZqUGEUv/TASM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EWfgRBmA; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DE501F000E9;
	Tue, 30 Jun 2026 17:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782841652;
	bh=VludPtiNt/4OgEhY2vReMAGLmH75oM7QiBiAd69e6dI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EWfgRBmAO8mwpzUrAM/0wQhvMt2zhExXSzxpONmLn9SOCdddoZU6z3i/lvcofDgdX
	 MlRAfHMfN9TNIMUz666iPb5u+64KMLbAkgVqNgFnd7dpQOXUkB5PMXQg1v6hvPS7MR
	 Am3JpPp18e59yE5ePurzXhdgH6GdUf8Y91ZbQxXdNTULth3/9nlfeXUORBqcNOKM3I
	 TyQ0MsQHokXbDycjiT7W1JJ9y+7p/Liv7/JcVHDfeVhoUvbcu2/TykOs5/VcvqOKQg
	 SKDWqjrrTSyVJ0MgsIRdZKBfiC3lc52AAIb1lPKkdiUNQewEzdDDBtkVpU+mcu63mU
	 tR4rFLSu/AMkA==
Date: Tue, 30 Jun 2026 12:47:31 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: aiqun.yu@oss.qualcomm.com, linux-crypto@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	devicetree@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
	linux-kernel@vger.kernel.org, yijie.yang@oss.qualcomm.com,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	trilok.soni@oss.qualcomm.com,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v2 3/3] dt-bindings: crypto: qcom,ice: Fix missing
 power-domain and iface clk on Hawi
Message-ID: <178284165109.4128424.1410136801617960222.robh@kernel.org>
References: <20260628-maili-crypto-v2-0-f8ce760f71d6@oss.qualcomm.com>
 <20260628-maili-crypto-v2-3-f8ce760f71d6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628-maili-crypto-v2-3-f8ce760f71d6@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-115521-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jingyi.wang@oss.qualcomm.com,m:aiqun.yu@oss.qualcomm.com,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:herbert@gondor.apana.org.au,m:devicetree@vger.kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:yijie.yang@oss.qualcomm.com,m:andersson@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:trilok.soni@oss.qualcomm.com,m:davem@davemloft.net,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 041EF6E7053


On Sun, 28 Jun 2026 23:44:37 -0700, Jingyi Wang wrote:
> Fix the DT bindings for inline-crypto engine to require the UFS_PHY_GDSC
> power-domain and iface clock on Qualcomm Hawi platform.
> 
> Fixes: d273b258d8d58 ("dt-bindings: crypto: qcom,inline-crypto-engine: Document Hawi ICE")
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


