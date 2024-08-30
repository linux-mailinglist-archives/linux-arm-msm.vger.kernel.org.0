Return-Path: <linux-arm-msm+bounces-30322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD898966C82
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Aug 2024 00:33:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A78F284DEF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 22:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F0D11C1ADA;
	Fri, 30 Aug 2024 22:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rfnKxrKB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067D01BA260
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 22:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725057161; cv=none; b=cmjOfsN2xaZP1N37BGQvVcC70KhCZCX5PUSiWpLnFEC0BsjORLYtAyR2JWu7KdWJvhfZjUwVSIRbo8pogA1xOjGBvEGMj8MKn8grnmvuYp4JbwusPxbczF2/jBKORLc8ibeIz7Qur/NqZvlZuu1cUl7n40jYy45rYPCNH9ABIWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725057161; c=relaxed/simple;
	bh=O4BVzo4/O12zJnAXRC6H/18YaBmS+B36iZcOSvO8Wdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WPzzpifmQFZFMD3g0Lr9J0Kkk+Pn45NqSiqaH9bImjbE8niS6A6AXFHKuZIpSAH+C05CvwyvKyfIHxSIXf5H2m9KiRHZ7EIQNjV/PlkxXlmv3tiqg+nSi/EGjyBHI2ZuF2uAqCr6nsUo7D9Lg/aDgBOIMOZq+vmO2bVbMLs+jug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rfnKxrKB; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e1a7f1597bbso801396276.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 15:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725057157; x=1725661957; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4BVzo4/O12zJnAXRC6H/18YaBmS+B36iZcOSvO8Wdk=;
        b=rfnKxrKBpB4EIwpnGRFvzfFPFtF5qw8wflecgdm8PrJT1nGkeKPW7oUlm0ZYwuRv6x
         EOKC6ckH9SnxvLbdpfbZCz5LFr66UStvj+SOxHjDoCiCermKPZuhjuriuYPHewXfJnrc
         47fbbq4H91b97+tkaAfMqjMku2MtYf3cjq19FOJJbIMLGgVrN9o+DJfp+HsaHmR8w1lW
         ydt22Z1HbkdnKbfIKpu00UWcG0H8E2a+GHrVIvQKkVpuU7Kdh1PZ89324BGrGLiZRTYQ
         3N8H8trseMi8T+Y+NqSx0ZOkJHKfmjVKjr0S9QlHGR7yocCjP4xriPBLL6A86fQiLB18
         MWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725057157; x=1725661957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4BVzo4/O12zJnAXRC6H/18YaBmS+B36iZcOSvO8Wdk=;
        b=Narydkv5UNAWjWxuAoWb7hx+W1cMsvRv3bDy1ARMfeZAtTSFdtulqAfdjZL5HMHfvW
         78bhNsLBrR5pXZJBMBUMApL++tKZVXP9F2ILJHcuWhSwNtAMIC10l3u0BqcvmzK0dIz8
         Ikmdq8AEe3pRyJq5uzwnD6TjxGlRFbnleZjWKTtbs5F3EM5EfZKIW74P8ZeNtoPeVR+d
         3VRQ/W0qV1GUmLt3jRabuclMGhSK4D53L8lFw35VKmt8GJHDSzcT3Nrso0bjNp+zMfON
         +4D6SI1ENADH8DJqMI4CvrFd64JH62WFZws5K8g4+Hw/ESITjOszZJF0WByNvtEagJQx
         ElLw==
X-Forwarded-Encrypted: i=1; AJvYcCXkIG039tPEPeJ5ey7e/pbbeIm9n+hW/0dLStoV2MrdGTkZHitOcRYzFfnpTTrm/V8mI6OqfjocMGoNBPVV@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr4IVCBcZINz+96GvNGRrMWPJyWd3R0row3kzeL0WVT0VaNck8
	mAmv9hlmybqdvC5AcEk8VH3OCkrLgQ7vnEtjIUYtCs1QavvtvDWQLYeUnLbwBRYRJbXEtoMWurj
	fE/8p9fHa72+2BZxHgyBMEZz1tgR8FOjX+P/yrQ==
X-Google-Smtp-Source: AGHT+IGY8O84DiR2Aaig1136Hn1BZ4NVKNmKGEF29tIOvuMMt+pTTKh5RAqmh/aYiy5yQpsPuZ+gYm0rdnzyEcUt/SA=
X-Received: by 2002:a25:8391:0:b0:e16:7070:97e6 with SMTP id
 3f1490d57ef6-e1a5c648a4fmr6700554276.9.1725057156927; Fri, 30 Aug 2024
 15:32:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org> <20240828-dt-bindings-gpio-hog-v1-2-63b83e47d804@linaro.org>
In-Reply-To: <20240828-dt-bindings-gpio-hog-v1-2-63b83e47d804@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 31 Aug 2024 00:32:25 +0200
Message-ID: <CACRpkdZzF5yJQnnDsjU8cTr9Fpe7wZZXoW3K-wFYuAq2vv8XxA@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: qcom: add missing type to GPIO hogs
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, Bjorn Andersson <andersson@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 11:36=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> GPIO hog nodes should define type, otherwise "dummy-hog" boolean
> properties would be allowed.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I suppose it's best of Bartosz applies this to the GPIO tree with
the rest of the series?

Yours,
Linus Walleij

