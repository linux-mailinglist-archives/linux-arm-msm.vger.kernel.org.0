Return-Path: <linux-arm-msm+bounces-111966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id guswDGsgJ2opsQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 22:04:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 788C565A433
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 22:04:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=cbTtcTbC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111966-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111966-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 663FE3010B82
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 20:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F02390986;
	Mon,  8 Jun 2026 20:04:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD45B4C81;
	Mon,  8 Jun 2026 20:04:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780949095; cv=none; b=NHgGGnorEpIPt019QbIJbmkC7BJvODH76+/yZw+WmzFKNjzvLhPkJgO3NKo9Iz31qQOta/Sa1bHYdLS7Rcj65ODHM93sDOKJ4RXhhyDvEHIlbFSElxmKYwlbKpM4Nf4+9sojwtgyQ+j81bho0e6Y2ewqCR7PIsjE9UBs/l5NdEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780949095; c=relaxed/simple;
	bh=eHsJ2NpTViD+qESyRQDjv7UDJDg/EGyflH3yf6RtWcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OY50c3O6IyqUJTxX6p46EQ+m9MLFrgIS78C1cg7oMHxtxX8OYT0cjgacjyCRotGRcmAtuLHh1k+gvUjI+HRfeOIN6qNZLGZaO7YPs8Mm16HKOg7SmL2wyRhwXrjaDBUqs3KJzLpppoarZXLX4d3ODWJDpCcOmiOzXWacezRyepk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cbTtcTbC; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E16A1F00898;
	Mon,  8 Jun 2026 20:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780949094;
	bh=D5NzKS0xhmGk+JRUCJkpcxI6S6sOuzdQ8mS1ZEWHGcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cbTtcTbChXSDQ1nlyUoglIUAL+t4T9t2iwwWZM+F49hrrjJfdddqIv416cP/4TjH6
	 0V5EGx4IXOYhCFLimJvUBsZSJwzPSrvKSQb6VZAwgpAIil9jWHPTSkwXz0QQ1mOb5m
	 RaARMPMd9BfgFzTWH5NRnwRq57thsGqCFPyczLrVs6hL1VoZ1kHbp81CpIvOvWzqQB
	 3534xRhk1VFTtXy1Lnxy8e/lXTFuC3fjxKEBmW+VNK/s/IbtO4GRkKfrDiwAG5fDet
	 pRIvSKTutaOmAFw/hFfITNKdbYMiRBPP5z1fH3+SkM+knEkrrTA5hEhZOU/YKFkLQM
	 omy/ecPtueHsg==
Date: Mon, 8 Jun 2026 22:04:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, quic_wcheng@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: qcom,qusb2: Document IPQ5210
 compatible
Message-ID: <20260608-hallowed-labrador-of-acceptance-bcf2cc@quoll>
References: <20260608103344.2740174-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260608103344.2740174-2-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260608103344.2740174-2-varadarajan.narayanan@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111966-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:varadarajan.narayanan@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,quoll:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 788C565A433

On Mon, Jun 08, 2026 at 04:03:43PM +0530, Varadarajan Narayanan wrote:
> Document the QUSB2 PHY compatible for the IPQ5210 SoC. The IPQ5210 PHY is
> compatible with the IPQ6018 QUSB2 PHY, so allow it to use
> qcom,ipq6018-qusb2-phy as the fallback compatible.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


