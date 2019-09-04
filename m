Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBF0EA892A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2019 21:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731115AbfIDPDn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Sep 2019 11:03:43 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:42338 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731084AbfIDPDn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Sep 2019 11:03:43 -0400
Received: by mail-qk1-f194.google.com with SMTP id f13so19827246qkm.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2019 08:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IKOWkzJjL/k86AmuYOdEShvopeXlL7D6ZxFMOP1g5n8=;
        b=SQiCboYCFVR7E2jvkAlI9TmDAMYz9qaRIui6u8+HX9MBJ7wfBzoZo7zwkLCwCol08r
         oUjEmh3dXdYmXsYgESe8Aufcu3XcAu5xjdNgKyLs5t4EzyrEyCW0FWzde4O3kqAhaZqR
         zC2Pw0LOdQ8qCySYn8wUfOLtMGKroJcKBWrSYt3+gtHAstwbc1Kw0mnxxRHpnR+uVNt3
         V5gztZB2af+bqEA4ZRkDx3XpyQW+3yV+253qvivOlBQS/Hfu5B1Ehvp2NMv15Pdalv/q
         oCKT5SH3l1OhrLI98xad6ctktz9eTCGtB/Z1ZyCwEC0xHpA6l1J6tRT9Hgdt34ltk7Ut
         h+CA==
X-Gm-Message-State: APjAAAUPy48/BpT7pda0/MIpDLj58L2lbkO5dc+canPLh3KVj+7uiBFD
        25ZxOZ4VeQd9HM1dz5t6/I6Eiyvuhdmeg7nkEs8=
X-Google-Smtp-Source: APXvYqwLGvjugccaEkF7cDG+RyQGuAaeSlbMdwjyxib0np06BZnq4h1o1oo2e8UJhoLsybrAmvsFNm9JUFRsAvTrQno=
X-Received: by 2002:a05:620a:b:: with SMTP id j11mr40455574qki.352.1567609422080;
 Wed, 04 Sep 2019 08:03:42 -0700 (PDT)
MIME-Version: 1.0
References: <1567317285-8555-1-git-send-email-agross@kernel.org> <1567317285-8555-2-git-send-email-agross@kernel.org>
In-Reply-To: <1567317285-8555-2-git-send-email-agross@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 4 Sep 2019 17:03:26 +0200
Message-ID: <CAK8P3a08r4CzYmYJXD-zs+J-y=Dm37pXDAz-9B80DAgyHiW-Ng@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 DT updates for 5.4
To:     Andy Gross <agross@kernel.org>
Cc:     arm-soc <arm@kernel.org>, linux-arm-msm@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Sep 1, 2019 at 7:54 AM Andy Gross <agross@kernel.org> wrote:
> ----------------------------------------------------------------
> Qualcomm ARM64 Updates for v5.4
>
> * Add Lenovo Miix 630, HP Envy x2, and Asus Novago TP370QL support
> * Assorted cleanups for SDM845 nodes
> * Add video nodes, cpu coefficients, adsp, csdp, and
>   fastrpc nodes for SDM845
> * Add coresight for MSM8996, SDM845, and MSM8998
> * Misc cleanups on QCS404 and PMS405
> * Update memory map for QCS404
> * Add wifi rails, update WCSS clocks, and add ADS unit names on QCS404
> * Add Longcheer and Samsung Galaxy A3U/A5U support
> * Add initial support for SM8150 and PM8150
>

Pulled into arm/dt, thanks!

      Arnd
