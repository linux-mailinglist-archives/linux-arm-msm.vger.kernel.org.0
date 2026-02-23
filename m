Return-Path: <linux-arm-msm+bounces-93658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0P5WEeEunGkKAgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 11:41:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E877175082
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 11:41:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D4E7D302AF0B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF89735BDCA;
	Mon, 23 Feb 2026 10:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oztvLEdc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB72834D4C4;
	Mon, 23 Feb 2026 10:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771843294; cv=none; b=lC7cJDuKbHB0glo6F0Kd4NRYtrmGY1CrVSVb6LcPNpOCt4ec1n1GyL9KAQiwoGO5J3Vrtpwo1YkwR6Bg6KPYGWot6vc615ZJ0Jq562D/o0CkjYjqEQUv00/ZJFbFj3wp1W8ZoFIMMlNEVhab1e3BtPMtrZhsow6vVTZj3lPF9v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771843294; c=relaxed/simple;
	bh=2If1MUOk/QKqEICRpt2FESfscAw6DPhbX6YsEnGyUDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GSHuiYHciWs7gIVYgbLMy6qkkruCxvQDG+Q4EKg+G7qL6l9IeHHrxfEyzjqVAN7o3TRZ86dxhVOJZDXmSroy3ypedek/6ETd5Dm8Yim9jIthFES5GTa0EWoOLMzh6f6sDQFB0GjIOl5F+81yWwdA2w/8gzVMTgcsHH/lqhfmf2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oztvLEdc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6BB7C116C6;
	Mon, 23 Feb 2026 10:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771843294;
	bh=2If1MUOk/QKqEICRpt2FESfscAw6DPhbX6YsEnGyUDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oztvLEdczfzVJE7M2vSf83IgtNc52ZqmnAv79U/TuBcB0Mwwo6MKVwaedyAjuIYFx
	 oWu/4NdbwBC6N7jJnin3HeB3FSJibh7mA5mp64H1YBFhyCXKnjvShXwCwEZXtl2Azu
	 voXrf03CtG6gwNMn87G4l29WwJ6myonphsb0blDro1ESeez15gKzRnfLFyisEgvYM9
	 7DExIldprbfmvkzS0gsb5fYtF4qRxlHOD9WSHOhwiL/VJqqRnJaAQWyJH2ziZB6L4n
	 Eta69iS5bkX2kokjL51Rnke/XFYOfBjFwMORQGWQ5IVVvfBCt7SUGKov0vcA6NH7cb
	 h6L4yqQXuE/1Q==
Date: Mon, 23 Feb 2026 11:41:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: firmware: qcom,scm: document Eliza SCM
 Firmware Interface
Message-ID: <20260223-flawless-shrew-of-skill-efe049@quoll>
References: <20260223-eliza-bindings-scm-v1-1-c88643112dd4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260223-eliza-bindings-scm-v1-1-c88643112dd4@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-93658-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,quicinc.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0E877175082
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 10:42:02AM +0200, Abel Vesa wrote:
> Document the SCM Firmware Interface on the Eliza SoC.

So different than sm8750? Then you need to explain, because patch looks
odd (incomplete). Plus I am pretty sure it fails tests on your DTS. The
point of the bindings in DT schema is to actually use them...

Best regards,
Krzysztof


