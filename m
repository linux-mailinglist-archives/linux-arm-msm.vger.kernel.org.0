Return-Path: <linux-arm-msm+bounces-24253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45720917D3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 12:05:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFAE41F2127E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 10:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76B1317B405;
	Wed, 26 Jun 2024 10:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FycJKKqk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6F1176AAF
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 10:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719396283; cv=none; b=SCg6KXGL4J3I18L/n1UwDyDSiuWsJe6fHF8lhurDqOl/ZuA9zYk2ZcJkSgyOBBACiAPkpXyU3hZxkBGI0slbjAObt+Wft2WELYfRzC4PxLj33QEkc1hwAZ2un+/khjaE2PxDvCiiGzy4AZB872n/huX+JKexde+xmIC4Rouh0Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719396283; c=relaxed/simple;
	bh=wAGGb9nbphDH5JrB+dXV+rNYOi9vDVjsKxMqqIkjMOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tP/XHQ6XTcQT2g6KO6GEtnaecCchoAN2VkLoZazEQoHjuS/4SvMwe+UoRV3G1/hM7wwGYSYTufkuG4yoB4F/L6RdQ9UYIp0/QTkC6ZPHmUY+0Yvog9IIcPSeXuY+M+rsTTeNyIzHsLz5JEtNoqXe3v/sT9SoycGmTC2+63V5zSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FycJKKqk; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52bbf73f334so5165632e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 03:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719396280; x=1720001080; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wAGGb9nbphDH5JrB+dXV+rNYOi9vDVjsKxMqqIkjMOo=;
        b=FycJKKqkY+GI1B8R99drOgW3F7mwo47FtLS5n1+C8qmEyi0K4NPsG/yhQPTgIzudDa
         SPpQHVEq8qvT6433gCt33HirOnKYDeTwRoymdk+lyTIcjessG66eHjgX9yj7GrvTWA9Z
         BJkCnUdbaPIRIV18/fjzLnY0kDl1ssOPxNotJqF+0VxxOrdVtfwMaJ5lyCI0XwBmNmot
         X9QkddGYPIAzlE2rUe8Vv4yOOdQP3ilgkwUdJlHUzBbWoCxCpDtgo3HuBRY76k85EaR5
         8qUlWqz/n8xSABK0ksJs97B8/x3551SzxFZgLWXsNmGDERiLpawFGwLWGoqkYVtYbZ/Q
         +ijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719396280; x=1720001080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wAGGb9nbphDH5JrB+dXV+rNYOi9vDVjsKxMqqIkjMOo=;
        b=QFOAqyg2F3Jd51AFcDJE9MaIB46FHWjFO2Cm2iRsSN64N8TClPHKWhWsjdGAJuq/I4
         s+8GOLnzDOhd8+TVVr+j/dK4EHOUJxHqFthzclgad7nFXTCKCP2eFNZNUu32er+/5Pom
         As7Z7lZF1UsewiOiTnWRU5+kVF0FSkY9GLTVQMJxc57MP7Tvi0jmNi/VmcooBztH+tin
         +iOX+obcGA3lMzSWqK9C69t2gdxsBY5QB6rAeUiebErYBpGgw6hynFhwdNwAoZH8t1MM
         6GEN6yHilRhqjon3OrlgZ81dhEfPg8LH4ZzLSqMqJZmzerIyUI8oXIKYKeiyrYEQozCk
         IFeQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5gHfjoh5vfH5LBm9/MTZsXU34PlRmwRrQ5AR0zHtcOCHOgg0bYZTt07DZSl2ZR6/isT1qeNOzNM1RwA0tcYGKJNGxiNMaexJDSBNi3A==
X-Gm-Message-State: AOJu0YzGdrK9zBA6gBp58KOq1V1JQW4W5+cSdBBbuR2rB0xbJNZcGAOE
	FO4vfrBlPsnSQGASyKz7PCSKsU4CYHR5rNPpWsjFRL7cYfIyRKhMVCr20z9oStiT/Ea111oUETK
	sBiGIrjgkld+ydRGM8zGXOEN79a8ct+sB4AKPMA==
X-Google-Smtp-Source: AGHT+IH7rPG5U6OeXEnbgIj889fPheKL56AlWQLK2rD9EiaTdNPfPLg1zeaf3Y7+S07mnQaIGk8RVTc0mfDwCJd1S0g=
X-Received: by 2002:ac2:456b:0:b0:52c:df6e:9517 with SMTP id
 2adb3069b0e04-52cdf7e66dfmr6847985e87.11.1719396277395; Wed, 26 Jun 2024
 03:04:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240612-sm4250-lpi-v4-0-a0342e47e21b@linaro.org>
In-Reply-To: <20240612-sm4250-lpi-v4-0-a0342e47e21b@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Jun 2024 12:04:26 +0200
Message-ID: <CACRpkdZyupZmV+e=L0KR8ospH9P=wdUrMFvBnGXyfhLhW3-=PQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] pinctrl: qcom: add sm4250 lpi pinctrl
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alexey.klimov@linaro.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 22, 2024 at 6:49=E2=80=AFPM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:

> Add support for sm4250 lpi pinctrl.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

No major protests against v4 so patches applied!

Yours,
Linus Walleij

