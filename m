Return-Path: <linux-arm-msm+bounces-101835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOQ9O+8S0mmVTAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 09:44:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D22039DAD0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 09:44:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EED593008D0B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 07:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 181C736894B;
	Sun,  5 Apr 2026 07:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nkq9GyBe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B3A27B340;
	Sun,  5 Apr 2026 07:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775375084; cv=none; b=L3WPXEwM4hD8hevh61YMVP3LLLH+vVhQWzXVLLx+TFtdDDb7cwm0I5+XGT5ip5d38p+8hjcvkzanTlHKTZWYv2zB5UJju1nna47EOt1FHxSqxUSEoPNziu1s3hh8jLlZI4JeAqoFGz/I+L5g24ROL5KwsVZYCFc7xXoL9csA00w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775375084; c=relaxed/simple;
	bh=bDdkHE1AU/uZhedcEZNVRUpsw5mhpyk7nqvX3tRljGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NAy8HIT+/w0bXzpw0qrGaJcP8jPtvmYzD3UTRsKknuXLB9RNDftMa/3SROdF1AePqdUlZIaKZHPJtOKHCEiVUAZEp8QpauE/YkyVX2aO0xT9nj5q0moW0uzk6jIinIrCmMdy5A05R1lDfsAEPs3Vc+5s3RKfU1Rws2wPbKFCVq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nkq9GyBe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 284C5C116C6;
	Sun,  5 Apr 2026 07:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775375083;
	bh=bDdkHE1AU/uZhedcEZNVRUpsw5mhpyk7nqvX3tRljGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nkq9GyBefGkwg4nCbSU1BMWZVh7rWYVUnN3rQkQMByAGfZqjRMnBt9F//E+h2At8m
	 Vp1f9MjQvfsPBNIcAgOl16XrjP0d7OoLN4REx+IPtvf09HhwHmPVNogPB9QgknzxSJ
	 rRjIRvRXhLdrOMGeTmh06CGhyXPYS2I9PSroMBlgHz71MyV19yWah8QOkjc3CinNHz
	 KQR5IuETMlWZjaNx8gKI4lqJAfzMRtwbHofhqn2TTrlHcfFWiXzaJ0SjDgU9WoJnJq
	 kazrlrHwAS2AIjxZqWo6iftYqi2eoTL312oKhPb74RN6jL2u+JNc7d26roKMN75F1Y
	 Q5mXkTY8kNhLg==
Date: Sun, 5 Apr 2026 09:44:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Richard Cochran <richardcochran@gmail.com>, Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: clock: qcom: Document the Nord SoC TCSR
 Clock Controller
Message-ID: <20260405-refined-trout-of-weather-6afded@quoll>
References: <20260403-nord-clks-v1-0-018af14979fd@oss.qualcomm.com>
 <20260403-nord-clks-v1-1-018af14979fd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260403-nord-clks-v1-1-018af14979fd@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101835-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,oss.qualcomm.com,quicinc.com,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 9D22039DAD0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 04:10:49PM +0200, Bartosz Golaszewski wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> The Nord SoC TCSR block provides CLKREF clocks for DP, PCIe, UFS, SGMII
> and USB.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> [Shawn: Use compatible qcom,nord-tcsrcc rather than qcom,nord-tcsr]
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8550-tcsr.yaml           |  2 ++
>  include/dt-bindings/clock/qcom,nord-tcsrcc.h       | 26 ++++++++++++++++++++++
>  2 files changed, 28 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


