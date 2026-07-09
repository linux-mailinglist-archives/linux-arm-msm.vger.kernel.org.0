Return-Path: <linux-arm-msm+bounces-117911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /8BvE5ldT2oTfQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:36:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 988DF72E5D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:36:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Cx50iv8X;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117911-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117911-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81AF33019196
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 08:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC5333E8343;
	Thu,  9 Jul 2026 08:29:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1293B4EAC
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 08:29:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585760; cv=none; b=qoqQ1SVyScGyh68ljQyKPA/hGSM/MGyqkIszz4QZfwhxEET7V7OS0uDIIRE4gTtFBpkVSAZOwT1EfP339ptVSP+xXmnPw1tM9uBTnEgaEul7YqqS2P+IhteB/Z4mImgstYqv4bskxOd0v9kR9Kr4pX3uHVOsiWG9jqpTJ3nVMHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585760; c=relaxed/simple;
	bh=i0igLMQ33zhxoOIX3XetWF7gN8smYnjfTXIhRoexI1A=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RM21Ns2WW7h/xHQj30muFZddJRxj1kKOkEzjYzQ1TJhW5FZAwLE03HrMVRHXXkNwf4bIpsoKUrcfNpEXlrmyyQ/bEuU3onuwAo5wRyIuEbfl/lF1W2jjtt0O8UOAexaSgGR2GidrFBWZJ463S3obLDrqGCy0NCeYI2mEfXLk3Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cx50iv8X; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B1471F00A3D
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 08:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783585759;
	bh=YAtIHqm2ZMjAhBbacLCHQR++DR43xD3ram9aYjsmlhY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Cx50iv8X0cQmJSVUnfFpWfSZ5KfOX7K+K63BaXt8a6PedSRTewifFWyiyS8wo6IsV
	 4zCChQ+17C8Auvsr2sBx2f6bonbX3nxBEIPndgt7ZNHeYwYDaqahn6jRHrDdGn0Yxj
	 TzsiOD7HZ+uO21u0paGCSs4fXOtYdm+awwY8emRhgFMXvkGhu7I+BPpwCfdvMrGb/t
	 UBBWIRbPepf+qieGlaR5sV4z+F3ojGNBCeBm9PDvqJ6v34r4bDdrr1Mpw3VxtZXhbd
	 GdatVEZ3XO+1X8T5EyL2fi8t0UwLy5J8RSOUFEJHyPH3DWmDGxQH9rRSx6vW+gvmii
	 HDy4kGUVgVaeA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39c7225e60bso14530081fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 01:29:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq7JNkaNRR+oQjNZ/PhEXSwJVk19jH3eVVAsZv8J9Du3nsfxEtUMUrv/+FireNxO3Pt+trxxDYabL8oiqSi@vger.kernel.org
X-Gm-Message-State: AOJu0YyLn38I4fcgSve01UdN30HRqoVKGK5C5kxUAit8wAtYdpT7UyOm
	lV8f0y7DFuEODmCbhCjwk77x1xMpXMrfGSKXcs492Jcv8DiwBb+EzTYZNSDMsPVOnBFH/MHBTfT
	5pMwfDUGX9HwhyrM9Rn3dCCE+sj7FhqmDhiTFt760wg==
X-Received: by 2002:a05:651c:199e:b0:399:90ae:a406 with SMTP id
 38308e7fff4ca-39c799c9fa9mr12982771fa.27.1783585758335; Thu, 09 Jul 2026
 01:29:18 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Jul 2026 01:29:16 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Jul 2026 01:29:16 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260709082040.4070711-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709082040.4070711-1-shengchao.guo@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 01:29:16 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mdt+39pbnE3XOwRm6yWJAENU1UeQhw9xaFu2vDqgcXU1Q@mail.gmail.com>
X-Gm-Features: AVVi8CevtjxRrM5Jiux4yHD5WK_K0ewuBLgZ4WNdELr7GiHQbbHlJ0bNIUyMMn4
Message-ID: <CAMRc=Mdt+39pbnE3XOwRm6yWJAENU1UeQhw9xaFu2vDqgcXU1Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: misc: qcom,fastrpc: Document Nord FastRPC
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117911-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:shengchao.guo@oss.qualcomm.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:srini@kernel.org,m:ekansh.gupta@oss.qualcomm.com,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gregkh@linuxfoundation.org,m:robh@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,vger.kernel.org:from_smtp];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 988DF72E5D4

On Thu, 9 Jul 2026 10:20:40 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> Add compatible for Qualcomm Nord FastRPC which is compatible with
> Kaanapali FastRPC.
>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> index 2876fdd7c6e6..24fc0752c11a 100644
> --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> @@ -26,6 +26,7 @@ properties:
>            - enum:
>                - qcom,glymur-fastrpc
>                - qcom,hawi-fastrpc
> +              - qcom,nord-fastrpc
>            - const: qcom,kaanapali-fastrpc
>
>    label:
> --
> 2.43.0
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

