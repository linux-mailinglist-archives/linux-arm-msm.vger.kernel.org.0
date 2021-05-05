Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B705373C96
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 May 2021 15:41:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233444AbhEENmO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 May 2021 09:42:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233286AbhEENmJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 May 2021 09:42:09 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC772C061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 May 2021 06:41:12 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id b15so2024255pfl.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 May 2021 06:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LvAhCgtUw7Hhr1tXS7DhiAKfCYCLt/FOGUyMtLSYxOI=;
        b=aPpqzCJkwTT9710KNxqM20TsKpE/Bz1oEwLIynCse6Kk6EZ4YyElTcbROymZjjaLSO
         stgYkbvWfp8eELXvsookgOyMvrxUbJ8Dubb+WhRP+0ytalCco0+JcTYufEkSVGnru1qU
         dwGmffCJF4AKk7XZFukpAmWv7qWuJ5+LoqRAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LvAhCgtUw7Hhr1tXS7DhiAKfCYCLt/FOGUyMtLSYxOI=;
        b=Omk83fyecljcuIRyCAKxVDgfHH1hBHKxQ5XqMAucHvS3IzugZGAaeDtrOFgYh6E66g
         CmS4FSDSzmrXN0Q5AQt6FajWScocZNQmSnQ0KFOgiQ8NmXPqDQA9q9qzOcbtDsh7kd6Q
         foZIrXVlup/SjPp3PVw36/r0cygc2wCjP2qwZ4EyCBk+nnA9/Yh+Fq9EqXsL7DAH0k1f
         Xhak/5yK+sjdME0aZ2z1fEQm8YacMF3DRtJVuYtQpiCZfs+rLg02jf2xEgzARajT+Psa
         F1KPvwwLrZDLrBpVEgucqwuC93ErxKtPjDZstrX6U/dqfaq4f/6bzfD+5D/la6Lnmyin
         Ej9Q==
X-Gm-Message-State: AOAM530ZDgVtdOOjE92tdEWNlM+C1tDYHXKvqRpdJUdunGG0MeUt9988
        f6YO+JJFhI8l4ABpeTT+riCC3w==
X-Google-Smtp-Source: ABdhPJwlouJAoO/xkva4XHpCRR1HtaP540+oIE3e9nJ1WehVXwq4RYFg+UZVQoVNIEJD3B+fbETctg==
X-Received: by 2002:aa7:8c17:0:b029:27c:e3ae:ee8a with SMTP id c23-20020aa78c170000b029027ce3aeee8amr28932339pfd.41.1620222072443;
        Wed, 05 May 2021 06:41:12 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:8770:f856:b2ff:e5e4])
        by smtp.gmail.com with UTF8SMTPSA id d199sm15761735pfd.187.2021.05.05.06.41.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 May 2021 06:41:12 -0700 (PDT)
Date:   Wed, 5 May 2021 06:41:10 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH V4 2/8] arm64: dts: qcom: sc7280: Add thermal-zones node
Message-ID: <YJKgdjpXEE83gY0/@google.com>
References: <1620197726-23802-1-git-send-email-skakit@codeaurora.org>
 <1620197726-23802-3-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1620197726-23802-3-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 05, 2021 at 12:25:20PM +0530, satya priya wrote:
> Add thermal-zones node for SC7280 SoC.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>

The patch won't be needed after 'arm64: dts: qcom: SC7280: Add thermal zone
support' (https://patchwork.kernel.org/project/linux-arm-msm/patch/1619778592-8112-4-git-send-email-rkambl@codeaurora.org/)
lands, but looks good for now.

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
