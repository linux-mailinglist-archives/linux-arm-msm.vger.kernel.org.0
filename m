Return-Path: <linux-arm-msm+bounces-118178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2MaSDZSZUGr52AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 09:04:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7AE737E6F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 09:04:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=gSSjlpsT;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118178-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118178-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 32B2B3005301
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 07:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CD913BCD19;
	Fri, 10 Jul 2026 07:04:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D993AE707;
	Fri, 10 Jul 2026 07:04:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783667086; cv=none; b=UE4oOmqjexRe/JIwYMpnZNYrCnHZGLcqCb776JfQxPS7ibRbpri97/nd4qxDBEFE6D1lQj4QAEUuXSTgmAJ/URFIrerlxXykFP371bnGmzYRtioRdG0BbhJxOgLf1Ow4hWdiE7yTwNKNCmaO30ckgTf7/3cWZ8RjiiOCaHrpQDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783667086; c=relaxed/simple;
	bh=lQ2ZzUts34us+bAoMg5eTkOA7HMBX+S+UXDkyeTQdGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BFqIvslkoe/pCPmVx64xOLkdIWknbFjEEKw+4G2aTiGEZ5QScPG5d2MtJhytrES+o3kWtKRcSXTlxDHNMlYVsqGvacJe8g4MtyrIdRnEHJjpLUrEKOD3EIxX7y0KoBx9Wx/e9hu4MyFYx203HH+HdvX6V4F/c/gtmsua7rPCdpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gSSjlpsT; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39DF51F000E9;
	Fri, 10 Jul 2026 07:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783667085;
	bh=+CYjmrJCtVa9SP3etbvUrkNcDJSC4r6lAgFkVU2BoWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gSSjlpsTiZcnyb+iYK0cSqNfVFyxqcSErMk+KMn3ZgScy0A06Xs0FYpUDUo2ArM7I
	 KN53zDuGxjJqdotqnAzXKcBExzjom16E1x2TowEmsv/085SVyjdghHSkgdJ8/Wx0Z3
	 xObwRhsKqs6UKVx5iYbVlccG4+nvYsmhdoNwnIR9hogHtIEAduy6G7KymuCgqR5znA
	 ohIRhhp/ZntgWVdo8xjM43Ph1FIcaMhfpH+Opeaz1cFnl9JURLh1AevvEsYsdbuf6d
	 Le/R6t7NUNUgYlSJeH2PdwEQI36qQcv6cpMk0S1DJr0eni7UDap4VOj79o6TdXRxxe
	 6dizOOIpPTWaw==
Date: Fri, 10 Jul 2026 09:04:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 6/7] dt-bindings: arm: qcom: Document Nord IQ10 RRD
 board
Message-ID: <20260710-adept-lemming-of-superiority-67e928@quoll>
References: <20260709132013.4096850-1-shengchao.guo@oss.qualcomm.com>
 <20260709132013.4096850-7-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260709132013.4096850-7-shengchao.guo@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:shengchao.guo@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:deepti.jaggi@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-118178-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quoll:mid,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B7AE737E6F

On Thu, Jul 09, 2026 at 09:20:12PM +0800, Shawn Guo wrote:
> Qualcomm Dragonwing IQ10 Robotics Reference Design (RRD) board is built
> on Nord Embedded variant. Document the board.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


