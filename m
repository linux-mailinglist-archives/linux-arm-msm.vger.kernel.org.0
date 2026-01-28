Return-Path: <linux-arm-msm+bounces-90961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEhMCATweWnG1AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:16:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBBCA025B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:16:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5C28F3005310
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0B3C2F1FD7;
	Wed, 28 Jan 2026 11:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TcQIv6jb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC3927CB04;
	Wed, 28 Jan 2026 11:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769598972; cv=none; b=mIgQagmr7WI5KJqUnXdzOFYAJ8VF3ia1+gTFNEX3h1LvPFEFWzp+7hXEbLQQ5igVGw+XILOAxjtgCTHqxqmFI3/waqXWsvgQRnvDzXxL49evPi8pVENcrYd1RpA7QQj2jMiTvuK8GvBPsj5wgF4eOvSiyIg0aZyX8p7cCqCo/9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769598972; c=relaxed/simple;
	bh=L1hLsH9B69/acN3sPP99c8JIer+SheNorBJx4lFp7F4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AMYgA6VxIXgHn3C7rTBK4DH50C9E6naH3+gbQO7btWWtrxuxCbZgIXOIA9V5hVRHwNlxroVlW2JZEix0J5EStGEOjJSXjwsw8Jci+9PL4Z5sDDhSC2Jqjw83y7PtSR6jdhTJqpwzcEHMZOlmW5kypYhv4n4TY9K8MP/tCnu1xlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TcQIv6jb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDF2CC4CEF1;
	Wed, 28 Jan 2026 11:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769598972;
	bh=L1hLsH9B69/acN3sPP99c8JIer+SheNorBJx4lFp7F4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TcQIv6jbwzIRbHsaBct1yW4YV2oCFoqUEQmVkSyOTrd8m+52OFO9EWAnXKlFX9tRI
	 OoNUtWmlk4mk6lo2OdxyIoJVr78KQJ+T8y1qjSNEl33CKyAzD/NOlqXtMPhNxRhZN6
	 ujLotefXb+2nHU082rBWtHAvmF9VNakn7TGs4WoeJyxPo9A0ZL0cjt0I2RYaXgmqDR
	 ldVJDOw51M8/arcm0slPAYKrez1g2cyL5qwuNzX+65dI1RGjxF81sEFdUJ6Bsu0IwS
	 vzPTM90KMKJuHXd4lSauvDGYxbLpIjvf1SUMlR6IwBqUclnR2Gk3123czW49IMNzWj
	 qbr8s2YaJlSgA==
Date: Wed, 28 Jan 2026 12:16:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] dt-bindings: clock: qcom: Document the Eliza TCSR
 Clock Controller
Message-ID: <20260128-futuristic-weightless-goldfish-97238c@quoll>
References: <20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com>
 <20260127-eliza-clocks-v2-2-ccee9438b5c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260127-eliza-clocks-v2-2-ccee9438b5c8@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90961-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ACBBCA025B
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 05:03:20PM +0200, Abel Vesa wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add bindings documentation for TCSR Clock Controller for Eliza SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/clock/qcom,sm8550-tcsr.yaml       |  2 ++
>  include/dt-bindings/clock/qcom,eliza-tcsr.h               | 15 +++++++++++++++
>  2 files changed, 17 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


