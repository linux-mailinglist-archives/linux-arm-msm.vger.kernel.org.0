Return-Path: <linux-arm-msm+bounces-109471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIkxNn9rEWpLlwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 10:55:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEB65BE075
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 10:55:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6F43B30041F1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 08:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71DEC3806B3;
	Sat, 23 May 2026 08:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XKZW7Ghb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEB337FF64
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2026 08:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779526524; cv=none; b=tIoNnN/yKuhjGfg6rOOa/GBIk1Kc/Up4Y77Eg3rEdVa4h4cLHHysJSo3UhDEfRfDmYHJUA0d3jUuQeFl/cwTQ19Zjs5ko8XQiQuBHi5ud0bzKKahuCViubBZiIZP1NtFdUrN8LkKL+0DvWj4Q/QFTQtwxBi/KbkjNIWQZfldGKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779526524; c=relaxed/simple;
	bh=MK+cWt2+dxm/Zy157E3RgM1a8/njEplSHB77uhH6MPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bXCh6o1tLzMGkSmunK0EKyUp7V8rY9we7HvWnAJmKZhn3hYebtZ3CL3GztFfb7VJbugn5SWqoRYNT7ss9FCLNI0PQ2auPeoWHwt2p0Wh9aktxJb3HHVtBB11ajebxYvHujSfXvczBrJAP2DFwSHt0zVdueGwS1ynOYCc8rmirxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XKZW7Ghb; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCBE01F00ADB
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2026 08:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779526521;
	bh=MK+cWt2+dxm/Zy157E3RgM1a8/njEplSHB77uhH6MPg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XKZW7GhbmHdscqotobsonq8zMhztCKaxdIYQixUj63ipAK18X9CBnf3PR3AnE8g6L
	 QiSmzgLcTKp0RwbTQn7dx+AMMe1MsWF9cIggk35KaHXFKjRhw7Sebzv+x2C7eZU9K7
	 3ZwKq59QDm2i7GfrddIQAqt0nTlOqMXXRQJ1hCrqzu9/hla5ZegZpHJ1g75OOAWo66
	 UaK3iyheTBCZ6CvOKB5VWkI/NfvZ4oEp2epRLhX0n4u0PQRcD+oxUhEci2mF/SXqfr
	 KooxVmVEqOaShEkru5Q3yNLF6Emsdmda+99kiUb5IjJ9Tv1qk9N/MLwew0TYA+exAG
	 gv3u9iQEcATHA==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38e84ed22bdso92283941fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2026 01:55:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Tz1N5L1u4M1D9cr2qIzTFL0Uqno+5dgxJzEoJEeZdeojkwLkSA2faM+rDEb6zHezPV0MhZQttmYI9WDw7@vger.kernel.org
X-Gm-Message-State: AOJu0YxNfoSAJqaqtabL8COMpZE/X9pZW9+5gNYLQd4isRWa+XGjJMOd
	GNYnSQy/kOE1vB98THFgUnHJcPLaCmOekqb+d9JCXBmBxxUkjHydJIB/+fSvJmwZ0H1qUu/nJgs
	bJvIedzaxNg8OUI4kBDtMx/Guc7bWjxE=
X-Received: by 2002:a05:6512:1084:b0:5a8:e5b2:c82e with SMTP id
 2adb3069b0e04-5aa32370d2emr2243452e87.14.1779526520510; Sat, 23 May 2026
 01:55:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512-shikra-pinctrl-v4-0-b93c3a2e4c08@oss.qualcomm.com>
In-Reply-To: <20260512-shikra-pinctrl-v4-0-b93c3a2e4c08@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 23 May 2026 10:55:08 +0200
X-Gmail-Original-Message-ID: <CAD++jLm8y=HV+d8WTY4E3r1wWGnivM_YXsSFOTa0ywa6SM-bSw@mail.gmail.com>
X-Gm-Features: AVHnY4Ij7YWCSmyxTYMcB16SJJUHHmB_vmAyuKO-SN62ANzVsZ44t3wBMUqIvwA
Message-ID: <CAD++jLm8y=HV+d8WTY4E3r1wWGnivM_YXsSFOTa0ywa6SM-bSw@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] pinctrl: qcom: Add support for Qualcomm Shikra SoC
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109471-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 4FEB65BE075
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 12, 2026 at 3:25=E2=80=AFPM Komal Bajaj
<komal.bajaj@oss.qualcomm.com> wrote:

> Add the pinctrl driver, document the bindings and enable the
> driver in defconfig as default.
>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Patches applied!

I had to fuzz around a bit because 2/2 didn't apply cleanly
so check the result.

Yours,
Linus Walleij

