Return-Path: <linux-arm-msm+bounces-112724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id blXcN8eZKmpltQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:19:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E790671404
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:19:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ABgAUygN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112724-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112724-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A75932D90EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD753DD85C;
	Thu, 11 Jun 2026 11:15:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818E13D9693;
	Thu, 11 Jun 2026 11:15:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781176508; cv=none; b=SqTHhMOYt0fPTh2M8FeDGJLtgDkd8TLKfrF7O04ri8SEFR2q/b1MZby2JBH7m5B37QJN2qEcsx7tR+k5e5B2zRwoDZAESKWeFkEN761KSGoZsadW2g9ABLiKfuxSdv84mgaMH46xI2kOcwygX9ynmqzy1xXjCHgEt7LUZOUBooc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781176508; c=relaxed/simple;
	bh=QcDQmEWfXryFiEHsQDpU7pCWRki60Y0EBQFaXVw6nvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pLKIHjcaD7LdcgHWjrO5nDOJOdds8UKVsjSHY+7Sv8IxdfW7y1ppb3Af5zzk3O9suJDhFJxG1PwHS9hT/YhA+KHG9dp38KGsrfAhmI4qDyst4ZAumCshr/CS+sFIkNwUaICnK/G+B1MD82WAyaA8yRQkdyPmPC+B5gUC23xljFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ABgAUygN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63BB01F00893;
	Thu, 11 Jun 2026 11:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781176507;
	bh=eiOE8vVz5OGc1lHCEeMyCTtaRiC/BRktpZAb812CfB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ABgAUygNo1qA032l/mHOs7ejxd526JKw+2A8A5mQSQGpsrMSIPV3Gr/Mi1tospcbA
	 qDll/0RhYf0fZY1qmyND5rjcHxuUd6Evmz/CjjBU3ALzJuYSrhSTCuDJLwhL+s+da9
	 PMjtAmceMkjfTGgqaF3x8gW+k1ZXOPwWDizCNv9c3JkDA6MeuEq8p47eXTwB+l+UfZ
	 f330JAvG8ftNODUqPJGaeHLZJvWVQs/onlqPZrfAOYD4v0BBL4pRcgrsSxxrQxiWnI
	 v4u8aXheYJwJiCZ6Ex6NsWwZKI4oFUu2DKJ1K30iWooPGTgupgRe0LIs5Y5785S1XU
	 aHLXSc8EPQXPQ==
Date: Thu, 11 Jun 2026 16:45:02 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add support for the QMP PCIe PHYs in Qualcomm IPQ9650
Message-ID: <aiqYtowP2DQt7Jw0@vaman>
References: <20260602-ipq9650_pcie_phy-v1-0-d8c32a36dbd9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-ipq9650_pcie_phy-v1-0-d8c32a36dbd9@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112724-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kathiravan.thirumoorthy@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[vkoul@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,vaman:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E790671404

On 02-06-26, 14:40, Kathiravan Thirumoorthy wrote:
> Qualcomm's IPQ9650 SoC has 3 Gen3 dual lane and 2 Gen3 single lane
> controllers with the QMP PHYs. Unlike the PHYs in the other IPQ SoC,
> refgen supply is needed to bringup the PHYs. Both single and dual lane
> shares the same HW init sequence. So reuse the tables.
> 
> Document the compatible along with refgen supply and add the phy driver
> support for it.

Please rebase this on phy-next tomorrow. It does not apply for me due to
changes applied ealier today

-- 
~Vinod

