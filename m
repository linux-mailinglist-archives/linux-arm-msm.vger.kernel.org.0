Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B0D51FD5F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2020 22:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726833AbgFQUYw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 16:24:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbgFQUYv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 16:24:51 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A9B5C06174E
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 13:24:51 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id n9so1472939plk.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 13:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=Oi8WdEL0xHPWSjEuRn/3DpBy4qY4ecDATBbe5otJXBE=;
        b=J5MKLGjXGUT07r4aFv5ozaZuu3kZvZznC8PH0oHKeVzwG4W7Sa5yT0nuHpVqc/yDGr
         EpYlaHHELjEmVUclc9MW/pBhcdy5ZfMfADf6QXsfUlXnphGBrNvgWoHmfSM/D7wydIJD
         DxHhTS3nbziS/wq5ocHsECn/Sk9PC9wTRmhqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=Oi8WdEL0xHPWSjEuRn/3DpBy4qY4ecDATBbe5otJXBE=;
        b=qASvZhijyx0e1+cbk4ONzv+bfdj/B0apoAQDYCJrYKLnl+1Cz5OI9FjthBAMX7g/K8
         pIPcg68JTalsjgr1cRwEvIYmoim9m+ZF9O0TPAFykUk6D0YRQmQBl2oZ+idjGhI87fqK
         kgbxNBUZiV5kJQ61eyFCZOcgjg0zQNblUPLSwGUVCQT6s2Zt47k4EyxNKg30jpeE0L7d
         n1inmuH7p7tt0xgHmeVFiJ4/E/joyS3usKWHEmYAVNQomm6taYT2NAQzGSCoIAZmvV5X
         +b1SnjbJ2yBdSamdK9GpCACMhmAkKg49ahfh9m8dJoLgFljHRiZpEItpTINYcqtb3/if
         Nfeg==
X-Gm-Message-State: AOAM531p5XS8G8av4srNW6jdz07t7qjbBrRB3f4z2MtZM4MtXauh17B8
        v3+EOozfztnykQXx6cus5NdMKA==
X-Google-Smtp-Source: ABdhPJyZmGniT2GeQsnfQbcp1rjOQ22uxwwhX/RB7fTaW7sfeOWTkRvWtF86/hVCPycnzfrvFiY5Uw==
X-Received: by 2002:a17:90a:fa8f:: with SMTP id cu15mr811773pjb.9.1592425490882;
        Wed, 17 Jun 2020 13:24:50 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id b24sm637675pfo.112.2020.06.17.13.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 13:24:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200616034044.v3.1.Ic50cccdf27d42420a63485082f8b5bf86ed1a2b6@changeid>
References: <20200616104050.84764-1-dianders@chromium.org> <20200616034044.v3.1.Ic50cccdf27d42420a63485082f8b5bf86ed1a2b6@changeid>
Subject: Re: [PATCH v3 1/5] spi: spi-geni-qcom: No need for irqsave variant of spinlock calls
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Alok Chauhan <alokc@codeaurora.org>, skakit@codeaurora.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>,
        Mark Brown <broonie@kernel.org>
Date:   Wed, 17 Jun 2020 13:24:49 -0700
Message-ID: <159242548959.62212.17168767504846192201@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-06-16 03:40:46)
> The driver locks its locks in two places.
>=20
> In the first usage of the lock the function doing the locking already
> has a sleeping call and thus we know we can't be called from interrupt
> context.  That means we can use the "spin_lock_irq" variant of the
> function.
>=20
> In the second usage of the lock the function is the interrupt handler
> and we know interrupt handlers are called with interrupts disabled.
> That means we can use the "spin_lock" variant of the function.
>=20
> This patch is expected to be a no-op and is just a cleanup / slight
> optimization.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
