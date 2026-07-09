Return-Path: <linux-arm-msm+bounces-117908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NANlIHtbT2p1fAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:27:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBC772E438
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:27:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=jQTXadIh;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117908-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117908-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C282A3042536
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 08:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A817D3EA960;
	Thu,  9 Jul 2026 08:21:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F6F3CBE96
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 08:21:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585261; cv=none; b=oYEzN0iqdUZ1BfDn2aDdMv6+gpCHShGWYKvDYKhH4WVAOtmFEqg0Mi0Og8WKOqNoEiat7emHpED+Jnmm+B0oxvSqnXwvzdde9Jgn775ngJ81WFfjdp3T90AcSFJWogEzmv2NJwzEPxYOnXUA3TFNf/xyR4Ytn832cM94USgZCs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585261; c=relaxed/simple;
	bh=Ohzl7PWWxPjWZ4tXvMcYkXyrj5Wxk4aqB0wBzBEY2O0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uUR7+eq3fXR7duHWOdSR92m4OAR8qvRuZZ3Vd+tiJxDfOjGw0Rn77HVsFnUPdvaWCmh2brJqXCyaglCZBcvI7t58ygqTKyyn37BRpHlbvWHzdd/8TNTCPpa65tHbCaHZXIdZeyXgNwuoV8+pLctGjwqQ3pHfazXmaYDwCV5WkMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jQTXadIh; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEE6D1F000E9
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 08:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783585259;
	bh=9tUtktBx772SuNsHQ5mcJ9lnSn/4XPHVAAgyesELQcY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=jQTXadIhqjAIfbf/M+pHE5woVFPcv7CPCsaR/+q1L/EcSvDDlwA3tHsNOags65Bco
	 iD4y0ZuAOGAE38C+t71xryFmOIBXQd2Ne/t4DUkn+SPjZCMioHWTLKp4sJo/3ugts9
	 ci4ZZTxTDDteQnLpG2ZldCaHnZ8kVJ3Gi1s88tiRBNWJV8niuOVRrXuujpAZ1B12Rl
	 Sug/bz3VDnX8ELwOcgjMjSQcDBMJWBAUSxENX+izop4o150HKOMwPGm4D2dYR8Wbbn
	 NRcMPu8S3atEEgS+aKKqhyfo4QPuSpaMpUwc41KdZKePTsZ9MUfeW1CuKMqyfGxMNM
	 XlUkrOrQhCosg==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39c81bb4182so7354531fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 01:20:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqh0lYiv1qZmwnVa48zvbyDbFfsPMNOkez8xT+jiZh3+UqYrWYTvUrrYgmNtldyJALmYXpOKB7sN0gyAHYa@vger.kernel.org
X-Gm-Message-State: AOJu0YwFEAMjOYorfstsvFCoHM3r5uxO/CpjcAMOnJ2ck/9P08iil6fZ
	L6pYWUWrFQRW57spX7so4nnXVoycQPI5vSfiSAOmGO2zkqVk6cASblW7owFzTlCy0mM7GtDBMfz
	ZmCE7SXH2OPizkyX/i6dNyPnuQFUnuVUaCrS72TfKww==
X-Received: by 2002:a05:6512:350a:b0:5b0:11b4:fd7d with SMTP id
 2adb3069b0e04-5b011b4fed3mr1316663e87.55.1783585258690; Thu, 09 Jul 2026
 01:20:58 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Jul 2026 01:20:57 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Jul 2026 01:20:57 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260708114924.1069239-2-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708114924.1069239-1-prasad.kumpatla@oss.qualcomm.com> <20260708114924.1069239-2-prasad.kumpatla@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 01:20:57 -0700
X-Gmail-Original-Message-ID: <CAMRc=Md7LFXEd5KZ0Q4QExAjm3J=kSuE2dY+VA24Nw7MfVh_5g@mail.gmail.com>
X-Gm-Features: AVVi8Ccn_oAqwXTtlBZJX_W2TZrcjkC2Qh7GQ-UuQblJCynSYsRTJkzjBuBAll4
Message-ID: <CAMRc=Md7LFXEd5KZ0Q4QExAjm3J=kSuE2dY+VA24Nw7MfVh_5g@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] ASoC: dt-bindings: qcom: add LPASS LPR vote clock ID
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117908-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:prasad.kumpatla@oss.qualcomm.com,m:krzk@kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:andersson@kernel.org,m:brgl@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:srini@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6CBC772E438

On Wed, 8 Jul 2026 13:49:21 +0200, Prasad Kumpatla
<prasad.kumpatla@oss.qualcomm.com> said:
> Add a new clock ID, LPASS_HW_LPR_VOTE, to represent the LPASS low-power
> resource (LPR) vote through the PRM interface.
>
> The LPASS PRM supports a resource voting mechanism to control low-power
> states via PARAM_ID_RSC_CPU_LPR. Exposing this as a q6prm clock ID allows
> clients to request the LPR vote using the existing qcom,q6prm clock
> provider interface.
>
> This functionality is required on newer platforms (e.g. Hawi) where LPASS
> clients need to explicitly manage LPR resource voting via PRM.
>
> Also update Q6AFE_MAX_CLK_ID to account for the newly added clock ID.
>
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
>  include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> index 45850f2d4..06ca2c287 100644
> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> @@ -236,8 +236,9 @@
>  #define LPASS_HW_AVTIMER_VOTE		101
>  #define LPASS_HW_MACRO_VOTE		102
>  #define LPASS_HW_DCODEC_VOTE		103
> +#define LPASS_HW_LPR_VOTE		104
>
> -#define Q6AFE_MAX_CLK_ID			104
> +#define Q6AFE_MAX_CLK_ID			105
>
>  #define LPASS_CLK_ATTRIBUTE_INVALID		0x0
>  #define LPASS_CLK_ATTRIBUTE_COUPLE_NO		0x1
> --
> 2.34.1
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

