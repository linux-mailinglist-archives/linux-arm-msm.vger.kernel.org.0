Return-Path: <linux-arm-msm+bounces-96151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIsrMHF+rmlfFQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 09:01:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 255C2235333
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 09:01:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABB4B304926C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 08:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 720DF36B074;
	Mon,  9 Mar 2026 08:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bc/l2R1H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1D636212B;
	Mon,  9 Mar 2026 08:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773043209; cv=none; b=Xdvyje7NzsgDjVVJomDUh2yYcQwNarOsMiq980Lf+d5WxSaM+7S8QX53SRZlGOM5ysB777jkShLqh5kdIfCDPrBN6RQZXG1EgLQ1Me/xtGCSGwJXBukdcAaa4iwqS8Y0HjJjguQxLsSmnsf02DvhJAfdDZU1LJEItFgtq05DmMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773043209; c=relaxed/simple;
	bh=BcKXsMMfKdMEpiwGdwyEs3bv8mIqSCDtJDluLtKReos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hzS/+VX/2PdDug06A5nbMnu8jkN9puyaf/qlRqqzlkA7ocGm+885d0RyzVeUbkRbavZDsa4FC+FoqnDSEwvv3X3QJfd4ADPqPmUzClsz5+kzYMzqEzXgKRhO0670KyPYYKWN+/k0ZSl6CvImSnIPh3N0uBylJgwewRSpAxzHW5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bc/l2R1H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A250C19423;
	Mon,  9 Mar 2026 08:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773043208;
	bh=BcKXsMMfKdMEpiwGdwyEs3bv8mIqSCDtJDluLtKReos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bc/l2R1Hy0Sl2t62GoK44BJDBKymat6UkR9CU8aeknAEWqrkW/WtDXMPZ5rqYsZ8U
	 hmGh4kDtPXKv9dbfHZGZFyScWxEOv+IoLuPxYY0XNOLruXc9v6gva1fe0ngCEfXpe/
	 XybMIoMIQB4hbReFtHj9+GkhHfO8mWbZpRIbNryEks/HpKXBMfjXml0vWxcOGr+LCz
	 mKF3izjFgyxnIGw1HLRq7vXrQ2p14cFUhyddWl4cBI1SxZi52lvmnnSZNaOfydz/xF
	 w0rnxBsoonrjW2eTK2qYIiq6fgsYHQ2HC+86KhMnTFjGM9ON7oo33OBTSiiD1hT+fj
	 Nbgxj0600d56A==
Date: Mon, 9 Mar 2026 09:00:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Koskovich <AKoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
	Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8250: Add label for
 reserved-memory node
Message-ID: <20260309-orange-coot-of-speed-b3fa28@quoll>
References: <20260308-sm8250-asus-obiwan-v1-0-3c72941eb796@pm.me>
 <20260308-sm8250-asus-obiwan-v1-2-3c72941eb796@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260308-sm8250-asus-obiwan-v1-2-3c72941eb796@pm.me>
X-Rspamd-Queue-Id: 255C2235333
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96151-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.970];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,pm.me:email]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 08:40:38PM +0000, Alexander Koskovich wrote:
> For some devices it makes more sense to just redefine reserved-memory,
> for example on the ASUS ROG Phone 3 it is completely different with the
> exception of hyp_mem, xbl_aop_mem, cmd_db and smem_mem.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-

Same comment as before. This makes no sense as its own patch.

Best regards,
Krzysztof


