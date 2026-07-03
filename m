Return-Path: <linux-arm-msm+bounces-116221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ysEqLmtzR2qiYQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:31:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5040C700155
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:31:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=e1vaKw6K;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116221-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116221-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7F21E302F439
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 08:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFBFB148850;
	Fri,  3 Jul 2026 08:17:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B598E23393F
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 08:17:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783066621; cv=none; b=FwqUrPYZYe1JM6fMiy4pcD1++pHZql7NYOx3K97gv6bAMg8ft35LM9i2po5vo3G5Z5APRSozYMbVNhhZtbkPk3THHrqy20gcOs1B58S9nh6Rv1o1MIUMAoMQ5kIBBVckM5I27Pd3QGU6XoQNdoMOKFEyMdyQzGNht0SW6pJr59M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783066621; c=relaxed/simple;
	bh=QJOcXfmw20X5sZI1Ono6LvDxifMpmngxepAYTJs53a8=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c+bFx3Zw2F13F/GJBEv16xgsCJmNqTYPQ4/UDoszQ5KErxgBft/rn7CoiSH9va0PMKE/lXBmtZorLSf5kbQ1y1EeXkBwywqAvM7bpoOrKv2Wx4PrH5Pq58wZKsQ74GaeK9pR5wdcolcnLnrYNjHBreNMdKb6gIAd9c+JDYFG/9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e1vaKw6K; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90A6C1F0155D
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 08:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783066620;
	bh=9mjoepdP5rHShQlZQEVaNo366/uL16tDjhpeYdGMYXs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=e1vaKw6K9h/y8VO5RRvyut08Kboa4zul4Tm5ZIEPg7FaOHHQ2+Inu2gzQYIM/t3ec
	 Ys5lsVKTKGKS0ymcRkOKc+JoEagGKnHgx9wG4asNx6k3iRcjS5NfZ0XwyW02IMkUXS
	 PXhKfrB7itfAIxmolPUX2p9HDvSYLWbZ1JhUyIa2LcZj6hd4Bv0gvkBFl0i+HtpKhg
	 wxlr1XqpFclJ1XecCJc/N70lRxE5Qz0byUvztSNtqPVA8L3Nr+3I26rxVf8WR/ESqz
	 nuHXpHhkxTMNjnWbsTem5zNF8BJdTrZNDt4NpEUqD9cGKJqw+YnWwCX3Suk9nCjgpd
	 KHbBjQYryeodg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aebba706b3so350456e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 01:17:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqFjNEPLVTUlvkvE8ygs/i/gi013SUQf537S6OriVJqVqeoFB3lK61MMnHjLvvF2wFEDjpVK15PxofCimQS@vger.kernel.org
X-Gm-Message-State: AOJu0YwVkZPETwt0lVujIa2HqsW1UunOaKcYXq4zuclLoE7dyNXlKkcG
	HCzDqL55nlVZMtg15RNobPhDOGwHPXsq0doThD6GdNDiqZbs+uDC/eTBFzDch7ZA9v5Cg5dWxyv
	N2lMDuUmza6DlF8IH+WOHqfEd/s3VqY0hgrXikNHfCw==
X-Received: by 2002:a05:6512:4cd:b0:5ae:b792:7f21 with SMTP id
 2adb3069b0e04-5aec68b78ffmr1306749e87.33.1783066619248; Fri, 03 Jul 2026
 01:16:59 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 04:16:57 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 04:16:57 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260702-b4-shikra_crypto_changse-v2-4-66173f2f28b3@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702-b4-shikra_crypto_changse-v2-0-66173f2f28b3@qti.qualcomm.com>
 <20260702-b4-shikra_crypto_changse-v2-4-66173f2f28b3@qti.qualcomm.com>
Date: Fri, 3 Jul 2026 04:16:57 -0400
X-Gmail-Original-Message-ID: <CAMRc=MfhJC+vu9z7kM=GXqL_qCCErNHWir5egCgtpNkUukZHEA@mail.gmail.com>
X-Gm-Features: AVVi8Cei73cWpjCQ-R6oBZCjYMW8r8RT5ymwAfiTuyKjGde9dm5eFMMvLXxKO5Q
Message-ID: <CAMRc=MfhJC+vu9z7kM=GXqL_qCCErNHWir5egCgtpNkUukZHEA@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] dt-bindings: crypto: qcom-qce: Document the Shikra
 crypto engine
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Harshal Dev <harshal.dev@oss.qualcomm.com>, 
	Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Andy Gross <agross@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
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
	TAGGED_FROM(0.00)[bounces-116221-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:kuldeep.singh@oss.qualcomm.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:harshal.dev@oss.qualcomm.com,m:vkoul@kernel.org,m:brgl@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@kernel.org,m:agross@kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmaengine@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 5040C700155

On Wed, 1 Jul 2026 22:17:14 +0200, Kuldeep Singh
<kuldeep.singh@oss.qualcomm.com> said:
> Document the crypto engine on the Qualcomm Shikra platform.
>
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> index 08febd66c22b..5a653757ee75 100644
> --- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> +++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> @@ -54,6 +54,7 @@ properties:
>                - qcom,qcs8300-qce
>                - qcom,sa8775p-qce
>                - qcom,sc7280-qce
> +              - qcom,shikra-qce
>                - qcom,sm6350-qce
>                - qcom,sm8250-qce
>                - qcom,sm8350-qce
>
> --
> 2.34.1
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

