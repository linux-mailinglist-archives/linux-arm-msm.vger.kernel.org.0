Return-Path: <linux-arm-msm+bounces-92268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5UnyMUvYiWnVCQAAu9opvQ:T4
	(envelope-from <linux-arm-msm+bounces-92268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 13:51:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDCB10F0AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 13:51:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7677F3011F24
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 11:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AACEE36EAB6;
	Mon,  9 Feb 2026 11:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QmrC2ViW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EB836AB43
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 11:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770636743; cv=none; b=GGMf5S7WT80RYXpGZWo2eCCF9LV9xptlDcBJiTtzbTnHN1eVOugatb8dsaX16IyjR8c9g9MxirjhSay605wYh8IpMNitqr7DepHOQWws+nKA5UYwbzD6xtA7RfIzUnhNUvMxjPAw5tQkNJGQJSyEBFwgWDzYGD1obsJHlLM9SVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770636743; c=relaxed/simple;
	bh=j8Pi2ksY+iGpnuw6D18Fu7LEu4cw370HLF6C6Z4/mpk=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lM4moD8uHPuwBq7Jw7z1zrbhUOZ2Vz7OC/LkxYOUIYX0jFZEc3aAbm2+5lr3mTrjq4Fow7XDuvc/rAkhIFymJEUiopEjkQ2FFQeM65pkPJD3AD3r1dknLgYhmaXKSbh2tb4yea786PFYfE7oEIaWvMYP0jnFVI92889S7JuQf9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QmrC2ViW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6812FC2BC87
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 11:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770636743;
	bh=j8Pi2ksY+iGpnuw6D18Fu7LEu4cw370HLF6C6Z4/mpk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=QmrC2ViWCzLj6XHOijrjze66ujr0k29MAjyfM/BUs777zRdgE964hw7YRjOZrMFGP
	 c4bv/nwOBTRsMsi1tvHtal9R736H2vlz0FvxpGZjIoNwHtkQNz7FLnh6n+O7S24Af8
	 5GRcl2SS/AgMAOaOop+ZAUYXBFCu4qWoI+bjWxNiHjWu1yo3yzbBWKAFL4FjGUJ91A
	 9mG1eIq7+bcVxV+CSLDMgDz4HS58mEv5ehYZ1RyeRB/WTUYEEZoDCudR6d7T1Jk4M0
	 yBrLZ2DmEbdummH/ndv0lUnJb6KbYuRQ+4zoB48KMQL5KjOGlmy+IQ1ZteJ0tz/Ebj
	 2EqTJPn+8xESQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59dd9aef51eso5765634e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 03:32:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV9t6h8azbBfDbS1smWdZX+hG/6+gWSJN0x6DQ0pnTQ9ynk9kgvFGq3QB3oLIGJq2UclvcVhB+swTDmSMjr@vger.kernel.org
X-Gm-Message-State: AOJu0YxG0qNmm2uGrSc2jvppMtvqf34jnAv9TwllPvV+yj7ikECFhnwV
	5JOrk+3q7faWEdXCpxXl868QW9pvGbMEY2UoBBbBxkofU3AvpsAZFQRt7PgS6Ih7AaZD1ceXlN3
	H0Gyhibf56AVckytbt0Ni/ptxXMOfwjMO9MebIJW/5A==
X-Received: by 2002:a05:6512:1152:b0:59d:e018:5648 with SMTP id
 2adb3069b0e04-59e45150e88mr3570829e87.32.1770636742093; Mon, 09 Feb 2026
 03:32:22 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Feb 2026 05:32:21 -0600
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Feb 2026 05:32:21 -0600
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260209080613.217578-2-vivek.sahu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209080613.217578-1-vivek.sahu@oss.qualcomm.com> <20260209080613.217578-2-vivek.sahu@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 05:32:21 -0600
X-Gmail-Original-Message-ID: <CAMRc=McvJa=hVPsPgNNz0Uv9vxPSBUymGJVQ2keGCLu3_qpypQ@mail.gmail.com>
X-Gm-Features: AZwV_QjCjmmgbB97aqFgLGCCA1CHsOAUbS2i5hadaP4Fm9EPkI13UuC0if7xfkk
Message-ID: <CAMRc=McvJa=hVPsPgNNz0Uv9vxPSBUymGJVQ2keGCLu3_qpypQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: net: bluetooth: qualcomm: add
 bindings for QCC2072
To: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
Cc: quic_mohamull@quicinc.com, quic_hbandi@quicinc.com, 
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
	Rocky Liao <quic_rjliao@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92268-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[quicinc.com,vger.kernel.org,holtmann.org,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3BDCB10F0AD
X-Rspamd-Action: no action

On Mon, 9 Feb 2026 09:06:12 +0100, Vivek Sahu
<vivek.sahu@oss.qualcomm.com> said:
> QCC2072 is a WiFi/BT connectivity chip.
> It requires different firmware, so document it as a new compat string.
>
> Correct the sorting of other chipsets for better readability.
>
> Signed-off-by: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml  | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
> index 6353a336f382..85cf65efca92 100644
> --- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
> +++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
> @@ -18,13 +18,14 @@ properties:
>      enum:
>        - qcom,qca2066-bt
>        - qcom,qca6174-bt
> +      - qcom,qca6390-bt
>        - qcom,qca9377-bt
> +      - qcom,qcc2072-bt
>        - qcom,wcn3950-bt
>        - qcom,wcn3988-bt
>        - qcom,wcn3990-bt
>        - qcom,wcn3991-bt
>        - qcom,wcn3998-bt
> -      - qcom,qca6390-bt
>        - qcom,wcn6750-bt
>        - qcom,wcn6855-bt
>        - qcom,wcn7850-bt
> --
> 2.34.1
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

