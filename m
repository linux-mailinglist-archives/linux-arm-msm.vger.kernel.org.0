Return-Path: <linux-arm-msm+bounces-45006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E23A10676
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 13:17:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BC853A807F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 12:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88446234D16;
	Tue, 14 Jan 2025 12:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qdHQrtqe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7E220F97E
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 12:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736857039; cv=none; b=AVKktd/YI2xYqDk9HHs0H2C1UQXjzNho6ghaFa2+xLWV80366TX3Q+zSizZejM0VjUjaTH7VYhR6Qh6OEdSyB0DxRBEdVU/JdhuCHYoIsjB4xH+FJVnnuKhvaq/YoK9RGjwLYxLnPJTfqgxOzslJZZsdvQomNTnMqqr+U/QpRgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736857039; c=relaxed/simple;
	bh=8Ie4b99Xwh0aEWRWBEX58b0bMixe8tSP3T+iPjUb6uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L28V1u/RsUmgsDvQL+aU9kb0UI8IOg8I0lT3K4OKEjdQvrs4nd6U3dKi3rQhYWfKzmWh8CZJHE1TloWv8CB/fr6M/RetkM0nvGKIrBiG+vWFHmuYyRgeRLGKWznmu4jyDnrm4wdbh4iYrd5pwC1IN2YcVWl2fbwhYosa7oSGoYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qdHQrtqe; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5401fb9fa03so4231354e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 04:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736857035; x=1737461835; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Ie4b99Xwh0aEWRWBEX58b0bMixe8tSP3T+iPjUb6uc=;
        b=qdHQrtqeqnAhe09KLETFGSkDMQv5jTwlECLYrdCpML+BDUAu4hv3V+dz2s/C/dTQm/
         qRrExopeKyFBXre2BxAocM+XqmLaXrOr07YAyA3ZfuqJAwaO66u8evVZHlTCb8xKNToO
         oX0yPj/t7D1IPRTc9zj2ymBwzwpDYx5f/C2OAGQRtVrmmgG5Oy/lkvFnQHDIMrSiEeOp
         G7rqcuTLmWDEI/aD2ABQdlC11DiJfjWMgZtZmhJny/LWeP+ODbTdNm5O7a9xc5KyyN+L
         c2Xo5Z6b07WciVrpxCXaR0eQwW5HymUGzIoLN1iG4E5NSaZ1uaoChd8j4w7xhx2MMmRY
         gcVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736857035; x=1737461835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Ie4b99Xwh0aEWRWBEX58b0bMixe8tSP3T+iPjUb6uc=;
        b=bVIjdCLIsmA4ci95itAOfIH0ucuIVEw1zU+PzPMgfgDRTJudZJHHGrZQGmWpcfmXke
         vrzxSdbAm4tju+qgz6Pr7feCkyRZIlZJWFpPSZe+XnXUYRCh11QMNogxbs6z7QgG2iAJ
         J0jVJ5CD1sxkgP/VAq2OvIvdmJFql3plRVQjTn1gdMmty4Ur4s2O3EmyYWiZIZCd+IrJ
         ObqHb7SroPXZQkFTrQYshjdh6xTDs4TwsKvs5uONWG7GmNla3dLVk5nnecHBa5q8/nNq
         U64gWvQdN3Y52EBPIfZGt0iIMDBlO3r/om67wXy1kL2lybzHRgTaHmyK6XTWyNlGB2+x
         KBwQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9fphvhCTkxf2FPF4yHcSmfB9nkPRapOs3uPg+y1Eet6zpkzRauE31nREl4EofJIrLQkUiXDKKrbI4C0XE@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6fecoNaYPUk7Aar0+jZCRzPHBUY7bHrSe4Qf/wouPjCdwnE7c
	L2F385N86AEd5RwhOWYnroE1fqjsCxXzNmdjtTeWcAwBYbmd7Fo2tq7ZCFHrcjsZE4f9C+eaxLZ
	nru8+jfiwcifdFw1eX7XAqL2C0tl+MzNmD532e4MhTJeZLW7G
X-Gm-Gg: ASbGnct0BL644dD/Jc/zrjoZO89axl+i/OLpfcAIM8hBkxcZQY+h+JcVttMOG0JrPDg
	e4rS4BOU/3dcrwUkx+EcvU0o3iQgHo1bhjjbB
X-Google-Smtp-Source: AGHT+IG/nVzJ4usllSB7WeL3esJ0/+hz1rQx2YNWDFn17mueoKalfz6Uj0tzGOzfhZRqk49pDpDqslNG3Jdx7c4EaqI=
X-Received: by 2002:a05:6512:b97:b0:542:986b:de08 with SMTP id
 2adb3069b0e04-542986be0a1mr3961478e87.26.1736857034594; Tue, 14 Jan 2025
 04:17:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103-wake_irq-v2-0-e3aeff5e9966@nxp.com> <20250103-wake_irq-v2-9-e3aeff5e9966@nxp.com>
In-Reply-To: <20250103-wake_irq-v2-9-e3aeff5e9966@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Jan 2025 13:17:03 +0100
X-Gm-Features: AbW1kvYSSgagqOIiggVP1rEX84eySXcyOvS8Yel1NcZ50o6oIQlw1NaD7KnQIZM
Message-ID: <CACRpkdbFtLhGXwSbCF+v54eEdm0w=sDsseUPiRfc=xmak-DbhQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] rtc: pm8xxx: Use devm_pm_set_wake_irq
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 3, 2025 at 9:42=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Use devm_pm_set_wake_irq, then the 'driver.remove()' could be cleaned up.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

