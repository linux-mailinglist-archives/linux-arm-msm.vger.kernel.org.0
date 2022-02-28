Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D81E4C6FD1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Feb 2022 15:45:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237299AbiB1Opn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 09:45:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236109AbiB1Opm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 09:45:42 -0500
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE5FE7F6C8
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 06:45:03 -0800 (PST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-2d62593ad9bso110523707b3.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 06:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=reLVmSh5lOhGi2mbPVey2FfDVX0+MnxQUf4LZiPlDZw=;
        b=DPfK1TTwYF6uHHwwSfmXcryf/nSVS5b27ECrRqs29t5WbWJ65rQ+z2vZH1Ed44qCFp
         wYqyNEqCS+pGCv1Rs0KFNOQUBq4Y2ERHfmqZXuB0A1RpSUWQhZVUru6gorkVeX3ObLTm
         sBojHUw04sb7V++VFLDMmk6dRmHWre8AJWx6sUB9zH+Y5AKCNNU81lI0DUUAOxs4QuP2
         ChcOagkW4tLEJXanKFIbgLklt11pO9xBAwWEhjnQmEpMHXCQfPPrOPA6Q0Tyh+cHsf9S
         kH9vifC21dZ07mDF34OuWn0dPzxeGNLOnWiQOFVj7TGzsF7x9p7iPmlirJk6XhYPx1aO
         CrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=reLVmSh5lOhGi2mbPVey2FfDVX0+MnxQUf4LZiPlDZw=;
        b=6LsznfwyJwJzSYq+CDV6eW3p4S7SzBV1IQ7NqfdFlYpZVop70cpS6k4/T+xhWidohP
         s4wzVTgkuVoS17cSFK3cDQbdt0YPLiwCiJMy73mqmJmc2g5deX+9cdwtAPfwOBW+c5m7
         2B58wgg3m90e2I/FcEvwFtezciwKz5Pan8QCfHah9l9xHoM6NOYOxB9KxySJKR+cv6le
         QjqHfMpmmse8+YSsI77OAqmuwlFo5sAa1uF6NxykJgpSWy/FkA2CdHypKXKxca7W69hj
         hVKDesQpsUIvrmY7UxQDcyuOaN/AIyjJm43pIQP6wF17v5u7CwsvOeeCjHWzm1b2+H3e
         SXpQ==
X-Gm-Message-State: AOAM533OTy9S2O8feF1yPPT/lZEFg4dINRO2JDtPcC6buez7ylaNsF8+
        x6KQO90iiuPsYy4NWHK8tl8FQCQW2BaLcf+hnYj+fA==
X-Google-Smtp-Source: ABdhPJzk+HwwSp65mD5OgCaXjqBH8vv2ef5J850GCCaT/WYOs63X1G9+89dTEinPhAuDL+tSPCnOZOIrEQkR9z6CVa8=
X-Received: by 2002:a81:d15:0:b0:2db:d348:2fda with SMTP id
 21-20020a810d15000000b002dbd3482fdamr25837ywn.151.1646059502977; Mon, 28 Feb
 2022 06:45:02 -0800 (PST)
MIME-Version: 1.0
References: <20220225204138.935022-1-luca@z3ntu.xyz> <4690803.GXAFRqVoOG@g550jk>
In-Reply-To: <4690803.GXAFRqVoOG@g550jk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 28 Feb 2022 15:44:51 +0100
Message-ID: <CACRpkdYte4ydRzSvn-t9xxbM_k0baVr0PDd=J0Emmersk_mJGw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: bluetooth: broadcom: add BCM43430A0 & BCM43430A1
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        marcel@holtmann.org, "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Feb 25, 2022 at 9:47 PM Luca Weiss <luca@z3ntu.xyz> wrote:
>
> On Freitag, 25. Februar 2022 21:41:37 CET Luca Weiss wrote:
> > Document the compatible string for BCM43430A0 bluetooth used in lg-lenok
> > and BCM43430A1 used in asus-sparrow.
> >
> > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
>
> The previous version with just BCM43430A0 the patch collected the following
> tags:
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Rob Herring <robh@kernel.org>
>
> Not sure if with the changes I can keep them.

You can keep mine.

Yours,
Linus Walleij
