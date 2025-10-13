Return-Path: <linux-arm-msm+bounces-76980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 360FFBD27E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 12:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E46833B08B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 10:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BECE2FE575;
	Mon, 13 Oct 2025 10:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K8PdD2FC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657822EB865
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 10:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760350557; cv=none; b=j1n7jjpcdlJ+h7NlCieASsZXopjHAYbQVZOmFib5euJgXpPpwI/qyV51wqjKF+Pt4UL/fqsmn8gyTkk5ZJMOyaZC6EJhAm6Mar3tK08MK3kpecjOUuiJwX1K6GcLDvHANmGtNfENY0L4mCq9qpdNqBbKOf8jDvnzlOf/GXEPQV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760350557; c=relaxed/simple;
	bh=QJNIF6k+iOR/IePJA8Fl6Y+gEa56kj3NzVJwCbWlVSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dgJfhBBBoq14Rv1ny2iBgCITiDuoKyVo0e964y/wq3a9t8iRVF9kg23YmOHKnpD5lp2fIrx7cOgjmm5ECmsT8VJhLeMLw98J9LbuCqeDZokLpWlL4OJeC3Q9UsAvA8Kpt4Dj7xaTElVDJT/uOduu0/x667G1PD9DfHkroIujFPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K8PdD2FC; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-36639c30bb7so27525761fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 03:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760350553; x=1760955353; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJNIF6k+iOR/IePJA8Fl6Y+gEa56kj3NzVJwCbWlVSY=;
        b=K8PdD2FCAAXeFcaGt4C3KpG+JBrYF3fm37PweQFc9Si/k+JpqxgarHua227b67nepB
         GPHDAmcx6z9d83b64iY7LnC/If0QP+oTGVnaELk8enkpOt7gY7kEtf4hPlY1R/BpHYSH
         tag8W0HHVOFgLr94orqk+P6ByFAYUbwmxCuT2LnA6AhaiQtWngII3GSydlX+3ODrwAMH
         2S5l7cwnTKBalaVc13EoWZ5ejBhJav7Nua9WpEmVhhzKK45MvBeZuz/ed/y1W8tNvgpm
         jaL5keoNRB+23xKPR0HYh+N+4caES5Efyi7cDI8+lrbKHQzJ1VBHXk/VuJc8blaAlN3I
         SMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760350553; x=1760955353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QJNIF6k+iOR/IePJA8Fl6Y+gEa56kj3NzVJwCbWlVSY=;
        b=LsjykwnvyjiaIyeoWusQZO387ZNU+kz0UNOrU+plaVivmPJJYwn50j8F3yiuA8axKt
         3gUFiEnYTeKaEnItGvAk77JZAFd+XFso6yhnpFGBBqkY1XYtYIlrH43v7vNb+rjWkEY8
         2SydmrEO35iIMEwRAqa6G9hNS8m7DgDwFA45BlGbwWFotRBP/vn1XpE8asCWOTrk834w
         3L7P4q76HEfEC8NIn6QHjEvQsr7tg5jx+vqNcpNQiQJVPxSqT7+M9GwbWCQIBLPOCrKU
         snW48YEondBja3C0njo7yHESrkdF5ygWhDGdl+7R8/1WettDNTpwrFWm69QNfaARe/GH
         6LaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVF/ST/aa/mZpYndl+Rn5mX6FDmJb87/0MNvxlxWhm057eGh+/8bOhMREouA56qMESLozP2qARuuEb956l5@vger.kernel.org
X-Gm-Message-State: AOJu0YwaWNRBbGCGrmzjFm2wHVv5lj6poL5MEcpM7o4MX3pJe5sbeGLK
	1xmnFTBOD3qKcrBEP9WRkeM6rF7dOFDJpMsG+UP7QwErRanfQSkjGLXOQkIK480DJS/TYAXTZBy
	aMH8VpntjWRADzuBz/9muHYOoVniiuQjvPQwd3e6mWQ==
X-Gm-Gg: ASbGncsKNGqY620VHrPSABh8JeQlvtqr0o5xU9Klwx+WTyHcS1A4R/UAp+U4W+af2hX
	moJYf6GRV5kSI7XhjVuAv/Mc8kxd1ZbRZQm0Hi1UyELnx83WSOz7q3IsBAvyYVsHOuDimUpEtPD
	zjI/ekJL+lb+8qJARXvw3VL1zFc2jhWsEMkGX6fJOV95SRe+oVPDz/DHr5w0rpkWuUIT47pBSQd
	F9sYyrtInQuBJKwBsAZNljDjingqM3u/tBJnxN1
X-Google-Smtp-Source: AGHT+IEN02w81G1S5VW/kSneQdG1TOPLVZyWHNaF9kPMKLYqgtaUGWqWUaN5LOGIpSVHxD2qCpvgfmV4mdasQo7MrZA=
X-Received: by 2002:a2e:a911:0:b0:36a:a87c:d139 with SMTP id
 38308e7fff4ca-37609efc71fmr50058061fa.42.1760350553454; Mon, 13 Oct 2025
 03:15:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250919-pinctrl-qcom-glymur-fixes-v1-0-426ea410aa94@linaro.org>
In-Reply-To: <20250919-pinctrl-qcom-glymur-fixes-v1-0-426ea410aa94@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 12:15:42 +0200
X-Gm-Features: AS18NWB-Rj8yGZ3DOyv1-w7k1_8_Txh8yemaMK031WnuKWeVF8Y3K9yfpPZYDd0
Message-ID: <CACRpkdY3Hz1QgK9jDVE6LT5DeNKbvz+-aa3Q9=njkESHmyeksw@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: qcom: glymur: Fix gpio pin functions and
 clean-up match table
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 2:17=E2=80=AFPM Abel Vesa <abel.vesa@linaro.org> wr=
ote:

> This glymur pinctrl driver is not currently being used by any platforms
> upstream, but once the entire platform support will be merged, there
> will be some issues with the gpios as they will be wrongly requested by
> the pin muxing config in DT, if the gpio pin function is not marked via
> the generic macro as GPIO category function. Fix this issue now by
> marking the gpio function properly.
>
> While at it, drop the useless compatible specific match data from the
> table.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Patches applied for next since they are not regressions.

Yours,
Linus Walleij

