Return-Path: <linux-arm-msm+bounces-102601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOpZNICq2GkhgggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:45:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 805D63D3862
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E90DD3010508
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 07:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 477C83A3E7B;
	Fri, 10 Apr 2026 07:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WuhGltJP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231FB1C862D;
	Fri, 10 Apr 2026 07:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775807089; cv=none; b=g9j/3Mz86Hje8mKJwsbDajxQf6LjHA6y1eUJdwPanHI/FJD5Z9cWiCllPPjio2SJwLKzpMwCZa1IF4UAIZMtCySIZuMjv3A3uJMCUjMMpqYQvs6CQT3gcZpCm/0D+0kt57+eFeFTmezpZmR34oeN6wyoEElqtOCuSRoV/Ih5+1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775807089; c=relaxed/simple;
	bh=JsZglFfqp60/OymRyVjYka9YiyjQ22XOenDQYcWCKIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ckQ8YiGNoqQm6AJMpamdZvYGbQBbDUO9ga5BaGEpxN5NpPglMUcXEMU3CI+8k1dJ077EdohU8t3nXF+mIHmCLVH4F2GZbaQ3RBTQV8p+ASxORE1eTiwpoUJg/IfwFUKxU7v3i31AOrTZvG+Z+F+R2g2DkEBOTErnsNTbr5Pw5mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WuhGltJP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FB7FC19421;
	Fri, 10 Apr 2026 07:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775807088;
	bh=JsZglFfqp60/OymRyVjYka9YiyjQ22XOenDQYcWCKIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WuhGltJPPqIHbF4Qlipkz2YJ6f43KKOCc+Q0lxqz5otlnGKb1EpmmWsUYUQByS0o6
	 REMrCi++66bRLgcaBgggl2ldR9nKnfsQrzkqqT6qj+1UOrt55OvGNx+1gq5tnhXRBV
	 mDQp7Q9xxpx39MXGnbeLXM+aJRsAAEut8QPLPc1ayyB9imbfuwZCArmKp0aUW2v3ya
	 iNVTzdpr/jhElhSaWJya23KXX/r5DokpCKhmufjY9Q1stfrg1kxOR4RqZFkIqgDOBB
	 z/RKYCklU9GX6Ap8aJ/Iz88Rq+mkx++ZhetWI8WJUk50wm4u3MiFtM11IWv+UViUN6
	 lSdIpIsctQdVg==
Date: Fri, 10 Apr 2026 09:44:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Imran Shaik <imran.shaik@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
Message-ID: <20260410-ludicrous-rousing-pudu-dbe5be@quoll>
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
 <20260409-eliza_mm_cc_v2-v2-8-bc0c6dd77bc5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260409-eliza_mm_cc_v2-v2-8-bc0c6dd77bc5@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-102601-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com,oss.qualcomm.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 805D63D3862
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 11:40:49PM +0530, Taniya Das wrote:
> Add the device nodes for the multimedia clock controllers (cambistmclkcc,
> camcc, videocc, gpucc) for Qualcomm Eliza SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 54 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)

Note that this patch and drivers parches were likely not tested.

Please mark patches you wish others to test as RFT.

Best regards,
Krzysztof


