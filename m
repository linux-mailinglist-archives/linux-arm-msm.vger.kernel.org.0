Return-Path: <linux-arm-msm+bounces-54458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ACFA8AB29
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 00:16:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE7B93BD6DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 22:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD7C72741D8;
	Tue, 15 Apr 2025 22:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CJ5SQiNz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA3A274FD7
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 22:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744755258; cv=none; b=HtJhkYQKpp9sP+7ubQJphXSzcZXb4efhwiuDM4AH8cOzL/teGENOSXiwlJWbkwfHaDGcdfrfIWV2A2H3Oz+6JoP8o6TgVbM1dBFTsHIIlI+vqpurdpYnYiL2Gd1wjYK2IwaF7umyQ9D2yCXWoiv0Rp0bWUOeoe0DxEQ/iUHHUvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744755258; c=relaxed/simple;
	bh=+9CSOfy/OSDQDBo6m9PcMfybGueDvhyni88kHhj8bBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iiRxbOjNph7d2I6SMFUiaLohNDoqdhvGmX9oBz3WjNz/k29w8HWO7/M9hKLxYle6f/tZjgiGE6rwZR9WoY05nP31TPc791907Y/in42AOcacMDgWKzGwKusNQLXCztr1b7K2mthKj/0CO1o3mT2SAAgBYnfymytec/kJzsof7VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CJ5SQiNz; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so7116720e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 15:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744755255; x=1745360055; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+9CSOfy/OSDQDBo6m9PcMfybGueDvhyni88kHhj8bBk=;
        b=CJ5SQiNzBkWr7VDwLF4XmMgwi9uA/nJkucF0dbjRoZMF4KOtqHsmlzB8VguusGNL1+
         X26bp2oeqra77NcXY8c3QhJNXCkbRWNKpOedNTWTWd2SBmKNxw10NfN1Vzc3QBjuN7Np
         5jGEK9y34WY4aPivStMFaZUMFBTdvjZ1DZZjPiKI00p3AWIN4J8VSL3uN2DEvLQ2px7K
         X3R5YxCymYV01n0xQRtxL2noZ22C59n4By6MeJ/3FYmDDtJ8JtaW0sqSL0hQvUvAv00l
         6KvJks6pKQ/LLTl46xfAt0c6Iz/xg8uarK5P95NJhBrvaSdGZKC+JoPoXbBesMf4a8f3
         d90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744755255; x=1745360055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+9CSOfy/OSDQDBo6m9PcMfybGueDvhyni88kHhj8bBk=;
        b=d8FszRPv2d8LgmaVtGn/HKylmZuMVq8VP9L36Poxhw30LIxEZQdkpEVR+UWThvNXK7
         iXwKAXzFhjx4CUvVIjC9Ml34bQ80f25wyVFk7Ua699r1a2hD4MkaBmpXCQRM8T67CIvE
         NlSxJ2v75h1vdjAidSt957crZrNrb6d/B270MVqJn+DH8BRbTEDupP0CVto3+ts9chCt
         2zDsKtZOPNPd1cPDt+mjMhAJng4Y/ZHKeC66iTflXyvXytqnZB8LzHQ9fcknBCYHQIU1
         QewH2x1WFUOujEFwnC5Z6X3Mr7N1o95KCV2ZPRCewZnreJ4NWAa04mODoVYOjYKz3Lhk
         /Hdw==
X-Forwarded-Encrypted: i=1; AJvYcCVSamsKOdLCIQAPEjsI693EoVl+fK5J/lOGmFo+BSHkB/xUm5vnLKzly3eWpvA9Bl9pQwuD3J2HD/Dpk1Og@vger.kernel.org
X-Gm-Message-State: AOJu0YyU8ueTVopTo58Sqvs9rbaaK63QVfS47Z/eN0+QvS8Ch0eRZV7j
	+0BIsIJyu0b+Kpsj5DOj9t0opeqmlUpv0Ab1oBK8n/IcJ/kA5MmHjqyZtZJgrXX+3V4EO6sid6Q
	uyhmZfjsPEgpD5Tz129EGEXaMjNxYdmgkadc6XA==
X-Gm-Gg: ASbGnct8/khi3x3sqG6DaIQwEsy8AnHAuoiudId8d5VTqR5vgsuX98HyOQEjiYAK8x6
	nJvQlscrvB7xJg1esGY97wrUVIS1k0i9fMqGM3rfa3WYdifNdbwf3RPqgwyepgOfwxPU1Zz8s/y
	4GZwdwT2sEokxm7MRVLiVHNQ==
X-Google-Smtp-Source: AGHT+IGBF5IrLeLXzWpPgufuoRl7LZtgwhRspRq/qCcnRj1V10eVXuTbFOcobeERvTB8phFE0DlLxPU9lGc7Ecpbux0=
X-Received: by 2002:a05:651c:19aa:b0:309:20b4:b6d5 with SMTP id
 38308e7fff4ca-3107c35b9e8mr2073651fa.28.1744755254887; Tue, 15 Apr 2025
 15:14:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410-gpiochip-set-rv-pinctrl-qcom-v1-0-6a6891338aae@linaro.org>
In-Reply-To: <20250410-gpiochip-set-rv-pinctrl-qcom-v1-0-6a6891338aae@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 00:14:03 +0200
X-Gm-Features: ATxdqUFlFg0lGWI6NSoTSJm8tZcs-_N--2yxo9MXcXcFS8VRrICSZBjqn1olmIw
Message-ID: <CACRpkdZyqvQi8NyUGOhrN97g=jOm5FySeTnL1aZ+TZtX88o+ug@mail.gmail.com>
Subject: Re: [PATCH 0/6] pinctrl: qcom: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 11:35=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. Convert all
> Qualcomm pinctrl drivers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patches applied!

Yours,
Linus Walleij

