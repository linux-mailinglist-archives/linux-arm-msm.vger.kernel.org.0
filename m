Return-Path: <linux-arm-msm+bounces-104034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YM56JNd86GmsKwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 09:46:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EACD044318B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 09:46:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D924F3027691
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 07:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB38372B4B;
	Wed, 22 Apr 2026 07:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m53pYEK5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D986136A030;
	Wed, 22 Apr 2026 07:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776843559; cv=none; b=GWvtPTlf/1AOAJmTAjL5H1IAnt5GqiMXqbvBXOwSHSfQ1u8MGgYKvJ1PVlBCUcRmhwmplTutHPSFgNrsIF1Z7N5gj5CEyYD4iBBd7d4RMbeab/PEDw7T2ZvLNmezqlLHlmTT9xyHj+giAzrmhxGfjBsAuXO/V2NeN/hTkD+AUB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776843559; c=relaxed/simple;
	bh=K2g2IOXH6S1Wv3EbDLJqzdJstHJgCuN4Hu7yxq+RvKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pcESD5fwZctwqt7EGM1Qmd4ShglYogCDP3l1DotcpoN4VIaivl4vD9aOcGHXHD4PPfdwauzhfifK3kMaVYb+vBIybL9yIAQZ3YAwYQXyuQDnx5v3XCH4gESNih4ighrhCtMvQaTtnVLgVCR2upwJCBWfZ3/kQC7qAQ7VEcm+Sns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m53pYEK5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E87AEC19425;
	Wed, 22 Apr 2026 07:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776843559;
	bh=K2g2IOXH6S1Wv3EbDLJqzdJstHJgCuN4Hu7yxq+RvKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m53pYEK5nUqqtuepTTIo3nQQcg1yvksqWpappUYTonCok07CDJeMStDfXfzuCvP2m
	 yFc6dv5zRfsKMV4dwd1/9QZeUv9Oxqf81E3A+V4HTeIAdigc/2/9NoD8564p7pZ4Z4
	 aIu8TDfWFMUIKHAt4y9cRLPaffVbGqadQAXsXuwtnJ41lZFgbUt0F8r2mx+rFeE7PM
	 IIXqSxpLpdGz+ickrqJQevU4WbSejXAgsmm1poYVWA0FM9cddLx62PSIgYG7IduXIo
	 NpDcXJm/ybJzgOTWo56wTwSIsQeQXpfNPSKwZj6j6JRwwfarUjbj0YYnpSzKEC5lrS
	 Jx+VuxLVNt1Sw==
Date: Wed, 22 Apr 2026 09:39:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH 03/13] dt-bindings: mfd: syscon: Add qcom,crmc-syscon
 compatible
Message-ID: <20260422-jolly-devout-tarantula-affbae@quoll>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
 <20260420-cesta-sm870-dispcc-v1-3-eb27d845df9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-3-eb27d845df9c@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104034-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EACD044318B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 09:58:56PM +0530, Jagadeesh Kona wrote:
> Document the qcom,crmc-syscon compatible for the CRMC
> (CESTA Resource Manager Clock) syscon device. This syscon

Whatever CESTA is, CESTA and "CESTA CRM" are not syscons.  Drop the
binding.

Best regards,
Krzysztof


