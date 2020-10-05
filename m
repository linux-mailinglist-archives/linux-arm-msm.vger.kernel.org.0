Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4865F28394C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Oct 2020 17:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbgJEPP0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 11:15:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgJEPP0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 11:15:26 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17432C0613CE;
        Mon,  5 Oct 2020 08:15:26 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id md26so12497633ejb.10;
        Mon, 05 Oct 2020 08:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y31mklWIaVyvGZ7mJma/uuUN73dmoDf6at6W+72Rl5c=;
        b=gt285/Y2YUgHn/6SKGxtJhCeDDVzMc96zhMIWuItRd2xLFz3MdnXJLrgUQNJioTlrZ
         8lHhur0W15e2huFOD4WA20Gz9lLI6fkql42Ao7dnyQR7hXuJjR0Pix1JpGSFKfSrFjrA
         b3t0RcmzXw1X+Es/K2m03C1n1ZuTYfkyHlgcF6a1rjtDpSX52lr3dnPpZIN8vC+t6CaW
         5gVe2KVhrplmx1PgziFpwOdGDqa1XqNYxPM3AIA7Cqy1YgTRTZU5TiNFxl47TImoE9W+
         4mOM+IO+Fv239tMbXmr5np4I6LxiB8zvD68krpqlfLYDlPXV9FtEAi3vQt8v9T2xlQoK
         9srg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y31mklWIaVyvGZ7mJma/uuUN73dmoDf6at6W+72Rl5c=;
        b=E58xKG2+WoIruOxqIoDKXKWf1/mUqP5jf0WsuoZBffNYePEFA47H+CnGhnMov7zzvd
         DocwTIvluDvdrzrA6WzeDYOpO+wRSgl6tXGYBVAVzZL28il3ll+3+i/p+dttyOJJZZzy
         Qbn2Fx6DrCz9G0qt0qPah+DoFZ4VKii7QatZqQ6KkC0vXg5iYZ8rzHizItQKZPcE7O3g
         145hnB3xFeaRzN949AwN/cCmTJ6CysrUjZRcBsuz6goDH6YnP0t1pzK8WDCI3JmEdnRN
         qSJxOK/GBhgUO6OK/wHcWy3MLy15mdRCXVDbmwZ0KNOTn0mbtJf1FAAWwCTbL1MJ/Kot
         noMQ==
X-Gm-Message-State: AOAM530C3q0zoVfN/ETuWq7VKPstm2PM74SZRP3lTBmdugnDpF75zfPj
        lEv0PgZ6qYWB5JIfbAiCqEK8p7/MFR/JXDX19U4=
X-Google-Smtp-Source: ABdhPJxRqwRzTW/rmKk8KAbLE3gpmwftE1hSwgrBJbfMOhD1HiurKmAFgrW/QbXevze1GFXMk+/CzgM21GkPjOXAcNQ=
X-Received: by 2002:a17:906:340b:: with SMTP id c11mr171122ejb.213.1601910924796;
 Mon, 05 Oct 2020 08:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <20201005150313.149754-1-konradybcio@gmail.com> <20201005150313.149754-12-konradybcio@gmail.com>
In-Reply-To: <20201005150313.149754-12-konradybcio@gmail.com>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Mon, 5 Oct 2020 17:14:49 +0200
Message-ID: <CAMS8qEV3kFgCZ34GsOSoy19YceF9q=01JazQHknvxnVJg4thcA@mail.gmail.com>
Subject: Re: [PATCH 11/11] arm64: dts: qcom: Add support for Microsoft Lumia
 950 XL (Cityman)
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

>+dtb-$(CONFIG_ARCH_QCOM)        += msm8994-msft-lumia-cityman.dts

I made a typo and instead of .dtb I wrote .dts here. Could that be
fixed when applying so that I don't have to spam you guys with 11 more
mails?

Konrad
