Return-Path: <linux-arm-msm+bounces-86836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CFFCE6B44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 13:34:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B40E3008F8C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 12:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 983553101A9;
	Mon, 29 Dec 2025 12:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AQ5Hvjtl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705E630FF32
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767011637; cv=none; b=DiTTsn4vcu2wbxmghIQoXzuoYRg/us6OAVUKNOkIgsWIZ8h6EvxMNCd++FHiET43nRLxZUfkE+wkTmbr6t/ZbitusRnd4X3kjWU0BTaOubgmQYdeekHarNEuamNZy7xLLjnfZjqT/DV/qx5D06ePZGHjJn0gzJ/49nDVeqaPupg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767011637; c=relaxed/simple;
	bh=xAUdXnwdw4MGc3Kxf0WtvX8dHtupKQMIxTUwesxjVCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zggzqa0JlN1LzcZHVBt+OhdqRdt4zkwV6E0rFNE6m8xrroaYTJ1/YNZxC3hrr0Zp+S/RrNhOS2efz718mfe3FiXjvWkccdZNlij7YGcJCUJJi8arOZtZxy/XbsOJtZ0lNAcvMb4kJyDE5TkK07/AWtRXcL5a94zxGsE0ZMcMgHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AQ5Hvjtl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C924C19422
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767011637;
	bh=xAUdXnwdw4MGc3Kxf0WtvX8dHtupKQMIxTUwesxjVCI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AQ5Hvjtl5ZI+vB91mXgf/7FaqmloUxzxxQOxMEUbZSj4iJsdeSbey4dSwIloBMgE0
	 HLDWfKKqOcAtuthiaZ56D1nSIAj1fmO+VGnDlPcGmTHnYKU3JVMncjS0TnqB/hDpur
	 p/K9RHQW2JBAiX2Tg7qYVFwJUGKBzCygW+NEnrgTgFfvxHjBePNDytBPlv34p3VKGh
	 sjXxPKKX/FB2ZF7PQUzNdWo/pWZVAdlLQ7BnI2EHVAJGPt/KAGUflSCdqlD2y48YEw
	 0YYwYHoJzdYLPAP6bOUY9cOnm6zUyL9bF78KOn6Ssb8E+npcSFkYTFDv0/bHstGliN
	 eiv5hU979WNnA==
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-640e065991dso7427492d50.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:33:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVsyxFQTrikrWcilwUXWnd9z5sB5neAgOmOjSr9lsTqmEJn2m3jzHufVVSfiNHOq1OsnGAaEiazVRMDQVh1@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcuon4Gnq2V9UCCiZh4inp/surVvV0HL6+U/6OOPYSpBrhk2Rb
	8JEx0Iea/+HeHdwOoJhh/wze/0iZyGMUufWAcQA7Cc3m3NcoOaRGugJ+xQcZchyuS5Ty6DfzCMM
	fqUA72wqqgHFW5re8Zoru3LWN4SnUSNI=
X-Google-Smtp-Source: AGHT+IGW7fvps7wB/XnC6tWrYAZ5eBSHy0nlOLcWaaFTpZYeFIeLso81oPc9n2jerPEWAR2y7Lp0JA50tvD/yxStcwE=
X-Received: by 2002:a53:c05a:0:10b0:63f:bab4:fdcd with SMTP id
 956f58d0204a3-6466a8ac439mr18565681d50.48.1767011636089; Mon, 29 Dec 2025
 04:33:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-3-82a87465d163@somainline.org>
 <CAD++jL=c0AVm+BD_G_AJjiXYVyWdM_HscqyoNQ-tBByJ1Dp1jQ@mail.gmail.com> <aVJh2xdCreGpi_f9@SoMainline.org>
In-Reply-To: <aVJh2xdCreGpi_f9@SoMainline.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 29 Dec 2025 13:33:44 +0100
X-Gmail-Original-Message-ID: <CAD++jLkb5=i=XZdB=hc49hX1t6eP9=5tfv6Hg-5m5F0ghC=5_g@mail.gmail.com>
X-Gm-Features: AQt7F2oymfwij8Obp1J0ATiKmWENsUelo_uvAIVTj5-tWNR2T3NJY1yDSiPZ5vE
Message-ID: <CAD++jLkb5=i=XZdB=hc49hX1t6eP9=5tfv6Hg-5m5F0ghC=5_g@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] drm/panel: Add LGD LH599QH3-EDB1 panel driver
 for Sony Xperia XZ3
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
	David Airlie <airlied@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	Casey Connolly <casey.connolly@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>, 
	~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
	Martin Botka <martin.botka@somainline.org>, Jami Kettunen <jami.kettunen@somainline.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 29, 2025 at 12:21=E2=80=AFPM Marijn Suijten
<marijn.suijten@somainline.org> wrote:

> > Can you break it out to a subroutine?
> > lgd_lh599qh3_edb1_unlock()?
>
> Sure, though unsure where the "lock" sequence resides (and why it needs t=
o be
> unlocked twice, unless this was autogenerated and is unnecessary, or impl=
ies a
> "flush" of sorts) or why it looks so familiar to the Samsung panels.
>
> Will rename it to lgd_lh599qh3_edb1_unlock_multi() and pass it a
> mipi_dsi_multi_context so that no extra return-code handling needs to be
> implemented.

I think extracting the unlock macros from the s6e* drivers and put into
a separate .h file is the best for starting to unify these drivers a bit,
but no big deal, I can do it later.

> > +/- this nitpick:
> > Reviewed-by: Linus Walleij <linusw@kernel.org>
>
> Just making sure, you reviewed the SOFEF01 driver with your Linaro addres=
s,
> which one do you prefer or should I keep this distinction?

The Linaro address stops working at the end of this year,
I'm sorry if my fingers sometimes type the wrong address...
linusw@kernel.org is what I should be using henceforth.

Yours,
Linus Walleij

