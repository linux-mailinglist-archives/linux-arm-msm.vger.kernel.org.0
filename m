Return-Path: <linux-arm-msm+bounces-99576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODt2DEVRwmnNbgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 09:54:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AA93051AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 09:54:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D02FD3040E49
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 08:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 271F33D47CF;
	Tue, 24 Mar 2026 08:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tr6nHkEG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019B239182A;
	Tue, 24 Mar 2026 08:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774342230; cv=none; b=MmlLXStSI1a226vlLj/RXRis2IsFdqRe3iInOuCkL+/+ZZw5aUgq5xfXaXrbOpvxCJr+J9uXt1yAGPm8UYAvrurt3fV+8ZKU282K7mruXQ17gPEOBfUDLPpVrng4Xa7v8zeKDlQwBrGhh0ZOMxPEg6BQtB6EUACcFZrcPF/4pRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774342230; c=relaxed/simple;
	bh=yQMqSqIh1zk8IlN4O+K8IvmdWDSB2YjZNTsuYc3uEXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dFoN343g3eUOSX9dGjkZDnIEw3VjLSxRM0eonScffdtGez/6+Tl0tNDUne+tkf/tB/OcyvzOFFgIN5eLbzYh4INKk+etdl41JjrL7aiv7w/OKYh4z7iWRndMCp3htHAC+aI3yuOeRb8O41TfWkZ1Vjqb7xt8oDEad58R8/JUB9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tr6nHkEG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C431C19424;
	Tue, 24 Mar 2026 08:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774342229;
	bh=yQMqSqIh1zk8IlN4O+K8IvmdWDSB2YjZNTsuYc3uEXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tr6nHkEGzsmo+61dbGoFnF3bL9xtEpdMx7jEWurRdPXglzGgpy46s+4M+joC3UQ1W
	 raKP4OiQcxPNmCmGe7WZzo9e3eWR8npKE+nxJk2Lw1xMrr+wMb5l77P08VSY4onvRl
	 4o3X822mLlItYzccLwLKTI0GrY44K6uruAT/SEbYhKFfXwxJduhFB5W9DCUvPFepU/
	 FCqtU3Dp4+B6YnJgEj4oMXUbfheIY10r7pRl5EflAPwIqcMCqfYskzn2WIy3nMJEsS
	 MnQHqpTSPQf4rRulVRMzVVIPh0rmN3/03LaBBzyJMIP+HduF/wym9mbz9sPLwLc1of
	 rFLD1WtoyvCPA==
Date: Tue, 24 Mar 2026 09:50:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Xilin Wu <wuxilin123@gmail.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: vendor-prefixes: Add AYN Technologies
Message-ID: <20260324-amusing-russet-husky-4053b6@quoll>
References: <20260323-ayn-qcs8550-v4-0-33a8ac3d53fa@gmail.com>
 <20260323-ayn-qcs8550-v4-1-33a8ac3d53fa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323-ayn-qcs8550-v4-1-33a8ac3d53fa@gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-99576-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D4AA93051AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 11:27:43AM -0500, Aaron Kling wrote:
> From: Xilin Wu <wuxilin123@gmail.com>
> 
> Add an entry for AYN Technologies (https://www.ayntec.com/)
> 
> Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


