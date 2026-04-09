Return-Path: <linux-arm-msm+bounces-102453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ESpUOu1s12khOAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 11:10:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5273C83B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 11:10:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3E0B7304ADC4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 09:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 932BD3ACEE0;
	Thu,  9 Apr 2026 09:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dg6+q9Fm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7623ACA52
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 09:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775725495; cv=none; b=htvwVqZpjbD062i0cu6sTS8xS44oVmQNUrYlTGL8IZfqODV+0FAdt4lb02T0xdmhGgDvES2i4hdkJuGYhDdwLkYZaqBEtZ6ow4qeyq1cnC2jvPLjxqiWtkoUhzUuJpHqb4rVvhwh00lcNODFrLEFhslS53NjZlDEILQDUKFlRqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775725495; c=relaxed/simple;
	bh=ivdVDjBdXMcsq5rcsNRV8DmeSV0EdX/kGsbLhAxCXxA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aPmhHc8Dm+TldHZO7jKGXgyqpGjNkYa9EFdUKBjpusMhf5bxT7Y/fuxaaCtBtSWuBiuh/7wm8dChZJ+JMpDnsNpvnNxOQ2X8TMS9W6yrjwboQt/GlsN1HsaBz6s8G0N2dEoDaJItWtYRVesYcabRaLLCNl+ssRF+rWdJONl9Dnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dg6+q9Fm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23773C2BCB2
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 09:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775725495;
	bh=ivdVDjBdXMcsq5rcsNRV8DmeSV0EdX/kGsbLhAxCXxA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=dg6+q9Fm06J3f/FzxZ+WQt5KuEOufSQ2NgxBRZUQkPUcyCNMHPkuw8dzbU+YvIhs6
	 eCJC2vvwKcVzkjG9Bp2lA5Kcq0837xr9hw/zKSnSq0ZeeXad03P5vJrITa43wdgfdV
	 cUg9gonhhGO8+IFS7aJGNnquMrotcM6Ba/wG617MV1MFEPGRNS+MKHPSIK0sgQ0wdp
	 goK0mmVdH/HHp7JFAIonN7G2KvgpT72uTmN/XQk5mVgtrg1O+0t2GKXFZgpj5Iv+vL
	 b2x4WaHpdyRGvuRuh9BQsEOoc7+bnkY3cHAHWpMeg+hm71ux6Ip147DOX+Qw6jsnyh
	 mxV0b5BBcMg/w==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38e09b14102so5654591fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 02:04:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXGCyZwJytX3RI2/Hku3G4GOJX3JEr0rF92dNfG5e+UFTRBKEIwBrL7/+83vi+KLUMvXjW8dwaNQUErvuQ+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw70PZveLVbBNcaTh5wSePMbvJ7RLoEma5Y7C7z5LHXQaA0qlqp
	KcqayHpIxpDh6TpWDQAMOI8fryLvkgswIxmuGZX1mN/OD6StnpuJeq5nyWwD7R630PE4pkc/GM8
	LDQLX2ia7qDG2jatxEwRWt95gcQ2mpqGlbVznDUfUvw==
X-Received: by 2002:a05:651c:1102:b0:38e:186e:350e with SMTP id
 38308e7fff4ca-38e335002e7mr9186111fa.7.1775725493820; Thu, 09 Apr 2026
 02:04:53 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Apr 2026 04:04:52 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Apr 2026 04:04:52 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260409-knp-soccp-v5-5-805a492124da@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260409-knp-soccp-v5-0-805a492124da@oss.qualcomm.com> <20260409-knp-soccp-v5-5-805a492124da@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 04:04:52 -0500
X-Gmail-Original-Message-ID: <CAMRc=McDDNQ2qmvxuisKY2xCcV_BOHLhQ6H2gSn-Txx+OOzmGA@mail.gmail.com>
X-Gm-Features: AQROBzAvLOQJLCK2-KvTsbWbxr208ryUSGaqQRkbTgHhlnI3qbTJKT_9AMp0KDE
Message-ID: <CAMRc=McDDNQ2qmvxuisKY2xCcV_BOHLhQ6H2gSn-Txx+OOzmGA@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] remoteproc: qcom_q6v5_pas: Add SoCCP node on Kaanapali
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102453-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5A5273C83B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 9 Apr 2026 10:52:28 +0200, Jingyi Wang
<jingyi.wang@oss.qualcomm.com> said:
> The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
> USB Type-C, battery charging and various other functions on Qualcomm SoCs.
> It provides a solution for control-plane processing, reducing per-subsystem
> microcontroller reinvention. Add support for SoCCP PAS loader on Kaanapali
> platform.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

