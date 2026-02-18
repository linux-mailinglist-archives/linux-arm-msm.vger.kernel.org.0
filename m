Return-Path: <linux-arm-msm+bounces-93249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6B72NM1vlWmgRAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 08:52:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 593FD153C9D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 08:52:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 307233013689
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 07:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF60830C63A;
	Wed, 18 Feb 2026 07:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hxYJgFUm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B81319F13F;
	Wed, 18 Feb 2026 07:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771401121; cv=none; b=RGn0OYixDRYvMOLpZztqpvJXXnidZDdsysMoa3VQ5iUNDbuinkeL/SMTjc8QBxJePYnfSeS5d8dynwmGOYdawgfmz0dPAE+29/S8+TUy6mQnJlb76Jp8tgJC9CItaQMGT507Jb/+yejCSTX36MtPyPnHnNPT2TEKLfIy8FSa/ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771401121; c=relaxed/simple;
	bh=zjFejVRodD53Cj4OHnhg7ejKH+ALVm5DMoAfOdDAfk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rj1M02BrA1mbJZXMR4Zvr5X51zRSqbTiso7h4Ru2svF5rer7U5UBQX0Bp8ba8jRgb68K+xq9V/+48Anyi7WZe3WLvX1GytrNnGGbR9IZ5FVMZY8PkDm/fZFk/MrS/aTw4r72jvCWIMxon2OEdlUKcRWysjYPp6dl53VpyJT8poQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hxYJgFUm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3EE0C19421;
	Wed, 18 Feb 2026 07:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771401121;
	bh=zjFejVRodD53Cj4OHnhg7ejKH+ALVm5DMoAfOdDAfk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hxYJgFUmb+mkT7U2Qfk5X2dwNpOl+28Y7w6x7FYlsbPaa0xS3eeHkq5Vv/rIYnz+M
	 IEXZ5VMJzbQ7m3N7iAEzTCn7fFw/zPZaWJWulwV+U/5Yc1DIv+U9zjLeh2AQavRroM
	 sZjw+9ARLaLZqult3O1Grwzsb4Labbfhh7zRJ70CbW6ems1DgUayjwXGQ/T8Cf8xzR
	 zN6H5Ka90MCtBxvjmBfJRXqQadcYRtU5sWSxRY8Gnp9Bvq8djOypC8VnRA7tQM+I4+
	 qkJZoPgvzLeP8JyhWkAM+JaPjJvwWZuUYLrUxEOBmGQfEVyEzGO92736B1ZmSHElep
	 JhUcPUcQ9pgRw==
Date: Wed, 18 Feb 2026 08:51:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: arm: qcom: add Qualcomm SDM845 HDK
Message-ID: <20260218-ginger-kangaroo-of-sympathy-dca916@quoll>
References: <20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com>
 <20260217-sdm845-hdk-v1-2-866f1965fef7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260217-sdm845-hdk-v1-2-866f1965fef7@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93249-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 593FD153C9D
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 11:20:43PM +0200, Dmitry Baryshkov wrote:
> Document the mobile HDK for the Qualcomm SDM845 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


