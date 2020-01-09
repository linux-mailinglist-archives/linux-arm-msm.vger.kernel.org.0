Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 449ED1352E6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2020 06:58:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725893AbgAIF6I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jan 2020 00:58:08 -0500
Received: from mail-vs1-f67.google.com ([209.85.217.67]:39417 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727949AbgAIF6F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jan 2020 00:58:05 -0500
Received: by mail-vs1-f67.google.com with SMTP id y125so3487008vsb.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2020 21:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2DjPx1eV8QPqDcx/sjKIxavtaGi+2Rmdyzg645rvwrI=;
        b=Dh0Q3XCsP8JwuJIY/YsgboRS+BQfU1j6Z3n8g/IjRVnL+ysomvfZeFLXAT/kwIjKnY
         O9+XWiunCbvfaklvqvMDu+wOpsVlnAIeVGR6lAnUXSulFNCxc8kk5p4QWd7cvUmtp68v
         eNBWjB+XmNZfoVvnvpBg5rEMLgvomBmINlHg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2DjPx1eV8QPqDcx/sjKIxavtaGi+2Rmdyzg645rvwrI=;
        b=WHB2q5Bs5eo2DlPe0C1Fu7JFS8u/1QY0qKr4P28+OBh9YXOP92YmNiqi9Lfl1VZ+Yl
         ypoeS7FH4298kArAIMMc0HS4NWZgOf80Cv/6ZnWrwmcCHPxux04Bh7W9OTzbRjpj63/g
         +Svb/Uc/8gSscJYFIkux7lkBpt74d/uf+YeJ7dZK60Xj76fsmh7vheW94py0qMbdeBdv
         mIt+M9A1TWwFGqnSEPt+v39sOPN75vREBLQphaPlGPer0CYIjMEpCLVTGxxd5P5JuPYm
         wAWlFyaFaxZQSmqFlaUub+0Xl1teTE1ri9/DkTzHUfDpzZRLu6LpEjTg61RTCmgNDx/h
         W/IA==
X-Gm-Message-State: APjAAAWj3JPmLF8LEPqTiPkjJTDpSHV1HO+9oxg/JvwJ/1kNwXMkT+La
        gnXO6XuozfG4QDbtIxBbJ00IM5+ce2M=
X-Google-Smtp-Source: APXvYqwurLwK7eeP5DCXAqRjwKsSuUQ9BnirlNNdNGR4aSJi/mv0KaIF4FrroA9V+62KcuLfbf8PQg==
X-Received: by 2002:a05:6102:1cc:: with SMTP id s12mr5066203vsq.91.1578549483828;
        Wed, 08 Jan 2020 21:58:03 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id w4sm1447363vsq.18.2020.01.08.21.58.02
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2020 21:58:02 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id 73so2069569uac.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2020 21:58:02 -0800 (PST)
X-Received: by 2002:ab0:724c:: with SMTP id d12mr5861475uap.0.1578549482261;
 Wed, 08 Jan 2020 21:58:02 -0800 (PST)
MIME-Version: 1.0
References: <20200108133948.1.I35ceb4db3ad8cfab78f7cd51494aeff4891339f5@changeid>
In-Reply-To: <20200108133948.1.I35ceb4db3ad8cfab78f7cd51494aeff4891339f5@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 8 Jan 2020 21:57:48 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XREb0zf=BxwKF7jGO7fwtwQaO+vR1giodsW+RkHZe_XQ@mail.gmail.com>
Message-ID: <CAD=FV=XREb0zf=BxwKF7jGO7fwtwQaO+vR1giodsW+RkHZe_XQ@mail.gmail.com>
Subject: Re: [PATCH] spi: spi-qcom-qspi: Use device managed memory for clk_bulk_data
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>, Mark Brown <broonie@kernel.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jan 8, 2020 at 1:40 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Currrently the memory for the clk_bulk_data of the QSPI controller
> is allocated with spi_alloc_master(). The bulk data pointer is passed
> to devm_clk_bulk_get() which saves it in clk_bulk_devres->clks. When
> the device is removed later devm_clk_bulk_release() is called and
> uses the bulk data referenced by the pointer to release the clocks.
> For this driver this results in accessing memory that has already
> been freed, since the memory allocated with spi_alloc_master() is
> released by spi_controller_release(), which is called before the
> managed resources are released.
>
> Use device managed memory for the clock bulk data to fix the issue
> described above.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
>  drivers/spi/spi-qcom-qspi.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

It's a little ugly, but it seems somewhat same.  Basically we're
saying that the caller of devm_clk_bulk_get() is in charge of keeping
the list of clocks readable for the devm free function.  Maybe we
should also fix devm_clk_bulk_get() to always make a copy of the
clocks so we can relax this limitation (though that's a lot of extra
copying for the uncommon case), but even if we do change that your
change would still be OK.

...so from my point of view:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

-Doug
