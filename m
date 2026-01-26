Return-Path: <linux-arm-msm+bounces-90584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFPOAUuOd2m9hgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 16:54:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1DF8A59D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 16:54:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E96813005AA2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 15:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01891340D86;
	Mon, 26 Jan 2026 15:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eRxBqdFp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2937244694
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 15:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769442886; cv=none; b=ToFm9KVgaWare56XTtOLhHwVsefpGh4fGSMcU0XoRw1UrEFXgyZXKYFxPxA3/U5L5hzlYXjaxXKYzmVWHMbZicmw2T+Gd8NOlYR8V4hc2pS7r4Jezbxsy/gmOUhYcfmAldbSHW3UCxWtY4EnR2U0gVut6gyGkcriMxt1V0f5J/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769442886; c=relaxed/simple;
	bh=FHmDyE0UYE1xiwDpiZqyMHgZcrm4MmLL5FOpRSRN2rQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uTF39a3hMgUCd16L67U/uYUNxnW2kZjctDAUi+ZTFS0JjOIh5r8bY94ZbJFlk9/Fbc9X4Z/ujsQ23kU9+ujRZGVOTo07Ue+j1g5SuZtqiTU9ykBL+sxf47xD66SYZMx6daNaNPWvE9itDRNzipPAyy+Xdnr/InvKlQ7VR6LpvPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eRxBqdFp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A33BCC2BCB1
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 15:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769442886;
	bh=FHmDyE0UYE1xiwDpiZqyMHgZcrm4MmLL5FOpRSRN2rQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eRxBqdFpcbGEUKRYAfF7IbW7aZWqq7rHMQuKNXT/KihBElk1pMLgAmmuFPgD+uE/n
	 aN6udDjwBD90s+NbECn52oUgJnh3Y8MUl2CVm/uHB7icL1nf3KW4VYpkP7SiptGeOM
	 /r5iy/mC8+CCtPiH2xkU2uUfNTzGoe5G0M4Fbj0UKdF6A0rRhh5USxgyCWrlCKEpv+
	 pyYg2RZWWyjnMth/lw/62fvvBHr1ByY1blij8ygUkFT7uUwfXHBGMY7FJ6yl1F0JGh
	 uBShKvA0Y6yK+YxK936Qi7DpuCcRMTWnezaWRoABmNTEz9mPULZhtxGLCTdc1/tDGB
	 UM7Ws2hKJT4cw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59de0b7c28aso4514656e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 07:54:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX7UQs49XJ/V8VFHYVmy+xvKK9N4hKZ0wKw1PyrG5qMUtOUnL0MGp+VTYaAUb1lmvGA1yjk/HC9vF6JixA4@vger.kernel.org
X-Gm-Message-State: AOJu0YzymB73Wn37qklr5J3TW/WrA+XiiA1BoWKulyXJfbXN9GZ1QtXv
	GzrVw6x7oXSor+riATMBBPvKyK1gwbfNtXgbk1XI36aZ5VDk0VcdAFg+uQTb4NU/yZWiiQeneFe
	rNGOtB8BhAN59mVTCRXjJJiNlXiNlLURN/jDd5eqFtQ==
X-Received: by 2002:a05:6512:398f:b0:59b:b55a:a293 with SMTP id
 2adb3069b0e04-59df3a18ab8mr2231075e87.34.1769442885116; Mon, 26 Jan 2026
 07:54:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126135627.34191-1-bartosz.golaszewski@oss.qualcomm.com> <5d9b79e9-64e0-4d62-857f-dd888e09d4bd@oss.qualcomm.com>
In-Reply-To: <5d9b79e9-64e0-4d62-857f-dd888e09d4bd@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 26 Jan 2026 16:54:33 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mfdw=AVr1PzyJnG__qKCJ_GHMDTQuGDYkq=o4H7G+HMbw@mail.gmail.com>
X-Gm-Features: AZwV_Qi0omihUgX82PHastLczfWEHDDz-Ncj06TYBB7YnSD0-C80lYz5FekEzWg
Message-ID: <CAMRc=Mfdw=AVr1PzyJnG__qKCJ_GHMDTQuGDYkq=o4H7G+HMbw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: lpass-lpi: implement .get_direction() for the
 GPIO driver
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>, stable@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90584-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8D1DF8A59D
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 3:41=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 1/26/26 2:56 PM, Bartosz Golaszewski wrote:
> > GPIO controller driver should typically implement the .get_direction()
> > callback as GPIOLIB internals may try to use it to determine the state
> > of a pin. Add it for the LPASS LPI driver.
> >
> > Reported-by: Abel Vesa <abelvesa@kernel.org>
> > Cc: stable@vger.kernel.org
> > Fixes: 6e261d1090d6 ("pinctrl: qcom: Add sm8250 lpass lpi pinctrl drive=
r")
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > ---
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # X1E CRD
>

Linus,

Just a heads-up: this is v6.19-rc8 material, as it got uncovered with
GPIO changes in rc6.

Thanks,
Bartosz

