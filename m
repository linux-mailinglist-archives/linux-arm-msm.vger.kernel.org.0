Return-Path: <linux-arm-msm+bounces-108541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OXOFrN/DGo1igUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:20:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A68315814B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:20:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA33B3186B10
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD11E3AFD01;
	Tue, 19 May 2026 15:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SbVjSLLd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA04F3AFCE2;
	Tue, 19 May 2026 15:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203299; cv=none; b=EPeg6ZL+xtUdYdORaKJajqn60m+3Hl+p0fqqdQtHIhs2ZQYOBAXdWo6+UYRV8QACQqtjdGofL8YcOoyKts6ynh3PIiXR5IxO47Z4e94LMfUMNk8bIBGiocxaJ/ybK0S9qdDKdv6DI3t038vRG+hkMUclSDPm1rUgxapCYcD3RkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203299; c=relaxed/simple;
	bh=3ZLik51hIIMeMd9ZBFmo7bGqchDBoZfkdoyYMKpDxmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NVYO9mDKPgbqWmmaKB5MkxRyGC2MB8BnQ55F5CdPkSGrCWTfjvvCpeh7BtuOJumc2j783VTw16RI0QR5Nc1ZDhHjUvzC/BPlnDlLf5EcZPDJk5HfNOUXM+6OYrCTbMIxSPU4GtgIIYpPicrNDGcNJiji1lphReCBDt6oMhDgSB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SbVjSLLd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CC9DC2BCB3;
	Tue, 19 May 2026 15:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779203299;
	bh=3ZLik51hIIMeMd9ZBFmo7bGqchDBoZfkdoyYMKpDxmg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SbVjSLLdqZ9SytoNK/5ut2wJJZvhevbtX8Rsi1gJIkWHOFBKzqCQHXylwJh3DdDTU
	 cLCDIu7ot5gZo61LN7VPl2uJQ2M+ybArfygEMPJPAPNjzKvjcHzXVrSQXJH1+paa63
	 kRVXaIV/+36r/OH71GLOzeR9vvo26Am3gKx7Dz8d8qrIbxkAjsGw3nd8YgP+tTt7jp
	 T2H1T+xVjJxeGf6Z0Z1QKT9XwrcAbPF+vm6p4X6xMWZbhLEtqrWgxmFwwdWQUY87eT
	 qNp1y7z0wXZk9SHoXgxs33cEsDwh5se5lOdaqLZjL26zewOMG549oaWxJ3TNNKpti3
	 9QD65N/TT0fZg==
Message-ID: <1353ac66-d963-4ab7-8a6f-32a8756d460b@kernel.org>
Date: Tue, 19 May 2026 16:08:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: nvmem: qfprom: Add Milos compatible
To: Alexander Koskovich <akoskovich@pm.me>,
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331-milos-qfprom-v1-0-36017cc642db@pm.me>
 <20260331-milos-qfprom-v1-1-36017cc642db@pm.me>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260331-milos-qfprom-v1-1-36017cc642db@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108541-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A68315814B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/1/26 3:24 AM, Alexander Koskovich wrote:
> Document compatible string for the QFPROM on Milos platform.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> index 839513d4b499..936878e74895 100644
> --- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> @@ -26,6 +26,7 @@ properties:
>            - qcom,ipq8064-qfprom
>            - qcom,ipq8074-qfprom
>            - qcom,ipq9574-qfprom
> +          - qcom,milos-qfprom
>            - qcom,msm8226-qfprom
>            - qcom,msm8916-qfprom
>            - qcom,msm8917-qfprom

applied thanks,
--srini
> 


