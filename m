Return-Path: <linux-arm-msm+bounces-103057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGQJAofr3WmulAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 09:23:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 685C93F692D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 09:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD0683018BC9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 07:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DAEF37CD36;
	Tue, 14 Apr 2026 07:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SRZ6d/Jq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1915E78F26;
	Tue, 14 Apr 2026 07:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776151141; cv=none; b=QxAurcFlyXQfp2pY1bpyHJSohZy5o01SUmksVBwZjz3eBBqHkcClMvEwRAUKrcsh4C7lG2mqsviqfefpz0uZSMQ4AyGt09/v17PWqWnYNJrrYE5algSXgsd0Xc6jQRTi7GK6en7KN0IQoCy0XvyNaZcceQKlw2+xryPsQ/Wt6LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776151141; c=relaxed/simple;
	bh=cAVnFpW+txHpOYtqgzPHGD8SsQmnpiyYAfbX03kDcHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r55mNgCnHTUpmeIj516bxd+WG/RBC7fLfrsK7LIbbv5du8wvquby8OZNwEAWXI7dzDERRaTq4YPNtmCwCkrGkLrkuqaAIIav52tIbq30tHrc/O/84/jb7j36w2XLvI4CRQAmxEWWoAbVZGHvYasQm7TySABU8ihJeCb01MfeUpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SRZ6d/Jq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04767C19425;
	Tue, 14 Apr 2026 07:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776151140;
	bh=cAVnFpW+txHpOYtqgzPHGD8SsQmnpiyYAfbX03kDcHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SRZ6d/JqPzfd61MGIS2EF/jU2tOZyxLC+aafAUdRfS9YJkZ8bQwmVMWRvXpPXnTtz
	 op6Z4Y+G/dyCBy9x+MIMu8X6lwZyb4G1cOxYqB0d8yprqHPiMHMb78h07XbAT88Afr
	 eIUKfC9nmOhv7o27hR86bGShISsdPLvZHUzMfYOtm9JN+2DQdp+nTlIf6NMF5yWJUd
	 +g2DDCN3T/cngN6wgEGEpLWjJj+nzv3/5XmzfuKYFCv65yfGzoA3azLWFRkgXGtBB5
	 pHAxunzkPwIgPhucYjOR/ysigT7K1lVqa9DEpsoHkri9Jt9WvbuQPyfAxljA4EssZV
	 DeMSxT8dvln+A==
Date: Tue, 14 Apr 2026 09:18:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
	Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH 01/10] dt-bindings: clock: qcom,rpmcc: add msm8960
 compatible
Message-ID: <20260414-zealous-shaggy-tanuki-b87afa@quoll>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-1-007fda9d6134@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260414-msm8960-wifi-v1-1-007fda9d6134@smankusors.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103057-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smankusors.com:email]
X-Rspamd-Queue-Id: 685C93F692D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 01:55:28AM +0700, Antony Kurniawan Soemardi wrote:
> Document the qcom,rpmcc-msm8960 compatible.
> 
> The MSM8960 platform shares the same RPM clock definitions as
> APQ8064, so extend the existing conditional schema to treat
> qcom,rpmcc-msm8960 the same as qcom,rpmcc-apq8064.
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

You already sent it some time ago. Implement previous feedback.

Best regards,
Krzysztof


