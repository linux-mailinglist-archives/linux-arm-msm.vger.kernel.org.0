Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE7BEED693
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2019 01:18:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728601AbfKDASn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Nov 2019 19:18:43 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:35445 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728451AbfKDASn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Nov 2019 19:18:43 -0500
Received: by mail-ua1-f65.google.com with SMTP id n41so4440319uae.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Nov 2019 16:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+5L2eq9DWTqYID3ithkG+AoL6nhEs7tI6RGB4Dd8Zf4=;
        b=oAlES9Uid7iSYZ2y6NPfHWjyad0j5hCqs5prmtdgJ2mK997WAVlxzJG3ynZVmC7nVi
         mB54L2mfLf/Ymo2mr37VdY7P/VmPPDIkSj6dVPXoVoUbv4/bi0abmhjwnmb/FELUCiFe
         WUmE0cxKBRBV/GLK0T6OlpT++peIpQTvzfheDW+VYHwnVh2WMPfAGGv0Jll4lQ9KmdAX
         KUTaR0YLzT9+mGViBviY1QVrl63MXjbWJ1L7dXjYhxykfLjDCnezbRw37cjm6t8NlKrx
         vUEPiPlqJXQVEvz5N1BTYEZa2S6mllw04JXsrNQAwnirXTN3hH91Hd5eJcmUXVJGR71Z
         pSrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+5L2eq9DWTqYID3ithkG+AoL6nhEs7tI6RGB4Dd8Zf4=;
        b=gQ/BEq9OAlZ6ktxvnfaOULCr9HbTe+Q+YIotfYa2BW5+QVbJfh77PoKvhmsYScF5vf
         iMjDQyG33U3dH2q/J7PkLHa3yOmpWMs1a3t1ps8qqa+Yiif1BDzbeZtNOEFVYPkCXvlN
         tdVFqOXoFhd9GF1CAA4jcm4TgUGOxhuILsRAdsH2lhUzHo6iX8GMsKaZwIZOR2FvnpHR
         KN3r8qxeiIUDOzSJuFrubHdj+NKv/3++jrXeNiuYEjCOBUIhq72N2RYzXI2xNN1pKmc3
         lAeWOtqTBbKO2Qp3/7+LYnKXUCg9r47O977j8MFW/vmJJKIx1B3ik1Z0NMEh4WfbYcWF
         qwBA==
X-Gm-Message-State: APjAAAV0pTe0wjaU60nAxIsNnebPyFC8K78/rdhnn/POnb1HFCVnIY1i
        f+/ha0AX+54qDU/vS1BSogF5AIXCX+TObJgwWUyEcw==
X-Google-Smtp-Source: APXvYqxaDMOhPupmDshbsu4K1ddLDJNFp+Loev7XOmTsYtFTpgq7W/3FH8VrI3bEONc6DjxIfdtklet+o4Mib1wkwhc=
X-Received: by 2002:ab0:70a9:: with SMTP id q9mr4518172ual.84.1572826722501;
 Sun, 03 Nov 2019 16:18:42 -0800 (PST)
MIME-Version: 1.0
References: <20191017122640.22976-1-yuehaibing@huawei.com> <20191017122640.22976-2-yuehaibing@huawei.com>
In-Reply-To: <20191017122640.22976-2-yuehaibing@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Nov 2019 01:18:31 +0100
Message-ID: <CACRpkdb8D_zxHfzY=+ramnNjXVsN9MMO8Q-3=iZFLS2A_ZDQuw@mail.gmail.com>
Subject: Re: [PATCH -next 01/30] pinctrl: pxa25x: use devm_platform_ioremap_resource()
 to simplify code
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Jesper Nilsson <jesper.nilsson@axis.com>,
        Lars Persson <lars.persson@axis.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Baruch Siach <baruch@tkos.co.il>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@axis.com, linux-oxnas@groups.io,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>, linux-tegra@vger.kernel.org,
        Vladimir Zapolskiy <vz@mleia.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 17, 2019 at 2:48 PM YueHaibing <yuehaibing@huawei.com> wrote:

> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

These are too many patches changing too little.
One patch should be one technical step.

I'd say squash them all into one big patch and resend.

You can collect the ACKs you received, but don't put
too many people on CC, they will be annoyed.

Yours,
Linus Walleij
