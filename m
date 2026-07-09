Return-Path: <linux-arm-msm+bounces-117897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /FkDD0VYT2plewIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:13:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA9B72E1C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:13:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="jav/Zp8M";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117897-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117897-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1A506303EEC2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 08:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4148C3E92A5;
	Thu,  9 Jul 2026 08:11:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F7D3E835E
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 08:10:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783584660; cv=none; b=J91RlhXvumUsl9g5yVptm1Xw2ayRHovF1V6tKz7FduTwDQm5QAjHDqjoYqPAsWd0E5BXH32n/CAdhuDqfa6oGIdUbRcLfobDO6KahQOxUoxVNSkra5aHUWY5pToLd3a+nw9+hqgA72fae0KIjD8GMAJggdNY1NvWZhw+3uRvlwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783584660; c=relaxed/simple;
	bh=++1bDEraC9c1082wwl2rgOQSuEPLaKYWoXFtLy0XpO4=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QR3aqspO67S/YNLiHnQIXEHlYrquTMRXkYvFGS6I2X0F4GC+3D1g3pJzm5wYgMcOWORwog/zQSYhkzN2PlwvTCeotFHJePMgglpJajKIZH4QAuq4es+iHEMfS5M0z8d7KtSkLgAgXklKvig+rYroTipH3ILTN0MxVb7yaBBzAcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jav/Zp8M; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0B171F00AC4
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 08:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783584658;
	bh=U1uas0bVk76zTawZ1MePh/a0JmsT4DBy6Ise3zIftJc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=jav/Zp8MtQmjZG/LF7xJqeH8zZc78gU24IYeMd2xg4rggZBA9jANp8TDkvUiq15+f
	 bPzukgIVz+YF7uHPnQ3vSkDi7lVnGKtCPDUOlqt2TcMpKtnsH7Moazf5RrBAI9PsUg
	 57K/K0LB6TTfkY/clrO/ZxMb/iVpwsurb84lgeeb0cW9nJlipXfaeQ2qJiF0yAdnxD
	 31f90y29Bg/CqB24rc3Jxfgky/tK/Qu+QzUgRJUmwnlHODxEbsjwTMM0wrdOXLYpBk
	 Xn9SX6cR1JsJ9d0tJVyWsga9TQPHzdQZm0gKWqPs1Qh2mi80oUFY3vRCubihXdzikR
	 vlIMeDapjqa+g==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39c70687003so15022001fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 01:10:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrZhx8SHXX3ddOni8KI1j3c0hNdBH2geN6GMTYI7vrozaslwe9JHdu3QLtOR4YVL0u2GHO5fzJcSsEr8SKW@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ2ZaR0evPPCKGUc8sd1rblvBV79wdcKfCIs22PL9jekCLAkGw
	ymgryIxoAJ6JlX24VCQHV2dOJlnh1zyheiW0nQyjJgatNHX70wFHGbbCF21MWETGffTieBR2hqp
	BWqet7xuLpXptbwmfwZTZS19YSBGen/W6G4Izxv2n/A==
X-Received: by 2002:a2e:a40c:0:b0:39c:6928:9b6e with SMTP id
 38308e7fff4ca-39c799e4f2amr10112091fa.29.1783584657537; Thu, 09 Jul 2026
 01:10:57 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Jul 2026 01:10:55 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Jul 2026 01:10:55 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260709080848.4070338-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709080848.4070338-1-shengchao.guo@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 01:10:55 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfidKTSvmNHXD+BfjShhKnoyBDiKSW6773L288DaO9F2w@mail.gmail.com>
X-Gm-Features: AVVi8CcskXj4_C2iJTaNa4YePoZCMSdxyCbEBN9tzhQOA5oQA3jWFuOwiv7DBT0
Message-ID: <CAMRc=MfidKTSvmNHXD+BfjShhKnoyBDiKSW6773L288DaO9F2w@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: mailbox: qcom-ipcc: Document Nord IPCC
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, Jassi Brar <jassisinghbrar@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117897-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:shengchao.guo@oss.qualcomm.com,m:mani@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:deepti.jaggi@oss.qualcomm.com,m:jassisinghbrar@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,oss.qualcomm.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2FA9B72E1C8

On Thu, 9 Jul 2026 10:08:48 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>
> Document Inter-Processor Communication Controller on Qualcomm Nord SoC.
>
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> Changes in v2:
> - Drop qcom,ipcc fallback from commit log
> - Link to v1: https://lore.kernel.org/all/20260420040141.1247612-1-shengchao.guo@oss.qualcomm.com/
>
>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> index 3839e1f5f904..a378fe8c7148 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> @@ -30,6 +30,7 @@ properties:
>            - qcom,kaanapali-ipcc
>            - qcom,maili-ipcc
>            - qcom,milos-ipcc
> +          - qcom,nord-ipcc
>            - qcom,qcs8300-ipcc
>            - qcom,qdu1000-ipcc
>            - qcom,sa8255p-ipcc
> --
> 2.43.0
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

