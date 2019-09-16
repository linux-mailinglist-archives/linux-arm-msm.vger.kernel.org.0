Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A43ACB4141
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2019 21:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728105AbfIPTnP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Sep 2019 15:43:15 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40882 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727577AbfIPTnP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Sep 2019 15:43:15 -0400
Received: by mail-pf1-f195.google.com with SMTP id x127so537272pfb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Sep 2019 12:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:from:subject:user-agent:date;
        bh=WLp+GPttGVxHZ4bc1E597l7UcWrj5/s8colAd/Zrf1E=;
        b=HGBAC2LzEi2bY7Z5K1cpZPh8ExkzEXavrfUP/mkdESNHmIDONxGqHmbtiXYrdIS+dt
         GZX7uhRA3ZPgYGD2tzXp2i/JLavp1eAt+gwRUkef0S2ToGnZEXw7ID0TeV0i1C6LiYdO
         DUjHMhgwnt3lWZcw7w2FJs7Yl/+tGsBPcK6Nk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:date;
        bh=WLp+GPttGVxHZ4bc1E597l7UcWrj5/s8colAd/Zrf1E=;
        b=gDy34o+3jddBvxeaVlCxfSxCurgPGwI4dYHpuwsN1aiQvNyupxdEG+ViM+NIMYXlot
         l3qTA5Mn+C78T8pASjLT1jpRS+PS0fv/AJupEW/pWx6GEe5uKPXLlyosfgZlQNFkUXhh
         JOtGySz+QGgCgyygmZvkGvQnl7o/ng3DLAsjG/kH96746ntFk3w31+p4Yi6OOIXa7xQn
         jtFl6QPcq7jVSX07xmA2dgPbR29sCcgAyOdxt1MWwHLX4iORIu+rUhsxuhHwFLKigcpT
         s7V+Z79DMi5foroc6cG8QGB6Ct8GvoWm33QJqdBXJrepfa0axwF23yf0B/IH6Esx8KZ7
         ircg==
X-Gm-Message-State: APjAAAW0QwZ4zT5K6TMx2CujXOOpI0uaOUk/IS0B27uy5FxTrYSANNjX
        S3Vryp9qDMASrkdg5Lfj7Yz8bT94YIc=
X-Google-Smtp-Source: APXvYqztr3q/MYD/JI7oKNOvIkdW3WzYP90VrrLrD5c3imzhZHsZTjDfElpIe6ZmcRnXlO+zX1iUZQ==
X-Received: by 2002:a62:8c97:: with SMTP id m145mr9801pfd.241.1568662994612;
        Mon, 16 Sep 2019 12:43:14 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id em21sm372496pjb.31.2019.09.16.12.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 12:43:13 -0700 (PDT)
Message-ID: <5d7fe5d1.1c69fb81.eca3b.1121@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190912091019.5334-1-srinivas.kandagatla@linaro.org>
References: <20190912091019.5334-1-srinivas.kandagatla@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        andy.gross@linaro.org, bjorn.andersson@linaro.org
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] soc: qcom: socinfo: add missing soc_id sysfs entry
User-Agent: alot/0.8.1
Date:   Mon, 16 Sep 2019 12:43:11 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivas Kandagatla (2019-09-12 02:10:19)
> looks like SoC ID is not exported to sysfs for some reason.
> This patch adds it!
>=20
> This is mostly used by userspace libraries like SNPE.

What is SNPE?

>=20
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/soc/qcom/socinfo.c | 2 ++
>  1 file changed, 2 insertions(+)

Hmm I wasn't aware this driver was merged.

>=20
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index 8dc86a74559b..876a3f6612a3 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -422,6 +422,8 @@ static int qcom_socinfo_probe(struct platform_device =
*pdev)
>         qs->attr.family =3D "Snapdragon";
>         qs->attr.machine =3D socinfo_machine(&pdev->dev,
>                                            le32_to_cpu(info->id));
> +       qs->attr.soc_id =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "%u",
> +                                        le32_to_cpu(info->id));
>         qs->attr.revision =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "%u.=
%u",
>                                            SOCINFO_MAJOR(le32_to_cpu(info=
->ver)),
>                                            SOCINFO_MINOR(le32_to_cpu(info=
->ver)));
