Return-Path: <linux-arm-msm+bounces-72131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89449B44675
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 21:34:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4203C189473C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 19:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62898258EF4;
	Thu,  4 Sep 2025 19:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lpQzrJpv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D2F24468D
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 19:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757014457; cv=none; b=q+p74mi4SF/IZ09ciEQScrM9SeG4U8zu+MmGwfkGkldRNmie36NCleXh6bOSsAIJj2yCENv9CpNBL6/wn5lfJMmXwXofMN22QSPgq6aZ7O07cPSwU56fBAHfTh2lxd9KWn3sPkDblW/suwoyPmC9sMuXCDokBhsOIniFrNVjQ48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757014457; c=relaxed/simple;
	bh=clPjNzrRlrR9W8iK7IsCzqluvKE3yxrC0Jr2QIzTItE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OXLSiqQ5w4KnmSxl8vcLBo5ULFRHxWq6E1bB3xzQWgThZTTaa6Bar2MEGaXX5JfIZTCEIr9OVrL/WPe56s0MqIAqO6vlrfR5CT20H6PGk55C2KJACIOK1EKy8wcegojhIKN+L2qhi/+dksC2Fgjpw6lcKgS1QVEYucYGkEVGWfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lpQzrJpv; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3380787b30eso12947571fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 12:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757014454; x=1757619254; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clPjNzrRlrR9W8iK7IsCzqluvKE3yxrC0Jr2QIzTItE=;
        b=lpQzrJpv5R031VqsaxozYtelK2+fHPlPiWcr/M/NY9bFP9+cIsIQHAEgK/97S8yS/F
         8pHAUUSAzNNelLpjKTYwELxGCiJ29kN3acRlAePIGwKh2yVC3t7LSQ2Qf4cxG70J7yzP
         lFGnuS0ji6C6mTd1QqrKoevzxgsdfhC98Q9DG9gt1uOFZ7ugk9EpxjvB89kOq7DJx2sz
         CQk71nq/uoajVuakD0UUM9ccBBNxNNO8OLJUE3Dqr64aOZIpuQ5H+ZLh6or1rMZCYugY
         5dgvNcLbOgdqsaB1BMT2Zxk744RJLWN6aepQGffHXT3S8isKQtJv7xIXOpbZtMsTzI2V
         fRRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757014454; x=1757619254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clPjNzrRlrR9W8iK7IsCzqluvKE3yxrC0Jr2QIzTItE=;
        b=Vl+Ao3gfc8rOHfez8pAh87q+Fsh4LQuvrnowfwGM98+wbZJ4BgNx6IAAdYr6tCJaLL
         A124UfZPVzF+IzPj6m1KgGovnQN+KS2gdYs/p/C8UITZdzG2BmrgLVWgiRNbUrkpV/W/
         6Ju/2qxb1+OoywgiPu6donPvIndxZxvO7SKHr8VzT/RUAX6S3g4oH0BY4rVmAkHlml6W
         8aDgMFqEXe7ACkC+hzDHtDvYnfVeqYP4IFWemHReagn+qqXXEM8l8EtLy0pmniLuhFe+
         9V43Ovrz93ZBXcKSxmFJPYfvxyvZMRJ1BB+pbmQ1GJtq8MzZg1d/AK3otomnIs7sGvC9
         FSQg==
X-Forwarded-Encrypted: i=1; AJvYcCWjFl06qxh5BNDIASROZtEtlR53Ccm3/4656Yxxqe7fyK7IC6IUbEOsXb1+xdUQk1Lh5EGtubaC+/SoAMUd@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6gko3zZsIeryj+bLNPUDT3kA7k5EyK9TJTChV01oQ2c3LqNbL
	ZoVnbZ4H0wEaM2MODxiLPN6h6kteXhABNtz7kLh+sQSZKNAR9WrcKOZ5Njks+7tkLeXr5PbVPaH
	a/NGzlk6Mdc12i4PjFdlJs4dDJMsk2iqnLNAId+PkoqSeXsHpj9yi
X-Gm-Gg: ASbGncsKnoIGeh8C9TZT8BzGjByGuxfY0Dpb1VSUpZuad25Wj0qYivOnOR+wsdnuXBN
	nu+H9rtN8n4a22UJmZXt3uNmOPxTq4VWP85psLF4Nle3v0PU46U78cS8+zoAfUR64VQQiHJRkzu
	ObXmL0eBuFMwV8ZfmHtj8zx2ajIHG/ZKGbTUVJAm6a+mGdv76MZAJLlMiT5h8HFhHpAXPTlk6w6
	F+CYe+4oxIrVkgTQQ==
X-Google-Smtp-Source: AGHT+IEM7jhXKP31Q5ndk+KiHK48PfI3HF/sr3X8hFMQjwNo5zeLcG5ihiQY4yJX8VctkDHZ0/XvKBh/j6C82Ua3sDc=
X-Received: by 2002:a05:651c:19a3:b0:336:72e1:7f45 with SMTP id
 38308e7fff4ca-336caae1d45mr49522041fa.24.1757014453579; Thu, 04 Sep 2025
 12:34:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250813065533.3959018-1-pankaj.patil@oss.qualcomm.com>
 <20250813065533.3959018-3-pankaj.patil@oss.qualcomm.com> <vxd4gr6hcbv3wmgbo3phhwserinub6y5o2dhkoaheofbwphaz7@3mkfwswaukeh>
 <9be4695b-54eb-461a-9e59-81670089ff38@oss.qualcomm.com>
In-Reply-To: <9be4695b-54eb-461a-9e59-81670089ff38@oss.qualcomm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Sep 2025 21:34:02 +0200
X-Gm-Features: Ac12FXxoMfMgKe3bppQxjm3t8wtzMbd4lxjj0GXJNQiFFIQLEQle8aSsfY7NR58
Message-ID: <CACRpkdawjL1CKy776Ya_tZJaurmxRVqx98DGSUZjUWZe=Gdrcw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] pinctrl: qcom: Add glymur pinctrl driver
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	rajendra.nayak@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 11:53=E2=80=AFAM Pankaj Patil
<pankaj.patil@oss.qualcomm.com> wrote:

> This patch was not pulled in linux-next,
> commit- 9a1d01fbf43f56a02026eee44181f70108a0dec8

No you said you would do changes to 1/2 so I have not applied it,
waiting for v6.

> Does this need a rebase?

Maybe, then use my "devel" branch.

Pick up any ACKs and Review tags please!

Yours,
Linus Walleij

