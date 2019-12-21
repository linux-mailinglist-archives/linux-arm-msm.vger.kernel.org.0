Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5422C128B92
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Dec 2019 21:59:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727367AbfLUU6M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Dec 2019 15:58:12 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:39481 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbfLUU6M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Dec 2019 15:58:12 -0500
Received: by mail-il1-f193.google.com with SMTP id x5so10988427ila.6;
        Sat, 21 Dec 2019 12:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3jTL5Hj/xPv508RnFe+kVEmXkwrPo1hzDrzVfSCYG04=;
        b=gx65rvbTwIqNbvAUWvrgMschImn6KdpsCA7elPq41Mf8JweOYDlwKep+lrsvElBLlO
         fLEv9miM37ojOHaw6Rz7qRNYQiRjv9bUDGFocv+BtYuBcK0c0LLG8/qO4mpNtt9rdlS5
         wXjua7wLHS3oeRSQdhyZzKoP3PWPKVMD/Z6bqlGdRAcdqPNN3+xaqmnDGvWSv7JLi8Rf
         RlpNzDQARdkHqfuSRG2DHxLekd8OOtIbgS+1LQUkLClKm1rweswDg22nXeOC6tBAtV+Q
         inHBRzFrCHUtGqtv9J7wYWaiUjnh+/4/7h9GgS50QB2cjg1kFEc/oxavP/xmFKT04uHm
         2TOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3jTL5Hj/xPv508RnFe+kVEmXkwrPo1hzDrzVfSCYG04=;
        b=K18OqhKje5iULktrP8L0XBQoY+87DWelUX2MThWAkhqzAn3yhrG6ckuzRXNoVFUb3S
         3ozSKuwP/5cAebR5D+HfcGQLJdJKZqfUtHi4rIbhtA3KgdMctxU1ZyuXZ+5wJWp5NCdz
         x4E04tJsk3/2uaQXInJl16/dfk/KfX8aNitHJHB0ZMzBS3CtlKJWXVj3lob/xHMCOUQC
         79czaV6GWY2FG/HN3ZQvSOfAGN6W7OQ9ftG6JeiMoHaxU10x4X5lHVL0fC6v+p3aJra2
         TFuYIKRl7Vw534R7LKFVAKikwS2xuhiDdmQGQKMpDraqFRHrt9D90iEek6t0i6KnEPQ1
         j2UQ==
X-Gm-Message-State: APjAAAXfjQFY1rcWCV49y133+RVnFG47kP5s0r37sX+QZlJGzHdSZ8dS
        1LhNdVZBcOUE10siqt+r1vQG6+xKTYgsF1/RroQ=
X-Google-Smtp-Source: APXvYqyc8NqYt53ySoRHrFd/M8DDGHoLrN3027yUv9fxIzSuHQmZzkpASAnzMZ47hx4Sb3w7l02oV0L828+X+AtId/k=
X-Received: by 2002:a92:2904:: with SMTP id l4mr19394612ilg.166.1576961891357;
 Sat, 21 Dec 2019 12:58:11 -0800 (PST)
MIME-Version: 1.0
References: <20191113232245.4039932-1-bjorn.andersson@linaro.org>
In-Reply-To: <20191113232245.4039932-1-bjorn.andersson@linaro.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Sat, 21 Dec 2019 13:58:00 -0700
Message-ID: <CAOCk7Nq_+fGh0QvMf4DDp6KLKk23F_FK1neDnioQYWgHXMj26w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: db845c: Enable ath10k 8bit host-cap quirk
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 13, 2019 at 4:23 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> The WiFi firmware used on db845c implements the 8bit host-capability
> message, so enable the quirk for this.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>

> ---
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index 12f5f14ada5c..7ec7b90ab83e 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -625,6 +625,8 @@
>         vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
>         vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
>         vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
> +
> +       qcom,snoc-host-cap-8bit-quirk;
>  };
>
>  /* PINCTRL - additions to nodes defined in sdm845.dtsi */
> --
> 2.23.0
>
