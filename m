Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C8E7489C0B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jan 2022 16:20:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236041AbiAJPUb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jan 2022 10:20:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232994AbiAJPUa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jan 2022 10:20:30 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9642DC06173F
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jan 2022 07:20:29 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id l16-20020a17090a409000b001b2e9628c9cso253016pjg.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jan 2022 07:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YhOkwvN+JNRotrpW0fv3ijfTotqbTtsEq7tjOfpfCHo=;
        b=QXGSXvrkb3JbxSxuMwvWI6+FFCmE+0Nspd6gu5NaeQgoAdyhw6OrbSM9RkvwAWE0s8
         x/8jv170TaCykOmyr9rPPqf800N3e3JzqY8ZAa55mhN4VZudY3+pCICLZB3w/56e/I3K
         1dCJNvbBuYTOBZ8gMo53uRmN+Xn30VyhNM+O4RlB7tcVlSqV5JOKracPRBoflmU/6oux
         bifLXYs0/xCHbN6W+v2umnLs1sMmP+JaeQppoZFxoqrNqb9nDFxqKAnK6uNh3/KIPs1a
         9MAFy7pqZ0UdxKcSyF5PRQbW4Iqg8h1akmxcEheJ4QfRy5ypHDncfsvab3E1u13Cdyw2
         Ec3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YhOkwvN+JNRotrpW0fv3ijfTotqbTtsEq7tjOfpfCHo=;
        b=gNdxf0rg2pFIoN1yljaAkbEIb+0UHmuQqfUUyuFqvn/QNARu8IwR8HPVv+EuAPhpsA
         fXWlUhBHhBUHPOyxsviza/bCnsXvtEzQo15jfCp8dKXPKm0md93csRjAAlpxfztjn9hd
         jZRlS5pwq7LekO5KPMAm+jhvWDsaq5+Ia+rPfHGNiuhf0+UUvGDN9yVDJ1C7u5tYTL9b
         //6Q9BAV5bP5yUCGJPaTiO4wHdLXZK68doKUFbhmo7H5QIBJguWnmxruZtf8vgg/bKJt
         tfQrJ/GBJ1fUAgsHP6cv3BJ7lIW0ho1q1syNncI9tZwEjlk0dqjTClaF4EL3v3kHf8oH
         SMng==
X-Gm-Message-State: AOAM530QzSWUVKnZJ2oGfPgQ9Xxb28VGJHvYgpwCF6C+QsSdgwDH6Swh
        e/xKbB7xfkIPpJZno/ctvzQD5QbMs64UMZq5FsG5rQ==
X-Google-Smtp-Source: ABdhPJxt7uXbegg7UXSeADgeFRtTlEG4m028xu+UGRqpI5jZHW0cpSUyY8R0FHcxyf0Xqr5J2o5oonavUuZ9nmv82W8=
X-Received: by 2002:a17:90b:4b0f:: with SMTP id lx15mr178246pjb.232.1641828029067;
 Mon, 10 Jan 2022 07:20:29 -0800 (PST)
MIME-Version: 1.0
References: <20220109024910.2041763-1-bryan.odonoghue@linaro.org> <20220109024910.2041763-9-bryan.odonoghue@linaro.org>
In-Reply-To: <20220109024910.2041763-9-bryan.odonoghue@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 10 Jan 2022 16:20:18 +0100
Message-ID: <CAG3jFysUYgde=Wc0E1KgogT+PZCHST2HLuhjbvSjWTXQmjO8BQ@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] media: camss: Point sm8250 at the correct vdda regulators
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, jonathan@marek.ca,
        andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, jgrahsl@snap.com,
        hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 9 Jan 2022 at 03:47, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Reviewing the RB5 schematic its clear that we have missed out on defining
> both of the power-rails associated with the CSI PHY.
>
> Other PHYs such as the UFS, PCIe and USB connect to these rails and define
> each regulator individually.
>
> This means if we were to switch off the other various PHYs which enable
> these rails, the CAMSS would not appropriately power-on the CSI PHY.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 859b397912cc8..a2f97311f7606 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -723,7 +723,7 @@ static const struct resources csiphy_res_8250[] = {
>  static const struct resources csid_res_8250[] = {
>         /* CSID0 */
>         {
> -               .regulators = { NULL },
> +               .regulators = { "vdda-phy", "vdda-pll" },
>                 .clock = { "vfe0_csid", "vfe0_cphy_rx", "vfe0", "vfe0_areg", "vfe0_ahb" },
>                 .clock_rate = { { 400000000 },
>                                 { 400000000 },
> @@ -735,7 +735,7 @@ static const struct resources csid_res_8250[] = {
>         },
>         /* CSID1 */
>         {
> -               .regulators = { NULL },
> +               .regulators = { "vdda-phy", "vdda-pll" },
>                 .clock = { "vfe1_csid", "vfe1_cphy_rx", "vfe1", "vfe1_areg", "vfe1_ahb" },
>                 .clock_rate = { { 400000000 },
>                                 { 400000000 },
> @@ -747,7 +747,7 @@ static const struct resources csid_res_8250[] = {
>         },
>         /* CSID2 */
>         {
> -               .regulators = { NULL },
> +               .regulators = { "vdda-phy", "vdda-pll" },
>                 .clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",  "vfe_lite_ahb" },
>                 .clock_rate = { { 400000000 },
>                                 { 400000000 },
> @@ -758,7 +758,7 @@ static const struct resources csid_res_8250[] = {
>         },
>         /* CSID3 */
>         {
> -               .regulators = { NULL },
> +               .regulators = { "vdda-phy", "vdda-pll" },
>                 .clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",  "vfe_lite_ahb" },
>                 .clock_rate = { { 400000000 },
>                                 { 400000000 },

Reviewed-by: Robert Foss <robert.foss@linaro.org>
