Return-Path: <linux-arm-msm+bounces-100629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMr3LbddyWnvxgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 19:13:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B3435340B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 19:13:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B9AF303FD89
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 17:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A49A4383C90;
	Sun, 29 Mar 2026 17:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y3GhcnSL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D526238239A
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 17:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774804251; cv=pass; b=l8gvmPWOxg4CbDfULVSvRvy2aiXvn0PeumYh7cFNY5r3g2R3L65jQygOZKGB12WPPc7CEADMNSUTh6mst8rMmANM3oiLBklUciMVE0FHCx0YNmXhAhQDi1U/iOS718fNpsLQiSSvyl6ceHNL3jrKrKrhY7rrnxhpHL+zqa1kZLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774804251; c=relaxed/simple;
	bh=rsVeJPHdgyOCuxiECCsr2glqWzke2yPywwPZ4x83Vu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NPbZ3q2MyfZwsss+jq2iNowgio03L42cPa8PFi1/VKOZJe7L8EemgBg6ssRVfGyEMHJovSLl+1aMN//5v1Ry/sbYzxUTJwk3Jfp9jQL9dzpavdF2xSd1SN4u+znXTIoLfPu3bGQGZ6jZYPLSNZmfzD+EwVaa2nONWQgGgNg1+4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y3GhcnSL; arc=pass smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-46702742c99so2463038b6e.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 10:10:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774804248; cv=none;
        d=google.com; s=arc-20240605;
        b=fV9GidIQxJnJ4ODjcWhsrMji6hiUSlPf+0v1UXBwQBmOfVkb/PxbfAFSkn9oValeAD
         7chYpfJIJT5VCV6pRqj9INhOplRzMMHI5q7Bi77cbUaqKtpodUXZFvYxKMN25LOdJcOB
         5H0ZyaXFy6L03wpNwWqZeebC45GsPD9yzUDGhBKytzMviCLEc66/lEnFOuXrFR8WNb11
         78b0Rx4+dAlerBF2szWsur6MVQL77eUYmqDoDjKQyxz1GKs/rUtMqZpLiqQDMkXD2vZq
         LlkzaSZcfalhmHi3y/du2EhfTdxoL5ao1IsuUX1WdspGO01cfYwwcUMVHRfjuHC/1g0H
         yHiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZlxbdeYNKU9+jEQ+FY2jeitF0szXbRjABBRQQBT4p78=;
        fh=tZpXXayqHXpL01OAhRHBp6Xzx9sXr8oXeXW/vKSvyJk=;
        b=MZZpS+X/n9KaIVbrnO82fxkpUiJaJpPZkrUgZdXQ/bwducOGJGJqVqD6YbtXeCWv+P
         VMTKO5vGZiYvXwvwpz0QUT1p/yDd5ib7gF5DGID7K+xyKJXF7qK2/P0+grx26m2kHbZ/
         NLK0gXnqXFX5Y0eTrD3c6Q1K3mWUbgHPvPuojinIRcUKSYXGmsvPuDsjxrw2jaB4P4fb
         XSbGxSmTeDaaZbI+BVadF1ESYKcCEfVEsp2rjQoXQaa6f8VN9f5f2Ft1FUd337/edpGT
         Ci2nkQW97JtbHgp4iLtb2kQr9ZMEEgR0ZNNIWPdeW/EkR6d9LHb86SwmzOJZzShfEx3S
         00Ig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774804248; x=1775409048; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlxbdeYNKU9+jEQ+FY2jeitF0szXbRjABBRQQBT4p78=;
        b=Y3GhcnSLSJ/aDcuVKwWSSubu8zbUdIEgANQ0WCfpTrMDMfxCuPOHjYixeOMaKrHa1j
         Gq74lsXiaRMuMBi1+9DyulDSlCiC+spSghaZDaCk7w5XoxO5Pa09a4K/YlCIFM1NgG4f
         RTC6sZdZUXYK3PfuH0zhfMvDTD4fkcUblyTy9P4lFU+5CaAW6D0+MVcMvd2HR8Et8FIt
         zopIBXe1yhqMiBUV2BBbgo3Y0AnX30eeg2XZM+fj5FZ0jYbNoWEFn8gA/41zbajCwX4o
         lFBp9nBrCoFTXHHAbZyOP6D3NldxSZl7HSLQrVNLul4o7z3ZjOmqFbjA+G9EE+j8rffI
         iIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774804248; x=1775409048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZlxbdeYNKU9+jEQ+FY2jeitF0szXbRjABBRQQBT4p78=;
        b=FDbc9VPd3BIfUbJQbRyqW4o1QzQGXpzfkfg1NxCRUDjmJ+SmbHcON4ZCgPWzIrhwwC
         umU7crEV0vVAno0aarBujg4rAfcto2Crk+FXVEZ8S/t7d5bT+icGIKxD9fT0kwKiYa8G
         grqbCGBKSOe2Ek6RqVlI+LkbSmEC/vmp9pivxk06dY8krSzMxZ0EuwXfNLWMGuLAjMK/
         1lfQ0GZGWyEF/FqXFTN86tR2+lICWCLTZCq52IYjEyEfzNkYF5b3AjYXOta5KT6EWys5
         s7qOZVhIUpPUthCXLXMmPEF/GTYawGZXcSLI9vcBDMwfyfeVb8caAUBluWlRaStq255d
         lCgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK8nnSiTgY7I3+siN7tJONw1AZVwjj0I8ZTYzRlFDdgcjigeR3NIK/3jP/ETDgcXdS9RKTMJKDzm0tWthe@vger.kernel.org
X-Gm-Message-State: AOJu0YxF/2SAbtAgMiGNW+MAp9godt9w9vVWbdTLFqCwOrGGZYkFZ30l
	93dSIWY93UbZpd6zpQcxd0IqHWRmXvnWX4alPmiRWQMjIp917tDj229WuampzYUpuVMqh9D///H
	jWExBZ0avnVojeGpGDb8wZ4p+VoV996U=
X-Gm-Gg: ATEYQzxuPlhEXujCwGmH+3AndACM0k98KM1bp7VTMfRKH6ce2VPcF98tFg1b7KEaM5Z
	UsJw68xYmtuIIRRe6t5JrVchu9KwXZY3YaprAd3Rrbbk4Vi1EIQdzRf29A2KxTzFHNN58o4LFSI
	s8wRXDH1QpQx+FrHndpd6JaGvBISKmJR9lT94InZwUNBvoQNcNDqdkzgIJB9Dl9vDfamDo1jchr
	F2uwVNrV1069k/tJBMPgYeTbEhoKoLhJgWn2r1irUla+AVhKP0+ot6bpqBJHrxxsGTeQcsvjaoY
	dvbiUwe65e7A9qo5p9A=
X-Received: by 2002:a05:6808:5296:b0:467:133f:ec2d with SMTP id
 5614622812f47-46a8a5ed427mr4757024b6e.42.1774804247851; Sun, 29 Mar 2026
 10:10:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-eliza-bindings-mailbox-ipcc-v1-1-3f1c89bdf72e@oss.qualcomm.com>
In-Reply-To: <20260327-eliza-bindings-mailbox-ipcc-v1-1-3f1c89bdf72e@oss.qualcomm.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 29 Mar 2026 12:10:36 -0500
X-Gm-Features: AQROBzALnYSR6ICZtBkS1SOfWG29206cWXGKz2mD9ry34Mbei70R0dkKaWCq6wQ
Message-ID: <CABb+yY31SMUKrTaeu2mq341GM0v+waT4DmoakhB6FK4Kx9XC=Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mailbox: qcom-ipcc: Document the Eliza
 Inter-Processor Communication Controller
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-100629-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jassisinghbrar@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 38B3435340B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 7:36=E2=80=AFAM Abel Vesa <abel.vesa@oss.qualcomm.c=
om> wrote:
>
> Document the Inter-Processor Communication Controller (IPCC) found in the
> Qualcomm Eliza SoC. It is used to route interrupts across various
> subsystems.
>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/D=
ocumentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> index 7c4d6170491d..f5c584cf2146 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> @@ -24,6 +24,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - qcom,eliza-ipcc
>            - qcom,glymur-ipcc
>            - qcom,kaanapali-ipcc
>            - qcom,milos-ipcc
>
Applied to mailbox/for-next
Thanks
Jassi

