Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A80D11905E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2019 20:11:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727680AbfLJTLr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Dec 2019 14:11:47 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34023 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727653AbfLJTLr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Dec 2019 14:11:47 -0500
Received: by mail-pf1-f195.google.com with SMTP id n13so313578pff.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2019 11:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wqyrsFbKvAgp1XOGnCH1wihydXPeMNhbMwSDb6gzLcg=;
        b=X2LURZ9NmX6JBqBK3oxesIlMMR02B+nouIyC4ZFJa8JQnpsZPNoDo7vG7uH78lI//0
         EHGMq5EtoA1LEtSTATvh53dflMWpvv4dxei5fiGtwxdumT6QTNN0f15rtqWFX+xqE8zT
         A94HXIB24npveHSn1Zh2MhQjUTjPQE1liCZAUP5F8Wcslb82YS9rLKhWGR9ms5pHmD3U
         5NbkIz7oKAvoN8FEUN7wNn+JO3ZMCTp23A2EZUOpWt/a6Wxmyr+b4/PrAzKmpZNpheSK
         e4UppKMOciQExedz02GtK+SmHVx8n1sKczl7Fws73NsMhE8t2lsvADK/n7JCEsnbISCD
         TVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wqyrsFbKvAgp1XOGnCH1wihydXPeMNhbMwSDb6gzLcg=;
        b=sjCJ/vv2uRlv9+3a6rDvyPq4qMOa2jjmmB0DuYVghNBamp+g+aWU65NGRBVDkDmZTk
         K0Nxt+qcnCliQs9z8NjnkB7POtWQAhLCRmbbl4uFFl6rKzd/kukikPIW+8S9qlABfQKi
         bnl0fwLiwzq31YBfItvBopJltJ7pJ2wgoCPhW7mvBfEn9Al/6DK4SlYmgfnevJSJgk65
         qlhS4SgEVOh0Kbxd5Xadx6w2D1RYhFzQ/IuRej8Ul7DKPRD0KLM6Wq2huEdC/LoQ+NDC
         7Ni+u/ejD6PycdWByKNldfJGddwIemgThiV93Tl9NFaV1CQv6/sQ4xlqwC+g/Tk6640Z
         jcSQ==
X-Gm-Message-State: APjAAAUrfx7ipjcZ4p4ndOCKqtu1S332/XqyVkw+b9JxeYzDYUsMRxrO
        m+JSR6Gx7yKrnYqQtUytvQJIAQ==
X-Google-Smtp-Source: APXvYqyrDn4v27jGvSfMZp0Xc8hNq7oBuPploYRqtNc5nHYG0C8cSi5ilO4ThU7xeu5otzhHy6atng==
X-Received: by 2002:a63:496:: with SMTP id 144mr27081792pge.207.1576005106666;
        Tue, 10 Dec 2019 11:11:46 -0800 (PST)
Received: from yoga ([2607:fb90:8497:e902:4ce0:3dff:fe1c:88ba])
        by smtp.gmail.com with ESMTPSA id e10sm4574017pfm.3.2019.12.10.11.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 11:11:46 -0800 (PST)
Date:   Tue, 10 Dec 2019 11:11:42 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Evan Green <evgreen@chromium.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 2/5] phy: qcom-qmp: Increase PHY ready timeout
Message-ID: <20191210191142.GF314059@yoga>
References: <20191107000917.1092409-1-bjorn.andersson@linaro.org>
 <20191107000917.1092409-3-bjorn.andersson@linaro.org>
 <CAE=gft5mLSqsJzj=DtesH3G68_wSKUr8rZ5iubOerimQmZKegA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE=gft5mLSqsJzj=DtesH3G68_wSKUr8rZ5iubOerimQmZKegA@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 10 Dec 10:47 PST 2019, Evan Green wrote:

> On Wed, Nov 6, 2019 at 4:09 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > It's typical for the QHP PHY to take slightly above 1ms to initialize,
> > so increase the timeout of the PHY ready check to 10ms - as already done
> > in the downstream PCIe driver.
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Tested-by: Evan Green <evgreen@chromium.org>
> 

Thanks.

> Should this have a Fixes tag for 14ced7e3a1ae9 ("phy: qcom-qmp:
> Correct ready status, again")?

For UFS it would be 885bd765963b ("phy: qcom-qmp: Correct READY_STATUS
poll break condition"), but I think that before the two we would exit
the poll immediately, so we would only hit the timeout in the "error"
case - where the PHY did come up in a timely fashion.

So I don't think there is a particular commit to "Fixes:"...


But given that this is no longer only needed for the (new) QHP PCIe
instance it would be reasonable to Cc: stable, to get it into v5.4

Regards,
Bjorn
