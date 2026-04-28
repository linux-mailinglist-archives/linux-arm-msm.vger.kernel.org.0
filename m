Return-Path: <linux-arm-msm+bounces-104948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CwkNKiK8GloUgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:23:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4FB482859
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:23:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAFDE31F8143
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 09:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D144D3DA5C8;
	Tue, 28 Apr 2026 09:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fAvJ+9vB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB5C3D904F
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777369722; cv=none; b=Kpm1NLEAO5u1RQe4twuVYLkozCHQpueodaBnQbfbEVG9R9quKlQtH5n1hMR4R/Z1TEiC3LyzRYpJ1v7eAJ0SGEDpvt8CLgt1zxfmYOh4LAwBryCc+KklYW7LMUMi4VZPBdU1dOoZCvnOoYRKe30IY3nZjfCisjrMPcrdDWQmvk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777369722; c=relaxed/simple;
	bh=c0/YaPJmLEANHBlX4oah5v9Xx+iQTIZ8FJT+UHuF+B8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N4L2mqLUNcjBjtNBvmn7YZseRrWl99SbZ6msCPLNmE50FnLh2sML4JHPMVTJ8Eq5DPjO+VZK5B8ZF3rMtrHrfLvG74r77DTdIZA9qTsq2pPSkYRH2Fz0VPXnmdT9QeFZn35Ar2m3e656IABsRm01DgXlHPPV2ns7wUlZ1N0qoDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fAvJ+9vB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 739ADC2BCAF
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777369722;
	bh=c0/YaPJmLEANHBlX4oah5v9Xx+iQTIZ8FJT+UHuF+B8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fAvJ+9vBI/DfhEnxTkFITMxxKGbjoDLAmJOEl5RbNoaZkiO0c0gRJ8KzdBcfthkDO
	 XvEZUQABSyw6wkPVWnay4tP1+whp/togbrX9PPyzoPgvgrn/lPYpO6jOu9uk5NHHKa
	 1xJvzzy9G4nL4Npp243pA55opjfCH1M6EyNTZPQnRafjr47xsZGd/VWV+K7h7RrwE7
	 NaG6TG4EiDP8I3EQri2bCdGfNSxsGdN2x0gl593FgWKOBdM3o5BD50qIdj8NdGnktL
	 4r/quR7UzcQt61YPAzv84mkttzy0Kvr48Ojupdr9vPEZUY5Avgr0Di8Kiw2Res8p9Y
	 yEY2WjJzCjv5g==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38dd9f11a09so99833471fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 02:48:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/l7F3c2ErfrfvjwNZp6bhcbmD2JUr0TskCnpXRZ3v0A/13FygHNUTF4jxj5jzA8JSmZVYeuxQjFN7LlT4N@vger.kernel.org
X-Gm-Message-State: AOJu0YyJQlFzE+ulrI6Y9rFNvpPfE8jUtr8hJTyV/rsknuaLqFYyIGdO
	qUQUQq3IGZsu8Zi2YSnW4kD8EDB/wB9he+0vi1kbcNdNJlFyvSbL9hXYQmFcDaKEMvL813aoLFD
	OOLhDAtpbd1PeQ2Mrd9QtCoHSHW86yMk=
X-Received: by 2002:a05:6512:234b:b0:5a4:194f:5fff with SMTP id
 2adb3069b0e04-5a74641609cmr990522e87.16.1777369721200; Tue, 28 Apr 2026
 02:48:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422083345.84443-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260422083345.84443-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 11:48:29 +0200
X-Gmail-Original-Message-ID: <CAD++jLnr-M0fAjXRjNdvDveGEQe=iCK4a9wjzcbQZ+ucOtfrOg@mail.gmail.com>
X-Gm-Features: AVHnY4J6lD9AUuGbhsok0dy_cMkoyrCYVoufVvHNaRD1_rjPUJ9Etr7muisBxtU
Message-ID: <CAD++jLnr-M0fAjXRjNdvDveGEQe=iCK4a9wjzcbQZ+ucOtfrOg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Unify user-visible "Qualcomm" name
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konradybcio@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 3D4FB482859
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104948-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Wed, Apr 22, 2026 at 10:33=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Various names for Qualcomm as a company are used in user-visible config
> options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
> "Qualcomm" so it will be easier for users to identify the options when
> for example running menuconfig.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Patch applied, had to use some fuzz, then I also fixed up the
just applied IPQ9650 so it is all tidy and clean. Check the result
in -next please!

Yours,
Linus Walleij

