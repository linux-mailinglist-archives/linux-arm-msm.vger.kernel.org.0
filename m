Return-Path: <linux-arm-msm+bounces-16314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4161897322
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 16:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DF33290BD1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 14:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C476C149C42;
	Wed,  3 Apr 2024 14:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="aKnImIsP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86A61494C2
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 14:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712156175; cv=none; b=Ly2mXGzNstjxlbDcBRqKDLG4cAvjj8YjQFgP0sQIqBG0OdR/7C8I4honR9Ta+KeluM+nvwuiHQK0WVTWDL0oPClj1imuMD+lPXyhoZhW/KkyHJykpHkwv14QUSsuaExoCUu5VX/accTNRoiog2E+gCKPzH7EYN3L0iq3SD8w9nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712156175; c=relaxed/simple;
	bh=qIMp/Bi43gG5OxVpu00ce21O5fSpFFXCTZkgJC0kaJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X/e9igxKp1MV7GMwsRzeKIkEm6Xaki3rari/H7hABq/te6Jbi3bxNuWuPLFZ6Hf+Vh7YLyVIA+p/vyhA0nmChMgQvcKfzRkQjexqse0tnmX98IE+NWDvRzWg5vyELXsYd2yxM/gfapXq8Kc/7RDyrzZCIAVOLmU4AGy4dHUNQMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=aKnImIsP; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-516ab4b3251so3345913e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Apr 2024 07:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712156172; x=1712760972; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AEDPySL2e/8A7unRrzw52gMZQYQQOXlB4w/mt06n1w=;
        b=aKnImIsP8DZAEOQspUmW8LWc/9dXAMfFVzUOfjLRQsExSm+YC8ycRjE9jQg1o6dCoh
         5iCfqS8uDMWH8uO6lMAz2bXbEK1O0D1nYOBbq3XqtW79q/Cc7cVCG/R+muXrspBOhUUm
         wadCcstUMIMt3R/oSq96Xl2cpKgJiSVRjicPLlU31sGKvbVAKvjSD7hEZhM0KUek9PDj
         D9ZxTZrrn2A9yTFvjpckb3yAeEfUcfL7ftrnJfDZXwe2Sxq44SAu4rCtOAIHV/88Fhxr
         lrLYKerwj6Ig9SZ5Ouak9rn5oo6VaMzJgxH0mXFJBHIYX3GIlS7S/g+p7/JVK98F7huP
         C6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712156172; x=1712760972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0AEDPySL2e/8A7unRrzw52gMZQYQQOXlB4w/mt06n1w=;
        b=Y0MUU5NPWL2Cn2RUFZdMlGPZ/lG6WxPXpCrEzDAvG/bvAi+C6QQZ+b89dZyfp6iCB0
         21/BPuuIhvD7EdVpVrTm62uyVCLAmrulkk5HCsiLLKwmciyGOgmxqz09Ijk2ogjUxj5i
         AOquN1lo9dS/n9Zw867yzzUT70Qt3yuDaMOO9++wpyKQZzOStWuyMUVg9ptcL06No/pt
         M7A8OuRDpduvI3aeg5r/N4P/LEDEanlzWBqzK8cLe3w114SNjKnRokLcSolQP7pyjyRb
         92gLhSLUUP4jV421+mb16U1lsZqHB/nqB+5XXcR3047OMlym8KK1rgnJRDnZvvtyK95X
         7C/w==
X-Forwarded-Encrypted: i=1; AJvYcCXMFL6WQ6vuYh1lBzWvEhM2MVSmuii4PG51J7WuWpPBYZuD926H8BCcspwMCAB4tQvoY1ZEtWZdqUqmmqOKPBvzDjZA6ptB78YrStk+tw==
X-Gm-Message-State: AOJu0YwOeringGIs73M3vvUE42e1llYyKgBqG7V0vwYc4bmapN5XTJ+l
	KmhnixYU0ifBsTSNO/BCEVrmDnA5FaZf8iTNdwEz6J88CYF/5cb4rS4iZHSnGd8XpvgCWoI/k6m
	ieJZrlgSNgkgJtXvUNCvvDO5h3S3WqBOw0tK3jg==
X-Google-Smtp-Source: AGHT+IH1uAqfWGiUk+RIbBgdGkD1xZiuVe0WG6sH6tI1B254BJw9nsHUMXBNKMkZlc7467jz/bVPfZDn3fzBPSidFbA=
X-Received: by 2002:a05:6512:36d2:b0:515:c17e:ddb1 with SMTP id
 e18-20020a05651236d200b00515c17eddb1mr11741487lfs.50.1712156171964; Wed, 03
 Apr 2024 07:56:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325131624.26023-1-brgl@bgdev.pl> <20240325131624.26023-6-brgl@bgdev.pl>
 <87msqm8l6q.fsf@kernel.org>
In-Reply-To: <87msqm8l6q.fsf@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Apr 2024 16:56:01 +0200
Message-ID: <CAMRc=MeCjNn7QdDrcQMuj32JFYoemQ6A8WOYcwKJo1YhDTfY+Q@mail.gmail.com>
Subject: Re: [PATCH v6 05/16] dt-bindings: net: wireless: describe the ath12k
 PCI module
To: Kalle Valo <kvalo@kernel.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Saravana Kannan <saravanak@google.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Alex Elder <elder@linaro.org>, Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lukas Wunner <lukas@wunner.de>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 3:01=E2=80=AFPM Kalle Valo <kvalo@kernel.org> wrote=
:
>
> Bartosz Golaszewski <brgl@bgdev.pl> writes:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > +
> > +maintainers:
> > +  - Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> IMHO it would be better to have just driver maintainers listed here.
>

Why? What's wrong with having the author of the bindings in the Cc list?

> > +required:
> > +  - compatible
> > +  - reg
> > +  - vddaon-supply
> > +  - vddwlcx-supply
> > +  - vddwlmx-supply
> > +  - vddrfacmn-supply
> > +  - vddrfa0p8-supply
> > +  - vddrfa1p2-supply
> > +  - vddrfa1p8-supply
> > +  - vddpcie0p9-supply
> > +  - vddpcie1p8-supply
>
> Same comment here as in patch 4. There are also ath12k PCI devices which
> don't need DT at all. I don't know if that should be reflected in the
> bindings doc but I want to point out this.
>

But DT bindings don't apply to devices that don't have DT nodes. This
isn't an issue at all.

Bart

