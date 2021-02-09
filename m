Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32CD6315AF4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 01:21:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234560AbhBJAS6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 19:18:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233495AbhBIX7b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 18:59:31 -0500
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D235C06174A
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Feb 2021 15:57:54 -0800 (PST)
Received: by mail-qk1-x730.google.com with SMTP id m144so4201568qke.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 15:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TdtR2ObDtnHnEVrfz7tz47hT4bnxiVSBcPaRN97Y2z0=;
        b=Z37ZSCVfnrdzHJlcQxambrv2IVUxmO36t08QaVgHJpcHifUvQweAcqyj1bBPsOYbpz
         Ba9mrqwj2B9058bxW+36D/5c4CdH1CBU5qRnpfZDddGYmMzNFWvdT4VUkvc5IkqhstZq
         WcPtF9tVjy4YZKHhXG+IO/Qq6g2e/ciX77+8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TdtR2ObDtnHnEVrfz7tz47hT4bnxiVSBcPaRN97Y2z0=;
        b=uMxPlHsawUNQCEMagQpKAPXnDyznEMKGP+LDEeN48J2OynUQNTJygPBWHmOqKC/J0Y
         zZyGN7OYQ8zk+wVwdvFhdkMcU13eLLSufkyn6VWF2XhiOf6VsW0spSaal6ILcMlIAtNY
         +pbhLkMYgAxZRTthUWR/u4JVMJ9DDIlxWSeXLxbXj+Y6+VxAkkCbNT1lAlwwvT6pH928
         ItwePPvw0WbalYm/x56WgxAVVDhJUvE25nCzPFEH7l5KElGJdjvJyiAvTY+gZqNhiKwu
         gUeoF8j7cUAmIS0MIvm0tGAbl2f5rzdY5hE1dW80PP/XMS+ckTv0M391dwJmSsHH+Nic
         WZwg==
X-Gm-Message-State: AOAM532R6Hr+IvdTAxQ1SUCPHEhwTFI5bo7TS/CrGm4QPStNzS27aYTw
        4Cby0+VTBGZHpit8j7rWXJeRCwHbM1182Q==
X-Google-Smtp-Source: ABdhPJymXC0pptSv0agTfMhy+LELOPJFsj54B/CIQTVeGi3HXGgX8x3HYFZYxgwql3H2VkKYx997VA==
X-Received: by 2002:a37:620f:: with SMTP id w15mr760700qkb.63.1612915073297;
        Tue, 09 Feb 2021 15:57:53 -0800 (PST)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id j66sm240679qkf.78.2021.02.09.15.57.52
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Feb 2021 15:57:52 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id p186so236087ybg.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 15:57:52 -0800 (PST)
X-Received: by 2002:a25:4fc3:: with SMTP id d186mr438899ybb.343.1612915071953;
 Tue, 09 Feb 2021 15:57:51 -0800 (PST)
MIME-Version: 1.0
References: <20210209202849.1148569-1-dmitry.baryshkov@linaro.org> <20210209202849.1148569-2-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210209202849.1148569-2-dmitry.baryshkov@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 9 Feb 2021 15:57:40 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WHfro-egVV7HH0ZC-1Q_jR2uN+Y0wXGEHXkt8Xjvwz-w@mail.gmail.com>
Message-ID: <CAD=FV=WHfro-egVV7HH0ZC-1Q_jR2uN+Y0wXGEHXkt8Xjvwz-w@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: sm8250: split spi pinctrl config
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Feb 9, 2021 at 12:29 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> As discussed on linux-arm-msm list, start splitting sm8250 pinctrl
> settings into generic and board-specific parts. The first part to
> receive such treatment is the spi, so split spi pinconf to the board
> device tree.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts |   5 +
>  arch/arm64/boot/dts/qcom/sm8250.dtsi     | 300 +++++------------------
>  2 files changed, 65 insertions(+), 240 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index 2f0528d01299..787da8ccba54 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -815,6 +815,11 @@ &pm8150_rtc {
>         status = "okay";
>  };
>
> +&qup_spi0_default {
> +       drive-strength = <6>;
> +       bias-disable;
> +};
> +

Optional nit that I personally prefer that all of the pinctrl stuff be
grouped together (with separate sorting) at the bottom of board device
tree files.  To me it's weird to mix them with peripheral enables.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
