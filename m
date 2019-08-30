Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABFB4A3FAA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2019 23:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728194AbfH3Veg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Aug 2019 17:34:36 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:39852 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728079AbfH3Veg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Aug 2019 17:34:36 -0400
Received: by mail-io1-f66.google.com with SMTP id d25so14465568iob.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2019 14:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bRs4USZKqbM7XBEpqSlf+cAqUnmhWlYsbxb13NQJujQ=;
        b=I0AEN2xKpIGmcgkXKtx6SFCfbwffnshtQwlmZGZTHXEMrRwTHSroUZNeZHwZKpDjkB
         RP8EJtFJshofOn/0QZyr5+B4W28EsQhTiGx2lJUl1RgCA5q/sFUq1rS8nPS6HqNAofa1
         Nj6xnyfPyXccIvJZ96T74h/vhqDdxOJlw5cEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bRs4USZKqbM7XBEpqSlf+cAqUnmhWlYsbxb13NQJujQ=;
        b=Gz5Q77ZdHTlVerIacHlK/D+dg50UCO/HNRriJNzZUUTFOsgMD196k/pMNM2ncrl8qB
         tBYLHf1dMy7dfH9RkGhIOjvQLDR9JG+21fVnC8IJ016EvMBF2KWQVk8YEJzQp0I88GKN
         Q+4u4nsHqLOhBatH3OoCZSUrBSf7hEjday+i3h38b8Qx3oRqK27gKoFigntyKCps0l0G
         UGXR44OEpaO65k3MzFpHvynH3IKutWDTFCGu0uu7m5oe25WqMgC6ffxz0+bP/HIrtOEC
         JHE0auANuvoyVi3MvhmeN2CT36TXErXUGkV0VXgK+vO7cRrIEWqUGFOkkNyFhCNT0J0M
         qWqg==
X-Gm-Message-State: APjAAAXxD4l6YVD1KUkucSJSGdoWHwtnIsQLNWKXzM2p6/m+SS67x6ji
        HWVav3T1uC5NNciwAWnCwma9FWb3+40=
X-Google-Smtp-Source: APXvYqz8HFt+ZapsrB2U6Ic0jxKzrVlwsfJJ0H/j9ERKYa/O76U7ct/wgXWn1V6yFr1z+gcuyVCMrQ==
X-Received: by 2002:a6b:f910:: with SMTP id j16mr8469749iog.135.1567200875448;
        Fri, 30 Aug 2019 14:34:35 -0700 (PDT)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com. [209.85.166.44])
        by smtp.gmail.com with ESMTPSA id o3sm7205952ioo.74.2019.08.30.14.34.34
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2019 14:34:34 -0700 (PDT)
Received: by mail-io1-f44.google.com with SMTP id x4so16872170iog.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2019 14:34:34 -0700 (PDT)
X-Received: by 2002:a6b:cac2:: with SMTP id a185mr4014873iog.142.1567200873979;
 Fri, 30 Aug 2019 14:34:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190830195142.103564-1-swboyd@chromium.org>
In-Reply-To: <20190830195142.103564-1-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 30 Aug 2019 14:34:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vr5o-b86588qe--bVZ5YjKVB3gzaoYa6YcqCd9smkxVg@mail.gmail.com>
Message-ID: <CAD=FV=Vr5o-b86588qe--bVZ5YjKVB3gzaoYa6YcqCd9smkxVg@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: gcc-sdm845: Use floor ops for sdcc clks
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Taniya Das <tdas@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Aug 30, 2019 at 12:51 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Some MMC cards fail to enumerate properly when inserted into an MMC slot
> on sdm845 devices. This is because the clk ops for qcom clks round the
> frequency up to the nearest rate instead of down to the nearest rate.
> For example, the MMC driver requests a frequency of 52MHz from
> clk_set_rate() but the qcom implementation for these clks rounds 52MHz
> up to the next supported frequency of 100MHz. The MMC driver could be
> modified to request clk rate ranges but for now we can fix this in the
> clk driver by changing the rounding policy for this clk to be round down
> instead of round up.

Since all the MMC rates are expressed as "maximum" clock rates doing
it like you are doing it now seems sane.


> Fixes: 06391eddb60a ("clk: qcom: Add Global Clock controller (GCC) driver for SDM845")
> Reported-by: Douglas Anderson <dianders@chromium.org>
> Cc: Taniya Das <tdas@codeaurora.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>
> I suppose we need to do this for all the sdc clks in qcom driver?

Seems like a good idea to me.


>  drivers/clk/qcom/gcc-sdm845.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>


-Doug
