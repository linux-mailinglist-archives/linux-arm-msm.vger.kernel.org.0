Return-Path: <linux-arm-msm+bounces-99899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HzbA44MxGk+vgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 17:25:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA02328F33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 17:25:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18B0B305CDED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 16:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0FA53E4C9B;
	Wed, 25 Mar 2026 16:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RBST1yM1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2C424DD17;
	Wed, 25 Mar 2026 16:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774454749; cv=none; b=SxWN2ldGTU4b2ao2iK8X7fptvDfdH7na3NEwXlLgp1ocV4I8TSGp9xOfVc/UNcdi93eJovcwXUB8nemA15AMx/aFj2abuwYxoiEZ+/sUz/3T/FnpbvGAfDCFDE7iZWL3C3rx7iD71/C5CqKVQoNJ+JVmYffg/wHnJ7UzrFjndB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774454749; c=relaxed/simple;
	bh=zmfJkW4dvzBwStsP4Q7d8//TpScXOMyLre8YEjaRQ/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RIAZaHMP1fcccO48D9VzqQ0swlscT7/sMcUnRo2IIHIqJ1toqOBnBrzHq5zOMuLkkyEDxpSc3Bzgs+0P/URBqvT89apdE7Agd/cw8CjXG1ZWcwtuQns37gbIER3JESDZBeFBDOSfPTrHQ1+ovxfyKw3Cknip0s5e4lbibX3S8QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RBST1yM1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3792BC4CEF7;
	Wed, 25 Mar 2026 16:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774454749;
	bh=zmfJkW4dvzBwStsP4Q7d8//TpScXOMyLre8YEjaRQ/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RBST1yM1qOVKBiafMCHf1oYksWYG3e4M4YNkhJeNfqJetN5b4Nk8rutjty4KOdceA
	 sGQkcKkNyeBD8OGmsZpmxBpOvjZ3Futr3tMl51UwBMFyRjCRIR0VO1JDI0GG5e2hdL
	 bzhj7fH0H36f14fL21TAxeoyay3UsdktLRC8HrAPanjeZlAVznzsW8WmP/WF8ENd+A
	 lOEn3NAlMzH/xHnCv1nJ9eA+nfPog5kAARo1JxpU4SqYM0qGY60hjSyQt+I3ggYnoo
	 pd7jtVDZJcH7FGcqwp5TgTKN9u0HYg/u+x33hPKj+xndJKq2KgUtgm4RE72dOjOrV2
	 rz3PiMSSxhfyA==
Date: Wed, 25 Mar 2026 11:05:48 -0500
From: Rob Herring <robh@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: spmi: qcom,x1e80100-spmi-pmic-arb:
 Document Eliza compatible
Message-ID: <20260325160548.GA3714917-robh@kernel.org>
References: <20260313-eliza-bindings-spmi-v3-1-b8ff1e0a6171@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-eliza-bindings-spmi-v3-1-b8ff1e0a6171@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99899-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,msgid.link:url]
X-Rspamd-Queue-Id: AAA02328F33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 02:22:38PM +0200, Abel Vesa wrote:
> The SPMI multi-master Arbiter found on Eliza is version 7.2.0, yet
> driver-wise, still compatible with the one featured on Hamoa (X1E80100),
> which is 7.0.1.
> 
> So document the Eliza compatible and allow Hamoa one as fallback.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Changes in v3:
> - Add back enum for eliza and sar2130p, just like in v1, but keep the
>   const for x1e80100 as is.
> - Link to v2: https://patch.msgid.link/20260311-eliza-bindings-spmi-v2-1-12783c6759d9@oss.qualcomm.com
> 
> Changes in v2:
> - Instead of reworking the whole oneOf for compatibles,
>   add Eliza similar to sar2130p.
> - Link to v1: https://patch.msgid.link/20260311-eliza-bindings-spmi-v1-1-1a20eec1179e@oss.qualcomm.com
> ---
>  .../devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml         | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied, thanks.

Rob

