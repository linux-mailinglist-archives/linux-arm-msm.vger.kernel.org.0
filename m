Return-Path: <linux-arm-msm+bounces-93543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKr3Lu2HmWl1UwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Feb 2026 11:24:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2451216CA5A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Feb 2026 11:24:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDE263016920
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Feb 2026 10:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57C5314D07;
	Sat, 21 Feb 2026 10:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FpuwBMq1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE06194C98;
	Sat, 21 Feb 2026 10:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771669481; cv=none; b=ptzvq2lk6LmSiBtNjKC3MfQnGHQ83nvImBzGp96ApQilzDvxVPg58iTObVlp6sxGYDYejOzNcbrGyAis22eyp/5qTrwN8OAhgPksgvV0Ry1QPz+k31HFbIy8cgiJZLWFtKVcxlgTGDjXvWF/kYSftsrgoCxcXocQBfolhCdPqMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771669481; c=relaxed/simple;
	bh=fWU7XCC0TcYC+exWhpNowAjWcwL2oXj5CyfqaBnBW4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GT1OKGPCmnxNOO730wEI62KRcRg3PmnK3hm7a8Ulkztjx/XBv5x1/4cOFwjxRtcVSJwRGTKSPJZk+UFglxDsryj8HFQv/PnI4IUL/q3qWoOVhKUxwfw26RhghIEmUMv7Yj6CR6pO4wCrBZpnxZs8YTp9uxvyDPtUhgMZhD4DQQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FpuwBMq1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A2E7C4CEF7;
	Sat, 21 Feb 2026 10:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771669481;
	bh=fWU7XCC0TcYC+exWhpNowAjWcwL2oXj5CyfqaBnBW4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FpuwBMq1h9YNXi8+eQgEAsXjmUTBtHjYNgCThIynL7uizJW62KIJpz4A5T/Td/buc
	 YEODvgB8zwD1kNua8ae2+smNOfJ/+LvvyFlmH6hBGgR35SOPfVadVG8XFnt2OMJSiF
	 hSJIgKBzt3lPwJe7sSkUpiLm4FiKmMhSrTtI5AttVVwogUputY+UAkZJNE4wo8Yb1a
	 oRqJ0p0yp4GDKGiYROwk99X7V0NErytkktLfvjybhCZqvqX9F76DeZodx8uuHOd8ux
	 ZulVGNEasS2EfcvWYxf6d5R2TJSicLmmN173Grf/OPluMmW+ce7uyYShXMjocKH20V
	 kXsuROVXpQvpg==
Date: Sat, 21 Feb 2026 11:24:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nitin Rawat <nitin.rawat@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: document
 the Eliza QMP UFS PHY
Message-ID: <20260221-fascinating-alluring-dinosaur-7402fb@quoll>
References: <20260220-eliza-bindings-phy-ufs-v2-1-4910bdcc585a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260220-eliza-bindings-phy-ufs-v2-1-4910bdcc585a@oss.qualcomm.com>
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-93543-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2451216CA5A
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 10:25:50AM +0200, Abel Vesa wrote:
> Document the QMP UFS PHY compatible for the Eliza Platform. It is fully
> compatible with the PHY implemented in SM8650, so use the SM8650
> compatible as fallback.
> 
> While at it, move the QCS8300 one so that the it is sorted correctly by
> fallback compatible.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


