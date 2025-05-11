Return-Path: <linux-arm-msm+bounces-57543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33716AB280F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 May 2025 13:55:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9630189475E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 May 2025 11:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6617A2566E6;
	Sun, 11 May 2025 11:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oK4kNv9v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6AD2566DD;
	Sun, 11 May 2025 11:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746964505; cv=none; b=FRYFr9dOoHUW+0XycfKJgGEdo6t95pUypxP30JP8B0+gMq7YODrMz7MstCC88lMUuglc6O0BGPusUO0JokkbI4X8Qs5X1S8aLYZVX8c8/GTp3Sii72O/rqdLBszodDdLtivj0Gp/YMiPoRTipAEuZxase5D8Bp9cPUc735rGwhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746964505; c=relaxed/simple;
	bh=R/jynlHicTIibxqN1YzoaealAVK3cpzH5mdY0ko59co=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GqmyrNfikfZG2kE3fZqaxkoVKeIAOY052PAsO3/SX8UcjTOUm1Ke5v7r59eripw1+9PsQDBS/xCaBQsgaNvMUGCCBCO5HOIOb+4GRJoId9FotsexP5bnFY/yYbytjmWH2k7vXkSWbJ+aCDzNcCQGjJu6u66kufaiyUin5eLILUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oK4kNv9v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B81DDC4CEF0;
	Sun, 11 May 2025 11:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746964504;
	bh=R/jynlHicTIibxqN1YzoaealAVK3cpzH5mdY0ko59co=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oK4kNv9vp6AZhws/Y1mSS2tzRpkcGUQaS2c2pTK33GrIeS98vDhvD39kOIfkDRRG8
	 3EuDmACuLOOnivs8d/FE0JQYw6lTWUYE1yxKX/KFC7n7YO59ikBzNf3X9m0+eXxgt/
	 t2Jk/ao8HrjolwT7xg4qKy++89n6kAJ8QeDoYP05otScxHg6HW0SzhBBSSzmPhDV1S
	 WjER6CCk0eCrj1ykBjYNfSKxrW99vfSUgLE/DUdfLeNwo7DsjZ9SgHZ3/uk2IZxd2o
	 3KdE6Ou+KXwqK09keN37GggiX6lV6SwfbbaQTgysnxQvwRplpVMsAeDyyjotuXFprP
	 JVovgsNGAvBWQ==
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7304efb4b3bso2229467a34.0;
        Sun, 11 May 2025 04:55:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUrwQxwz2Biry2j0Mox+GCBaX4WnHx8sq6LNwZidV8SW/JVj+OsDnGkKgYwJxyUpHB/ghdFRQeGIIQNFG3I@vger.kernel.org, AJvYcCXbLiKe7gEa3ProLPvQAMmr56UvLWLuAbpyo/Y7QPRpj9JifAqit0RRq71bm0eWeqn1SAbDoADeESulrVj6@vger.kernel.org
X-Gm-Message-State: AOJu0YzojfWbf2PLsToWe5iCht6H+Qm6T2fCJgBqFMw+mETnOZ8WS00q
	M1/R10ntNlFE+jKCPnKb9LVr3pKyp7NNL9QBmLg6hCF6bDA0YOxxUEB2+Mpl/yOnmWNSf4+cJVR
	hXjizumSZFaAeE99F0T8SGnuYMW0=
X-Google-Smtp-Source: AGHT+IHl217LLTZ7zxoObvKaMKBFA4kOJ3PlQoeZlwEExMOaLOgURFJGHml39H7/mAhcn5JuIlM9mHelK7qmLWutfag=
X-Received: by 2002:a05:6808:1591:b0:403:56f4:8780 with SMTP id
 5614622812f47-4037fdef2f6mr6374004b6e.9.1746964504197; Sun, 11 May 2025
 04:55:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501-device-wakeup-leak-extcon-v2-0-7af77802cbea@linaro.org>
In-Reply-To: <20250501-device-wakeup-leak-extcon-v2-0-7af77802cbea@linaro.org>
From: Chanwoo Choi <chanwoo@kernel.org>
Date: Sun, 11 May 2025 20:54:27 +0900
X-Gmail-Original-Message-ID: <CAGTfZH1jhDAU8DmcHiv39O5jzoA0NANdVU_T1uCvVLP3=eipkA@mail.gmail.com>
X-Gm-Features: AX0GCFtHpWRsoYEQ2UpVQNB5r47Zis0KFA4EqRNbsLROGiwhQzWAfoOa-yco2Eo
Message-ID: <CAGTfZH1jhDAU8DmcHiv39O5jzoA0NANdVU_T1uCvVLP3=eipkA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] extcon: Fix wakeup source leaks on device unbind
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied them.

Thanks.

On Thu, May 1, 2025 at 11:34=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Changes in v2:
> - Patch #1: 0->false, extend commit msg
> - Add Rb/Acks
> - Link to v1: https://lore.kernel.org/r/20250406-device-wakeup-leak-extco=
n-v1-0-8873eca57465@linaro.org
>
> Device can be unbound, so driver must also release memory for the wakeup
> source.  Use devm for driver already having devm interface and manually
> disable wakeup for drivers still having remove() callback to keep
> consistent ordering of cleanups.
>
> Best regards,
> Krzysztof
>
> ---
> Krzysztof Kozlowski (4):
>       extcon: adc-jack: Fix wakeup source leaks on device unbind
>       extcon: axp288: Fix wakeup source leaks on device unbind
>       extcon: fsa9480: Fix wakeup source leaks on device unbind
>       extcon: qcom-spmi-misc: Fix wakeup source leaks on device unbind
>
>  drivers/extcon/extcon-adc-jack.c       | 1 +
>  drivers/extcon/extcon-axp288.c         | 2 +-
>  drivers/extcon/extcon-fsa9480.c        | 2 +-
>  drivers/extcon/extcon-qcom-spmi-misc.c | 2 +-
>  4 files changed, 4 insertions(+), 3 deletions(-)
> ---
> base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
> change-id: 20250406-device-wakeup-leak-extcon-dc1d4429a2b4
>
> Best regards,
> --
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
>


--=20
Best Regards,
Chanwoo Choi
Samsung Electronics

