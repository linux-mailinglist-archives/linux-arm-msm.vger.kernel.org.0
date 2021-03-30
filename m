Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09F9634F2F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 23:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232607AbhC3VTl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Mar 2021 17:19:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232465AbhC3VTb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Mar 2021 17:19:31 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADD39C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Mar 2021 14:19:30 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id h7so13026190qtx.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Mar 2021 14:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m6rFezdA5OJ9mTG164jTh973n/T9ArBSRkBvKYL1hbU=;
        b=F7orwkVqtDNCgPCQA7+jYbbqDLvKxYNea+LjGvci1d+v8BM3zK4cp7X7GMk1sm+Sp0
         zHMF4kvJWCe/Px6LUkBaeWTFEZD5PT5V94tmq58Kdm/Ypqt27jAWFNktBNRGoJlWpdS7
         /nQlLxzxXtPiz0sAL6LPHeCXWK1eU/D30Sens=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m6rFezdA5OJ9mTG164jTh973n/T9ArBSRkBvKYL1hbU=;
        b=bxYne1HWjocWqNb3y5gOZDJJ6RMMaH1tV2gqjCQYx2AiPj/KrCuUfdjZ9YylbJ5D86
         iAdNM3IstCzzNdaqJvXf08dNUqAfJX7FEhBtpieU7iCWpAz/QJf93Ql+aU8HvKJys3uY
         BGka6s7RJ25DJJa1HS6M/XBYQWQS9oVQcYI3Ar7wLJBBJ+URgZbnM7rgVwl+ij+Vvxbv
         IgZ1x7p27JIiX86nLb0tuFTxo2ipnMlgmF/hiB+NVvnMnv8bBYLBxFubNWzskTXn2CXI
         GmqkVZ6b0nThgAry7zLsj4ZDWK2bXIJ2X3g4+ckejVjSHjePEl6R2snAdrFxhVY/bjr9
         H+7A==
X-Gm-Message-State: AOAM532mFGcIev9QkCSYF//TEY2dmlLIXPXMMENOuJeMCRGEd2F1EVma
        XfzCsRS0kWuuXjg7RqLPoNENRM6INwxn+g==
X-Google-Smtp-Source: ABdhPJxpkmy0JuyPB3w08rCkaGY97SUdgAcYf9gh0xkQMIDeClF7+Ol+jwc2S9JJJjCm/xlFK8OIhg==
X-Received: by 2002:a05:622a:1648:: with SMTP id y8mr21083992qtj.51.1617139169159;
        Tue, 30 Mar 2021 14:19:29 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id n24sm151004qtr.21.2021.03.30.14.19.27
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 14:19:27 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id i144so18902945ybg.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Mar 2021 14:19:27 -0700 (PDT)
X-Received: by 2002:a25:2f4b:: with SMTP id v72mr238021ybv.79.1617139166929;
 Tue, 30 Mar 2021 14:19:26 -0700 (PDT)
MIME-Version: 1.0
References: <1616651056-11844-1-git-send-email-rnayak@codeaurora.org> <1616651056-11844-2-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1616651056-11844-2-git-send-email-rnayak@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 30 Mar 2021 14:19:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VT6xUmUK7Kss8cpF1wjw9tLx67wJMtiV6yTDaVYXXrqA@mail.gmail.com>
Message-ID: <CAD=FV=VT6xUmUK7Kss8cpF1wjw9tLx67wJMtiV6yTDaVYXXrqA@mail.gmail.com>
Subject: Re: [PATCH 2/2] nvmem: qfprom: Add support for fuse blowing on sc7280
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Ravi Kumar Bokka <rbokka@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Mar 24, 2021 at 10:45 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> @@ -111,6 +113,15 @@ static const struct qfprom_soc_compatible_data sc7180_qfprom = {
>         .nkeepout = ARRAY_SIZE(sc7180_qfprom_keepout)
>  };
>
> +static const struct nvmem_keepout sc7280_qfprom_keepout[] = {
> +       {.start = 0x128, .end = 0x148},
> +       {.start = 0x238, .end = 0x248}
> +};
> +
> +static const struct qfprom_soc_compatible_data sc7280_qfprom = {
> +       .keepout = sc7280_qfprom_keepout,
> +       .nkeepout = ARRAY_SIZE(sc7280_qfprom_keepout)
> +};
>  /**

nit: blank line between structure and comment?


> @@ -187,9 +199,9 @@ static int qfprom_enable_fuse_blowing(const struct qfprom_priv *priv,
>          * a rail shared do don't specify a max--regulator constraints
>          * will handle.
>          */
> -       ret = regulator_set_voltage(priv->vcc, 1800000, INT_MAX);
> +       ret = regulator_set_voltage(priv->vcc, qfprom_blow_uV, INT_MAX);
>         if (ret) {
> -               dev_err(priv->dev, "Failed to set 1.8 voltage\n");
> +               dev_err(priv->dev, "Failed to set %duV\n", qfprom_blow_uV);

nit: the comment above this block (not in the unified diff)
specifically calls out 1.8V. It'd be nice if you updated the comment
since it's no longer fixed at 1.8V.


> @@ -379,6 +399,8 @@ static int qfprom_probe(struct platform_device *pdev)
>
>                 if (major_version == 7 && minor_version == 8)
>                         priv->soc_data = &qfprom_7_8_data;
> +               if (major_version == 7 && minor_version == 15)
> +                       priv->soc_data = &qfprom_7_15_data;

nit: "else if" instead of "if"?


I guess I'm a little late since I think this already got applied, but
all the above are nits. Maybe you could send a follow-up patch to
address them?

-Doug
