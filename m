Return-Path: <linux-arm-msm+bounces-110868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p51SI4taH2rckwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 00:34:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D15763278F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 00:34:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=G2FMG4WX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110868-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110868-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 268BA307DCC2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 22:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A444343886;
	Tue,  2 Jun 2026 22:34:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4312D335BA8;
	Tue,  2 Jun 2026 22:34:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780439646; cv=none; b=rx9+/I4kKyS+mjihdVpzuW71UjCXo9FrHlphQXJ7Qb3nWyuPYdxoyQHZea8U0UZ+VP+r16XQQAmhgTDE2w0nRn2G6WdmT1cMTj7p4GxcbM8XA+BOeFZfrxvua3yMz/xI3aY8m2TygOBFkNJJL0eZhiwGUQMSpNFfXeHqGOKIWYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780439646; c=relaxed/simple;
	bh=TTAdI3t7nAedPmX5mdl7IImZnFq1bD4jsWGS5JjpjVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RKn8YzvfQUFunG9zN+JEvTCJebDM5DSGBhMS4ec4+rbbq7J69Y0t+gG5/ifjpTSdLfMqmkHHwzstvuS5QdP5At2+tIjf4hJAUFjUX+RrZhTAZWmlJNtVIq4VXpjWF4N3vg4ou23J/ZPRUFjKaIS3QApNiht7C6+mYrpjCxOPhF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G2FMG4WX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CC311F00893;
	Tue,  2 Jun 2026 22:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780439645;
	bh=Ye+AtCPj6qke+geKQa6wSqdQw/tzBdjQjzKqHFuZgpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G2FMG4WXsKcjFQqb/48PBt6WCkmposK20MYzLFnL3r2rGD4man0HXIPBINPdr9JRO
	 7yjSIuhdnTcGGcD/fDrNA0UboS4ZdOuWNNuR9nHDP/75IytrmmabDsrRj6w47uc8Qp
	 97AAQOzA/2Cx43c/RPFGPijNsJPkq6bpf6UWOxYaAc2mlxMZs0l17FiYtdHO5U6jSN
	 wl/TCEcpQwTBaM5PSJ7pMBSVQKSL0srbmpBVlx5HlZ/VDqsETjofroikEDVo+EwpV5
	 i1tHlDWg9uW6LV7CgO2OaYxUbVGouRi7/pkQKgSdfnv90mdnD9TOwwBX84fKD7UM3d
	 JJhxS6Yjjx+bA==
Date: Tue, 2 Jun 2026 17:34:03 -0500
From: Rob Herring <robh@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: watchdog: qcom-wdt: Document IPQ5210
 watchdog
Message-ID: <20260602223403.GA1283330-robh@kernel.org>
References: <20260511-ipq5210_wdt_binding-v1-1-859003d48274@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-ipq5210_wdt_binding-v1-1-859003d48274@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110868-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kathiravan.thirumoorthy@oss.qualcomm.com,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_rjendra@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-watchdog@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1D15763278F

On Mon, May 11, 2026 at 04:19:13PM +0530, Kathiravan Thirumoorthy wrote:
> Document the watchdog device found on the Qualcomm IPQ5210 SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring (Arm) <robh@kernel.org>

