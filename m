Return-Path: <linux-arm-msm+bounces-116220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xzZjC1BzR2qcYQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:31:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7B870013B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:31:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=SnxsbFRr;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116220-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116220-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB5F43049710
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 08:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1D7321F5E;
	Fri,  3 Jul 2026 08:16:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15892DFA4A
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 08:16:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783066584; cv=none; b=onom9PzxwbTgmhMLVHSTkcJNN0gV5dt/yTm78qmU03uk27KYnLAc2ZI2yL2mOzFRB1Plq7dBPjOMTJsTxKQyTHVk9euMnIW+koCZj1Zp1PEULNCkx0478z3G4ULtQ8f/YgFm3QBLV6n6sHn7E9+sXJD6JGAMcf+FdK9benT2vLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783066584; c=relaxed/simple;
	bh=qQC6pzd7ZW+6w81nTceX1afYorhY8BSlJVG/W/7Y+l4=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tSKl5OuNBxOFOpmm62PR72Bd9W4RLo7OeCIgKQCDOQG3/Db5aTl0Gj+iCn0/v9tALehOnwQo4+hKT+OFUgYPiq5RDGLEM4CVHCCjhQjnhMtAlfCVYC5PhCoQ/c1dJ5QX/D+J7jVqzN4I1OpH5bOtf1XP+pEhQ+6Nrp5PFIhVKis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SnxsbFRr; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C5D1F00ADE
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 08:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783066583;
	bh=qQC6pzd7ZW+6w81nTceX1afYorhY8BSlJVG/W/7Y+l4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=SnxsbFRrKsb107wQrvD0J/wnqyeeG0qlWaTxooQGjbvtWgOPp2ppKVs9iugUO2dIe
	 PTNpGIajPjxxqrbrVu9/tjuZpDcg+HEXephaY0hvvu1Y2hG0w+tx85iCYK7SNF5TiN
	 FcMMg9FnoqszzXErKQliIWqgLkOybc9CE0oM919hCCrUDMrBh6xuwtl0Qedz+HYQAR
	 l1tG7yeaRNe4dh5ialvoF80Y20+ydDEDMeiP7gbSj4KS9bSpb9VtTdofdwypWESm7k
	 NY+wknY2PT8YhPtrcSzsNSTW0lHRCUcRSB4xuagsJlWcXuX9ZOKBXQnQSb3QG5MUSL
	 PfrTX3WZqfSQw==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39b2d353713so2034591fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 01:16:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrbAkrjz6i4fOo+B7oKCfcdeYpk8lgHQbqj2GJ7Wwym+rXE6PDhn31xnx7V/7UobIeEg95P2UYio/Xa+cY3@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ6YwBlmuEy8MSspjbLjsFZzauY3YXvk+uTo6CnLLPFsb+dSsO
	crDKSKNl1UTPE4gS90ei4FEkQe4fhwzR7Jn3D19MZHett8ruWmT9kYWm+KVqe3dD2gaE8J95WXm
	+KKDiFlIRIvGrfjosjJzknyBzSDsvJaWDPQ2GXZuN6A==
X-Received: by 2002:a05:6512:124d:b0:5ae:c542:33ef with SMTP id
 2adb3069b0e04-5aec6795b43mr2021138e87.8.1783066582095; Fri, 03 Jul 2026
 01:16:22 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 03:16:21 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 03:16:21 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260702-b4-shikra_crypto_changse-v2-6-66173f2f28b3@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702-b4-shikra_crypto_changse-v2-0-66173f2f28b3@qti.qualcomm.com>
 <20260702-b4-shikra_crypto_changse-v2-6-66173f2f28b3@qti.qualcomm.com>
Date: Fri, 3 Jul 2026 03:16:21 -0500
X-Gmail-Original-Message-ID: <CAMRc=MdNrdAJmD-mgP0wXaiKid5pE8m4_9rOpXcrLk+T35sFgA@mail.gmail.com>
X-Gm-Features: AVVi8Cc4AXtmTJ4dPWDBNLruLtcz6tHIZccf9Ba9r0GLPfEhItZNEGvR8CW_x68
Message-ID: <CAMRc=MdNrdAJmD-mgP0wXaiKid5pE8m4_9rOpXcrLk+T35sFgA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: shikra: Add ICE, TRNG and QCE nodes
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Harshal Dev <harshal.dev@oss.qualcomm.com>, 
	Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116220-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:kuldeep.singh@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmaengine@vger.kernel.org,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:harshal.dev@oss.qualcomm.com,m:vkoul@kernel.org,m:brgl@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@kernel.org,m:agross@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DC7B870013B

On Wed, 1 Jul 2026 22:17:16 +0200, Kuldeep Singh
<kuldeep.singh@oss.qualcomm.com> said:
> Add device tree nodes describing the crypto hardware blocks present
> on the Qualcomm Shikra platform:
>
> - BAM DMA controller used by the Qualcomm crypto engine
> - QCE (crypto) engine with DMA support
> - TRNG hardware random number generator
> - Inline crypto engine (ICE)
>
> Also connect the SDHC controller to ICE via "qcom,ice" property to
> support inline encryption.
>
> On Shikra, different BAM pipe pairs (for example 0x84/0x94 and
> 0x86/0x96) may still resolve to the same resulting SID due SMMU-side
> optimization. They are still distinct pipe pairs and therefore require
> separate DT IOMMU entries.
>
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

