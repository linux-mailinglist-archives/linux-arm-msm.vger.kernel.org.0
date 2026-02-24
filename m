Return-Path: <linux-arm-msm+bounces-93910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNIfOpZNnWkBOgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 08:04:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE59182B7C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 08:04:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9A9053004602
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 07:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5747B30B525;
	Tue, 24 Feb 2026 07:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gt1gZ7Uo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333E53093D8;
	Tue, 24 Feb 2026 07:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771916689; cv=none; b=XNfrv3WkJWKzUkj8R4mbxLjiwuzN08J6loVqjwTwix8s5vZqR6dzdj5ftT2LgEVrCPt+6Y+lgTE728UCU0BbcKHx88vLNVUh+2nMcItiC3O8j+0HMbE9iUJF9hr4K4rFnXtqngnpGb0dD2nvs+xvONvVb8da6p7iX2V09D88R3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771916689; c=relaxed/simple;
	bh=2b8CxN7KUJHXqGoCFhec8MIyvbZMOWOJefBfypic8Xo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=boqFugVXXB/5wkKo981EdcN1N82VBP1ns+b5g22P0kFbhXhhozQz6RiItjwYaGdxnQ+4xiaL33fucs8f+fBG0UPCsCPJsmrh7hpxc19DK5ob1q15kvHDEWnoXL2Zk1QP8M1zir5hj6zPv4KxjImNZBBDk8UF7Y9zWe4yqCxW4sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gt1gZ7Uo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C914C116D0;
	Tue, 24 Feb 2026 07:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771916688;
	bh=2b8CxN7KUJHXqGoCFhec8MIyvbZMOWOJefBfypic8Xo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gt1gZ7UoGipOnJwCOkzRMdWC9bb84NhLK4MGbVWNGWpOj6bhWwTi/4EYSomH1PMab
	 2Y8Mm3bGY3jAMOb5MUCmeyTs/SSYAcGtzL3gwFtK/Jzw4a2LbTPuMgn7usR3WHpsjs
	 Di4BZ3ceZwyGl2GfWSWzHD0EkSddNTEuRVE+i9eEUoEgm0A5vKfSGPzlSjIPu0Yw7o
	 bqyjZl1J5puQ1/gx4yibVpiJSoDiRh7vCHGRk7dEi0NrkIIimBxHHAMmJHU0F+pWnP
	 9D2bXIFPDdF8LkGCeLq0w943QIbErGGA6eEsUpK/IoLV7bdNLYH6bWjwJQZKS5LVAL
	 REc48xAzBCWnQ==
Date: Tue, 24 Feb 2026 08:04:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/6] dt-bindings: clock: qcom: document the Eliza
 Global Clock Controller
Message-ID: <20260224-transparent-chirpy-eel-dc5354@quoll>
References: <20260223-eliza-clocks-v5-0-dcc66df713c3@oss.qualcomm.com>
 <20260223-eliza-clocks-v5-1-dcc66df713c3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260223-eliza-clocks-v5-1-dcc66df713c3@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93910-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1AE59182B7C
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 02:01:18PM +0200, Abel Vesa wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add bindings documentation for the Global Clock Controller on Qualcomm
> Eliza SoC. Reuse the Milos bindings schema since the controller resources
> are exactly the same, even though the controllers are incompatible between
> them.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/clock/qcom,milos-gcc.yaml  |   9 +-
>  include/dt-bindings/clock/qcom,eliza-gcc.h         | 214 +++++++++++++++++++++
>  2 files changed, 221 insertions(+), 2 deletions(-)

b4 trailers.

https://lore.kernel.org/all/d3dee7f6-987c-4d9e-9097-c08c800921cf@kernel.org/


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


