Return-Path: <linux-arm-msm+bounces-107750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEwqBHbtBmq4owIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:55:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D7E54CCFD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:55:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA9C632AB127
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 09:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABABE42DFFF;
	Fri, 15 May 2026 09:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vPXa7OLF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FF43FE67C;
	Fri, 15 May 2026 09:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778836411; cv=none; b=SRDhChdtYvaUiYug3WQRRiWVBh9pv9NSPTVyA9hhbHRRMcrIylf0X/hCkQbp2BU2KvTXQKqKkwi7xq3a8PEfkQ3Znal8BEK/852uTaB4WlZKzX9rFB5oItRuzJaMwzjfH31Q2WioLl5Chz50Kn+cjpKvib1qSxZpdaADHb/ftto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778836411; c=relaxed/simple;
	bh=zLRb1yIvUvA5lHs5BNZoLifNrajMLhxzNg0gMUhb7XE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HuaJl+AbomYPOAvIwt4KXOHne9gcF3Rl05rPM7ao3IFCLzGFfAC08HtWrIDvrJ3fl1rPZBXGwbrbzs090k39jnz3KedfsBE02/RDG9TvFZn5O/5WuOMbBDKkuI3/8zhoXQo1yLMJNb+v55QJJ1LVIFPhjn2r5covnsgjjTpgJpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vPXa7OLF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD05DC2BCB0;
	Fri, 15 May 2026 09:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778836411;
	bh=zLRb1yIvUvA5lHs5BNZoLifNrajMLhxzNg0gMUhb7XE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vPXa7OLFSnq+DMHuyXiEWk6yF93IQTdX3Jbvg3nP+Z0vWF+pRBef4qBarEAnLqmFh
	 IRfL23+HrHdMUG93nDQzVv9Nn/oNeWXUrW4SGWX2gTn7zAuVmtWLd7zQ0yj5fRVS0h
	 Fwp14qEEhd4h0PobthVYm74E0FaeL7BO4Y+za1owUc+2VJVVtXSI/fYvbXDCNwPN3e
	 bjl//ewt+HwL4H2OM2E74XcKLvYUyXUmqERtIfvPjpqFf+2E0S1BN87zT/d9DgP4Gh
	 yqCJCXktTChzr1QZg3ZK9+NaX/hKFs6DKulFwJ1S87AOEGNASf6Q1+gnzgZlS/Slfe
	 MJgZoK+Yn/zdA==
Date: Fri, 15 May 2026 11:13:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Shawn Guo <shengchao.guo@oss.qualcomm.com>, brgl@kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: add missing definition for
 the USB2 PHY reset
Message-ID: <20260515-invisible-ermine-of-memory-6d7dae@quoll>
References: <20260513-nord-clk-usb2-phy-v1-0-8eafcb2d5129@oss.qualcomm.com>
 <20260513-nord-clk-usb2-phy-v1-1-8eafcb2d5129@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513-nord-clk-usb2-phy-v1-1-8eafcb2d5129@oss.qualcomm.com>
X-Rspamd-Queue-Id: 93D7E54CCFD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107750-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 05:35:29PM +0200, Bartosz Golaszewski wrote:
> The USB2 PHY reset definition is missing from the negcc clock driver and
> its bindings. Provide it in order to enable adding the USB nodes in DTS.
> 
> Fixes: 06498d59bb4e ("dt-bindings: clock: qcom: Add Nord Global Clock Controller")

Same comments as for Eliza yesterday. Missing feature is not a bug, per
se. We do add things incomplete and then grow (release early, release
often). Please explain in the commit msg what was supposed to work in
the initial commit but is not working due to the missing part.

Best regards,
Krzysztof


