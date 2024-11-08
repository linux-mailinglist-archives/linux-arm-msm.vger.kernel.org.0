Return-Path: <linux-arm-msm+bounces-37332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E129C1779
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 09:08:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24C34B20F00
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 08:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8D7E1D3578;
	Fri,  8 Nov 2024 08:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ct4C7n03"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C281D0E0E
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Nov 2024 08:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731053282; cv=none; b=Shu5CJRLncW+qjT49k9d9au2HG0g493b70+7rQy3dKTEW6v8kIUjYAfiJRiKJA96l2Uwnlx3KZ4qzf0CYqvhNMIluccn3wJ01euIjdVGstWP9WWiVM2EySvx5yjbi8HFU+P8VE9XqSHjij1AgS5lXQutzqbENW8dJZQG4W7D8Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731053282; c=relaxed/simple;
	bh=BxCAif6wBpfReu8TvZw3mVT33TIGWApsV+3A+vA2nTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fpmtyHRcDuAQPdhLa/sPsCnNgXLR2P+tX9zSgnBxTHFBHjSeH65ypKG5/eRIwyXSbD8Q4Voi2tSBJRDdL9BUOlL+MCsFpMaEAhPc248Dn3crxpwQlBLUhA6FLontvIbQ+HrtJB3/zX9K4aKhiQOwsaUacfMSY57r152zOpolfLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ct4C7n03; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb51e00c05so27701351fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Nov 2024 00:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731053279; x=1731658079; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxCAif6wBpfReu8TvZw3mVT33TIGWApsV+3A+vA2nTg=;
        b=Ct4C7n03xwW94PDgpvQkF+5YOyVeIkYaZwLrR8pRkli26DXB9U+Hy5l9Sd/oVyICIP
         PyYN+L6zFhdKaybMwISi3RQ59YwTUX/cVHRaoA5Mbm5R7OSQ7N4OnmVViWdTYTUNazf9
         GIO45C8LSdkO336imguOwIRxHnmxukTiBYUQaBG7llcF57HW44z6f8Ld46meaDcC7r9U
         a4sJD7r7GCuKn5BtrEKiaAOkFadablpcIkIqAi95oxeVH2PzbYYYxW0TxFWsmK7Xa7Fm
         gCPfw/ryTSqe/b5R9RL0gBft/gge+a3x7aCcpvSop8MBOT3aDmNwOZW6Gqk6e22uiM+Z
         43vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731053279; x=1731658079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BxCAif6wBpfReu8TvZw3mVT33TIGWApsV+3A+vA2nTg=;
        b=LKlKTS5lEEghbZTEWtxcNuNV1gdcOW+ByTDVMXHhmNjUbf3tj1ZNu+kvXCp7+3Z/MU
         Lt61Jz5zWbPePZIx9YA28b/Uk8pPxmlyjw/+9hA52/Hvqp5x9j7NQXIlgpWKUkOCey1h
         tMuD1cBHaVprdfk3vK4M6rr189zYH4kJDsbLRc0uIQ0DXklkpp3gQFdYTaabWP1RzdFC
         4524Jq/FABupxhEVF5VKlXYiH2wwuvfYkvMr0MOY1Q4ij+U6w9bqHPtjqIb3InDHq48l
         shGxDLAKdnEHWOX2+Y6CE5T7eV+1EB9uL5kh/P/pQm9up0sAd8QGdRdnrW86LFI5fxKo
         JKDw==
X-Forwarded-Encrypted: i=1; AJvYcCU+4LF88q1UEfB+1okIB585Euc5u6zyhqd17+1uxaSYgM37PTkPmZmBiQei0Ur/aLhKZX7LSvZCmjRxb7Sq@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt5IeWAlFGeS6n2QVZZkB+h+VMrmSJvbayTRz9v8ElqnEd2bLy
	WKpTu5/8/VdUZmdHOinTOJFs7Jz1V4O9kCsv7baHH9v6SHS6CpuwkUHzktlh1vuxVTZeq+LDcNX
	QwbFLb8LxEaj8vnbTqSHFzZ9DdZCAJWz8I+QFXA==
X-Google-Smtp-Source: AGHT+IECFYZgmqXq90uc6fU+GhsZFrNHgfgkpCoMfSI20MKSS84Aidx6qe2DptwPr7H2EP4ELmSvQSeK05aPSJkA+5k=
X-Received: by 2002:a2e:a10e:0:b0:2fb:510c:7237 with SMTP id
 38308e7fff4ca-2ff202c3c9bmr11587911fa.41.1731053278604; Fri, 08 Nov 2024
 00:07:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241031-msm8917-v2-0-8a075faa89b1@mainlining.org> <20241031-msm8917-v2-2-8a075faa89b1@mainlining.org>
In-Reply-To: <20241031-msm8917-v2-2-8a075faa89b1@mainlining.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:07:47 +0100
Message-ID: <CACRpkdZJmetNUHhBOfoZuygEXW7VO0Go2bmngxciVeOoyzVaxA@mail.gmail.com>
Subject: Re: [PATCH v2 02/15] pinctrl: qcom-pmic-gpio: add support for PM8937
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Lee Jones <lee@kernel.org>, 
	Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2024 at 2:19=E2=80=AFAM Barnab=C3=A1s Cz=C3=A9m=C3=A1n
<barnabas.czeman@mainlining.org> wrote:

> PM8937 has 8 GPIO-s with holes on GPIO3, GPIO4 and GPIO6.
>
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
.org>

Patch applied for v6.13.

Yours,
Linus Walleij

