Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DECC1FFC52
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2020 22:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730872AbgFRUKF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 16:10:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730342AbgFRUKC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 16:10:02 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1162C0613ED
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 13:10:01 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id q2so4307791vsr.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 13:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FSwUDJQJDD2aFeE7AG8B7gwG/F8HVyWOYHj+N8WDvHg=;
        b=koJMedVIB9/8FYoo3ICOMGrEkn7oiQpS3inzL5oZp6a4TYfZL5WhLQ8L8SZyqrFEv2
         C3h4FeUJMoRd4JAHQg4d1XaqgoFcDrm+Tg4iDinifrhpHEjDK6Rvwk5cFrynYYQGvLAH
         j6uk3LzHMuSgjFsiG7c2h95oQfFiTEd2dihgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FSwUDJQJDD2aFeE7AG8B7gwG/F8HVyWOYHj+N8WDvHg=;
        b=qD2eC3qCwa58e0IhXQb2yOVI2eRugHd0dRJsJjC1vl17tc/ujRCz6dG8f7tx4vmmLy
         1f6sTK3vjAmY7NCY0HSD7WCgg6dQJDSzRAgevPEzVftwc7uc1cPEa2Y35XcOFxWad0Qw
         V97GovsUCLCbdIv1Xs+aNoZ8QjQg+tQevQA2f3OyXqhrAHg+gRRoaJSffsKXFEAjDMVP
         7e8RfDUOi9innDmNOE7Lfjux9yE0ZuSJ094O2DC5UJSAmrsnZjtgkDdLrPttlUX71LDj
         ePJx7byd92PTwRVt6ZSdCi5BJQmJ8opWUtsQMMPSvMz2xWDh7LqmhXntuqgbFFPpIZmn
         7KKw==
X-Gm-Message-State: AOAM531J7NjC6wpP4/i124cowVchHqrqdT6dVC/N29l2W634lmTWJlDj
        zJHDXZY0wMuMI4DxjrbiUDtG12cAvc4=
X-Google-Smtp-Source: ABdhPJwnF8hJ8yNBKDWUbakow0xCe3X62B76GdvYsF4twl6CROOGRlIySWUcaOp0jMmLBf6TKh2xrA==
X-Received: by 2002:a67:28c2:: with SMTP id o185mr4956920vso.21.1592511000406;
        Thu, 18 Jun 2020 13:10:00 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id h16sm461618vkk.51.2020.06.18.13.09.59
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 13:09:59 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id m25so4295336vsp.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 13:09:59 -0700 (PDT)
X-Received: by 2002:a67:8881:: with SMTP id k123mr5031158vsd.198.1592510998962;
 Thu, 18 Jun 2020 13:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200618150626.237027-1-dianders@chromium.org>
 <20200618080459.v4.5.Ib1e6855405fc9c99916ab7c7dee84d73a8bf3d68@changeid> <159250352382.62212.8085892973272354046@swboyd.mtv.corp.google.com>
In-Reply-To: <159250352382.62212.8085892973272354046@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 18 Jun 2020 13:09:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xh3+cROZC8dCn99MLkngsyBcxq+Gv1CERayZXExwdygA@mail.gmail.com>
Message-ID: <CAD=FV=Xh3+cROZC8dCn99MLkngsyBcxq+Gv1CERayZXExwdygA@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] spi: spi-geni-qcom: Don't keep a local state variable
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Alok Chauhan <alokc@codeaurora.org>, skakit@codeaurora.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jun 18, 2020 at 11:05 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2020-06-18 08:06:26)
> > @@ -126,20 +120,23 @@ static void handle_fifo_timeout(struct spi_master *spi,
> >         struct geni_se *se = &mas->se;
> >
> >         spin_lock_irq(&mas->lock);
> > -       reinit_completion(&mas->xfer_done);
> > -       mas->cur_mcmd = CMD_CANCEL;
> > -       geni_se_cancel_m_cmd(se);
> > +       reinit_completion(&mas->cancel_done);
> >         writel(0, se->base + SE_GENI_TX_WATERMARK_REG);
> > +       mas->cur_xfer = NULL;
>
> BTW, is this necessary? It's subtlely placed here without a comment why.

I believe so.  Now that we don't have the "cur_mcmd" we rely on
cur_xfer being NULL to tell the difference between a "done" for chip
select vs. a "done" for transfer.

* When we start a transfer we set "cur_xfer" to a non-NULL pointer.
When the transfer finishes we set it to NULL again.

* When we start a chip select transfer we _don't_ explicitly set it to
NULL because it should already be NULL.

* When we are aborting a transfer we need to NULL so we can handle the
chip select that will come next.

I suppose it's possible that we could get by without without NULLing
it because I believe when the "abort" IRQ finally fires then it will
include a "DONE" and that would presumably NULL it out.  ...but I
guess if both the cancel and abort timed out and no IRQ ever fired
then nothing would have NULLed it and the next chip select would be
confused.

Prior to getting rid of "cur_mcmd" this all wasn't needed because
"cur_xfer" was only ever looked at if "cur_mcmd" was set to
"CMD_XFER".


One part of my change that is technically not related to the removal
of "cur_mcmd" is the part where I do "mas->tx_rem_bytes =
mas->rx_rem_bytes = 0;".  I can split that as a separate change if you
want but it seemed fine to just clean up this extra bit of state here.

-Doug
