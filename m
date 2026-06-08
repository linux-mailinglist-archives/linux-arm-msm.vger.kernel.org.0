Return-Path: <linux-arm-msm+bounces-111914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id APrnD8bQJmoMlAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 16:25:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B76D5657239
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 16:25:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=QO0oOSQF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111914-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111914-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3A9E630698AB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 14:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A89B3CB2C7;
	Mon,  8 Jun 2026 14:15:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C3537104C
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 14:15:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928136; cv=none; b=MNWsYey0G54NI/0kZwu0seFn182fgHC2KMddp5lHoBoED7A7ZLv9wU6lWw1CW2trNwLOzQZI3XXbVeSYJ2k/yvdlWCl7HKHo9Mt92dl0D9b2gT1pTfBF1rmzB8L/8TNNdmc7skqgPYby/s+cXeRak+f+LXHH6GRlgzq5jZQ7eK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928136; c=relaxed/simple;
	bh=N27tHKPnVemnIIAT6lwlY7ksDoq7iZiZqIJ9AfRepmk=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LhZoSKkgeS7ApjvJ1RgZJoBppABrVFJy6s8IZ4B19cXd3zkZFSiA5EfCuUtx4OM4jMAh6735WA1c179z1aCvp6mb5DBTSIPs9YXXEA1b6IGsBj2+8sNL7hIPA0XYYtr85Td8SVgvss373CidyGqxZ/yjwXiMAa3EOHm6ndJ0OOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QO0oOSQF; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0E621F00893
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 14:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780928134;
	bh=N27tHKPnVemnIIAT6lwlY7ksDoq7iZiZqIJ9AfRepmk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=QO0oOSQFk8b7Wl2CTh1cEFBEJkkLKPqdUC2EtOBd2v5aksRlyzHe/Rs9vqvMeuCMx
	 SenJMHe8fB9kl2BiZYpWOZyCFtuOZB2vC8MyNoqzSZS4rc/3jdVN3KqoSeDHvMTW8F
	 BeYewWzr7t3XCBOs6j94TVz4AMjH9qZDw7iGPd1A2QN2hVmfYXSxCP8xQxtEakZe0y
	 KjRs3UtgsQBZMiAi5fQ1XB4RCFGv4M0OZDItRWNMftnaWAhhmdnKn06psge7RUJ5Hh
	 lyOGV2hzcXjYOhM1++532SoidU+u5ST4FMhRoYL6kN/eBEOZRER5OdAQkxXklJE7D/
	 +My9g+TxQHa3Q==
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-13810b63a1aso406565c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 07:15:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+HfT21s4KcbxntRGv9AOS45jZBXSDPYj7MZZuIm8Cfcy15pHSKemWrk/W0xjQnu4E8UT1VSkEXtyAVbdfZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxTNNplPi4H1hNE/tXczOmX1RtLUj9ZcBu7M1B2QrMUvvQ0+DiV
	QqIWRNtNgfzfTyv1bmYD3hvvdBvsFv5T3ZSQ4VN5pyDrc6KXj600Iy3WEl9d30aRjQScl5Wiwfn
	XpahJYx2YPCdUT8HjQr1O7Xz19Msb8YyebmL0XWSXmQ==
X-Received: by 2002:a05:7022:323:b0:138:4fb:f284 with SMTP id
 a92af1059eb24-138066c6042mr8166724c88.15.1780928134440; Mon, 08 Jun 2026
 07:15:34 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 07:15:30 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 07:15:30 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260604-surface-sp9-5g-for-next-v3-8-6aa6f6612c10@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604-surface-sp9-5g-for-next-v3-0-6aa6f6612c10@gmail.com> <20260604-surface-sp9-5g-for-next-v3-8-6aa6f6612c10@gmail.com>
Date: Mon, 8 Jun 2026 07:15:30 -0700
X-Gmail-Original-Message-ID: <CAMRc=McrNhkSdiF=eM5cCthwMxdhxV-FFr4u8CCLw78syLFqYw@mail.gmail.com>
X-Gm-Features: AVVi8CfkKHFtbgMd9KBiYIvAWVC9h75Q3J1RD6g-8IvDVJvxojpGEdmkD1OmD7A
Message-ID: <CAMRc=McrNhkSdiF=eM5cCthwMxdhxV-FFr4u8CCLw78syLFqYw@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] arm64: dts: qcom: sc8280xp-arcata: model the PMU
 of the on-board wcn6855
To: jerome.debretagne@gmail.com
Cc: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111914-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jerome.debretagne@gmail.com,m:devnull+jerome.debretagne.gmail.com@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:brgl@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:johan@kernel.org,m:jeromedebretagne@gmail.com,m:devnull@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,jerome.debretagne.gmail.com,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B76D5657239

On Thu, 4 Jun 2026 18:18:44 +0200, "J=C3=A9r=C3=B4me de Bretagne via B4 Rel=
ay"
<devnull+jerome.debretagne.gmail.com@kernel.org> said:
> From: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
>
> Align the Surface Pro 9 5G with the other sc8280xp-based models as done i=
n
> this patch series [1] from Bartosz.
>
> Add a node for the PMU of the WCN6855 and rework the inputs of the wifi
> and bluetooth nodes to consume the PMU's outputs.
>
> With this we can drop the regulator-always-on properties from vreg_s11b
> and vreg_s12b as they will now be enabled by the power sequencing
> driver.
>
> Use the fixed BT vddrfa1p7-supply supply name to align with bindings.
>
> [1] https://lore.kernel.org/all/20241018-sc8280xp-pwrseq-v6-0-8da8310d956=
4@linaro.org/
>
> Cc: Bartosz Golaszewski <brgl@kernel.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

