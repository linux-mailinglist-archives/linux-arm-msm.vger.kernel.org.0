Return-Path: <linux-arm-msm+bounces-94726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPyDOOQopGnYZAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 12:54:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 687481CF75F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 12:54:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A633300CC91
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 11:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AFEC30BB85;
	Sun,  1 Mar 2026 11:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YtNpT2hA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55816279355;
	Sun,  1 Mar 2026 11:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772366050; cv=none; b=EFHFLnds3UNp0oIPKZsOrnrBA9OcgO3EEM2IsCLBDPxpzo8irqbGclbF0Z+d1FaEBVJtAV+9OLIdraNlPKnOAyLLLbzhfpQUiqNy7OQF6SCGrL1vbzzCGi0rbSH8Kx3VxL04j4hTen/o5gH0ds8br0jAgrzHAVdu28FFuGqX4CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772366050; c=relaxed/simple;
	bh=dDKVwRGZph9yuhRFeF4vHmj71PEVAlDKHpsemp9Xla4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gWvLoTMl3ri4bAiH7m/GH1o9ijzJRazjFuwyP4hTDYJY0Yor0qSw9pmYzAsXZGA4AhA6grYal/Xfmdcomdbz10sYgQBdARI+yOUCw3NeUf+o61n7hF7HJCzRmfR8tObHb8VmLaCuJ3DKLiGZSam2tBf7f9TedDW+5Fsk7+1q6bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YtNpT2hA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96CFAC116C6;
	Sun,  1 Mar 2026 11:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772366050;
	bh=dDKVwRGZph9yuhRFeF4vHmj71PEVAlDKHpsemp9Xla4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YtNpT2hATp5+LiJ4WofhOnhUujbuazYLFo7+p337b2DeLMkPmkY0DG6eFZPaUhrm/
	 uyr51Jn8oENGAFCkwocxeIU4pivtYuOPOr7Ef/pzOPxUIigm/2zq7WM6eOeGZ7pHdi
	 sia7r1GLHNwsDu35uuLOUTXPIi4oDbbTV7FkwD79fuqPTzsvz9wNUnpnaMmdrruxvz
	 uR8xUCffkSkrvmoh61h8UwtQt6qO75ULG/X33Z8EZumgXcXmxrYoILCG78Ghn1jmxW
	 XJ+eWrxmmD98owRLfmtTa1YgZoaEknbmjD0MxjPq0GVtK1TNobdYHVzvlhJ2MpPb+S
	 jzLxqW7J7sC0g==
Date: Sun, 1 Mar 2026 12:54:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/6] clk: qcom: dispcc-sm6115: Add missing MDSS resets
Message-ID: <20260301-arcane-augmented-gazelle-c3cf4c@quoll>
References: <20260228204638.11705-1-val@packett.cool>
 <20260228204638.11705-4-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260228204638.11705-4-val@packett.cool>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94726-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,vger.kernel.org,lists.sr.ht,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 687481CF75F
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 05:41:29PM -0300, Val Packett wrote:
> The MDSS resets were left undescribed. Add them to allow resetting the
> display subsystem, which is necessary to avoid issues caused by state
> left over from the bootloader on various platforms.
> 
> Fixes: 9b518788631c ("clk: qcom: Add display clock controller driver for SM6115")

Not a bug being fixed here.

Best regards,
Krzysztof


