Return-Path: <linux-arm-msm+bounces-113673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9CFABpzOMmrT5gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 18:43:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF5669B742
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 18:43:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=LtPPEq5a;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113673-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113673-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39E2831F8CA4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 16:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 662844A3416;
	Wed, 17 Jun 2026 16:32:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8504BC010;
	Wed, 17 Jun 2026 16:32:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781713974; cv=none; b=fl1yTrPdQT/MalWogWT1iMFrkiDyv/2vgsE2/VCh1dosB9OFXPOZmsO8amHzSMqGYvq1UN2hkuLG/QFQ7Ajez9Htr7e9h2zsYlrtvhDk04nLJILOqT7/t4XYz/mnW+3IJ7FLxW0c/vGGoflqmZBsXJej+CNYWgRrrBbHktcVumE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781713974; c=relaxed/simple;
	bh=lauA3KhQOJ2vR8L23iRATb3eVlvAsvvyRywvGKgSrLA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NmcVxCaQ5uQw8RyiOEhltJp+50wEwxQCiljjokS4owStqxwMhQUmxhO9OiBgfC1eJb2TbjFb0bz6sO7EbKTEa36DtTKh+sMkPGBYhzNa7f6Zm5TVuWg/g5c1T62IkxxSC44g52w90JMoLAajpSZI9MHY5tXj4w6VNQ+XHQIh+RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LtPPEq5a; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0302B1F000E9;
	Wed, 17 Jun 2026 16:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781713967;
	bh=5d/2tc0EopS1tIZ0a3SHGqtQX51JXWpYZtaG0CjTUVo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=LtPPEq5ai+b1COnw25xTntRxnIwpdO35PjOKcEy0Jg1xIeGy+dgtxQGsqCPQ+wzJ7
	 jyjatBIR1loIdhTDSMeentWFOvLqojAMakp8agChi6mO9pEaLzYJsgkK+eZWJy/Kmg
	 A4+BXI8LmI8n2IzlR2KFoCt7BIcPJ2PZVkHSw3n73Ip/hgYMJmwNDW5cZId6jdJpjq
	 EaKRjBTs7tRp6n9uZsqGscawrulHhjPOUuwHY3h7fq3AqnK1HKBIaiDwANtHYtLtX/
	 MqJSikDgHX31Rcdo4BtYGl33KN/NtLfoozcPNxRZ6dlZv2LL3Sa7War/6u9fHKAarJ
	 qZJ/la94wHOnA==
From: Thomas Gleixner <tglx@kernel.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad
 Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>, Maulik Shah
 <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] irqchip/qcom-pdc: Add puwra compatible for PDC
 secondary mode
In-Reply-To: <20260616-purwa-pdc-v2-3-8dda7ef25ce5@oss.qualcomm.com>
References: <20260616-purwa-pdc-v2-0-8dda7ef25ce5@oss.qualcomm.com>
 <20260616-purwa-pdc-v2-3-8dda7ef25ce5@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 18:32:44 +0200
Message-ID: <87mrwtcekz.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113673-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maulik.shah@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tglx@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fw13:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9CF5669B742

On Tue, Jun 16 2026 at 15:57, Maulik Shah wrote:
> --- a/drivers/irqchip/qcom-pdc.c
> +++ b/drivers/irqchip/qcom-pdc.c
> @@ -704,7 +704,10 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
>  		}
>  
>  		pdc->x1e_quirk = true;
> +	}
>  
> +	if (of_device_is_compatible(node, "qcom,x1e80100-pdc") ||
> +	    of_device_is_compatible(node, "qcom,x1p42100-pdc")) {
>  		if (!qcom_scm_is_available())
>  			return -EPROBE_DEFER;

Bah. Can you please prominently tell in the cover letter that the series
has dependencies on some other series instead of hiding that information
in a lump of sha1 references which do not exist for me?


