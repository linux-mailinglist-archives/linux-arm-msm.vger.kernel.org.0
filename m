Return-Path: <linux-arm-msm+bounces-118248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qrMvCvDJUGqY5AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:31:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2F7739BA1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:31:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=FQ5FjPsN;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118248-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118248-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1AE553008D70
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 10:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E0F409293;
	Fri, 10 Jul 2026 10:31:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E06E3F8222;
	Fri, 10 Jul 2026 10:31:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783679468; cv=none; b=C6VmxprjgQGy5eB+MQJxOhCjw6w/V2mnutUV+BnLupTN9aw0l39PeMYWNFQz8xO27sH/brKBYJdUwvo844kUryllTp+ciwUQHHZxhXqgHMh5a11KLqKNRGECSuRv2SmJ+Jz0BX+cGwf0V/Lo8nweASZArhpZwWuMnat6SxP5I6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783679468; c=relaxed/simple;
	bh=ciMpBU5q5X5MpU3DMrlVl+ZF4pBUD8wSBnMQE41zaZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ws6Cu2agejA3q9G6DuoW7iDOr2kYIMtV6fyiU1rKFjvV6WlKgxWsHhHPWOs5zjBP6yge3XD5VY6Np9Z3oAceasHqn9Y8r+dH1mc/lOwDBYJirL7XxvvSV1iS3c0jP3lpeJbpKlv+oNUxO2dCT57CJUM8n3eHsJGb/qaLRuQ347Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FQ5FjPsN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F24191F000E9;
	Fri, 10 Jul 2026 10:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783679465;
	bh=v9mglEQYnPs6uk3OJ3Xuvp9hCfi2X4aAytOeMWAoI7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FQ5FjPsNOieS0sERUz6obcmLz+1VTDcNw2SSm6i/1AWFQK7OGHR9gNhNNON/C2Axb
	 A13b6MhKhmHt0k4Junss+zgGFrkf96FdL4WkOuB99IRLqbjzCy/M11AVo8lRQuIr1h
	 wJ7EU8nPdIfdaJp+ynA3eY6Jvmj9nZRHGj/l8ZSE5ZbSvKOwYcSfme4Rg2URQDSSfY
	 r4uvcoDcIk4FSPwexuP9x5FfKF4llBPb6GB43OboPkJMDUSdXZ80wlSjt7PdX8+9Qs
	 JrVJk30/lIsewgOKAKb9Q0i/FIC8nYohBxCSzhfKltHOS1mzen3PjBqkrBOeul1nO7
	 dUXz3OKzePTug==
Date: Fri, 10 Jul 2026 12:31:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-bindings: mailbox: qcom-ipcc: Document Nord IPCC
Message-ID: <20260710-armored-tacky-jackal-e5edc1@quoll>
References: <20260709080848.4070338-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260709080848.4070338-1-shengchao.guo@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:shengchao.guo@oss.qualcomm.com,m:jassisinghbrar@gmail.com,m:mani@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:deepti.jaggi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118248-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,quoll:mid,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F2F7739BA1

On Thu, Jul 09, 2026 at 04:08:48PM +0800, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Document Inter-Processor Communication Controller on Qualcomm Nord SoC.
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> Changes in v2:
> - Drop qcom,ipcc fallback from commit log
> - Link to v1: https://lore.kernel.org/all/20260420040141.1247612-1-shengchao.guo@oss.qualcomm.com/
> 
>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


