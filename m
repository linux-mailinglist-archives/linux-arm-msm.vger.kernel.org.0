Return-Path: <linux-arm-msm+bounces-97365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LOXDr3Ms2lIbAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:37:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BE727FCE6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:37:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 568283023464
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 08:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F68258EE9;
	Fri, 13 Mar 2026 08:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T+jAxJQq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27E4155389;
	Fri, 13 Mar 2026 08:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773390925; cv=none; b=VH1KoyxNeH36nwElJ2PA+FY27MlL5WC5d40JUQkG+xLeUH1qSqKomRa1wg+P+jRrInONkxPocbz31xrqYP9gyV489C+GrMIFR1AtBNg2hQi9a3O0Au4GvrNXKGyV1ieCdKlYWdLQIt9M0nxNIE1IDhTENaV70hwtDiN0evN5bW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773390925; c=relaxed/simple;
	bh=EDExFCc2fdzcl8mUpaErBMdxD+SRnRcHsbLZP9C71Bc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K7eZNmYE1DSH70Iep35MNDrrxP7rzdVT7XTGCiQvhaP7joZXmMz6AW9wCYBHNIzwrjS2JaZzKb6Hl5gDT3oj3MhZygE/w2MVtDhxjggQUdBS/YC8KZ71DqHxVtYnipE3Pc/sKhLnoKaPKwWnvlRG8UQFZjmYx0/klOUKLZH+0Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T+jAxJQq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 226BCC19421;
	Fri, 13 Mar 2026 08:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773390924;
	bh=EDExFCc2fdzcl8mUpaErBMdxD+SRnRcHsbLZP9C71Bc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T+jAxJQqPWmTg/aLnlsYqUNnfHCVmSPT5FW4S2KlfvZEJWbR8rS8u9wDCkVY6Zhwz
	 CKxG3lH9SoXg992zrFqnMwsrVJeNlgGvBKnVl+m+dC5BmnPnLatbc+gzbbi+EbDL8G
	 1eInMEpwJIg8Emf4z27D4rc+HoIhDs59J03tXdlA++CKltZhVuDvULZb/776tZ2x8u
	 ebW/WJNjzHRKdSDSuXQgPxlJdkQToUZKM84zrwXODgBlLSiUeR4Wr0mS60XwIN3SFa
	 Z/9Q8PA2hYa3J0PtC0l+Z72HF87fL2ThIAyh3PTvN9fFa0IkAd9mDcZJHFiE/ChSnU
	 oaPNF0bcIO2LA==
Date: Fri, 13 Mar 2026 09:35:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: arm: qcom: Add AYN QCS8550 Devices
Message-ID: <20260313-optimal-bandicoot-of-modernism-b7d7d6@quoll>
References: <20260311-ayn-qcs8550-v2-0-e66986e0f0cb@gmail.com>
 <20260311-ayn-qcs8550-v2-1-e66986e0f0cb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260311-ayn-qcs8550-v2-1-e66986e0f0cb@gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97365-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 59BE727FCE6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 12:44:37PM -0500, Aaron Kling wrote:
> Namely:
> * Odin 2
> * Odin 2 Mini
> * Odin 2 Portal
> * Thor
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index d054a8f5632d853509b7cd37f07f02473cf6bf71..d76c0b0a082e2ee1a2adaefdb4601048cb8e8a70 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -1075,6 +1075,16 @@ properties:
>            - const: qcom,qcs8550
>            - const: qcom,sm8550
>  
> +      - items:
> +          - enum:
> +              - ayntec,odin2
> +              - ayntec,odin2mini
> +              - ayntec,odin2portal
> +              - ayntec,qcs8550-common

There is no such product as qcs8550-common. Drop.

Best regards,
Krzysztof


