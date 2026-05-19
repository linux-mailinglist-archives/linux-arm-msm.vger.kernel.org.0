Return-Path: <linux-arm-msm+bounces-108389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHxYLvcVDGoZVQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 09:49:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECE4579674
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 09:49:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0EC2A306F00A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 07:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A573C3DD529;
	Tue, 19 May 2026 07:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ce6+8eSh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812FB3DD502;
	Tue, 19 May 2026 07:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779176792; cv=none; b=owBy/bDIovpccX//HOsVr24GWnwq2em8jHGBatJpFlSlavhP+0NytVEfSzn8ql3W2TnvbVTiXVjUWQmNZDZ96lgAe8qPQvHQqP6aZjCVuGAnP2vz9Vvfr3+qf6aymn+83YCN0auXlDp3smO2YfYWtprFNv/zx8ph+lE0t8RZuZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779176792; c=relaxed/simple;
	bh=rPpr6j3hbc/67sdYImJCYumiIOeGmiXbExh3K2Pa4vE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fjM/NNepZq2eo2RAMYcCajD5LqVfwvJ+a7d7jn2z7VtX9znhyqQG2Kh20ZmUneCeBByer2LxPQFh+lbio1U1b0fba1u5bZRzUrayYyjO+JbspA1lroC4yKc8pSrbmhWfwXon/wNQciFz132c+do/zA0yNvXzJBmQeF/bLsPkIDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ce6+8eSh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1F91C2BCF6;
	Tue, 19 May 2026 07:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779176792;
	bh=rPpr6j3hbc/67sdYImJCYumiIOeGmiXbExh3K2Pa4vE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ce6+8eShtnvia4gGyb/+HtvmYH7LTUNwBUbsNptPu0O+uy/vnOjaB0eoYuzypZQvw
	 Ur/hKB9G2YDinkrdzGfmFo1/Ff4y4TXFyW+/NZ8IXhxVhKg4Dhm1wuDOZ6dqz+mB7w
	 At0nEFFiQpEigKQM0RIP+HI8MNJXjYYTn8vKbpUf27VdsUgV3OmYYD26NL+K/srUNv
	 Vf/3ut8Pyjk7Ld7LyYOF3rPqeCjJQTz746UtvhTbR/y9JSu8h3OrVUa1veQv6gRibD
	 BDSBvFCGYtezVgZA67gk77ADHe/Dnclc1D3YS176EfcqqTlAWRni61HO9bmRrl1VGO
	 pmXTNvN07JLYA==
Date: Tue, 19 May 2026 09:46:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Shawn Guo <shengchao.guo@oss.qualcomm.com>, brgl@kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: qcom: add the definition for
 the USB2 PHY reset
Message-ID: <20260519-able-vagabond-jaguar-ceb8fd@quoll>
References: <20260518-nord-clk-usb2-phy-v2-0-17a86cb307c3@oss.qualcomm.com>
 <20260518-nord-clk-usb2-phy-v2-1-17a86cb307c3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260518-nord-clk-usb2-phy-v2-1-17a86cb307c3@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108389-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 1ECE4579674
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 12:34:32PM +0200, Bartosz Golaszewski wrote:
> Provide the USB2 PHY reset definition in dt-bindings for the Nord negcc
> module in order to enable adding the USB nodes in DTS.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  include/dt-bindings/clock/qcom,nord-negcc.h | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


