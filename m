Return-Path: <linux-arm-msm+bounces-105839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNhSEciT+WnV9wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 08:52:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 967C74C7596
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 08:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 199FD3015D30
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 06:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E75A3C1985;
	Tue,  5 May 2026 06:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lCTT9Oji"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8EB2874F5;
	Tue,  5 May 2026 06:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777963973; cv=none; b=jKmPTc36YCuAgo3/VgLUmllE7IPDKNQclXb2yaa9yJ0C5lbftYBv1ecF8wxECrBJOObnE1nTGRRPlyc1v1GRdHCzQJb5aDx3nxx+49jtdxgtDipS4p2UKHr2sxxwDUpHNxZnzgg3S5w/h3qSMKKjnCCp1K2DmSVGzShjltb3Mvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777963973; c=relaxed/simple;
	bh=pmjIppA1kE4uxm94KdNTJxGc3Oa950h/wVv5IRPh3eU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p5M/YC6XSG0uKa7vkvMHgCil1eRvwAbeul4kCTG1Nh8EyIJC+nLIOGS0X2+Il+xGSa0xFiG1C+LpYI9pl0yGO4+PcRHlSj1XgXk+3oqOMCW3JxXn0Bf52kxnNiZj9wIrf/71RaeHcy83bOFamorIY5cwf2jt6qFBickHp+1HjPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lCTT9Oji; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68DF0C2BCB4;
	Tue,  5 May 2026 06:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777963972;
	bh=pmjIppA1kE4uxm94KdNTJxGc3Oa950h/wVv5IRPh3eU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lCTT9Ojif9BDU6gwyRvgZ7+pNmOIOSG3QWyg+brrz6xsLQ/h0cg/gbwZgKKKBnR9K
	 1FnAhNYHIGIOjV9iidkvn1uxMcGKpR38FCcOjgci3gmTRhE1+dUHkeBmbcjUyjWyin
	 mZCgCaj8DB/tkQlUiEfAO8sm9JrgOvaO8wpDqkVBjCNc+MYymVUE9tkwf0tb7eCSkc
	 cPD/4fV/Uvgfa9O9x/hgNGgppFXC6dlrquj48aNHyuTk11MXhNXpXqzx5a86/2gKhb
	 Yi7IzuARFOQTi9R9es9ZN4JNDYJNMXz+X85/ha5+fsjeDjSNU0GBXzvAfyx1mZ8ATE
	 eESHwAxiJUTJQ==
Date: Tue, 5 May 2026 08:52:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: mfd: qcom,tcsr: Add compatible for Nord
Message-ID: <20260505-stylish-sandy-dalmatian-b5d6d1@quoll>
References: <20260504081122.825635-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260504081122.825635-1-shengchao.guo@oss.qualcomm.com>
X-Rspamd-Queue-Id: 967C74C7596
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105839-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Mon, May 04, 2026 at 04:11:22PM +0800, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Document Top Control and Status Register (TCSR) controller on Qualcomm
> Nord SoC.
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> Changes in v3:
>  - Improve commit log to drop "compatible with" part
>  - Link to v2: https://lore.kernel.org/all/20260427012116.231226-1-shengchao.guo@oss.qualcomm.com/
> 
> Changes in v2:
>  - Improve commit log to make the compatibility explicit
>  - Link to v1: https://lore.kernel.org/all/20260420042124.1247995-1-shengchao.guo@oss.qualcomm.com/

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


