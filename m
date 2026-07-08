Return-Path: <linux-arm-msm+bounces-117792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xYVuAjqYTmqmQAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 20:34:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F35572988D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 20:34:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=FSGiKblq;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117792-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117792-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBB72303769A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 18:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A4B4C77AD;
	Wed,  8 Jul 2026 18:34:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9B93033CB
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 18:34:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783535671; cv=none; b=XXEvedy/pyHtt+dK2xtCamyIWLHvDU9Twv58PvKfmteS+/5P4NYRfGw4w+KuzUoKqDvdtdIyyUvXGPnm9Qxk1OsGx9TLuOtDaahHOtuhc7fDr3IzEPBa0KKzSP0IQHHc1z9cX5VyUdxrgfGgHrzb2s6CQyibXLVYUVtkqP4FngY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783535671; c=relaxed/simple;
	bh=b6jdtPw+VxpSgFvULqrP0SVRKXGKPjO4Y4wcBsjOyRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FscxdyxZ2pq+b2jViFyr1KRsTdvFcXckQTEoGsnBxlUOl8Mn7kMjsMQciGcR0ck30vp4YxDCwrUqBbTBDxcitUoCrUNbixVm2GgescITw4/wRjXG1cVLNa3HJw6suM5HQxZ3Vd9aIGKNmYCJojFANZ6+KEJ/nS3mJ/LFqLwjMGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FSGiKblq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6EE81F00AC4
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 18:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783535669;
	bh=9cdd1YNFo0BBLZoe+c+X6zyqzkgIO8DBHV2jMSUh/60=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FSGiKblq9dC+28fSlbwXdYIDvwrJgAPOv1wFjq3dBgklv3uovRn4cR/WIkikGAY5d
	 8ovGAfyyI/9Qr8xWGJDDHzv36aJAER0GDZloi69abl3SRSKPOBm4QtAPi89TFLHnYh
	 iad5LILFZEFcIbPzDAVfPJSLjTYBSKfqdrTG41QmKButNojOJ/yONpDvVP7mEFx+WY
	 Dt1wiDMlJhkHEmK6SOUOE29+6YzJVC/0BF5e/Chgh48jILSLpTsOLsvyDKZJtXIsOi
	 +zphAdRSK4cF8bNFmzbocIigoPlXIqhVx+ApylRiPonPcJMzN1icwLCzJrjr0xNoQL
	 1F8AvRcfmUqow==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-69532288224so156110a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 11:34:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoXYDYKTAIWFi3g3PCkpx1rqBkD3NH/BD2u81/6Yf0AAWOLH9NSJMLpEr/WBZ49uZlF+X8vJ3S4y1ypry8d@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4MRRUrEfQnTK7/3PblyECzbI6xUEU/NNW0c5hcas3L9vKyG7P
	Gtc23CvwZHhA1ovitHRMCi1J+ENbV1Cp9iKxxfIRyS3TsUoKkLweUDcoe+8nMrhVGkFENllThCm
	h4hXR/pWesMfaL6hDVapFq14T9ufqSw==
X-Received: by 2002:a17:906:268e:b0:c15:c108:dcd with SMTP id
 a640c23a62f3a-c15ce122ce6mr134397666b.49.1783535668618; Wed, 08 Jul 2026
 11:34:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707190106.2876465-1-prasad.kumpatla@oss.qualcomm.com> <20260707190106.2876465-6-prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260707190106.2876465-6-prasad.kumpatla@oss.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 8 Jul 2026 13:34:17 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJmMpkhry7S7EMG7V8T5-rJb-314ymEoT-nAJEgYisSOQ@mail.gmail.com>
X-Gm-Features: AVVi8Cf_odeuEAHH0gUHkPQjs-lsaY6n8LwjnSMkMCAA6H-6roX9xLgiTdq2FkY
Message-ID: <CAL_JsqJmMpkhry7S7EMG7V8T5-rJb-314ymEoT-nAJEgYisSOQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] dt-bindings: sound: qcom,sm8250: allow TDM slot properties
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117792-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:prasad.kumpatla@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4F35572988D

On Tue, Jul 7, 2026 at 2:01=E2=80=AFPM Prasad Kumpatla
<prasad.kumpatla@oss.qualcomm.com> wrote:
>
> Allow the standard TDM slot properties in CPU and codec endpoint
> nodes.
>
> Some audio backends operate in TDM mode and require the slot
> configuration to be described in Devicetree. The common TDM binding
> defines dai-tdm-slot-num, dai-tdm-slot-width,
> dai-tdm-slot-tx-mask and dai-tdm-slot-rx-mask for this purpose.
>
> Permit these standard properties in endpoint nodes so TDM-capable
> links can describe their slot configuration using the common binding.
>
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/sound/qcom,sm8250.yaml | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/D=
ocumentation/devicetree/bindings/sound/qcom,sm8250.yaml
> index 15f38622b..a45a1a00f 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> @@ -84,12 +84,21 @@ patternProperties:
>        cpu:
>          description: Holds subnode which indicates cpu dai.
>          type: object
> +        allOf:
> +          - $ref: "tdm-slot.yaml#"

Only 1 entry, you don't need 'allOf'.

Rob

