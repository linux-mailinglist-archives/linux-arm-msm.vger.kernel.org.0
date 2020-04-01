Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22C8119A713
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2020 10:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbgDAIUJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Apr 2020 04:20:09 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42492 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730574AbgDAIUI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Apr 2020 04:20:08 -0400
Received: by mail-pf1-f194.google.com with SMTP id 22so11743547pfa.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2020 01:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QFO0vf8e8DojHzC7YKKnWcjJKYcUUi6BB0Xvkcc0pJc=;
        b=w++wGeiNVTv/fz8h/D2fQ8RKq8fKC+9Jz+vX6b4AcyL8KRKHNVMEpwShLa5F1frzO1
         Bda6A2H/HYR2+N2im+kK3SXARA+hI2/nYP3Rg/qjrlotrlctZaoI88a0rMgsB0NjJO2X
         xRPmXljSIddgZxEaMvWQmrr/1XcL7P3b4dxEQouwsyj+M4J5AtQktI0mOLrBVSgsvfJp
         4zgqOV4AYLL92YnuNemUsgQAuIkOdFf09marZjFENI3vt2o9eDR8YOTFrdBx/YG5oh2h
         k91JvSYSOsM/5h40ZdcVC9RkMvm1/UgZzHQhrj89blEtyUzq19O6zUkoJ4Y0Z8uKd9o0
         0BhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QFO0vf8e8DojHzC7YKKnWcjJKYcUUi6BB0Xvkcc0pJc=;
        b=Fe0bvHFU45bA7jMchNDSOl9+j8FJlaLSWo8pOAl3x3axB5KjzzeYpp3ZLGQ8PX3oG3
         bIkgw3C74NP6Hzt9GMQLW2a39TxqA4yoQpKjcMJVHQ304Sm7o530MxINQSAa/W65CuHP
         J69BR0yrG0ffhfuu9QpTIgTmdrZzYp68oN9HlsKQkGv7I5nm8Cmqgt9KB7TfZEKoQlzL
         Ppqr+eAaCo0aHdJCBsgp7hyO0FGnR4uzXIX6ClOg6EIkLNZQ884XeCi2hYjePvuMX4Yp
         EctEnv9KYzuZCogSFu5/Pj8J5aoHAYX+UqxLSrKJvmizTBH/v6wpm4R0LaS09DGoHmRL
         Kh6g==
X-Gm-Message-State: ANhLgQ1ZpevvAkJBZi+PeqbjYpKqGp3UzVoV6uU6B6muFC1bEp3+ccjH
        dPCfL7B96X5zgZB1F6MV+TzV
X-Google-Smtp-Source: ADFU+vvjnoX9qATo8Ax3smn2g6ng6pV6THrQwh3JlG3wMQgvz0eNY8mwOCDQ51gAvmtCVFlkWsI+zQ==
X-Received: by 2002:aa7:962d:: with SMTP id r13mr23217262pfg.244.1585729206901;
        Wed, 01 Apr 2020 01:20:06 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:648c:592d:1580:e843:709d:f3b5])
        by smtp.gmail.com with ESMTPSA id j21sm908394pgn.30.2020.04.01.01.20.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Apr 2020 01:20:06 -0700 (PDT)
Date:   Wed, 1 Apr 2020 13:50:00 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     gregkh@linuxfoundation.org, davem@davemloft.net,
        smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, clew@codeaurora.org
Subject: Re: [PATCH 2/3] net: qrtr: Add MHI transport layer
Message-ID: <20200401082000.GA15627@Mani-XPS-13-9360>
References: <20200401064435.12676-1-manivannan.sadhasivam@linaro.org>
 <20200401064435.12676-3-manivannan.sadhasivam@linaro.org>
 <20200401071023.GD663905@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200401071023.GD663905@yoga>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 01, 2020 at 12:10:23AM -0700, Bjorn Andersson wrote:
> On Tue 31 Mar 23:44 PDT 2020, Manivannan Sadhasivam wrote:
> > diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
> [..]
> > +static void qcom_mhi_qrtr_ul_callback(struct mhi_device *mhi_dev,
> > +				      struct mhi_result *mhi_res)
> > +{
> > +	struct sk_buff *skb = (struct sk_buff *)mhi_res->buf_addr;
> > +
> > +	consume_skb(skb);
> > +	if (skb->sk)
> > +		sock_put(skb->sk);
> 
> Don't you need to do this in opposite order, to avoid a use after free?
> 

I thought about it but the socket refcounting postulates in net/sock.h states:

"sk_free is called from any context: process, BH, IRQ. When it is called,
socket has no references from outside -> sk_free may release descendant
resources allocated by the socket, but to the time when it is called, socket
is NOT referenced by any hash tables, lists etc."

Here the sock it still referenced by skb, so I don't exactly know if we can
release the socket using sock_put() before consume_skb(). But on the other hand,
once skb is freed then accessing its member is clearly a use after free issue.

Maybe someone can clarify this?

Thanks,
Mani

> Regards,
> Bjorn
