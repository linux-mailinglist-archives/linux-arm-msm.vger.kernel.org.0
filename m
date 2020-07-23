Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D11C722A3DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jul 2020 02:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733191AbgGWAuP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jul 2020 20:50:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729198AbgGWAuO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jul 2020 20:50:14 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90C9AC0619E1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2020 17:50:14 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id a9so2350752pjd.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2020 17:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=HG//V0jnPPlj7+MYbGuNkoBzUuYm2lkGRsIq97U2p74=;
        b=ENBc2wu8aR1Ncax35ZSLkDD+KEEurT8XKC1aZXwjVoPxdMwIhP1+IFiJiEfLvxIxh4
         os3IOb+DDzaEkvZS7tUxrVS+da3Dlu6pnLwn9kj5Hz7zTfzez0ohbn61yGUrdAGw0lfM
         1iSAKRLnZesABoXXfilxsD9Wqwv3ywAya4maI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=HG//V0jnPPlj7+MYbGuNkoBzUuYm2lkGRsIq97U2p74=;
        b=N20M+bcdauY/CgN4cS/5lK7ewDJez9oKXZD0q22HoE8J0XDnaLLXIJ8G1dbfGKA3o7
         OjbfOb/iZo1A/Rj6qc9cChuSNgxpdJAq3HphCoMjXVCAqI2ClFE07nAzAySXcaH9zbJy
         3BtojPINIBlknWtoXaNNOstX7Q04bD3i8XsMebKLbNY22NPYY0aSyuOh8QCwoWBFtOQf
         SdzjAfAgCbdlxaIYn6NaFU73zz1f8GIYiHZvZ6iBsK3k4wZNbDssNLkJwruufqVRHGE9
         hWqwG5ZzuTlAPPFLriMTcznP+QlH4+QaoD3hPHvT5PW7dbxuXAvDdvRFgfA8mENeWFPZ
         qLNA==
X-Gm-Message-State: AOAM530meIS7FSAb+joZENZhNl/qORSBcVVxXSf9vBK12nY8dcr+wT2g
        YtmtcCIGBrChneo37fBjj0V0cw==
X-Google-Smtp-Source: ABdhPJzDOkaHciY55gLr+8CcVLK45e+GgvHOjFwt0BDDgEfhLqfiKMJysI7lFDy40eNWTy8rfmj8Gw==
X-Received: by 2002:a17:90b:2285:: with SMTP id kx5mr1935045pjb.83.1595465413915;
        Wed, 22 Jul 2020 17:50:13 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id d190sm742004pfd.199.2020.07.22.17.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 17:50:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200722145948.v2.1.I7efdf6efaa6edadbb690196cd4fbe3392a582c89@changeid>
References: <20200722145948.v2.1.I7efdf6efaa6edadbb690196cd4fbe3392a582c89@changeid>
Subject: Re: [PATCH v2] i2c: i2c-qcom-geni: Fix DMA transfer race
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     msavaliy@codeaurora.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        Sagar Dharia <sdharia@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>,
        Wolfram Sang <wsa@the-dreams.de>
Date:   Wed, 22 Jul 2020 17:50:11 -0700
Message-ID: <159546541191.3847286.3212989047313785097@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-07-22 15:00:21)
> When I have KASAN enabled on my kernel and I start stressing the
> touchscreen my system tends to hang.  The touchscreen is one of the
> only things that does a lot of big i2c transfers and ends up hitting
> the DMA paths in the geni i2c driver.  It appears that KASAN adds
> enough delay in my system to tickle a race condition in the DMA setup
> code.
>=20
> When the system hangs, I found that it was running the geni_i2c_irq()
> over and over again.  It had these:
>=20
> m_stat   =3D 0x04000080
> rx_st    =3D 0x30000011
> dm_tx_st =3D 0x00000000
> dm_rx_st =3D 0x00000000
> dma      =3D 0x00000001
>=20
> Notably we're in DMA mode but are getting M_RX_IRQ_EN and
> M_RX_FIFO_WATERMARK_EN over and over again.
>=20
> Putting some traces in geni_i2c_rx_one_msg() showed that when we
> failed we were getting to the start of geni_i2c_rx_one_msg() but were
> never executing geni_se_rx_dma_prep().
>=20
> I believe that the problem here is that we are starting the geni
> command before we run geni_se_rx_dma_prep().  If a transfer makes it
> far enough before we do that then we get into the state I have
> observed.  Let's change the order, which seems to work fine.
>=20
> Although problems were seen on the RX path, code inspection suggests
> that the TX should be changed too.  Change it as well.
>=20
> Fixes: 37692de5d523 ("i2c: i2c-qcom-geni: Add bus driver for the Qualcomm=
 GENI I2C controller")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Reviewed-by: Akash Asthana <akashast@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
