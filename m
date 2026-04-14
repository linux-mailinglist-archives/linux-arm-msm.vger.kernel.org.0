Return-Path: <linux-arm-msm+bounces-103058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDdPAiPs3WmulAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 09:26:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A77093F69AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 09:26:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D25830C2BE6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 07:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E990C37D13E;
	Tue, 14 Apr 2026 07:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o/KAbUXp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51C7325490;
	Tue, 14 Apr 2026 07:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776151173; cv=none; b=JAZYM1gcmbtyUfU5JtdyHnGpQj7JNcyLrmUp0q3Vw/MKwBM1NnNDEG06mETVbaUP5BPP1xHYizruhB9t3KVoVuqCkbDqmJrqsKGxAfq5Nf5wGfz9CXApw1LP44y9AwSgEpB/t/qm4vlIStreMYpU6zv91mGObi51XEeLD91d8ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776151173; c=relaxed/simple;
	bh=WjtCp1npkGFU3ZdPOnwHWfZiaQFuXNRn+hUV1ktB9eU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kzGfct55Q9dvdMswTaa3bgRJK5P4TciqLAewtxwdRGnVPDwgNxK1iYRnkA5BmSMgko0pOrQq1keR1EJ9CkhQcFZhChK+htHIcCFX/olztD4qfhcDyPZh0OSPlIeB/28vC4IpjXoZtOUW8/5Ry95TkiX1v2PwK6vzuWiEAFNJH3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o/KAbUXp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D02FBC19425;
	Tue, 14 Apr 2026 07:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776151173;
	bh=WjtCp1npkGFU3ZdPOnwHWfZiaQFuXNRn+hUV1ktB9eU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o/KAbUXpYgp6GqGoGmFxx0fPHFViNIf9MNqzNXx/VcJkJlLinOhL/coRsx8RHwkb1
	 3I49OVlVFz9kbZCzmedCBaSgCK9NOKR9WH1fpN/RYVdZdfAfQf1MeE1cOjaG6rcFui
	 6GyUPdrQQWCHSMzJY1KiFT2rrjCIa2WC+CcwrnFbj7nCmDOP2n96uK+RcD/nDRAK8C
	 25ilV6xsT83zv6xaVy/f2AdjpM4qvSCLzZR6DIelVxzGJhSDa3vjHqBegj3XSj4djw
	 1Mxzb3UnDt4uzbVZoLhcuwp1QIG/ep40MOox53NCxY2U6zdwe6LCbFWcice+Sk9/Ev
	 7TGKFX8j4zqnw==
Date: Tue, 14 Apr 2026 09:19:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
	Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH 02/10] dt-bindings: mfd: syscon: add qcom,msm8960-sps-sic
Message-ID: <20260414-frisky-aloof-koala-4cbfdb@quoll>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-2-007fda9d6134@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260414-msm8960-wifi-v1-2-007fda9d6134@smankusors.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103058-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smankusors.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A77093F69AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 01:55:29AM +0700, Antony Kurniawan Soemardi wrote:
> Add compat for Smart Peripheral System (SPS) Interrupt Controller (SIC)
> present on Qualcomm MSM8960 SoC.
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)

This was also sent. Where is the changelog and versioning? What changed
here?

Best regards,
Krzysztof


