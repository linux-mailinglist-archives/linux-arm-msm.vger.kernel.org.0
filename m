Return-Path: <linux-arm-msm+bounces-84088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3F0C9BB5E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 15:07:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 70CBB4E3792
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 14:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C50D322A15;
	Tue,  2 Dec 2025 14:07:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB0E315D27
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 14:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764684439; cv=none; b=napiGu4m/nzbPDRyLg3KcENOA7WoaQdJd5j8zz25Hs+BUe2ZZlp+c4Woky/CXpMbnt/xAhMsgpr+FWfSsxmp+WEpM6M4eZ6FlKOdHkKKhujDGkv0ulqI+zNs/nzwC3yukaKReuurxv6MnNh35omLGs3DE3ho+kmQOaUiDy8vDq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764684439; c=relaxed/simple;
	bh=vHUrQ6w324fYnCNxiHl4mdFInNGEkkrZLMojf3dBXGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=keJWN9CllgCoX81yBw2ax7G83LqsMDNpReJ6kz9jsrFtGwEFvxtoUZRJ5swqvbIrvicDkT+0eva1H1qy9LOE6O04/YrGJ4HHygk26zqqZwqUcWSDiZ/UapWG2/NVihuijRixpsQ+6aH/yCOYYcd6P5M8MEmtPsvW9E19Joj7Mpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7881b67da53so51713987b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 06:07:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764684436; x=1765289236;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P35uIC8+DPfTCMfHgmdtX7Glr2h/6n9nJWKZMAhyHf0=;
        b=nWabtv5w7PUnVL76s+eygu1nnGLoYkEnOC7ZXEG8C9wRzGNzE0+PAk3wf45PaAewhz
         hFLodGGumuYE4gyUljVoGXTJFnX8EHfjtUfHtJNyT1biLzUChwtZVIbHwRiierIfyrbK
         OpAwVHa+fyUrZH4iWSFybU5dWF7904mDrOnolEGnde7q7q8cd06n3b84LyX2hlUoheU+
         zD9zFVcenO/bvV5469WKJ5hruLx8d53GzBLKz7WEGfCD4sCFKFHwrNkgYjB0eSuOVzW4
         MuSpxXo8jQmG3DehtwWyShaX1Nw9HtMYOpEFmsdVOJWFNbKi0VAi5cX+duUQmYQBWyGB
         pjDw==
X-Forwarded-Encrypted: i=1; AJvYcCVwvOZCh0pkb6DXwNc9q0CTVsvt4TjRYWUZ6qaLPvYV5eru8qECNivJ5Tym7AUCGyHBzzg1gbULW0cfHhh8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw559tqq1qnNLtLZ7mAlCC9jVitN5+enG3UsgoilhCeOxm0bfZ0
	uWVojLxg0mDdijYgWsu+V+E9FQWTl8ZYXsxAogq5ZbFgZ3WLYMtThxaC2JVErNXd
X-Gm-Gg: ASbGncsqPSOd8vj4A4bNPMrPTpZ1bdj8MDyPi+VrEEwCsCq9YYYtz6KqWCjMUxSSx6/
	GkHFXmA7cDmTJTsZ7NvMZUHNtFg76qsGHtBF4aLJN3XpDZzvjSHbBjljtkh2+aqYBP+Wp7n2Fgp
	N0O4ebxRiM5w870etz2oGtHBinry4WgqVmE+Us57LlN8CHrwVCdZ2J6Qc0Zgi/qBxdOLJ1yw98d
	+I4F4P6edIchqlP6bJbKqJrJw1PxH+JoPkPzIHiSYwplbS8oeOwiocMLoBHK+RV1p2LqCRpKbPS
	BszB4BTvHznDgA26cwR9C8uK16ZZnavhLxkjm24HOFx8oOxoYObkGnOdRlXixeJhx5cdEzBWpZ8
	MNeMJxavNJHEtyMrkeC46UFwCarYbTXbBc8UieokyXgSHUNKpxG9X9ug+KFdGQcBGTQx7EPA3UR
	v9x0gH18XsP5+031jYPShelnKqlZAkwKd4lnzLhqyGMY3Ax22Z
X-Google-Smtp-Source: AGHT+IEyVOYkx994bZNIfI3lmDHzCHwwCpk1ZPA2sjbWGidznKNBwSaBEmxqfHE/Lr2cmiupEO/ckQ==
X-Received: by 2002:a05:690e:4282:10b0:640:fdbc:6cf2 with SMTP id 956f58d0204a3-64302ab97f8mr24586338d50.53.1764684436218;
        Tue, 02 Dec 2025 06:07:16 -0800 (PST)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com. [74.125.224.46])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78ad1044f9esm62974347b3.56.2025.12.02.06.07.15
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 06:07:15 -0800 (PST)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6420dc2e5feso4336820d50.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 06:07:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXXro+oobbaopMs1gJoM7NFVoGoiaxX1QWpZD/IWaSdRyRL58SlTXyweJyTKNke4o7VCPk//XJeZqF/XwiF@vger.kernel.org
X-Received: by 2002:a53:dd48:0:b0:63e:17d8:d977 with SMTP id
 956f58d0204a3-64302abbb9cmr22209916d50.41.1764684434875; Tue, 02 Dec 2025
 06:07:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org> <20251112-b4-of-match-matchine-data-v2-1-d46b72003fd6@linaro.org>
In-Reply-To: <20251112-b4-of-match-matchine-data-v2-1-d46b72003fd6@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Dec 2025 15:07:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVAZpp7M+pp27+kHZwoet2Q8Rm-Y4ePu7=W_1oXhebLmQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnQtK_C28o8ts-DX6QMHSfgR5FWBqGmuyp3cjxdu41cx4XkoPs5W_lQhYE
Message-ID: <CAMuHMdVAZpp7M+pp27+kHZwoet2Q8Rm-Y4ePu7=W_1oXhebLmQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] of: Add wrappers to match root node with OF
 device ID tables
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for your patch, which is now commit 4a93adcbd201aad5
("of: Add wrappers to match root node with OF device ID tables")
in dt-rh/for-next.

On Wed, 12 Nov 2025 at 11:30, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Several drivers duplicate same code for getting reference to the root
> node, matching it against 'struct of_device_id' table and getting out
> the match data from the table entry.
>
> There is a of_machine_compatible_match() wrapper but it takes array of
> strings, which is not suitable for many drivers since they want the
> driver data associated with each compatible.
>
> Add two wrappers, similar to existing of_device_get_match_data():
> 1. of_machine_device_match() doing only matching against 'struct
>    of_device_id' and returning bool.
> 2. of_machine_get_match_data() doing the matching and returning
>    associated driver data for found compatible.

Shouldn't the first function be called of_match_machine(), and return
a const struct of_device_id *, cfr. of_match_device()?

>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -434,6 +434,53 @@ bool of_machine_compatible_match(const char *const *compats)
>  }
>  EXPORT_SYMBOL(of_machine_compatible_match);
>
> +/**
> + * of_machine_device_match - Test root of device tree against a of_device_id array
> + * @matches:   NULL terminated array of of_device_id match structures to search in
> + *
> + * Returns true if the root node has any of the given compatible values in its
> + * compatible property.
> + */
> +bool of_machine_device_match(const struct of_device_id *matches)
> +{
> +       struct device_node *root;
> +       const struct of_device_id *match = NULL;
> +
> +       root = of_find_node_by_path("/");
> +       if (root) {
> +               match = of_match_node(matches, root);
> +               of_node_put(root);
> +       }
> +
> +       return match != NULL;
> +}
> +EXPORT_SYMBOL(of_machine_device_match);
> +
> +/**
> + * of_machine_get_match_data - Tell if root of device tree has a matching of_match structure
> + * @matches:   NULL terminated array of of_device_id match structures to search in
> + *
> + * Returns data associated with matched entry or NULL
> + */
> +const void *of_machine_get_match_data(const struct of_device_id *matches)
> +{
> +       const struct of_device_id *match;
> +       struct device_node *root;
> +
> +       root = of_find_node_by_path("/");
> +       if (!root)
> +               return NULL;
> +
> +       match = of_match_node(matches, root);
> +       of_node_put(root);
> +
> +       if (!match)
> +               return NULL;
> +
> +       return match->data;
> +}
> +EXPORT_SYMBOL(of_machine_get_match_data);

These two functions are very similar, but look different.  If the
former would return a pointer instead of a bool, the latter could be
built on top.

Even if you still prefer returning a bool, they could share a common
private helper returning a pointer.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

