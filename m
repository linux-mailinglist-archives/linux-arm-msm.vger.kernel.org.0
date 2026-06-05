Return-Path: <linux-arm-msm+bounces-111359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id flMkF1GlImrFbQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:30:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC4A647582
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:30:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=eiTFSPNB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111359-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111359-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD78A3019807
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 10:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E8B53F6C29;
	Fri,  5 Jun 2026 10:21:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D064366542;
	Fri,  5 Jun 2026 10:21:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780654899; cv=none; b=ZgtLVQwOFBUtyL792xbfJxqpNjpFfFQA1titKPW0qME8Ee1aS7z2UIqUehPW1rgl9C/gN5Fq0nDWXnE5VLIu5lPFKEJbbVydfJ0VJ4w0JmCd8aGWPsh+drFlSpINobesD86C+DQxRqjPR8bsgp3KIqnRuEpGeCQW1x41t//0QZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780654899; c=relaxed/simple;
	bh=OMMTrLnIFKCsLsD0CPsBUlTbbroxAOA8/33m4bsdpEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9GH9SZ5wQJCfYNHPEa9cER7VwIODw90zBmLwa6KEvFCuRh1lasoHLxEhSIMrXdOVu+AC9W3MPui6CRi+jq5lDiI+/xcRhzMD2/B/F6bzSpndOr5ekQb3j8p3R3bWXEXvh0/XLHr1+9xq71o4F5xQfrF/CdEL/aSIEFglIKQNfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eiTFSPNB; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FC161F00893;
	Fri,  5 Jun 2026 10:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780654898;
	bh=M/ibNOvr1qBs1ULj8KpAXvCkTtmaR1HQsWly72FDDe8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eiTFSPNB2WYJwn9YCX6QT3tYbL1K3PTfrPS+1ODiwkTl0qEkUSDw5xB9PnHhdMpO+
	 PF+YH9HIBQq0q6MTPNlEWulcE+xvBSbaEVwNf8+tyqNG+Duc3ckFskkH5nJMEDvH98
	 mtSvj4HLs+F9TpjdANTf/a385mAxMfNP4Xen8dl1TvYcqWK7HF6i1tGrAw/8l4BeaG
	 AIqozcuTnMgvOEZ/In1sijt9VUUlkwgT7/SitovjKEFTMkKaVh9ogIbb0yJtvQPp4V
	 wY2OvmvQkwJGCJ9RLQYVuLoXOFlPEZMFj+ZfTdVSuvZzE4lPkwrrt48SCFh3tAuUWo
	 rgWYweod9JjBw==
Date: Fri, 5 Jun 2026 12:21:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v5 1/7] dt-bindings: clock: qcom: Move glymur TCSR to own
 binding and add mahua
Message-ID: <20260605-married-elephant-of-aurora-44daf4@quoll>
References: <20260602-tcsr_qref_0527-v5-0-8ea174a59d7e@oss.qualcomm.com>
 <20260602-tcsr_qref_0527-v5-1-8ea174a59d7e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260602-tcsr_qref_0527-v5-1-8ea174a59d7e@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111359-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:qiang.yu@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,quoll:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BDC4A647582

On Tue, Jun 02, 2026 at 01:02:17AM -0700, Qiang Yu wrote:
> The QREF block supplies reference clocks to PCIe PHYs and requires
> dedicated LDO supplies to operate. The digital control interface for
> QREF (clkref_en registers) resides in TCSR on glymur and mahua. Since
> QREF has no dedicated DT node of its own, these supply properties are
> placed in the TCSR node which acts as the control interface for QREF.
> 
> Add a dedicated binding file for qcom,glymur-tcsr and qcom,mahua-tcsr and
> document the supply properties. Both SoCs share the same QREF TX/RPT/RX

I would prefer if adding new compatible - mahua - would be in a separate
commit. Moving Glymur while adding missing supplies is actually one
logical change. Mahua is a second one.

> component naming, but differ in topology:
> 
> Glymur has two independent QREF blocks fed by REFGEN3 and REFGEN4. Mahua
> has a single QREF block fed by REFGEN3 only.
> 
> Mark the relevant supplies as required per compatible using allOf/if/then
> conditionals.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,glymur-tcsr.yaml           | 146 +++++++++++++++++++++
>  .../bindings/clock/qcom,sm8550-tcsr.yaml           |   2 -
>  2 files changed, 146 insertions(+), 2 deletions(-)

Everything else looks fine.

Best regards,
Krzysztof


