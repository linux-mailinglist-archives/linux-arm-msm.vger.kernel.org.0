Return-Path: <linux-arm-msm+bounces-101168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDP/Clc6zGn7RQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 23:19:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1BD3718B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 23:19:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA6173094A9E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237044014B4;
	Tue, 31 Mar 2026 21:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oruRYVRl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20EE3A382E;
	Tue, 31 Mar 2026 21:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774991487; cv=none; b=nf3QdkuZbcByps2OzovVDG8k1KyUnIJyChqgIxE1KtDoIcYmBo1OkvmAp/Uq8jOflZy1Ee+cLKtiJHQUGZhvxHunFzgH63EF2fvF5qIqGjFkc+eljy07HBkO0S3b3To+0r2lI0wnz11H7hTxinYpIyh7Z2nhNv3YHKsoIbCd52k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774991487; c=relaxed/simple;
	bh=yCiNDiRwWYA8V81XUtVapuBzqhhbOLmKKLPNrR6585U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SR2rG1aNrwky6tHNlemMv66gVt2iFSaCploxAlwp9cZmEfiJxDjPY8xHq3dpkzlAaDB+V/AU+qXWRp/sH3KzWdRATxMpsGHz6dsatDOwvFfIehVHSrLxIruz5cSDWUx8C1C5ACqKNPaswtCAgcXriSFwdnaDEufgwiOJ6iUQn6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oruRYVRl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83B19C2BC9E;
	Tue, 31 Mar 2026 21:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774991486;
	bh=yCiNDiRwWYA8V81XUtVapuBzqhhbOLmKKLPNrR6585U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oruRYVRl6wu9qZtxaS0vkscJBdh3H7JqzvxOuuqlDa60av5AbH+RjTctQGybXSb2I
	 W8ghuabB9cK5Idjub07Spr9ZN0aVTUpciZ7xVhAAc8Bwg1mLl4fS//b6hsjJfIkRFC
	 4HFVnMra2PuMxRWIRmXS571AJRDRnh0DHaTsdIfcWXzppfQRkRXcxxuyzKTXB5QXJu
	 4MgIrxpOcGHNFMOXLqfbjKfQRyKgz1xfZAAtOPu4qlfnhuOisG8gSgZ9s8TKCg3852
	 265q2NW+D2vBZ9spsv+X75gkaW6W7lcykFgk70fGNO16ZFxSay40jTogFN1qyASre6
	 m73SL9Fg0nXZQ==
Date: Tue, 31 Mar 2026 16:11:22 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mike Tipton <mike.tipton@oss.qualcomm.com>
Subject: Re: [PATCH 7/7] clk: qcom: Add support for global clock controller
 on Hawi
Message-ID: <acw4FDsIbgAUTHXo@baldur>
References: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
 <20260330-clk-hawi-v1-7-c2a663e1d35b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330-clk-hawi-v1-7-c2a663e1d35b@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-101168-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9A1BD3718B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 05:35:02PM -0700, Vivek Aknurwar wrote:
> +++ b/drivers/clk/qcom/gcc-hawi.c
[..]
> +static const struct qcom_cc_desc gcc_hawi_desc = {
> +	.config = &gcc_hawi_regmap_config,
> +	.clks = gcc_hawi_clocks,
> +	.num_clks = ARRAY_SIZE(gcc_hawi_clocks),
> +	.resets = gcc_hawi_resets,
> +	.num_resets = ARRAY_SIZE(gcc_hawi_resets),
> +	.gdscs = gcc_hawi_gdscs,
> +	.num_gdscs = ARRAY_SIZE(gcc_hawi_gdscs),
> +	.driver_data = &gcc_hawi_driver_data,

Sorry for not spotting this earlier, but don't we need a ".use_rpm =
true" here?

In line with
https://lore.kernel.org/all/20260309-glymur-fix-gcc-cx-scaling-v2-2-d7a58a0a9ecb@oss.qualcomm.com/

Regards,
Bjorn

> +};
> +

