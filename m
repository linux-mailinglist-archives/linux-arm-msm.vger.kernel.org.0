Return-Path: <linux-arm-msm+bounces-27315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEEA93FF6D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 22:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8311284690
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 20:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A170318C347;
	Mon, 29 Jul 2024 20:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="DGdC2v29"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2294188CAD
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 20:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722284670; cv=none; b=EPnnF/sz0TnCjEYxjSZNGiLf663QEErjiDdZIcr5Er7XNdeG2BFGprJ0OeBVatdlu0K4adKNZAbPXhpPRqNAAN5y4naAj9WFzRN7/YiKLY0Ap8eDA7KhBEXPn1+iKsn3BOyynEwHrq29SDvfAjhpVLEZY7oIQV/ANGEYe/X0lvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722284670; c=relaxed/simple;
	bh=rdtey877Tkd/46YFhZ1VoOmDbFw/LnCm8ZrWiClZ/Uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SqlYSHsmAzNKwWel9J6t1n1HoDm+/mlODjn1EWYbB2Qme4b2wH27CTTRiEyKmWSC52cP8CXkqhwymhP9s0mHE6G4SOgy7NE+h5kZ3bbrpJOoZhN65W/iNp6/qFWDXN808bn5yT4yTqS2rBqnHl0DO3yafj385BxVQe88zQxOyhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=DGdC2v29; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52efc89dbedso4753711e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 13:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1722284666; x=1722889466; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rdtey877Tkd/46YFhZ1VoOmDbFw/LnCm8ZrWiClZ/Uc=;
        b=DGdC2v29b6EGcqbmapso5RoP77eQS15ZnebSGIKgyrrFflLsw6JvYCZShUDDMP54Xh
         AmlO8GKU2jIKdnzKLXGMLPRZIkx6pmjv+2njZKwy3dYjTbS6SDyUCPERzQx/B/6HcHsq
         iKZyNLhOtP/sdWkOOROmTR+/lbg4Hptc5qTMaSqhXr7qwXHltKkrp+AVp5koVGqBjsh8
         180dVM+lViHs1kJ3O6QLil2bLpj2v19qFYzD+X9vd8VGEUo0sdESr7jMKZV89gZynbQP
         KgBSqtgTgZLWkevmYm7O07yNNv2EaT55ZXoUHNOxsUE48Dk993IIS5h8i6/oOiaNrDNx
         rdew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722284666; x=1722889466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rdtey877Tkd/46YFhZ1VoOmDbFw/LnCm8ZrWiClZ/Uc=;
        b=EGe6BECRr/+Z93kWguMHi5yW1tnaccK5pPtOqKbPJCzGYOXMb4biubNfNHnijAv0av
         daVFnFZT2lGHXgnCSkgEo/yFAJfCdPeQgi9wUo2e1N4MT5Mv4DemmNR8bgQung9zMrk6
         TEBRCpVKMbcVeYwezJ0bYc64s3Y0YR/EhlYHapXEfrnH+pN3ZbTQ6mioKgGhZYRT5/zV
         u1W5ZWms3yWKNrW1ld22zBRBHcZkDPo2fGsy47Bpy0r+HMTYE76V0VSslrNoXAgLDJUa
         SbgbsPI7wzQOylkhoLlhrjqu6QivbA44XydLvQUSxxviDDrOqnwegSOCGYU3dFGbGxBr
         FmIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIMM0aHU0y64fBAaIg63YV5zqVV9m10aJjRVNNMGZtIyhUerk7LOfEuh4C20CnMgo+0wHZ17nhaPx321u6F2oLu87MOR/24dxu6fK3dA==
X-Gm-Message-State: AOJu0YzjAWhAMjsDaqScRAlu5d6Fu6n8k6FZN4Ci/g3YCQci6Bj0RkdL
	nyurkWanDfMMiWMxJHBzx7NCKH84EdhJ98ppWaFMtSQuIXHLFpeMNxuwlgFXIzhMd9gG2rP1q9X
	5tNigUJgM9aNt1RCk0y/PbDuGGIQjmNEq9/KZHg==
X-Google-Smtp-Source: AGHT+IEOZr+HLd9MQ7+mXaujoCZMSeDtg1O5d6zpUpb59H/Z0WdC+L2shVJzjomOtwk8xRjMMtxTnNpKgm8KKoVbBtI=
X-Received: by 2002:a05:6512:3ba9:b0:52c:859c:91dd with SMTP id
 2adb3069b0e04-5309b270551mr6262249e87.5.1722284665710; Mon, 29 Jul 2024
 13:24:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b3ae8239-4e75-4ff0-b722-dda0b940a5fb@freebox.fr>
In-Reply-To: <b3ae8239-4e75-4ff0-b722-dda0b940a5fb@freebox.fr>
From: Pierre-Hugues Husson <phhusson@freebox.fr>
Date: Mon, 29 Jul 2024 22:24:14 +0200
Message-ID: <CAPYYAFO+Y_Xd5zti3coc239y+wFP_NfZXMr+EWbj2OV9F6aK6w@mail.gmail.com>
Subject: Re: Firmware / Hypervisor / TZ kills Linux for touching at context
 bank registers
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Rob Clark <robdclark@gmail.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, 
	MSM <linux-arm-msm@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Arnaud Vrac <avrac@freebox.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 6:40=E2=80=AFPM Marc Gonzalez <mgonzalez@freebox.fr=
> wrote:
>
> In my specific case, we just need to avoid using CB 12,
> because it is reserved by the FW under Linux.

Additionally, the way the vendor kernel handles that is by removing
the reset-on-probe ,
and by checking the state of each context bank on-boot.
So it creates on Linux boot a list of used context banks to never use.
This doesn't sound ideal because modprobe-rmmod loops could leak
context banks, but I think it's a reasonable behavior, as long as it's
gated with a device-tree flag.

Alternatively the way AngeloGioacchino did it (by hard-coding the CB)
could be kept as-is, but with a small tweak to help developers:
When doing the resets, log which CBs were in setup/valid state, so the
next developer hitting this issue has some pointers as to what to look
for.

Regards,

