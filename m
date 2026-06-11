Return-Path: <linux-arm-msm+bounces-112827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Km/ODOhGK2ph5gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 01:38:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FD7675D3F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 01:38:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=P6lUoct4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112827-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112827-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9C17B308CEA2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 23:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B56388883;
	Thu, 11 Jun 2026 23:38:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C3A32938D
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 23:38:11 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781221092; cv=pass; b=XVCWpMarCRzyRHdVDN9fUZAeY6gVj+5HRYV0+byD8RHb8yCVnOey6EccT3NxGQQbnVMYIFUe4gBK3K1wnNVnOM0IR5fC9oj+3HJ6nQsytdFu7Fzv6rdNycf3UVYSXhK2Vs2gjXpYqBz5pzz9uwa8T0E7UKqWNmhiVJckuTaeiNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781221092; c=relaxed/simple;
	bh=OCI9iA6DxuuvVs6SgcV5UZj41qFoK7VUdUsBZR++iII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HT+4S7njoBWsvhqiH6dcQMo5VA3gtmAX2ES9dnLr1s9X5slysw2FRBkzdUXVG9Cjo3ihmZojCeeCfez2WehrP+ML3BiWtRfqOryLsEIGUHdRxBKPZar6diG33gOBrd0FgaXL0zmqGP5rNUO8Fb+dPYrejJocbVbF0angeopg/6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P6lUoct4; arc=pass smtp.client-ip=209.85.167.180
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4863eae4526so251867b6e.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 16:38:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781221090; cv=none;
        d=google.com; s=arc-20240605;
        b=HduLS3BC0qRdLCZgj5gAAuORybirwz1XPrGdIPgF8QGYqDzM/7y35kXPUYPOfCk5MW
         bieEc/m992s8Mtjohwi4ON34KQV7uigVOInRg23RIY3sDFnxBKn+wFOJ/Ok325rshhOF
         S42o+XyzLv5VFkLrE3UwJVeNXEhzU2OwblH23MVt9ksjg/U5Ow+beI2oCBZgbR6VYlIw
         3rL1p/QnpbPSKN1NekTtXx7KBGdj5bqQXgaUySYP3xpJ8UfjVNX3e5P9wWkVSvYr4Blj
         YtEfS+AOTBqx2cxh0X2CgCVyzyhV7eDwqUevQf2rxpAvD75hVjg/hgwp9gzeuNXypDEw
         5qYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oQN/0dYPUTUtLXSjPa/KqXbPj3fPnMrFaO2ZCvHqkPA=;
        fh=RGB+a2IXcecjF3ZXtkC6quobcp5Fvjp0wO8u+4Miv7w=;
        b=Vws1hAcKPGsJLlZffrIE9lB2GMe3HkojmUzytRb8qEq6L5q55kzS60w/0ZJZ1r5e5P
         RtfIONS1jVOiBdswYURiGwQ5eTzTgO49j8dBEjWTwwr5UTp/G0Ca4tNJw2zJtY2WTam4
         coiSu7ae93d0ctM686sPnyJKqqM6bHeaiiBOSgSu2YGj8dn0oa3c3I2IIJcgZg+65JkM
         McE4kURQFY6oLPMYMnhNZVLM0FM1Ylv/4bE3kwKyvw7fr4xyNCi23J3JzZ5iwB8IFBDS
         P8okPpqN5pbAYoKL333bubpXtC35rGEHBwmQleOEMk8bYPmGeotiWbItC/wb2hOTka3m
         fdyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781221090; x=1781825890; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQN/0dYPUTUtLXSjPa/KqXbPj3fPnMrFaO2ZCvHqkPA=;
        b=P6lUoct4uFNA/2SqbUL+F7H73OP8HoaK3NMTPpDmf70C9Q7MzXhQKXcgp8PMWMefC2
         WGdZto4pZkVoFIzo+yZH/Dvgiz1us/Ib+IPZGJBcRJ+nXs7dCJia7Z3pL6tsjNYsSn62
         Vl5ywljNMOxJnEDdTEYPYucsJvJaTJC2vwpFtO8ZctI5umpjWofIIN7qbNP+3yebPT7m
         Ptmwbq312wj5AShtH+Du8EV1U5i7kRT3Tx4Pdl2iDsD7zVxjgxdI2VWamgB6vq/Yf4Uo
         h7vFxnae/dNXd6WzrU4rNP06m0w2IbCR731zwhgT6Wc9zhNCZ8Q0l00kEcitl4rksJq5
         78Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781221090; x=1781825890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oQN/0dYPUTUtLXSjPa/KqXbPj3fPnMrFaO2ZCvHqkPA=;
        b=npNa0/X8FKDSjROs48pV2ZXKC0uj262W1ISbpxWgE4mrSQaYb+rpKzdysey1tpBpfE
         Nf7I1ghK8k5j2Sq3ngkAJBkdcKVnrzZ934EV9cT2eW+fhNWKJkGWuvdRGgouumKKI3vq
         fInWYpErS6Zjpb6HceplAqjj34xP2EPmC+sNSwizChl9TTiIhf35tWyYwumAWMXITF2w
         AE4q2IU62DZ0sMk6lchbwsDfBPTVPH0mt5IGayjt0eMQOD8s65D8wijcoutPEcbMu0S6
         9WD/MkYVndXRVHQP11YLSM5cGnKbTcGSRG20WTrFN4DHZvSX7ZbrOcqanwf4dhBmkq3N
         y0AQ==
X-Forwarded-Encrypted: i=1; AFNElJ+X5GXTaw3DEDCOaxsKjfvWyDbcSw/LOlEQJYIS1Ka6euT/QNtKEPoTXBeOtvwndRkTTEH4phaU3RBKKtyI@vger.kernel.org
X-Gm-Message-State: AOJu0YxU+637w7GA2jJK8TzAQAddmisC3f1w0kY7rzX7f1dcv76n2Lue
	/YCFY5eYIQe8P64q8+VSMvUjVC5oL4syIGYXKDPV5fSpu76yC4mR4oUuCIi3iKWkJWi5/GCLPAe
	7/a7skgGuv6AGFx5S5QRL8kPwR2Iueh0=
X-Gm-Gg: Acq92OHhiqBCRTnmbJvk6yhowFoIU6m6wXz7m2NObxQqIFQH7a36LYXMb4l2n+cajPp
	bnw2xlmZXuAg9Pfovngf9DKDs2mEwPk+3LjoEX7/xs4dBuXnWcbMKP4alUjAYdYwA4NwspYYM96
	gLhdUV0zW6TG6W01KqBPp2H1GVXVSBD6ybuKGc42veK0TDN13YfUrpZkVGc9fqRmKYwACTAGq7W
	7d5Btci7h+McteanGN1gjXf3Kw2fC80y2LwCew02gS2AdltErMF1HP5bhTPyjpq8k9RNppuztjr
	1kVKMB2MJ1QoAwu0STM=
X-Received: by 2002:a05:6809:20e:20b0:486:cbc9:fc18 with SMTP id
 5614622812f47-4872f59d6eemr232963b6e.36.1781221090436; Thu, 11 Jun 2026
 16:38:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526-mailbox-qcom-maili-v1-1-1b689a42f33e@oss.qualcomm.com>
In-Reply-To: <20260526-mailbox-qcom-maili-v1-1-1b689a42f33e@oss.qualcomm.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Thu, 11 Jun 2026 18:37:59 -0500
X-Gm-Features: AVVi8CdCWnW_myf0FClK3jHx803e6rWUVbaC7JSscx17uIuBUvByHh5ERwWcBXw
Message-ID: <CABb+yY2+3S=PM8ku6oRtm0iBNtoY9yzVe90EBWh7jD4xSms_sg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mailbox: qcom: Add IPCC support for Maili Platform
To: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, yijie.yang@oss.qualcomm.com, 
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>, 
	Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chunkai.deng@oss.qualcomm.com,m:andersson@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:yijie.yang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:vishnu.santhosh@oss.qualcomm.com,m:deepak.singh@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jassisinghbrar@gmail.com,linux-arm-msm@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112827-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jassisinghbrar@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 94FD7675D3F

On Mon, May 25, 2026 at 10:38=E2=80=AFPM Chunkai Deng
<chunkai.deng@oss.qualcomm.com> wrote:
>
> Document the Inter-Processor Communication Controller on the Qualcomm
> Maili Platform, which will be used to route interrupts across various
> subsystems found on the SoC.
>
> Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/D=
ocumentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> index f5c584cf2146..4b69a281971a 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> @@ -27,6 +27,7 @@ properties:
>            - qcom,eliza-ipcc
>            - qcom,glymur-ipcc
>            - qcom,kaanapali-ipcc
> +          - qcom,maili-ipcc
>            - qcom,milos-ipcc
>            - qcom,qcs8300-ipcc
>            - qcom,qdu1000-ipcc
>
Applied to mailbox/for-next
Thanks
Jassi

