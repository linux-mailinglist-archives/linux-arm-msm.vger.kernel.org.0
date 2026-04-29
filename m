Return-Path: <linux-arm-msm+bounces-105129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DuNOKuw8WkRjwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 09:18:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2999C490556
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 09:18:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9534930038D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 07:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E26739C65E;
	Wed, 29 Apr 2026 07:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bIf5ygZQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA4F38947F;
	Wed, 29 Apr 2026 07:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777446842; cv=none; b=YdAToFYFNziA4BEyQEAP7yDy+QMP251CxLQkTkkyPzsUoox0LEhSHHkYNeI8CZO1P7gMXGH84l6xwBzSJx3Uul5xjQXLQLRXXW84xstLQ+sdHqRU3a7TuEZ6d28xt/dxVrg2PODhzXMjKtzCBidiojn8Ute0W3nlAq/1y76JUno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777446842; c=relaxed/simple;
	bh=JhrjZ6JrxUbW4jn403AGTKy8EG+rRp1VKGMmv9irj10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qPJCY43iWJK40TUTJYSBDNnFa6SggM7K+imgAGa8GY3fh4N1u330+uXHqXMx2fNaEgjHyTYk0JjtdneWUR7+7zyl0/M4PWC+TafWeoyezpJSvccCBvbTzP48jLDtZkdGFo4emXWpmsUPZ3SH2W78AhRdxE1mnOJWOgAUWCHf7Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bIf5ygZQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE73C19425;
	Wed, 29 Apr 2026 07:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777446842;
	bh=JhrjZ6JrxUbW4jn403AGTKy8EG+rRp1VKGMmv9irj10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bIf5ygZQObOEaqVCQNbuS1OsDmVIL0Az+pBBEyLJvjOAoYIYCrSaIMmLEYGPpcl1H
	 EKD/tnGZAflb1gAW/17z8EAQplaMS9cteKTEr2E4CLD3ZchxmxZM+BjgFvAAFGniSg
	 9g6B4DmrTDlDCqdgu5dXLykFqHQt9nHbp/1g3iNfzcsFYDjQgi3eCdtz5gM9HJMzb6
	 XXCW2kc9ikEcTMFUDcEUw92Bs+VZIqR79HKF1QsmuDe/XN3FWNPY8UeyfywNeDGgdj
	 kBfa02DC4ZuA9HbH6gOotaeauJUUlgFZaGokBndZ6gUvNwoqIgNrUksM0JaEUP++uv
	 H5YAtGO3YLdDQ==
Date: Wed, 29 Apr 2026 09:13:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mailbox: qcom: Document Nord CPUCP
 mailbox controller
Message-ID: <20260429-fluorescent-mole-of-ecstasy-6aef0e@quoll>
References: <20260427005236.230106-1-shengchao.guo@oss.qualcomm.com>
 <20260427005236.230106-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260427005236.230106-2-shengchao.guo@oss.qualcomm.com>
X-Rspamd-Queue-Id: 2999C490556
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105129-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,kernel.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Mon, Apr 27, 2026 at 08:52:35AM +0800, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Document CPUSS Control Processor (CPUCP) mailbox controller for Qualcomm
> Nord SoC, which is compatible with X1E80100 CPUCP, even though it supports
> more IPC channels.
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


