Return-Path: <linux-arm-msm+bounces-84781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 680F8CB0538
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 15:47:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4838F304077E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 14:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B8F72FF148;
	Tue,  9 Dec 2025 14:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtyMn/T4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4803E2FE581
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 14:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765291570; cv=none; b=VECpYud9cttZKsxOzLbjSM6ZlRJ+kkrDClEeLTvDpUt8rJOV+SbA0DtFOhcOY8owKE9kY9Jm5U7dSMASAbNkYOWa1212HoxJRxWV6fcjdGNjciIExoNIADkM/ptbRwdbn6gsPK4Nn497n2XioV/QZgbmQ8+T/G+v6GolofZypwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765291570; c=relaxed/simple;
	bh=4fmZfYSUNdsaSTLHpM8yeyepmqTOQi5Ko0nHpOXwYuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cWT9JmWsnc7HiotIBuCsD601R8TSIayX87/l/9RcyJbcXP9P/iPu8Holfk5U9V9wBnvBGG4Eb57TkCDcndaOlgA0ACU3ij1PuXd3cBHNTRU7RWO/D2q5xlUaAhFMNKkIbEzGxmbzgyv14w02HK3gcmKoyqtHF6ppSRBuYRlAYI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BtyMn/T4; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b72bf7e703fso972684066b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 06:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765291566; x=1765896366; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4fmZfYSUNdsaSTLHpM8yeyepmqTOQi5Ko0nHpOXwYuc=;
        b=BtyMn/T4Aw9KeqxSQvIu8krvp/m4mn3Plad2gMYfyrHDF3M0MobzDcRqmL+8VupfU1
         MzZplvNo5kyaxxolg5LDo3WIdyzWneU9ulL0Gc8uYICDZ0dyZ+6/XDof3IWbnmVrirhh
         AyI7dZ5UQZ8N+MbJhU/EKTb+bBB8vkX1H+b+X4xiJhWdh3LsCLchnMmnIYf0ZYun3c2T
         1EDtw3Nd6QEehE0TaVSA5wZl/ZmFGvSLHGQ7WnYypyvUDVYmfMWsyPBZCMVRXKb2fuiw
         vHPPgkpeWMqhbrkttf8mKhpAP6CL5grGLqXqxMn3sM5vfJiQu38Htj/IW9YCea7VWzf2
         iWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765291566; x=1765896366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4fmZfYSUNdsaSTLHpM8yeyepmqTOQi5Ko0nHpOXwYuc=;
        b=KoduhEZkXzcBpq9Vf7kuRNntK2Sdg2alyAAUe+Q62TdZLcLgNjpW4FvF3GV/tRI+fa
         DUAuwmCtIoj1inTPe285wFF8T8mCUvxy9MtF+PEc2yPOkNh75bYXZw/L2hCivY6RNC1H
         nELx/WfJwnzu1yaJ7KIXDN6XNzEVmMQ/0Lx1v/BLxRHxtLhQiIMcDSOhgOjUp5bYj+iQ
         vLECu+LFY8eKfZzDqSPxKc0J3GuSW3cqDNU/CwB/gMQ2KiMF9D5rulZSlbRWnXggCX5f
         O3AbY2yn0+jb8yKizZdQm7wG3eYS6+V2ALdN+Zolyw3jt2T+4H0D1C+YOx0hAbLHXiai
         Cauw==
X-Forwarded-Encrypted: i=1; AJvYcCUnTKsDZnbDimbkXljUBEYZnbIWdRo2tlNfSB43qtwXwMK745dzL4+DBP/bMa0iz/PiBb4h/G4uT5CpIx7t@vger.kernel.org
X-Gm-Message-State: AOJu0YycLb4b/8mZjLorgHB5PmLFs4LT/oILAN3Egf8sTdQ7YnwAX+vL
	0Oqco1gkRY3X0ORgt/JlV6udvrrtotv5/KmC8kMpzjGS5dtfMfvsVPUOGaab2mse0y/m2ByQ2GL
	0+bUFep06FV5kERpruRqeyUGgZ6E70QI=
X-Gm-Gg: ASbGncsMMpo82R2REdumNqvXpa7BKt81BFR2He6aoPWsF+gFFusSuBXI9teQlDblWaW
	3T6xcc2UBAGHiFyQlOs3Na8VW3xJ4S36inepq9+sfLAcrZ2Ll7JhOE4pPk/S/R/YPY4W/2h8EWR
	PpiqzVp08bGt1k6qTHrHTvwoMr2jGWDCGLHiEKGL6Ez1nwGikHPYE80uPIqw2+wOfklB14ok22G
	by/t8JeWN4HfMPGFB8hq/+KzBxMS7awHTJCilHaSE4j2Bt73O0EhprI2GwShuoTo0ohbT4lSe5t
	uMM3RVlGXLJd7v8zi9E3J+shCEBHm0wTnr75NjE0qmSa0DKItT4llmrHjCqeLKfS8Z/GMu0=
X-Google-Smtp-Source: AGHT+IGlXu3dCFc83X6xkCFhuuTuzxpgBAzwDgILyS6ZUDAbBGi1U97b1Qfz8jIne/sjhUc3CyUOVqmVWZN3jo3XIyM=
X-Received: by 2002:a17:907:d9e:b0:b73:845f:4432 with SMTP id
 a640c23a62f3a-b7a2455d577mr1325347966b.32.1765291566315; Tue, 09 Dec 2025
 06:46:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251209-iio-inkern-use-namespaced-exports-v2-0-9799a33c4b7f@bootlin.com>
 <20251209-iio-inkern-use-namespaced-exports-v2-1-9799a33c4b7f@bootlin.com>
In-Reply-To: <20251209-iio-inkern-use-namespaced-exports-v2-1-9799a33c4b7f@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 9 Dec 2025 16:45:29 +0200
X-Gm-Features: AQt7F2rGwi5_TocOmRGciLvaWe8Y7Fghi7KYuOXmk6PhKTOAwIFDPQlb6Jsx554
Message-ID: <CAHp75VcX_z6q879gmWcb76SeFHtqMvpZ=y9PwNn0=eVFb06wAw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] iio: dac: ds4424: drop unused include IIO consumer header
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Guenter Roeck <linux@roeck-us.net>, Peter Rosin <peda@axentia.se>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Mariel Tinaco <Mariel.Tinaco@analog.com>, 
	Kevin Tsai <ktsai@capellamicro.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Eugen Hristev <eugen.hristev@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hansg@kernel.org>, 
	Support Opensource <support.opensource@diasemi.com>, Paul Cercueil <paul@crapouillou.net>, 
	Iskren Chernev <me@iskren.info>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Matheus Castello <matheus@castello.eng.br>, 
	Saravanan Sekar <sravanhome@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Casey Connolly <casey.connolly@linaro.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Amit Kucheria <amitk@kernel.org>, 
	Thara Gopinath <thara.gopinath@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 9, 2025 at 10:26=E2=80=AFAM Romain Gantois
<romain.gantois@bootlin.com> wrote:
>
> To prepare for the introduction of namespaced exports for the IIO consume=
r
> API, remove this include directive which isn't actually used by the drive=
r.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

