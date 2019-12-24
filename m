Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40B5C12A209
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2019 15:17:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbfLXORU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Dec 2019 09:17:20 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:35002 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726128AbfLXORU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Dec 2019 09:17:20 -0500
Received: by mail-ed1-f65.google.com with SMTP id f8so18061146edv.2;
        Tue, 24 Dec 2019 06:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OwIM/6cz60aNzrhaQrqrMVGzhfDf7WlhxDj7li/s5F8=;
        b=I5YXx13f5Qp5fHQV6xCwP7z5y+V1kYpSkwJT/YEKyKWi+z2WLsImzP25a2CBbcYxNq
         RGBBzVz7jkkhHx3Flu9Fx5JOFBt106W50i0N9H9OZitpzvAFEhekbALhRNGkWSxE4chM
         ZqKv9jx4zNHJ4UZuS6mgNZbxDOd547G3b/+NQOGx1PIaWf5LbxqlE1dSndCcUFSp2oLZ
         cx/DKhtNLG6kmwJX2KDClt4zB5UnEb/DDI43yqkkSs8S6c4bq/126QvadErid7s/NFgQ
         4uOc/o6ySAsh+DyHGaVOjUYLdmWhuOK25beRRG4Nov7LL4BEWY6MiLy8Jkpvbg7zoEja
         t1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OwIM/6cz60aNzrhaQrqrMVGzhfDf7WlhxDj7li/s5F8=;
        b=RaOiBhjWqo6tA0BYG8nhQ029Yfeg0VtB4A/ydgXnZAeAuTnujU06RDcH7gwE4Ftmji
         FJnR65BmhfBPNbnfJDjQqMyXl9Iol2JuVGqYVWXxdmLEUY65z/g/WogZh0M1weF3+s8O
         S3tOS68bxEDMIOFdau+V9I+VQk0vZwDlHhvghcbh67PPLkpaZT37FUBPZP8i+a7WuBGX
         UhdfZ96w8NI0jD43FIEwG2Zp1AvR3Pk9ceUW6/LG2uOJsW7eZN4WmobzBHpspNFDFuOx
         wYdnhEzcIgLRoQG8S61vn/uhKVaEtyqr5M27C3x+99eI/PFDr9b1ZdajID/+6xqDseO4
         g/dA==
X-Gm-Message-State: APjAAAX1mubz/GewpgZieoGEF0WmG4KTn7Zzs13EGyBirebKKJravqMo
        /KiX3Xk9Gi/IhCh2vURpsZDLzryjGiB/irqc9dM3J4uOkwM=
X-Google-Smtp-Source: APXvYqz/P0UqlYNNcPT+eGRq4v7AomIRC1X88sjHfSUfWMqRof8CiIRHZ5X0mHE2TUrGwossoMwGRKtg9kLH9FiPC3g=
X-Received: by 2002:a50:f704:: with SMTP id g4mr38811179edn.123.1577197038209;
 Tue, 24 Dec 2019 06:17:18 -0800 (PST)
MIME-Version: 1.0
References: <20191015103221.51345-1-kholk11@gmail.com> <20191015103221.51345-3-kholk11@gmail.com>
In-Reply-To: <20191015103221.51345-3-kholk11@gmail.com>
From:   Vladimir Oltean <olteanv@gmail.com>
Date:   Tue, 24 Dec 2019 16:17:07 +0200
Message-ID: <CA+h21hpmeMhKWeAMLZP1wr+OXUubUPADDH164geDwZ0BaR_0aQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: clock: Document MSM8976 gcc compatible
To:     kholk11@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, mturquette@baylibre.com,
        agross@kernel.org, bjorn.andersson@linaro.org, marijns95@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Angelo,

On Tue, 15 Oct 2019 at 14:42, <kholk11@gmail.com> wrote:
>
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
>
> Document the Global Clock Controller driver (gcc-msm8976)
> compatible string.
> This driver is valid for MSM8976, MSM8956 and APQ variants.
>
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,gcc.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.txt b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
> index d14362ad4132..565bba5df298 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.txt
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
> @@ -15,6 +15,7 @@ Required properties :
>                         "qcom,gcc-msm8974"
>                         "qcom,gcc-msm8974pro"
>                         "qcom,gcc-msm8974pro-ac"
> +                       "qcom,gcc-msm8976"
>                         "qcom,gcc-msm8994"
>                         "qcom,gcc-msm8996"
>                         "qcom,gcc-msm8998"
> --
> 2.21.0
>

You should respin this 2-patch series because qcom,gcc.txt was
converted to qcom,gcc.yaml and this patch no longer applies.

Thanks,
-Vladimir
