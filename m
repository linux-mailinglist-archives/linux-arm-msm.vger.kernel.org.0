Return-Path: <linux-arm-msm+bounces-83249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E43F3C85114
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 14:01:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2FA614E9C28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 13:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B403233FA;
	Tue, 25 Nov 2025 13:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vgMIjQjm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BDF26FA60
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 13:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764075657; cv=none; b=HMGpYuQObekkNQZcnwWQkuYUlWHhnsnIo8FbbNnIYs/wXGLN85eI3TohzjQLzYSbK2n3wvkp4+Z4kY578QESq4GzYD2vvNIar0AizaiWbX877RbGQUJXMBLlgFJ+MtM9NjFyUiBBpeTOjRh8YGiDSDKtp9of6cJMdLXaAd7l7ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764075657; c=relaxed/simple;
	bh=MxSu7/+tDC/ewCZT6aP4aMNTRlY8x1JNcimqpkHUEjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Za8gtzeEUu+2eXpsA+RUd8tqxgkc9h4pAbfQ/6wTqqb15rUyjqvipn3S7/1aUPYQMDswNt9lJzOZI7vXLZPUI7EF46Sm2hjopEEmnVKXx+U0xTivK8+ODsZ3KyGodTmmI9YK0w17liad3y9f3TVSHm+8n3R5B3uwhItBZHOqzvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vgMIjQjm; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-78a8bed470bso35546047b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 05:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764075655; x=1764680455; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MxSu7/+tDC/ewCZT6aP4aMNTRlY8x1JNcimqpkHUEjg=;
        b=vgMIjQjm5z+nPYXkl/To7CriDZnBIh4vsFw9J2rCzqDD//szGKLY0sqT3BTVZn/Sxv
         nQPXpUYgbMfE1wKg90H9NDOS+lr1QkXm2mfVUX/rpGrXGbleVcUtdMnxcsg8X5kYhx1q
         Z8HOLkLD+HaQoaEstOAMXojx4rJ2aVpcpWjvS/Pq1qzOZAkVufXoLK2nhBrV1c6K7P+x
         dDcsfoyfnXoF9pK3vtB0KL+PndVlnCeRs+VK8l7MdUc92C6R/DXevnkfIoI93TEDHZUY
         OAprMk/qew9SxghCUFMlk4audn1C9jFxr/gAtmcTqGiR01MsSRiPfyeaPXWIyLMJeXxu
         t2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764075655; x=1764680455;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MxSu7/+tDC/ewCZT6aP4aMNTRlY8x1JNcimqpkHUEjg=;
        b=en+tebK6t18sOGfOIjidFfg+YCrgR1cQPGsDXg4hoOMnkREMMAkfol9Gv9vVAXvEKt
         3cbGO/M7an6PWsXFgCFqTJBejzmVFILdLaIS7LVmBRYjdmmn9YPqC5WwMrjTILbSttwE
         7KxCCWy2vtkxyPcfZRlGZzA2gOm9ZA74P0l6ffqb4g6Z3g3QUlU5ZSJVm6wQNnqgW0Ru
         WInRvdbaxb385cQAAW3dBjMx2XPuspdlAMHtPvz2AJxPuPD/J7eAEgdF+mrpsdybkOqR
         /bN1QniorofKdlpcTQEhMayMYrPDDfNfcI3ykrxtTUWVcokWUOlv3D5dndW2SkPzLr+q
         jFTw==
X-Forwarded-Encrypted: i=1; AJvYcCXdpqXz+XEIWEFEXLFthbVLCi/8Kfo7W3LhwwYMgWsydfXuoVqKB7b+e9iVSeaCaw1wQmiYUI776Aa6+BIs@vger.kernel.org
X-Gm-Message-State: AOJu0YwMUMyehX2Fttz05bSIBidiPOZ4GJUGkZLE3/JgFkydETyvFu2h
	XQkUzVAuqQYid8rLV1Atzrv8PLdJX3s5akc4/KjShPC9WkY3hhksQ47+rTbsTJWGKxKz7WOPxnI
	Gf44b1klF0eJe6ovOCBnJduxX8CpGdrLnhnTtR7U+/4Suw0N2xj2y
X-Gm-Gg: ASbGnctvRAXryDJp4sFvvhVuiNgY2wPa2m/yxupGGfXH7iAO8FgktrLRSCc6mRtk8m4
	gdgFbAl3omoEe/1fzYVPHx1lJtzyibXrqJlH4xvKWIq2RlosyaWS1Ym8pkdd6xl686/c/JbplU1
	4mDl4Wcd+PS04QXajqqLNwNCvR9PQ39r3f7ID/HU6x6M938AoiPbRXMCi+JagSvRkTyZ9Pm89M7
	euwtKbuY4fLFe1DZZN+BW0/5MTPTYcrOrmkNVa0XcXkMXRB4HCE6MJmhSNFiblqzxqm9uqW
X-Google-Smtp-Source: AGHT+IHlKYmpPx4ytkCZJ43o1/YRez9M93lptuGk9x+25iF18/2lXfKBMy3NSSymEMTxd9GqKo6iCsg1bhEgFKaP8Zw=
X-Received: by 2002:a05:690c:9688:b0:789:3166:25a7 with SMTP id
 00721157ae682-78ab6f3d484mr38401397b3.46.1764075655052; Tue, 25 Nov 2025
 05:00:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114082824.3825501-1-sarthak.garg@oss.qualcomm.com> <CAPDyKFqssyDuyRFxRUurudWLYGiZ1AXTWV6isyYc8Wz0NLriWw@mail.gmail.com>
In-Reply-To: <CAPDyKFqssyDuyRFxRUurudWLYGiZ1AXTWV6isyYc8Wz0NLriWw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 25 Nov 2025 14:00:19 +0100
X-Gm-Features: AWmQ_blVMx1RCPDTQFql3H0BDcLS24cFJOHcU1KrNtPwwkrojK6XQDO2akwmf2k
Message-ID: <CAPDyKFpyCHvnGQUrdMxSmksd2hQtxrfwcWKiQTz4Eu9=tyXvGQ@mail.gmail.com>
Subject: Re: [PATCH V2] mmc: sdhci-msm: Avoid early clock doubling during
 HS400 transition
To: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, linux-arm-msm@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com, 
	quic_pragalla@quicinc.com, quic_sayalil@quicinc.com, 
	quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Nov 2025 at 11:55, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Fri, 14 Nov 2025 at 09:28, Sarthak Garg
> <sarthak.garg@oss.qualcomm.com> wrote:
> >
> > According to the hardware programming guide, the clock frequency must
> > remain below 52MHz during the transition to HS400 mode.
> >
> > However,in the current implementation, the timing is set to HS400 (a
> > DDR mode) before adjusting the clock. This causes the clock to double
> > prematurely to 104MHz during the transition phase, violating the
> > specification and potentially resulting in CRC errors or CMD timeouts.
> >
> > This change ensures that clock doubling is avoided during intermediate
> > transitions and is applied only when the card requires a 200MHz clock
> > for HS400 operation.
> >
> > Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
>
> It sounds to me that we should add a fixes/stable tag for this, right?

I applied this for next and added a stable tag, please let me know if
you prefer something different.

[...]

Kind regards
Uffe

