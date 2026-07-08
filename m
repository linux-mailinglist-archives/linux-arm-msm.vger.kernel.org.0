Return-Path: <linux-arm-msm+bounces-117795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xJVTEdicTmqyQgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 20:54:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A96A0729BBB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 20:54:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=btMb+J9z;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117795-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117795-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93D483037BD8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 18:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC2D3C3453;
	Wed,  8 Jul 2026 18:54:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE6732E12E
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 18:54:09 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783536851; cv=pass; b=ucdnbPmobp/thWVDEl/RJamcQb29RwjMidAXDk42JFKOIZR5H6FIaOl0icsoR5Esh2nIZ7v8Gzj0HrVbrQcREMUGfmB9r6L5MelgeYUsTyNmCdcFmjAWHYYZZcdKw7shWoKbkeZnXEb3UKmu7r1HBJ+FtJqWQlosAJyZfAPXLeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783536851; c=relaxed/simple;
	bh=+axfWxplgPh94YUqyh21eKun8ZLvTScz6dES35XGF/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hIWFc27BfBJMHtTy83py9SUINlcHe19QJEWQDJq7BGSMOnvUE4f+EEZuGwLch8UmFJQpTWKMBmz7Vy8AVlvRVBdbasi2KIOa8YLzxYcU2N1EB67hZQy+aASzjjfL6xlo4DwmWTBhfRFvV5wP8UNdGlx7MjqjcxihLp3FqaxrIXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=btMb+J9z; arc=pass smtp.client-ip=209.85.208.49
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-698a9f11776so1733273a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 11:54:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783536848; cv=none;
        d=google.com; s=arc-20260327;
        b=mqnv+8wQ7CVLtPNhH9r35wmH+TMXHNKNjKnwdYIAt2g5ZXSs4dN7bSdvuUSODNRf2B
         1VfbW05I/kyUiJuJC4Ykw7bJpI7XLJsnCSUUr0d+rI0dSIk2vGypri+9vHRSxL9+Les/
         6cWQ7Q9SuwqYOxqmBn8/Cdh2O9WduLB795GbB57dW+IuI9lnAf6s/jmN1NBht5K8doSm
         kH7Q1gwID9KZmGG8XAp40UwqmJ8d8hK8vAI3g+lGn+IqYUaArsGTxemoo2AyFzaibnzW
         gqcC4uW1YSiBvxaiiegPAgoLieMRrnt6Hjz6C7bhx9aha4/EPiyRQeq96mrVDD4SYgej
         IOdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FDJtP5ijTVky7wb5PRY5jGSAhA7YTwFtCy1ny5J9ZxQ=;
        fh=+NLg7xF92d41vcIGB/2ApE1vxKz0ad/GHkzrQoTERbo=;
        b=nq/SlUJCJr4gZ94sTRkfzKdKVudbs4oeg6JZxtn8unfLisvigRKCj+56EiiyPihDSA
         bUFWoJH9pkwSaFkOuslIgh09cYbr0UNGCZK8DPpYHpFGaZlBmwMgp2Zn/atR6+/slTN4
         wU39TMC4sCROEM/Zbs9uc1pDgM8e4YwRlBudQbUBAULBTQklIngkKO0gGxK2jkrcrQHJ
         SzGgKEqXPAoC34aINlq067ZFZQf0osAILRlkItFuTCZxtNhwILQNr7owLgjY5R/qKYGR
         N66FnhkNmawd8juRhFfashhzF7qk0TAw6mRyi6sQxJkNINeYv+9a2/LMRGyrjurOFqSQ
         /BwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783536848; x=1784141648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FDJtP5ijTVky7wb5PRY5jGSAhA7YTwFtCy1ny5J9ZxQ=;
        b=btMb+J9zDT58lf+UDOKiioNUWa3h5IBCrA4LsYITa9mNOfBDZpkflmydFEV/NAYf7c
         mOq2ZBoydwX1Qd6jXkZlvmA78fZQ7A5XeUmaoZP/2W3qok/nQCZRo4WVcdetQWC/355T
         NEbxKrpM076PAKK3cIi4rS2f4RyoQ7el2+3e9g7vSYgzLUlQZP4wjICYZLcj11DwnbvL
         TdQMVABrJ/0N7RnueWdK4hUWtBHIHbY4+xpIxywEhrOV3+nza+LUuHdTrPkRosSXQQvY
         b+vM08UsvPvXzyCufMsyOEdCcADtKoN5YyrGUigurLROf71NX2p07NWKGSEbvFwduVND
         Cj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783536848; x=1784141648;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FDJtP5ijTVky7wb5PRY5jGSAhA7YTwFtCy1ny5J9ZxQ=;
        b=A8pW2/BntT7eBWJ2CjIjteZk4GdssBDlR1OL+/LBdxmgBHoNFUaMw55AJlolrZxXPX
         wnFOcA7kCJOsIO01G3FI3Z9ZZmXvmbA9Kr59pkBrmOWwvLvZAA93VPf6kg6clUQFZV2G
         Zfg5OatHk9lvKDj9FzKk9ym6sinZkpExIEG9YgQDMCWl0NWd8ij5hCsptZe5CHof/uri
         CBUQnZkd760wZWpEqJAvwFvitl2uVqsRZ+v8AjEhcRN42gG2pyGr6idCzOaJZL+h5Oct
         32bWHdj8IZzVRd3lDmQVDHKc23VRIRfyKp6gqxp8Hc4I3JXkjjQlZj49B8f1aYIHW1KZ
         K3nQ==
X-Forwarded-Encrypted: i=1; AHgh+RoGo7+aZboGmeFfCk9chDiBkN7eFREk6EWmbUFlgYGaNfe1RD80ke6KC9s1ra/4Ggxu3d0hFbPHpH17pGkh@vger.kernel.org
X-Gm-Message-State: AOJu0YzThX5r1XFNXK1sr7ghBEFAbD6i4t/JrBC7R2SzA4j3cxuGJjaI
	B1fuXNHFc+gbusqojjsUWIirBG7WOBo18cE5wvW0FJXIOHzY72i2WovusXqEFSKl6uS2d/CSOFx
	S3R4fWcrnMVgo2od/gaE0TTH6zGRE4Q==
X-Gm-Gg: AfdE7cmHL5LWEbRXu5mXJ+S+0v3ty5vMBU3nRT2XnTqkiNKAT/sPYPClDUgcJTrju6p
	wWmfh4Sjy+/NxQiuuKBuWj9KZHFePJpdUz+jWh+FvNFTP66BfZEStY/L7JsRcQhcRF8hI+gvAs2
	38Ni63xLBpSQp+ZFYxKN0Wo22/o2KftuNqwCyBNwYCf5XGIhvcrdO9zPHDGTAM0i69AzZI4AMPc
	EhZHYPPckrKlQ4E9htyYgW6S9VX8mdl5y8Z+Tj8pG1aAlCIveHWn/P0U5JWokIfaZuGLkyy85wC
	d33rVMy+8SECYoejfz5HRMa1rRjX
X-Received: by 2002:a05:6402:40c2:b0:698:b23a:e54a with SMTP id
 4fb4d7f45d1cf-69ab44aacecmr1851537a12.31.1783536848147; Wed, 08 Jul 2026
 11:54:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604-surface-sp9-5g-for-next-v3-0-6aa6f6612c10@gmail.com> <178352261604.2235436.45961494988805206.b4-ty@kernel.org>
In-Reply-To: <178352261604.2235436.45961494988805206.b4-ty@kernel.org>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Wed, 8 Jul 2026 20:53:32 +0200
X-Gm-Features: AVVi8CfYaLh3xx3YKFwVilPiVVoYqK75HB7zDa3CGd96Hp2aBO-6NcYmoQ8G9SQ
Message-ID: <CA+kEDGFAPoz4mEQX9ga=T8cBVehGHwWpJmouf3fA=8nkUeZ=OA@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] Microsoft Surface Pro 9 5G update
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>, Bartosz Golaszewski <brgl@kernel.org>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.01 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_MIXED_CHARSET(0.67)[subject];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117795-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:johan@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:jens.glathe@oldschoolsolutions.biz,m:brgl@kernel.org,m:stephan.gerhold@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[jeromedebretagne@gmail.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeromedebretagne@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A96A0729BBB

Le mer. 8 juil. 2026 =C3=A0 16:57, Bjorn Andersson <andersson@kernel.org> a=
 =C3=A9crit :
>
>
> On Thu, 04 Jun 2026 18:18:36 +0200, J=C3=A9r=C3=B4me de Bretagne wrote:
> > This series updates the support for the Microsoft Surface 9 5G
> > (Arcata), bringing it more up-to-date and aligned with the other
> > sc8280xp models such as the Lenovo ThinkPad X13s.
> >
> > As highlights, it finally enables the built-in screen, it fixes
> > Display Port alt mode on the top left-side USB-C port, it enables
> > the volume up/down keys and the lid switch.
> >
> > [...]
>
> Applied, thanks!

Thanks Bjorn and all for the feedback and reviews!

J=C3=A9r=C3=B4me

> [01/10] arm64: dts: qcom: sc8280xp-arcata: Enable backlight
>         commit: e53655dac60665ffc736914f336493c5f45977a0
> [02/10] arm64: dts: qcom: sc8280xp-arcata: Enable the eDP display
>         commit: 587ea6a79584b5323e5eb3e2435c858177cca49c
> [03/10] arm64: dts: qcom: sc8280xp-arcata: add USB-C orientation GPIOs
>         commit: 784b0cdc237d98f1ae7c6adec0165676c98a2614
> [04/10] arm64: dts: qcom: sc8280xp-arcata: Fix top USB-C DP alt mode
>         commit: 16065c4ec1e7ca595f4fa363dc2251c6bdf1f6b3
> [05/10] arm64: dts: qcom: sc8280xp-arcata: Enable 4-lane DP support
>         commit: f4360ff09b75b31a7d9d8088f8c3cae361709cbb
> [06/10] arm64: dts: qcom: sc8280xp-arcata: Add volume up/down GPIO keys
>         commit: 0e5e1b74ccc902a7dc9e3eb5cbe299362bf1fa13
> [07/10] arm64: dts: qcom: sc8280xp-arcata: Add lid switch
>         commit: d7879682e7fc86a03cb26632c4316211be8b30d4
> [08/10] arm64: dts: qcom: sc8280xp-arcata: model the PMU of the on-board =
wcn6855
>         commit: e1cf7b2332ddd90d65f74ab48f5e237ac7304b3d
> [09/10] arm64: dts: qcom: sc8280xp-arcata: Switch to uefi rtc offset
>         commit: 1ba745a53172ae43a6b92ff288d449d888feb853
> [10/10] arm64: dts: qcom: sc8280xp-arcata: Drop duplicate DMIC supplies
>         commit: 3d7646cea76fc08126534b428b299c326b3c66ca
>
> Best regards,
> --
> Bjorn Andersson <andersson@kernel.org>

