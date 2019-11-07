Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92C6AF3AF4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 23:12:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbfKGWMW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 17:12:22 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:38789 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbfKGWMW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 17:12:22 -0500
Received: by mail-il1-f193.google.com with SMTP id e16so2369982ilc.5;
        Thu, 07 Nov 2019 14:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4atNbgDLmKMazfSxxisgoZS7lfKrqITnqizdUixKaGc=;
        b=ozwR/TfDYSXsake+S/cuZ0MglFqRuWiqz5U+H2NctB/zFIabtvUM829RufCGiHV74k
         iicgI11/bHrDp9DKdjCa+ifHP+4osNiD6syGwWvcHnAOk2O0hWIpf7Vcxq/IH4mOtzaW
         gf1qnm/5wOiCv03iMSHr8mfyENoR6AxDjZGPhVUwjRxeNcVAJOwHQ7aDVZwGK8RK9XkJ
         JPM44UmKQQxH2WRpU1BZDnU9uc+TEfbbTFVt4FceVOv/Z/CsLu2PZe1Z+fQS2cBHmRrS
         QIq6tk0JIhoMwthacpysQqxN/PBLu3w5ECSb+Poc9eUsRwyLpvBZsEAstydHdvVbhGAl
         +Jqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4atNbgDLmKMazfSxxisgoZS7lfKrqITnqizdUixKaGc=;
        b=XkaHBm8lFw/tjhn4xfK4nGz7e95ij2b96tP4Q7Ni3orst/wL6MilBM2C+GDjEkRLL5
         YHhLvOKhKeXUO0o6/lCv37Br1SK041g6tCcXsvoyIkOT57TFkFoZreYr7aWazVTTR91y
         spGLjJVXdGJTB7nwO8ZDvikeMRLcJuyOhIOwLoFK2NNjpXuPU8pHkFTFPcKmjPvTirHI
         hN1hjNDNa+Cy+9qLoLXZ/evWJuhXGX4neAaO6T8ednqkjrWU29GAKWNUou2+2N2RWSKy
         bcoPuh2YC2x7wvZwbW/9hP9QxgoSdm5M5byWQ7YY0z8FTp8Cs3VUygA5cH64dyC2UtrY
         DnWg==
X-Gm-Message-State: APjAAAUrQClIFG6FY47rsD87ICnAOT1e6Y47EAy7FAZConLBp5zhkImz
        BBT3nrjVBGLj3/kcw9juLyH/mehKLRhuwjMb7Hk=
X-Google-Smtp-Source: APXvYqzajhUKf45zxJC6CkimOq2IUGILgAemh9w85AKhTG1z7ufc/+Zg3CUP3W7OBBR4vdgfd6wk0vZqKLEJKeggPdY=
X-Received: by 2002:a92:1d51:: with SMTP id d78mr8149508ild.166.1573164741036;
 Thu, 07 Nov 2019 14:12:21 -0800 (PST)
MIME-Version: 1.0
References: <20191031185538.15402-1-jeffrey.l.hugo@gmail.com>
 <20191031185715.15504-1-jeffrey.l.hugo@gmail.com> <20191107214352.8A82E2166E@mail.kernel.org>
In-Reply-To: <20191107214352.8A82E2166E@mail.kernel.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Thu, 7 Nov 2019 15:12:09 -0700
Message-ID: <CAOCk7NrHyY0+tF=90Z1WDa7VpgehDY7kHiqcR6g8K_P_uRpRQw@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] clk: qcom: Allow constant ratio freq tables for rcg
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        MSM <linux-arm-msm@vger.kernel.org>, linux-clk@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 7, 2019 at 2:43 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Jeffrey Hugo (2019-10-31 11:57:15)
> > Some RCGs (the gfx_3d_src_clk in msm8998 for example) are basically just
> > some constant ratio from the input across the entire frequency range.  It
> > would be great if we could specify the frequency table as a single entry
> > constant ratio instead of a long list, ie:
> >
> >         { .src = P_GPUPLL0_OUT_EVEN, .pre_div = 3 },
> >         { }
> >
> > So, lets support that.
> >
> > We need to fix a corner case in qcom_find_freq() where if the freq table
> > is non-null, but has no frequencies, we end up returning an "entry" before
> > the table array, which is bad.  Then, we need ignore the freq from the
> > table, and instead base everything on the requested freq.
> >
> > Suggested-by: Stephen Boyd <sboyd@kernel.org>
> > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > ---
>
> Applied to clk-next and fixed the space thing. I guess ceil/floor
> rounding isn't a problem?
>

Thanks for fixing the nit.

Hmm.  Looking back at it, floor is only used with the rcg_floor_ops.
Right now, you can't use a constant ratio table with rcg_floor_ops -
looks like you'd probably hit a null pointer dereference.  I'm having
trouble seeing how the floor operation would work with this constant
ratio idea in a way that would be different than the normal rcg_ops.
I think I would say that either you have a good reason for using the
constant ratio table, in which case you should be using the normal
rcg_ops, or you have a good reason for using floor which is then
incompatible with a constant ratio table.  If you think that the
constant ratio table concept should be applied to floor ops, can you
please detail what you expect the behavior to be?
