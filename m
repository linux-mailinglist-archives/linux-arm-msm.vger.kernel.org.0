Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 831FA132405
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2020 11:44:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727878AbgAGKoj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 05:44:39 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:42128 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727787AbgAGKoj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 05:44:39 -0500
Received: by mail-lf1-f68.google.com with SMTP id y19so38499485lfl.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2020 02:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RgFKZhJDfhjP3daFjJ6Yf6/c2a34ejzl3DxxsqYxSK4=;
        b=DllIUpp1Q6kXzivnO5X2buqDRRTX00jpFdjqNjevqokIijabbCuM9jomITXwHgjUof
         /+C195g6oInaXzgI+yid4TLVNxbPEuZlRYhPe+ociG+hHlLhNAYn3DtW88rHCxRkQVHZ
         zcH0zmtcTQlBCzt2YYQnpM0U3occFF39huSzirUhJ0eu/cxxQvobisdH6TZN401xKwp5
         cBHAjYyOoHG9zIC1fRyJCsBEoS8Tc96J2WHE7WUnrQA7BHqXaMk7iC8+5kqAkmReWSCa
         v0peScJcrLidcsLRn1+e6r4ETxrH0OCOvIbWEtZliknbhUC41peP2xZphiLk+3Axrg3b
         HvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RgFKZhJDfhjP3daFjJ6Yf6/c2a34ejzl3DxxsqYxSK4=;
        b=jeFmdVQ0voELa7aHlju4UMwq3pcotRpu6bzz19/87xGsSmVTmVTpezjMYvtIC7VakU
         npStnVfYtfSPMEQK+sW59YZlg2gRaTgUeo+GpEs7G3KccZQgBKTTz3xlPBH2ff5Y1Kso
         0k+L1ULjBWgJiRMP2uOAeV9xXgBVzNogzIAinso3elJOt0QYcxsBUR5yFZ2LVaQbec+j
         BiWDB/ZKiEHoAdNr3dSaRlXhXaQWa2DMrWugyZ6PMBTSvSEI+gU7HOd9WYTVfjpFpvct
         hAcYBeCBXGGG9xUew9JKWtnQD70+WB3mHEx6TSqpIkmzmbhXIpzJynh22YjYwlt+Em8x
         8qag==
X-Gm-Message-State: APjAAAVE+G+ICnCGhS6OZ4uSmi+al1FEa+I9+oKbFxExOJSOrCwyFAv4
        9y/ZgFRSGPWuSRPK2ltIrSTFohpSdCGWe6fjPjFYSQ==
X-Google-Smtp-Source: APXvYqwCT73xBkNQ+g3rH+LQGftKRSrUx+BJ1w6jdMAWsxD0kcF9OCy3oy4cYwg0gSxNlboPKwLt9C01SWBHwRa7UkI=
X-Received: by 2002:ac2:55a8:: with SMTP id y8mr58604010lfg.117.1578393877863;
 Tue, 07 Jan 2020 02:44:37 -0800 (PST)
MIME-Version: 1.0
References: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr> <1577864614-5543-15-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577864614-5543-15-git-send-email-Julia.Lawall@inria.fr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 11:44:27 +0100
Message-ID: <CACRpkdackV3fDDr4SKPc-GVcW3TcCCYvumN4ibfPcvdfnBdHzA@mail.gmail.com>
Subject: Re: [PATCH 14/16] pinctrl: qcom: ssbi-gpio: constify copied structure
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        kernel-janitors@vger.kernel.org, Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 1, 2020 at 9:20 AM Julia Lawall <Julia.Lawall@inria.fr> wrote:

> The pm8xxx_pinctrl_desc structure is only copied into another
> structure, so make it const.
>
> The opportunity for this change was found using Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Patch applied.

Yours,
Linus Walleij
