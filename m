Return-Path: <linux-arm-msm+bounces-111772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5GmdGASLJmrgYQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:27:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A686E65497B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:27:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=VRCjIg8D;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111772-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111772-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93D7E3055C34
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 09:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A10713B4EAB;
	Mon,  8 Jun 2026 09:20:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543B73B4E9A;
	Mon,  8 Jun 2026 09:20:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780910407; cv=none; b=C1DiXgPinuinZzKJcOZ+j711ISyYymMk+xN9s8yfiEvUxLUUlpkjj3fgAEElZMspo+XzEDE+jw8BC+TDgZCL2xA7/G1rVYiu/63C+Sg8lXalfLic/v/JSWuKN99yquGcdQpkdAmVTHu9WfSThtqxDt+eZ8ihXp30VuaEoHR9Gas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780910407; c=relaxed/simple;
	bh=aTc//FB64ogpv8x7yoqI2Kbc5qzMmY0zx52lOrL09eQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pld3tLUz+FzlIfZN+0HuDHTiOyhOw6gAMBA+OhT9V+4QZN1EK3ivjRbc2F8SViy+Exkc9uhsmOiRWdh5egpDcE4uNYzl96sX4qXNbMmN9LfEpljp9IaTChARUevdvHGalsP2Vmhw5yBA9MxyMNsIreb2U2IXEr5xb0btVx10Wc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VRCjIg8D; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A4D1F00898;
	Mon,  8 Jun 2026 09:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780910406;
	bh=/jiNPI3abl6/ljmC68NsVIoX7ChLV/DruJybBPaUlLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VRCjIg8DKi2vW5/zU4/c+N8rvZqkfwUicaQERR7MBRxLONe4qWVxBsEn7XQG7HNyt
	 p/e0bcGwK4jQyQwg8seZpDGOHaL1NTk0TEpaQrQi1bL6cpkt3NxEz+VKum6dVTmgB1
	 PFEQZeN+7zIfs6+PDcNzL6I26GQBQcBXh9kN1dqJmb51AzojUSYYXIYPkTAPwbjK40
	 AAB7QytVbE0zxvsQiwh7VHEfrt5fCrOuL2b1/+5AKCuDqwc1mOV8xeNxlarKSZyeOs
	 kCJ+p0Whmh7iaelFRAsqioirQboi3ASg2vle5s2d9AnuerIrkRjV5jMkN9p4JzhSUg
	 2VzyTjCJFDNFQ==
Date: Mon, 8 Jun 2026 11:20:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: soc: qcom,aoss-qmp: Document the
 Maili AOSS side channel
Message-ID: <20260608-elite-quirky-manticore-163a8e@quoll>
References: <20260604-maili-soc-binding-v2-0-21b5e9bd1aa5@oss.qualcomm.com>
 <20260604-maili-soc-binding-v2-3-21b5e9bd1aa5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260604-maili-soc-binding-v2-3-21b5e9bd1aa5@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111772-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jingyi.wang@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:chunkai.deng@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gurudas.dev,oss.qualcomm.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,quoll:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A686E65497B

On Thu, Jun 04, 2026 at 10:45:46PM -0700, Jingyi Wang wrote:
> From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
> 
> Document the Always-on Subsystem side channel on Qualcomm Maili SoC.
> 
> Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


