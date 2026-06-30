Return-Path: <linux-arm-msm+bounces-115303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kbbMMw9vQ2p8YQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 09:23:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDDF6E1190
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 09:23:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=CuI42o3N;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115303-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115303-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4CD43053890
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 07:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 490B737E2E5;
	Tue, 30 Jun 2026 07:20:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5143E15C14F;
	Tue, 30 Jun 2026 07:20:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782804004; cv=none; b=Vq4PADaqu9U6td3pPMAbRdiDg7h/+rmPrjdu/h4R0Se29xDyEXFkiOOTbV/p4U15gS71dZqGzlG8x/XOvGWCYj68mPc2nu1elBcmRu234pmL4MNflfHCiZlzZi6Xg0vBpcr0WS7FYTfg9J3WFxClyY4nYpB92jbYgMcKcoQuY9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782804004; c=relaxed/simple;
	bh=Icb4XoGB7vI72rZIiyKUM568WlOEx6b1q7mfyjb9zJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V9HhstZHOh/Drm9/oifJEeVUblxTfhb3iVGXu8tmoJVHWMHgfNgOIHO3c4fQRzLaS4KSLJkd/Attu45WPrpOjHWqNHDhTwuwUq4VKpe+uwqS4KnLMjjc3UzOC7Aotge64r94jDzH73Gpf92vWmWWrstv6iqtbxPPM3Lx4DoaHsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CuI42o3N; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D287A1F00AC4;
	Tue, 30 Jun 2026 07:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782804003;
	bh=Icb4XoGB7vI72rZIiyKUM568WlOEx6b1q7mfyjb9zJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CuI42o3NsL6WBwo9sx7QVaNS2n2+TI6iO6TYF/9HTMS/vvMhDN4STRtT4GQzAZ2Sp
	 OeWEiVTUvJNw18FrvGTNQ+OtM7y9zzbuJ3DlWa2Z3AicBlY0P+FJ6l5Ykm27uHdCdB
	 2YcoNhW+lMuglIXB4FpFrtbxfhbdh6TGcNRhSyXOkOgAcYexYNhApxfhrXbKT0R6Op
	 CAEu7MK3b6GA5RWFSKtcr/OYWeapkqFGFALoK0/U3IIpGrBkpdxLKzjTab8epw0Be1
	 BOYKot76jnIYrm17dQlPX0pkrr90/RRbgM0CK523QcZgOMun33UFozDMha4CGi1/Nl
	 LPwW3h6roILLQ==
Date: Tue, 30 Jun 2026 09:19:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: embedded-controller: qcom,hamoa-crd-ec:
 Add Purwa IOT EVK
Message-ID: <20260630-unstoppable-phoenix-of-dew-9f0bd5@quoll>
References: <20260629-ec_support_for_purwa_evk-v1-0-e082b70138d6@oss.qualcomm.com>
 <20260629-ec_support_for_purwa_evk-v1-1-e082b70138d6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260629-ec_support_for_purwa_evk-v1-1-e082b70138d6@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:anvesh.p@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-115303-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,quoll:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3FDDF6E1190

On Mon, Jun 29, 2026 at 04:10:17PM +0530, Anvesh Jain P wrote:
> Document the qcom,purwa-iot-evk-ec compatible for the embedded controller
> found on Purwa IOT EVK boards. Like the other reference designs, it uses

EC on an IoT device? This needs some explanation of hardware.

Best regards,
Krzysztof


